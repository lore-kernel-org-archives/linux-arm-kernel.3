Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48473E6F095
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 15:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhqH0YezyHcyTr7nQt07ksXjul0ev8UZo8LNGlyPO0s=; b=dSIJB9c8vSnvn/RQ8pztA7O2xS
	BcmyMaos7UpqFN1cXekYGFwADgxpB1Sa0uo0ex1bLxWHEQuJ/9e+cFj1hMr9fHE9x1DJ+kYk+NB6m
	DtA+MwVL+rESWWKkp2Au/2JUMXRdGcw1oJ+uPFv/S/jw3uA+vncWNcKwr1VyoV0AdKzrOumEgdoQA
	q1cot38kADTnosPakFVY6gtL96a0LbeoCpLSY+ggATObjJ85ufzyR6rPJAq2MPJPq5ioE8UMWSxmT
	CBZ6vCPGYUqW9Ydm5SbRXC6NAzIvePbfrzGBoBMYDBR5QEXQhvN//u+O5Dd7vmHH+LRP0Elg199Je
	Wtp8ndHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4GM-0000000FgAB-0Dck;
	Tue, 23 Dec 2025 15:25:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4GG-0000000Fg5q-3Kwk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 15:25:22 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNCdjmF560004
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dhqH0YezyHc
	yTr7nQt07ksXjul0ev8UZo8LNGlyPO0s=; b=DgbzYhREcWyLhbDQSm3N1PLmUJ5
	UV+nl0TxSM+r5+oL5uuIIKcBlZIRhqt7c+e3izTNt5lRMAnixthHRkQ9L2DAz2Ob
	Li6CQIb759OUkQF/km4VT0hHTynOC44vnAE7heEGmuwfTAO+UjKu8OxvLaeU9Un1
	t6jd3VTsHkZGKpDZXqhIf5qYI+2DIsjD3DnhtCvbBrQWI/ZCUB4s4cOm0lvQFDmY
	7/dqnieRIoyLYgsh3afdhqCWw19E2H990QECHlN5w+B61xiKwMOjE4ZFoSZAap2B
	aMOuAqDYwZs/Mx1OHR50PKp1x7VU1znni0xMFpzs8vXZDy1QmzO5iro+3ZQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9crech-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:25:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee0488e746so110389961cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 07:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766503519; x=1767108319; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhqH0YezyHcyTr7nQt07ksXjul0ev8UZo8LNGlyPO0s=;
        b=blMPWggedf4dzDjMpp7MFwoAmC5R186PWTLxnPsE9gfYLiW+Ip5sQzISqbt/y1bLcg
         jebHlrHLdTTn454MlAzSUfU9gTMx9WSS3as+yOVZDn2X1gYlvts1lYIygEb3uT+2X7q+
         0gM+bqy3wq5qkAHZ49FHjbhFuER1P/vTUyKKehlElHZG5E3tsAjaYPVBYN74A6Qcs9Tm
         jdoDNMgCS1UIuPe+YmFQDH44VWX9mfz5P7fs6XVRniXt1+Jl66fR8gWk1VNQ2R6IBrKD
         0tF+ImYKRbyBSU0uCJj4pDBxuU5JGDF3ubcUUgbDYGilkh3WaZaN9LHAhzz+szivLyRi
         ikVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766503519; x=1767108319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dhqH0YezyHcyTr7nQt07ksXjul0ev8UZo8LNGlyPO0s=;
        b=Mxvz+ONsmjur04QRzy5yIzvq5HkmB08mJ1lNhO3nQLLwMyRubXMIOuKGZuO16qksGn
         D4Ru41gIuF+7Ip6kK5/kwVhcDOYwOB490y024ToLLnb+RRQv5t0XyPSIMSBlgcsLpwAc
         LD+3mvtzxKhmM9mWJUw/xvhGqhSWGra3CXSBsweznwfeAB7+sHVC0qx6KV1uQDldhuiL
         OovNlUb7gScmLKp/KW+9E4FK7X4Bib+RBEsatVb+mewLJ1aYiA2QkIf7Vi1O0CqrVsde
         4XVvqef9TPoI5meRk+aPNKG7Oi0agsf3zoHiUjesyO8UZGXf0IvB2zl7Z80oqcInyQwP
         F8vA==
X-Forwarded-Encrypted: i=1; AJvYcCXCL2Agg5OEK1GPOo16zzoNChW6kmsyqOXDnuNpTBVnJrBwDkxhsYWUBochFehQvG6IAD37G3qzdUMpSxJq7Dh0@lists.infradead.org
X-Gm-Message-State: AOJu0YwRzgFzI+AiB40V+i6lnu9HDdvWyjWzLLBSP8VldeunszdRFPsO
	XuTvKHHxiZdSdpURnZxIrP2Flk8ZhHLXyilj4t6jRnyCtbL56OHdg7MaYSAL8RnfQ2N5FrWmBed
	hAB0gmeamwtmHlWuIuWsijmu4fPRf0A3fDcZW+lmJAo+KqBAKrHcm8e9E0CWL13lPuShiaSfgDj
	l4kg==
X-Gm-Gg: AY/fxX4eUFpfjjJVwUjPFHBcjI52j+18auROx8XAgcy6lHsYrufBQOBNsLKgUJTsnPX
	ETui37EXe1FskwklWG6gq2VE5mt4kerQ4/HP8Ck0LUU+i0z2X2lMTC88gdPo8AoL9E6CWOobGHE
	RL7NqCknv9+iIfBU/h5HP27zurQ/OED1ACOw0Tp0ZOYPf7XLcikzVSz7SG00/tIQUXRSMZOJR8n
	DkBW8gZrZHQB3woHGFvhx1S/49UK4VH2OTRNpt3ZsC9IhnCD24S7nvXfyHJkGmhzVNTNVoOZ8/M
	lFm163rxdcvu/X2VJoGhepiZW03mi7CKfOhuaUzytJRGcjaE77K3FFthBzGy5uTUIoYrBANm/4h
	u/JkfeZ0MsLjK7t16R4Jjl2CkZKkCPuTGdlRAQNUyG9yCiAUh9028FS3jjZiNmMVuqTk=
X-Received: by 2002:ac8:5d4a:0:b0:4ee:4656:54e8 with SMTP id d75a77b69052e-4f35f43a8cfmr245640751cf.26.1766503519025;
        Tue, 23 Dec 2025 07:25:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYdX5DVriXxl3lRoz2KEvuxixKRhDGRRNaC2K/TMI8+3ZTIFHIrpER1bN8UvqBsSzeZ7B02A==
X-Received: by 2002:ac8:5d4a:0:b0:4ee:4656:54e8 with SMTP id d75a77b69052e-4f35f43a8cfmr245640251cf.26.1766503518439;
        Tue, 23 Dec 2025 07:25:18 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b12dsm1430334666b.48.2025.12.23.07.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 07:25:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: amlogic: Use lowercase hex
Date: Tue, 23 Dec 2025 16:25:12 +0100
Message-ID: <20251223152510.155463-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251223152510.155463-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251223152510.155463-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2286; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=bRCEA5WdZjwerxsywxU/VtZRDX77oDIuicp8EVoamkM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSrRX7Pv4ajlqk8l7cS+8qWwjY/4ZJPEjj2+RB
 rbgZkZ6kLWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUq0VwAKCRDBN2bmhouD
 15mPEACD9OjTy8MttZryxejwVc1ebJia3fnu2UdYli/1ipU9uPQydDsq5Km8mNbfIB/gqFzvP0x
 b+adC5IzfKQ+2MrB1rRoZWpOhtx5z+NnbgKyO8fvlSPuVvQ0mvG1TNZBH1lsKEDlMg8aNmqI7cQ
 N7P5HgR8PF1qV88Htx11c/kBmQ8pxWz2uWJvyXZT+MS8Q3uXzdoo3yx8Np1KShb1TMJTH1RvkN6
 ID4K+K6ToGzxL9rBuGiXJQfRcFTm/+cxh1IFmYFm3qjJH/9aknBQ30G3+iwvOWpPNc+7guAdQoc
 3FoGNmoCV2I/A++9WrsYBE7BKhfHgl46zGU8hQ3Uv07rcXZW1EhoQnmhkLDI52lGPDRpx0QZjiM
 IpYJCX8c0KAujax/iQH4CgmhbxAuyjqEjchOKDLdZfJQm6oWQkzIJ9P+VEgzB7KSNDd8M/MTZmL
 k6Dx/WZ1YvobpBS48LGvSW41TbcIIbn0EEHVKvTypOmJlDyvnVk7miQiAfaET44IhWfulxVb5Jm
 iv0dr7K2s6jj6sMeaO08EmHkl1QMLZBIGVmSUuYQCaPf/LBTDwdzdqYRBuoCAlO/ikpwLzZmxZT
 0CMlkcZb5Ny60MDx91ZLQo3DjC22PmU1dkyv65FQFy+KEALSEzoPowcoY4vk9EHkJ9qyUyBM/u6 LaAu6q3A1kry+2A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9zStG_fTl_s3LbXZ-EuLkhaL894TTTxa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEyNyBTYWx0ZWRfX9yN8jq/xytUz
 bA1ofGuG4CyevuPheAC1IzYVGdUeyYyDUw3vz9jl/Y3qN9pgBSA2Y1pUpVUwdj3J9nTqJzr5hZU
 +mxpN3jsTDDEbjOPkV5TRtueLcE0+Aa3IN3jG+9xLsZIRr2zvd389jz4DdIMvsfx33vfBS9URTA
 T8QJJdifqDiZz7mmMASPidJnXXd3mU+sCKFztr877Qu0fyXigWVXNaKdr24Yth4ukqmhBN6Hx01
 WGjEGIsrAiQRb5WKDBmE/SVPsQlLHweQiWN3XWcHpr5eaWJHf8D2Z4Nz0iF9zd6c1QLMNsiX0YA
 KPl5JR16CJmq6zfXZsYJ26I6jruVH9ZgXgwH+YFiiLA7zgpcYXhKNO/zjuNjW7DzqmX4RVbZRmK
 k++CtIFzPEGanpTYs1GwAcbQn5bPMPc1xWFSXuKvI14Pg0MJs66xRGwRXpn17PByMeVw4V1yKeN
 +INerT88xbJa6hph44A==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694ab45f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=D5a3l2Sq9Oz2InJaWs8A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 9zStG_fTl_s3LbXZ-EuLkhaL894TTTxa
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
X-CRM114-CacheID: sfid-20251223_072520_949771_693CD174 
X-CRM114-Status: GOOD (  14.71  )
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

The DTS code coding style expects lowercase hex for values and unit
addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi               | 4 ++--
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts   | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
index c9d9f3ddf73c..11e5323f95b7 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
@@ -108,7 +108,7 @@ scmi_shmem: sram@0 {
 	firmware {
 		scmi: scmi {
 			compatible = "arm,scmi-smc";
-			arm,smc-id = <0x820000C1>;
+			arm,smc-id = <0x820000c1>;
 			shmem = <&scmi_shmem>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -989,7 +989,7 @@ sd: mmc@8a000 {
 			nand: nand-controller@8d000 {
 				compatible = "amlogic,meson-axg-nfc";
 				reg = <0x0 0x8d000 0x0 0x200>,
-					<0x0 0x8C000 0x0 0x4>;
+					<0x0 0x8c000 0x0 0x4>;
 				reg-names = "nfc", "emmc";
 				interrupts = <GIC_SPI 87 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_C>,
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
index c05edebb90b5..cab2ee9ea0d3 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
@@ -20,7 +20,7 @@ aliases {
 
 	memory@0 {
 		device_type = "memory";
-		reg = <0x00000000 0x00000000 0x00000000 0xE0000000
+		reg = <0x00000000 0x00000000 0x00000000 0xe0000000
 			0x00000001 0x00000000 0x00000000 0x20000000>;
 	};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts
index f5b3424c0f61..dddbbe6dca7c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts
@@ -17,7 +17,7 @@ / {
 
 	memory@0 {
 		device_type = "memory";
-		reg = <0x0 0x0 0x0 0xC0000000>;
+		reg = <0x0 0x0 0x0 0xc0000000>;
 	};
 
 	adc-keys {
-- 
2.51.0


