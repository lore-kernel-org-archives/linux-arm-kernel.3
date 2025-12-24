Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB88E75452
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 12:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tCYzWdff7n1KF50nzF4ylfg2y+m/Sw+ZFz9Y923Lo20=; b=WhIKAhs3KDRg/ySZmmzcClaKwU
	Z+z2W61yVMCf6tiOiG801LYREmSbdZYVkuVkuXVT/5YW7MnVh1VIV4qnN2T50PaXhll5eujj/HvOX
	64kADDtkKG84eCaGofUr2PuKVMSjkTbbk5Sjtar2YQOefE1jygPZg8lAiSvpGpd0DOx51HiKqqnXX
	53Yg4S/YP5t2JbMblXFpd0BRc4axuw1RDL6zAK3Cv2uvKW8daQtdkr36zOJnxWS0T8Pr+L4ntEc7s
	sZdbni+G2lNwEn4mU3G6+sYfzt7gAP2kEr1siblEEaNZzWe0JNV67dvezc8tb0EcxeX7CIKIhAMvG
	L6EB0ACw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYOE2-0000000Gng6-089X;
	Wed, 24 Dec 2025 12:44:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYODw-0000000GndP-1EUY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 12:44:20 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO97due700902
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 12:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tCYzWdff7n1KF50nzF4ylfg2y+m/Sw+ZFz9
	Y923Lo20=; b=F0ZihYxaQcoZFAOjRn3WqsZ0HEPDYsp6xSBQIUn+gBUeRPBSLTj
	W3hckciIXGCzUWwP1vhewhbcwllb+M3TBpkJKfccULyzx42fgAmHbFzDvgXcDs3D
	Pjk/xFYoPlJ+LvmfE//EMDd7D1uRCZWLSs9bFK/m/bDFJVJKZxpZbo9IMLVN9+u6
	s8KZhLloSigZHynwuz5oHJ8q8LiJhIdPCvCCwh6Qm5MlSCl/Z4lhSqAViTWUzhL+
	55fSEEFwRx0OlCWtjDAHbHYNdYzvA1QchaqnPOWxzligtYOSmuEqcilLfbNr0uxT
	DZWxKXi9+VDyuzvcFw/EV1s4X0YVZ1zqcPw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7juqgh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 12:44:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed6ff3de05so164042251cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 04:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766580254; x=1767185054; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tCYzWdff7n1KF50nzF4ylfg2y+m/Sw+ZFz9Y923Lo20=;
        b=dHRBZQi9EqMhaOJbgd9mhGArYLPlZE4AfQR15Xt3OTcOCSA+hcjBDQxz/wH7HCo5+A
         ozQGB+IHLrPWO6DcwpMMmvxF+HPAGYjI1ZE80AINkMxo/uGHXWSRmWQdG4quD5ss0rxP
         PnHVxNpvkoAeibAhi3DkQfgN5JkaWm0AnYLr153tU7rZnvFJOMiGF/0fc7LtuRVowitM
         5DvwxkgYjBvladBBuh+xQ4XNWg6wD2mPtUWf5kfouKC93VWLFZaH5L5/8m5Z/R5/qOEo
         nnSZy1vfVQQwRzWwrcpWSmdusXv4rNACHPByidXMdegqr7YnbceqyiwqJRMn7xthIOcV
         Dz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766580254; x=1767185054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCYzWdff7n1KF50nzF4ylfg2y+m/Sw+ZFz9Y923Lo20=;
        b=RZcG/N87whoWkHFCIr2p83jYHC/i7FT8zX2glGFM/b/68b/WduuW5V/PLLPmg/BJeW
         W+vQhRarlm4vCPCEuCHIKetyrH8ClTZCoQ8In+mQzH005qTpEe3yLxYC0r3fvTf0P1ei
         M/zK1WlDHNZ8JrOBdgfFHCCWQHJVcGX3om33gsiby21cHNMA+pCGQKNwP6N0KVkujEJu
         Q04aJ4m5vLj/YbvVeHOAUMK3zeYaQkXlkH17Zk9cp37w8mvKFN8pTnjz19gLaMjaw626
         d04gTrWIOK1rjQlwJWfoBwc3cI48jmQYBIcP4XaN8dP3CZ4A4O0wgdtzfglvnqnhJgnk
         13zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEEdMq5bALjTVhUBhD//mDZlZdDJizvGgYUmhCVnUPlHF7CEOHnuNCNJ2wV66G6jJ1vmUqO5LbOR2EANZgjnQm@lists.infradead.org
X-Gm-Message-State: AOJu0YxoiwBWzj/ZAkJcDV5gHqnJZ2GY0k0am2KiWLLK1n3bAac4BjW6
	5aHWopRrq1dK0xWg4EmMJryN/kptJNLzNV1j4sFnaGgSP23RHno8pf5qfbp9CA7m64CkDaZEtmK
	WXr91+JwC3kKbBofk4fWc9rM6bnKePM/kRFDevqcDvoJwfLwN9FHylw0npGBAA78RP2mWrqeQPt
	80fA==
X-Gm-Gg: AY/fxX7mOXHTv7O2OHTvy5+0j+Eru/2DGN9jySX43cQe00e2c2wOQaqHaxBj3Xadc2U
	McMHo9/yP0Nhk+BO4GnaaLp6/DYbuswQgbqPT70hW8pMAm2mc6sZVI4/x/X8jFHdfuFNKeqZqmx
	HD9ADzVmPkadRXswsr6FGJ16KmyT3f9rJBHMyg9+6endDISpcsp91VDSo6whNmfzr9iKGhgwEpg
	Ft+opCdW305pBrWyeQJt9vc82/UfbGqTnKFxukESrI/hZU79YRcAxlbzZMOP5IZRFGXF3VjNCvn
	DKwqCsaErXrDWTeiXsPYNmGi2L9ZlXDJIdPuQ322r9g/f06g2HJ561pjuQXaC36Hh0/wCWf/A60
	SMI060OZ8r0o4BJmGFVwo4HgjyhXxcPbgoIbo5qJ0a97qvtRCusJGsNMnQYZKa8vabDNDqQ==
X-Received: by 2002:a05:622a:410e:b0:4f1:be70:7a76 with SMTP id d75a77b69052e-4f4abd8c6afmr265450911cf.49.1766580253744;
        Wed, 24 Dec 2025 04:44:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYpVNHB2iL4mAksYmUA/+LVLmMSYzWNCSBH5TsAHz3DLPgXD1ip8b4uJpmz3NjqhBYB118hw==
X-Received: by 2002:a05:622a:410e:b0:4f1:be70:7a76 with SMTP id d75a77b69052e-4f4abd8c6afmr265450711cf.49.1766580253411;
        Wed, 24 Dec 2025 04:44:13 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916b66e2sm17049203a12.34.2025.12.24.04.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:44:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/3] phy: rockchip: usb: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 13:44:08 +0100
Message-ID: <20251224124407.208354-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1300; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=yA8n/3N51SU6FcQtGBZRLprm1g3J/2wXk4j1/Hxk46E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS+AXzi0JHlvHuya8HdxoNphQ+7PXvo/kd4CRb
 fU5Vi8dLGaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvgFwAKCRDBN2bmhouD
 1zt5D/4mIT+5DGh4QTJOJAtVc8flCOPHdTRs1c3WZysL+yszgrie3PwcIok1qWMW7cJMMPWNT3V
 4TCNmg6Cg+HpzkIo14nqPev/wEPOHya+7XA8DGo9MTIBDPu9UKAxtOiMG0948W64Yn74882Wqc6
 0zUpQbeAQSEI/5+AI9HFVs1qDlm1b9TBWTrhJhQTvoj3ApozFNu6gMumjUIXojKzfR6aDa6hiUD
 zWLB9uGJpTd9LtmNR3AoTwZwbIeZIHFDOHz2tODmjbU2ZsQInsfrnK3pa7sm7ekfWu6vezxntgR
 i04R0OIwMPWPsM9b+nvl+J/c4Sux45DHA776oExUgl5umVDAdhJbT6kKSeM8260UZvKV20/nDmw
 UvLiMu/OKLAjEkyXVrLzrQ5V61IK9yCobE54QPxbGrc8DsioaGdcyf5pAbCNU9WYV1XaYbZKUnM
 +nLxLdW7Q9gIwVngBVtocIfpknpbhAI/aX+Xm4PWKe1I3AsGOCq5ZyRAa4kemP1cldI1hkBIxST
 hlpOZ2QGSSSlpy4ZGWqIh9qd8VsjZE4wfF4jMhh7AHAVLPDWOMwBI+50BhrN1OTF6GhGYlDEFtR
 MgBoPJLp4xfNLJVOaqz8o0Zi6RAwWL1HwKzRSZ25ObBzWGCPGEdC6M63yIn9n86x0wAepAmtJh4 x7pWx8msxf4muoQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExMCBTYWx0ZWRfX8ZuMwN9LivoV
 KqEDaPHrHVS6sOoccviXJz3ubJaJ3QyHH1pFuhtzbVVQS+2YT+yRmuu8dka6CDbhqyH54Eaf3Px
 2uFrsRA9+C0UisRXxdcCFFgsH+3EEmHtR4kXuPWJfgLpcmJH98rLT5hHUq8Pl8ltvKxBs3iNbIH
 RvfEddL3yDSuVssmg7+3TJY0rC1ort7RoP0AVpTMmbjxcFcz+iOigsDxwJU4W0vSVQi4CmLJ8oj
 KR+KcJKGZmMWeIxFACzUCOBIvH8LYG9AjOAvqKz6SjyJAVJr+AMOYUp48A24iMV5d6ozcB701u8
 iZEjn5iF0A2IYzx8eV4MXDNqSZbsng2Ji/n6nctw95/UMqy6QSE1NOxD7s0wicoeThMmcNXnxHt
 Z6UwBjNedS/aBqqKRUXEAR2Q83BhoENNFoB9wYtiW9M8ad/T9vqtA+zrgP0jxwGPKJaeR1fU2V6
 7BtwjU1N7Uh7e1hmTXA==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694be01e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ed3ano5rc7BESD-daDoA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: xXmTIB1Xe1Wg5vIL1nFz8y25QRlg7aWF
X-Proofpoint-ORIG-GUID: xXmTIB1Xe1Wg5vIL1nFz8y25QRlg7aWF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_044416_482497_40F97335 
X-CRM114-Status: GOOD (  15.20  )
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

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/phy/rockchip/phy-rockchip-usb.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usb.c b/drivers/phy/rockchip/phy-rockchip-usb.c
index c3c30df29c3e..cef96739cf3f 100644
--- a/drivers/phy/rockchip/phy-rockchip-usb.c
+++ b/drivers/phy/rockchip/phy-rockchip-usb.c
@@ -446,7 +446,6 @@ static int rockchip_usb_phy_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct rockchip_usb_phy_base *phy_base;
 	struct phy_provider *phy_provider;
-	struct device_node *child;
 	int err;
 
 	phy_base = devm_kzalloc(dev, sizeof(*phy_base), GFP_KERNEL);
@@ -472,12 +471,10 @@ static int rockchip_usb_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(phy_base->reg_base);
 	}
 
-	for_each_available_child_of_node(dev->of_node, child) {
+	for_each_available_child_of_node_scoped(dev->of_node, child) {
 		err = rockchip_usb_phy_init(phy_base, child);
-		if (err) {
-			of_node_put(child);
+		if (err)
 			return err;
-		}
 	}
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
-- 
2.51.0


