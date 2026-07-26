Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54776C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 17:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wRPRpR/UEXvdQsqUEO5zDwx48+Dmt+GyHSlx+q/gcro=; b=gduNeBk5Frb9SlotWJX5YBQQP0
	xTXu1jpwakawdQr4kaQCsT2qCX3HAiaEVSAbRTFBdbwEz1T0x6y1iFlkdu9evJfYqC2VCkpvOaMYr
	4mdxafTnRrwCMao4l5uikbJlxE26aQiOeg23z4vJ0Xz2b9lnqhXR0P4lgi8V8racON7hJa4ya0kvn
	VvmVp0V48lVAHnacFEmXCfZj5mXxcHW6TQj6+enz8X4Fh9/zIDoCU/FlPVtjE97sDJGHayb3E3lbq
	EaqKmfiZTKjP8gXFBDUJuqF7LYLMHEv6mORUMSLtTI0Ao5dkzRL1nFgMxVoN+ILWPpyOhtkEgThmT
	tTqyPBBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo2u7-00000001RKL-2XI7;
	Sun, 26 Jul 2026 17:44:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo2tW-00000001QxX-3An9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 17:44:16 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH6tbW1190303
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 17:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wRPRpR/UEXvdQsqUEO5zDwx48+Dmt+GyHSlx+q/gcro=; b=CqXhuqEQlWxLy5Ia
	/+vkEyIpWGvhqVFgHgsnbrbNvyc+Qw2SX8ro+ldlDeJUnEOzvwbmO+HLgX4W7FeG
	JKt3rS35KvNXxMq00Gg+xWU3UgbqvcFZNY0um+6is+lGNuPDi0eLhyQFd0RiDQlV
	d7VXvg7NuC8AKjkkjnpTiPPtDuI4qwxEVI8AuClSkP+ELDq91NCjLrRE9kaS5GGL
	YvqicXTVJr3ecUZn0XsFQph4lS2RDTSUlrq/Hn4F2fhswxKzRMZf+aHUgC042a2R
	eKjpIjjlFUGRD0t8D4ZR3BIz+rSRvTHcfLiuIgqrOejuGPyvF43Cf/agLKHdUd1g
	6hMShQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmjgn3tw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 17:44:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-522de3c645dso43398171cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 10:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785087849; x=1785692649; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wRPRpR/UEXvdQsqUEO5zDwx48+Dmt+GyHSlx+q/gcro=;
        b=ijUmnhlC9mR1jt9bwJyUdgFuFRefV87Rgbn0psTGZfv0TVxu+JtC7wkNadgEhk0JbF
         /NAN1EE7WmkjZKdJX3rz7WsLcBdyXoLhIuie+cdde/xljFNyUG+u55Vsy7UCb9niPSYQ
         zLjZBVQICT65rg4uRAH/j3/snvEht0NV91iCuZo73H78caGIlcntVjKQQGI5CsRZKeAB
         Sic7zLF2mEVjLyaT9bPcsc8JCLh8rpBZpYEFVRFXEbg95rnYlSxWQeKtcWtIzxf4uxlL
         ED6tfZNWpKI+Bh/OPVwtnTcsUMglmGMgeXQdjnRIvh2/warG18SC1VbAvA3hhwKL8EM4
         eUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785087849; x=1785692649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wRPRpR/UEXvdQsqUEO5zDwx48+Dmt+GyHSlx+q/gcro=;
        b=Sxh5MxDloud2nFw1u1W/oWU370zzpjZAOi3JYV7gF5gmMkAUny16e5hTZ0feE+OEmg
         VawjFeMKKDvTdrDn24Q7qNXClhLu7/Sd+d5qluXtJKLcb6V02la/sJzlntMqeegn22sH
         vhmGVCAPqS5oN/3bHb7UgyETdJlxFC5awn+P5SxceVsdmWqSVYkTi+Uv7BtDIeky9CzE
         3To8Is4qcpcp6rgxJ7Pv9MhgmTtrRpRteeiIi3h57e8TC5I4hUMDSSUJCACPPgVnyg4Q
         nVhPN1ciyRimAapvahJK8hwHX6AEYskcJZLIrikYFyk4AouKiwqRcDiy+N/8TH2GCSMX
         DDZQ==
X-Gm-Message-State: AOJu0Yy2VAQcnqFEqdQo7Fjtn6G6XXO9FkNmBzekiZLTV9EHdwnPvOEy
	HoNJ9Xf4ahEmPeNxEbf6tWJuFOotYyHA9hyVegZ1yaqcK/UKPTxbm3P/h6PsL5efWiBDFWCD7M6
	ifb0DH9t2rZx/LyWnXJ2DTNKp6w7ZawErRehd0dknSSw07NV03EaRnYro21uHRUt90nouGK8qsQ
	dPGQ==
X-Gm-Gg: AR+sD132KpbqEvTcBY43u8ChIv7t38vbv7zR6g2sS9GiN18f8Gqa2D0/fIsZn15EnrB
	KttLyUMZdlgKCHd0+wI/XxlCVKs94ThjdBDo2lqI2Uxi2vof6MBcMwwDz2C7QFOMxZr3OyzxCWn
	JOJ3TzyHPVjcKdw+xueNM0u8B6tkOfcd3HC4jG5ypSDmHBZpwCqwzEVsCgUtbrI37JYu42XcWsz
	Y0xHVNMm9g3Zfj7fUaxPR1LvMyFmpSopQ6yon4hJ/T+Xdd+A8P/jeho7lGYhqVcEK+oULSibGvG
	J8a5yEhxgro1jHatYb3qZuQkcZ3NdI6++r0xbIcnePYOVQ1ls+SDBz5CPVkUx76ngvZHtKRpbIt
	vp1V+Nf/x4fslZsnnA6tLap+R
X-Received: by 2002:ac8:7d05:0:b0:517:9f43:4732 with SMTP id d75a77b69052e-529a8382195mr63709331cf.11.1785087849108;
        Sun, 26 Jul 2026 10:44:09 -0700 (PDT)
X-Received: by 2002:ac8:7d05:0:b0:517:9f43:4732 with SMTP id d75a77b69052e-529a8382195mr63708911cf.11.1785087848671;
        Sun, 26 Jul 2026 10:44:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63bd3sm41576093f8f.27.2026.07.26.10.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 10:44:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 19:43:41 +0200
Subject: [PATCH 8/8] arm64: dts: fsd: Align continued properties and add
 missing blank lines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-b4-dts-coding-style-strict-v1-8-e9e3e9879d05@oss.qualcomm.com>
References: <20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
In-Reply-To: <20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7689;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+BnnarzXgrjvsWGAIfKXHLhwNzJRyL+7qFo71+EihXM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZkdPGk3UP3dnXxfQH0P5ccJD9cIkkCbqGt2zO
 y/Vn1do+42JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamZHTwAKCRDBN2bmhouD
 1yH9D/0YgFHyXtxGmIX11k3wKs/H6eZFBi/snTzlh8GGh56dC7zO49DUHWd/P7zZwBKUxHe/qhR
 00xo7fLp9VH4NyPmaUqE5Sgjond/tXhbOYWuwsCDix7wH3UAhwgVQRTzsaLJUx3J9IilG6G92Lw
 84G0eZnlOJYRwZJTfrA5amp5IW0uC6QoPnxVjhO9+DKpj8Cz6TrkmGdgLkk7nx2O45lsxfoQoi0
 FK6bB0FoPgfwkJ+qRfdShuEv2SeEbEd6LHPCFKEc86JhBtV+W4TK8NgCavgig+uq8f2ZIUVnwvB
 Pl3JoLvLN6LFyMPwP4E3B0+SrMYc2Jj1znHcOjiRjEMGnllnvirT6FueBtn1F49q6uE9OH4T9ju
 JSbmc6AB2EDRzc3h5a88BZgOQNu5pn4atnKbPqnKkwF62erEMYZCeqVcfO3GjvFb3AdnlQQG/oR
 nqvva6GEiUKWS80Z6LmiQXK/yVPtqwbbinTz8z4yWGwOiSZO/YenVR2ez51qqV8KjAfmfEZGIkX
 ZZiMYXw1KxBKv31n8PBmhLZm0rDERasDe1X+QvsqvOFyz6SAo2HqHNrR0P7+u/HFGwYzIZiu0Gg
 vwb9DnVYP30BwEnVPzRhXxbThopKN6quFpjerAFiAaThrwi7eVxl6d+V4HcVWrPrxCgOsdMq99Q
 syJrQH/O0HCcZwQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: jRtfL__5N1tqgqQFeu7HZuzmuX63vFPR
X-Authority-Analysis: v=2.4 cv=HMHz0Itv c=1 sm=1 tr=0 ts=6a664769 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=dn6OTeshHBKSxJNNhkUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfXws8CQn2Ovd7t
 Zdm4uIG6fn5LNzNv+0/sYkuLygTA6p81Y1SANk/Uf70fRj970af2LzxKhjf6jfeNPulsWc849l+
 VBQy/p9DzPPUTVWWe/XLJR3JP+as61ZtbfJHhr5HFWVupL+be/VD9T1vk1Z1w2sI+8r30skShUT
 GzcGj9RKK3gydt5lwRfpHgoyEk9K3R55mlp1WxF98aXhxqG6BLtdHg2Mg96eo0KpbGS4zmt5Tqy
 G6daRvmeuJCkIbn0+3iPwYm8Kz7H8nXXZvgemPEpFXrA5JE+a0GpW+vGh5J3a2D6kEjvAWufQK9
 fgn6ujzGUfB01eR7Ar7JQyWumpO6YgMnsMn/Pr/Nh2NL5JRAbiH98iicToOqS53ga97p8ECja1i
 sU1qeJqNuQjeR/ikkg8VZQd1yc93Hrf0N4CQot39ra8mtrbtrhzH7pfvgi10giPj+nmefqk23Ds
 uLr4zFIDFdX2HcE1shg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfX+18u2UALJXZj
 XA528ZghsMMQ+9bNERVB3vmTpJrzu+vhzEaM0r12Bs0NUMXjDZ/Q0E29hKRcnNwP4sOidubOYjn
 B8NH0wiPrY7vmdcgqu+XFIZMomTYYsM=
X-Proofpoint-ORIG-GUID: jRtfL__5N1tqgqQFeu7HZuzmuX63vFPR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_104410_918865_3E5B1023 
X-CRM114-Status: GOOD (  14.10  )
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

Trivial white-space only changes to adjust to DTS coding style and fix
dt-check-style strict warnings like:

  [required-blank-lines] child node must be preceded by a blank line
  [continuation-alignment] continuation should align to column 39 (under < or ")

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/tesla/fsd-evb.dts |  2 +
 arch/arm64/boot/dts/tesla/fsd.dtsi    | 97 +++++++++++++++++++----------------
 2 files changed, 55 insertions(+), 44 deletions(-)

diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
index 73b6a25e0e4d..503abe52a81c 100644
--- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
+++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
@@ -53,9 +53,11 @@ simple-audio-card,dai-link@0 {
 			cpu-0 {
 				sound-dai = <&i2s_0 0>;
 			};
+
 			cpu-1 {
 				sound-dai = <&i2s_0 1>;
 			};
+
 			codec {
 				sound-dai = <&tlv320aic3x>;
 				system-clock-frequency = <33000000>;
diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index 214d33ca7177..6766c78243a3 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -43,12 +43,15 @@ cluster0 {
 				core0 {
 					cpu = <&cpucl0_0>;
 				};
+
 				core1 {
 					cpu = <&cpucl0_1>;
 				};
+
 				core2 {
 					cpu = <&cpucl0_2>;
 				};
+
 				core3 {
 					cpu = <&cpucl0_3>;
 				};
@@ -58,12 +61,15 @@ cluster1 {
 				core0 {
 					cpu = <&cpucl1_0>;
 				};
+
 				core1 {
 					cpu = <&cpucl1_1>;
 				};
+
 				core2 {
 					cpu = <&cpucl1_2>;
 				};
+
 				core3 {
 					cpu = <&cpucl1_3>;
 				};
@@ -73,12 +79,15 @@ cluster2 {
 				core0 {
 					cpu = <&cpucl2_0>;
 				};
+
 				core1 {
 					cpu = <&cpucl2_1>;
 				};
+
 				core2 {
 					cpu = <&cpucl2_2>;
 				};
+
 				core3 {
 					cpu = <&cpucl2_3>;
 				};
@@ -456,13 +465,13 @@ clock_imem: clock-controller@10010000 {
 			reg = <0x0 0x10010000 0x0 0x3000>;
 			#clock-cells = <1>;
 			clocks = <&fin_pll>,
-				<&clock_cmu DOUT_CMU_IMEM_TCUCLK>,
-				<&clock_cmu DOUT_CMU_IMEM_ACLK>,
-				<&clock_cmu DOUT_CMU_IMEM_DMACLK>;
+				 <&clock_cmu DOUT_CMU_IMEM_TCUCLK>,
+				 <&clock_cmu DOUT_CMU_IMEM_ACLK>,
+				 <&clock_cmu DOUT_CMU_IMEM_DMACLK>;
 			clock-names = "fin_pll",
-				"dout_cmu_imem_tcuclk",
-				"dout_cmu_imem_aclk",
-				"dout_cmu_imem_dmaclk";
+				      "dout_cmu_imem_tcuclk",
+				      "dout_cmu_imem_aclk",
+				      "dout_cmu_imem_dmaclk";
 		};
 
 		clock_cmu: clock-controller@11c10000 {
@@ -499,17 +508,17 @@ clock_peric: clock-controller@14010000 {
 			reg = <0x0 0x14010000 0x0 0x3000>;
 			#clock-cells = <1>;
 			clocks = <&fin_pll>,
-				<&clock_cmu DOUT_CMU_PLL_SHARED0_DIV4>,
-				<&clock_cmu DOUT_CMU_PERIC_SHARED1DIV36>,
-				<&clock_cmu DOUT_CMU_PERIC_SHARED0DIV3_TBUCLK>,
-				<&clock_cmu DOUT_CMU_PERIC_SHARED0DIV20>,
-				<&clock_cmu DOUT_CMU_PERIC_SHARED1DIV4_DMACLK>;
+				 <&clock_cmu DOUT_CMU_PLL_SHARED0_DIV4>,
+				 <&clock_cmu DOUT_CMU_PERIC_SHARED1DIV36>,
+				 <&clock_cmu DOUT_CMU_PERIC_SHARED0DIV3_TBUCLK>,
+				 <&clock_cmu DOUT_CMU_PERIC_SHARED0DIV20>,
+				 <&clock_cmu DOUT_CMU_PERIC_SHARED1DIV4_DMACLK>;
 			clock-names = "fin_pll",
-				"dout_cmu_pll_shared0_div4",
-				"dout_cmu_peric_shared1div36",
-				"dout_cmu_peric_shared0div3_tbuclk",
-				"dout_cmu_peric_shared0div20",
-				"dout_cmu_peric_shared1div4_dmaclk";
+				      "dout_cmu_pll_shared0_div4",
+				      "dout_cmu_peric_shared1div36",
+				      "dout_cmu_peric_shared0div3_tbuclk",
+				      "dout_cmu_peric_shared0div20",
+				      "dout_cmu_peric_shared1div4_dmaclk";
 		};
 
 		sysreg_peric: system-controller@14030000 {
@@ -522,13 +531,13 @@ clock_fsys0: clock-controller@15010000 {
 			reg = <0x0 0x15010000 0x0 0x3000>;
 			#clock-cells = <1>;
 			clocks = <&fin_pll>,
-				<&clock_cmu DOUT_CMU_PLL_SHARED0_DIV6>,
-				<&clock_cmu DOUT_CMU_FSYS0_SHARED1DIV4>,
-				<&clock_cmu DOUT_CMU_FSYS0_SHARED0DIV4>;
+				 <&clock_cmu DOUT_CMU_PLL_SHARED0_DIV6>,
+				 <&clock_cmu DOUT_CMU_FSYS0_SHARED1DIV4>,
+				 <&clock_cmu DOUT_CMU_FSYS0_SHARED0DIV4>;
 			clock-names = "fin_pll",
-				"dout_cmu_pll_shared0_div6",
-				"dout_cmu_fsys0_shared1div4",
-				"dout_cmu_fsys0_shared0div4";
+				      "dout_cmu_pll_shared0_div6",
+				      "dout_cmu_fsys0_shared1div4",
+				      "dout_cmu_fsys0_shared0div4";
 		};
 
 		sysreg_fsys0: system-controller@15030000 {
@@ -541,11 +550,11 @@ clock_fsys1: clock-controller@16810000 {
 			reg = <0x0 0x16810000 0x0 0x3000>;
 			#clock-cells = <1>;
 			clocks = <&fin_pll>,
-				<&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV8>,
-				<&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV4>;
+				 <&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV8>,
+				 <&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV4>;
 			clock-names = "fin_pll",
-				"dout_cmu_fsys1_shared0div8",
-				"dout_cmu_fsys1_shared0div4";
+				      "dout_cmu_fsys1_shared0div8",
+				      "dout_cmu_fsys1_shared0div4";
 		};
 
 		sysreg_fsys1: system-controller@16830000 {
@@ -921,7 +930,7 @@ spi_0: spi@14140000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&clock_peric PERIC_PCLK_SPI0>,
-				<&clock_peric PERIC_SCLK_SPI0>;
+				 <&clock_peric PERIC_SCLK_SPI0>;
 			clock-names = "spi", "spi_busclk0";
 			samsung,spi-src-clk = <0>;
 			pinctrl-names = "default";
@@ -940,7 +949,7 @@ spi_1: spi@14150000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&clock_peric PERIC_PCLK_SPI1>,
-				<&clock_peric PERIC_SCLK_SPI1>;
+				 <&clock_peric PERIC_SCLK_SPI1>;
 			clock-names = "spi", "spi_busclk0";
 			samsung,spi-src-clk = <0>;
 			pinctrl-names = "default";
@@ -959,7 +968,7 @@ spi_2: spi@14160000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&clock_peric PERIC_PCLK_SPI2>,
-				<&clock_peric PERIC_SCLK_SPI2>;
+				 <&clock_peric PERIC_SCLK_SPI2>;
 			clock-names = "spi", "spi_busclk0";
 			samsung,spi-src-clk = <0>;
 			pinctrl-names = "default";
@@ -973,21 +982,21 @@ timer@10040000 {
 			compatible = "tesla,fsd-mct", "samsung,exynos4210-mct";
 			reg = <0x0 0x10040000 0x0 0x800>;
 			interrupts = <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&fin_pll>, <&clock_imem IMEM_MCT_PCLK>;
 			clock-names = "fin_pll", "mct";
 		};

-- 
2.53.0


