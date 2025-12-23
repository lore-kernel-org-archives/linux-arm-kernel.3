Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791AAE6F095
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 15:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TtEztCWnj7QRqJ0GSyALKfu/qRVEAEmKKSa+oTR2QDU=; b=qJTfOSHp48b5Dw/ul5u6AnCLUG
	ViapukJq2s2y2AMYJo+JhqWVAJpSBHxDaUSgrVb5Uvf3ifK70fNUoPW59VdyZTdzncArlruF7sacF
	NJ01LPo22HTxbwKo7KH9yHwD2qSdJrWONAMpisnXB0kIeqlfbWsIhykE263kKQEIubT85Zky7r3nz
	unwv/Qvf0NtB+YpUcFpy5OvEfT0RUpwcs+jIMyFP1g8pWMY9cbYWR/MLwaM7isBIMfGOlP4piuFBm
	bb5J4lvZJZu9nj+0i9LIRL1hp25Pbw5K7MsP/QxeCvyp3Ch2Wav2KBklUNZmHSbDoiZ9whIx3Ia09
	YTJfLoLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4Gq-0000000FgWu-1T2l;
	Tue, 23 Dec 2025 15:25:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4Gl-0000000FgSH-1snb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 15:25:54 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNCe411561263
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TtEztCWnj7QRqJ0GSyALKfu/qRVEAEmKKSa
	+oTR2QDU=; b=E3nXzk9RnMdtv4PuC0+mk3KKnbAB0gyZfBD7ctQaDriuv++n0m2
	dwTvyN4o/lE/iFITXN/b3TZ7umVEJ4ZwFCxcABdROe3XyJ0HNIshbOxppFzIPBnn
	T2GI1rOvWjgGwefREPJhJjRCsSjiFb1hdWwRzIG2o3StcbKDNfcr+qu1vDgLPiOg
	RLW9Yesx3ErO9Xwgzdi5yovCv+ZkknxxOa3Eq30KomnAb9dDWBZMNUuQV7aG15Ep
	D2kl285l3JFrN9s3XW8j96FbcCdvAzpBlvg6O0terYi3ScUy8vX0gDeZMFkFing/
	sKIE69bKF7PpTyt5dol7CUgdOM8VaWm20AQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9creee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:25:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0488e746so110399981cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 07:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766503550; x=1767108350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TtEztCWnj7QRqJ0GSyALKfu/qRVEAEmKKSa+oTR2QDU=;
        b=O3f7idIMK2R/uPouHK/iMFZNb+SH1l9egp/bikRVSlmsBATmbpHfRB+XK/5tYWnzcR
         UGPsv/7eB3No1tPi3TMqcDi7apGF5UFowX+r6/gouJY56ymZkDZcIdpOzmZmfjZZSQ5e
         xIJKuqiZSE8+kw6Ow0sg3Z3H4gfhL8GOM2292oUPLaCfy0ov2U6OmuBf9L1uuXGuRWg8
         924cxytsaPujjhtIaJqEhpjqW4Zx3t5nL3ZMwo+zmc7sn41yvSwqmTNtzM7WM08YAb54
         TB1zdtPN/Rh7ENgOhaErljtRytPvEXgzVlqZFBQhHulZmjwOuzWGCjcQKl6ZwoIN6rge
         5bKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766503550; x=1767108350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtEztCWnj7QRqJ0GSyALKfu/qRVEAEmKKSa+oTR2QDU=;
        b=P4DEpY64UK5hUZ93eb6GcvdP+4POBdyp12YfN0M+wEMx3+eYLAcZvhyE+cgJMXJ/0Y
         GbTPm0jzJ9yxkhRP6mVvNsifEoDq66vjq7xKyMASpUN0mJrsGaFRIOypTCdQUeRWv4nD
         TAIRnV+um1R6Kq37FACMJZRpnxxSayaqj8n5JCm1wScWiuEbX0T5tDoAr7qY7bcJ6Wf1
         lln7hL921Dn92oxAfYFOTU74RNrPDEvX3EXcSLfG4zgDjnxbPrUbxoYsjz1PIaRpZ8Oz
         a2+3Uo+F0z7z23hj10dgg7DrHe1v8cHloqPjedrzIrm2yqczBS/fhBvTkId6kYvzn5MC
         gLtg==
X-Forwarded-Encrypted: i=1; AJvYcCXEgQoVnkMFioIMVYkh67txc9Bzf1A4fdJfUKgeiJJYtl1NCkuIhdxqPdxd0VZXN6tCIc6H65SDmCPgyq1EgFR9@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi3KVOopbGQnZN73XTioSvOHwqWbulk0p5jnakTe8ZvPfsqd3G
	j2C9Em4ibvGUTCdkNpDH1/KOAIXMjCmk+GN9VhpPMWA12tq50elXz267kSD1/v9M2TGPJYzJsMO
	Zy7wsCSs5WHLa1F8cvNjl7o+6TPTNYCdtH0Q//Nxnz8SFnvMH+JU7cgkpiDfj4hzbMSU4XklDLQ
	DrIQ==
X-Gm-Gg: AY/fxX7LAcQOClaVK4RBhivVMk+gy7J0uuTCC33wJMYOpSXrFGc+ES/PwuzwFGY6FGc
	Y71ixVXryMzC+HxueiC9HcJyDZGEvMlUPC3zMsicX9vZYwtb1YEnYxQlmECbDZ5SOR67WfR/oI7
	6tFUxduRJENH8Q3fRq34oQKU0mp0+qHNg9wqm1off2t6Amm5tN/cW65LqymAd243MC8ff41CvsQ
	Q3zsbX/hFeXZ5evhqX5Bx0SLnCCGeK39ZyBFHr7xl96lYKjLj9ng0Z8sYtjR/pBqnPcdiqwlrCl
	INsuLHNiACNq6DK/zj9guvUQy0+9ynnZQ+IsgE3SGS/gkYjHFpIyobGiZK4yEcajiqiN7zjFlLM
	Xf7yN2fDbQFzNIzY4Rk2colzTHbkl6IgKmd+/ZeSyTSjUndka979kBUzsO2AdGIJ0KJE=
X-Received: by 2002:a05:622a:510:b0:4f1:c1d5:e37e with SMTP id d75a77b69052e-4f35f2b5da0mr261741811cf.0.1766503549721;
        Tue, 23 Dec 2025 07:25:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfEiyxKd274Zyf+GFBh17CVqHI7gHxe7xWhTEgn25kY+EbcwJaW0WRnZeTw9IKDZq1o5KycA==
X-Received: by 2002:a05:622a:510:b0:4f1:c1d5:e37e with SMTP id d75a77b69052e-4f35f2b5da0mr261741331cf.0.1766503549176;
        Tue, 23 Dec 2025 07:25:49 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f18575sm1401626566b.54.2025.12.23.07.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 07:25:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] arm64: dts: st: Use hyphen in node names
Date: Tue, 23 Dec 2025 16:25:45 +0100
Message-ID: <20251223152544.155637-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1512; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=TUV9WBdE7XaextWF8pSmMEIyYIZxno9GibptOAlYOOk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSrR4kCyqhm4Gsiig6bqUTW+5/U52bbrX4IHHk
 Uwz6YjfGo6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUq0eAAKCRDBN2bmhouD
 1wuiD/wOj4LGMQu/gq0pbdXRvVtoSb+cRbxvJrrhYETDzQJ3p0NGp29zy45oNjJnJKf6c176p5L
 oJuVIaMgEPDsosph6UeWCVEr3TX5S19EYrdfjzMHMAhhw4os1RJpjaOW5pnVxbbhFWbu6TyLiKe
 oyDuJaw5DCvh3GR6Ec1CwJo1V9LXPCqjqEkzY8PILB1OeGVbzLoh0jM0th53FG+BFkiJ0PlTdag
 2epNXoTV3yzJ1ZHO897bsVrnHGhEjC5xWLyIj7jZfuR+d1FX4xVWLlYbkhy+XZUnXLZROoMf482
 xBUbDyfx6I2wurISdzHJTariuC0s5q3xxQ6m7BTKeH/dO1Zm7ZF40qRV/ar16dCCs0gYt8Pl4qs
 KwvEmZxn3hi5MHoGXeT/hVsQZNpBAQbND/V1HZWWwa4OGNIhAz7b+PlfEBEFygvtapv0uAXVeJ4
 IrbmZ+g3jrGbVFBu0xbyTnHfRlpHnBLVdvntdKkkgBmsXDuDZnPMEn5Np1xYuby/LXl42cJEbsu
 QK8e0DZ7uueuZK1Mo48Vm+qupHJf57F59Sc8vvG0vO1Hll4MQEVi474Hs6Zvp389ONja9dQRlhP
 kRq1tpeKDru1aep2JZ/a5sOUWD+bTYhRBXSHIwES1aB/sfRpzwTOHwty9lVQpWI4fi9iBEQft5l JX3SuTnUt5zIUyw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4eqBhlgdWIinRwso6-rDlimcLxRgLP54
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEyNyBTYWx0ZWRfX5f/Q2ve9kcG0
 kmnu01kHhLirSI1fxNAoYHKemGL6slEFKbjy/YCNdZGJ8kNmRb/ktD0dIWt/ajjKaRU+Awd7u9V
 Ur98vyC6/qHA46MARq1VJiKlnH27nPGIMGiLTI7syvVBRjth/6O0i7SPBFMifnl/Iyr0A6iMxQZ
 2xgCBtLPGhvhaMPyss8bzNypN13yockJzV6uYs6gEVh+N1DVjHozdHEbBwuY+gFz/8Llg7kGPjk
 caxT0XVdBFxU0IEA8fhRszqzh/sxsGCQPp7YN9Z9UdK8gzyVEQB8MgKgJzyinKCOs+/mD0z0Oz0
 Qn9dGG2L1f/wqYjrma+2NWzzySI8KS7jwca6gfmaz6g7eg9jYRtK5meG/rEb12uULTFbBSWZZ9k
 xtn3OPeQ2A6tvVYVh/99zkumRiNa1DRX+a3og8x3EZMSDkI7T/3nWqkE9oRI10OyOseIiSHwB1v
 XUxNs2jk8qIAScsGqAA==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694ab47e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=fzvLM_iN_nYskE6_0WEA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 4eqBhlgdWIinRwso6-rDlimcLxRgLP54
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_072551_686997_EEE441C1 
X-CRM114-Status: GOOD (  14.07  )
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

DTS coding style prefers hyphens instead of underscores in the node
names.  Change should be safe, because node names are not considered an
ABI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Patches done with sed, verified with comparing unflattened DTB and
dtx_diff.
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 4 ++--
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 88e214d395ab..a6658d836122 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -761,11 +761,11 @@ bsec: efuse@44000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			part_number_otp@24 {
+			part-number-otp@24 {
 				reg = <0x24 0x4>;
 			};
 
-			package_otp@1e8 {
+			package-otp@1e8 {
 				reg = <0x1e8 0x1>;
 				bits = <0 3>;
 			};
diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index a8e6e0f77b83..ec5db00b9d72 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1739,11 +1739,11 @@ bsec: efuse@44000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			part_number_otp@24 {
+			part-number-otp@24 {
 				reg = <0x24 0x4>;
 			};
 
-			package_otp@1e8 {
+			package-otp@1e8 {
 				reg = <0x1e8 0x1>;
 				bits = <0 3>;
 			};
-- 
2.51.0


