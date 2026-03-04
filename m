Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49196EFCE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 18:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dkAGVLxymyDw3qYaLpCIZMTPmgwUM2iPvtUgmWLOhvU=; b=PWHKUw8m+P9sHVS6bISxvHirfn
	5ycczzHjEctRcj9HU/rn+BhYPYknd8KYQRrHjX/LPeUN/E3rnrKyNLuq1abXWAAKDFbONSHxZyHyW
	gYtPGS7/B5qE1xd/CCc3Z/8323thSGjzl99Fe8qNPL75HrtlWvfIQPedQ/kNYxIq2qZfpxLjMpPkq
	erAODW/C1lfLiQBCHGyNxcfP9T4eylYnsCwC+6CJE+3q6quOytD2XWt6YcsO255Z7jhJvvAvvVYMw
	OBPEIieb4euvlbQau1iDY02qs40He6StW7ETJ/Z+cKWgZMzBN+K9gS8VyDrkdTER1pC6+vRUMlOFV
	zXXY93Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqae-00000000IYj-0bfO;
	Wed, 04 Mar 2026 18:04:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqab-00000000IWw-3VCf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 18:04:55 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624C89YT1678611
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Mar 2026 18:04:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dkAGVLxymyDw3qYaLpCIZMTPmgwUM2iPvtUgmWLOhvU=; b=eSkmZLD1PtTRYS8D
	FUwM6t5pTV07XIo7u4bKENCGovjEdmuCLAzKmK7LIJie4U09aqW9EoGh3ZskVsIK
	0uZinK31+L5YfVD7J0hEbm/PZb0DyPAhDL2Bi7hiwtKDL/y0Kjru6ZrwUxKN6+oM
	bZxnFaT3HWV/ZJoSFm/5ln5RIw5/2r+I7R5HypIPpTVnPmA71bOXhoJuhdmMepdt
	7KyCXMNIVBaMIG4JFJpT3w8dQQroOn89099M2xuXntr2lDsk2is4ftVz/kBr7/2I
	m5GUeBrV28LLz/ODL9Sfi5WlQYrw5GJPbMc0EpquLETmg5/z1NUmjDFeoKwn8vg+
	IO1GfQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp73hbvt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 18:04:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3598f4fbb13so3356583a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 10:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772647493; x=1773252293; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dkAGVLxymyDw3qYaLpCIZMTPmgwUM2iPvtUgmWLOhvU=;
        b=LiEvD1LEzHNl6cFE67F7xALnPf87T3ZbkqKEJ7fDXsWQsVuXNCx8tUWxA4dsZepLRM
         YgHIENLrCCWCLXyU1ntjZAa5jW+CPW7uecRjcNY+4nIpMCXl2o3DOies+T10JukTT/VS
         FfEpu8vt4KUsZkyZOszMU8fPP7x7FER4vBLMECuoufsO8ePC++2Y8Ta7BKoqOuBc+KtL
         3ovWuhZx8+Di3mXh1x1Z52FNHetbL8vpr1N4Co7sG03IY/1qGdxaVzv+17KDNFGw9Of3
         42k/g/xW6/YNugwlGY7I2lUtQhQOXCynPnRRqxauXDIz+ABEJAFkIfHRK6bC2hdHCUJl
         0AoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772647493; x=1773252293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dkAGVLxymyDw3qYaLpCIZMTPmgwUM2iPvtUgmWLOhvU=;
        b=F0TxMIE1kXcaDds5UoyP7L8kAIC1IdHPCbW6JqG0nHQf9suBI8G2RSRIvpdihIPoZI
         ix2rsZKwMg3L/AZ2oL46fPh94NJXIfTmYdGAKJoeieAK+n7qkk1+PVdx/5VNq6KE5n/v
         n/d7x/D2KkzZ0DT0EDA/j59E5t5zKcTqMtbN1egnisLkP2Y6UDHv4LawxAFUn6ype3c9
         E4qIvv3vfdQLYRu9tzTjN2ZBWCRleCv3/MWgPIooy0OIowJzWWudmHUtk8WKZCKBxLHR
         IKbPWOMXXK3NMU09n6XsL+xatW5hfAr+wlWO0sJG9u/oFxaIYtQTJgpne4eX03XdKuNf
         ewTA==
X-Forwarded-Encrypted: i=1; AJvYcCXooYLIMHz9TKOy26C0PiSjx5QNkeNrGPKsjTe922bXW3rQVfPeU7d0mo5VuwVpyHQTUN1ZZuk8qp8PM4sAnHiK@lists.infradead.org
X-Gm-Message-State: AOJu0Yydrm413X9M5YIALqbRQVnbCxtfu+L88+J9w7U5IQvIV+OIXyym
	QsS7GWrIDoPcV4h5spTRd9cIk4Jg/Y4wuP0Qus3P6+jT2VEpNgDGu4XuB4OHjJ+QlSpKNvzCc6N
	4PuAIUca8zg0nGGVC9HoQAMI1OOwWpD98a7aK3OhvXzooZCEYWeWOix5IK1Jdhw6HrUiI8QdJ4O
	bvbQ==
X-Gm-Gg: ATEYQzy4w3l0hgPgyc2j9Z9OeN+GNJtrLFZzZ8as7UYnqqth6b9fQKEkowZ5SvqDK2S
	lP0Ff7XhqwEZ7ZxchjseXLQXQEBjnDfeVDCSW6RSiyQDQpYPtD/SlTI23E+nephpQsPzMFg+HkR
	M4Q/Jc5R4b1Yj801m1mFlUG8YT8Oh09KZAvbcNKOeAc/08KhcYBQrcT1y+oVTfpzyad5vAZrCgY
	my48rLmoBrWP7+tCbkxoPAOJHcMcfTSG21wBjOjuYzK0Jb6AvIi/3zwARZD6yUNeHwq4thplWCZ
	DJvvlFU+rNdkEPY+Cz1QDl9/4/5UwjA7HMRFv56CMWGFd1HKz779eRKF8WMfV1st10ME+grzKtS
	jJOOo3b7lTnQ2mJxdcGWJWOr+LKCGKgnTAYr7D7hUYhURZ2JJ8SmzRxbtUQ==
X-Received: by 2002:a17:90b:3910:b0:359:97d3:5c5b with SMTP id 98e67ed59e1d1-359a6a4a348mr2128006a91.20.1772647492474;
        Wed, 04 Mar 2026 10:04:52 -0800 (PST)
X-Received: by 2002:a17:90b:3910:b0:359:97d3:5c5b with SMTP id 98e67ed59e1d1-359a6a4a348mr2127967a91.20.1772647491976;
        Wed, 04 Mar 2026 10:04:51 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359a8f22062sm1080606a91.1.2026.03.04.10.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 10:04:51 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 23:33:10 +0530
Subject: [PATCH v20 10/10] arm64: dts: qcom: talos: Add psci reboot-modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-arm-psci-system_reset2-vendor-reboots-v20-10-cf7d346b8372@oss.qualcomm.com>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
In-Reply-To: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772647398; l=1101;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=3KcpMftv/JE0g+EzWaIo/3jzOWEmXkeaFO3VA+Q+II8=;
 b=cUCn5OWA7AvhELGq4rqhhkW6m6l8Vo0pmb3w38wCUmkbw5BJmSxyims7SLPYd4bnB05+gyiSD
 QNYkDzzoUC5C0bIcNG1ei8wkNS/WpiXw/SJz+yWy24dY5ssr4vbXUgq
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: Yi3F1btKK8vaYEVadwera2zBUonv7OQ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NyBTYWx0ZWRfX4fB+yHhZgpEA
 cxqqgo2sFWEjllEfRDqpwaVL8m9JqMCSQAQgG+A2JdVCygP/NdCtYAZfmNkGFsJ5Q1MEIxljZ+k
 qHe9ekL+dBJ4ef6sJUqhtVTSb1g+1ge3juiMb4JAIU1l+JVOqldXDtaD1y4jkHsc4CGWlOl6O2s
 +WHL98Kbe2a3QhCA7yQA3iIGd8MCxyW+hTVTIMTzUhL3QY4Szjn2gw/2sOIKUWNeUtQpNabpEFe
 YRlFrcSLASdk28z2LZW+lK7QW5LC9XlqMEl7V1mFuMDMidsUWflcAvzSAotZP5ZiIgHxPMycy0L
 A2mREEBvzeXcwQ2am89qP7GU3IjVacjk6GhbttjCVHlGKciTkvYQx918VQz4JRzhOsvZUo5Rz/4
 oa/wsjy/VG0PPpSP3ohKt/ShwKVVb739DEboXgh0jsGo4/N8DHR+m5yXmMOlTE1pYgDvUUoEG3N
 XCALbds3NGChjK7/LWw==
X-Proofpoint-ORIG-GUID: Yi3F1btKK8vaYEVadwera2zBUonv7OQ3
X-Authority-Analysis: v=2.4 cv=BpWQAIX5 c=1 sm=1 tr=0 ts=69a87445 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=4cuBwC7xTQKafrdxVH8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_100453_893292_E5F7079D 
X-CRM114-Status: GOOD (  14.61  )
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

Add PSCI SYSTEM_RESET2 reboot-modes for talos based boards, for use by
the psci_reboot_mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Signed-off-by: Song Xue <quic_songxue@quicinc.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 75716b4a58d6d331337f8a4f3f41f62a45416ec9..4e12d19e282f81b7e18ecb2868b8fd9fe3975651 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -617,6 +617,11 @@ cluster_pd: power-domain-cluster {
 					      &cluster_sleep_1
 					      &cluster_sleep_2>;
 		};
+
+		reboot-mode {
+			mode-bootloader = <0x80010001 0x2>;
+			mode-edl = <0x80000000 0x1>;
+		};
 	};
 
 	reserved-memory {

-- 
2.34.1


