Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46555CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 08:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nxfYEmYqkxe9I64Jt37v1r1LAgjhaDXjQTd8b8LMNGI=; b=PIq67Lnmg78g2Y17j6Zk/B9mvS
	1UQfrsDamwlAqa84vbuOO4YanpkXrIyqhvFfF8n3bmQ/rpoHrWRYQnpzEj2fNCfznE+R23xIEnyLg
	PCjciXKTRIi5TBA6cXY1hs0T+rKNsQO8azvxv76iNgtraCtu0IRw0Copb4flQ4Rv9qvwtkhBnYURQ
	knWmRycURhpBV5jooDNf1sq88bCPJs8e+yfdTXTL4XvEDbOkXLfbcglKYR7lIVj2yKmaw0xXK9f5T
	UF6+1XcDBjo3LCIZTOV6qihTGi3dDyy5T+b3VX3ynAqHMbukYj3zc5qAmhg8vuUCFaLinphCdzaQz
	uUlzerrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFq3r-00000009RPM-0Ef2;
	Mon, 03 Nov 2025 08:37:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFq3p-00000009ROy-180W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 08:37:10 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A33DE3S1940616
	for <linux-arm-kernel@lists.infradead.org>; Mon, 3 Nov 2025 08:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nxfYEmYqkxe9I64Jt37v1r1L
	AgjhaDXjQTd8b8LMNGI=; b=bZF9dkzBty7u8M+wJbp6L4YSEjUQ/5sUI9G7pac/
	GvXEiA3Dell9aFb1bodE+LD4Und4qEud0c/7ucYodn+48YiVBKgmgbyYUCFnAmTW
	eJgtOj8wF8rVOrdPOeWj8J+BQc6D9UsFndjGcePSQvest142NVewahDpi+vV2txl
	86QjwLqLv36UVP+AF3wqlRU72tiUUP26mfOI7V7r4NngvKtJ4Wjj+lSYRHpHRVCA
	8BlrD7DyOFhNtJ1e4HLm9nck6C1YL6jv/aHwWkpQrAb/JSTwsDGBO/wZzWMEFdQj
	ki1x0Fm5UGdF2MCgfKgqmTxGBcFw1oCA4uiNTdzEdh7YCQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6m9w8sy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 08:37:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2930e2e8e7fso40808345ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 00:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762159027; x=1762763827; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nxfYEmYqkxe9I64Jt37v1r1LAgjhaDXjQTd8b8LMNGI=;
        b=PA2WiqODE14CiL8/Hxzqydd/1OSHQzSJ9TZ8FHxwSrMAnwpI+zcn0I8AACe3hJ9dbe
         J6FQyfbe/vKosj/Hw3kVm2CQtSE+S8NHBjTD21lAwrk7Vjm9tcqhq42KU0zgtT/touDM
         Iz31Ga8e8T1JhP4SZItgiWwTdB3soco/rJC/0EhiGzntBp47oQ03duKkg34fmKU23+XZ
         5PGzTdPZI1bIZuQuZeNBXDP79f3YP0D2I0EuN/E74RiKY/xJgG5dBxSK33BO4nvoW5A1
         n6CtiRRY3kprigyopovgNMfcJEhutoKov8GyAYvgQDffXCmyBuZCexHvm2Ag2faiVjku
         SZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762159027; x=1762763827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxfYEmYqkxe9I64Jt37v1r1LAgjhaDXjQTd8b8LMNGI=;
        b=N4stR3G9WX390atPNDyANlubovUSV5rzCfzp1kDVuOPaLAA1oQGGzaURvWyMB92Ofx
         vbJjIx5VQKKS+mnuKVgUqhtISUWKNM1bbPRHd6ihIyYehNcJOU2zlrU4QMPLVR95n8xT
         EMkW8jDfv3CT5Es5apoDqas7LlbRBecs1i95Zs+2d0wLjxny9zy5rgOE0u3H4rv7o+6N
         jCqItu3XkgbzbJ1DOrfCq7c/9Qyeft2rhMUftC+c1y304RkRt09Nh/9J55u6W8nQ+QSo
         XvZeDMaoWaxTmiDxC1HQ4EIYpv/5qXqc0ldcTAnsVij0ZC1MgFVg/kBmNdyIgmi61W9T
         6XTg==
X-Forwarded-Encrypted: i=1; AJvYcCU37RVu2ZlCorzd9heLtq3013fh9IjCm9GM2uXXEW2OFKU4ovT3GEJLeho++GJ2dV+7pUczXC7rP/Z8RkXIuMK1@lists.infradead.org
X-Gm-Message-State: AOJu0YzKrzRxOw2awISQMe2xu2G1Jw6Mg2yRNl49zkVDPFiim7QqEZf3
	La4geblXG01AMQbkkWxYvUEe8lsOm7nyqM0UzVkp6nVz79zyUpGbExEiZETqY3MYPwqNGFwtHPf
	7o7VVzQbP4BAvAAYHrUZhsji9nJFVcz1RHuJELxKAYZYvaJaIJCefxLio0tpcRgIPzcTkpEb/ZW
	h6MQ==
X-Gm-Gg: ASbGncu7YVrFW6iRF3k3zbt8yB28gl0KjyfTlrRmPooSK3VHC/wEPFcknRdbCRMH+Rz
	JMNXQwASFCH5hApt64dKS+R4m2JTPVP4AYjO3ktaNRxtCOszi5Zi2WRYkI3t2lbhpXL1P3BlmGR
	zUHl+wedFtrAYLBRurHQRoSsUJXNI17fYPbuI3QEId7dZUYAirKUkKxXxBAZCT81nh4zqxNaJQx
	XLBNxHG4QIl5b85YMuz3RHWsVEyETVC+lO+ivmaQz2AYQnY0W1uZtGna+vzbP4U3N4GZXA/MNk/
	v/aA2N9b2Rartpd8XhTgLGHFtjGQyGOJhHbqz9gpCs2BXS6rbYXmjgR+bUm8UyuzrJgonARZ35m
	ACn911Q8fqYw2aHacKAaPM4VnMA==
X-Received: by 2002:a17:902:9a43:b0:269:8edf:67f8 with SMTP id d9443c01a7336-2951a51115emr96421385ad.52.1762159026965;
        Mon, 03 Nov 2025 00:37:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEg79jBe83qZ4qcFrRUL0Cs4zucPSebSAbF6GkYrqF3XDiBJBW5qwOvoRCXhg+yjXEA3w8txQ==
X-Received: by 2002:a17:902:9a43:b0:269:8edf:67f8 with SMTP id d9443c01a7336-2951a51115emr96421055ad.52.1762159025910;
        Mon, 03 Nov 2025 00:37:05 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295269a66cbsm112235015ad.89.2025.11.03.00.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 00:37:05 -0800 (PST)
Date: Mon, 3 Nov 2025 14:06:54 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
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
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v16 10/14] arm64: dts: qcom: lemans-ride: Add PSCI
 SYSTEM_RESET2 types
Message-ID: <20251103083654.a4u5vapgk5io4cr4@hu-mojha-hyd.qualcomm.com>
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
 <20251015-arm-psci-system_reset2-vendor-reboots-v16-10-b98aedaa23ee@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-arm-psci-system_reset2-vendor-reboots-v16-10-b98aedaa23ee@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=P7Q3RyAu c=1 sm=1 tr=0 ts=690869b4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_kws7oYgz0zWIvm8_ZIA:9
 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: WIJ6j2c_bpWbJOxZWk6BrB2CnK2oXH-8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA3OSBTYWx0ZWRfX75A6zEgLWDko
 iHVLQiAdnsDrVOd4kX2nS9LfnQlSdo6Yr7y0Cua96XgBv6GQGIXzSv9s5f8iNkeTdQqs9RmDuVA
 hrHyEBtAV4DQCnPb7daw+SBs9BpVlPv280KsGPElp+I8zzCiSkclm9DaZ+V/3AlMOLdLx3QAgKL
 tYN5pgFOVaQKFMgEH3OzWcaslxRoxP+QGv8ZHcU1ZnFaij2mkIdCyKZ0EXAV4STQQn5ByqSEUw2
 LX0vHg0g1etUtWsxUmY3QLOJCMQija2AOHhFlgZYAebUeEfv6qRdweG+2//AuN1Gv56qIDYBqTb
 30U4puFp8uX/5lkqkqjmBy+t2YVDVuY28dyHztc0btTIZSHrEYqZQQP3woXc+4YNdnLS0iL52dc
 QjJ+L2cKeIS+VNL1FgoIpLQAWkH/dg==
X-Proofpoint-ORIG-GUID: WIJ6j2c_bpWbJOxZWk6BrB2CnK2oXH-8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_003709_430068_92D836D9 
X-CRM114-Status: GOOD (  22.56  )
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

On Wed, Oct 15, 2025 at 10:08:25AM +0530, Shivendra Pratap wrote:
> From: Elliot Berman <elliot.berman@oss.qualcomm.com>
> 
> Add support for SYSTEM_RESET2 vendor-specific resets in
> lemans-ride as reboot-modes.  Describe the resets:
> "bootloader" will cause device to reboot and stop in the
> bootloader's fastboot mode.  "edl" will cause device to reboot
> into "emergency download mode", which permits loading images via
> the Firehose protocol.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 7 +++++++
>  arch/arm64/boot/dts/qcom/lemans.dtsi             | 2 +-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> index c69aa2f41ce29f9f841cc6e6651a8efc38690e19..41ba0f4d437727cfe0c51e3d355427f37dce7f46 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> @@ -722,6 +722,13 @@ &pmm8654au_3_gpios {
>  			  "GNSS_BOOT_MODE";
>  };
>  
> +&psci {
> +	reboot-mode {
> +		mode-bootloader = <0x10001 0x2>;
> +		mode-edl = <0 0x1>;
> +	};

Why is this reboot-mode mentioned here ?

Can this not be directly mentioned inside lemans.dtsi and similarly for
other SoCs ?


> +};
> +
>  &qupv3_id_1 {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index cf685cb186edcade643790ba22f6a900beb85679..5bb27665cfa95954543f7a66ec424452ddeb24c5 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -622,7 +622,7 @@ pmu {
>  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
>  	};
>  
> -	psci {
> +	psci: psci {
>  		compatible = "arm,psci-1.0";
>  		method = "smc";
>  
> 
> -- 
> 2.34.1
> 

-- 
-Mukesh Ojha

