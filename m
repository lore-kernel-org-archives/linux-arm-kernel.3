Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D667C88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 10:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFjJDfmrsxdnQqiLVZtefGaveMYN9Z9i/ZNKa5TpjG0=; b=NNqD8BumZRiZ5DG9yo2SX4dDF+
	1Ac5BnAcf0W2jm0ZvQqhKZBKIkDSFWxOEX4ENA6YOJVsg3+NI8zsibEnVq4NUPAPh3Yc1qNBa7Bt5
	qribv9/C2KQbjdmSTd8d+26Yvv7uKcFiweNejPUXfw57nLVqASfPBDSwkMPO8raCRxI5zWF8GkM6l
	316Sp7IJENOBx9kVmXT2078VndPkzqoBXtCpKvlwTA1kloXgr63GBpWt8MdsAkviZOs/gjjF6wv/r
	HQBTyBKWiSFuMHOiLplgi8dXS/I79GjIxsQ1k/FgrEGxVcjsHlSqarSrkMJRnw8ljId397PRT/eOh
	Y4lj86dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yMJ-0000000GM9g-1XrD;
	Fri, 11 Sep 2026 10:19:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yM9-0000000GM4A-10cg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 10:19:42 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kY3R2801713
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 10:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tFjJDfmrsxdnQqiLVZtefGaveMYN9Z9i/ZNKa5TpjG0=; b=Jbw5XSjLuJRj9l1j
	dPwht7x91STljWFG6UtOo10tv+iwQc4xfYokrTM/hEMZzxzzFa95eCOCo0dsKe6/
	DiVfQlVRkQUz9VA7dsDghlV6+LjsiPBupIjoga6Y+UlBw/cUJxRq7NLAiDSYwHGp
	gNtZBkinibUq40O2PV/nmO5CVzWyvtAzYA5ypRIfoQ/H+3lmDxmtBhexk4c9AfVq
	4iaz+mm4GX9DTG86DqKLkAdeQ8Wsw+VJ7C8EpCkgokhRwa8XNMb2qLB7pHbRTrqx
	/ac8Cwh4OmZm5SErUEt9kcDFDRNBDG4cNB3oPiIvJfeRGsIjhbelq9KuhbKC7FKT
	7UoN7w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm729j36w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 10:19:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930b571432fso153310785a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 03:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789121980; x=1789726780; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tFjJDfmrsxdnQqiLVZtefGaveMYN9Z9i/ZNKa5TpjG0=;
        b=BcP8Rcx+9KYFVnRYhsiiV5FLk8LqG056fyg/lMZsoa3O0fXaB0saLmfg4MjmMBwzFs
         +/pIezSePa7+GAhBpDR2+KSomC/ZJZpskmodN3tBBe1Ek4z+M0au53wwBr7MvJEjKGGD
         EIdscIeGTJZVp2uJCihfNnVP9Kz0pkE83FrwLZASdAIg0qp6p8Dtj33Ru7UgHo7x9Kfm
         y5NDYwbc34BF/Rkjtgi3TkoPpwk31tdAQOvNp4+kRVBbb7jnqpweTf1ZmXJc9FnuJyQE
         ejNpLMtvYnWN6niiqbt1bk1WGZDph2LFTtZZluj6f6cO4k70fpnReKtLDoQQunsyEVKS
         WgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121980; x=1789726780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tFjJDfmrsxdnQqiLVZtefGaveMYN9Z9i/ZNKa5TpjG0=;
        b=OlLKYVdzaX81mSfKfSmNF8OMO8YX4jv1bfUr5mGCOMG+v8RXYamLlgEnA9h7EpN5yU
         CkdTVobiRMwDgqo0hf80To3kbSB+R/LHjTxI6hOWfr6a7BsiJvvoaE7RVakx+kx8YJAF
         gfxecwLeEnwmtf5BSuhkl0tkd8vuXqZqhNJxNJWWW1xvidv1wQ3LOmps1ubHAHV7ktu/
         IsGNLPz6ruSgUfB5r57ydj1KkRxgUh+fPDMpyFG2CrSaVA4xssVLPXLHnh6/XwsFTy9I
         UD4nG2+h2i5zZRmTqiVPNg+JloV6zsXJKgudz0kJL/yLYKAsGAqpq7OeObTCBIsOS8j6
         55Yw==
X-Gm-Message-State: AFuF++m4ZP9K4n/mnbCbIguQxqS8pdOu8+LCS27xjR6QGWmPzHMonq76
	xZqEhRH7mUnvbNbl1BeTJ3b05qVNwEgR4ZMrSOZdZe78ZDScLgceor4DonFQJbpaJTHZCYszfgL
	AwJXMumuHKv+1UpCVnbAWS4tucpw4mHpf1p8mRLPk0Otqh3Q1VPtomeD8JuJKkVUeSP+JZm/3Er
	SA1J6UDkoZhQ==
X-Gm-Gg: AYBFou2eU+ts8J/f7EmSV5D2VwZ971YAhTy8jTkc2N0uH5gxTHOPyNRBCxF7hVOlXaD
	Vvsh/m2pm5us/qbd0qGxYY49zEWgAEhhtbtACSPML31CLp2ut87muDQTYm6szVkqpAmD+c+Ex0n
	VMJOOrlk7q1oQ3QXe6rW6Xa+ReQV1N/jd4kSNbwkHg13y5p/723glIlDuDkfiMBN8nsZYkChvde
	nKN83siCXLZ2Pxlrt9X9z9UdqCUswPInSMMVvsdADyKoqFXmy8DNoKkzIF5oo3ABaRI7L4zIcju
	WH0u4EooFIvvITYkkzE4PJqGmws0jA4MxMj4hv6axlbeAsn1gVQHUcrC9zmQZ6SH8Tvtgh5+o6d
	71leOxlkspTOYyX/TfuFlQPU=
X-Received: by 2002:a05:620a:27cb:b0:939:a5a0:4a08 with SMTP id af79cd13be357-939d7e415e5mr995559585a.8.1789121979649;
        Fri, 11 Sep 2026 03:19:39 -0700 (PDT)
X-Received: by 2002:a05:620a:27cb:b0:939:a5a0:4a08 with SMTP id af79cd13be357-939d7e415e5mr995555685a.8.1789121979155;
        Fri, 11 Sep 2026 03:19:39 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm41989585e9.2.2026.09.11.03.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:19:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:19:11 +0200
Subject: [PATCH 03/10] arm64: dts: exynos: gs101: Re-order properties to
 match coding style
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-3-9aa55051c42b@oss.qualcomm.com>
References: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
In-Reply-To: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
To: Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@axis.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5157;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=eKXb5e/GoIqEqZ5JTps8oPDIwB3lwsZ0TqnBeUjcqI8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9WpU6xEGkGCHXzLtJ2sNR7TqoDM9Fdc1vC/6
 e9p1l+YipCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPVqQAKCRDBN2bmhouD
 11KlD/9WSUIupc21oazuvJnXtwPtUaJy4mckG5dc0xZxZC7cA2tYmTEmUFu7mtP0E0z4WZQ/u6Q
 Oz2THHY5nIvRlPX0TijCJL1fGuzeSQ7p4IO0xwFUlnSiY5d8JiBvFwwtC2+vqPji5W89AkRzncx
 f0gpySSnFhXhJ5SchywRJ6cbsbAAq4TBUXkt9rctEKGmxKJToO43DfflrK2qsjq2OK+QV9WWV1C
 2RC0PN4sq9Bhzxz2SqLNzYvVcVKmQdjeoO27sCyVrsmhwgqqGc8qzmafko9lSPB/dv6l5KTu0Ks
 W0IT5B3Dl3WhelLhcSwdOKRldI3MCNRpyBJPMQc5k10JFZZ2DVZfP3GCp8e/WuOORRYcgXYKIXt
 ZL/QMmqmPqc1TEzR9qxH56hy2fqXgVizjC6V6DY+d1phYyxP5rxYgaYWUytLajqOVnXZknF3MJT
 5veoAnyI5F63y+76IgOqHh9q1euCqsRP7vMkTNaoc/Sprz32OpLCXL6i4iPwBu11+1HEEPMYQiS
 ZuEcuGJw5MnqSN6RVj2EvPMzbrD89KTYasuD0Kn4LCCq8iwKg8Wq5KTcuyvwj/4v88zDxtCZG4S
 Sav41v4TkKckGHBqg7uMGAeSluGol2ciKkZwJJR/wYyBDjeH0zeXFwa1TPXPzL6RCUOFgexs6CJ
 cT8o7CaeIm5DdHw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfX0d4nM6TYrqwd
 4AVKlpLvV1k9a8UlmRGMuOTBTc0du8nmRXhr1JgcqGSEJgnqu57a76Y9guz7ZsHvX7R/ohQdGMq
 7Cx5mV/27BrlvLOfSIGDEGjbL97l380=
X-Proofpoint-GUID: HypDUZ2IufwaHOwjRwp8dkWQCv3mn7Eb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfX5s4inY7NWHmr
 Fi7pleAyu4KFvA+rZ7bUrVYg8g+UoSIWlNwQJWAuhnVI7TmF7U2Qm3VN04blK8VCZpx5GCqtZPS
 lP5j4vpf1gzEmaT06PdWiE43B14a8lci0PM/3bJwNYFGCdYLwqLHvxcNLUxyCmu266ONdo8tvEa
 ooaQg2SS6twcyTPPvQCADCZLRhFFoLM1HtvHYliqUDO4HhkU/zK4VnIKNmV+aq71VsFUJ+zE0mQ
 QtJBaqEOZKqZjhi2ElZhOZKA7lne6WVRQ9A/FuWMmGBl4Pj9KNdZ/5IOVG/xo5PLf8IhC709X0v
 NXeCgRJXD4CETGmFrPlpIytwLG8ZXQJkjRF0CnnqDpkPkuuhF7CRRXmDA0efl6HRBglt0TqIoM6
 Dc2IR/JY5fbz1zOIMQe78A9IDckIyIvWDdheCmgDoAOGVSBBauFVIVAFdNNJzKqFsypKxjugT+R
 CBBEFu5ALT0SoCJ+k2w==
X-Proofpoint-ORIG-GUID: HypDUZ2IufwaHOwjRwp8dkWQCv3mn7Eb
X-Authority-Analysis: v=2.4 cv=AfwkjHXG c=1 sm=1 tr=0 ts=6aa3d5bc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=psW9Pzx8GEe-sCMrYW0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_031941_306808_E62CC7AA 
X-CRM114-Status: GOOD (  14.49  )
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

Re-order a few properties to match coding style, as pointed out by
dt-check-style, e.g.:

  gs101.dtsi:178: [property-order] property 'compatible' out of canonical order (should sort before 'idle-state-name')
  gs101.dtsi:530: [property-order] property 'ranges' out of canonical order (should sort before '#size-cells')
  gs101.dtsi:1782: [property-order] property '#phy-cells' out of canonical order (should sort before 'samsung,pmu-syscon')

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi |  8 ++++----
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       | 24 +++++++++++-----------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index a12f2b88d72d..f14c62c8fec8 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -44,16 +44,16 @@ gpio-keys {
 
 		button-vol-down {
 			label = "KEY_VOLUMEDOWN";
-			linux,code = <KEY_VOLUMEDOWN>;
 			gpios = <&gpa7 3 GPIO_ACTIVE_LOW>;
 			wakeup-source;
+			linux,code = <KEY_VOLUMEDOWN>;
 		};
 
 		button-vol-up {
 			label = "KEY_VOLUMEUP";
-			linux,code = <KEY_VOLUMEUP>;
 			gpios = <&gpa8 1 GPIO_ACTIVE_LOW>;
 			wakeup-source;
+			linux,code = <KEY_VOLUMEUP>;
 		};
 
 		button-power {
@@ -109,8 +109,8 @@ &acpm_ipc {
 	pmic-1 {
 		compatible = "samsung,s2mpg10-pmic";
 		interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-names = "default";
 		pinctrl-0 = <&pmic_int>;
+		pinctrl-names = "default";
 		system-power-controller;
 		wakeup-source;
 
@@ -429,8 +429,8 @@ ldo27m {
 	pmic-2 {
 		compatible = "samsung,s2mpg11-pmic";
 		interrupts-extended = <&gpa0 7 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-names = "default";
 		pinctrl-0 = <&sub_pmic_int>;
+		pinctrl-names = "default";
 		wakeup-source;
 
 		vinl1s-supply = <&s2mpg10_buck8m>;
diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index bfceea5486f4..1bf59eae9360 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -174,33 +174,33 @@ idle-states {
 			entry-method = "psci";
 
 			ananke_cpu_sleep: cpu-ananke-sleep {
-				idle-state-name = "c2";
 				compatible = "arm,idle-state";
-				arm,psci-suspend-param = <0x0010000>;
+				idle-state-name = "c2";
 				local-timer-stop;
 				entry-latency-us = <70>;
 				exit-latency-us = <160>;
 				min-residency-us = <2000>;
+				arm,psci-suspend-param = <0x0010000>;
 			};
 
 			enyo_cpu_sleep: cpu-enyo-sleep {
-				idle-state-name = "c2";
 				compatible = "arm,idle-state";
-				arm,psci-suspend-param = <0x0010000>;
+				idle-state-name = "c2";
 				local-timer-stop;
 				entry-latency-us = <150>;
 				exit-latency-us = <190>;
 				min-residency-us = <2500>;
+				arm,psci-suspend-param = <0x0010000>;
 			};
 
 			hera_cpu_sleep: cpu-hera-sleep {
-				idle-state-name = "c2";
 				compatible = "arm,idle-state";
-				arm,psci-suspend-param = <0x0010000>;
+				idle-state-name = "c2";
 				local-timer-stop;
 				entry-latency-us = <235>;
 				exit-latency-us = <220>;
 				min-residency-us = <3500>;
+				arm,psci-suspend-param = <0x0010000>;
 			};
 		};
 	};
@@ -525,9 +525,9 @@ psci {
 	};
 
 	reserved_memory: reserved-memory {
+		ranges;
 		#address-cells = <2>;
 		#size-cells = <1>;
-		ranges;
 
 		gsa_reserved_protected: gsa@90200000 {
 			reg = <0x0 0x90200000 0x400000>;
@@ -572,9 +572,9 @@ bldr_log_hist_reserved: bldr-log-hist-reserved@fd900000 {
 
 	soc: soc@0 {
 		compatible = "simple-bus";
+		ranges = <0x0 0x0 0x0 0x40000000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		ranges = <0x0 0x0 0x0 0x40000000>;
 
 		efuse@10000000 {
 			compatible = "google,gs101-otp";
@@ -657,11 +657,11 @@ trng: rng@10141400 {
 
 		gic: interrupt-controller@10400000 {
 			compatible = "arm,gic-v3";
+			reg = <0x10400000 0x10000>, /* GICD */
+			      <0x10440000 0x100000>;/* GICR * 8 */
 			#address-cells = <0>;
 			#interrupt-cells = <4>;
 			interrupt-controller;
-			reg = <0x10400000 0x10000>, /* GICD */
-			      <0x10440000 0x100000>;/* GICR * 8 */
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
 
 			ppi-partitions {
@@ -1778,10 +1778,10 @@ ufs_0_phy: phy@14704000 {
 			compatible = "google,gs101-ufs-phy";
 			reg = <0x14704000 0x3000>;
 			reg-names = "phy-pma";
-			samsung,pmu-syscon = <&pmu_system_controller>;
 			#phy-cells = <0>;
 			clocks = <&ext_24_5m>;
 			clock-names = "ref_clk";
+			samsung,pmu-syscon = <&pmu_system_controller>;
 
 			status = "disabled";
 		};
@@ -1920,9 +1920,9 @@ cmu_top: clock-controller@1e080000 {
 	apm_sram: sram@2039000 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x2039000 0x40000>;
+		ranges = <0x0 0x0 0x2039000 0x40000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		ranges = <0x0 0x0 0x2039000 0x40000>;
 	};
 
 	timer {

-- 
2.53.0


