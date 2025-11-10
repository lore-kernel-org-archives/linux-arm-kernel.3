Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28117CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 12:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2IgPVPyVRRsi/D1MFmgaBqGT72nrHauEpDjvZrgZuI=; b=vQeJP6TjV6GfS18JBzk3/V9TMN
	cMr9xCBxw+u1dMe06eHRGAoRMcjYHgXoleNFXxKfLEppA3uoPA01XGywoUn62I//m6DLA5yX2RKGo
	wCqojGrpCS3JVSBcH2i+srGx/PVhx0qKDt3r5QPJ6Age3Raxy3T32XpNPq2v3wvw2H19f6fE4aQTW
	nS8JEwMY+YY9z9hjB7+FUKx/jVE7NWa8ZBjWzOh/icmpKBPBvRHLrn7xC9yoC2Iwrm77IIP4YVtly
	kHKlMYTxD62MeOehW2oDdjE/NrQOJ0GBpVD2Ltp+BkTJK9T680Zj5DG3lZx/oP9e7+dlDvwSLSgv3
	mJaPCyeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRBf-00000005QKr-1M4e;
	Mon, 10 Nov 2025 12:39:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRBc-00000005QKV-1Nqq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 12:39:58 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AACGOuT2407319
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 12:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e2IgPVPyVRRsi/D1MFmgaBqG
	T72nrHauEpDjvZrgZuI=; b=nbrt13bM+lUj0jm5eumHNYlAygG8/VKbbvzM8gw5
	X+jVwMljLMS3JEpFW3rzvDMlPt1LnyOlutiKVaPRGkxXXOuDsfQn5PjjaZ560nsQ
	XqycPkbcBvTXTNOsO72XR7YXCwPFRPx8jU9GuHyfWLJAcuojz8cwfi3ZeSv/WP+6
	4D6X5S8D490C2Q8DbSvrlCK2h79ZO5gA7T9heFeaVCFzQW7GQEoYl9iOrgcxSIag
	tvMDk48I/v8B5zKOqGOXkNCEaEJBpb5OQSifyVrSB6JhbcpSWYXXkT8nJ2vkLUh6
	ai/k70HiQIoBqLnIwE8bysAKnsvmL582DUTIjIejPrFeqw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abatd94av-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 12:39:55 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b55283ff3fcso2210784a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 04:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762778395; x=1763383195; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e2IgPVPyVRRsi/D1MFmgaBqGT72nrHauEpDjvZrgZuI=;
        b=KPQ6wUoiGZ3zEDerArv5vz1euid3TxPVVMx6o3inUDPPnxXu6dDrCHu6cFIHQFHu8a
         GvQLQXaOG+xlrwAnPSFjBcja98Ti6L545mXqq+HlT1LUPB1qT+JnlS5o7RL+IrZS+d2t
         fV0jDa+aI9lFxfRfNXeR/g7SNTexqTw6dkMae/Lluq3Uc+qzq9jKFTIFuEEl9PW8rtRV
         zgPiwSJ8ruZ14tAbch586q+K5mJ0v5krxGKCCeq8W7042oF6F60DMVIFl32heJXoybxt
         8ZMF1Rxx1rhThU5VtGVCJKQCbDc1C9+RXkDTJKPTVguF+ROOTqOCUXp24pAJNgQca0H8
         Nlog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762778395; x=1763383195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2IgPVPyVRRsi/D1MFmgaBqGT72nrHauEpDjvZrgZuI=;
        b=buzmulIKOKAHraN020Cxv4XqvraHAKkDUgTh+a5pemdo0Zy9rPOrzxA8+nS3I7M6+a
         cjFtS8toMKNX8FEQIAM2bstll9UaYyqU3RbRnz8LNmvlgEZthhOklCpiXRfH6Jdmjtz9
         nV7zE9PIpnLCtR1JOPyNST9AicE0rlblzSgRFZIy143JTJTymN/mlxGODjw65SpdnG9u
         7AB37TZrzDgEhYi+VJ1MKql6xIvwtPqaUMlVhhKCGwBzDY7huzjF4ckNJnpvSRIcc9zi
         K8AIPcBP/aE50uR6fcsyUudYY8mitHJXr4VGs6TnY/Z1//2cRhGbak6VxyLbFtlBseAK
         XAdw==
X-Forwarded-Encrypted: i=1; AJvYcCXEYQszB2HZix8CBX3xOR7ddMfHuJEBxyBkjF7ib9qycZ9sn0lnq5ZzvjExE3VOg5kqx60tvArOBbWCkZXofZEV@lists.infradead.org
X-Gm-Message-State: AOJu0YzmKS3MFgIPBNH8ffAjANwdwKmx/pMJZZdia05VVAEOkfAwnekD
	XS209dWAcuaFrM6z1ofn4NKWebbplg8JbXpaDMmDk+nl4N7cAFxHfc1n3LSq56r7opJV5vr1JnY
	/K61FTAILnVtxHVBgbz8dWsQYMVLs02skKPYGcRruFpxo/+xQrAFhF0c6mRNfKyHWHdc+BsukrN
	mqrQ==
X-Gm-Gg: ASbGnctCvJAu9Ih95I4BuNQPQUjFL/Ag2+jBJl81GWmU5ez9AywSzZkA+zjIGRpIdFW
	OcHw+Z6p/jVm+C+kFktcl+hC9zGXrweiw1n1cRBqZpUsQ8ixoHgDPjI1wI/LIO/xvRXIpQvcKKE
	XKxJyzbgqwXhuEFwTb2oneHP6SNikpCImijwAiR/sgdGl5arVyoAI7GkbWMhbS/egY5qwyn7uog
	FLAmh8fl8tbStEHosNKSk7uleA6gD3eilFX041yjQY+En7Fwicf/nhvCz9xVLwLXgWtzOcmb62R
	O6z74M0SZZMztGb5H9Q5ezOUat2Zud0ZbC3PrXQe3nntLFY2hCXRAwNJmx5ZDjAhfc1HM7gUD4s
	+Tw/NqWieI9fJ1I/NwJJa0YQitw==
X-Received: by 2002:a05:6a20:1590:b0:34e:a801:8168 with SMTP id adf61e73a8af0-353a3761209mr9029361637.47.1762778394809;
        Mon, 10 Nov 2025 04:39:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvhctT1tSMNG6n13hgt6Z/xjKjFvhH+tqumfj5n8eOBUIH/gDUalEKFufsKHlASPMhRfKS4Q==
X-Received: by 2002:a05:6a20:1590:b0:34e:a801:8168 with SMTP id adf61e73a8af0-353a3761209mr9029293637.47.1762778394021;
        Mon, 10 Nov 2025 04:39:54 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba902207232sm12378012a12.32.2025.11.10.04.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 04:39:53 -0800 (PST)
Date: Mon, 10 Nov 2025 18:09:41 +0530
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
        Song Xue <quic_songxue@quicinc.com>
Subject: Re: [PATCH v17 12/12] arm64: dts: qcom: talos: Add PSCI
 SYSTEM_RESET2 types
Message-ID: <20251110123941.deecglwnwvhl3soe@hu-mojha-hyd.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-12-46e085bca4cc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251109-arm-psci-system_reset2-vendor-reboots-v17-12-46e085bca4cc@oss.qualcomm.com>
X-Proofpoint-GUID: 2ktZiURb75uvN8bc3w3eH86TE7GdWoJE
X-Authority-Analysis: v=2.4 cv=eZowvrEH c=1 sm=1 tr=0 ts=6911dd1b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=jMKWaxwz1VYOFM6W6AcA:9 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 2ktZiURb75uvN8bc3w3eH86TE7GdWoJE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDExMCBTYWx0ZWRfX78m8Zq0QnWZI
 E2NqnwILcbCZaqCvnAt5eyl9JxIIazKTgxua/U/d1Ea8rmniNo8SqmGJRDTX1hqO1Zmv6J+hEWm
 fwdq2uRJUxjFBizDkIFXA1P035zPN7+rH2eG8xN6caO/RiKVMNIj0kRwJWT6Vgfx2hqYvSFaJnZ
 Ce0MW2BVfr/49WFYNhErk6gOJC9r1zmf400H53fbS2P6SM/5SV200DU9fH3taN8YmSNPOsW3oHd
 5kUJU7XWv7HUGrzbdURSBNMdMEcCCe2rR8jGqRluWQfFDbskPR9xWDs7/2qn+ZTgqv1UdaLJvYv
 +CItG9Ky7WyqiG0rlbGw+JjCWPWLTFIut+SkyhniRUT6tRhgsUPO8Bf02QXt2OAAv3F9u+jdwAu
 JdId7oEAPTsGUcSNxN2bigH1atCylw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_043956_382680_88F8D09D 
X-CRM114-Status: GOOD (  20.90  )
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

On Sun, Nov 09, 2025 at 08:07:25PM +0530, Shivendra Pratap wrote:
> Add support for SYSTEM_RESET2 vendor-specific resets as
> reboot-modes in the psci node.  Describe the resets: "bootloader"
> will cause device to reboot and stop in the bootloader's fastboot
> mode.  "edl" will cause device to reboot into "emergency download
> mode", which permits loading images via the Firehose protocol.
> 
> Signed-off-by: Song Xue <quic_songxue@quicinc.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index eb6f69be4a82ea47486f5c8e39519d0952b146cb..c946d07c540f5ae40f147ccb06539ecf0de18df5 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -612,6 +612,11 @@ cluster_pd: power-domain-cluster {
>  					      &cluster_sleep_1
>  					      &cluster_sleep_2>;
>  		};
> +
> +		reboot-mode {
> +			mode-bootloader = <0x10001 0x2>;
> +			mode-edl = <0 0x1>;
> +		};
>  	};

Feel free to add

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

for Lemans, Monaco, Talos ..

>  
>  	reserved-memory {
> 
> -- 
> 2.34.1
> 

-- 
-Mukesh Ojha

