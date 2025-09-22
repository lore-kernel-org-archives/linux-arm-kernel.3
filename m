Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC971CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBo9gZrkew51yYf4IHpWDN66o41yYqQF87bJGWuNb/k=; b=WvwTTSRsNtGnwDGoHpor6mr8gT
	uVWXmm/ZNmFegXKE3S1kXz3Hnty+GcYE6015RgkDexfDSjHg88kAs0mjSuako++tbImBVWh3dFiJ+
	ITpJq+v+kND8TnXeP7o6LRXorColzRcNvbCDR7T367CWa1cOGLNu8QHkMIb2iIBg+TRYfGojimNJl
	3JBn5TkuXTmqgvbR647RJfemAbWu9IAx1A+Lg1d8gbNXfEMX67mmS/SaPxNpjS0QfCH+5FvrjPs7Q
	xeinH4K5CyQnLItR4HdKxmmFUQsD2+M6YTTLk43eJolucUlyFb9a08/nTyNxGzWcg3v6t90AdYgIz
	onpW56gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0got-0000000AYcB-325m;
	Mon, 22 Sep 2025 13:43:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gos-0000000AYb0-043p
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 22 Sep 2025 13:43:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=gBo9gZrkew51yYf4IHpWDN66o41yYqQF87bJGWuNb/k=; b=KLqprBHxwG6yKelmgdV66ZI+8d
	kl5Z14NCp0j8SIEfRiU5+lw+KPFH++qsu4Iosccmbfz1MFJIhZ+wvF4U1KZBSATR139QBMkGuCgPt
	kyqhus1MSe+KqQVQlrBA2T+hbq6ZXtSFfpdP0NS1Z2UbVn3CRh4IDKVfcvw65pYuv+RSNzNoZ+4Sn
	ZfxMIE9561UPWcSoyQuy5LeRhdcv6Ty8G2IjBTwruA7kwcBor6KwHpeuAIiBldbipG6Pu4K1kWzAv
	9Yc0RBewvx4agbwXAGPwBkJIQZruRPYbuI/qoAqROQrVVo4icqZ7n9RNR4YnyVC6xCKogGXplsyX9
	XdNtYWuQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0goo-00000008J2B-2cZZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:43:04 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M8rO14019614
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 13:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gBo9gZrkew51yYf4IHpWDN66o41yYqQF87bJGWuNb/k=; b=LH/XyQ6q7GwQT1yQ
	WeHim8j9V2ZZjHoy2fZAe5Cx+ZEnl/rPdzHLyUaOvT3k/A9g7uRGjHrqPbYbrsFb
	LZh1puTfpkEzzxQKeVJSQ+hHt00Sc9g6Xfs4/wVvtBC7zaf3Rg/UDD1rDeLVKhci
	vJU2/gQBswsLjgqVpUXNKn/mcbZjgFA7Ov2omFTf0PLnoJhuA4I8/SkkFRCuVv7g
	m1ot2UQXTe2Tab111v9dE9FUCleOGeZ1HIAYJZKvl+2KGEJmdIBrDTUUmSGmVvUf
	Qe28XLX2PcKw163ImR7620Bwqzhr3YnuIc1mgD+91TCwSrepoJF8ANUbstT2IFhL
	1JReNw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k7sw1sn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 13:42:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b54ad69f143so6058852a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 06:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758548577; x=1759153377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBo9gZrkew51yYf4IHpWDN66o41yYqQF87bJGWuNb/k=;
        b=PrSZPOgqMik+IgRQDLg/oVMfWMBaqo9nXFpmii77TgfLs+U9vS4oOdPySMpSnBvl5c
         VR0nvdOZW6t2pGyGFu9z+WbqTXA0E/7aNbj3DLRRarBOJWAlEmOzsRTa9LBBEdUwEdhJ
         xjNI4GnAjy5lwVzuclA2//JTsBCtI9axeoN7LJFmUJJ421wawg5ea7zn3iBPl1JcMXsS
         3b3llTU4IE5aGChrynG9m8A6fFdY5yO3seaF0ZcjlSJ4VzuEv1BmMOYx4nM5jFuh9hDC
         OwM77eaw1MS60czAKuQ3b7Thql94S5tj0Nu9xVIlfdjdz7Y/+l9pEeQEz3GdPRg6qbwH
         UKSg==
X-Forwarded-Encrypted: i=1; AJvYcCV2hpsHzaPEDbmId+A/m91OUp+8nqWp78PvXEBuYxTpOCkdhz2KRUOos7Bg7/IbuArOtP9pN7AbNr6lVjYmFlfp@lists.infradead.org
X-Gm-Message-State: AOJu0YwMG2Br7eLqYw8SZEN9mkyCkZBMwa0VgiSADG7NKV5/ZNBhdEmo
	KoHKGp/PQVvrg7+o9vscIFeFaUX1Sc1E40TKqCWhYOzJHehRCSKFp6wD4OSmnuPW0Qi1N//Ff8Q
	6QmPBKrAPjhSzTPvswQ7NFQp9wf0eeqyUbrN7v1H/+H+sIgFwPVyf8/iUCXPoqjEt7nkMQ+dpgr
	RMLw==
X-Gm-Gg: ASbGncsjJAo1vWlDcnHFxX1jlrFghHE3CgtWZhQJENEx9LHbUns5WF9i903fh+Fn+bu
	ocMtfn9bW1If2VYVH0bDBGN/ipczYH/+cnDzPRnTiFalE0kw1aRG7EoMbvrZG0R+EaBQ2/ZvMJR
	GRosr8m7yLe91MG9MAn+pWdhRtPJdFmK9BylODJ9v4BBMuO+E3V+wRY7HUkBUb8e49c/oTdyOPZ
	Ry9aG6gdznpP5vtMVexWbMJ1f4oFOFX2Tj0zvE/fEJ21dvU4aIb4BlWzd+++rAOs9RLkOc2Yki1
	crkbDGFYHEmaQCROCgLkAtR8g/20gbH+ktycgMoN+klxHM1pNC70rUjlz0PIJtzOp2LwYOwuM8H
	M
X-Received: by 2002:a17:902:8c8e:b0:267:bd8d:19e with SMTP id d9443c01a7336-269ba45a535mr124622405ad.22.1758548577158;
        Mon, 22 Sep 2025 06:42:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9BBG97Vpj3NlcI1yrqR60H0FcR5ZfUsHTr+DhIzuL5+cXzftJ2Gp38ot3VHtbSZDVJiXbZQ==
X-Received: by 2002:a17:902:8c8e:b0:267:bd8d:19e with SMTP id d9443c01a7336-269ba45a535mr124621615ad.22.1758548576412;
        Mon, 22 Sep 2025 06:42:56 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016c13asm134246755ad.46.2025.09.22.06.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 06:42:56 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 19:10:24 +0530
Subject: [PATCH v15 14/14] arm64: dts: qcom: qcs615-ride: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-arm-psci-system_reset2-vendor-reboots-v15-14-7ce3a08878f1@oss.qualcomm.com>
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
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758548419; l=1528;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=st897fJ7jTPYQ5eppZ6+OrlCOSPDdAnpzJ0eoXTLNbM=;
 b=dx2gCn3WRde0MdcHSdLFfQA96teEFnP5jmCVlplECfz+ZgOkk7Vh9CTblgMabl/rAcdZv7g+T
 im3TWdSIkojClaPhaSQhYBwkef0ZZR4dKCb5SzLOTZbseQpb9mhDVAz
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX/qqZoxaQVsq0
 Tx2ywB9aSGyijDkzSQuJXv1sKQZr+8wlIY4ePqG/rPSAgdTWokPM7z+1ybpWS2rbASbFVmG8TIq
 QpXTxeA+6BvTUrXWPn+y/x8NlLN/N8qIy8GrLIjb0D1E/oXwB6wfsxirLYLDoDU9b/fre/gnT9H
 jDAS0PLAwPFq9FzrOlWB6ZtOSJi4f0hrhP2D/TWk840CmS5NM1Z7qLocoL1wdKAS/zM7+vqmk3F
 9tCs+I9PINzIMONP0Z9EfLhbsdWs/GLzzwmqhNcZriB6NNdsT+37A18D2jMe+wWtsEslIYC3qH9
 SDUIFrn5e7jW8NicohYFLiVc1ailwfjhLsfNNRogJPaqFN0cb5g4gFc6Ho2O+9GCKkk9wSXfGbj
 2xfIK2Z6
X-Proofpoint-ORIG-GUID: B92hkCv4yaDgeE91J6mBARRBBAdTrMRq
X-Authority-Analysis: v=2.4 cv=bvpMBFai c=1 sm=1 tr=0 ts=68d15262 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=pkXgoPqwvIc8jTsVjBcA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: B92hkCv4yaDgeE91J6mBARRBBAdTrMRq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_144303_128116_C6F8358C 
X-CRM114-Status: GOOD (  16.78  )
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

From: Song Xue <quic_songxue@quicinc.com>

Add support for SYSTEM_RESET2 vendor-specific resets in
qcs615-ride as reboot-modes.  Describe the resets:
"bootloader" will cause device to reboot and stop in the
bootloader's fastboot mode.  "edl" will cause device to reboot
into "emergency download mode", which permits loading images via
the Firehose protocol.

Signed-off-by: Song Xue <quic_songxue@quicinc.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/sm6150.dtsi     | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 705ea71b07a10aea82b5789e8ab9f757683f678a..bfb504db43368fe73ff200476ff5220334872c8a 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -343,6 +343,13 @@ &pon_resin {
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
diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
index 3d2a1cb02b628a5db7ca14bea784429be5a020f9..9df5e94069f604e5393350f5d8906097d6d01209 100644
--- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
@@ -416,7 +416,7 @@ opp-128000000 {
 		};
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


