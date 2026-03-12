Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EF3106ACD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 19:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSnYdF3yntUL3R56pQlGX4piuC29cFagEaWXPmDySlM=; b=hsQykPhRRRskvdfqYdaI7ErSsn
	RdZ/sx8kXpv4+SL51hf2neWI+K37R9/NKsBY061IF+wB8LaxMKhV4uKPbPY82G7Qc9fMoYtPjbI0I
	WHOsJVsR6g46+3ihtOO6J4A5Kv5U0PWRXUJNHrNtpnqcgElUnvzkSJnTBCcfBSWxyq7ariaMa/nc8
	EPAgnqwXSoVse4N6lAYtGlRMgSYOabsLZ4c+7jwFZq1AA1kW50frhki66i0qqK6MNjIgT0D30lDDJ
	nw1Bz5a32vrzBYc8fPYl5Ly2eXzcQQphNhht+4PhR/zb2Is1ypzip5rd1HoMNVro4m6QsqqSSEZER
	qbAhEPzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lYe-0000000F3dg-0IvH;
	Thu, 12 Mar 2026 19:18:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lYP-0000000F3KB-1ZaB
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Mar 2026 19:18:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rSnYdF3yntUL3R56pQlGX4piuC29cFagEaWXPmDySlM=; b=hbCjKI+irHPZqSeRBvBCsXrJGm
	daGBADAlJ/tGIPuVxyB5kLvpQ60LhHIj4V5aQ+ovnbNEK2Fwd2LiJ422lMIjzJ0Nk0+NLdaUa1pOV
	PbAo4XzDPbH1AGn1cnmlqdV3mZShjp+jPAt7d/Txy5BbMqonmf7U2tBKw2iDWj26xu04BSIQQmT2L
	N2ezW96cbrMTvXbLF6+tVWb5qjVLPpQMrAMJOyFiBuPs8SIYDlWT1vT6+X6FU1CW+obcccWP9OKKT
	JPqhou6jtee+8ZDthEcZPFDYyKyCsPIlJ0MoFSKCYMbfP9jItyzG20lGvxroHB7D0hq4sH+RNDEEl
	5rBMwkEg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lYK-00000001r2I-2WxZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 19:18:38 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CHrTKs4025739
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 19:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rSnYdF3yntUL3R56pQlGX4piuC29cFagEaWXPmDySlM=; b=Sigd0/Hwn4YpZphM
	y6JWCPs71IXZNOP0msv4dWcnkTfVqK8wBSJHbTJby31zvg4UUy6l6siVEp/iI0M0
	KerkldPRVI9F4gMU7wsTmy+d5RoxoqPhV6//W01SslJKXFRAc6cVszs3l550nOC1
	GXSj7vVWdaicUchVeDYSPnbCZ2VkcHPPJ7En0WFdbWQ02PJVNqr3ofq0l131qpS2
	E/46rBpGksEy6shAPv6RMz0ZbaMp3j3MMdoXyBH4IQD8rxGlyqqJ0tebVsB0GyVK
	+y4DPsrDq+MPkWlWQrIxqKGAPt5NMCXFuOydsddrtKuK7ini4KZGpwjJj7jr/7kx
	8sAcQQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh50u8yw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 19:18:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb6291d95aso1364359885a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 12:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773343112; x=1773947912; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSnYdF3yntUL3R56pQlGX4piuC29cFagEaWXPmDySlM=;
        b=XutcXMSeaRJYtxo9ahlaMN76P0HCVcmI/aqWgT1T905Ac3qDHe0Tw3WdrwWpL3+TsU
         UioXzoNdnCwaFcSGbLzzgt5UWqjtynRcA2zoCL7ctxyQ8dV24uICHPXm+YPuNppfHM0W
         f3xyP65X03pOZIXu11J35lgMR6EdopqDujFrqU2xr3ugyD2ozN4Wg1hoqwjhMBqVHJEn
         QfM7WZrXrj9qRH2UFiUbssv9o8xgSxEI5M8MwryAj9GoxMv+DZfzYg8EfKIvDETrreus
         3TH5VAePzWT41hmBvWd0XLzCmbomYLnBLBnnKxYSP9vmd3MIrRJRbLnYWnObIe1suEMo
         xsCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343112; x=1773947912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rSnYdF3yntUL3R56pQlGX4piuC29cFagEaWXPmDySlM=;
        b=OgBC1Y4N81mRisoVNtkAIUNRhRhCdci2u0z16pB4VvcSvgxPf6QyHVPZhBudimXk/g
         LnREKG6K4W0YGCXrHoKuSTJC0qMyjVbMAZztXPUrsMDY+YtDPZMDJLAoCvR0H1lKcS1Y
         uTQy7Nn/RWXsSH1O5fROsGGkILjdB9dqDsL0RVSYVtSzHdqR1KYGnYp/rRsCXAKntdF0
         ms+jpZOu3JjulyB7gq6PSjA+951aCPdn+qDT5+lqtE01pQBllRh4KPi/9/PxVLX4mbZm
         s2dIX/Rs5c1bxYxOZCImCCK/mcQegkWC9p5ZddrrgLZ6wwmfbllyHLZPlr96pZJKKTju
         TGag==
X-Forwarded-Encrypted: i=1; AJvYcCXbzd0u5r4BHCVbmADFyFz0b1MqwtCVI59onmTLVLhBJLpzF+xvRk0jnpVwEOCP9pbfFyLs82osRjrDfMU5fieD@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg+XbtrTNDdAW6HRjXrrvcjQX2BiPjdumHpHmMv2dpDmFfsGTb
	lVirfx4hQXJC/fefoRPkNPiwRo5obe/o5YWUG2ushDaPKxAPlnbP991IAAtnohliC3RNZoDtWNY
	Uq29o4dBxiO3kkbx5iR4n3QS+nF+fZAZxkULckL4woQbIqbuRFOW/U+/m7Tsr6lviRixIaGsyIk
	+5HA==
X-Gm-Gg: ATEYQzzx1F+gXRzBAckoC3oE5LG2ueWX5ZDC9zavUdgqKAoQdAg6kx9VMEl0RQb/DFa
	+mh2jPAWWirpREmeme1e5JHeW9b5l5wpwtdyZXj3WEqs3IJWz3WS1vEfK7H2DODvD667khZkJPi
	S/yc+uMUi7jfExlouL9vkUzTpK97BMOiekffwR6Irvdhb0q05SOTG0IdSaGgNpghkMpodqzi+pg
	9ySB0hICHhlS4o62onzYldXeVoErEuA27DZBpaV5Z3Gf2nskgdIedKvquNybmPaaN1ev3zj+YIl
	/ldx5AinmYEzAJIEzzRa6SYZZmhegoqgBow/2LxNBeysL9FDd2ULdORl5dTqhUmFhrHGpn2xCvp
	vat4i9sZMsfUZy6JXcx/YrtcmELqaXuLLW+VmL8NJNabH
X-Received: by 2002:a05:620a:4081:b0:8cd:79f2:dc48 with SMTP id af79cd13be357-8cdb5a9751bmr131726785a.28.1773343111780;
        Thu, 12 Mar 2026 12:18:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4081:b0:8cd:79f2:dc48 with SMTP id af79cd13be357-8cdb5a9751bmr131721785a.28.1773343111273;
        Thu, 12 Mar 2026 12:18:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485577835ebsm1874935e9.7.2026.03.12.12.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:18:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 20:17:57 +0100
Subject: [PATCH v2 10/12] arm64: dts: imx95: Use undeprecated reset-gpios
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-dts-snps-reset-gpios-v2-10-0d5040eb4a1e@oss.qualcomm.com>
References: <20260312-dts-snps-reset-gpios-v2-0-0d5040eb4a1e@oss.qualcomm.com>
In-Reply-To: <20260312-dts-snps-reset-gpios-v2-0-0d5040eb4a1e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4317;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mQhGzCxvs3S3GUmcWZM7b/t2cMqdUR1t3CGSawFbijg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsxFpECtLe4fmQO3jsGZ5daSUkWr9nLat9a3vr
 ylRqvkBJlqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabMRaQAKCRDBN2bmhouD
 1/pqD/4zt45RTWOxkdx6kNYSDqz1Ilg6uzpxgtNeflvTp8ahw7W3nw+qZO/ShDEK1kN8J+0aTcl
 YODqsk/KHnKG9bLXoIWKiiTXTKhU9uyeQYywBX26E+bjndpq52wPUyKsJB7Jj1ZXtn2h7NJPndj
 DA4YzYS6qbhK+yBeKiHrcO9STLNVT6P47QYWjqfZwPiQRiZhTTS/MOJy6RW1Z4a0Zaxa5L2hLL1
 33S5XKErzbmIUT6H0xAUQUx/CWzWETPR8eJbqaWRz+YaEmoVHH3t90tVIWKcKz6R1qrF3B0pwVn
 QUi/Z8/MeShwVyHyw0uRiuUtNdp1yPpdIrH3Yn5USmIhJguzlgdWfv62lDlNZqztejqmVv+2Zoa
 mIUTAktIhCJEmcqEbHtU6NkepgsK875dXG2DEAhQcyoCJCL+r3tU8Z4+fRjod/Ds6LoT0Tn+Maf
 3Sfs6hWqQ+ahQuiFAGIOk9ZDtp3yuHOXKTItxcwD4wa1kqpMf9sLc7ihandIsUNUJVQjBBmH2/J
 /2yQlCN64SQXL4Q7L0IJWRHXihxXLOpcNeQogzmwJPPZP6ybv3GtONQaWBAsw91nvMThA050AbJ
 GTrfl4A9BJyj0DVxShb/+w9gx9g7p1m/Bbl3DW2TH9JmIOldZZjmRE4itUDVY78o+iVB4gXZgRg
 qfYn5jbDD5wpm6A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: d6Y58h-FMiQ_dGOfq-WooMS-7nGom-E6
X-Authority-Analysis: v=2.4 cv=LvKfC3dc c=1 sm=1 tr=0 ts=69b3118a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=jGA75YajJU-kK98SflYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: d6Y58h-FMiQ_dGOfq-WooMS-7nGom-E6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1NiBTYWx0ZWRfX71EKcQp8aIAY
 NvxbIfXHUKtS0dTl1FfWRBHkduvTk3ozO+zTWJ/ffJSDXjFIpg9ryNbpIgL6gqdskGvXOkSJWRE
 nsVfGGepOEe9u0qM2WToRZjwwer8Y9FkSnR8/D0AOF8FiiO+staxR8LpHt/O232H6LpsZGKVLDv
 o9QBdSAJifUOGxZcFzxTAhbLYwc+OqmWU379A/6AY9iLLp6excYbtp2cTjF+XnXd8SYqZ7wWgio
 yMOAWH28m6bk/JUEm2ssz67NtW8VWsG1f3DqJcBxzxOaESaWcv+PDeNm9409JcprvgYhnrrd75A
 Vg8JxbSJhbBpmlETusYNivBVgckH7w0kQ/r8CZ1TaNsJGN8XJb36iYjrJ1Wm3FiF6gBRzo5rXn/
 lBHoK6r0xBpZIPJsuMdoGnaRZS7Y1sQcUHTmqjCwlPOC0P1xojJX33RUQcSTX+6TnQjV1dgaTqW
 McrnH6t6f+pEuIYKAbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_191837_197867_53C05A39 
X-CRM114-Status: GOOD (  16.01  )
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

Freescale i.MX95 PCIe host controller bindings, through referenced
snps,dw-pcie-common.yaml schema, already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" which is deprecated since commit 42694f9f6407
("dt-bindings: PCI: add snps,dw-pcie.yaml") in 2021.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts        | 2 +-
 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts       | 2 +-
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts        | 4 ++--
 arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dts | 4 ++--
 arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dts   | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
index d4184fb8b28c..d0f2d3beb72b 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -554,7 +554,7 @@ &netcmix_blk_ctrl {
 &pcie0 {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	pinctrl-names = "default";
-	reset-gpio = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_m2_pwr>;
 	vpcie3v3aux-supply = <&reg_m2_pwr>;
 	supports-clkreq;
diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
index 0f43e3be7058..7a615b1f6199 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
@@ -549,7 +549,7 @@ &netcmix_blk_ctrl {
 &pcie0 {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	pinctrl-names = "default";
-	reset-gpio = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
 	supports-clkreq;
 	vpcie-supply = <&reg_m2_mkey_pwr>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 041fd838fabb..4439658681f0 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -540,7 +540,7 @@ &netc_timer {
 &pcie0 {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	pinctrl-names = "default";
-	reset-gpio = <&i2c7_pcal6524 5 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&i2c7_pcal6524 5 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie0>;
 	vpcie3v3aux-supply = <&reg_pcie0>;
 	supports-clkreq;
@@ -557,7 +557,7 @@ &pcie0_ep {
 &pcie1 {
 	pinctrl-0 = <&pinctrl_pcie1>;
 	pinctrl-names = "default";
-	reset-gpio = <&i2c7_pcal6524 16 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&i2c7_pcal6524 16 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_slot_pwr>;
 	vpcie3v3aux-supply = <&reg_slot_pwr>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dts
index 2b0ff232f680..1f2240bd21f8 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dts
@@ -305,7 +305,7 @@ ethphy0: ethernet-phy@1 {
 &pcie0 {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	pinctrl-names = "default";
-	reset-gpio = <&i2c7_pcal6524 17 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&i2c7_pcal6524 17 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie0>;
 	status = "okay";
 };
@@ -313,7 +313,7 @@ &pcie0 {
 &pcie1 {
 	pinctrl-0 = <&pinctrl_pcie1>;
 	pinctrl-names = "default";
-	reset-gpio = <&i2c7_pcal6524 16 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&i2c7_pcal6524 16 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dts b/arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dts
index 26c2df9b1b60..99ce38df4538 100644
--- a/arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dts
@@ -243,13 +243,13 @@ ethphy2: ethernet-phy@8 {
 };
 
 &pcie0 {
-	reset-gpio = <&gpio1 10 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_vdd_3v3>;
 	status = "okay";
 };
 
 &pcie1 {
-	reset-gpio = <&gpio1 14 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_vdd_3v3>;
 	status = "okay";
 };

-- 
2.51.0


