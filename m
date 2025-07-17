Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFAFC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 15:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=751t52RdbCcwhdqGfw2MHgsiZQ8ax24R2DVj0BioALo=; b=Kbl26SnuLW80XA+nINbZaEqHUK
	tst7A9D7pTyASm6YHasqb3OVttEqPWhtKlwcHAnFuWoRVnhCJeidFTQF2P7RxLM5H1iTldGqmTTh/
	GwScfSEgLOywyLLlvFmQp6hGu4BtcSOoc+H6ehTZiUHeNY8B6VgybC9xxSsDKnaKhEN1USTU+NC92
	rs03CNc9o2jhJAaZuMcjYvZRfm9sLXaMnmezqQ35X+PHTc6GkLEIbR7x3tTy38dj5r5TCP4H5B+KS
	hHAJwsczX6Rw4KgyZEKM7/6uJaOThmU0OJ4msT+650NEvThsRF0J7DSzWBvSt8bO4reu5+YQkU9uP
	mnWVMegA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQ7Y-0000000ARVu-07cT;
	Thu, 17 Jul 2025 15:02:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucO2O-0000000A9yX-064Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 12:48:37 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H5Nuxb032390
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 12:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	751t52RdbCcwhdqGfw2MHgsiZQ8ax24R2DVj0BioALo=; b=LGbiqt2X17LP031m
	pxacikIzoEWgrYhQvwMNhiCNOL59xdHJz5aL1u+U+aKHOGrsfuM2B/805zmzKG9w
	J7szGKPuWi/Np7FiRfqbkiO8jm7bB8R9TCO2vKpGPZaZ9DlSYGSJ0yN8QMcT5K/m
	WWOmbPDp4S09DONkrVAxOCktNlcBwZs+Hm7Bwd7VLT8q7o98tcHb4PwNAvmywWJQ
	QE2sts5wQyk8tcxpRnv4kwsP9m5E/2tNk0gKZb4zpdvRmteqHSdQicpjfyLYmPpO
	3Ei06IQj2d7V1sgDzYx6ZjNMlQDuvBfC+CudPkBveTUC0xUZTtwOBAKvHtzm2+3Y
	OTm1iw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug387std-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 12:48:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-234906c5e29so11008655ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 05:48:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752756512; x=1753361312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=751t52RdbCcwhdqGfw2MHgsiZQ8ax24R2DVj0BioALo=;
        b=KlzJMyV97CFQ/brCTaGfJKyWZWRymkOROwezIl6vJRC8CAUt8Kv7OqqfGNpXsQsr7L
         MEgxh+4+EBgc0RjKlk6nac+B5/sfnppMHFK4bSR3tUtFyp0AYhJkQ2b2QxayUiqWAaUT
         H66wPekTo9jaQ9NuSmEN2m/f456jHG5dKMqZQd+x1Pw4hbD1kN5iChdxNqkgYBit19aB
         S6uI6kOtmrlGGVCJbORZukj2wjrR/bOz3rBFintvU5qt+FuTQVs/fVPxMBsWMdjjPY/T
         TOwZouEtdpquBNx38lMQ4V1vES4bq/Joy4NSPloZj8WWbis6B05ecjoYCOH107LgZTFS
         drXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv23jJ/qqA1HtYSxvd59qJAPubp/8s904iweoFvcjBZzJ6fibpzKUdj85856X5kx7x1NKhnoCYtAmTUgFgLMc9@lists.infradead.org
X-Gm-Message-State: AOJu0YwLAM9eht3eGBYxuIMDexMwJMmJawXx4WaQej7xOpfS5OyZmMsY
	kb1P1rIpYocXhGW3cAc5nS0hj9845b1qUDOcxi6yhmjqahIq5MY41lWZmEnh3U0mhLVortC0Tym
	4wzLID3cjZroBzYRCbP9+yg1DTwRl0qQjKltDfwtGVKeduIRlVXQHG6VSCr0IdsqxCnZGairqRR
	R3Mw==
X-Gm-Gg: ASbGncsvGCDFNsQ5yP1BOYVa2QVQyQN/QtLSp04+ec3PvutgodJ1VIlCf6ltnmzXga/
	SBqEjwHw4fWgAkzf8sycYNfodtC2Lb950upwYcl6l7vanpmMd4JgJqEGAu1/+IH86frwxXFs9YD
	nPlfj6+DqxsmbSiUJLdSSu2S35EI141ELTtGYV6/02BV01i46v6+5V/5zlDgJr/asTxz2lPW7M3
	0w1reeYS7BtBwFb9ebDPOefF1RRDRqD+RXqaeg2lvD1NpbmKGIR/+4ytmLJ4gTDBQoUfmbDOQ/k
	gX7iertiLLtuBsdjeZEXUX6/1khfra/iDed4lcYYQzVUXxx/dScTSjP4eOI1G+rH/c1X7ROCP4y
	y
X-Received: by 2002:a17:903:230b:b0:23d:ddf0:c93b with SMTP id d9443c01a7336-23e257435e3mr88941365ad.37.1752756512236;
        Thu, 17 Jul 2025 05:48:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8DUsFwY4tYypfpmfxBilLBUvP2Z+g2tucXJh7Sk3ZEP6OFjznFBKFx5xkkD6zUVMZmlHT7w==
X-Received: by 2002:a17:903:230b:b0:23d:ddf0:c93b with SMTP id d9443c01a7336-23e257435e3mr88940755ad.37.1752756511748;
        Thu, 17 Jul 2025 05:48:31 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31caf828a0esm1505283a91.42.2025.07.17.05.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 05:48:31 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 18:16:52 +0530
Subject: [PATCH v11 6/8] arm64: dts: qcom: qcs6490-rb3gen2: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-arm-psci-system_reset2-vendor-reboots-v11-6-df3e2b2183c3@oss.qualcomm.com>
References: <20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com>
In-Reply-To: <20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com>
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
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752756455; l=1185;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=rmo18nL+UB7XAtgXRRqne0fPUU/Z0j3760cEPwsemB8=;
 b=ppLcpvC8rVl1IEadr9ZLl9ZareIhC7diBss7JmDD0pOFm/RzNVRac0cIFzMaJsT3pSWLwEtkk
 xwfXL7h/RO3DNbgHkoFJAo3qHKOrXDxQ7WVxfN1TuspSeNiFGreIQFp
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDExMSBTYWx0ZWRfXzk1B5uw78Hkd
 +Fu0Ce7eAEIvVCxEX8IPaII8bzMNAe8NSJWSGHVo5Q0UQzXrorDRfgAuXBvG1noPQM2m/HtGduV
 MWwJyiNFohsN0b/V+Ehat/bDuygVxeWFtzTdpiJ9O8jTpHgqSbBFjwFjDTvx2TMqlc+25hmGyDi
 vBteJT4m2dRwDHpy2WPpPOwFo/i2un8cy+3WQe50Io7t6bSyuMek5MJmHOI0uJzjBL2UDomCkE8
 4PeQtthOS88TNlzX8Y/RzOG2FEI1tJcinTDo7uIM5dWseZ6et5St7sIG0GTWwkzaP/HsTTQvxfO
 whhXuC3rpdLGqVCmnGWcfZ11x0ABRe3nKbiJ3awphZN+OTZrR+OaulfHg796W/XNbwhrpdvEcgm
 u2+7kMi0r7LKxo3ybyaJbC8bmI5F5CV+syAtnD2y3F3xNI4KUAJF2jnT4Uu5crkwxVaIrj8o
X-Proofpoint-GUID: ogaVVeHud_HbdpHCTJyef_lty0CEuaN6
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=6878f122 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=w06kbW2hXDg5FjFnD0gA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: ogaVVeHud_HbdpHCTJyef_lty0CEuaN6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_054836_188995_95F6011A 
X-CRM114-Status: GOOD (  13.59  )
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
index 5fbcd48f2e2d839835fa464a8d5682f00557f82e..8cf289a3cfc4ac7014885494c27fb003a7258519 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -966,6 +966,13 @@ &pon_resin {
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


