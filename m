Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FFF106ACE1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 19:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=abY4X5u7ICIcUlo5VuQ6hpE443JTr5O4WzNv1vb06ng=; b=babwz7WyegBBqZJHIWqlxT7Kwc
	tqdz+jqKJuJI1P3p++akO6614nYyxtpdwz8pOLuRrzt6lkuFuJRo2Ot+HQX+lKO23yQH9zqcC5csN
	iqmIMD4QjatVM3nIsk9vu4t0Id8LeI5OaP4Tdjy8ervLpei6FE3Q5xSWflB26UfJMqhXGTNuGJpxW
	/FS9y+kKCcIemucocJJ0DJ2qwb2/eUVga1FTz3B9lXDknUiq5cATDKmmvitycRXW3doTRH+GO/V+J
	eeE7Up+EBDHrEuLZe62nGunutESwdHWSpEw9t66zqhg7d0S6Iq5vtF869t6Ln2xiinht36xMerCwi
	QbmJCtOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lYf-0000000F3gL-1os5;
	Thu, 12 Mar 2026 19:18:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lYV-0000000F3Up-27yC
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Mar 2026 19:18:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=abY4X5u7ICIcUlo5VuQ6hpE443JTr5O4WzNv1vb06ng=; b=QUuch+QoNlnFu1KrC56fdL/q3v
	IZQSSFzeWwwOgTehyN+Wf3rChq0a1cUOK0r3VaDg4eRlCcEPLelzRH/OLLd8rmBzQt/z+7zoahm36
	VoGdhFp/6aAAhGZe4Pg9Uzy/RD6ukuo3140LuUIO7R3v1ZP5nfCW0Lo3ymB3RBqExlvF1utCxxi5v
	8Hmwj/ERvashj7zMXg2u5USW+8ophbe0xexWbqiD5RkDnsVNFtN28MicesDHT0MbfWLR1kaRkigx7
	stRC3FS/n4gT0i6XZXH+GkUJ0IIPjnVAbh/1ts5InX1ONKL2dwnu6wkhtigB038dIK5TPSk/aTe8U
	gadmybjw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lYQ-00000001r4h-0FQv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 19:18:45 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9Fn4i587752
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 19:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	abY4X5u7ICIcUlo5VuQ6hpE443JTr5O4WzNv1vb06ng=; b=hgH3RvsvjOt4n8/V
	fUanCzM6FZQFo/+wnURym5s5k/glc4Iz49n1zYBZm1AekOSAkCOtEFPnxEHSlnMd
	0vqIw/RLpsGULaYtLErCPxKyowmoya8MTo976N5/f8iDgmxAVWI8QdV4ptm122Rl
	GDEcq7ts8t6yRxIS1i5Zxt81Em2p3IoqHzgSGCDzinEau4DU+wiaKyHcNwlGCB0x
	C1m+uHnCpQU2UmPv9QBNOavbEsgocemEhGyfncqz2Ob+1RX4QSlQ4aDlpCFXZngA
	Z71rBpR2gz87SKc/5w6ow56fBMfmD9jJYWmBApUskKj287QvmAPThObjeIsiL7eI
	t0myLA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh5q3a94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 19:18:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7fc27cf7so730359985a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 12:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773343119; x=1773947919; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=abY4X5u7ICIcUlo5VuQ6hpE443JTr5O4WzNv1vb06ng=;
        b=V9MXuwk3qSvbIK5EnyrP3n3WimWAZD/h4UWGH2MfNnuw8DGOSBwwdW92X5TqZ7jOfI
         t9xrXx4hqXXLjCPUy4Qt8vajAgQ2R2VMIhtgUbUH/CXVThtjDpGEBjuVYjzXCK+ZfLn+
         TBye3q0uEyiH1YHUoAoRqbip7UblumtIelA2RV96C5OnARVIOQQZL8IRGGFlUwlq/+2p
         1hUYMC9QMZxivbxe5tYQMt4Bo2rlnz1WETFyob66TPjCZJYUU+Jlwk5tIMYvlK+oi151
         cFhowaw85/Eb/c+tekXsgwQ51oNyyCPMiXYakXmuoKbOYcYMiA19CjNqWcEXKlGDORND
         hmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343119; x=1773947919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=abY4X5u7ICIcUlo5VuQ6hpE443JTr5O4WzNv1vb06ng=;
        b=JucxPd0RChOvlEk0rAYHMcbMxL+lrnRs2ANPgOwXJHOZZEx+IIKec+7NGzDDjw9d4i
         c3Nff6UJn14lOUHzMN5pdFMRTp0577xEJ+L6+Cu6fyj90pBYEK96oC8Nr0+YE9qeccJ9
         z4c5lJejXkC2P8BJ0vDuwKxguO6RdaVuOP4N9UdriQk1Ixr/SHABeGKKuO08lXFvEP9e
         GSpAXsen2HQ2dmPBTPx0e6GKCSL6iWI+0gMJ2WQyLmhnlxlqSDHKglBeLrA6HMN8HOo5
         QwLQXK19t+Y1fAP2tzkv5kgDRbyGpEzj7Kf+1b6J+Gx7jKW1nnvRTg3YGNM6Octveh6Z
         uZuQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9nG8qRRyk6YeuI35DN0z6MsshDFUgCObgQ0OUsVGmIUSqcPWRi6PYoxqsdllWdj2Nxg32NfTP+Gb/uBttP3Dc@lists.infradead.org
X-Gm-Message-State: AOJu0YyBVCqIv7FVjuY7VT83A54itcWHidXhY7OEcv3hKVpGt0/M+rk9
	QC98iX4ssho8fw9epzMs8io95MACKJy8638NigfUOlvuRlAMw0Uy67ZWd0vVPPYXPb8DLFp5kN4
	ELW/u2Kxto1n2XEJUnm58ua47NL3FJlxjcWrHfuX3keih+tiJ2RMRI0td/UsgMdx7g379Ar5T4y
	eUyw==
X-Gm-Gg: ATEYQzwaWVuYSzRD3KU7u0tzSBOBPqTeg39U/VTtWQrgr2X0UOqYFDkWJkvv+eMRWHY
	6IQuTdet7+a7gw3u9UgmgnUqKGkaSlwmg8av69ndRDhJSRTb0+S2HSGhkjiQEHxi8PaQ9twrST1
	KB2BarTM0jwKWeGVpLRE8W9KSH6w0/NEWJuJ24Y2VzTrhIIZYY9NHI2QB2wQx/ZLUL0CE4ZXeVi
	1nITz7j7EmRgLzdQ5Ue8b6jJzHVwEhgTNjuXWnMUIYPXmcKVq76GMjna/rswWY10ru35U1KxZSj
	ffMEyvKrs0dHf7c3+gYs07Ev6S7ZNkWmkr0UJ5VMAtk5/WgbCUshWTClNd/mdD46NvJ0ALnEZeZ
	Lb+8upOX/cZkSc+u0ZuEa8b9zp3nzr1Id1e9CKZkbVd50
X-Received: by 2002:a05:620a:a1db:10b0:8cd:b644:5ff5 with SMTP id af79cd13be357-8cdb64460d9mr66144785a.80.1773343119203;
        Thu, 12 Mar 2026 12:18:39 -0700 (PDT)
X-Received: by 2002:a05:620a:a1db:10b0:8cd:b644:5ff5 with SMTP id af79cd13be357-8cdb64460d9mr66142785a.80.1773343118787;
        Thu, 12 Mar 2026 12:18:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485577835ebsm1874935e9.7.2026.03.12.12.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:18:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 20:17:59 +0100
Subject: [PATCH v2 12/12] ARM: dts: imx6sx: Use undeprecated reset-gpios
 and drop reset-gpio-active-high
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-dts-snps-reset-gpios-v2-12-0d5040eb4a1e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2852;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=2eJBBKN0/zvfDyAIv7Teb+AvDJL+jlkPxJ4H9aCMwlA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsxFrMte27J6SRtK9+CWbx3Z06eGmGDG+WO3l5
 c/TjNTCwyqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabMRawAKCRDBN2bmhouD
 1wUIEACTssPNQiUCrJej1xy53FJ+Rl+xTZon+RDEzfqwv9hf2EDgUb3RCjRfvZ8SfbNDdk68vV5
 rbhELbPJOi7opn6rvtX1D/uXWswMT1TShxTVmMmPK+aNWQYI4Z4LRDOgSLfzPyxcFHndTYu+jD+
 RCP+NYuV+vE+ShmSckXFL5BnKTW3XWBVn361wa53tf9NL6Sjj1OJGRBSm031yGBLLOV6VYW0w4D
 LCcpAJ+E3jEKQY/rLuF6FewkdZM3aXuDH1sS9j/k78FLv+r0g9R1ba+JLNtWv+FuIXGpx0GrJmb
 8b/i4eqNQwf802adrjXmBRaTFcwL0/Xw/UvRgP/YUUQIxjsUnIPnOR1373sIDhL29Yv6WwsOMIA
 zeS5UZMFnc6HD+tC7qpXRlyM/n8KDzgW9Nsr08mT8Br5VZ9OGvi9VYEtp0BeO/jK8Tfe+c1IqA+
 1vlXPK6tRwgHxlO9+0IF+xgXxn7P/L03ks9J7K/EY0EVUiJw29YwWHZ5QYbumTPq7wxsLvicJyr
 NkFxhCzxz+SKjnTmOb7b/RSeD8DzIPhNrV5lZCjxjL+K2Hg/TqTTw+3OX7t35UBrquX3kdKq5RB
 AcxNBcf3xmd05I+IwQxnDZ5s5XVrq7pFloSzoV7h6wZo2GyTzEylcVKV36lK4TK7Cl1ZmCfryQi
 22vFcWTgYQb5U8w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: oyf86l_DCqNHTT0_X4rj6XagU95nZ8SU
X-Authority-Analysis: v=2.4 cv=CIUnnBrD c=1 sm=1 tr=0 ts=69b31190 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=uXk_wYd1RWWgzoKNaEgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: oyf86l_DCqNHTT0_X4rj6XagU95nZ8SU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1NiBTYWx0ZWRfX/eABQXM7UECy
 IPI/9b3lQ97rdMcu9XkXP7gYzPcj/mgdkhVhp5gOKXMkjoNs/AX6I5ulTlFNT+Nhoa3pksrMmQ2
 QViQiq2tYcM2ZGVymM1rLlMH+wCJUyXoQnj2fucp5hkUmlm1Sju7QUi8tIbv95YWzt8GR/cmaBC
 7wVMeHS45i3bU9nleo/gHuRKfHDhkA8EZYTWT7AExu9ZhS4IsaVlQOn7LSHKtrtbrpckj3xDFZK
 Od/jzSKc1fODRPw4safZaI2Neh1AN14JPyxTEshS0mZS8JXLaS+qsIJAe1UXiAtXd34LvF5a/Sa
 Z4Ed4TVC4HDcntxlUTyYUBhTmSAsyZpqF5nzPZjvNoTMSBQBbnrnzPpGqsz5eTsQmJ4324NDNjt
 G5hhD/Pj7UooBdGh4/9RiSEPP4hRlQHv2UpRhas4wXWHFqaw0G1fQURdPfpRc66YGrLBDrfxi/Q
 AEniJeiNnSTEb0tzkcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_191842_529757_779449D1 
X-CRM114-Status: GOOD (  17.25  )
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

Freescale i.MX6 PCIe host controller bindings, through referenced
snps,dw-pcie-common.yaml schema, already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" which is deprecated since commit 42694f9f6407
("dt-bindings: PCI: add snps,dw-pcie.yaml") in 2021.

Linux kernel already properly parses GPIO active level from phandle
arguments, thus we can also drop "reset-gpio-active-high".

However this change will impact U-Boot, because it only parses
"reset-gpio" property for imx6q amd imx6sq.  Intention is to update
U-Boot to work with newer DTS, but any other out of tree user of this
DTS which did not implement undeprecated "reset-gpios" will be affected
as well.  There was plenty of time for these projects to switch to
undeprecated "reset-gpios", though.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Fix subject prefix
2. Drop reset-gpio-active-high, update commit msg
---
 arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi                | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts | 3 +--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts b/arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts
index 1c1515a854c8..6dd382cffa3d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts
@@ -224,7 +224,7 @@ &i2c3 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio4 10 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 10 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
index 3e238d8118fa..11e8efcc1fce 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
@@ -282,7 +282,7 @@ codec: wm8962@1a {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio2 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie_gpio>;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts b/arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts
index 2ffbe2df4776..9be9ee92018f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts
@@ -499,8 +499,7 @@ MX6SX_PAD_SD4_DATA7__USDHC4_DATA7	0x170f9
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio4 6 GPIO_ACTIVE_HIGH>;
-	reset-gpio-active-high;
+	reset-gpios = <&gpio4 6 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 

-- 
2.51.0


