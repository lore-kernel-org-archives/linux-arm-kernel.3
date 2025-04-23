Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEC1C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LdV8N5xNCMNuVYmRYsGX2JFNWFb5rmF1HOkYycjRTfs=; b=I9KNtoZpImPdjuc3FIQz4aYdOm
	hFMEnJj215uD4Usp1SqoQA/8ccJ/zQd1YNeyXW9k/OTVyUk9AD4Yyh5Oszr3L4/8Q0LbAXQOa2ccl
	alMsxOs91OZTAcPDwT6SFQACdVNq70Dolc45lay5ARLVSDkX3m1LI/K2QrYcuMLFbMOc/q/5sNAaF
	kcOdVStOOEU2IlHRWjeRLFafh60IYlzqQiVN9fmhIDia2HAHi5P/Gw4ADOzs2RnBaFYV6/IFYmLXu
	eR6TsUmwV0KbHLluPF6s6KSl8/wpfbVX9oZt1pO07DTUq3KPiIxWvvthVErRFjjryV4ndzj0ZR6Kh
	6v5VTDjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e6c-0000000BK9c-0Lr7;
	Wed, 23 Apr 2025 17:41:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7bmN-0000000AvQi-37cu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 15:12:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 092935C5D0B;
	Wed, 23 Apr 2025 15:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75AC0C4CEE2;
	Wed, 23 Apr 2025 15:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745421170;
	bh=s451sJB50M6FmZV61fBL8Whsy95Sc2aDN7sbRGLl1Do=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FtEoVysYApVdDDek6TRQWW2AURkvsD8jjRQibN6JsOdHD+tEX3tQzES4WgPWuO7Nb
	 A8uIcxnr57g/b7krgsMFywC3cF3lHkAUP1bfVCmEzs/a6bM+DtJhA/6z2y+6T67no7
	 PrrSofS8dvcaJubcH3RrjMR8FidS9y1Hiqd15orc=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Eric Auger <eric.auger@redhat.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH 6.12 186/223] arm64/sysreg: Update register fields for ID_AA64MMFR0_EL1
Date: Wed, 23 Apr 2025 16:44:18 +0200
Message-ID: <20250423142624.750771111@linuxfoundation.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423142617.120834124@linuxfoundation.org>
References: <20250423142617.120834124@linuxfoundation.org>
User-Agent: quilt/0.68
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_081251_836423_3885FA6F 
X-CRM114-Status: UNSURE (   8.34  )
X-CRM114-Notice: Please train this message.
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

6.12-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Anshuman Khandual <anshuman.khandual@arm.com>

commit cc15f548cc77574bcd68425ae01a796659bd3705 upstream.

This updates ID_AA64MMFR0_EL1 register fields as per the definitions based
on DDI0601 2024-12.

Cc: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Link: https://lore.kernel.org/r/20250203050828.1049370-2-anshuman.khandual@arm.com
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/tools/sysreg |    2 ++
 1 file changed, 2 insertions(+)

--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1556,6 +1556,7 @@ EndEnum
 UnsignedEnum	59:56	FGT
 	0b0000	NI
 	0b0001	IMP
+	0b0010	FGT2
 EndEnum
 Res0	55:48
 UnsignedEnum	47:44	EXS
@@ -1617,6 +1618,7 @@ Enum	3:0	PARANGE
 	0b0100	44
 	0b0101	48
 	0b0110	52
+	0b0111	56
 EndEnum
 EndSysreg
 



