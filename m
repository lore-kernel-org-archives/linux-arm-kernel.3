Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE089E6C61A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 08:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FGHz7ghiBxVIbssf5/hQmDMUZC5ROBwA/LtGFN8UTlY=; b=khc0JOkyJ0dZCszV5jwN2VN9F2
	pbaMMrXpDQ5uZ7GysOUY561p2HznvQ5v8WwVlfNakXy9NU7wEpQkmTQVdpKa04APgZDDWHifMaUwx
	6U0ZcnhvC9Yx6EHhWtfK+9CObBHgCSiW7VOJBHgSwWXu4jjVdgDCiySi4bR/aZQOO6JJ7t2CnIVVz
	Kb2oXjBxSzQsKIxOLIVIHgmjn1xmpcyHwJ50s991+xkE7vPFgEUHVJLigIfid1oSyMtthiOf190Ml
	tuixdKtHRRAT7KtgUZM38uQ01AJ6b28S/sJYri78wqNQ7Or6HRLXD70f3eq37z5UezrVbxkiRtARg
	ImrPNgSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOkP-00000008mEW-0D4o;
	Tue, 03 Dec 2024 08:59:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOiQ-00000008ltf-2jtJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 08:57:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733216225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FGHz7ghiBxVIbssf5/hQmDMUZC5ROBwA/LtGFN8UTlY=;
	b=L2YR/bTr50036YLMzv/6VnzsYYxfAv3Ow1r8VDzAYjY8exbJ0XTkVlIMnMb2ZL/FvdwG16
	+XEZOnOcoUKAZFkuO9jQDxWbCNoXM1JtnXsQ6IrZUUGk7GbsDQ9iVBJQb4130JHBADQUwZ
	wqwxlwsP8/SrfqFK/Wtusq4zSQ5sKko=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-_WleVPISNLOXRNBlvX7YfQ-1; Tue, 03 Dec 2024 03:57:04 -0500
X-MC-Unique: _WleVPISNLOXRNBlvX7YfQ-1
X-Mimecast-MFC-AGG-ID: _WleVPISNLOXRNBlvX7YfQ
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ee5f6fa3feso5127256a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 00:57:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733216222; x=1733821022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FGHz7ghiBxVIbssf5/hQmDMUZC5ROBwA/LtGFN8UTlY=;
        b=i3WN6b+dDFXN+2lcL/X2NT84IFUKKS91Fctbq/q9taX89j1rYFPFJSBxHMSWKp/E5I
         oExCCqC81NQinqcNswhvOHLlIxas/6dtqXG44TXU8tilwDiQkKjd0oTirQD0ewlIfZav
         whKjhLoGmb1JC/pE6gep4SMZ1X0Y+9GVmPRgAA4s3oEUQeabyn6dC0xn9AyaonuIegCt
         TpDpF2XVGv3iGPjjE+wm4O2Kq0SRt8cx8wLjZPPmPkWGrCKPaoiUCIY78VgA/yeqRuqi
         ssvSHf55nGonKq1Oh4CMCW+/nmb0ZzopkqE8JM0i23xmSfSR3Tv9Yn+dYUIua+nHSPTB
         paoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAB4LD+28+s26I6TJrjkPYOb6xIE8y4jZJOyjJFQc/Xb/b/T0vMrvj+GjgBd3bpr9h4swmRnNnKE7AswkTJ5hK@lists.infradead.org
X-Gm-Message-State: AOJu0Ywroz76EO11mUaIfeBfs7Q6BrfI6nnBJq2skzG2242GACBneDo8
	/xV09xzeJtKy7yOi/MHnFX0rW7l1Kk+526Y/lPRpfy3PfBWXLwMw7zwXL08+OeUjp+2nRZ4Uljj
	VNuMi5IOWbrbFpg6w/7RQ+LF8BBa27/i59M6Maq38e7VdEReBNseR0+9DIrR1kEqvdA3ZPBw9a2
	tmYMQH
X-Gm-Gg: ASbGncscMjffDa90ycPK9wNR8TOYjG9Q11aafk6FlDElqN7OXMpDmopdYHhCKFRX4Hm
	Q0QHAqQWRXq3Hz18lbcQFVnuvpUObSGlgTR41yVGDiV71SLDljwTRG9+aeGWEVVHER3FlbAi3iU
	HgdR6W0U9Y7qbBqNYsOuTDO4vvyQSFbZvQfZc2zsLti3LmyeXUTG9+GvKOIao46V2yk6uiePctf
	DZayJENii1Ft9GwDQhMJdh8/zk2SuuaJZU5hflBCubZ0TC7prI=
X-Received: by 2002:a17:90b:33c6:b0:2ee:ee77:2263 with SMTP id 98e67ed59e1d1-2ef011e4926mr2503893a91.7.1733216222618;
        Tue, 03 Dec 2024 00:57:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIcOl4s6XHMdDXHxmOpeH3xZ9kLRLW+50zloAvOHAMK7Z7v1F6jBYhjBcR7dhJA5/1Z8PpzQ==
X-Received: by 2002:a17:90b:33c6:b0:2ee:ee77:2263 with SMTP id 98e67ed59e1d1-2ef011e4926mr2503625a91.7.1733216215342;
        Tue, 03 Dec 2024 00:56:55 -0800 (PST)
Received: from [10.72.112.157] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2eead160674sm4605513a91.3.2024.12.03.00.56.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 00:56:54 -0800 (PST)
Message-ID: <b1923d68-726a-4864-8661-54588a634d95@redhat.com>
Date: Tue, 3 Dec 2024 18:56:49 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] arm64: rsi: Add automatic arm-cca-guest module
 loading
To: kernel test robot <lkp@intel.com>, Jeremy Linton <jeremy.linton@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 steven.price@arm.com, sami.mujawar@arm.com, suzuki.poulose@arm.com,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org
References: <20241203000156.72451-2-jeremy.linton@arm.com>
 <202412031348.bp5i3ws2-lkp@intel.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <202412031348.bp5i3ws2-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MPhc36uEYAZE4R4fFO6vj09dDVw4rCZt3_YR5Pohd5Y_1733216223
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_005706_767785_581FDF37 
X-CRM114-Status: GOOD (  19.25  )
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



On 12/3/24 4:03 PM, kernel test robot wrote:
> Hi Jeremy,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on arm64/for-next/core]
> [also build test WARNING on linus/master v6.13-rc1 next-20241128]
> [cannot apply to kvmarm/next soc/for-next arm/for-next arm/fixes]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Jeremy-Linton/arm64-rsi-Add-automatic-arm-cca-guest-module-loading/20241203-080347
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
> patch link:    https://lore.kernel.org/r/20241203000156.72451-2-jeremy.linton%40arm.com
> patch subject: [PATCH v2 1/1] arm64: rsi: Add automatic arm-cca-guest module loading
> config: arm64-randconfig-004-20241203 (https://download.01.org/0day-ci/archive/20241203/202412031348.bp5i3ws2-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031348.bp5i3ws2-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412031348.bp5i3ws2-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/virt/coco/arm-cca-guest/arm-cca-guest.c:224:21: warning: attribute declaration must precede definition [-Wignored-attributes]
>       224 | static const struct __maybe_unused platform_device_id arm_cca_match[] = {
>           |                     ^
>     include/linux/compiler_attributes.h:356:56: note: expanded from macro '__maybe_unused'
>       356 | #define __maybe_unused                  __attribute__((__unused__))
>           |                                                        ^
>     include/linux/mod_devicetable.h:607:8: note: previous definition is here
>       607 | struct platform_device_id {
>           |        ^
>>> drivers/virt/coco/arm-cca-guest/arm-cca-guest.c:224:55: warning: unused variable 'arm_cca_match' [-Wunused-const-variable]
>       224 | static const struct __maybe_unused platform_device_id arm_cca_match[] = {
>           |                                                       ^~~~~~~~~~~~~
>     2 warnings generated.
> 
> 
> vim +224 drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> 
>     222	
>     223	/* modalias, so userspace can autoload this module when RSI is available */
>   > 224	static const struct __maybe_unused platform_device_id arm_cca_match[] = {
>     225		{ RSI_PDEV_NAME, 0},
>     226		{ }
>     227	};
>     228	
> 

The definition may have to be something like below, to avoid the compiling warning.

static const struct platform_device_id __maybe_unused arm_cca_match[] = {
        ...
};

Thanks,
Gavin


