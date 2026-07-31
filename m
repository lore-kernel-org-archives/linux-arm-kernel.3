Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CED8C5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 12:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWKdz3JjvBdWuvOM6XAtmb0QINEsI1qn45G5e91+shs=; b=lNd+V5lBFgytswWophxhl6ckxs
	l9j30FgYH6EV8vLhU7iNDuYg+t/VZDCha+3xDf7SCDDtmZU0+8hEWO5n/M+/2yOHG8SuXU/UxB3Wj
	ZlLR3fa5vnCPjw+bltx8CIkxYwtixIJI3KVWEa2vaJYFDYC2h+1mGFkV2oJXCs+Xak9WJtqh/t8jt
	qyBWPEGCXYq/JHNXBS3LJwti95I3zDE+33QSzQQnZjYG+Nzd8UUzo5Fkyl9fPMEuqaN/Ib6zZyWeN
	fMrdl7uc51L+uj0MXJLOq2qppBBA6h6Bw1kjoFuH3pRuOEnwyMoqfSkklC/BD4nsgvAoxjzV3B4GW
	6lIRmWYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmUg-0000000CUZA-1NhH;
	Fri, 31 Jul 2026 12:37:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmUY-0000000CUX8-3iPV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 12:37:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5723A600AD;
	Fri, 31 Jul 2026 12:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D4CB1F000E9;
	Fri, 31 Jul 2026 12:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785501454;
	bh=MWKdz3JjvBdWuvOM6XAtmb0QINEsI1qn45G5e91+shs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cvBFESrR3CxGZ5Kh/nyxaisfo4jRQYOdA/20/1uEg87uBXNVkMYl/rYaUXQI5ECM0
	 B532Pf8reI7UHl84wG2LfgA7pfHtWHanPxsbIcVbEAsrEsf++gWDfmU40CahrRM3wH
	 KUws2WPo+oKWuywDcomLveF4YTKWVJQdMgL5LFRdEy/Z/fYKlayZoRThecm23rMEF6
	 NtndSMMw+bhunG1Qkj0FgX7wlpJKIANEBGWiAMJ597nxQqFmnsKczcEFSt+jX1fK+g
	 Zvlb9ZIXLvnmgFwvx6q85SsK4h4e7Fzuv0z1nINKdMm4MkCo1rthbpgGD5fYr6uHDt
	 xBbqCtghHK5Ag==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 31 Jul 2026 13:25:39 +0100
Subject: [PATCH v17 01/14] arm64/gcs: Ensure FGTs for EL1 GCS instructions
 are disabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-arm64-gcs-v17-1-5e39ca01b14e@kernel.org>
References: <20260731-arm64-gcs-v17-0-5e39ca01b14e@kernel.org>
In-Reply-To: <20260731-arm64-gcs-v17-0-5e39ca01b14e@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>, 
 Oliver Upton <oupton@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=906; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DZmwxJP+W8fGWvn/wOKVMifNip3avlrIAIcelKvVs+o=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqbJb8k/ukZxuQUhgXKjtP01NML2pUPOlCvoh0f
 s999fxmh+CJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamyW/AAKCRAk1otyXVSH
 0HuOB/9c6Gqp+d+HfjQFdWj85CzYmskkQFl4+SlKZ56UE4JBhcE6ZpJZVtY62TkhCLITGP0Bb4B
 zFex3fzrOQhrp9lYXACagYESr+Pnvc/n2RCNtRSy0Fo0o8vSvMkTLbf3iWvOI9aUYhylBJf4HE2
 ZOgSltv517kPrNH7DHTHiqIdQPSr37+6vGQiPzF8oJTjAXhY9OTuz0J5ydLBpzpczNHVLvaxGE3
 K0o51os+0ddpmO9+iLCAnTF5WgnHIjdEf6ZMqFhPrxkSJPC14I0cYd3KPH4wxBWKtcKcZrDnRR+
 r34hxZVFjl0YpzhwQE0XCk0mNMf/9c8GJdTnas5kTC0cMgj5
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

The initial EL2 setup for GCS did not include disabling of EL1 usage of
GCS instructions, also disable these traps.

Fixes: ff5181d8a2a8 ("arm64/gcs: Provide basic EL2 setup to allow GCS usage at EL0 and EL1")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/el2_setup.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index aa8ec9df8024..d308c6e6757d 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -393,6 +393,11 @@
 	orr	x0, x0, #HFGRTR_EL2_nGCS_EL1_MASK
 	orr	x0, x0, #HFGRTR_EL2_nGCS_EL0_MASK
 
+	/* Disable traps of GCS instructions at EL1 */
+	orr	x2, x2, #HFGITR_EL2_nGCSEPP_MASK
+	orr	x2, x2, #HFGITR_EL2_nGCSSTR_EL1_MASK
+	orr	x2, x2, #HFGITR_EL2_nGCSPUSHM_EL1_MASK
+
 .Lskip_gce_fgt_\@:
 
 .Lset_fgt_\@:

-- 
2.47.3


