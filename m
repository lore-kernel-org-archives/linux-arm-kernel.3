Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D722CCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 12:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvC5tylk1sHK0qkeaSY7kYE/Js6EfOGyj+3jgzqwPC8=; b=gTSpO+0DKVt4LIFYtB2PZgG9QL
	+LtD53Vyg8VTLEVf4kqb0owE95/tyl/PUpaxPmu2zz155E37DzKq25OvZVp8O7PAdxoasLkxc1BSh
	of3oDf4PN4rIDZI54ZMgtERG2pzQYRiYNq6EBPNpOLQU90sfnPk35jt36NvMXaIr2NxYBecAbrfpi
	9PzeMJccF3bVSQdO1eem8oNTfJTDVxyS7qSS5qh4ds9IgmxKmctruuREyexaT6XTRwW7HcZOgyBhj
	7CkXeUZAnTTXle6AjZWcPoQxFSTMA5Rn8c326DR/WHB0eW+pIRVKXdYigXzJhUrT7KZq1GoQZ67tC
	DAsDUyzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIR0k-00000005PGi-2m1m;
	Mon, 10 Nov 2025 12:28:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIR0h-00000005PGF-2Jip
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 12:28:40 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AACNmAR3308282
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 12:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xvC5tylk1sHK0qkeaSY7kYE/
	Js6EfOGyj+3jgzqwPC8=; b=MvnMhZxl/iW4KuAs8Wm7Gw8jAuvAb8KfulrNlYNg
	EScblnQuteuG8Mra9hOdYcdbij+rPGyoUgdeWje1mgROtnvIS8haMsfs/IIOeofj
	3OtdieslBjRPqjtWo14eD8P6TMFhdWtbNd/dqoIpNzkRnBr1c0T+vOkK6oYuP/go
	hxUzbPEAKu5DoWc9l3WEkYoqAPjHidipz7IWNAhEQU2KvIZQhzJ5JWYI2YvSJyfM
	lmDYkHh8oOr0OiDS6ELrzOlRLKgpMxWtrVCGG4InRuCseYx8Tx/rdNxl0TkeFHg3
	M3whPPYegtzsIw8C6LYu+p865PVPDaqjGAQv7bu/Ht0B9w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abg0q80es-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 12:28:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297b35951b7so52194935ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 04:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762777718; x=1763382518; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xvC5tylk1sHK0qkeaSY7kYE/Js6EfOGyj+3jgzqwPC8=;
        b=Ubd1s71QpfIdYhcZvnLsujpdYNqF2py851OJfZZYhDQhBU4CEaxDVp8gWohHzShxCw
         C57KKPoDVPHNFsKDwsITDGg20vZmy/TgnHKW5SupG73zis3CZVfVX3JcSIV7/CMphUCc
         wcM/N8qYcADIY8sN6wp+Av3a2BEDi7UmpuhZGawjqzRSaUYx9gRkLTCVWm+rngYlAEem
         28ngqxYeZtO0F7t+UtJbEic/8LgavVlsuckfMBqdo2EWADPIaIiTKZWauuWMuBfaCAIT
         uJYNORV5CN75brD/A5jFia0u2DuFgivIZUT4rnqyY+6pBzpLtQxwZDhuljvg0JURfC5t
         EPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762777718; x=1763382518;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvC5tylk1sHK0qkeaSY7kYE/Js6EfOGyj+3jgzqwPC8=;
        b=SHI+4BHRjzTZqKCuTyxas5Qs/BAB22b6aI6G2loalz12Yz/chkNbOzJqX5SdEO93vA
         Y2DGKsF4V3cm3g37cDoG9TIWYw62mf5A/L0f7cPB+MDAaVljiDHKqRw5Q82ZnwFEX8v7
         a4DHF3cM4Op21eAZ1708BCbK56sj52qH5LUJzQN+IgS9n+SLxzTrTXC8veyvQOVzTJ1N
         UOl1f5Anx15Y922/E8ZH3djxfZkjqXnnszI+2kwU8UcKW/BvEB2tnCGD3tXAwvmlDjAF
         28mCQTd15tv+VYs6AnzlmGxYwN2LXMhZ3laTuZ3xDPteNfccNFSHk7Dze+unJUQ/BBy9
         DtLA==
X-Forwarded-Encrypted: i=1; AJvYcCVxRYTlllT6fouh4K3TmSkg5uB2weqcd/yRaSF6RthlT5wsficXwBKLuSydK14XeuNYRthgVVgIdtKcjNvRuJbt@lists.infradead.org
X-Gm-Message-State: AOJu0YywXsxquhAt/J3jJpZfKqvbAC+EBCLy3XGYJKUjlC7gRs/k2pj0
	zaDpeTBZ3cMyOefh97g5Z+/bZsdz/j3wgiy1FPT5VAAQ4NY5DrFAW8koP257ficHMYu0azyHUqZ
	27y3Pb8mu6fzbzvZWJOxYF8+u8fV5/zXPPSft99z4ToTOtnOjZL5/+vcREO8F14zb3oAcuDzkN4
	hHVw==
X-Gm-Gg: ASbGncsycP2eiS5jKQ22hFCsgdA5WyQHJVH72SrFP2QbHJ3tg/UWnhYgMIBbEQk5Rcu
	q62NgA5lBriIFReewtIZ3Oz52mV/bSMPh7zX6o2S+RXXNGgIdr8aJTO97NYnaEO8PPcdaBRDxpv
	dSoK8ZxUjIp5T4jO+27UG8fQjeSIaYLc0wRdHBT+zNjSy8Mc13gV+nqTLgj+3P0fmqutI5TK+gd
	LRn/XpBeDAcm3TU6wY9ufjNcBUQa6jHrx/dUKCBHNWG/w+p7nygPyd0LQuKX+qyOJyPNvGt8Y1Q
	Io5gwI7kiJr1xxg3gOF9LS7Y2DZVJzUbguJ89ObSkHlrnV6Iln3umA9i/yspbjJPPO62QPQzqe/
	m3JQGo27ZWnGd89LFQL+IhNy5tA==
X-Received: by 2002:a17:903:2c03:b0:296:5ea8:ed7c with SMTP id d9443c01a7336-297e562e81emr111981505ad.17.1762777717528;
        Mon, 10 Nov 2025 04:28:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwNP3fxkUJGLqN8FHuaSG3OfyFaMMBHENbvYTPgP0pEg/sV6ty2vZFcY/LvfBaaJEc8EM4Tg==
X-Received: by 2002:a17:903:2c03:b0:296:5ea8:ed7c with SMTP id d9443c01a7336-297e562e81emr111980905ad.17.1762777716858;
        Mon, 10 Nov 2025 04:28:36 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c93cebsm144992255ad.90.2025.11.10.04.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 04:28:36 -0800 (PST)
Date: Mon, 10 Nov 2025 17:58:24 +0530
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
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v17 09/12] arm64: dts: qcom: qcs6490-rb3gen2: Add PSCI
 SYSTEM_RESET2 types
Message-ID: <20251110122824.5je5jfoanivl6xrh@hu-mojha-hyd.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-9-46e085bca4cc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251109-arm-psci-system_reset2-vendor-reboots-v17-9-46e085bca4cc@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=D6JK6/Rj c=1 sm=1 tr=0 ts=6911da76 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vzLQbmpfVAQOsT_rZiMA:9
 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEwOSBTYWx0ZWRfX0r+smgbRCmCY
 OlEhFVh0VX1CGdiSWh6DxxXTVt6NEhXe7cNleNTXPxDvwYw6qjJNDtEvnu2PAEfX24QRzqcJTVA
 EwNc++loosrYOQJxOqeYQ940gJjcZVCh8z0vKl+7gJETb/PDUC0jgoVl+hY0qPigw6iVH1MyKZn
 SmkTTTn6N3MP5gq0kfWWG1hbzK+k/7MtTv9Hu7nOyPIL3HxnCNQSlHp9Fpl4qD+AdIJq8Dxq2nR
 KzCVsylZERFpyI0RQRTzme9EzK9CpVqW45gfwsC/xUcbpU4bn7JaoCGlLfsOempeyHA+KNfDDZM
 6Vjx9DpxgYZg/Em2chNuqwX9ZuKLUNicQMP+coVcSaiWAJDFuTPRM4QM7kD2ZwplFJa/ZjFm2Vu
 VNAjQLIby3QjBW/Z3sfdYgU7V7RV0g==
X-Proofpoint-GUID: GWWMymVzuJEstYKrn3Nr7Cw-C9IKhLig
X-Proofpoint-ORIG-GUID: GWWMymVzuJEstYKrn3Nr7Cw-C9IKhLig
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_042839_630494_F0782B3D 
X-CRM114-Status: GOOD (  23.25  )
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

On Sun, Nov 09, 2025 at 08:07:22PM +0530, Shivendra Pratap wrote:
> From: Elliot Berman <elliot.berman@oss.qualcomm.com>
> 
> Add support for SYSTEM_RESET2 vendor-specific resets in
> qcs6490-rb3gen2 as reboot-modes.  Describe the resets:
> "bootloader" will cause device to reboot and stop in the
> bootloader's fastboot mode. "edl" will cause device to reboot
> into "emergency download mode", which permits loading images via
> the Firehose protocol.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 721a26d49ccaeb1429e2cc1c3a5c8d9517da3be6..cebdedd5d614b9efb6dfbee91dd67f3c3e322a38 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -935,6 +935,13 @@ &pon_resin {
>  	status = "okay";
>  };
>  
> +&psci {
> +	reboot-mode {
> +		mode-bootloader = <0x10001 0x2>;
> +		mode-edl = <0 0x1>;
> +	};
> +};
> +

Make sense for this as it leverages sc7280 and adding it there would not
have made sense.

Acked-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

>  &qup_uart7_cts {
>  	/*
>  	 * Configure a bias-bus-hold on CTS to lower power
> 
> -- 
> 2.34.1
> 

-- 
-Mukesh Ojha

