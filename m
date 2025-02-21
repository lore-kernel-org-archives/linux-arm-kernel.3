Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5661EC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 01:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLdWDE99RnF8L+T7bBwrOWdjhYLCj2lWLdBJFG4CamA=; b=qKtpylxyAzjhfxuofPCHQp5+Qm
	FUVtwftNkK/nOCitRT/C7mgWh2yOWYXRSG0/UhxOTFvFuEcE2oisQsI2VqG8GmVYJnAau9bPJVdUo
	HdX2ygQBwvB26A/6s25/Ly3Jie7WYHLY43MTE5OpuOCZzaBXwwcMKEwI+RtzEkpXOwvGSdFn0OdHR
	e38ZfDkL2/vRF4NFM/uBCnm55Fn/rhihCBc42esY6kn2IcNljd846lemcAGpiQG3Az9jlarON0irX
	avxxRRLvqtshVWn/pUgYGJo3KufsHsC5iZ/fTAn2S0R2HdjsboUiPSaXyO95+tKGeS/skJKC9dZ++
	eH3rtk4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlHjg-00000003eo5-3r80;
	Fri, 21 Feb 2025 01:21:48 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlHiB-00000003eSC-3Wzz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 01:20:17 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ab771575040so478210066b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 17:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740100814; x=1740705614; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aLdWDE99RnF8L+T7bBwrOWdjhYLCj2lWLdBJFG4CamA=;
        b=QuVh/KFaEq7q3D+38TtEs6VTKdnk2HgJBJ5c1rfleZzaHNsqdpDyW5wggjy5JZDVCy
         Bbgd3qbkABvqwI/+PlrCsZtTPeDU/SOioTajRPirCYVaxUqQoLu69C+Wrf59SLiFVuIR
         seNwQtybfyxDChiGlXdLgGCRlow09/iLpzi1n2AFMKbDpw0ahqgjKs28BnrNKCHke6NN
         11Zyb4xu7uc8dvOOUn7asqPtqv5vQWPdsEZvK1lcmvMfHicafvuD+/Y9I+c+VbJoH95/
         Hne/LYRtAee/zaRWtrAw9IqRvsQI77pBP562xSvHkR3F8r3nQkeIVni5pHGHnBbDmif1
         ApaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740100814; x=1740705614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aLdWDE99RnF8L+T7bBwrOWdjhYLCj2lWLdBJFG4CamA=;
        b=iEN0mQW/9zyMBWUiwWgJ9udPuzveFuXBXyJMlIkd42qPUQqOHNFXssj/jvygbkDDxf
         sny0RtObtaMHL0gBo0QES8cF+I7Ps9YTK3+52tFD+dqZxcFDCmG5Zmthz7wflKf1N9M9
         oUKuulQrpPdZloNFJlYqVW8kRkxCYSq2jjxoPdCr+aw7TVY3juhERYqwI4+bNXuaA76G
         blajlnZl0bgNbFWM5amib7ibSWC1WUB6hRjj06T9lxF10VaNRaWMVCK5e/iDKHqQMPQH
         xw2jcSn4mDRKVbnITUkRantK1/JrhN/nYAWxQi4jj0Lj8RP/1gGfCw5SbMxCiLYC0teQ
         Oj/g==
X-Forwarded-Encrypted: i=1; AJvYcCUNWJyyDj69Bwm2Etmgp9Qo53qOAnF60WuehPzrX4c85l2epsWIt03oVGlTj2nuoeSuq+MTTK1wxLyFg4TJAciM@lists.infradead.org
X-Gm-Message-State: AOJu0YwctzmCYYXurUCl0RfZvjA2Z/Vo7pZkwdHSOzYgE9x835Rf5Lrq
	a3AK31Fq/wlCtUhkumWLCzXRR9xEnMoUwbR5cHtvy5EXami62Xta
X-Gm-Gg: ASbGncucLOOu8cZdG9uUyPmRPiUm+p9Q9r+/d3theMFVDIiCggVexYq9V/eBinhvMgo
	W168Z6Za2pZDOcTIz1zJ0HJRMmIHzUdy4JbJsgjqRDoNilVqz6GWU3yg9+PQHRVT9dU+l28E7NE
	sIsIVf0x5bG0DsyVd93vudRWihWhUIiIBJAtV1+F7hRQejKGskfL/jZ78QFPG/W33R2h/TKnE4f
	lsnVACMWufzKTqJ9KukF/vacfb9hO1tTN3CEljUfB3VeU5k4YsxOBAVLldLZO3VC/Ho6Yh3Xc3A
	ysVoO6msSRYeHHcBAOGZdQHl9cPC/2fZt/L3q7Uo+KiB
X-Google-Smtp-Source: AGHT+IGvRDTlkH1zTKRe+mAKqwe3ESbEQp8XsF/35YcwuDu9Yhfk7y+ptfPIYtK+S0ZC3xZG+Qnjqg==
X-Received: by 2002:a17:907:8b96:b0:abb:ebf8:72d9 with SMTP id a640c23a62f3a-abbeddc91a6mr586592266b.15.1740100813535;
        Thu, 20 Feb 2025 17:20:13 -0800 (PST)
Received: from [192.168.1.130] ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8ad6720esm998432766b.88.2025.02.20.17.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 17:20:13 -0800 (PST)
Message-ID: <9028f7a8-7cf7-4ebf-86a6-0d894c66edb1@gmail.com>
Date: Fri, 21 Feb 2025 03:20:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] imx_dsp_rproc: Use reset controller API to control
 the DSP
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, robh@kernel.org, shawnguo@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, mathieu.poirier@linaro.org,
 shengjiu.wang@nxp.com, Frank.Li@nxp.com, peng.fan@nxp.com,
 laurentiu.mihalcea@nxp.com, iuliana.prodan@nxp.com
References: <20250219192102.423850-1-daniel.baluta@nxp.com>
 <20250219192102.423850-9-daniel.baluta@nxp.com>
 <c52e6c5c-f49e-4727-b669-086ae7cb0e1e@gmail.com>
 <6e03b0c09c4e6d222670025c6540f73a0a0a819d.camel@pengutronix.de>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <6e03b0c09c4e6d222670025c6540f73a0a0a819d.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_172015_893570_B7BB6900 
X-CRM114-Status: GOOD (  22.49  )
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



On 2/20/2025 5:45 PM, Philipp Zabel wrote:
> On Do, 2025-02-20 at 00:22 +0200, Laurentiu Mihalcea wrote:
>> On 2/19/2025 9:21 PM, Daniel Baluta wrote:
>>> Use the reset controller API to control the DSP on i.MX8MP. This way
>>> we can have a better control of the resources and avoid using a syscon
>>> to access the audiomix bits.
>>>
>>> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>>> Reviewed-by: Peng Fan <peng.fan@nxp.com>
>>> ---
>>>  drivers/remoteproc/imx_dsp_rproc.c | 25 +++++++++++++++++--------
>>>  drivers/remoteproc/imx_rproc.h     |  2 ++
>>>  2 files changed, 19 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
>>> index ea5024919c2f..631563e4f86d 100644
>>> --- a/drivers/remoteproc/imx_dsp_rproc.c
>>> +++ b/drivers/remoteproc/imx_dsp_rproc.c
>>> @@ -19,6 +19,7 @@
>>>  #include <linux/pm_runtime.h>
>>>  #include <linux/regmap.h>
>>>  #include <linux/remoteproc.h>
>>> +#include <linux/reset.h>
>>>  #include <linux/slab.h>
>>>  
>>>  #include "imx_rproc.h"
>>> @@ -111,6 +112,7 @@ enum imx_dsp_rp_mbox_messages {
>>>   */
>>>  struct imx_dsp_rproc {
>>>  	struct regmap				*regmap;
>>> +	struct reset_control			*reset;
>> Maybe rename this to "stall"? There's also the DAP stuff that's actually used
>> to reset the core so this might be a bit confusing?
> So Run/Stall does not actually reset anything? Maybe then it should not
> be modeled as a reset control. It looks to me like the
> DAP_PWRCTL[CORERESET] bit in the Audio Processor Debug region would be
> a much better fit.

Yep, it does not as far as I'm aware. This bit is used to insert stall cycles
into the accelerator's pipeline. As for the DAP bit: agreed.

(Daniel pls feel free to correct me if I got something wrong here)

For a bit of context here:

Previous approach used a syscon to manage the Run/Stall bit (see [1], "fsl,dsp-ctrl"
property). The main issue with that is that syscon doesn't enforce any device dependency
(e.g: PM) and you do need the AUDIOMIX power domain to be powered on before accessing
the registers from said syscon.

Now, AUDIO_BLK_CTRL offers multiple DSP-related configuration bits (Run/Stall bit included).
If we ever decide we want to access those bits we can't model them as reset controllers as it
makes no sense whatsoever. As such, I think that modelling Run/Stall as a reset controller is
just an arguably unneeded and inaccurate (assuming reset controllers are supposed
to model only actual reset signals) solution.

IMO, unless someone can think of a scenario in which this would break, we should just cut our
losses and go back to the syscon-based approach. The DSP is already attached to the AUDIOMIX
power domain so it should be on when attempting to access its registers. Also, the DSP
should be the only device wanting to configure the DSP-related AUDIO_BLK_CTRL bits anyways?

What are your thoughts on this?


[1]: https://lore.kernel.org/imx/20250212085222.107102-1-daniel.baluta@nxp.com/

Thanks,
Laurentiu

