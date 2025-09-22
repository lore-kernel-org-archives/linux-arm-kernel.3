Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4A1CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aaEbjaznfRKEBXAo6DFolWZjwipbscJpuOwEOXljFb8=; b=uJa0IxLekcBsEWhx3ZlhXa0ClT
	UKeFBybTWQwohMxadoshWNgLhL+4jWpxaZrLHSWKzFYIDdNtd79qkq/dRBnBKt8O+mGhHpFkR8TE0
	jNJl7YzhQTvZL20jP0eltmemU+bq6K7o11Ckv1T8+JPVUsXU4Df1Gk0+j4Q2g20hLqQBr3j6+r37g
	Uy8dGepClGYX+AT1dcIQHBBjhfUhC45Mkv6gDEd796CN1b8kMHHIqpXCRXLetJIejR5CudnK7tx8x
	byWTUxuIR3fOTqNkxqd8ME2yOjc1cSYf2PFTgtz6WbifwGZaMv2DOCM2Z/E7PN06rHt+TnOaLeqVM
	ylyEFyNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0goJ-0000000AYGF-17qf;
	Mon, 22 Sep 2025 13:42:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0goF-0000000AYEk-48v7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:42:30 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M7pTkx006138
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 13:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aaEbjaznfRKEBXAo6DFolWZjwipbscJpuOwEOXljFb8=; b=OqFk9OyQD0bojcrD
	6CGV3Hmzs4zqpcpHvCAhRiiLafSENQFuOxR+rV3JrKvWvMBzpauFacz9A1ZcXkSe
	qfknBiEnEzoc+4Uf40SCTH3QgfT1ytxDAuBiJaXIrzxlWpWVzEwVzfdf5J/A/86E
	I1jUbjUsuTbqAgDM+hFWa0r5+0cNwP+1IpFzNVqXfQyC2B9o/JLaRdLAhWaZ/v4+
	6SRAjGYgLuEh15shauDEKmNAdP87bvNxQvgIcEWLxks7+sWruwVpkcmyrugwg33L
	sHUgd6xxi2xv/S1WB3ZfY0y4aSND8+/uj6rUht5q6GGNI7AMAWkQaQas1bOQrV3x
	z83BRQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b2e112wc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 13:42:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b552f91033cso3173817a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 06:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758548542; x=1759153342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aaEbjaznfRKEBXAo6DFolWZjwipbscJpuOwEOXljFb8=;
        b=bl4a89wElLUwP4/HvMptmAJrB5AQypBS/4j31en8bo3ZR5Ei7N7q8j8shzwNl8ILSX
         v3/FpqUnzSeXZIfOiYOeBsRn2VR6Gu2z7EVs15zCdC88u4vFi7aJlHXXhO/CzmthTLN8
         6b1xKGwLVzgxaPwf9QRNiU2CPrwdrSzCGHgL5OwPTZDfY1rnmefo/YGMt/OzBfTxn87t
         OuPRUVcQp+4XEnoqtNiG5KyxNUMDyaYQ9TqERvVXLIVakBV/nflCDyfHBM6M4u4RQ+hb
         U7hFkbaKTAruX2kHANPZMeax6xQF4E3PFyk06Aghc4OhFFaz/crKyPVrcBoyl/jkTvy7
         8g5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjYXmUHyUpQqZVTuaqx3qGDQoXdRBCoR5kdQvjZx9dSfXHwd//ugXeth6LWOARIwQ6HgoZ7mNHmJgIjXsAsK8y@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwlsfuoe8zkz5GuhyKE0HW4aRA0ys+K+I5gsrT53/9KfDS2ua2
	sXLIjq/xqutpWhJYKvngMM5xJIu2p3HBjtooggPyf1DQUTxQzsgppKzQdD6WEi8evFdDrNGZE8K
	Yf+0Ny2RyuGTXCwD+V2/R6VFRde+SS8bFHC3TbznU47MVHlXA/qYLsozSTTCRvfhhxeYgpEwNjg
	sz3g==
X-Gm-Gg: ASbGncucDaB3Y0vABSFY7aVnlN/XHgJay0/XRvTHJ0uJi/z/hH0T1JgNn2jyi6vTOVk
	lGmT4/rUx2hGnbq4eRw2M8cHJXqeQh2A29o4IgbpZMp0vfRuTvF4cdoY6+ClEdCGpSSuODlY5sM
	gnNT2lk8yY/Sl9xB/+rVygM0aXCnuMgDCUNn2ApbG1Rd+rx3i4QVMW9Pst1CgbpaGs4qFQumiAC
	1BoORFyV3pAF+HyNzw8dPRmhJUhKqSjyaLaFMOIhLusjPPHUjrJy2kZoPYKBb2or1jn6tpRX0ej
	SPQPz3kRkp5iPGaRm+0ZtY8zYYxUYTiNcCENDY9D6SVAjnxPtPSG3GvdP8Gz3rykpgfNR+z+phA
	f
X-Received: by 2002:a17:903:40c5:b0:24c:cb60:f6f0 with SMTP id d9443c01a7336-269ba5892b3mr158901345ad.58.1758548542357;
        Mon, 22 Sep 2025 06:42:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYaq8oly26Ao9AwkHXBiB7SkRKPK/ArZ104vPbq6lanvIWpYVCmWpjrPeli8srR+MQ0I6aZg==
X-Received: by 2002:a17:903:40c5:b0:24c:cb60:f6f0 with SMTP id d9443c01a7336-269ba5892b3mr158900825ad.58.1758548541893;
        Mon, 22 Sep 2025 06:42:21 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016c13asm134246755ad.46.2025.09.22.06.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 06:42:20 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 19:10:21 +0530
Subject: [PATCH v15 11/14] arm64: dts: qcom: lemans-evk: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-arm-psci-system_reset2-vendor-reboots-v15-11-7ce3a08878f1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758548419; l=994;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=1jBpq+iZuKpAQm2NP3JS82veq+AIv0X5C7ExNAj56cU=;
 b=mqVVIESE4qG7LRS83vpCr3o4bWFn4SxgH4lxwuXGeOaww6B7yxmQGhmpCOj8eRJuKPkyfTyrK
 /NYlyvyI69bBCqQIJAx+wnZ+vdGIO/1FYRx9IKisQTRrT+MovMwe/xf
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA3NiBTYWx0ZWRfX+UwB40PtNqsZ
 +MukOjv0OWr1bQ53jrOjRHT9bcCL+WFttYg5iPMCIHwIx5RJyyFeHj/GAiQVS8ZpdK13fx6ZCYm
 BF3XfxOOtky3uvb1gg147Z6E0/ApQBsN/NSc1eOD+N3SF5vpbt1mTvKyMK61nG5zhcJ5hm4f2zM
 T90IfCvqdOyi8benlkrowkmTy6fqxqEBTPKL/RoqPfWfOvE6BNTRF+nabmhYROOI+MDIuZCC3DX
 xoOLypMMtYO8cLzIIkn/eZL8dMmNHDpD2XHD2C6X7TfUTBM8p+eqK4viQIxWsuHjXNZ7o8meEfw
 aMcKRrtY7QTobaA4HQzyxZRtalD5boa7w+53y8xnxYOqsKvQX+PZLOVcJ11Spgb5VIUDciywEt4
 ovnQVmtl
X-Proofpoint-ORIG-GUID: b83UAkNyBsV4Cpx668BR1KdiR_A50iFJ
X-Authority-Analysis: v=2.4 cv=HM7DFptv c=1 sm=1 tr=0 ts=68d1523f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=JGo1Z14By4IpQyqbhUIA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: b83UAkNyBsV4Cpx668BR1KdiR_A50iFJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_064228_034968_FCD70656 
X-CRM114-Status: GOOD (  14.44  )
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
lemans-evk as reboot-modes.  Describe the resets:
"bootloader" will cause device to reboot and stop in the
bootloader's fastboot mode.  "edl" will cause device to reboot
into "emergency download mode", which permits loading images via
the Firehose protocol.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index c7dc9b8f445787a87ba4869bb426f70f14c1dc9f..09460441888a7011ff613c4fe9fa4b6872e12172 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -587,6 +587,13 @@ &pcie1_phy {
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

-- 
2.34.1


