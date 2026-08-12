Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8C4C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 19:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nW2uwG3VWmqTYBYq5oWNcIeaMFqReX/mfTA7yT0Lz8Q=; b=3Is/pBfRK14Wc+yxtatqJpRoEL
	Ld8J2y/4+qz1ArPDPpQAqs/ryNTsFdZx0nHJczSjuRtNT6Xg7JGoZyeHGH82nxjNcIBY+WBKSbqH3
	fJzvI28o0SAZd1y6M2aGIrrNS635l7K0i/UVq6uBm44qKK2C4h4ekK58h8zNQyK4vARPBels6r/Vz
	DqHNBtTtpJE05quJHeVclBYkC6ewiZVyaPdshzHsrI2JGEm2pzQEh8bVnzcf0MvfmGumvG0zsQ2ZS
	rhqeph+kq2r6exeB58RfUYGzgVTTfyssAVAgONo6+8MqPh/4oDU7XCiEgHtgjxBRbsfSScz/TTwy0
	Uu7L/RRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuEOm-0000000Gs0L-03VS;
	Wed, 12 Aug 2026 19:14:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuEOh-0000000Grvw-0bR6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 19:13:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E38E8417E9;
	Wed, 12 Aug 2026 19:13:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E25FA1F00A3A;
	Wed, 12 Aug 2026 19:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786562034;
	bh=nW2uwG3VWmqTYBYq5oWNcIeaMFqReX/mfTA7yT0Lz8Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RIFCpJOBhVLkVhYIvSLfUXtL3E50NL8dj/el3w5svLhnc1/SD/4ptgSN5vg8+DW/T
	 ndFiaV+75vOV/lk/RZeccqaddfhShLNsloLkvNkLGmylxBr5jMPz0wvn2quUh0NR7y
	 tsEZk8F/XZfswwlH6llmzhUfuvA+ketoMZUSCXsN6jsLFE3C1CcMaEEwPvtyDhMiwZ
	 bfIBgQWcuj3lPfcDS+nxbvzZReH6Z2kN+NI9FOroKwrlkYPKZFEJWBKsu19FLPwzWB
	 MP4rr41JUNReeiWazmTSy+tbH4ZzHw8j/NIb411kBZHaQQjmGzI9LtWIU+bSe8uAlI
	 3Hp3GXE/Zv7MA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 12 Aug 2026 20:12:11 +0100
Subject: [PATCH v19 12/14] KVM: selftests: arm64: Only restore SPSR_EL1 and
 ELR_EL1 if they change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-arm64-gcs-v19-12-9105afd828ac@kernel.org>
References: <20260812-arm64-gcs-v19-0-9105afd828ac@kernel.org>
In-Reply-To: <20260812-arm64-gcs-v19-0-9105afd828ac@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>, 
 Oliver Upton <oupton@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1508; i=broonie@kernel.org;
 h=from:subject:message-id; bh=kq5inm4XLV9y3q0emrqMvgSlwP7yu7PrdQSzkYGOWPo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqfMXDA/aFSOvgA7KyYjcur1Q5SmfgxD5zv1T3a
 CMTgQIiCVOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanzFwwAKCRAk1otyXVSH
 0JGXB/9zQSjtUtosQ4n7Fw1tpNONC0sQoYN83VoWRaTi8xYlTpeyfsRt+qVXbCYEl27hQJZCg0X
 C3SVzAkD34GpHTYUf71YbOaWTbxPuuMe6m66DQDQTd2/7PDZDewvv3oovq3TmIoIE0Yo2W6mXU9
 t9RrYA/3oJ0Z1Fj+54/uzcJ7Nsuapr4hFuq/h6yjF8a9WBtRQzaNpExKOt1j8GlRuvLgP9GRxv4
 Nlhq2Pmqhq291ybk0i2CdnRiWH9DcD+XIBrasPd2v+zwB9hr+9WOIAw5Ftgiz0H2jvF5SJxGT7R
 ekyvFIYP7/fuBq3V5Hk1kuxS9MngR6c2vb2t3s3oPRVj8tz8
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

When EXLOCK is enabled for ELx writes to SPSR_ELx and ELR_ELx generate
GCS exceptions. Currently the selftest helpers unconditionally reload the
saved values for these registers regardless of if the handler didn't change
them. This gets in the way of EXLOCK testing, making it hard to generate
contexts which will generate an invalid ERET since we never get as far as
doing an exception return while EXLOCK is enabled.

In order to facilitate testing of nested virtualisation emulation of EXLOCK
change our reloads into read/modify/write cycles, suppressing the writes
when they would not change the value in the register.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/lib/arm64/handlers.S | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/testing/selftests/kvm/lib/arm64/handlers.S b/tools/testing/selftests/kvm/lib/arm64/handlers.S
index 0e443eadfac6..367c22d61cba 100644
--- a/tools/testing/selftests/kvm/lib/arm64/handlers.S
+++ b/tools/testing/selftests/kvm/lib/arm64/handlers.S
@@ -33,8 +33,18 @@
 
 .macro restore_registers
 	ldp	x1, x2, [sp, #16 * 16] /* PC, PSTATE */
+
+	/* Suppress redundant writes to support GCS exception lock testing */
+	mrs	x3, elr_el1
+	cmp	x1, x3
+	beq	.Lskip_elr_\@
 	msr	elr_el1, x1
+.Lskip_elr_\@:
+	mrs	x3, spsr_el1
+	cmp	x2, x3
+	beq	.Lskip_spsr_\@
 	msr	spsr_el1, x2
+.Lskip_spsr_\@:
 
 	/* sp is not restored */
 	ldp	x30, xzr, [sp, #16 * 15] /* x30, SP */

-- 
2.47.3


