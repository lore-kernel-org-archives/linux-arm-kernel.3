Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76634CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 14:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7XCowtVnjKXnbcRNuimTNpT8EiRYTBtdlRiIVINQJ3g=; b=MnmsVNtfdMTaPHfTAKoTTUXhBt
	98bLpXBrOxAcO750Qzvb4vPfhrBpUx2s8GCG4WrbptUM2jlJXglJOOJ38KbSZXAUwEwJSuhHHHKKi
	ffvD5dgYug/XFURZf5kXSKOPaZaLxNphm6y+7mh4ExSKrFQH0og3fTuxi8JPJ7Ji3KM2Yrj5S+Y8x
	OAKBMtlJdnq1RHDeEJfV4228gFM+RsKRUEPlg1F7Xnhz/dwey/KjmeD7w9YKbOOscz/8QP3/IHQTv
	NjF5kdN/HOxQNGpYFVsgxXm/2HFNlKil3tb0G1/7soRduNkzqHtCNkYunV4UYGdBOrX1hcYv01tKu
	W8eVogmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPrQ-0000000D9mu-1NsO;
	Tue, 02 Jun 2026 14:12:52 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPrM-0000000D9lS-26Ef
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 14:12:50 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-36ad15213fbso5649098a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 07:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780409567; x=1781014367; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7XCowtVnjKXnbcRNuimTNpT8EiRYTBtdlRiIVINQJ3g=;
        b=IqBte+L5oSUbEQhTvCI0AHl624cYwwrf+c6orztNF+6FxMUV85ugkhal6gGbKXKXe4
         nuFrY2GGV69Xvj/aurgUF7iy7dzZKuO/56nWbFHs6Hy9c79A1Beuuu9rH9mZlLBuIrCj
         iB6HlaLwMo91HuuojJM7WwYfNVwHpemDHv++WHh7V1YK2Y4/dCLwHe+MZgrl5/Q7dSN+
         NJvyP6H3AoMQGZdcDhQGk7/YDVk5NK871grBEeTyFfcRyiJHKPMXBf48PblI19OlPKBq
         Eowbha7GnWA6yn8MmMJFvPTqHLxxIcUAhEqbMxbijzYQVSq8kmOcN0Hf6jQy0167TXKK
         BtrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780409567; x=1781014367;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XCowtVnjKXnbcRNuimTNpT8EiRYTBtdlRiIVINQJ3g=;
        b=PX/TeeBsxswg0kyTKJgHTqwnHyEtNBhmApkQ70oq+TxllGJS58mfG3pbIki7clTjU+
         ca+VHqX6S9yEtUIdWSqPcUnKM6gbkkYHrB2x+Ud8XWGrUDAO+sS6J5ZA3Ca2tCzVsfAS
         rrRn8AS4eQAR/fBtUMoGrW30Hn21mN6P5zgjjR9BrSl3AVeqteEdWnPunBJl1BP724jZ
         7JYnCAhPfGeU6XpMc2a4AjUBgnxTvXYn1yKsb+PKgFxdcFPw703rQ6yE6REHIFcuTw5z
         K9F2MAVXNSJjUoNcUbW71qbZlAvwevHMTx+mSlZvrfiqniBjXuZsgIzsvGFz1kCgcKh+
         ROOw==
X-Forwarded-Encrypted: i=1; AFNElJ+OLLvLOfbBOmFEcV6LRmM+IGxp+Cj4707NGC46GxKJN5pc6UaqrEP4LBQI89xN8b0y/uv18akNP2GxVvEUgBAJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxsRfxSMJiw+j5qfPCOXeue3SvgCa2Yk0gvzPX2JOLkU9oMWE/M
	fu//VRg1+EfvSL/lW17LpU/FNwiRNbxf3MNz+9P2MTOx5LWVz2nBIlNW
X-Gm-Gg: Acq92OG16Xi354OBkQN7BNfPnDID5d3EtqA89A2bh+744AY030BGIPK22YEH00XnSok
	U+tlBvmaXTBMwYt1+1XpY/iFuGn5JEwnG4JaOVOL+0J6HKZ8y42p0u4hNVKvOGDnoHxs/AvVleJ
	OO0cOO//7pEUUO4GTmplSGyPl5Qgg22XMq/71XNrleWHXsugTefAz0AqW6T+6uwlA48blzifYYk
	ewjw/QYKPdt/RudPwzDR9et38xB8PLwfCHTvzLhXRwyRIl+I6rxqhRAEyUNxvYfXa3IC19gD2dJ
	T6Jk6/FEUgqY4VBNascBIzqux8kn/wHrh37PmEgIYtWYE8L+Yfr1B4MoEMG+GFD6cJ15KKBMv6n
	8Cy/PidqaMEYc0tgP6ZnksTvJPJybX2q1rz306/zpllUQTQdrkbUyD94HxcZH0gEsEpRvednjXy
	GWD6/cKYOxNvHQVd3iXAMrzLdyohHm+2Q7ueZ3iQi/EqUwvsYNvxz72sXBmbgzyTzHX1ypTVEVn
	5cdz8Xkt10tcRzf4ymj3b3frFAx
X-Received: by 2002:a17:90b:3442:b0:36c:e254:4d5 with SMTP id 98e67ed59e1d1-36ce25410d6mr9832117a91.4.1780409567301;
        Tue, 02 Jun 2026 07:12:47 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd90415besm3601775a91.0.2026.06.02.07.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 07:12:46 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 02 Jun 2026 22:12:41 +0800
Subject: [PATCH] phy: fsl-imx8mq-usb: fix typec switch leak on probe error
 path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-imx8mq-typec-v1-1-3debe9bc77d9@gmail.com>
X-B4-Tracking: v=1; b=H4sIANjkHmoC/yXMTQ5AMBBA4avIrDWZdtHgKmJBTRmJvxapiLsrl
 t/ivQs8OSYPRXKBo4M9z1OETBMwfT11JLiNBoVKo0YleAzZuIrtXMgIhbW2spU5ooWYLI4sh29
 XVr/93gxktvcB9/0A33aWg3AAAAA=
X-Change-ID: 20260602-imx8mq-typec-20a6f1d1900f
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Xu Yang <xu.yang_2@nxp.com>, 
 Jun Li <jun.li@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780409563; l=2735;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=kpmGkkU11ecTwdVdTxlaGp+lNBsMTsb/Nj9af5UXA/A=;
 b=4YSIt8pCDNOFocdXGuAudSQFQldGYnUBr8V6MOtFtbIGLD00AcsWNSa6+B/Ptk3ul3742sf1P
 htOMmlEyovCCgKwh7yZxmffvwspM7qwRIj/dbKpNJgLdmX5jcRHNlr2
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_071248_550486_3A52C28B 
X-CRM114-Status: GOOD (  16.29  )
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

If probe fails after imx95_usb_phy_get_tca() succeeds, the typec
switch leaks because the only cleanup path was in .remove, which
never runs on probe failure.

Use devm_add_action_or_reset() so the switch is cleaned up on both
probe failure and driver removal.  The .remove callback and
imx95_usb_phy_put_tca() are no longer needed.

Fixes: b58f0f86fd61 ("phy: fsl-imx8mq-usb: add tca function driver for imx95")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index b05d80e849a1..8af5a4f85698 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -173,8 +173,10 @@ static struct typec_switch_dev *tca_blk_get_typec_switch(struct platform_device
 	return sw;
 }
 
-static void tca_blk_put_typec_switch(struct typec_switch_dev *sw)
+static void tca_blk_put_typec_switch(void *data)
 {
+	struct typec_switch_dev *sw = data;
+
 	typec_switch_unregister(sw);
 }
 
@@ -248,6 +250,7 @@ static struct tca_blk *imx95_usb_phy_get_tca(struct platform_device *pdev,
 	struct device *dev = &pdev->dev;
 	struct resource *res;
 	struct tca_blk *tca;
+	int ret;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 	if (!res)
@@ -266,17 +269,11 @@ static struct tca_blk *imx95_usb_phy_get_tca(struct platform_device *pdev,
 	tca->orientation = TYPEC_ORIENTATION_NORMAL;
 	tca->sw = tca_blk_get_typec_switch(pdev, imx_phy);
 
-	return tca;
-}
-
-static void imx95_usb_phy_put_tca(struct imx8mq_usb_phy *imx_phy)
-{
-	struct tca_blk *tca = imx_phy->tca;
-
-	if (!tca)
-		return;
+	ret = devm_add_action_or_reset(&pdev->dev, tca_blk_put_typec_switch, tca->sw);
+	if (ret)
+		return ERR_PTR(ret);
 
-	tca_blk_put_typec_switch(tca->sw);
+	return tca;
 }
 
 static u32 phy_tx_vref_tune_from_property(u32 percent)
@@ -739,16 +736,8 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	return PTR_ERR_OR_ZERO(phy_provider);
 }
 
-static void imx8mq_usb_phy_remove(struct platform_device *pdev)
-{
-	struct imx8mq_usb_phy *imx_phy = platform_get_drvdata(pdev);
-
-	imx95_usb_phy_put_tca(imx_phy);
-}
-
 static struct platform_driver imx8mq_usb_phy_driver = {
 	.probe	= imx8mq_usb_phy_probe,
-	.remove = imx8mq_usb_phy_remove,
 	.driver = {
 		.name	= "imx8mq-usb-phy",
 		.of_match_table	= imx8mq_usb_phy_of_match,

---
base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
change-id: 20260602-imx8mq-typec-20a6f1d1900f

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>


