Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FCFCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FYXv947f4qPhFNPoWzY/DvCzODELrD0LuRjCAh5+0k=; b=Lpoo7JLQRjlQYvyl363xbrI0p+
	BQwaBbsF+sApC4k9kPxGV8x0VXI8HODMHaV7WYpUZQcDsF08qGV6GSp3mYCVL9WUZVQ9pyTHc+bZf
	bwOTSbqxZR0Ip3eCh8GWctqw+1GKh9b6PPZQ/5S5a0Q/BVTDPw2RNEJxg2dvwu+MPioAZKaM/LZaP
	8CiE5Lsi62X3TvDVcNhFuLyERbVpWHqpkjAnQEIXh6UNwmLnW3a8MtW85SVGjnmG9DJXbzeCIwDGl
	uXmCpMBqHP89RcXLrdDIOVTxnszMkzyAdGDSnx/1P5J9u2dOrLdFFD8ReY4mSHbqDtDbyzVPNX7q3
	lsOS+svg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0goT-0000000AYMT-2Qns;
	Mon, 22 Sep 2025 13:42:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0goO-0000000AYJ4-35C7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:42:40 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M952aT015745
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 13:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6FYXv947f4qPhFNPoWzY/DvCzODELrD0LuRjCAh5+0k=; b=YbgjbRoIqEyI/mOL
	GKrXdXBOINtnbNJ7xeXsPg3gIBkGvUlHOisSX/O5d6fp7ZePBEsDCsOIw4iG6cFC
	ZbDHhf8QHmqPhbY0H0xetHBF5czMShLIZX3vG8r42vYjC2obgE9Ta71+vXZ0d87E
	wQHb2rbW+1am0fDiVH8tVJ8h76ljLtnYnZPNnXsH529fpgqRK8M612u8xIaYjiuh
	6ujhciW4MFKFxhbj36H6t8xPLB6wCkrya9a+NIW6DYCPsFssiThER/ySCXrFFJ9T
	FIxh8WVhcxJCUpQF1CuCZVVyeOeL0C2PhBzVSbD8abjTq94aJGJqZ5Re0Q86++7k
	I3Q2wA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98cxy0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 13:42:35 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b54a30515cfso4076391a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 06:42:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758548554; x=1759153354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6FYXv947f4qPhFNPoWzY/DvCzODELrD0LuRjCAh5+0k=;
        b=C/7qlyRCZVvIBEkI2ZqSpzU7+mMtPC/4ndErs102zBp5720axC3nFxgxC2VKOCdLkm
         kd608g4hucjkjsQQ5gaMEhFNKatK3Fu9DmAKCH+QD5zkW0H42C/k8qe8QIxIGYVRU30r
         0tS1Nt4mUY0HIoajpL53y5PETaUCRO7HRVeiXWkoDghRDju9zDnbi3gntdtwP7A+LKwi
         Q7Z7xTWO0LRML8Q1VK/oZTWwAIY4Qsva6ewU0V0h8NDkwZsibFdAP7LRRpFYXpgoilcm
         rtHKF1xVyCfPKM1C4Ca1dxGs390YRtOIJkgIzKwvbZsRoc1U43ekuC0rvb495SqICHj+
         4UEw==
X-Forwarded-Encrypted: i=1; AJvYcCUPgi6ptqnqv/BAZLuiicLvpQyeS917+QB8DVCgr9k30vY4xZVpGYMpmX23jbyaCtXwxMIuOxNd7uOxFp8NVT9b@lists.infradead.org
X-Gm-Message-State: AOJu0YxRCQLVj9BBcTGkIxvICwML4WckCHMdQeSHQwyitZDLj3Zj+U20
	VW7I9m9YupJbbaqvWLrCjhqwASLFvaSzXHVdc0LgzW4NM4J3EBYymP2dmJcXBXDFVpJQXysKmSe
	Z5ZbCoNbkEIEkusCYZRvjso66bFSoVg3vKKTYiUnZ+sfXtnNBvrE6syTd7TrAh1dOmgUOSBVYI7
	Hy6w==
X-Gm-Gg: ASbGnct5IC1QiJGRi/bkNQQvpFDMnCg7AbWgytffBBYZzPk/6nrpoP14gL9GDkuk4An
	9MyBav8AmjdFruItHSdDSNJmbg5WgPuwWgSqGJhZ2lFtjSQcmU5j106C72biA1Zx7ErpmxTot01
	17TWTXIIUTqPcEo8/ntG58vJkIfsGaIbIVRHjEc7PKtVvImbR1e9+fqH2kZ1PIW3QHhXSoA0q5P
	CstH0pZ/dCudV5tPnnUE69XaTQyXtlOQ78BHZobR1zq59d1nqlVB2UyG486mH6RkzBPqGOwq7bl
	EvutmQHx1xVEw/fkUW9ND0Ot59ic4WshTKj9Wc7QF02coavqC5jmOcJodv7Var5f0wWVnmV1PGi
	3
X-Received: by 2002:a17:902:74cc:b0:265:62b6:c51a with SMTP id d9443c01a7336-2697d795331mr139723305ad.23.1758548553891;
        Mon, 22 Sep 2025 06:42:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETbdwlhVXEjM7yM22/JEEvIiUoy202zLd+b4eWbRtUU2DHlwKHc8Op5CjIiXXHqrVv39UJmQ==
X-Received: by 2002:a17:902:74cc:b0:265:62b6:c51a with SMTP id d9443c01a7336-2697d795331mr139723005ad.23.1758548553434;
        Mon, 22 Sep 2025 06:42:33 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016c13asm134246755ad.46.2025.09.22.06.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 06:42:33 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 19:10:22 +0530
Subject: [PATCH v15 12/14] arm64: dts: qcom: qcs8300-ride: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-arm-psci-system_reset2-vendor-reboots-v15-12-7ce3a08878f1@oss.qualcomm.com>
References: <20250922-arm-psci-system_reset2-vendor-reboots-v15-0-7ce3a08878f1@oss.qualcomm.com>
In-Reply-To: <20250922-arm-psci-system_reset2-vendor-reboots-v15-0-7ce3a08878f1@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758548419; l=1518;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=wHkUdDS5bnjeIQ7bWY0wwHjrewyVMryPfMFT2XspY7w=;
 b=TCxpE50gt1pXJWJLnvp2Xo5vGtRfCb5g6AIRIIKP0dcKGqc/CJoCvd8l4Qh1JixBDFnugZCHt
 zRlWDkiodHmCXFvnxFbQqcB6EyEzV5K9RPrJ6BsZ68yVSoue50/SEZK
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: o8Dw72wMocNOQpdJsmW7H5VIuoi6qQ7r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX2xb81PxKNk9J
 t643gucKm+lQcAJ7Dc07r83cCFr6dJcFo6v7vJBKwtzum+roqsTm1Ri1ZqjnnH6AI1PhFayPP5O
 24PohQ4vYMzRapq1gP5B5Z6Z11GczKMRLEZO+/GH6h2LW72odPp39xh7R/b1R2wJKB51bj4O4jm
 V1144RPihsHnqKcg3Zsny/6kdfVD1WC5pBKR2uuSYeSQQcWDil0W7XbyB61XR2Jx261RT7ZqSea
 qxAxQQuVTNXS99KkRYISQ8XdrEGlnZOBK0nl6wBvhlDOzRsNwLBdQ48/nsl1GL6Eccrdr40JWD6
 xlDitCwETtDSqVjSPfYoo6nWAewYZHjYPemlBAQr8lnK7UGpGoq31MQrpxqRIWqyRDfjVe1IJSK
 zeEX5NI3
X-Proofpoint-ORIG-GUID: o8Dw72wMocNOQpdJsmW7H5VIuoi6qQ7r
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d1524b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=tC4jzodRyx6YAeo6W6AA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_064236_968086_FD594534 
X-CRM114-Status: GOOD (  16.54  )
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

Add support for SYSTEM_RESET2 vendor-specific resets in
qcs8300-ride as reboot-modes.  Describe the resets:
"bootloader" will cause device to reboot and stop in the
bootloader's fastboot mode.  "edl" will cause device to reboot
into "emergency download mode", which permits loading images via
the Firehose protocol.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index f8ed510477cf2d23c6bd1bb042abe46b45ad35e4..dc36296d2c1ac7731d9e741099a2cc0115f584f0 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -309,6 +309,13 @@ &iris {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x10001 0x2>;
+		mode-edl = <0 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index d35bfece60d1afa5205d71c3b1b621dce49c805e..7d256c2f9a9a430d076000ddf22f8a56f074071e 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -663,7 +663,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


