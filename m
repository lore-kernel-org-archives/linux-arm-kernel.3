Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3648CC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 11:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=o37GEJbMCiK+/zd5lVzb4C3rovhL67AxKzA9bCSpfc0=; b=V2b793WILRu0Mn7rydIKP3ZU2i
	kxdIfW5hTlFblRRxznUJk73bU03q+S4GA72r0Pbi/GezaNmlR/xuyka5OzG4cVSrG4S/dJz566G7I
	Q3f+fQo6Yj9HBOsX/CdaTSKI0yiAeLHILKsvk1/DspjLfqC6qet+pPCazqcnxV1u9CB67nL4k3y1r
	9QsgolAQKgj0IioAIk5yqikTzP7RpMIVV6FdjeSSlY7eqiuwTmaqXB3tArMdBNt8AxQXFc1JbVtqe
	AZlzvIfV+bo/hjYfMpNFNMzrGPmaV3+BlDgoY0+yYL8qvDyP43hfjwJHxKBrSNAn13TnfnMN2WVmw
	UA+Ok2ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGMZ-0000000BiQN-2LtT;
	Tue, 06 May 2025 11:21:28 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCErM-0000000BRQW-2OPJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:45:11 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250506094503epoutp0311408b5c483bdd780db11a7ed5968d8e~85vbDpLG02045420454epoutp03H
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 May 2025 09:45:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250506094503epoutp0311408b5c483bdd780db11a7ed5968d8e~85vbDpLG02045420454epoutp03H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746524703;
	bh=o37GEJbMCiK+/zd5lVzb4C3rovhL67AxKzA9bCSpfc0=;
	h=From:To:Cc:Subject:Date:References:From;
	b=awRtSKKJNZmUWuq3ImVDR/DDbLSBkANu3wZ1SZJ9nmV7le+NI5MXP9ctvgCnqIpCo
	 SeG0779Lny5Yr/099Ubbpby8BdP8ZEKI/dXsvyjf+cudSgbpYJTdJ7Mw/ZUL+fwuK7
	 5DOe3r3fzaSEtKwmxgqPnEWxyqN1ks4nkjvaWWL4=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250506094502epcas5p296e358ba2c931bd5cea728720f4e323d~85vamUhlB0393203932epcas5p2I;
	Tue,  6 May 2025 09:45:02 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.176]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZsD5S3rDZz3hhT9; Tue,  6 May
	2025 09:45:00 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250506075413epcas5p2ce0db6da9f359e9c3bb16b03c1a5eb4f~84OqOF_Hj0433704337epcas5p2t;
	Tue,  6 May 2025 07:54:13 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250506075413epsmtrp10e2e38e8362a86128042bc0cd71a100e~84OqDrxs-2829128291epsmtrp1x;
	Tue,  6 May 2025 07:54:13 +0000 (GMT)
X-AuditID: b6c32a52-41dfa70000004c16-e8-6819c025a9aa
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	59.03.19478.520C9186; Tue,  6 May 2025 16:54:13 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250506075411epsmtip2856a7bfd5c50c7918eaa2bd424a91bcc~84On6ck161414214142epsmtip2n;
	Tue,  6 May 2025 07:54:10 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	sunyeal.hong@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rosa.pila@samsung.com, dev.tailor@samsung.com, faraz.ata@samsung.com, Pritam
	Manohar Sutar <pritam.sutar@samsung.com>, stable <stable@kernel.org>
Subject: [PATCH v2] clk: samsung: correct clock summary for hsi1 block
Date: Tue,  6 May 2025 13:31:54 +0530
Message-Id: <20250506080154.3995512-1-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOLMWRmVeSWpSXmKPExsWy7bCSvK7qAckMg+fneS0ezNvGZnH9y3NW
	i3s7lrFbXLuxkN3i/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4tm9FWwWX34+YLY4
	/Kad1eLftY0sFp/OX2CzaFq2nslBwOP9jVZ2j02rOtk8Ni+p9+jbsorR4/MmuQDWKC6blNSc
	zLLUIn27BK6M69/b2QrO8Fds/XqLvYGxibeLkZNDQsBE4ubctexdjFwcQgLbGSWetR9khEjI
	SDyatpEVwhaWWPnvOVTRW0aJJecnM3cxcnCwCZhKTNyTABIXEVjDKNG1/xcriMMssJxJ4mHT
	JCaQbmEBN4m7tzewg9gsAqoSx1ovs4HYvAL2EkeXTmOC2CAvsf/gWWaIuKDEyZlPWEBsZqB4
	89bZzBMY+WYhSc1CklrAyLSKUTS1oDg3PTe5wFCvODG3uDQvXS85P3cTIzjstYJ2MC5b/1fv
	ECMTB+MhRgkOZiUR3pZZEhlCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeZVzOlOEBNITS1KzU1ML
	UotgskwcnFINTBPyT3jplCZUZhasSb152jSlbhfPujfdScoCq878VXn3/ryzlfjG+DPzzzAs
	ifebJp/2+c35tlWPX530VzR7sP5a8zHOqEmv9Yw6JUJW7HLfdb97/oI/Jhuuv5rmUDY9pt7S
	l13S7su7L9OXn196Zbn3rELTnp+3jgtOjEnIntL97cbDLvnpjqlBJ7bZsHV9Pb6OR373x5kH
	PVYvOXdik1a5eeuJVvn+n0G8IekhuquYd61cGF+p0SFe15f50Mn/se815WXJ1TduaxmYnuFU
	Wnd2ZoTFgWWee7RbO+PvPdf68PynTs2rYu7JiU+LLFbcbzgXcj7Kc/11gbUqW+873FgbsV3p
	t/FLGb0H1a8jTA2UWIozEg21mIuKEwFKaNGo6gIAAA==
X-CMS-MailID: 20250506075413epcas5p2ce0db6da9f359e9c3bb16b03c1a5eb4f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250506075413epcas5p2ce0db6da9f359e9c3bb16b03c1a5eb4f
References: <CGME20250506075413epcas5p2ce0db6da9f359e9c3bb16b03c1a5eb4f@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_024509_238418_46A6B8C7 
X-CRM114-Status: GOOD (  15.95  )
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

clk_summary shows wrong value for "mout_hsi1_usbdrd_user".
It shows 400Mhz instead of 40Mhz as below.

dout_shared2_div4           1 1 0 400000000 0 0 50000 Y ...
  mout_hsi1_usbdrd_user     0 0 0 400000000 0 0 50000 Y ...
    dout_clkcmu_hsi1_usbdrd 0 0 0 40000000  0 0 50000 Y ...

Correct the clk_tree by adding correct clock parent for
"mout_hsi1_usbdrd_user".

Post this change, clk_summary shows correct value.

dout_shared2_div4           1 1 0 400000000 0 0 50000 Y ...
  mout_clkcmu_hsi1_usbdrd   0 0 0 400000000 0 0 50000 Y ...
    dout_clkcmu_hsi1_usbdrd 0 0 0 40000000  0 0 50000 Y ...
      mout_hsi1_usbdrd_user 0 0 0 40000000  0 0 50000 Y ...

Fixes: 485e13fe2fb6 ("clk: samsung: add top clock support for ExynosAuto v920 SoC")
Cc: stable <stable@kernel.org>
Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
Changes in v2:
- Updated commit message as pointed by Alim Akhtar.
- Link to v1: https://patchwork.kernel.org/project/linux-samsung-soc/patch/20250428115049.2064955-1-pritam.sutar@samsung.com/

 drivers/clk/samsung/clk-exynosautov920.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynosautov920.c b/drivers/clk/samsung/clk-exynosautov920.c
index dc8d4240f6de..b0561faecfeb 100644
--- a/drivers/clk/samsung/clk-exynosautov920.c
+++ b/drivers/clk/samsung/clk-exynosautov920.c
@@ -1393,7 +1393,7 @@ static const unsigned long hsi1_clk_regs[] __initconst = {
 /* List of parent clocks for Muxes in CMU_HSI1 */
 PNAME(mout_hsi1_mmc_card_user_p) = {"oscclk", "dout_clkcmu_hsi1_mmc_card"};
 PNAME(mout_hsi1_noc_user_p) = { "oscclk", "dout_clkcmu_hsi1_noc" };
-PNAME(mout_hsi1_usbdrd_user_p) = { "oscclk", "mout_clkcmu_hsi1_usbdrd" };
+PNAME(mout_hsi1_usbdrd_user_p) = { "oscclk", "dout_clkcmu_hsi1_usbdrd" };
 PNAME(mout_hsi1_usbdrd_p) = { "dout_tcxo_div2", "mout_hsi1_usbdrd_user" };
 
 static const struct samsung_mux_clock hsi1_mux_clks[] __initconst = {
-- 
2.34.1


