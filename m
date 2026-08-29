Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F37C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 19:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dC2uPKn7Bz9c3JOaJ4q3xOJQPSlGj7uAtT43qOT5EtM=; b=f+XEMocUmDrccQUFov+EHeN74t
	MBWghVtRrI6rFq3RqqHoBdlHz9hCh06gj/W+lcBgr4tEFLRVGKNw9fYKa8TH8WxdKQtMlwtwi8aB+
	Fatbb6dEdPaD0lzYNI8ZYfs4kOmxQy15GdS7YRIVxpLlfgRR/DpM3nTZ+HDXiJaLLOxAfIEbcpyqW
	BMzVfW9St8OE8LtmfbolXltKMmT3wCpTfIWYficc0/JaB4m2RhniE0j41sblaVWL37Ew7Z5/YpRxF
	4RG8MGFx/simVraev0buyteSVIFpkvxkcFEQFSbZakeTLizfuLVTJXpK9NonDjWnA4cSjKEnCHwo9
	jYnCIeoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Oub-00000007G7M-0SJT;
	Sat, 29 Aug 2026 19:40:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0OuZ-00000007G65-2HKL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 19:40:20 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TIK0782021085
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 19:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dC2uPKn7Bz9c3JOaJ4q3xOJQPSlGj7uAtT4
	3qOT5EtM=; b=BPBsudnOUJX+AFr950m27W/F0f49ufZHGY5ky5OUJd7wOg+094e
	hObU4ab9EfnxjPUNAGKKd8k2yAIbwNGRNw8+lJMgbd85J+jNjQRyzmYvqRamXPzt
	vKX4c/5GDNuREoQ1VW6OBFscl6G3hvuCgQj/qmqKv57FNC5YHtqnPg60lMc1XvuY
	U7d9cJNiTqc3LjIr9KEVPVXIZowVWE0tpSMlkwgJ1WPMUYaSaYq4IxuBVhHFnpm3
	IlbUK2J7pYSVJlOO4v5K3ubRsOCtaOlFdCKUty4B6w7e0XFGt6pp8khgZEFktKKB
	B3YfpOdTvApkurs1fJPoNNyMorSyR8ZS1Jg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbr6dsj25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 19:40:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52ce3c7cb2eso43854121cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 12:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032418; x=1788637218; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dC2uPKn7Bz9c3JOaJ4q3xOJQPSlGj7uAtT43qOT5EtM=;
        b=WMId6JZL7O8TQOmoZgqALA04E0n/JuLe0UEQVD1tzTtHfv4siunVTWEpHlpUqRswN9
         J9ACvES2gqa68unWGj3WmHmFUyCM/h0uoqTVJBZpL7jp4pnRxOoe3Ecyi1dz7AQyBlFw
         02UuHbdtfcEpNc8TC/OByNvzPDPA865WYE9aTiN+vj+w7fanYjbrvhq59lmjWe/Ke8JO
         J+Nmt+IkQkho+e/qe8BnRW5Xv2AmSegFBskFZ1xghGUmb9J4L3BjCd0Mn9YRB6sb8/Lf
         bgi7PzwGWL88Agw2P2MQPpJFIKFxAcoOY3rSCR2wKML8RO7WlQnreGLQzFpvoFDCo1tY
         jo2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032418; x=1788637218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dC2uPKn7Bz9c3JOaJ4q3xOJQPSlGj7uAtT43qOT5EtM=;
        b=n5kL9CXFGCMBNpGIHreHBFTUMg51tINFaiM2ZVaagAWOQHgoO5HUgPSDuDX9qWw6ZQ
         3P1OagXMeNJx5nkrD2qv42sfP/fR/4yNql5t3nU/n8vlXOIOP7I7BWx2SonQR3hbFQke
         QnbnkgvZe87Q0bNjWsFWLDM4LrW8cSp6OEj6FR9ixHFLAfUNP1cJyYD7GjdMtvumJsmC
         4sLS74waFpNlIz8UroUk3B4qsBlWwn89ea5u/bRIZel96oVzv/kKDupTf3n/FCe2N7xa
         cC0SlIplkHtMAfYkPaU9F5iQwZaJuXSoG8uX52KMpN2BAddmFvJ0qq8YeTDCRN9HCKvZ
         yoow==
X-Forwarded-Encrypted: i=1; AHgh+RrJ8RXx1UA5VLw7Q98HHWB0/PVGZMi0/Mm+J3aIJdnjM2hriMJcVlYJJMEj0pCbqkwJFJWbie1b/+QgTeZgWvJb@lists.infradead.org
X-Gm-Message-State: AFuF++mWVR/FTWuKgOVpOOCUUSx+pPfFdzovSYTfwjPLlkxqFmCPesSa
	8Hej8ay/1AJI76fRLeR2U8S7EVgK8wRyKoo7w5jOBbZtLqVFoGPuJI5/KbO3klGXZMKS/kpF/XV
	gHABaiTXmsAsomqFAWrgae103f+PKwH/lnNhcbTrBHYO47XWWYlzKn+KKlKnvQ6AjzMn6S6zTZy
	7z6g==
X-Gm-Gg: AR+sD10ufV5cbFGKzs2F1/deSKUdvyFjeeR1oYyFHQnMZK/jCm4jde5HDrStTOC9SlX
	P8gZQtPJ2K0E7B0ZCGRoWlLu+WvxgGymExjj5ZbhvUETFRDbsFYyfrOGyCGhB6ikhSi7wLBXQ0K
	fEuWsob6WxTe6NrjKiT06ldEHzBn8bnq/5BLYyzpz+FARwSjAkYUQodwJ+hjHFcWOOc8PCzp/NO
	9DDoYjrNFh4t9/a835ZB6BRrn3Ok2UJB/VVeh4Sv1LoViS1VgdDqr4t+yKiE+nxXosH0pO1YlO3
	PiAA2T4OWP5kUeiuJbcouFkz2Uc+rGjAnZUTtBHKAAQfY232Zcgfscmt1aKhSXlXiQntvU06wud
	slje6gSIdXpQ0k8I=
X-Received: by 2002:ac8:5d48:0:b0:52d:2ddd:27c with SMTP id d75a77b69052e-52fb95f60d6mr206700351cf.31.1788032418184;
        Sat, 29 Aug 2026 12:40:18 -0700 (PDT)
X-Received: by 2002:ac8:5d48:0:b0:52d:2ddd:27c with SMTP id d75a77b69052e-52fb95f60d6mr206699991cf.31.1788032417790;
        Sat, 29 Aug 2026 12:40:17 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95013d06sm212416845e9.12.2026.08.29.12.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:40:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: rockchip: rk3229-xms6: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:40:13 +0200
Message-ID: <20260829194012.107758-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1174; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=PYY9YRoXwVt9ZtCr2VOyzXNfCWWVJTDZHV8PRm29vsU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzWcMqWLs/zgfHWLjLhZJLNAx4ncT4EVpq9rf
 nxmpuXChd2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM1nAAKCRDBN2bmhouD
 1/BQD/4sChCgMTqvyxUFlH7n+eaT665GUPdiOe+/Fi6nOuSPR9nbymJM05DyfaeVmG2KN+h7GA2
 APORSPp0WD+fzr4cP3LUEPvHvMGXfDH09KmavTDHJvOtqQ7RbiI740fKMMfC8SrY2T84s+SPN2/
 DCs8Och04ySRJE4NjOaMBCX7axazvucNs7G1Nk6lHemzNEKM9IbOM1Q7dpl3u0RMd+UUf+M5kCp
 RfHbpvhjQ8gAuqrKlJrwruhT+EdpWa3will89qC+GWjF62vMZxlyZzHxnUFGjIzUAIxdIhi0kkG
 VmMbzbAsmeo0CivgbQz0j3XSUzR2BucPg6ahSjyR4/ZQLR6D2K4kT/XWEool9WrCK4WQo1fEm/3
 Q0sdMLTKxyXcMXMc0Ps7oKmMX3S3nN4+ZVjfri59POt2xMugbofUaAeQzuIjiwqh8dt5WdfC0G8
 vIjKE8aO4UnhLgDKJ5lE+0cIS3VGJbeCOXrvPtLt1z8zg7zjX7kzecgJhWJpIIoonVvVcVIyrp7
 LfC/ZxdcdL5dPVtFWlPKViMfT+E6p2Tg/Ev3qWqEQn4BsJT+Z88f3l76RG0+OUKcbSaZhSwPaM2
 wGBGGi083TilyFXrDjR+c0mq6Mbbn4b5FmIYIdxjeR8McUVQhu82WG1s+RbfidzXTp5htwhy+Hh QepFMOx0wX6md3w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX0uFh+domMGb2
 V+GC5tpgdZpZfccH4wSv2XQcZROCWURbRkL85aX7kRR1Y1pxDbGuS7eaDg83a+/NKXHNIWBlqQk
 WjVoqIGliosDh1iGndGfMHbLNLEep8ORQsafGipaljeCESTV6Q5fhmtpNLUT153WUC4k7HJVEmx
 ksHe6777psesjWr1j4MEgf8gDk+ilH2v8N9R8iwUkDfjHGhxhVRg79IeYAqV0Sm05W8sUBtKbbD
 A7Y+0Vuj4xw/LMwwKrr50fKuwMfzXH9sDbbrCae+DkR+jPcEJIwyBfdllLHk1IesjPEMGBCFzQN
 x6kU2tQqyKQAH/XifhuRoVrtqtxEF8x7ZNG3FdbIfnNEZbpqDUdnRqHILgU8y0zWBH/Od0AeYRc
 0gNe2V2HQ3jHhamLrs/24e/sOgutLMy0G8yZz+gJ8dSb+AcZFD8jOK5DVh+cPO6/gNB27uYWKvg
 xDrSLhDrzZdNWfnhOaQ==
X-Proofpoint-GUID: FqBNt_02I-7A7TZ9oozyCwWfy-lrZUXL
X-Authority-Analysis: v=2.4 cv=Zakt8MVA c=1 sm=1 tr=0 ts=6a9335a3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Ta6ShJ3tCWu1s0TIFCkA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX+q9bq72E6PbG
 VpNTXqcTx2W1cgGep7HdHVGWIvb+ExOrMRtkA0OTJPnNLDGLeB8e87O7aHyTUVX1JYPRFV+t2x1
 qKnkH2NNde+z6qcOML/xNd7xCW1pRfI=
X-Proofpoint-ORIG-GUID: FqBNt_02I-7A7TZ9oozyCwWfy-lrZUXL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_124019_583708_15261FE7 
X-CRM114-Status: GOOD (  14.45  )
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

Replace excessive spaces for aligning indentation into tabs.  This will
be reported by dt-style-check ("[mixed-indent-chars] too many space
characters in indent (more than 7)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/rockchip/rk3229-xms6.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3229-xms6.dts b/arch/arm/boot/dts/rockchip/rk3229-xms6.dts
index 28333449c43a..6fd3e61c89af 100644
--- a/arch/arm/boot/dts/rockchip/rk3229-xms6.dts
+++ b/arch/arm/boot/dts/rockchip/rk3229-xms6.dts
@@ -48,7 +48,7 @@ blue_led: led-0 {
 	sdio_pwrseq: sdio-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&gpio2 26 GPIO_ACTIVE_LOW>,
-		              <&gpio2 29 GPIO_ACTIVE_LOW>;
+			      <&gpio2 29 GPIO_ACTIVE_LOW>;
 	};
 
 	vcc_host: regulator-vcc-host {
@@ -163,7 +163,7 @@ mdio {
 
 		phy: ethernet-phy@0 {
 			compatible = "ethernet-phy-id1234.d400",
-			             "ethernet-phy-ieee802.3-c22";
+				     "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
 			clocks = <&cru SCLK_MAC_PHY>;
 			phy-is-integrated;
-- 
2.53.0


