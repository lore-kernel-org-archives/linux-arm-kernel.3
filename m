Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5A9CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 21:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3lrCthLI1PC2iGCSfULUwv97R+6R+4yOlZN59Nt/3c=; b=ibxlZjfn9zY7WEMtu32SPdpEHb
	3SPIPS+Fea5wdFaEJy46wk0IP1RtuiWBb/iUS8wd5VH+39KoJ0ZvEs98/t9+1wfn1oXSjJOaah/yD
	nWtZU769ivV3piGqbP53r/p03wBBNG4+pUl8W1WxF4JaJHtWbQ/7ZGgWMGtNM0OnStBo2WlJ9Xw8o
	WeIGerkOUYu+QQi78PgvE0jqFgXtY2i+g03hqzSBct4kLFDt603wACgfVrSQGMFa4I33gEHv5cplu
	NB2/uxqPxUPeMo2HVo6woZM4s8wQiOt10sRZB+Y2y9hGIUr4wT0+PB1NxGCVqDgTWZejdcAQM0AHc
	HY8pGZyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC2Bt-00000007J29-0xcl;
	Wed, 30 Sep 2026 21:50:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC2BL-00000007IiG-00RI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 21:49:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BBC2D42DE5;
	Wed, 30 Sep 2026 21:49:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D21C1F00898;
	Wed, 30 Sep 2026 21:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790804982;
	bh=h3lrCthLI1PC2iGCSfULUwv97R+6R+4yOlZN59Nt/3c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IXmbG6jJCbw7N0HXXWrLm91tO1wVlO/YgTjjksE//WqUgUk85PZeLOx56ZdgkhvZW
	 kN38rytbTvvFhhACOaLkNIy+LnaK+ku7ED0MMt1Vl4wUtvJZR6ZY7Iw5Fj7DpcUKl5
	 arm5DBOgjlgtPn91kOu3eXYeazZNau9NEYvznm75YJ/cgSeEs6GYlTRUFwe/qFp/3a
	 j8km+JMykjbQnC39jJUZcNP8blqFbWwie+/AM07g5n+cfbmsysw88KcdbEUyG+osav
	 cmHY0IMIy+bln5/RCSCXqPMZh5MShXQt8bxen/tZ+3vshUTN5DKgjrID6fGFrdFp5Q
	 2DW5+jKmUpXCw==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 30 Sep 2026 22:48:23 +0100
Subject: [PATCH v21 13/15] KVM: selftests: arm64: Only restore SPSR_EL1 and
 ELR_EL1 if they change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-arm64-gcs-v21-13-3556644cd927@kernel.org>
References: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
In-Reply-To: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
 Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1555; i=broonie@kernel.org;
 h=from:subject:message-id; bh=XOq2i2Akpnkmw/R7Jj1JMRk+55dESJrYh85L+sVQnck=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqvYO9JuUHyRVDEv1xhfnkijFI8FEvAQ0AbR/91
 YqKDLaXw32JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCar2DvQAKCRAk1otyXVSH
 0Bm3B/0eoqlFUjRCKbK69n2bBkysp01U/eJf6B/+ofQ4MTse0MTyJPLrjZH5mp4lYvI6L6f0P+2
 DpDfyXhk+62t5VKZRXG0Swn1jB2wp836Nk1PgaeAiEa8WYrLgiSmM2cNzdamMl/AfrMb3YjeR5G
 0PIo1cSr8MwraP7Yf8IKPX0AbUNFjkNErvOzBReB4mdbiE60MdVR87gHnzz5DCIFrm8N1uYCnXn
 QCO9hlGLYLkqb1cnG2W4bgj+ueD/RceHYVTkFTLWo43S80fbCKYIanRtks8oIPZAFa4U+tL+iG7
 ub9FCQrBG4UR5jMjN/eJQX9kqqM5IEOzeohlQh2nXCoyiP58
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

Reviewed-by: Leonardo Bras <leo.bras@arm.com>
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


