Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49AECCF2C7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 09:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzE/Q16vHCGMwmevYtx35ZN8QzUMpEh2gX+wjYeXZXI=; b=wtlkWcbTG9gdD0dAjJ30JLfqMj
	YD2T0AlC7LguER1BK/ilg8I1LXzwGCTmRtHLegxsHihTfZNqIkbWlVr8uYxRTfp0zE9vpiAbjKY4q
	G9MqpCPOwrQDI3WXjv0ozvTlP1z3y8EAFZquzqJW2yn72zi+oWrLar83BvxfKoNO9rx/8yycJviGW
	SI6LJbB7XsxHwRqca56HvLyeCOBbEzx1lRVGTH2vOrNGCm2MtfdUgpIMPL/XfoRwpsKAGvJcXSB8R
	sUKW2Q/0VAm1OH/bSVusxLACJVZcoLEgRWXvSuTXePFmb7SZkRNQNLNeKtIMa5K1xE6kDDmmtqq1R
	bFNntxCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI0zD-00000004dMq-21y3;
	Sat, 17 Oct 2026 09:45:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI0z4-00000004dKb-1SQu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 09:45:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6o9LC352311
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jzE/Q16vHCGMwmevYtx35ZN8QzUMpEh2gX+wjYeXZXI=; b=is91o+eakQSvu+YA
	41mkYzQVs3UllcmUPE4QHpGVa5esOKREV7CLOZPkeeChuCtbLE3qqAg3Yu687bac
	UWV9ZbyDMMVKkI7z37vW94ZYuDCqc2v5jDC8bb40/DUXa0wSfc5P49314X0T1Bl4
	I/kvJppeQ/ic+wEFefBC2//GJVsmQDvgjTvyYJAUWSw0AbhqqGgZfAPCn1AcrsoF
	dXsmUYW6/E7AMC3K/ha9dzBgsBSwSYrzJYnXnwfuPctCyRKlWEI7yWw49JjRoyGp
	1sQDttekEU8l9euXMadYPIE+17QXZ530cnEfC2CioXnpcgqty00HN+dzq9pK20Zi
	KgY2nA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc13urmn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:45:44 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-152d1363a29so2688108c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 02:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792230344; x=1792835144; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jzE/Q16vHCGMwmevYtx35ZN8QzUMpEh2gX+wjYeXZXI=;
        b=Bshm9/6mrs9HNmWjLFCEGel6P2cNRJ2Z8CGf60+166Ii8I8mjpp2dstaMp6xizX0jJ
         Fh95ugSY7W4/U+rCFkUFBtZfuBLBIZhkAZIHj6ZoHAbxOcVERK24N5H1dGgRquxk+vCZ
         1r4C45wyLFvEHxN46hId1y1CgrRxX7URouuLvf02ZufYJVZJUcEKtFDI3hsnmJ/ZQD6M
         7pUl9q+lRE7GIWY2jRPfVVDVEq7mIF5AgxTINzxJiz1vPkx56FneBu786IbsUv+b/+lc
         kuMcZCD43nXTht1wPDDvYBW/qvKMJF20ROAO3M8CssxGpvl8FK2bWvy8AwivSvCJUYAQ
         yGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230344; x=1792835144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jzE/Q16vHCGMwmevYtx35ZN8QzUMpEh2gX+wjYeXZXI=;
        b=bsXLxq4pVX5Bp+PkQatEJrhyHRLBx2lvkcrGI7s/EbxE9hWaWAAErm4SrMEVrBd+Im
         zvsl1OUCvl3alK7NtOPZ4wkX4Px/6TZ9h3J4OrokuaC8B2+QDJ/JSCit4RLi/uYHRZsJ
         U5ZTqaKpS2MAyd/RXxV1HKyJ9MNnLeB39KzdruMQ5xObRNrTj01KMPadMMTR/NRkqN/q
         vArI5wL4oz0DHUB23QYLX67Fp3gTfb2Fj2uTC771bPT16UUu8LjVmUOpVrFitKlsF4Nt
         +0WwMqpGb58oHBRkp0/IwdlhvRX8lN6pbKchLBkzTzeqYmzlYnNtLrVy6D0eiUpn0UMe
         n8BA==
X-Forwarded-Encrypted: i=1; AKwUvByUW/lqkwrbZfOXGEDT9Nnav/ALrSWC3l/3TIVToTv20kCAI092GjQPM7zb9lLfWNdFAun7qWVzv3Wplwm9tMfR@lists.infradead.org
X-Gm-Message-State: AFq9FYLIrMBpA+Uu+CZtqcpkgTJAzl9Ct3vlXzJ0i0yFUhifU/DKnnJK
	KO668BDPlsB9mWM48kOxzHfybQVwb35GdzcM2LX+86YRAHSituS3sM2EHdHnPn8Pb1tA0wbuJOd
	pvXFHpLl08s+aaIgv7FxmSObZiDr5wLJ9m4FMQQfGHa3XpAuSpkGUQ+3sPRS3TCwZAtxcsXVCHn
	datzzHFu57LA==
X-Gm-Gg: AYBFou2CqW4v8OHc0f207jjw5foN9ocMEMcI+qy1ktwktRBlsTMwITAnaWhBUHDdGvL
	/OTMKK/wTNk35oLGcRBggMpej0qHiCrT8/BdA3s8wfKWxXpyuWOLq63Ol7dHz5MOz131hH5C1mY
	LwTPsgu9Dh4pXQ0PAaMIl8cUUm3icLDimVEXgQSbszt9heq/sVFps6YvNm88byCv2nXedQaZ1Ba
	sSF08Rj5p8WQ9aG58NluUis1w6v+sH2Ri95vsyOzLa9UNOHAKCwrcOCQvGYsh+eEPyVxOb6eAVo
	eVlZIHc30rPjVCVIV4x+nHPzAlQrbp+ienges3OqIJexLswozfM7LjHqggCTokzfyy3N3B7idwZ
	ip5rxOx9epWIrsA2ry8vT6CqKV5jUhw==
X-Received: by 2002:a05:701b:204a:20b0:14e:cc3a:9f32 with SMTP id a92af1059eb24-18511ad88f3mr3460872c88.7.1792230343731;
        Sat, 17 Oct 2026 02:45:43 -0700 (PDT)
X-Received: by 2002:a05:701b:204a:20b0:14e:cc3a:9f32 with SMTP id a92af1059eb24-18511ad88f3mr3460812c88.7.1792230343061;
        Sat, 17 Oct 2026 02:45:43 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm19450327c88.11.2026.10.17.02.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:45:42 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 15:15:12 +0530
Subject: [PATCH net-next v3 1/9] net: phy: dp83867: add regulator supply
 management
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-shikra_ethernet-v3-1-26a8beb44b8f@oss.qualcomm.com>
References: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
In-Reply-To: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792230324; l=2447;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=WVSHBlAoKrJDFHjSHgKUOHwT3ILmdd9Bv1++uwfX2CM=;
 b=UQBsoFxKJfv5tbLctgXh4QAgGFocXPnjAeq6p48mkcMMGBNr5pjE5YFrDHwIxZnoEKYFdwpl/
 C2zcyKxXDyeC2ggJgEVgQUe783OQ7JesLTnG1GO4YI46rkrkIm9ShMT
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: Yk35BJeFpQuutuFh8de0FI760SYJw6nx
X-Proofpoint-ORIG-GUID: Yk35BJeFpQuutuFh8de0FI760SYJw6nx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX7K4XiwMG77vz
 VazCYMoX0UIsfOSeIPCa+W6oPD/8f7cmuDMqiufReqFmNxNx5frGq+ijm2ytHSNbrrRUATy7ppk
 X3uwy+eaPCvPJUPm+iilLR4TY7r57Fc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfXxPaoJsyPMjtq
 GaLcTSwT//Xle48Rts9LrX5amIygFrr+JAreJZqH2FszLhChxGm3rMPd2wWipLrdc1y0U49omES
 uYxA5DVTX9yY3MrMVnaS3a8Y74Bi5ezBg5fDBSY5qarPZmccpv9I7KS1ZoSFo6MhwPpiqSnk7vJ
 0U4ZZgz4RPI5HB44oK/f7ibFXjuZrANyB363UdON1bEdV2txU3Ct8YNCn/U/vtQJY89FkyV7+zN
 GdJHOA21HH6cI0zEKwURtzafA4FNgSLjo50f/k3jBLJrVZnfFrP3B2tgUCiCBgQMzoBiOrHfTz1
 lpkAUglZCqvBaLsoNAQ97OoHbWy7g4vUJB+6460zB5SpG3gFjlhoZ5OivQ00WFitUwpp1huawJV
 4teNhcIIvl40eh9JSaFmdIvgeJ5ygGFl6kHP2KWcMBEDDDyTjZQdDWV5ke30T4iO/nBZ1YrxbKg
 iC2v9NONcUPhG2WC32w==
X-Authority-Analysis: v=2.4 cv=SKzXx+vH c=1 sm=1 tr=0 ts=6ad343c8 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=sozttTNsAAAA:8 a=uuhe7hOpKvpPPjRdXc0A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_024546_859210_733D8968 
X-CRM114-Status: GOOD (  18.09  )
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

Some embedded board designs use GPIO-controlled regulators for the
DP83867 power rails. Add dp83867_power_on() to enable all four supply
domains at probe time. Absent supplies are silently skipped, so boards
that do not describe them are unaffected.

When any supply is newly enabled the driver sleeps for 200 ms before
returning.  This satisfies the post power-up stabilisation requirement
mentioned in section 6.6 of the DP83867E/IS/CS datasheet.

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Acked-by: Andrew Davis <afd@ti.com>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
I have kept the Acked-by's since the overall premise of the change
remains the same between v2 and v3, please let me know if you would like
me to remove them.
---
 drivers/net/phy/dp83867.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
index a3cd5cb11ea0ac108219e05d990b378483b67d7a..092bc68bb9bc6561e2457f596206453dd84e56fc 100644
--- a/drivers/net/phy/dp83867.c
+++ b/drivers/net/phy/dp83867.c
@@ -16,6 +16,7 @@
 #include <linux/etherdevice.h>
 #include <linux/bitfield.h>
 #include <linux/nvmem-consumer.h>
+#include <linux/regulator/consumer.h>
 
 #include <dt-bindings/net/ti-dp83867.h>
 
@@ -730,11 +731,42 @@ static int dp83867_resume(struct phy_device *phydev)
 	return 0;
 }
 
+static int dp83867_power_on(struct phy_device *phydev)
+{
+	static const char * const supply_names[] = {
+		"vdda-2p5", "vdd-1p0", "vdda-1p8", "vddio",
+	};
+	struct device *dev = &phydev->mdio.dev;
+	bool supplies_enabled = false;
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(supply_names); i++) {
+		ret = devm_regulator_get_enable_optional(dev, supply_names[i]);
+		if (ret == -ENODEV)
+			continue;
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to enable %s supply\n",
+					     supply_names[i]);
+		supplies_enabled = true;
+	}
+
+	/* Datasheet section 6.6 suggests a 200ms post power-up stabilization */
+	if (supplies_enabled)
+		fsleep(200000);
+
+	return 0;
+}
+
 static int dp83867_probe(struct phy_device *phydev)
 {
 	struct dp83867_private *dp83867;
 	int ret;
 
+	ret = dp83867_power_on(phydev);
+	if (ret)
+		return ret;
+
 	dp83867 = devm_kzalloc(&phydev->mdio.dev, sizeof(*dp83867),
 			       GFP_KERNEL);
 	if (!dp83867)

-- 
2.34.1


