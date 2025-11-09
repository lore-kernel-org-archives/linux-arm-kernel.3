Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BF4CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 14:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jDT1n8ZxH/CHdaAziXcBd4tY/Cun3ebrWgj6oFVzywM=; b=R90aVe3YmwfSk4F+p/CLjU+35G
	IUiYjxHHlk85qCf4ADQcp0B9dG+lpFKIdtBQsTfzwTUsaijaYCEn+dYgMf086NHFgLnfpluPmndng
	2s9zAIMgS+L2wfgSVLXRwg8k3ahNefQx7+Zr3xQWCoWxE5dnu5Gsp0a/pHqqTqDyOkyimygi1DAMH
	LUx9ftDlboVeiuT6GSHtZwonleR/xgYC1w+gfeOpyb8yYeCKfCnbog0T1Nj+i1HDp/ZjoPKDY41dU
	wQcuZj0Dy5BtvMnYJsjrznMwqbXhliU5WxDejfAwPJjGdqSAZ4rhQBK9qgxOH0D7uHZojSC9Ac6D/
	Ap2390FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI6a0-000000045fL-1N4S;
	Sun, 09 Nov 2025 14:39:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI6Zy-000000045dF-0drW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 14:39:43 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9AlXHC228904
	for <linux-arm-kernel@lists.infradead.org>; Sun, 9 Nov 2025 14:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jDT1n8ZxH/CHdaAziXcBd4tY/Cun3ebrWgj6oFVzywM=; b=e34DRIW+aFKLkVZ4
	s8Nc6Xk9e9BU8glO/nSdKMY9s8rDlZxpTZZmwOL/PF2/hFKRSJS3Zj/PeUyc1A90
	6epxi4DWAezhqN922U3NX78TUMaX1dSFmaHa2N0CZ24/rok/J5dmA3DESlXAH2k3
	RBiRZoM70tctillhPKgc4q/D7HdJ/bXYnqmhnMLlCV6PYcO3kBluaZ4302ikSwPY
	giOskXUhNI7iBqf9e2Cq3AVFcSWfYRtrv2jqP3QNs6lSgZ9o1UipD4vLTJuCqNnU
	UpWsBtz/7LPsro7f4Xo3pUkTpNHzSkNCgXLQMqgXJjV+zrCXsjc7/dZoekeE0ZIm
	ZMkdnw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xw5a76j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 14:39:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-340bb1bf12aso5262307a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 06:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762699181; x=1763303981; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jDT1n8ZxH/CHdaAziXcBd4tY/Cun3ebrWgj6oFVzywM=;
        b=QizSEptS9sZR3USPsBLorZ/RKeP9Ii0Xoa9GyOTboVRbwtFsqB+FAhuhU0ptPUcXSY
         P5riBuiRaTixIKgpg3aCNndqAkJGeHpC9VA/f5v8JhZLO45VffgbBBe6GTclNLRbw65D
         EBfDwxVd+fVNf5xZVi7lv2fkAJ4dandilOppY9/2bThqgvEIIzWGzTGIQEpUTGmAxX/t
         J8oc4XLArzd9JWlKHPwjkzUW9hLzzgLL6+VJkBqzpKux1jAdmrasXH8AyqDOcjtL/bWN
         Yqof7qDYtkPkYrRsB3VOf4HjSQdx/CbwT5yzXEKosbtBi8ciTN4IFPSScsUd5adhdI7v
         61Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762699181; x=1763303981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jDT1n8ZxH/CHdaAziXcBd4tY/Cun3ebrWgj6oFVzywM=;
        b=M5JokaW5XdquMkuBXtPVIs+aOHm+ZBskX85+GC9HOoJIMKkA2jyKNVQ6osCZPLnBMU
         hlXPhOSsA/nb0ZRPhc2JitYhrwjN+seTupBayZiLnDpIsDWgTeTCu3uQc+I71Yt6dRyP
         gqaCbAbiXy4pilRBtlItz14kFVrnxCXee/NM08C28Hm1OzENjHx8X8J9XEDs9IV0PjsJ
         tzXtUaOVOzigSoDD9GaSLAazowiAn/sT+zjt84E6tg33WCqUKo6I1zoNWaruwrkcyg32
         oDEOK0j03uFGwTUKlF/3r/5FaP0cq/GDAJSBpYCfYvsIGh/54YptlVFz4gXqqw3zcUvN
         394Q==
X-Forwarded-Encrypted: i=1; AJvYcCVd1MXkgB0E6M4OXU9cGchRPOy8QFyY8t0m1fuojEpMdqrqzbnRG25y4b8J3Wa2ypOnpKpvXBVJ9xs/25dA+OM4@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4agPvw9KomC7nA6uFlMHshRWiB5Bo7YlObgCpS13XFh1wz4v/
	63TmTTrzq2jm/4b7ZAQTDCaQoxpBpzNcNPaJJg8XscMehMimhiCIpGncYbjq6GvKcT3Liv6Itqf
	Efsc7XqeSQj8jwPScKpu493SRHCnEGhVC2qjTTDjy4JK6DIk/UxZLnku62SMFLe/pKls65DWbzE
	XMag==
X-Gm-Gg: ASbGnctmkexIHNj2nUFz+2IZMJwR1FA554839eHSAs3N0A44EemE6tzckMjO++TzRq8
	u1kIOSmLjWo/nqFII9PEuK30vhbfpKAE/HDWWIJIMtzTu4q6qp4E3yc2jMKDYudMrswmP7DlX0K
	+7jLYVMsoHY9vHDk2Cxp64igwDaES25fH6V+YcwFMwi9n4HXLTn4TY7xA3pCKvPjixjReSuCZO0
	OvmzUz+99XUoo9ymGMqATMO7HYQDPXEIvLnKzkDcdxvVEjpETvVRqEtoxdC6D5thfJt5FUwbXLN
	q6ICeA2Ubidj+xLfhsExWLDJwm3H+Dcm7P2R0L8k+bi0OAIJk745RHdaYQKWzTnRDg3cBfSEk9O
	FH1wUmYxQR1afVdrq1s2WX74zvPWBemat56A=
X-Received: by 2002:a17:90b:350d:b0:33b:cfac:d5c6 with SMTP id 98e67ed59e1d1-3436cbb25dbmr6963984a91.29.1762699180834;
        Sun, 09 Nov 2025 06:39:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6UGkpZ4ivllNU4v/AEheb8P8LWmWGO/LPwOkhMrFYsVmL78fLA2Q/qPRznueCahMEJJH/RA==
X-Received: by 2002:a17:90b:350d:b0:33b:cfac:d5c6 with SMTP id 98e67ed59e1d1-3436cbb25dbmr6963942a91.29.1762699180337;
        Sun, 09 Nov 2025 06:39:40 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68a68e6sm14845401a91.4.2025.11.09.06.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 06:39:40 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 09 Nov 2025 20:07:24 +0530
Subject: [PATCH v17 11/12] arm64: dts: qcom: monaco: Add PSCI SYSTEM_RESET2
 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251109-arm-psci-system_reset2-vendor-reboots-v17-11-46e085bca4cc@oss.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
In-Reply-To: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
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
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762699073; l=1031;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=R3MfvFc6/bdQVm4YlgZtmV6Bl4EiIOJCDZmSi9IVDL0=;
 b=54E+nkd9FWt/08GWunbAWGMeVDUP+hEKjK6dnGVejbyt3ewl73JQ0q6KHba6hNUtkGN94xIJx
 gASkoJxb9eNBoqbLVNq8Vr238KihsIdXNm9JRx0AE+SHqM4+zqIt2vg
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: R69vVlCmVzZBrtu7zK9EnrshzDHV9jny
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDEyOSBTYWx0ZWRfX5myQfm1Yf48C
 9Z5BWYeaGmTMgM+0TwQ1veXWGiYd2nI8SPJBRoEJ8pCNBnUxQuT18pGXYkoy+Wl+gF+0oedyqV7
 87537jk4dEJ+Mh+DK7uaJK8rQcBIJPPJu0dYhLv10zPjly+7AejieqjfY+U1si7dRa4yaA8ymnv
 XDzNWHS0D9bXZ+TRrsma4fpJOQJUCWN0cabMyq3dQQzk05/dtT+FCQnSZVTg6e55E9mkx9aoaWw
 TX4nqNZkRFs8kKaREu1xDnH/qbgkF8E3uKSjP1YUPmzwf3elL7UIY0nF2O4hclU9syxFRUpIL0j
 zBSb5t0HDX38djxRtowb+JuZBbd8JKlXKZWUY67V0L8O+lzg4PLt67+In5fkLY0aUwxOj9Xxwbl
 AdbXEHbuRA89MLBZRKBYHJG8p9ezrg==
X-Proofpoint-GUID: R69vVlCmVzZBrtu7zK9EnrshzDHV9jny
X-Authority-Analysis: v=2.4 cv=FoQIPmrq c=1 sm=1 tr=0 ts=6910a7ad cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_PJuSq69R3b4qrRYkJAA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511090129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_063942_208752_9A0DDB65 
X-CRM114-Status: GOOD (  14.33  )
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

Add support for SYSTEM_RESET2 vendor-specific resets as
reboot-modes in the psci node.  Describe the resets: "bootloader"
will cause device to reboot and stop in the bootloader's fastboot
mode.  "edl" will cause device to reboot into "emergency download
mode", which permits loading images via the Firehose protocol.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 816fa2af8a9a663b8ad176f93d2f18284a08c3d1..e690ba62d9099e270e14510325dd1422b152584b 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -732,6 +732,11 @@ system_pd: power-domain-system {
 			#power-domain-cells = <0>;
 			domain-idle-states = <&system_sleep>;
 		};
+
+		reboot-mode {
+			mode-bootloader = <0x10001 0x2>;
+			mode-edl = <0 0x1>;
+		};
 	};
 
 	reserved-memory {

-- 
2.34.1


