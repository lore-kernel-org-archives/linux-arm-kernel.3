Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F371125850
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 16:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQ1VKYj6/MdhUSvHYax9UhceHrIKeZjpSOhtpE6EgXU=; b=WcBgoQdhxm/yKzU7fPrcN/o71W
	fjcUJjV00fEnnYSP69Q69rXR2rBYjgnNyCpQ/7/uHUJejtnDyq6WHroncJlA6ukq8l4JJG0nCiSbX
	HDo4EtLd5so6uOP+16arHXyPcuJK+2hcAzvhvHblBa+M5OYkJW2Dc78jPKAe9qJ5Jv+hRhz0BEaJU
	nAVc8f4LePBvnvaCva9M/hVa1esgedq685u0FKDi6lJw0RokZXQ8cI39xbvKIYJA/5VS8H4TTQECh
	8iD19NzlirxT74IKd2CZFOT0soQcVMWYmWrCI/Nj4wO3MNX0RtWzqRNjSmJNqtpvrQeQHFltY1Hdf
	/rHFFEqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0M6w-0000000BsT8-0b8T;
	Wed, 11 Mar 2026 16:08:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0M6r-0000000BsP6-2EOQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 16:08:34 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BF8VjZ614327
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aQ1VKYj6/MdhUSvHYax9UhceHrIKeZjpSOhtpE6EgXU=; b=XUBrRgNy1MTEe4i4
	ugvwGZp87T9kbpSD5/b5vWI5szxueilAJ133MoONPZTwElCm6NX0CUAFEtcKDxfe
	rdthRp0QcQuStVTADMK02f1ISM+lDxrvToN5HpR5P4iVyfimRhBXKqts0fE8+x/0
	jZroZ2AsCn8NSgpYf1jrYeyEVSsNwygz/wpdFa3C/OTRsooE+BuxJdA3dbO5O4G+
	FW3qe8h9e4xPZKAnZNiOkylh1fwUeBUNrCH2u2onzjtwr2bbSpqesgKwtgqBmanl
	9YaGWVU8XrPMdzIv+lTUGFTJH0WLB4Ly1+wqLnGpRxuGEInoUmE7MWQWD5o/gqZy
	6bLEUQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu0jf2rbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:08:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7de0e161so2400281585a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 09:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773245312; x=1773850112; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aQ1VKYj6/MdhUSvHYax9UhceHrIKeZjpSOhtpE6EgXU=;
        b=LEvkggFme/wNobLrrDgi8XpqeUliTGz6JJhzcDN/75erxvEPsBaZD7Ao5cwq6Oa0mc
         ay5YZbcF60BraqWSlPYQar5St5Xm8H/i0eJFx/i9ZH9fRtxbxdvsRzZuPxeT385S+2jT
         f5pwjPTpgf9BFaEkmadJgTDO8mbMiwjj2twhqEnMPCGW9ObtQ/Nw10e+AFlz3GGiR84Z
         inmAGwZxtsOGiCckbdb+dwfE0dWBxp5p8tnsahXEOMOtuNhVUR2oZGU9bzmAfvuKEhuH
         KA+4E3munNxgbrBLH8V5drQtTUtCaFO8OE8+qkRoUccOYeHwHEIYaw3MseqNdC5YdqCM
         9Dvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245312; x=1773850112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aQ1VKYj6/MdhUSvHYax9UhceHrIKeZjpSOhtpE6EgXU=;
        b=p2CQqJqlPpIg2knKl9UyGPs+1lxIaQ9rNz7p6+1JoZSERb4vR9vE+Otp4DiWfdq1/Z
         ve11adkan6PMRNWL1rEAE3VLvAOddybFhTtwmeOaB5MDrBjeolqOQnMcGcJWpPEHYzAJ
         lsCYcdf9oCCwsCC4sUMFGtP8URzHtAJ9MBtuZ7r2Gn+Jrh9MFA8RUhdbqezGmNQa8qH3
         W91x/yx1/ZzYyrDJRNwwlh9zmshYzFd0B4hR0IaUlB7ibNaLQg1gbuisC+uMdUMFIs4C
         hAAQnmyTpqTagPw7j/v9P46KQv2ltJHIZ6wwT9Whkl2E1aSwgEnJWvURw58M0h/+O/v4
         8kXg==
X-Forwarded-Encrypted: i=1; AJvYcCUvIpxzMPOzLs/34JKWsBYSDD0Q0ARI6K/MK/1gDKMYIhV5S13GicOf2TLslqgwuI43CYocyPQk7Izcb5/URgri@lists.infradead.org
X-Gm-Message-State: AOJu0YxM1z92kOFzLhAzpIij+ZDng5HMbaESlrzWGx1yZm7Qi7bUDhhx
	TN1px1olivMJZvMEODji2AQSvlGmbFdUWFTNCarlCClIV2W4RIZ7TKE3UXcrdXuRL1KjWtC7zFl
	KD9et/qgGSkINXtpFm/438dQwUd7SOVHMDrecNxEyXKLSupbM0SAodh1wPitMa28MR+WIMGhbfK
	DCFQ==
X-Gm-Gg: ATEYQzw7vJiNYaDmzIh26VTgWZFg82kgCzDNWYnFn4kDOc9F3r+W9E5WvdEzCV+XIFD
	MxQfRmU86tN+KijlPfu6wLG0VbZfXP9/EMLnHJVfDnQGtcQu0pnHuPqpJz1P/3uBb/PJ6xEJ/up
	oCq1P6Akf86cLfeprVAXhefW3JM0fm5vCmXv3cOmpS4VG1GV6WQTCE1Oe4eDftm8qOAg6E0jXGf
	UlchkwjAIypc5b3EYvgCNx5poX0/u17EHyEEpV9kI3Y7VUuzXbG0OoEmfd54dmrU4DmO53T5Ac/
	epaaIHX8EACKxpxfzsMtZkmpazqREwC2aDPF9ysTuGZqvR/f0gbYMCRdTCpbzn1ifHzPyFkxjW5
	U6Audkcp43Pa3oyieJhkT4PwTJQ+egq9+2QsiaB5w8zyE
X-Received: by 2002:a05:620a:290c:b0:8cb:4c:3ad9 with SMTP id af79cd13be357-8cda1a8a5e8mr382042685a.80.1773245311960;
        Wed, 11 Mar 2026 09:08:31 -0700 (PDT)
X-Received: by 2002:a05:620a:290c:b0:8cb:4c:3ad9 with SMTP id af79cd13be357-8cda1a8a5e8mr382035485a.80.1773245311331;
        Wed, 11 Mar 2026 09:08:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1aa2c3sm184711f8f.13.2026.03.11.09.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:08:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 17:08:02 +0100
Subject: [PATCH 06/12] ARM: dts: imx7d: Use undeprecated reset-gpios
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-dts-snps-reset-gpios-v1-6-ea1cc09fba84@oss.qualcomm.com>
References: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
In-Reply-To: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Marek Vasut <marex@denx.de>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@dh-electronics.com, linux@ew.tq-group.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1487;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=baLse7Wisy0ajVq7VAF1W6Q8rnqwQnJ0swQxre94YJY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsZNjGBIhOlV1H6GwnXQb4z7BUJr2Spz/02Iv8
 47oyFmsyUmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabGTYwAKCRDBN2bmhouD
 19KfEACDYpmDpcRiNffKmElW/1AumXhkqMDEsjZtblf0vSF5jCQutVoGcsHEEC1RnVfQVBdDBOL
 W1DRCCZMWzequ7h7NOxkCaHllg4fXTgYuG100z/2swIehPEfgB30j8eWD8VX6hs+uMqYb4qHAL9
 PK+d2COdKkgJxydxqEUjEeCV6QIGjQ0K2LLLj2z/jk2qHqNljF0iPAsOj731NSdPXbzFoISpRPn
 JPt90u7yGkwCjt6g7lsO6iw1tIA5fELc+1/zidEsv8zyvWuBgZDzF4witwRiltZ71fhYoWkS9va
 sKIJgeNEbY+xjzGTV2rFdvIdZPG99nkABiKJqTw5aqJxvWq6VEk2k8ggylGTB0Yj+x9igc0qZLQ
 Ehcqk8DhAsge715UEwaLUdeX9gpkvPA+FZpA2MAcwoQ/sT3K4nJCkBEAxikNtGHOAk/Viz2NziX
 5HR2iZiFmQyjU1NRYTawjbaOssYdo7ZBa0/kd9pN+LK8/WIAejGH+5AcUfTivg/dUK+TiFzMbsr
 xQlAaYhxdcFzwhqh5HenSDAo98auuT/6wA6z909G31J0kbePaHeSZtFCLUvdyzm/XYzMm1456Kl
 zTHgq1+8HYRsOQyIggDAcV1Jj38As5hsapeYCx020A9NTNCspomFtKR2kvNp1XNCSCBosVAxcCP
 +T9MzMaHCrBhgHA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: mdGn0gcbJRy1NE2M8ZEMNNUygAMMPsbW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzNiBTYWx0ZWRfX0KdnRRuhMcaP
 X6YeP3TNOb0LoK7leLifRnPCpPiFAOXiruee0bgMSgvnuEZxvgUEbmR4mb0hpdhUtPfAfQbJohh
 PQDeZy9N8TAD+tLkzTZMq0gmLfUPV71C6AtFAYhJrCspV86MDFHFS1Vcd3VmrvTY/s5duBEreW0
 0DpEbEM7R2VL3JRtwHTYygH/eIcNqZufWFrzxj7OXCqrcUOVPlgVKTOxtODsGq6/zqSPu3xizW0
 v0ADSc6Jl/ftAUeqMO8ouvjUDbPz9nE5kFdEGr7E3uDenLBOGIxyy+8peTLV5cz27MLuNxd2680
 5vLlOFkKPOJ8M5UnjlcAw6W0U9a9HuGY6Tc01cw5XvnAP8mZbdBU1JxoOMtZ2WHtWWRyGnPUwfX
 0R1A0/secUKqxWB2wJQCya67tMeigQ163yzX6+K/k4fvtLK/RsUSOEGPMfvWwTiZ+JUiGZWWicZ
 4kzQaaOMiHq12eIrHQQ==
X-Authority-Analysis: v=2.4 cv=FMMWBuos c=1 sm=1 tr=0 ts=69b19381 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=BBuWd3GDwlF34hjrYEMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: mdGn0gcbJRy1NE2M8ZEMNNUygAMMPsbW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_090833_600375_5BD8F23B 
X-CRM114-Status: GOOD (  15.88  )
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

Freescale i.MX6 PCIe host controller bindings through referenced
snps,dw-pcie-common.yaml schema already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" deprecated since commit 42694f9f6407 ("dt-bindings: PCI:
add snps,dw-pcie.yaml") in 2021.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts | 2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts b/arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts
index e3ee16f1aaa9..a5fc7f80f651 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts
@@ -122,7 +122,7 @@ &pcie {
 	/* 1.5V logically from 3.3V */
 	/* probe deferral not supported */
 	/* pcie-bus-supply = <&reg_mpcie_1v5>; */
-	reset-gpio = <&gpio5 12 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio5 12 GPIO_ACTIVE_LOW>;
 	status = "disabled";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts b/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
index a370e868cafe..ab7cabe5552d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
@@ -456,7 +456,7 @@ display_out: endpoint {
 };
 
 &pcie {
-	reset-gpio = <&extended_io 1 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&extended_io 1 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 

-- 
2.51.0


