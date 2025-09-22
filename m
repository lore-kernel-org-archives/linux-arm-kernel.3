Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB70CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wh/7I9nc7TXv1Vm06bJQFYN7WbWsJIBlNpOLoUHm6eE=; b=aybIa6n7PwSTd+PMFOCrzmFOlO
	9DKkCNOIWyV3s7ghnPDFdkXjWIcsyewCJC6KFO31xTjjlHoA/0hoZK+Gl3WT/SPTa9qGL8fbfmP2U
	S8V+rZy9kA2hK5P3e5S0j+B6luk/2Rt8VYcdWhKLviiIY0iFGv0DUorMSl81fE0/2B6ouuZ8nusQv
	CEDQZ3eBfRf3/p4Soou3+vO25xz7H/rjGSqnqYqZ3y0wp+z+ugXpYhIraPlDMrjGLb7CkimzXjhv0
	peIj7fR1/SkLJdI7qw0JsFK/1cAw2MAqw8eob1KrN3xlJwr2+eneHBsUv5XgMWKmPVO67rMguP+la
	JpdSUMfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0go1-0000000AY68-3xuR;
	Mon, 22 Sep 2025 13:42:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gnz-0000000AY4O-1dsQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:42:13 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M8xJ69003414
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 13:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wh/7I9nc7TXv1Vm06bJQFYN7WbWsJIBlNpOLoUHm6eE=; b=ab8DZ3qSguQFoTGW
	kFTO66q2di3b8ZOp1YaEo7vrzMv+514XYEISEu8tFMORASuaVhlVvXIDM7jYv0Y8
	jRI0zqXWNLQMjZWRib7HajrSWUS+11KEKzPO4xoQ4k8K4abCG1iq/IAKsGTmd2bT
	Pvat4Qzba6YaCfSu59iqqO7bblemphQ1CJWgetvHzlwx16aog4ynQUXJ5HhY0QVV
	wmvtcau9tXo0FqDTtk+D/hTEJktJ4EYA5Vm+vwGpoO1fmKJWnOSLwcL8mK00S16w
	YZpidBU51waE2iwIJFhQkBKIFSwNVaH4lSSLegMeRuvdouGAP0ackfSuJc6v7Yay
	GK8jSw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mg34vkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 13:42:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-324e41e946eso7765780a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 06:42:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758548530; x=1759153330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wh/7I9nc7TXv1Vm06bJQFYN7WbWsJIBlNpOLoUHm6eE=;
        b=FRQg+VgBYWIKfLFBsBkNPHqE7vWhfiy9vK2Co+Gme8hLjkFnuFroTOC5po0IIp1YtK
         np/Vmkm+bJQlHQ6nvsI2rGoICld20Ne7mPMRKaBqq1yLPkq95VI+jDh15X/U03DDj1QO
         ue8Oyr/c91gZs3ZQB68e5cOCcEfjbxuR4x0jL4Bp+AYR7+ZMD+4+aAnBpWBfn3Faryvg
         455hUqbV558kkgfaYNuNCVbTOFmCzU5Sn8/9EAhLrh5JvyteXEL6oImI74Nn5zrehQwS
         Sqi9u/2V2geJk3iaxEpB61GO87nuKqyaxAdKvdpCOk6tFcZp8fcUNL2PxY2eMKMgt/yy
         ZWeg==
X-Forwarded-Encrypted: i=1; AJvYcCUhZGiJvTWLaZpqlFKTZUzTTNfyBtqJU/dC2WRYIX0QP1BVVrFld+Xb2VYjFQOBWx982wcNmUaMwU7b3B5ApqBy@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0Mb+9F08f9GnE1JQEPDl8+hTdcETGFp8RXwx2DW0FonHYfWAE
	AG8sD9zAefl52Y60Dz1nA2/WdCX6AMgZwx/W8K4eCOcodryKsKTEqxg1zzEhxR+dqazYMWXU/jj
	MInShoKVgpcsBp5oy8JXJPkFIn3qU2L5VzACSjXDcGGLapm/n0L3wlK8onC6DhfAx4B+r7LVGuw
	FaNA==
X-Gm-Gg: ASbGncvAjGp1aL5uaVKGlC3i7u0IUpxyyYw8ODtAfM7yFtt6MS8phyGq59fNKWAGuIX
	CnlaehgvfI4R+4O0bTeTrV8Hhvl7X9XHFG6D19iKrC4PBI7RcwZE4nj7ZyuGAcfhtwrw+zt2HUX
	tmqegPK/+Jid9M2df/F/jQuMfx86qRYHGkGFG0smgkrL6iTGRqemWPYP3//VALLVzUkFZtIQl++
	0z/VNZVjTNFQpmLSJ+D1BB/GHrtc05NUf/twdrvs87VurmoZsfWzXlCrKQXx3Nm88J0AfmlD4cl
	JfF41dTegyB6KWWmVRalC4LapJp72RtkAHjMXsxBzndqB/F+rt6tIM6ULAYchYVzu/IyRGohO1u
	J
X-Received: by 2002:a17:903:f86:b0:267:a230:c657 with SMTP id d9443c01a7336-269ba447e6amr190098665ad.24.1758548529887;
        Mon, 22 Sep 2025 06:42:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpliuhHBSE5mQTDz2xt7nLTi+MDrburaFwR8LKRa9AbeTGPcx5opIE8WzGuUVQXBbgbn8g4g==
X-Received: by 2002:a17:903:f86:b0:267:a230:c657 with SMTP id d9443c01a7336-269ba447e6amr190098175ad.24.1758548529471;
        Mon, 22 Sep 2025 06:42:09 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016c13asm134246755ad.46.2025.09.22.06.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 06:42:09 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 19:10:20 +0530
Subject: [PATCH v15 10/14] arm64: dts: qcom: lemans-ride: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-arm-psci-system_reset2-vendor-reboots-v15-10-7ce3a08878f1@oss.qualcomm.com>
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
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758548419; l=1694;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=F40UDJXOJIO5Y2uSSmyA/SwLwR5DxDqZFVD3o9nJtHE=;
 b=rvw3vrmSYr76Z78QZ7Ue0WKvVeCRs7jqZ3VeZ9VGFJkwFAAlLXQ4vd/k5os2ng/2rMWfZ/L1S
 +4jrGqxkOyDDsDg1MwLjnE2Ml+VRwxJrecPL7wUifnKqeiOCbgiaoK3
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMiBTYWx0ZWRfX5WwW8xPsmnDL
 0iqlYgqfDz15xlbOodS73rEh4U5YrOf5tjJyjHwmz2E40bMHXvX9uV9TKieHHdjWw58TAVs0al8
 RANDrWx6Xai0z/W9pyXm/2ktUpJ1Ge2R6O53G/kD869I4aWT7gEi/kOP92sM5No4cH9FJafONUa
 Oix38V1E/PQQntHalIp7ZGVaSQ7UAKDxH6oVpkYdefv4wPiXKI0TZUMAwzx6oJMiEzsBpLe7fyE
 IjAyZMGFWw3X7yI05Ngx+mu1dmR22jswrEd3MpXwzUDiFmLb6NjY7/DjH/A/sKMQGoYhRzOF6Eq
 Klf1PAXUzw3s3HKTtM620kVR5EWc3Cw4CoB1cG648F9SCqgxxq8KNJOZtHBOlnS8S5jEDX8ynUp
 NT8q4sZo
X-Proofpoint-GUID: mU69inpoCY-llJTlYFtPOsbHY562tDXW
X-Authority-Analysis: v=2.4 cv=UvtjN/wB c=1 sm=1 tr=0 ts=68d15232 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=w06kbW2hXDg5FjFnD0gA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: mU69inpoCY-llJTlYFtPOsbHY562tDXW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_064211_458368_930FCB6B 
X-CRM114-Status: GOOD (  16.97  )
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

From: Elliot Berman <elliot.berman@oss.qualcomm.com>

Add support for SYSTEM_RESET2 vendor-specific resets in
lemans-ride as reboot-modes.  Describe the resets:
"bootloader" will cause device to reboot and stop in the
bootloader's fastboot mode.  "edl" will cause device to reboot
into "emergency download mode", which permits loading images via
the Firehose protocol.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index c69aa2f41ce29f9f841cc6e6651a8efc38690e19..41ba0f4d437727cfe0c51e3d355427f37dce7f46 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -722,6 +722,13 @@ &pmm8654au_3_gpios {
 			  "GNSS_BOOT_MODE";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x10001 0x2>;
+		mode-edl = <0 0x1>;
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 48f753002fc459a3e9fac0c0e98cbec6013fea0f..586ce54a374d5b3aa9d87a673471a5a25410a9f6 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -622,7 +622,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


