Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69563C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bb3Jl9cPY3Xi16gZI1tiK6Jx4RcZZ9kt7sC5ufmjVKU=; b=gRn1UoyYYhqYV4dPhfAfBNIFv8
	Rxw+pXCapvGblN9bvM/GQEIfJu/gdpozai+4TC6ll7KvBgP3Mdi5iF7ONWaq/RNbjE7P3raqBN8Ew
	pX7bZVPdMQQ+FnBZcLAAEtwGtG+ADmJUynRcbdRGFtn/jugNoJF6vjPtpx6/RbVzj6DkEpYdRyvK1
	oWGxPiLaXJ5yzwKrAhpCj5bIuzLMeLlJrZ6Qv+AzNFnTVaDfwcE9MdKruH17xfMQR92l7MppbjBXT
	7Y99zJbxdx70wHvnSCOvQhPkQml12QjaiYNzDb0orCXcFmKCFLP2nMYtkAKOShMWWAmiXl3WmvDRX
	aZ67bl2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e7i-0000000BM27-1ypD;
	Wed, 23 Apr 2025 17:43:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7bw6-0000000AxCW-2Qyc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 15:22:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 148B1615EB;
	Wed, 23 Apr 2025 15:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64C09C4CEE2;
	Wed, 23 Apr 2025 15:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745421773;
	bh=EWILyffNhy9aVgftGdVYYD7RJoM4rq9jo3kOfc442Xg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BzksKl4nEz/107AeFayEC9HglEnbr+o36GkHLwKEKDlJRu4YrwAfp82BYGKuQO1aZ
	 5xFQ845AQrWhkoEkPcNVaf/yGCKVnTjT6EvedMd3dbla89J1Zi82OT2HDYSKk4hwV5
	 hqj2ehphVx0wwtRWSsSlqjU/WAqtjvFhHpn7eGzg=
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
Subject: [PATCH 6.14 222/241] arm64/sysreg: Add register fields for HDFGRTR2_EL2
Date: Wed, 23 Apr 2025 16:44:46 +0200
Message-ID: <20250423142629.625029010@linuxfoundation.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423142620.525425242@linuxfoundation.org>
References: <20250423142620.525425242@linuxfoundation.org>
User-Agent: quilt/0.68
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

6.14-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Anshuman Khandual <anshuman.khandual@arm.com>

commit 44844551670cff70a8aa5c1cde27ad1e0367e009 upstream.

This adds register fields for HDFGRTR2_EL2 as per the definitions based
on DDI0601 2024-12.

Cc: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Link: https://lore.kernel.org/r/20250203050828.1049370-3-anshuman.khandual@arm.com
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/tools/sysreg |   29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2643,6 +2643,35 @@ Field	0	E0HTRE
 EndSysreg
 
 
+Sysreg HDFGRTR2_EL2	3	4	3	1	0
+Res0	63:25
+Field	24	nPMBMAR_EL1
+Field	23	nMDSTEPOP_EL1
+Field	22	nTRBMPAM_EL1
+Res0	21
+Field	20	nTRCITECR_EL1
+Field	19	nPMSDSFR_EL1
+Field	18	nSPMDEVAFF_EL1
+Field	17	nSPMID
+Field	16	nSPMSCR_EL1
+Field	15	nSPMACCESSR_EL1
+Field	14	nSPMCR_EL0
+Field	13	nSPMOVS
+Field	12	nSPMINTEN
+Field	11	nSPMCNTEN
+Field	10	nSPMSELR_EL0
+Field	9	nSPMEVTYPERn_EL0
+Field	8	nSPMEVCNTRn_EL0
+Field	7	nPMSSCR_EL1
+Field	6	nPMSSDATA
+Field	5	nMDSELR_EL1
+Field	4	nPMUACR_EL1
+Field	3	nPMICFILTR_EL0
+Field	2	nPMICNTR_EL0
+Field	1	nPMIAR_EL1
+Field	0	nPMECR_EL1
+EndSysreg
+
 Sysreg HDFGRTR_EL2	3	4	3	1	4
 Field	63	PMBIDR_EL1
 Field	62	nPMSNEVFR_EL1



