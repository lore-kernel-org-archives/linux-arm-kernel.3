Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0377FCCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 06:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TXB5nJozBeUSUfmi0Lz+MYkiJUeY6V0tmx/cboDkFLY=; b=ElDhFIuk14R+QlVxRDUMO93O6o
	zUNu0wXW/j8lMNBPZscwexy3w3JqUw/zRbD95f3M/c+KbSLswqejVRNkYF/XwTb9egvung0gLkexE
	B73a/bRkYuCPDYNAgx0LnuLpyUAAIozb4aWx+8lB/EM256VFZ84yObFGCN18e1i4EcGCjTSJ+FDqx
	PHcSTfWv+QZa+/vc1P6SOOq1oUuRISLkQJERByAIEuEKIfW7n/8GQ2wgwI8kYCnghBwM7N5GjSlXv
	sVMqjSSzQcJxYG0GAldWmDLuZvLEMFPJrEwYGHasmmuv5aDauVD6VAIxsQk0K4e5qSAnXeMTtz+hQ
	Z0BjzR5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vPr-00000000eQA-06uk;
	Wed, 15 Oct 2025 06:55:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vPp-00000000ePh-0BpV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 06:55:18 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2s7SM002556
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 06:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TXB5nJozBeUSUfmi0Lz+MYki
	JUeY6V0tmx/cboDkFLY=; b=QqUadTo04FZBGSEHNT3wH2hmQAOObsSR2bX3r/Xw
	jdd9pY1qeVHvYx+42EQ/WitzbGb3MmYbcIDGFXo1CFkXWaI4B4GchmcUnQXbJV/9
	BH86iYFa7Jm7O4wdqMoC5sQ8L3ToA9QgFQkpPva6wp6lDm4KLWSSnacqJdnPSYvy
	Y/vFak9EgeeZ7o+68+xUYY7IqrOJ1OHstbN2mooGEYLdDXDosjQ8dB6G0xju7O9C
	5Yb53L9tL9dOYF1az+3paNWe8eagwYY/iOoemckuHekwFkpZGd4MTXoBFrxa//E0
	umU6/Truog4dPnX2MOe7QMtwyF7YZf4jsf0FLHwO2nLT2w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd93fa3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 06:55:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-339d5dbf58aso23185554a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 23:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760511312; x=1761116112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXB5nJozBeUSUfmi0Lz+MYkiJUeY6V0tmx/cboDkFLY=;
        b=gMH3ltSjBiIG5qkzfiMTrEAFy+XZJdsYhMovcXmO65c1p1I6xZfylbG7vIMGpUrqlc
         /w27xy8CmgIsK2StP7w0UtXVCmfVOXrVtiD9FIow0Z4QzBWC+LyUGeMHAW0GqabGfOZ8
         SpJQmBpcUTRJks3yjDpN9+plRiOqFm84SGM5b++ge6sNRrcjzO0PoT4qPQeQFaw2pJHX
         XcC6JAjGxaaSU5GvM/f5pNTe4O3plgFpVQHuTXJQ3tNb/JW9ieB22DgrhJHLWpluy6tm
         2ijSA13BJFVq+tBqCtwjg4mh+GCWem/Slbkq+QkfSsufoMz91LzXZtFY2Mt+KwE1MlWv
         prsA==
X-Forwarded-Encrypted: i=1; AJvYcCUyK1JfcZVgrD/zrcXn7coyaZsMHlYx6AyGdGjRBwJRaWRRItZ/uxsxYcjGPwiidW2Tng4BbSpVlb3nyq9V4LWA@lists.infradead.org
X-Gm-Message-State: AOJu0Yy03Vpfn/idq65P3qj8rL3b+GLFwq1tXbRkvUwIFv1R1h15VZDv
	xWRB2g+9ri6mVk1V5AwCJ6kaQcdl95nt3pm7vJ1559rIpx8ptHQk4J1cYz2Ckev2O/Zcbc0lthF
	53cYIYjIyXINaESEhp0vi+ARXWg/NJgBI4gm/dXEjFg9JlSi3Az1cEgYtt1d8VbIbmm8wMXk1is
	c3Qg==
X-Gm-Gg: ASbGncvPwzC88vWVuxlooNNXdnr97O1mogk9UpnVfGGnRnRZoLNkGZNTqqeppK+ES+L
	w9MBZ2qB4KEjFrsIaKZ+quzcIW5qIqFhVDhXcRxzLgN4fIhx9fkmVLe5IKD3yaLtJ76SUCAg26b
	wVx3eKnZEByYHrzZmNtMVzBrwhynifgysAnhVMbHFgGjl16iIhvy6oHU1fqEzSsrZZBiJqsJb7m
	fS9Ii76IdL0wGUnJqMh8eGx+2vWlRlXlLwfS7f7+7RwhjE6TUF4ePyB5XhaNtU4xgD2Zj5C7YGo
	FrWUsJPD51s33pOucC+m/ywG0EkcMezoFXsB7zBmaBAftYEVukOpAr3v5P2vcOGmstaZ2wu7fg=
	=
X-Received: by 2002:a17:90b:3ec5:b0:327:e018:204a with SMTP id 98e67ed59e1d1-33b50f85081mr37168971a91.0.1760511312003;
        Tue, 14 Oct 2025 23:55:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7PQa4vHNUgbJuh2uPKnDF3CrlxsqSIGMWHhVoDwTgNv+/9QY6DRirS1HikY5vDY9hqKN+Rw==
X-Received: by 2002:a17:90b:3ec5:b0:327:e018:204a with SMTP id 98e67ed59e1d1-33b50f85081mr37168927a91.0.1760511311418;
        Tue, 14 Oct 2025 23:55:11 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b9786e602sm1207949a91.11.2025.10.14.23.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 23:55:11 -0700 (PDT)
Date: Wed, 15 Oct 2025 12:25:00 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
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
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
Subject: Re: [PATCH v16 07/14] firmware: psci: Implement vendor-specific
 resets as reboot-mode
Message-ID: <3978e740-0589-4872-8f2f-1162084d3818@quicinc.com>
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
 <20251015-arm-psci-system_reset2-vendor-reboots-v16-7-b98aedaa23ee@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-arm-psci-system_reset2-vendor-reboots-v16-7-b98aedaa23ee@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 9K_Smx5j89JXX_dqpVfgiGfmmyV9hgd5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX8HVBvfkLrLgL
 FiEmApiMj0YCxO4I81ksN2EKQMkKevZhkBq93WwrFebSu60PsWczTs3rAUFOFt6w4obSUnfygpl
 nN7XJLa1YMjiS3aETmp4Y7dTsur4nOBiBymPxFW6NGtrR7FlTYceFRIOqLb0y9iTWpdObUr1qCb
 AtKuOhlqSo6y6xjEHwHS4FrtzGzfp+xihgMHp8W4B/+SF6RWUsNLX5VQ36S+YPjzhoyhP4Z9fSZ
 zJekp+VtpeoFNVdwtH4sU8Xk2ufrBhk6dW5ShAARgCiybLLdss+1aaEyCuu1dwSDVglSKBgqCh3
 WumoKAIF/KCkfAmnQ4Jk85C9x5aQfB6EZeMrXyFodf3lUuvph/Uh51M83kDwYSz4HPFieNUYGkO
 c496k/IxG9yjEbixagC8j78n1tYmVQ==
X-Proofpoint-GUID: 9K_Smx5j89JXX_dqpVfgiGfmmyV9hgd5
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ef4551 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=BmsMZzT-mW5IMwsoq18A:9 a=CjuIK1q_8ugA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_235517_091221_30355FE7 
X-CRM114-Status: GOOD (  18.55  )
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

On Wed, Oct 15, 2025 at 10:08:22AM +0530, Shivendra Pratap wrote:
> +static int __init psci_init_vendor_reset(void)
> +{
> +	struct reboot_mode_driver *reboot;
> +	struct device_node *psci_np;
> +	struct device_node *np;
> +	int ret;
> +
> +	if (!psci_system_reset2_supported)
> +		return -EINVAL;
> +
> +	psci_np = of_find_compatible_node(NULL, NULL, "arm,psci-1.0");
> +	if (!psci_np)
> +		return -ENODEV;
> +
> +	np = of_find_node_by_name(psci_np, "reboot-mode");
> +	if (!np) {
> +		of_node_put(psci_np);
> +		return -ENODEV;
> +	}
> +
> +	ret = atomic_notifier_chain_register(&panic_notifier_list, &psci_panic_block);
> +	if (ret)
> +		goto err_notifier;
> +
> +	reboot = kzalloc(sizeof(*reboot), GFP_KERNEL);
> +	if (!reboot) {
> +		ret = -ENOMEM;
> +		goto err_kzalloc;
> +	}
> +
> +	reboot->write = psci_set_vendor_sys_reset2;
> +	reboot->driver_name = "psci";
> +
> +	ret = reboot_mode_register(reboot, of_fwnode_handle(np));
> +	if (ret)
> +		goto err_register;
> +

minor nit: np and psci_np reference must be dropped since we are done
using it.

> +	return 0;
> +
> +err_register:
> +	kfree(reboot);
> +err_kzalloc:
> +	atomic_notifier_chain_unregister(&panic_notifier_list, &psci_panic_block);
> +err_notifier:
> +	of_node_put(psci_np);
> +	of_node_put(np);
> +	return ret;
> +}
> +late_initcall(psci_init_vendor_reset)
> +
>  static void __init psci_init_system_reset2(void)
>  {
>  	int ret;
> 

