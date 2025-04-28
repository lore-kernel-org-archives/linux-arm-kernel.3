Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6642EC3ABA4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 12:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=Bm4L8Aca1VQNMol9yyzgzkjnyzS8+ggYjgzFjnj6SfA=; b=FwtHgluo9AMBEN/03+ZE6ue3/9
	N10a51PhIpEZWco+/KjsP9hVqMxcwthktBY/sTLatSBmiR0J2fDit/4eSelA1h1F+1cqGwM5lqtPG
	CPlfRbluef4YfeNL8mDwJD8DtQRGVW0NdHWwvBett4Ywh8KPhNS4hvtlw5matXeXaTqVw2XyyQIsc
	tC9DDU3guxvouN2PakNSUQ9OCH7LyqJPKx10J1l/xAWHO0Os/pVtwoJx5exsG/kfUDCLaKvYXiyYa
	1ShgOwa7xMdk+EY/xcEjcchovq4yl/NQkiS9IMxtlHf3YXfYcytkjpYi1yoYU7PcKe14KpvpveL5n
	JRImLLVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NaS-00000006BHg-0Mi1;
	Mon, 28 Apr 2025 12:27:52 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NCS-000000065Nu-2hNn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 12:03:06 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250428120258epoutp016da3715633daf355d2e167f29b56367b~6edkeVMBe0554305543epoutp01v
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 12:02:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250428120258epoutp016da3715633daf355d2e167f29b56367b~6edkeVMBe0554305543epoutp01v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745841779;
	bh=Bm4L8Aca1VQNMol9yyzgzkjnyzS8+ggYjgzFjnj6SfA=;
	h=From:To:Cc:Subject:Date:References:From;
	b=Y37jAU/q1mt+4E+oe14HWEZjIo7KfsFJerxqC3cX1c6ydpuiBlF5UDZL4NTcl/i9o
	 mCEHf/ylFFxw1Kb7BSiAiM2d4/cf9ykCF561jdc/zpLpcvT/Fo2Ln4fHyfuYPqDRCE
	 bq5UpvUQH3lAjbw/MFVhSlaHix61X4BP20VUZG9A=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250428120258epcas5p30ca5f70f71a5df9b8de11910d8b8dc30~6edj06PwO1311713117epcas5p3S;
	Mon, 28 Apr 2025 12:02:58 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.180]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZmMXJ4Z89z3hhT3; Mon, 28 Apr
	2025 12:02:56 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250428114053epcas5p450f97a4b8e41a1b06606e695e8c19f5f~6eKSeBP7M2838828388epcas5p4b;
	Mon, 28 Apr 2025 11:40:53 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250428114053epsmtrp1c3098cf5f1ed0408ee08e14b1630b845~6eKSdPa7Q0239602396epsmtrp1q;
	Mon, 28 Apr 2025 11:40:53 +0000 (GMT)
X-AuditID: b6c32a52-40bff70000004c16-2b-680f6945e8f8
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	A1.10.19478.5496F086; Mon, 28 Apr 2025 20:40:53 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250428114051epsmtip19cfc81298abf833ca6d224db61e5b7c0~6eKQSo-O42852128521epsmtip1b;
	Mon, 28 Apr 2025 11:40:51 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	sunyeal.hong@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rosa.pila@samsung.com, dev.tailor@samsung.com, faraz.ata@samsung.com, Pritam
	Manohar Sutar <pritam.sutar@samsung.com>, stable <stable@kernel.org>
Subject: [PATCH] clk: samsung: correct clock summary for hsi1 block
Date: Mon, 28 Apr 2025 17:20:49 +0530
Message-Id: <20250428115049.2064955-1-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCLMWRmVeSWpSXmKPExsWy7bCSnK5rJn+GQe8iE4sH87axWVz/8pzV
	4t6OZewW124sZLc4f34Du8Wmx9dYLT723GO1uLxrDpvFjPP7mCwunnK1eHZvBZvFl58PmC0O
	v2lntfh3bSOLxafzF9gsmpatZ3IQ8Hh/o5XdY9OqTjaPzUvqPfq2rGL0+LxJLoA1issmJTUn
	syy1SN8ugSuj40xSwUS+iinXLjE3MN7g7mLk5JAQMJE4suAmM4gtJLCdUeLQrxSIuIzEo2kb
	WSFsYYmV/56zdzFyAdW8ZZTYdv8FYxcjBwebgKnExD0JIHERgTWMEl37f7GCOMwCy5kkHjZN
	YgLpFhZwlpiwYw2YzSKgKvHy2gywZl4Be4k1sysgFshL7D94FuwIXgFBiZMzn7CA2MxA8eat
	s5knMPLNQpKahSS1gJFpFaNoakFxbnpucoGhXnFibnFpXrpecn7uJkZwwGsF7WBctv6v3iFG
	Jg7GQ4wSHMxKIrxVBvwZQrwpiZVVqUX58UWlOanFhxilOViUxHmVczpThATSE0tSs1NTC1KL
	YLJMHJxSDUzaCZ3Tw/d7/Z1kuduCWbDl2up5WgfVAiZH7jp2aGlnsY/OcdHVzxZbnFqQFv+0
	NIPn0fzZPhrnw90KXlSpnK89eqd9fieb1b0zXO21fV8ffHXNfLvxj7ziy3cOJXubGo+9s2re
	9uDqbQX3ZecWP1uW/qLhqlheUmuM3vMoOds5+jucNvz2dN7Z87T8S2Vtl9Cu+BMKy5cJMgre
	kt554FXBhDe2pSF/NC2rljw9vsbsgVbOlsR50l2379UEXk3NWpf3+EFWh8ofAfedr3d8q/lT
	krNG+IXN1wsCptccj+078feZYVdVYZLcfKMFNv+8Gur5exX048J8Ta+ZW/+ZUdL1fqKu8dnw
	Qzu9PezPaj1UYinOSDTUYi4qTgQAzwjlAucCAAA=
X-CMS-MailID: 20250428114053epcas5p450f97a4b8e41a1b06606e695e8c19f5f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250428114053epcas5p450f97a4b8e41a1b06606e695e8c19f5f
References: <CGME20250428114053epcas5p450f97a4b8e41a1b06606e695e8c19f5f@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_050304_994587_98C83CD3 
X-CRM114-Status: GOOD (  17.58  )
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

When debugfs is mounted to check clk_summary, 'mout_hsi1_usbdrd_user'
shows 400Mhz instead of 40Mhz. Snippet of the clock summary is given
as below

dout_shared2_div4           1 1 0 400000000 0 0 50000 Y ...
  mout_hsi1_usbdrd_user     0 0 0 400000000 0 0 50000 Y ...
    dout_clkcmu_hsi1_usbdrd 0 0 0 40000000  0 0 50000 Y ...

Hence corrected the clk-tree for the cmu_hsi1 & the corrected clock
summary is as mentioned below.

dout_shared2_div4           1 1 0 400000000 0 0 50000 Y ...
  mout_clkcmu_hsi1_usbdrd   0 0 0 400000000 0 0 50000 Y ...
    dout_clkcmu_hsi1_usbdrd 0 0 0 40000000  0 0 50000 Y ...
      mout_hsi1_usbdrd_user 0 0 0 40000000  0 0 50000 Y ...

Fixes: 485e13fe2fb6 ("clk: samsung: add top clock support for ExynosAuto v920 SoC")
Cc: stable <stable@kernel.org>
Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
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


