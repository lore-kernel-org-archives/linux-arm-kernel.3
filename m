Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EFECAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rJQkYNJ2ptgfx/Tld3lEk18PrZsK416NnAJeaB5RM4o=; b=PR2HiN54DbwDW9NLqO+HJn00g2
	60i1y/UVSt0aQVdNt2bFuB5nsLzmIOaIHinohTW/4kiAlzYPiEXpNTRHwjkJ6qKPJ1nOQbl8xACKk
	MiCEYCGsa0fr44YPzFNYgRaCRwZ97YYXsvUnBfjpKnbtdgvOOtGG2zQw31BD7hs4Pk2e1v7FFuha6
	rtk3EBUXP4ZC/Akn5TuJGBh3a1V6xuuranPsbrcI7CwhZF5oldYiv7x+job15Etxzjs7HKmtvURbz
	6R1ZyfT0x+N1l9oB0Pz0Wz85kHWejQv3OV59v5djHK0Wc3q4zNj0q/XOZt9omnnGp38F+U4vVj24T
	Y8K/VcaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gns-0000000AXyp-0PSK;
	Mon, 22 Sep 2025 13:42:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gno-0000000AXvu-0HYL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:42:02 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M8vYVe017365
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 13:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rJQkYNJ2ptgfx/Tld3lEk18PrZsK416NnAJeaB5RM4o=; b=NwYvpOg+xZS7eHP0
	xDNER6FmPa5tBlNEMzLiHHu1qY+74UFzQbYQXWlr0JRsVQTkUi0v33MPdgcYFwix
	rz/0WJ2t380Rag2TMTjVmrBUe7pYiy3n63iSjuAoAeEMO9Gdp+gW4Iq9USX8XUk5
	edOKM4JrJn8KVY1Y7ZwwBfGvg8OBlvQolFgGaSq/aknrz0Ouqup571qn+SY6OwfQ
	s0PbBgH/koWZSlemX+W6Dqbg+ojVDk0H+jzSrMBRRHnADxLN7RHhjBTMEPqCFP4A
	1srZ3nofm5yzwt8td9ZGMIqLIMd16VP6bJCBMJB5XgIiJydcm7BiYENtMWBo12qP
	agglDg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k7sw1kf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 13:41:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b54df707c1cso2732365a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 06:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758548519; x=1759153319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJQkYNJ2ptgfx/Tld3lEk18PrZsK416NnAJeaB5RM4o=;
        b=ofI8pY2RkX8HzBfgYc6X9M9HaVt2N8as54eLijTWhAgboB2nTAjFL50ryVHlrx4x2W
         kJTe+nrXy3SZQY8TYUsdsddMq48+zUq+ho9jWaoz5+3eBurMSmX2wZvqGO73xY101P0I
         wGmRIxyM16Q8JMrVXnMweWN9w6YYjHh8eG9UKOM+mfkk9oMtkF++FbkdRtEpliZOgjIw
         8+Lz9p/hSnL8+oCVuuNxeBW42ofIBtM+fR/KCZJf1P705o0ajU6X2sVUnOVquICSYJnl
         BTNqz5LEqH5cS28sAGqitykJmrkCgwxn6E3GZOlIPyc+EiXJMMfVcl9gvzjP1EDimjwy
         bC0A==
X-Forwarded-Encrypted: i=1; AJvYcCXyFj6ZXcywOKMMZauibsF7uMi18b5KtZ0w6bE5wJPVIHNcqapF5Q2PL3noLTehWkZqi5msif22To37CzcY2spo@lists.infradead.org
X-Gm-Message-State: AOJu0YxEnAe23e4InGbN7NXDABjYDdUo12YduTYHxev40cAklkexg+2r
	yZOcANXLtNnAuJyVcTsF4ttBKbfLO6+ir+LTHSSiJ3qmfWmYJ273Iytd+YBeepLDFCwZ1NDR0KK
	80BW2sMf5TQR5sutrwFRcCXsknMJD9KL7QDqgw2f4dH6p62X0vnRFxHRMdbybmPJQeiXB4eX1+L
	9owA==
X-Gm-Gg: ASbGnctdgIhgOYs20xti01KBOIpRxE4F8HVv4gg53UukBVk1sTuKDq4i53hCPHNkLhx
	9/RWObPZDYpATvkvP4VqOTuH5iaAJvJhjQkCAUjFSvbOec5slxKwRyuuOBB7AQjkKgt8SWgvYrH
	saFX6deJjZ7Kdggmix7pCCKHAGDBdutj0GiYLMYvuT4YJqguE0BIhQYin+zLp/zbYC6e7MR8724
	BOxvDhbsM/mKP1Q36AW0uq8R+1Hp1920zqGVz688mg5yNQ0TkFOQdBVYCVIuib2TWMeEN/OD/13
	+Yq6fFBJhZHvJM3w7SY0uK5oML+I7pJSbU0qaIdWnBnHtb4z8jd0Arr1ZjSPP1+N/gN2uA8+T4m
	T
X-Received: by 2002:a17:902:e94e:b0:268:5892:6a2e with SMTP id d9443c01a7336-269ba59b78emr169070365ad.56.1758548518396;
        Mon, 22 Sep 2025 06:41:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7GSFmhWYvpYF0EOoGE36KcGoA9Rhnhe/ZjWh/d/dlfb6rO08M9tGC4TLjf/3UCGfieqRxAA==
X-Received: by 2002:a17:902:e94e:b0:268:5892:6a2e with SMTP id d9443c01a7336-269ba59b78emr169069835ad.56.1758548517815;
        Mon, 22 Sep 2025 06:41:57 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016c13asm134246755ad.46.2025.09.22.06.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 06:41:57 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 19:10:19 +0530
Subject: [PATCH v15 09/14] arm64: dts: qcom: qcs6490-rb3gen2: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-arm-psci-system_reset2-vendor-reboots-v15-9-7ce3a08878f1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758548419; l=1185;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=fkRav5QA/W0o9Ycg3/xbut6S1Npfgr1jXzERBrOotDE=;
 b=nEF91WM16FRKVprlDcNfVQWq2bR49it9Jbo2EoH3aVuK0XkhCYHknxQNy4bTTsN+sz9xNq820
 k2On/w+tYoKBrQpRIp/RsOf/hNnMynZS+XFJDUOtM528sIVCEEvrJ9u
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX+2ZdsqjFwVWk
 CXKDvsqqRMYkwNKRBRVN5U3f7l3DwtkdonlP/A/oNYJXMldPpXXvC3n5B6ET9+uY0xz9Tataq4u
 ZeKmqxnFcR5dvyoOW/GOUvmj8/vhCwXyCOTUBj7dZagHNH5QXlR74tUpLlrFa9GSe1aWHCuegcR
 tXnk/9+SIp/x+slt5vOS5bWtfsDuUdtruT+sUfrpH/lYmVUYySFJFqRA6E0GFOWkRwiZlIJ+6T5
 XJBBlHEAeXcjBxhfWEDCNLVQY0qq247nwlhVwIQP73jcvU7Ptko7AogumbanRP0Zmmu4lLrxcpS
 GyCELr6gdH/GAwvspyh3BmPqho0QgHnJQCqbG18mXi7jaP1wZchPYomu6mXGC8dF2412HQi+vhR
 ZYinw/2/
X-Proofpoint-ORIG-GUID: TZnnFBJ7ETKWJjC1PsE0viQRtuXEf9bR
X-Authority-Analysis: v=2.4 cv=bvpMBFai c=1 sm=1 tr=0 ts=68d15227 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=w06kbW2hXDg5FjFnD0gA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: TZnnFBJ7ETKWJjC1PsE0viQRtuXEf9bR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_064200_130677_5D698CEC 
X-CRM114-Status: GOOD (  15.44  )
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
qcs6490-rb3gen2 as reboot-modes.  Describe the resets:
"bootloader" will cause device to reboot and stop in the
bootloader's fastboot mode. "edl" will cause device to reboot
into "emergency download mode", which permits loading images via
the Firehose protocol.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 18cea8812001421456dc85547c3c711e2c42182a..f38fa2e52a635100a7505c615c0e96f1111d0b5a 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -975,6 +975,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x10001 0x2>;
+		mode-edl = <0 0x1>;
+	};
+};
+
 &qup_uart7_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power

-- 
2.34.1


