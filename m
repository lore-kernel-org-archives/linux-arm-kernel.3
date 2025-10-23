Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3BBCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 19:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jOfAQy6zSU9ALbpL1BWUFEG7xOjI+5Wynrtljel5J2E=; b=UXEdI+V/wi2nhRzkkKwz74nOls
	KqyJ6tAmuDDPNooqq4isoly9nmNjegaSLeq+LtMI/WxixtPYfPAmczI1ZTvLadWNV9z79TJa9MLxr
	DFbM7HSouHoHX95T10P5qsrszQsKbC/1uka1h3HElBQHHxScFA92fXuyX2fp8LNIUXPyYg3XJePZD
	duaS1qIC3hrKhvPQv9lMvvYVAEeghYokw/9/LwigNUqI82vNLGIeNb85GqWzQEElQLbekuKcer/Ya
	3y2ubLvD+lglEs5+aAn/5/pyXp0ts5TwY7beB9V7C7pIEwTPTFMIxX3yWgNh/SEX+AOuH1/X1DpXM
	9tWrogKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1Mg-00000007RaK-0K16;
	Thu, 23 Oct 2025 19:52:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1Me-00000007RXO-06UI;
	Thu, 23 Oct 2025 19:52:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=jOfAQy6zSU9ALbpL1BWUFEG7xOjI+5Wynrtljel5J2E=; b=nn1xb3dOk9hdw8KYMX6PmOHOKm
	JOX4S3a5Y+SNTssqK6vCsBfy6/zCx255ANJK2Oidb1x35UKHA9ebP3Ttr17TMiz9kgd0WcSz1aKwx
	L+LhpjTI7cdpkndthCCngPr8XBMJFhxLKxoPQ945NNZxzlg0GvanvOxh1FPwRU5cSfwK49ECi1quP
	ts4iw7cH1QoIKeiMMZsdJ9KIE71fZEih+zyCpD5Nc61AMqrh2LFNtVU3swtUHKTuwRZkDc/X12cn4
	71eH6u+ecdjPkxz4+A24vPMsd1InOsj/yv8xSz7oW+x0V8kaCXdRN6xol97d7xpOpGvHXbuCRcwN7
	oylmSMPA==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0Uu-00000001gOK-49Q5;
	Thu, 23 Oct 2025 18:57:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761249150; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OvSSNLHStUlrCORQ9PchBe6O40+m7u6B/rckCMgFy0eHwNA27p/khkj3ToOxtAqHZUx9NNYAvts7gMz+13f0zbYP/vaA7VwiqFhY9KJS/VO4YaQLWGrD915tRZp8CZL/dkWD5E+GHBFNzE3CK1lZJIEEE2mAi9JReGqV5472tWM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761249150; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jOfAQy6zSU9ALbpL1BWUFEG7xOjI+5Wynrtljel5J2E=; 
	b=f44fxNE2GKwvoB360EzCyCi8e3JJTg0V5MnAFe2XrfasWO0mWqCg8D4OOX3VDf0en7GstPozmmwbuii86Wu81nzA5SX+uJ4jQBg5wMOkmCTtsehPuL0J/+cx5o6pyJdmladw8LjffqNU+Ykz2Ug65BlUPcfVkXcp4M8tpLKum9E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761249150;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=jOfAQy6zSU9ALbpL1BWUFEG7xOjI+5Wynrtljel5J2E=;
	b=SSWhn1m5RDIPEWeXMnuakcnTctbnXu6PjKtibIJBDa2adzOH0oDZBaG2hFICID5q
	8VpMhqflL7gBeijxRiKoLr1mpEf+SaIPzo0SRHQScjs6PjB5T1XxpchDcDAzke5DEDb
	lxKk/HQRx0mYz63SgVMsOcy2Cp8tCs1XA797Up0g=
Received: by mx.zohomail.com with SMTPS id 1761249149624289.98114903850785;
	Thu, 23 Oct 2025 12:52:29 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 23 Oct 2025 21:49:40 +0200
Subject: [PATCH v3 22/24] scsi: ufs: mediatek: Make scale_us in
 setup_clk_gating const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-mt8196-ufs-v3-22-0f04b4a795ff@collabora.com>
References: <20251023-mt8196-ufs-v3-0-0f04b4a795ff@collabora.com>
In-Reply-To: <20251023-mt8196-ufs-v3-0-0f04b4a795ff@collabora.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 kernel@collabora.com, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_195717_463981_0541D61C 
X-CRM114-Status: GOOD (  12.38  )
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

The scale_us values are constant, and should be declared as such. Do
this, and use ARRAY_SIZE instead of a fixed <= comparison before
accessing members of the array, to avoid possible future mistakes.

This results in the same assembly with clang, so there is no functional
change, but it makes me feel better.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 38698fbbd228..5f5ebaf61ae0 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -940,10 +940,10 @@ static void ufs_mtk_init_clocks(struct ufs_hba *hba)
 
 static void ufs_mtk_setup_clk_gating(struct ufs_hba *hba)
 {
+	const u32 scale_us[] = {1, 10, 100, 1000, 10000, 100000};
 	unsigned long flags;
 	u32 ah_ms = 10;
 	u32 ah_scale, ah_timer;
-	u32 scale_us[] = {1, 10, 100, 1000, 10000, 100000};
 
 	if (ufshcd_is_clkgating_allowed(hba)) {
 		if (ufshcd_is_auto_hibern8_supported(hba) && hba->ahit) {
@@ -951,7 +951,7 @@ static void ufs_mtk_setup_clk_gating(struct ufs_hba *hba)
 					  hba->ahit);
 			ah_timer = FIELD_GET(UFSHCI_AHIBERN8_TIMER_MASK,
 					  hba->ahit);
-			if (ah_scale <= 5)
+			if (ah_scale < ARRAY_SIZE(scale_us))
 				ah_ms = ah_timer * scale_us[ah_scale] / 1000;
 		}
 

-- 
2.51.1.dirty


