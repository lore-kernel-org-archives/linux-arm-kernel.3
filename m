Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34D5C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 10:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v6fKl01pepPz++C68YkR59kWZjoR1MNzkY+R8bRjab0=; b=KYRMy0npdbG3/VCJQ80Jl88pYf
	tl81mSX64h5YVtorK0tkmgO3fOQTHVm8r4wrw2SOrsi3CiGgn5ivALPbDipxcb07ZCfdTx+zjyHIE
	xmlWwY74XtO5oLVqzP51bLO0HfCRwnQgxk7W5M3B+VgQtccjkWAj9mvtnL+7SLxHaIoENFQwNxK+T
	MUOAAswMy3Ajqp4CqoT16I38La+OPnaOJrgms7cgHOlWNrq4yrzvo7smyMvqsTyCsXR0bvkYIIPkx
	ang8ZuLiu8mODk2SXy20Am6F0Ie2WJfYsWlqUMcGb2p7r8fn197wYOppSIxwGYm0QWE2GrEBP9Vau
	lRSsJUhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGxj1-00000008n6d-38pv;
	Mon, 19 May 2025 10:28:03 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGxgy-00000008ms8-3NVu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 10:25:58 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so32949685e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 03:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747650355; x=1748255155; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v6fKl01pepPz++C68YkR59kWZjoR1MNzkY+R8bRjab0=;
        b=JAV6G25jLfIgxjXxjIRPw2kr4HjzEBCh0B7eisPzloBFTRGcct7LPJx3yLX9ZDJW+y
         lo2c0Dp/YOt3kcQEZYOb8GuHABKDgDmCpHq+AJuCKQ7hFnKXovMsQzSD1ptv12VbcMH2
         xkDkrS94Meu1YCmAtrIKszXgOrnIRmBhm/4mc7De9GIdCo9mx/WFQKQfRu5+bPoKXU3p
         ooSDZnqUyMExjKemcrSCNySUk7oUmLL68/UV05Zh1jmd3jMwZJ7E5ya4dh+sVOSqSiKQ
         JE7USLJoS33bmLRc/roTyRT5XlYl6MCPohLswdHe608egIrwM59aOx0iNlVTqdYUYsWU
         EbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747650355; x=1748255155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v6fKl01pepPz++C68YkR59kWZjoR1MNzkY+R8bRjab0=;
        b=sokcd+lCtqToIeTNFrTvRkspC/HRN53MyzhsBEwW7odRZj9kQr+4f65beoW7pOdPjE
         fJeCrE0rD3jUK6MdyIhubPy2etjCENEKbG070Yz2GPpHdZ719s5prkm2yRjPq6Za6Jfd
         fg68367nZT+YDhSnswTmIqw9hlNvca5Qpt4qi9PgBezBgBglFOYYJsuYI2GTQ2OSxW6Y
         RBDy78Zb2IBRZEsucGF4rjxuV3QtxSL1sCFHs9FJr54t+RuRdDonZIXOcVIrq/oZISwu
         oUk7bwxifhELerEas98HagtHUiQf7boeJWVeL4SrfkQ1D8ugbUXf5gLQmut9Vt/5qslx
         XFjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1oLkpkrofEuL81/6ePTEez7iatvRWauHTkmJtMMLewK4i4Q1+dd+OqFrbfLhyXeViniVZD60vYIqrHxdk4Avv@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3mArjigVgqfEJvORBE3AtMJQdIYNZyVV5iTgHKnCoGaaWR/G5
	W0Nmn5RYoiZ6WKa58rBfwtZv6kPwUYNeljVW1ja9md+9qVspR1DdeeOGt2ly4CXZ3uo=
X-Gm-Gg: ASbGncvhaoByRjDzv9Aowin4ZiiT3Va4gZUNqJYcO0n2PAsQRctQRRJva5VTRmDXOah
	r9YEqCtr8BwCvTGQpOQLwEw1W6uelhOQP58xnf4ZmJ19Ni3bJ8CIiaGG+wnJeYBGUy/RvxFBL5e
	elE8AddlUrT2Ua7s7gRR70490pTm2BcdmIsOUcaBm+ilutW4BHRLto80XBgcMQj68MjakTi6vAf
	xNTTiwKYtimRLaQTonXQLlyT/5/TtQ6K+6EOC8eku1sDFuHZ6pjTloUKcAtv3KLcXzsoV27w20q
	3gi9ewXyD822CG3Ui9ZNQaruPuefaCVcMTcldwtRjloT4CkfWzVyot5N
X-Google-Smtp-Source: AGHT+IH4gcowvuA8DujFFeHc07e+oNKUAsI8ShmqZmjzECudwGDbx/+l7QdDfmfB08rAOTsCA3h/rw==
X-Received: by 2002:a05:600c:4f42:b0:442:dc75:5625 with SMTP id 5b1f17b1804b1-442fd60cb7bmr106438175e9.5.1747650355085;
        Mon, 19 May 2025 03:25:55 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442eb85a8f8sm122871855e9.0.2025.05.19.03.25.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 03:25:54 -0700 (PDT)
Message-ID: <8b7be083-cef8-4b68-af4a-2bb5b30a9b9c@linaro.org>
Date: Mon, 19 May 2025 11:25:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/14] spi: spi-fsl-dspi: restrict register range for
 regmap access
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com, arnd@linaro.org,
 andrei.stefanescu@nxp.com, dan.carpenter@linaro.org,
 linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Xulin Sun <xulin.sun@windriver.com>
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
 <20250509-james-nxp-spi-v1-3-32bfcd2fea11@linaro.org>
 <20250509140622.n2tc3dd23ylyux72@skbuf>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250509140622.n2tc3dd23ylyux72@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_032556_859335_267CAE4B 
X-CRM114-Status: GOOD (  17.07  )
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



On 09/05/2025 3:06 pm, Vladimir Oltean wrote:
> On Fri, May 09, 2025 at 12:05:50PM +0100, James Clark wrote:
>> From: Larisa Grigore <larisa.grigore@nxp.com>
>>
>> DSPI registers are NOT continuous, some registers are reserved and
>> accessing them from userspace will trigger external abort, add regmap
>> register access table to avoid below abort:
>>
>> Internal error: synchronous external abort: 96000210 1 PREEMPT SMP
>> Modules linked in: fuse dummy tun hse sch_fq_codel openvswitch nsh
>> nf_conncount nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
>> CPU: 2 PID: 18231 Comm: read_all Not tainted 5.2.33-yocto-standard #1
>> Hardware name: Freescale S32G275 (DT)
>> pstate: 20000085 (nzCv daIf -PAN -UAO)
>> pc : regmap_mmio_read32le+0x24/0x48
>> lr : regmap_mmio_read+0x48/0x70
>> sp : ffffff801123bb70
>> x29: ffffff801123bb70 x28: ffffffc873b5c000
>> x27: ffffff8010b408f0 x26: 0000000000000001
>> x25: 000000000000013c x24: ffffff801123be40
>> x23: 00000000000003ff x22: ffffff801123bcfc
>> x21: ffffff801123bcfc x20: ffffffc873a9e500
>> x19: 0000000000000024 x18: 0000000000000020
>> x17: 0000000000000000 x16: 0000000000000000
>> x15: ffffffc876189160 x14: 0000000000000003
>> x13: ffffffc873bf73ff x12: ffffffc873bf707e
>> x11: 0000000000000000 x10: 0000000000000000
>> x9 : 0000000000000000 x8 : ffffffc83fca4e00
>> x7 : 000000000000000f x6 : ffffffc873bf7083
>> x5 : 00000000fffffff9 x4 : 0000000000000002
>> x3 : ffffff801061f058 x2 : ffffff801061ee18
>> x1 : 0000000000000024 x0 : ffffff8011490024
> 
> I think you can leave the register dump out, it doesn't seem of much use.
> 

Will reduce the output and add a reproducer and fixes: tag.

>> Call trace:
>> regmap_mmio_read32le+0x24/0x48
>> regmap_mmio_read+0x48/0x70
>> _regmap_bus_reg_read+0x38/0x48
>> _regmap_read+0x68/0x1b0
>> regmap_read+0x50/0x78
>> regmap_read_debugfs+0x120/0x338
>> regmap_map_read_file+0x44/0x58
>> full_proxy_read+0x68/0x98
>> __vfs_read+0x48/0x90
>> vfs_read+0xb0/0x130
>> ksys_read+0x7c/0x108
>> __arm64_sys_read+0x24/0x30
>> el0_svc_common.constprop.0+0x74/0x168
>> el0_svc_handler+0x70/0x90
>> el0_svc+0x8/0xc
>>
>> Co-developed-by: Xulin Sun <xulin.sun@windriver.com>
>> Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
>> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
> 
> Do you have a reproducer for any of the supported SoCs? On LS1028A, "cat
> /sys/kernel/debug/regmap/2120000.spi/registers" runs fine and does not
> crash.

On S32G3:

  # cat /sys/kernel/debug/regmap/401d8000.spi/registers

  Internal error: synchronous external abort: 0000000096000210 [#1]  SMP
  regmap_mmio_read32le+0x14/0x38 (P)
  _regmap_bus_reg_read+0x104/0x140
  _regmap_read+0x19c/0x2d0
  regmap_read+0x60/0x90
  regmap_read_debugfs+0x15c/0x330
  ...

Not sure why it wouldn't be the same on LS1028A because the register 
layout is basically the same. Maybe it just ignores the read instead? 
Either way I think the fix is still worthwhile to backport because we 
won't be able to test every device.




