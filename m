Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298EDC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 19:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kyh12vLSEfb1JF7lQC/qy5BquW9r8pj96hLZDvx4BW8=; b=oPxZsFoZNtxooLoiOH9MOmw3wW
	fW8CLlmDIXc6ssow0pIfMlEpXd67ms4M10YttDkYfR+L7BjD6JXQHzSKGA8+ccd9CQc7aUtY9lrdF
	KZ1gHLTJZfHmQ/1QOUoJJfQNH4/xdcTNYpk0KtlIMT4n7puPJ4xxSrYTLk9zkfjxHqHR/wT+MFHoD
	Qe6Q/ONzpaxga7nkn9veMx2NMdaiaBn8Pgu3u1KN8PApW/Df5Fgfxa0v+e0rVJzcySiMWSo2GHNxT
	bKt6QYlvt0rlc+j8hVp+FBTgF7IJKucjXo1z76c3YJE6kEkTbYy6Fqr6XNzdjLVQbF2BGgplWIAcO
	gnFSK33g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuEOl-0000000Grzx-3rPB;
	Wed, 12 Aug 2026 19:13:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuEOd-0000000Grrn-3TI5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 19:13:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9580B43AFC;
	Wed, 12 Aug 2026 19:13:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A501F000E9;
	Wed, 12 Aug 2026 19:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786562031;
	bh=kyh12vLSEfb1JF7lQC/qy5BquW9r8pj96hLZDvx4BW8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=nNGtpPOFlt80OXAyXiDfI1J1rpdzsZt/ZwrncQD14mJYbe4icC1UH9JivHZ6QH0Xt
	 VhoMRbBmDGN/Q4uWr13cOYCvMNooGteorpgtWPTi0sK1kiETgTmaBajEPUJkyFOv6x
	 8zjXrKBa0BxFUe0ioheym43jTQPqrHLcDcBLIeZDWWlgidR8Dz9/Tsv9IUBN0W2t5b
	 2GN3GMxUAUqNdRrHy4hHMR6d3CwH9PhoxmL7N4x+mHtSBzdsyUag/XCFDixtyTWzKL
	 6RJQrIfpYhLPfrkbpgwQZzyyjGOvtrFwMBRPhTQWF16dYkJXqtfH8UPqZqBWjtBUx6
	 XOwF+PMqjIF4A==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 12 Aug 2026 20:12:10 +0100
Subject: [PATCH v19 11/14] KVM: selftests: arm64: Add GCS to set_id_regs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-arm64-gcs-v19-11-9105afd828ac@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=987; i=broonie@kernel.org;
 h=from:subject:message-id; bh=d3SxEv6RjSY+xiyxMK7Zi+tIruIS+RbgPdYjX8k0TSU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqfMXC47UOI9ar0MXkHzkBpHSHaLiKXY5jAO8Cz
 ImAYUA66syJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanzFwgAKCRAk1otyXVSH
 0GOmB/4homdto1G8lhIyqwfXdQ7RUuV7SeRnDdLsTGZzQQnVvPukoFdWwIqEY21RwVtv+39T126
 M3J+5Wa1Nl3K82bsxkxYNMKC+xloL9kkCshypwQx96WvlvZcGoouIsKUHOUdsOnhvwofBlxmV/X
 /TmSqtO1WP2FQxTCGl7twnUSWnSnS8bnhHmHjbvQ/ymNHayvk22yM4cfDgWPWmLhOSlOfRa34Ey
 XT+dCmbm50kio5yBKrAcGzHQcT0mZVQuWw5Hqb7kG9bHrvOCwoveL44yYHoEHVe4leCngsoLhkK
 8BJ7IpLrxiWACXZ9zxWFiZtvxYFh8ESux33EPe5PaCRvKUk+
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

Now that GCS is configurable via the ID registers update set_id_regs to
cover ID_AA64PFR1_EL1.GCS.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 7429a1055df5..34e59fbbbe89 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -154,6 +154,7 @@ static const struct reg_ftr_bits ftr_id_aa64pfr0_el1[] = {
 
 static const struct reg_ftr_bits ftr_id_aa64pfr1_el1[] = {
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR1_EL1, DF2, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR1_EL1, GCS, 0),
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR1_EL1, CSV2_frac, 0),
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR1_EL1, SSBS, ID_AA64PFR1_EL1_SSBS_NI),
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR1_EL1, BT, 0),

-- 
2.47.3


