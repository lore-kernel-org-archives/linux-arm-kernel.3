Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C98E7BD8A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 11:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F01WUNnfmnbR0yYPB7Kz02Ieycgpy7j4Qjt4QDWos+A=; b=nkGYKYmEOkz42yesX27OHrqwdT
	YoRDGdze+Ye6WiLNlKvevaBKy0x968Ky1kZ2oV/jIG32ZEEC331AvATzt0z9IvE2soz8ZeLN9FAb2
	9TlYeTnTw3DzSNS0KFvs17IOBBAAE2wqPff4MlkXI2454J8KFNzOzryUrK/2EVuEScQt0Mm4QWynO
	Z7BkMugfriQ+vYGcmstOKNrTq5Wj1UVI1bgcmiW6dP4aQqUQJD5IyXAJCwxKGoutdYVvye+YSmuMd
	o9zjehx9YHFalswchqv1DnmoDBEdpUiNZSnuhUeipA1LWj9oeNeWwrfWojYGlgObqVhzv5U7Hk563
	EbeCq2JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwP0-00000006PH5-2fa8;
	Mon, 16 Feb 2026 11:04:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwOv-00000006PDo-3zZ5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 11:04:26 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G0FUh93661176
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 11:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F01WUNnfmnb
	R0yYPB7Kz02Ieycgpy7j4Qjt4QDWos+A=; b=Hjcr/oW07ut7NbClc0omdQp/L9M
	wkcrxXS4KA1jfTn7aDyR8+ZvemvjvRWppcZN767DfNyIDpN2bWzk2zlBhe05fArT
	pKICy9l09DPeiGncJBsvECtauhYLojMGsSh6rfxrtIKP3dqz1dsBGke509mNO3Cs
	XVzJJN16vR1ThcXbbH9EmpHsRW6STCQWxszl1AEBr4NlUnMOyz1YFxUHui9IzlsC
	hnl6YRr0ArVfxfcRcgeIoo91YJANHB8C4RCEsOK5TKozVXC0qDbzFkX14ni7BDF2
	E/uSGcJvVeV0LkJ5ZFTwkrYtI935CcOVt5UKEeg+bTp503ltAcm3NPCwFWQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4caj7jc4t7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 11:04:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb413d0002so1896912285a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 03:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771239864; x=1771844664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F01WUNnfmnbR0yYPB7Kz02Ieycgpy7j4Qjt4QDWos+A=;
        b=P4wlPJvZTr8k+WVE6lpaSJyjxc8Fc1Eudty9Gv84j+Au4M53n0Ohm65KqfuN/y/qFA
         JPxit6FmDvSNw61/0wnx8Y2UFFnF6b7khWm0brHwyr55oocbP4Sa+lHubQ3freWBhIb3
         DvSwqS9J19pd21EOpP9EjKg8oRanHMEHAGeGfhttMi01DUx1xaKrtaWVaIXAINXKmjdU
         OMO6tWkhG5Dm6poe+Zj0dYmUhUsDGAzRtfB2y4WsrAcJtYh5gmWM54yKphM71ur0iQOo
         uoMPv3CwPnXdEyh9OkCWpm8o/ZmrE4f16ES5X7hu6ubklbj7Sn9NeT+W7zNYppWi7hiY
         3M4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771239864; x=1771844664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F01WUNnfmnbR0yYPB7Kz02Ieycgpy7j4Qjt4QDWos+A=;
        b=Y53v63y2gB71HNMpFIg/ZNwYmpBC7EF6kWrK2MroPvExfNWbYp6/wNkbWG6w2CMBGV
         5XdbtO0siZr6v6ppiCBhXzlAT1SLAjDCV5J7f+LEVERdo2TXxyBdNR1N11v9/u2HHF+y
         uYR22v4gOmliyKuu3a8MD9tLivtyw7tUAA9jZoxKujTtd/YjWPFpHZS6w9KLgUnhSWSl
         y+9jVe7e1stQ9oHJJ92DyUzEULaEOUd91cDcQ5ZBhInAPmDDHx3Zv4/NX+wNjY38ifme
         BDJYfEQ41mBNbSApL1xZ8Sy20EyEweDe6tceWLQkwNq+7UnwInQexU+X8ljYrrexwtsN
         HRyA==
X-Forwarded-Encrypted: i=1; AJvYcCWxSt1XDNkCyqdZNSm24Riv4RoQHenHWQKSlctLXPVS0ZjWcd2VNLEvx37JsioHfUM3Txna72BH4+1+HYElMje4@lists.infradead.org
X-Gm-Message-State: AOJu0YzmnHMsBQNsryGYY7tTstjqUR5/eVVMkW1AhgBFcU7NvZznljn6
	OdAHM3s8ygmMRyX1GyRLNhdJpkncZyhOaPtexKPcSXbvg0B/BMeDoeLkWTwvg7jvqj9l4rv21me
	gGTVQpmC2MtmRGhNlH9+hwPbf3PiAIsrIVenzdhemAO3+ECSWVYZ4vNQWrPNnryRs6IFKLS7apz
	BFTw==
X-Gm-Gg: AZuq6aKOXo5TY5Sb9MiTNNch5kjwWLXXlDUeGHJkypLFVaBLmfyAy6Ly2rgR9J59MJt
	tAzm3tJ2vxOeaAo37izYeSyJ8+4a2P3mSoGW3qdv2iCMKc9HBMPuNOYcctpsOf4Pynm/OEr+jgh
	xqwaFjmra52EwgmLwkcalcqYjNL+dWxzXjyZBhBp01SCHEUIn4z+9bEemfYVJokMx5sqP9jN8Pn
	cRStAmvr5jW424JOH7qD+FIkRWEz6m4ev4skehjHzVk3Ho/LwcwES6VV/tvyPXBm3EFmEXd1tcX
	dDISb3hxCDOgRa/DM+PfglnFOx2I0jp68BUZguVUrvP3dT4XpFX3bP+KJB9E58iFkq1UlGHIz9V
	Ucg03oBFwraJrHftRtW+Pwj/0kA5QWnCrcVQDpA==
X-Received: by 2002:a05:620a:7014:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cb4ac01da8mr888185385a.15.1771239864237;
        Mon, 16 Feb 2026 03:04:24 -0800 (PST)
X-Received: by 2002:a05:620a:7014:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cb4ac01da8mr888181985a.15.1771239863711;
        Mon, 16 Feb 2026 03:04:23 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d99497asm589572745e9.6.2026.02.16.03.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 03:04:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/3] phy: marvell: mmp3-hsic: Avoid re-casting __iomem
Date: Mon, 16 Feb 2026 12:04:15 +0100
Message-ID: <20260216110413.159994-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260216110413.159994-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260216110413.159994-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2660; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=5x7EKhBU5ewPua8ICjoklEgJzewBTCgQsGAMmItM3TY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkvmuGumLqCgJtNAvdAK3FxSfjsCCVupiMB6DO
 aRRH/Dds5yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZL5rgAKCRDBN2bmhouD
 1xyPD/0doaU541CGXdyo+TDlx4q5IRHmoaKkM/nJvV55NxJGn9KWOqxb2jB4u1YpsFd/XOEh4vM
 EiQ1f5MP8+ovGUSJ8B7Gl9BUvMNfLKKjhLYGGMUYAnhsPY8dM9d/ru6RLrYFaWQFhR5Goqvo/jq
 Pd6vn+deb8KAswMtnQA4NMGggINzxnr560ONASrJReEYPcaKDxs0WHJj0IWaClC258cRFtCNXgr
 sheBqKuiTpsPGhqXhvL4Eq6Xm62PpCb7FYcBNlD2P7U93R+Idbllc7uetzQbpi/qgipDWRvJd5i
 eEptl9HfzgHd4lQpleW1Y8G6i24pm0xvCARUgZ8oNimjEjKrnLHBOqr6kmpPY8MeuQQHLjNYgPM
 3r0bfai9ZsT74ygiraFpBz9/7uY8MCJ5863aMTfGaVOBJcyyR35IIoK2k147wjv/tNyz4mYieKs
 LMK9NB6FG0U0hn3kQ3iktoZCgwvwOBmX6WD6PmMdbaKsOREUlcfLLDDaBE7fISuRFpG9UXTB/Dy
 swSzMRK95Lxq0t1E3a4ZScx/5Px3CquXsdvJI8ezpzYrrSE2VZNyeBc9tpzUjNRtsr5OASc1Y+2
 xhd1UGwAgsB8tnlVWXFpCYKHi0zqKtR8JEhicIg/aHZDe6UYjiqLfCPNxF7UT2ZZg6kakhCQT4F pOuqDl66BwCcHsA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dIurWeZb c=1 sm=1 tr=0 ts=6992f9b9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=SkZ1eIaMs6HdBQsGQEkA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5MyBTYWx0ZWRfX5AyWD7/4p5i9
 PyZPVCTwFnsFVHhnafCPhmjH6or4jy+PAvADIl0WN+KM+5wAh5zMmqCW5etR4r94Bfrl+i1kFKR
 FRSnG9mju0V/GDjZVawsDrSy2MgWysVjAnJjWOXyqvHexDY6JydTD6tHtzSFEin0dRIivunz+xk
 /A/+ugax1MgCfcdo1ZWgOvmzztZWrUcFDEEZCxq2eU7QB0zO7j/KI22DI8LJSSfacLITOL4/o7l
 3MW6ofiYpZed/lwZA1XbipDooZNPJpCKsao0LTbsmc+SiuEA/Ytg8LJ84PmRnPYshBo5Zoo0Jic
 UK+b6Wqf1g84in2nWpyYpe08bSFFZwr1hd8PbxfnQlJYcGSDX2mRmJzT3Ckip9KXPQZB1mPBTbO
 1WW13Ck7GCcdbSstjs5k7fCuXhZKye57DTUdY/bljophsbj2XYraGx41ndxfH8G9qLvZgmCsr3T
 7Yck+sXch6Ba4dN91rA==
X-Proofpoint-GUID: ms0TgZkuEZCowmgdTu2xoIT-0hr1zprO
X-Proofpoint-ORIG-GUID: ms0TgZkuEZCowmgdTu2xoIT-0hr1zprO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_030426_005426_C0113A11 
X-CRM114-Status: GOOD (  19.11  )
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

__iomem annotated memory must be accessed via dedicated accessors, even
if actual code is correct (accessing the driver data in
mmp3_hsic_phy_init() brings back the __iomem cast), but dropping its
cast (with or without __force) when storing as driver data seems like
less readable code for any future changes.  Instead, add a dedicated
wrapping structure just to hold the pointer without changing the __iomem
cast.  This makes the code explicit, obvious and solves the sparse
warning:

  phy-mmp3-hsic.c:58:31: warning: cast removes address space '__iomem' of expression

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/phy/marvell/phy-mmp3-hsic.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/marvell/phy-mmp3-hsic.c b/drivers/phy/marvell/phy-mmp3-hsic.c
index 271f1a2258ef..72ab6da0ebc3 100644
--- a/drivers/phy/marvell/phy-mmp3-hsic.c
+++ b/drivers/phy/marvell/phy-mmp3-hsic.c
@@ -14,15 +14,19 @@
 #define HSIC_ENABLE	BIT(7)
 #define PLL_BYPASS	BIT(4)
 
+struct mmp3_hsic_data {
+	void __iomem *base;
+};
+
 static int mmp3_hsic_phy_init(struct phy *phy)
 {
-	void __iomem *base = (void __iomem *)phy_get_drvdata(phy);
+	struct mmp3_hsic_data *mmp3 = phy_get_drvdata(phy);
 	u32 hsic_ctrl;
 
-	hsic_ctrl = readl_relaxed(base + HSIC_CTRL);
+	hsic_ctrl = readl_relaxed(mmp3->base + HSIC_CTRL);
 	hsic_ctrl |= HSIC_ENABLE;
 	hsic_ctrl |= PLL_BYPASS;
-	writel_relaxed(hsic_ctrl, base + HSIC_CTRL);
+	writel_relaxed(hsic_ctrl, mmp3->base + HSIC_CTRL);
 
 	return 0;
 }
@@ -41,13 +45,17 @@ MODULE_DEVICE_TABLE(of, mmp3_hsic_phy_of_match);
 static int mmp3_hsic_phy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct mmp3_hsic_data *mmp3;
 	struct phy_provider *provider;
-	void __iomem *base;
 	struct phy *phy;
 
-	base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
+	mmp3 = devm_kzalloc(dev, sizeof(*mmp3), GFP_KERNEL);
+	if (!mmp3)
+		return -ENOMEM;
+
+	mmp3->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	if (IS_ERR(mmp3->base))
+		return PTR_ERR(mmp3->base);
 
 	phy = devm_phy_create(dev, NULL, &mmp3_hsic_phy_ops);
 	if (IS_ERR(phy)) {
@@ -55,7 +63,7 @@ static int mmp3_hsic_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(phy);
 	}
 
-	phy_set_drvdata(phy, (void *)base);
+	phy_set_drvdata(phy, mmp3);
 	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 	if (IS_ERR(provider)) {
 		dev_err(dev, "failed to register PHY provider\n");
-- 
2.51.0


