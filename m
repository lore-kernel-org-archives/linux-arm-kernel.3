Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5986AC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 19:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nMwcUTd0xqYO80wvVws9oXZcQyIt+B8oFPVLth7/QHU=; b=1Os0MgiX9xEC2QcKdE5bWG1HK5
	m1Qj1HszPYiMMd+kVrKoewFjClD5fDkyniRbWWZNi/IBfIqlgZ8qv8+Zee9UEZc8qWOYWrCg+kXpm
	3IJNlheQiKSfqCNaiVZNLkIIMbDlB2h4MKkOUqGHVqzmcyrSlkDnIw6N7v1wMdCvbdRELTMBsiK1/
	H2w69VZbmBCg/3u0rxN07ghT+Da1CtymhFwzkCvjbUqnaIQmAlmn2pdzGq71IXKFboI0Hw8vRKY8G
	++JaAjYt4JAWF1JzLfQBbuKWxR34LbJhSoahcgMjON6ynC0KmhBUIxUoXgQ+vb6e+fF5ihHf8bX7C
	DLD2kdOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0OuJ-00000007G06-3LtT;
	Sat, 29 Aug 2026 19:40:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0OuH-00000007FzS-2lLC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 19:40:02 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGx8vA1856640
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 19:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nMwcUTd0xqYO80wvVws9oXZcQyIt+B8oFPV
	Lth7/QHU=; b=RUhX5jgnL+wIyhRaMGSgHm9u5dx5cv5SpMMRU/TqEvbI7aCEcAQ
	eiKXF8s+7P+B0sys8SqMxHv6XBGzH3mSIQDfHzpZpb0osZ1gwx2DJVevqp4XtPxd
	9Ovv1KyY+V5vX8ApwTgn1wP0MIaW78NzNWbG6e98TxzzTITSHST0uFo7d3oWmQRU
	D5TxVYWXLCTiL6LpMSbepk0umsJMcvw08j/nxdIQU9z3RhOjHvtnvDj5gASwiGHg
	Y/po3YSAClrjucFreJR+LLaMmttvIZ2TPxT91Lw9DjEzcx8OpODvuIby0U2qykg5
	p9zmT6i6ILpcK0dRT/GfbJFLwA8Z8pb7aPA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbr6dsj1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 19:40:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d33c89a29so51675461cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 12:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032400; x=1788637200; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nMwcUTd0xqYO80wvVws9oXZcQyIt+B8oFPVLth7/QHU=;
        b=YGryMPFZybbpmM1n1AF304NWWxJJA0snfM3C/4kxYVSQUt5NVZwoD+bZoy8+wX7FH/
         QwwlVg+W32EnQwRuaWV+ufVIG+HRoHbytYGbMDYq4+X2x/cGQg3Jp58OfWrHnTpC9RBY
         4JrqYLxZhNDnz9lUa4RYrEhXr0RZY6McOCtK0mbil1E0IIu57w1aeNp/ZVffbK5hhycI
         NFpXjrGhTCj8NMhL2WTRrAleXNUX1RaZ02Foa6ajz8lu+wzCe4JgvcUY87qp3PawYWdw
         Kb7AlekV0UEWlcyxGIz6TysvfkK0mwLoDv2smvD/IW5DIoACtXIMWUuZ+ZaejTFQO3va
         ZAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032400; x=1788637200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nMwcUTd0xqYO80wvVws9oXZcQyIt+B8oFPVLth7/QHU=;
        b=Y8HCqJWEu9li4c0UHQ+zYNT3aBUsqujnlEpvuvvbNmr9ypBVqmPJn5y7tVs4B4qVvz
         pHoPZxWLYtB5kmvkc+buNefshvFMCjBnHRsCLgIK8UjIzrWduT0qdWtHhXCahhWwpXv9
         VJ5QVhrH0BMI01DF/aZRWU3gzfOCw67wsVEAA71Q1qlsKR8EY0257Rta57C8dbQEPYbM
         MyRXwAix4ISVN0H9P2EzuJCyXI6jDmClbVjYpXhXiJxr/nLaWjLnvcYbky1hsbY1v8Qm
         CkbuvmhlbcJxGrPeazCMHSrx0vloQWgp3nJFQQU2ni/YDK45IXCv5koFnhMO9dVrMUXV
         W7Jw==
X-Forwarded-Encrypted: i=1; AHgh+RriL5GHJ0LSzuhqpXYBIOCD2t1j99wopK5XlMBdseZv1rFEgIVy+TFGGSP2GKjX4ChpZqL5fHkkHb2GGVhDCmNp@lists.infradead.org
X-Gm-Message-State: AFuF++lRkd7OK25Bi39v58nBqxRWFkE0OuXP8h/h4fEMnXfagRRpUSN2
	cGIoNs3Ts3+VQ7CkkoTCULyBZZs9ZsR6eCR8r3to+NmNn1AZT2odxgYQyxweNuz2C/mQof0vG43
	6e9ESrfo/PgV/BOGIwY6+UTu/jBC8Au//e6nxy66hoLWakFMSrQgWpV2HXhYZD3EdjC9GHOusmu
	Rd0Q==
X-Gm-Gg: AR+sD12oTGpID9sOpzO13p50Rcq+or1JImcmQgf/NZUnnIjkCcs++YL8xyK0EnZnuK1
	930q13M58ygmgI+EX9KQfI2mBU5HV979ubUUTcR3T/dLWdW0Bl/sk5G4JoVfIRNo3FwSXtaq3P0
	By8XEf5nh0yfIqDyjdj+3rZgid44C3+CbtJDC6v7Bl9ELyb63+mzBvFyG/G32okfFNbPEYRWc9I
	/WNqYmi435YuCVaKgjhMRUhy5azOHvCIoKax5fX402Q0ljewLipjW3B/5VmnTMcsMxAs6kffp8q
	oRptcrvCbVLqLUk/u2FvBTWC9iaFbNwpqKmX+NTwm620zZs5ZI1tcwJ8wVJGwNN+xnIv/e/Zyqx
	qqQ6UmZp6ZPPo8JA=
X-Received: by 2002:ac8:7d09:0:b0:527:7813:a439 with SMTP id d75a77b69052e-52fb94e691amr169213061cf.27.1788032400120;
        Sat, 29 Aug 2026 12:40:00 -0700 (PDT)
X-Received: by 2002:ac8:7d09:0:b0:527:7813:a439 with SMTP id d75a77b69052e-52fb94e691amr169212691cf.27.1788032399737;
        Sat, 29 Aug 2026 12:39:59 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48432022ab8sm4710593f8f.28.2026.08.29.12.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:39:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michal Simek <michal.simek@amd.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: xilinx: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:39:52 +0200
Message-ID: <20260829193951.107616-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1792; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=er/Rf7GeNCbQhj8OCR+h68ddiNOINBqyNX9L3ydhTfE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzWHNp4vkWapk8o0ztEr6YUKdqCSNIqqoag7y
 6/FU69yyt2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM1hwAKCRDBN2bmhouD
 1xd9D/4m+ux4/etHu43G3Y+N26Sa0wL8/qjHzd55QWHGpntqt2rTVAR/tOBf9HkE2fGGphDXmlQ
 UqeMDFkYD/GBzTHaf7qu7thJ2RTZ6hLl7TYWYYCV+qz64PEk3E7LDmiIOl4JLWPWGH+uyxD2wW9
 4R1YNsqeRN6M7f60oNEr0TuxReND9mxUAaRo+RSB7cNXwl/HFyaA7HKcD+8UcW/7qoEf2tFPOEW
 ulBYGe7Fp7G4BvlOifi0RTPC8YjD8vzUmoMwI31+Jh+CZlx8QHVoBU5Lbneqy5lYNzHDKn+ofsa
 eVbPqql/et7vq5tTN1bi9ap/dA88dmEll5OG6W1cyocEzoaXdGS/jkzcAHwUcmYnN80wwKk2M9F
 YFptSMGG3I9TG1Xezo3v+OAWp9kwURGhjr5X7Ua0jRBeGyB3WyqHcTZxQzWMXG0Y3pA+tLBfGyy
 moOPYcy9kEn9wvBEwB2EmQO71rCzsg/Arwh83IXnvIsmuOhHKpmdETj0QEN8N//ckgIubEgclJu
 Wrc/3JG9NvZlbrgRQVma/xaJuiS27nsPWefHKkHxHelUDutMRRVfM6vjUoC30if/iTYj93ZueOe
 e170qzRNzFtOfTefv09C/9fMdXhmVDCkmYXAl9dCxftAEzrZFmZB97ZzPnjDWHMdOzBSUEPb0S6 lDhMLH8vY51l6WA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX112Yn/QRdUlp
 U5f6PT/biDZJWyoIKgSVi+WDs3Y1gi0BbF926RXXC+oPJE3et6jIHOgPQDJS3X6kzOvDWiG1QNc
 fENTAqFt7yJkJxDk61+t1Cf4i9ht4fN5BLIzlYI6mCYiyixDdfnwIw64omHKllaC4ycdxUghRkW
 JYFqrdjWp5AXO5AXlRMmjfgca09OC7AGsqnbHbc8kJAzvzV09ZMgJ4S1XuR220w53pOfJq754SS
 BWlzFlZgmy2j3TUyP5xbfzSCazv1FA/gJCFa5RjUV2DQkzEDTLCGzfBGeUIkAeQBMxKubyxPk6R
 eH4oWKZqOTtaGs0XY8VzfXqUFapIyNqBVqfATWvKEzkkF3TvdG/nBhLZooTd5G4K7DA9rt6TUlW
 wKwYqEK2XlNZMPH1tg1/2naiAL9HVYzJEetH4r5H9VdNr/IQEMaWCPAP4/iXxf/oNrAbuMUA41Y
 1kd8Tmhga+RoQjiPS/w==
X-Proofpoint-GUID: bhcBPzT4wrdWaideXBdnR9_GtrgA8guw
X-Authority-Analysis: v=2.4 cv=Zakt8MVA c=1 sm=1 tr=0 ts=6a933591 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Ta6ShJ3tCWu1s0TIFCkA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfXyDx2r2/iIHKE
 K06Ugcvj9Jz6rtklUNd5cDH7YyzIpjO3T2WG1y+Pu74NlQoXJ97l8J9WV5UylAVlBtcoCaxMiT8
 bUQaWTZVBHY6MUU21NtIOTwkz06rw8Q=
X-Proofpoint-ORIG-GUID: bhcBPzT4wrdWaideXBdnR9_GtrgA8guw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_124001_703428_E031BF97 
X-CRM114-Status: GOOD (  13.86  )
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
 arch/arm/boot/dts/xilinx/zynq-7000.dtsi      | 8 ++++----
 arch/arm/boot/dts/xilinx/zynq-parallella.dts | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/xilinx/zynq-7000.dtsi b/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
index 153b8d93cbee..715299f5d860 100644
--- a/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
@@ -380,10 +380,10 @@ dmac_s: dma-controller@f8003000 {
 			 * "dma4", "dma5", "dma6", "dma7";
 			 */
 			interrupts = <0 13 4>,
-			             <0 14 4>, <0 15 4>,
-			             <0 16 4>, <0 17 4>,
-			             <0 40 4>, <0 41 4>,
-			             <0 42 4>, <0 43 4>;
+				     <0 14 4>, <0 15 4>,
+				     <0 16 4>, <0 17 4>,
+				     <0 40 4>, <0 41 4>,
+				     <0 42 4>, <0 43 4>;
 			#dma-cells = <1>;
 			clocks = <&clkc 27>;
 			clock-names = "apb_pclk";
diff --git a/arch/arm/boot/dts/xilinx/zynq-parallella.dts b/arch/arm/boot/dts/xilinx/zynq-parallella.dts
index 366af4fcf8d9..b4651540935a 100644
--- a/arch/arm/boot/dts/xilinx/zynq-parallella.dts
+++ b/arch/arm/boot/dts/xilinx/zynq-parallella.dts
@@ -44,10 +44,10 @@ &gem0 {
 	ethernet_phy: ethernet-phy@0 {
 		/* Marvell 88E1318 */
 		compatible = "ethernet-phy-id0141.0e90",
-		             "ethernet-phy-ieee802.3-c22";
+			     "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
 		marvell,reg-init = <0x3 0x10 0xff00 0x1e>,
-		                   <0x3 0x11 0xfff0 0xa>;
+				   <0x3 0x11 0xfff0 0xa>;
 	};
 };
 
-- 
2.53.0


