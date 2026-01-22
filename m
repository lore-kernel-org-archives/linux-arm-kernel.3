Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A0CC44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/UfWtw5ZQfseqhZRXzgqUeaU3ggF8Gp/sL3W86n7mc=; b=FEUz1ffzMzh6+2E9AuQYNaLJE/
	iMt2WPa+6iKkB4dhSJzOmX7erZYd9b17L1NSIKxHsHSY2ktKKtXAIONOdF5cnkrlCIRptWd0DWRH5
	GbRpwEEjJQj6ogPj6IWU/oX91Ipd7fVhW/7fOHK7BLgGXn0RNOAVqzZ+hVVDB0nfs17hoequGBv1m
	wz+z17/PSV+4dh18nKkv6EIctTyJXaYDcIQ0HjsD0iyJF6g+xd/IFehohn95KXgWRuleTRAlPEKRZ
	+Ndm/lH5Wwx28PVvziGgcoBz5q0ZjV00vSEIpw1He4H74US1hEpTBxzuF8t9jTRWwgAvIoFNIW9aQ
	7EU3O3Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis8E-00000006t8N-46pj;
	Thu, 22 Jan 2026 10:41:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis86-00000006swq-0HeG
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Jan 2026 10:41:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=T/UfWtw5ZQfseqhZRXzgqUeaU3ggF8Gp/sL3W86n7mc=; b=AsfD0faeLvlzDnBnEKbznYr3mh
	BG7EwNrW7zYgduR3W4MHsocQmoMBKAjITb2O/HdWe4t2yeVoniCNiOEkYe8/b6Ghb0Dm8U6d+Rov3
	cPby1T7wM5hI1tz2bweC/kPyH6+sUzLVsHgN8Gf2EZBaSItMIdTh/b8rsm7QoLI8KCeNPDCHwCwKr
	rnA8jElH/FLStfgHZzQH3ZErX5+p321fDJRkTBVc2YdA5aNTjbLkfeBIJCN3+2Ijgwgk2NpMcX7Ib
	BuJqGT130u74QmfwdvAHzKH0oTm7bERTDngcJPRY8WN+Kbq/EK7/jaFGdWePfRG/qtkiWX45ETCIY
	jEwUklRQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis82-00000000Bl4-3kz7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 10:41:32 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M7hA1O4057644
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 10:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/UfWtw5ZQfseqhZRXzgqUeaU3ggF8Gp/sL3W86n7mc=; b=ozmmkC5M/tEUYKvr
	pj9eip0gDDbkOzEihU0UoWRYue/7bH4BfLspEeEb2Faz9QoSWG2rUnXEbK1tMHCg
	ngMz0I4dBEbbLPOaQmzfmuiKd0CYyuH5bEi6jaujxL5bRPaO91Q+wuhL/AZsETGE
	0VAM3FYflM8XoaKQGNMbPRKLyTH4UPCMyt0BYVULynl4x8kuaR7fWWUmsfEBLcLR
	3G6rtPFUidYu5iNdyJcgD2QHCKR2Yepkh3I2b1uy20cJL9m+9cGU2hlPf+RBuVrw
	IpiFLxuTrTw21si6OQGXkFjhzFqCMtiRjxZA6tE+W0fAhuhfxw4pVqC9LyLwdI/v
	wS/SXA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7nbsxng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 10:41:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c1cffa1f2dso526327285a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769078487; x=1769683287; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/UfWtw5ZQfseqhZRXzgqUeaU3ggF8Gp/sL3W86n7mc=;
        b=UoZ+efA8XCg+QBi6L+syA1cD+4Q90IyWD467ZPvFDJHU3NWtn2UHXqPd9V+Wea1bXE
         ZS44Ks65nrUdznlXAQBDfh9LK4CPZdB8CuqZoc43xPBsgnFFS7migBiCILSxA1laokc+
         6pNoboND6zkAFDkHZXImqArgIm3VyZo6Y4nBh1WRY69iWGyt/z28Mrqr6mXaPgC7Dp7I
         0HJqmUFx0+BDnLUDkANxhme4DkF3Y14hicp8GiwHJ4gLV0pyCAyXZ4O7Gz+Afp8/omlE
         loffE1SGbGNYU6s4G78OrpWPlo5keCcKtVHkk0VXvWGpSyIIQyqSBkKzdzWh2leC1xmH
         qA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078487; x=1769683287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T/UfWtw5ZQfseqhZRXzgqUeaU3ggF8Gp/sL3W86n7mc=;
        b=q7m8TJI7wblpRnw1NviX/iYGksCOHUL9jIC7ik4mBhUOo5BK7R1ZIMf9q4aW7jGVgD
         aJabp3pWj65fPPugm/iwrjxDw3nQsi39hS/j/nwW6lKIp2/VHFf8wYbR44VDc0QxaVdR
         efq8UhEo9PQCBUN5cSTwz/vWmkmB6Oyqe6bNUyCQm1I+dSA4oQADbZxZvbI2EgWhKuCv
         Bc4fxrZZp/CaZQsDezrio2gO6zY/c5MmefOqZ9veeV0y/qbfKQaOSmpMwxuIiIOQqSGa
         i02Tn4hlTwBmzdoOTXojVBB/yT4ilHXTUa+4A/oVcNhYW/ipNHoemDDqcEBXptj8XYix
         mVVw==
X-Forwarded-Encrypted: i=1; AJvYcCVRQ8eN49q456tjE4ftWqJ7QpmK7+CdZO4tNV8qtMrGwIEYJFl9HTESIN6eKruUQIct55uBBqXWJtLRA71/g11U@lists.infradead.org
X-Gm-Message-State: AOJu0YzzKaXjBSMBM8WAkhn91NWB769VOLWcTj5iOtHwv765m9EDhitI
	Q9itjZbggvzDieJYWi96ouJ3I2Q4aYLkD5HcKVKB97BkLCjLScf7cZyUrg5eUimjgoN6dXfOnAw
	tUQYD4KTFpj94RAHY/pFNYuHC/qsx3/YufIHfYBLOUuSqMOIaNHsgv8os9e/4/qL/7diukJ6qt/
	5/Pg==
X-Gm-Gg: AZuq6aJJvOD1lkxseeuDJfFROHtLOHtUx47JUWPVt2XSWtfsVBo7QJR0A8lZD9x2S6p
	R/p50QLpmG3SR/IpM6anvfHOm4C/hTLOcRhD8eSva4ctaXtbrAoPNqkuYAPsPuARcZiBsiHHQh0
	+pbUq4Sxw7rKVsa6ednnK54n9b+r/+HlQgxlo+m38X1PTp03xMfsp7JhkSzhupifRAmxe9A4re8
	kIjXYDnpg/Mti3/TBf4iVtbzUJq8RCxzTFtb1kOkNAuEOvTELkesPwTYrwrZId1S2n60rNcADcc
	leJfE27eRESc4u0FvC2gb0W/vBkdSfjNYOqGbcsYHNGfek4F2Oxqtq7/k6l8JQKx0MxBSHwStF0
	n+kmMWustipV/RNNQO/84IJq2RDFv+p09KbI2m0Lza3YsqWTTYUZBSGEvAcsq4Ae6BXIgtSXnh/
	dG
X-Received: by 2002:a05:620a:4113:b0:8c6:a5c8:fb39 with SMTP id af79cd13be357-8c6da87eee2mr272140785a.1.1769078487576;
        Thu, 22 Jan 2026 02:41:27 -0800 (PST)
X-Received: by 2002:a05:620a:4113:b0:8c6:a5c8:fb39 with SMTP id af79cd13be357-8c6da87eee2mr272138685a.1.1769078487163;
        Thu, 22 Jan 2026 02:41:27 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a7260229sm1387868685a.42.2026.01.22.02.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:41:26 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:40:48 +0800
Subject: [PATCH v4 3/5] arm64: dts: qcom: talos: Add CCI definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sm6150_evk-v4-3-a908d49892e7@oss.qualcomm.com>
References: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769078453; l=2250;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=2WG5aoisKJwerkvnpytr8xGIA19LajXbCLZsav5MoQ0=;
 b=t1vTSMWGXPTYqrQxSeJNFQegnAyafTbIj4gd43njXHFo0Sc5yhyBYN9CUxe6ejwaAaXhH0Z8P
 vNxm/R4ARtgCsjYeWoQfBsvr9wAP1l0UyFu+kWQ0/YQRcXsGVs+db4L
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: Ujrf3v1crNt61rpPWBQazk3LGcETZv7H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NiBTYWx0ZWRfX+6YQAyYJDchA
 aUio9mCrJCAMDSn7ZBUnRDwIpNmMW3LXxDKzkfdMYQ6Aul76rG50F8AifGH1wnYLK1F63jFVSSQ
 K1Uy4gVIIzTmBZSDSvgYXeND+AFIQK6pet9YgCCbSpnBiEsUdMnPbXoIkJtX5tn7vsn3D43Daph
 2j+mOgZlxSwqJC/OKfPvrpw+ReSas1twGLuaFzUUhNJXkgNBZu/e8XWnNCjUzd2CWX8PKzHdctC
 STyr1bQQqPyUs3pw/IT+Oa/rglTdxXQMiaw4ofNbDdz64tuh6ifmMxT6/4cl4UpFTZJ+pV2MGqO
 hc1uRawK4tZOwbIQ2cX1YB4+ubAAYFegOG2pRNiDZOpzjg7suKbSOJ4CAU3j5VBSdeJ+SBHNjiF
 iBp5cESl22R/jteN8UuKhJ6LYD4YKxkSi20Gz4G+nUZjOq//GcT13Nvai680p6eGf1i8SXk925v
 mqbYsDxKIk2rRekdzaA==
X-Authority-Analysis: v=2.4 cv=dZGNHHXe c=1 sm=1 tr=0 ts=6971fed9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=szutk0iRDVHniUSXDBIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Ujrf3v1crNt61rpPWBQazk3LGcETZv7H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_104131_161654_C8B67C44 
X-CRM114-Status: GOOD (  13.21  )
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

Qualcomm Talos SoC contains single controller,
containing 2 I2C hosts.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 51 +++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 3e1d85b6eacb90b48496ddfee2db27c586f3331e..6d28096e50546855bd762e479b66ed6214ec5d65 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1553,6 +1553,22 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cci_i2c0_default: cci-i2c0-default-state {
+				/* SDA, SCL */
+				pins = "gpio32", "gpio33";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c1_default: cci-i2c1-default-state {
+				/* SDA, SCL */
+				pins = "gpio34", "gpio35";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
 			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
 				pins = "gpio4", "gpio5";
 				function = "qup0";
@@ -3789,6 +3805,41 @@ videocc: clock-controller@ab00000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci: cci@ac4a000 {
+			compatible = "qcom,sm6150-cci", "qcom,msm8996-cci";
+
+			reg = <0x0 0x0ac4a000 0x0 0x4000>;
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING 0>;
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camss: isp@acb3000 {
 			compatible = "qcom,sm6150-camss";
 

-- 
2.34.1


