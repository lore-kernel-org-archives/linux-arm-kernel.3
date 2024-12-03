Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1C5E64ABB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 15:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7JXue3TltHvVyJp/X83GPnii6v8vLThHqmwjgC6myYA=; b=gPmQs+71ITpmeVwKV7GgsBBNdJ
	tuX63AIAvgf8wJdc+M1RdW9yZwjtiaG8pPm+/vNNtzQWm40Mu1XSymiYBjEtCENTJ+jNIphRY3Syj
	aeIbqJCSP3ZqmAICyO4/uOHsGJ/t9PWaf5FuP9O1Jr/V8MyXjERwxmc4zkHCkm1eDxKPI1n/HUepc
	f/U8DALPWAa4epTztR+VCYRCU7zPOgAi6PGAc+in5f2exOkFGQMLrEs3czetDL//sHgKT6h8Ouh4Y
	srzZeVywvUM7EdMVL818hZ/yVppYmhZFxJaT7r5aDiCIY+Y+nzSnVdPpCYBMe8SqzR1YgM/ZhgORm
	2HXS+tKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUpa-00000009vUf-3PhN;
	Tue, 03 Dec 2024 15:28:54 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tITq0-00000009leO-3pFH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 14:25:18 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5d0ca0f67b6so4592085a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 06:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733235915; x=1733840715; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7JXue3TltHvVyJp/X83GPnii6v8vLThHqmwjgC6myYA=;
        b=Aay/cCketCDzXn23nW9BIK2lrFXmmuHPluB0rpTryUVWMMXiUqAGlQocIXxNWDmZly
         fyfYylEbob1wTBbylZxtwqARChLihS9ggTPJraUQePdjP6USLv06J4pNtKMPO98EzEOc
         yHlkEinpVUipmYAUu/gUdJyqMtgeG63pStnyiM4Hg5wm+t5y3izXhfXtKBDS5MsJ8Du+
         hPYTbfOxkSj7zMJzdVARJp0RJpILrn/z4t3o2yHc2FOitky47LMzkj9QKxj6ochLuMIN
         6CxYTXQfOyKva4ZIu4xbx183qxpNsGPKHBSWevivyDE2Z2J1GoLfUBnlbvCmuQ4k+2v0
         Ldxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733235915; x=1733840715;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7JXue3TltHvVyJp/X83GPnii6v8vLThHqmwjgC6myYA=;
        b=RUKkvGnJakOw85d2XSZd1Ad/qgjBSv2TZKWaNKCJST6IfYd9Bw0NOLrTVqOd4x5imC
         mZBAvrsGAoTIKQ/RQ+01LJRtWW5h9Q679o64/Li0d6NiqFwk7zBlv9uBTNBYGWyt/36+
         tjxRW2t2a77b4/hISFkcFOe/GaM0++9GvLvwzxr4hTVsTUAikVzYopLuetY9H0G8KxdI
         kebLg6wabFHXC+7jpv4om/GMsvJPx0Zd7kDLMQleQAOl3cJFNae/8yQjcMynEkMCi8Sp
         63vI8uU+sbnwu+MjyrDRYIIoP5rHff+cLHNVQgx1FEBlYImjPoGTbcB3XUM+WdyJ+qLH
         3CAQ==
X-Gm-Message-State: AOJu0YzUl5AFO7eCPc2TLM0dxMViXGyZYNfBpd5S3t5hYT4JyjK0J493
	9r9plWy4oEDfOJFBULnSjzupaX5TT/RWGIscE49bXCydoSsFjp7LvfJRITj3oAo=
X-Gm-Gg: ASbGncvLH2eMq94IJrguFzut4R3oLCOLfATQVZoGjiPRLSQPfSRNtI5CNWwHxjJJ2Ua
	3y7Obqv2RM/31fCs6UHPBI0CHHQBt2z0J6Ujdh5WJ1vuAMwCmyZeOwaLCJjoaaqKu99R68HEILr
	Hk1h+kMXNS+Y9rgUcAXzfxNDEA2xgaM+eW65q0aH7m+zT7OtNnO6st/BADBsfPih2+GJspjHduk
	eckmE82qbFGpSQO4V37AtCKChLUER0X+sLClhqWc+/C5TkkZzBvxZ/xdv8y
X-Google-Smtp-Source: AGHT+IFIxu8ZzCLpP/amf7heIGeGIUDYobsi38i+g/Et8m/9aQEZpmJdp8qSKytKJiJPb4+JiCrUhg==
X-Received: by 2002:a05:6402:5252:b0:5cf:3dc3:7a3f with SMTP id 4fb4d7f45d1cf-5d10cb4f105mr1790880a12.5.1733235914954;
        Tue, 03 Dec 2024 06:25:14 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.200])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d0e9bba5c2sm2556557a12.8.2024.12.03.06.25.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 06:25:13 -0800 (PST)
Message-ID: <9cb1ef5e-eb61-4177-a039-4049850196a5@linaro.org>
Date: Tue, 3 Dec 2024 14:25:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 8/9] coresight: tools: Add configuration table test
 tools
To: Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org,
 Suzuki K Poulose <Suzuki.Poulose@arm.com>, Leo Yan <leo.yan@arm.com>
References: <20241127134256.2254851-1-mike.leach@linaro.org>
 <20241127134256.2254851-9-mike.leach@linaro.org>
Content-Language: en-US
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20241127134256.2254851-9-mike.leach@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_062516_960270_AFEF123F 
X-CRM114-Status: GOOD (  27.31  )
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



On 27/11/2024 1:42 pm, Mike Leach wrote:
> Add an example config table generator to test loading configuration
> tables.
> 
> Provides a table buffer writer function that can be re-used in other
> userspace programs.
> 
> Table write format matches that expected by the corresponding reader
> in the configfs driver code.
> 
> Generates tables and outputs in form of binary files.
> 
> Add a config table file reader and printer. Takes in config table files
> and prints the contents. Uses table reader source from kernel driver.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> ---
>   MAINTAINERS                                   |   1 +
>   .../coresight/coresight-config-table.h        |   5 +

Hi Mike,

Isn't there some convention about maintaining a copy of kernel headers 
in the tools? Especially as you wouldn't rebuild the tools after 
updating the kernel headers so breakages might go unnoticed.

[...]

> +
> +/*
> + * sets of presets leaves strobing window constant while varying period to allow
> + * experimentation with mark / space ratios for various workloads
> + */
> +static u64 afdo_set_a_presets[AFDO_NR_PRESETS][AFDO_NR_PARAM_SUM] = {
> +	{ 2000, 100 },
> +	{ 2000, 1000 },
> +	{ 2000, 5000 },
> +	{ 2000, 10000 },
> +	{ 4000, 100 },

The comment above here looks like its for example1, this one does vary 
the window size.

Probably only example2 is enough, I assumed they were different but 
example2 is basically the same as example1 with an extra preset list. We 
could comment that the second preset list is optional and delete 
example1. Saves people reading more and wondering what the difference is.

I tried to make an example that doesn't use an existing feature by 
reacreating afdo from scratch which I thought would be a good example. 
It's pasted at the end. I had to copy paste the ETMv4 macros and 
constants though, I couldn't include them in the userspace generator 
because of this error:

   coresight-config.h:10:10: fatal error: linux/coresight.h: No such 
file
   or directory
    10 | #include <linux/coresight.h>

I also got this error when loading it:

Unable to handle kernel NULL pointer dereference at virtual address 
0000000000000008

cscfg_reset_feat (drivers/hwtracing/coresight/coresight-config.c:64 
coresight-config.c:124) coresight
cscfg_load_config_sets 
(drivers/hwtracing/coresight/coresight-syscfg.c:217 
coresight-syscfg.c:262 coresight-syscfg.c:492 coresight-syscfg.c:610) 
coresight
cscfg_dyn_load_cfg_table 
(drivers/hwtracing/coresight/coresight-syscfg-configfs.c:294) coresight
cscfg_cfg_load_table_write 
(drivers/hwtracing/coresight/coresight-syscfg-configfs.c:799) coresight
configfs_release_bin_file (fs/configfs/file.c:415)
__fput (fs/file_table.c:432)
__fput_sync (fs/file_table.c:517)
__arm64_sys_close (fs/open.c:1568 fs/open.c:1550 fs/open.c:1550)
invoke_syscall (arch/arm64/kernel/syscall.c:? 
arch/arm64/kernel/syscall.c:49)
el0_svc_common (include/linux/thread_info.h:127 
arch/arm64/kernel/syscall.c:140)
do_el0_svc (arch/arm64/kernel/syscall.c:152)


So I'm wondering if we can do the same thing by setting values via 
individual files rather than one binary blob which would avoid some of 
these issues. From what I understand the feature params can already be 
set directly this way via 
/sys/kernel/config/cs-syscfg/features/strobing/params/period/value

We'd have to add a way to add new configs with a mkdir, then the same
things can be configured without needing an additional tool. Links 
between features and configs can be done with symlinks which is also 
mentioned in the configfs docs.

Something like this would be a bit like the current version:

  # ls /config/cs-syscfg
  configurations
  features

  # mkdir /config/cs-syscfg/features/my_config
  # ls /config/cs-syscfg/features/my_config
  description
  matches
  regs_desc
  params

  # mkdir /config/cs-syscfg/features/my_config/regs_desc/TRCRSCTLRn0
  # ls /config/cs-syscfg/features/my_config/TRCRSCTLRn0
  type
  offset
  val
  mask

But another way could be to enumerate all possible regs for each device. 
This would remove the need to have all the #defines in whatever tool is
making the config (avoiding the #include issue from above):

  # mkdir /config/cs-syscfg/features/my_config
  # ls /config/cs-syscfg/features/my_config/regs_desc

  regs_desc is initially empty, but specify what device it's for to make
  all the properties appear (or the mkdir could be done in an etmv4
  folder):

  # echo "SRC_ETM4" > matches
  # ls /config/cs-syscfg/features/my_config/regs_desc
  TRCRSCTLRn0
  TRCRSCTLRn1
  TRCRSCTLRn2
  ... etc ...

  Now type and offset don't need to be set:

  # ls /config/cs-syscfg/features/my_config/regs_desc/TRCRSCTLRn0
  val
  mask
  save

Don't we already have the full list of parameters in 
etm4_cfg_map_reg_offset(), so we can expose this to users via configfs 
directly rather than needing any tooling. And doesn't any new device 
that's supported by the config mechanism need to know about all its 
parameters, so it wouldn't remove any flexibility?



