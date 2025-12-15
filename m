Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCE3D41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 08:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=olctGR1OoIBKA9JqPtxHxqGDlNhk2l7c5pdiCsPqVzQ=; b=LTwss2xrMxCu74YtV6k9AezA+Z
	fywLmHlvARBlJfoZZDPkt5N0VOVsYSYH3IZuxq/SxOoHSP0ItD68d4rEdScv9cpLjskJZ2mfmW/94
	7ZPkg+pgdZFDTBxiYGx44KpMZ3KaZBDvG1NxaPiThOUVW5uyQs6rLn/2znA5c+WP5fgOk9Fb9IBC0
	aLGdmsX+5bL6QqyU16YOLy66to0AqzgN0PHf5EDLCabw6sVZRI92HzAPZBXqf3QUC0PKy79asoz0p
	ol6JiXkOgoRbAooTpulT379+CfqnteLkoG700EyQ0sG4gx9PTXKwPHFLrpb4GJNzRSDQYRSzqBHHK
	pXjmTUgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV4EV-00000003IMP-3jZ5;
	Mon, 15 Dec 2025 08:47:07 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV4ET-00000003ILy-0axM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 08:47:06 +0000
Received: by mail-ed1-x541.google.com with SMTP id 4fb4d7f45d1cf-6492e7891d2so4203753a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 00:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765788423; x=1766393223; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=olctGR1OoIBKA9JqPtxHxqGDlNhk2l7c5pdiCsPqVzQ=;
        b=VwgEh/dhoEwbh23erYTXBmONGSG810UV+OM+4yMNSUdOi5SXAf03QjhwgFjZzIcLhx
         JeLTLQpurxh6E0bHVjirNZXLtWguQMjelV6w4sEUCSKYAjcKEPsAFGaBmOL5dz7o3kvB
         pcaA9iOfZUpuBZMZUUv77lFK0vnnksR++Wib3aY1E3VPKfCZyg0Z1474B9fA+sculMoP
         TjqkHZ1CsYW7MELgQwVg56CbePkdpogar94GHs5MVJd6Zu2WsHqikK2K2OoUzd6Vwat8
         YsDMvswY2tISL+KsCceQfLzIR4s+P609OgwFKQE7p6vU8+3DZvoT3zatra1UXBEJM4c7
         dnvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765788423; x=1766393223;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=olctGR1OoIBKA9JqPtxHxqGDlNhk2l7c5pdiCsPqVzQ=;
        b=wGXfgFwYm6kralvHYWcrhOVmZ6o0MZJ2AMoA74fpr8lBHPoaCLGtQy0DIWj7dR5RP3
         MwTjiHnxNY29i0ogiEzqVJlU8VxVWmbBf1eZcpNKJRZHEqptjqc6A7+HVPPWtCVF2WDw
         aelYS4WejDBFbh8kY1oa2GzW1TOlh2MljrYQG4K7gVqvsgFnfssvrHSONjDmAgZUJ4KM
         ybZMNke2SFRGeq4VvlbQWbc4HV+UEYHkzxYVXZMM6rxOEyrCVpfjvvViA8+fsV9GTSV8
         UJwGdnX+hP82KheTUSVeYW4kfpPjtr+BDnyf67jgOBkWUial8UtXB1R+sRP58xTpQCRT
         yH6g==
X-Gm-Message-State: AOJu0YwgtfoEgEGJIyWUbiBoQLRdnoJJXxynMefuBK8xdqOdvEbtnVWJ
	I1upEGq6XqipvZJ3cHgSRtKVagTvIyKOFROhyavXnbL5SPpuEuB+QyMxG8fQtEUPqpQ=
X-Gm-Gg: AY/fxX6sYfePE56p3O1DkqjzQJc54Q0BairnLM1jXqDrpeu2u/OAqIt/7+tB+tFyWW8
	chy6ayzrkGWxBPxmsPXUCimey9Ue1wViDsdsW0qEfwzEkYuM93lSA0xK4JS3MekHeSm/o96GKB1
	3FDEf120VLsqfH6o3ydBv/bd/ZBOKuH+Ip699H6ZwvGTxsY3HEM+9Qt5pZ2xLnqpKFjJbEeVPhm
	Pz3tEjJZXvThWP2ILAVivFnImZHN/YLHIaDeSOq1mbfgWpv7TO3kKMDeUGNx1DWgK4YNNTj9YAc
	mZqgPTfvr12YH6Dtwe4nLzIr+rnuM42OvmbEH3jFM1LDu1j7cwabY9Y+CcjYVkyFjMpLmENfRPR
	SYVw7LX8YWtfC5cV+RN9GknxrrxxxzKX/Vkb53Bze4RRqdfv4Px/yUtVGUdHbIXH+MYZwmJu4j0
	BvxpDaDmbUanbsC2Dcyiul43ygrjDlF9w=
X-Google-Smtp-Source: AGHT+IE11WB6QPPr1tBqpVVVM08QRXAEa1dmMcvpY5A4CSjX64MQTPPHz0VIcmU0USVC6McrtkW0VA==
X-Received: by 2002:a17:907:2d8d:b0:b73:8639:cd93 with SMTP id a640c23a62f3a-b7d2362927fmr1008136966b.14.1765788423083;
        Mon, 15 Dec 2025 00:47:03 -0800 (PST)
Received: from [192.168.0.108] ([130.185.218.160])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa29f6cbsm1362342666b.5.2025.12.15.00.47.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 00:47:02 -0800 (PST)
Message-ID: <fcefc3c0-541d-40cc-84e3-9c2460308bdb@linaro.org>
Date: Mon, 15 Dec 2025 10:47:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: perf: fix syscalltbl path base
To: Joel May <joel-linux@jmay.us>, catalin.marinas@arm.com, will@kernel.org,
 Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
 Linux perf Profiling <linux-perf-users@vger.kernel.org>
References: <b2651f20-6f3a-49f5-9cd8-3fb028b2cab5@app.fastmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <b2651f20-6f3a-49f5-9cd8-3fb028b2cab5@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_004705_217004_5EA713C5 
X-CRM114-Status: GOOD (  24.97  )
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



On 15/12/2025 00:12, Joel May wrote:
> From: Joel May <joel-linux@jmay.us>
> 
> A fix for the Perf build process was introduced in commit bfb713ea53c74
> ("perf tools: Fix arm64 build by generating unistd_64.h"), which generates
> the unistd_64.h header as necessary.  This fix works fine in some
> scenarios.
> 
> My problem is when building Perf from tools/perf with SRCARCH=arm64, the
> path used in scripts/Makefile.asm-headers is relative to tools/perf
> instead of root directory.  This results in the build failing like so.
> This snippet is a simplified repro of the problem, see the link to the
> TrueNAS SCALE build script to see the problem in context.
> 
>    jmay@debian13-aarch64:/mnt/linux/linux-vanilla/tools/perf$ ARCH=arm64 SRCARCH=arm64 make -j1
>    ...
>    make[4]: *** No rule to make target '/mnt/linux/linux-vanilla/tools/perf/libperf/arch/arm64/include/generated/uapi/asm/unistd_64.h'.  Stop.
>    make[3]: *** [Makefile:108: uapi-asm-generic] Error 2
>    make[2]: *** [Makefile.perf:972: /mnt/linux/linux-vanilla/tools/perf/libperf/libperf.a] Error 2
> 
> The problem is that scripts/Makefile.asm-headers is including a relative
> syscalltbl path from arch/arm64/kernel/Makefile.syscalls.  The syscalltbl
> path needs to be based on the srctree root.
> 
> Fixes: 7fe33e9f662c0 ("arm64: convert unistd_32.h to syscall.tbl format")
> Fixes: bfb713ea53c74 ("perf tools: Fix arm64 build by generating unistd_64.h")

Hi Joel,

There is a similar fix on the list here:

https://lore.kernel.org/linux-perf-users/20251204-perf_fix_syscall_header-v1-1-b8e27f74ed6a@arm.com/

I'm not sure if commit 1 alone will also fix your issue, or we'd need to 
collapse both of the commits in that set.

The first commit has an older fixes: tag and also fixes some other 
issues so it might be better to take that one rather than this one.

Thanks
James

> Link: https://github.com/truenas/linux/commit/91377b555a57dfa75364d7da85b5e21e41e81625#diff-831a0e8e3eaa7a5ca92599e58771b8a6b2c4bd7533f627e33138873995aac61eR147
> Signed-off-by: Joel May <joel-linux@jmay.us>
> ---
>   arch/arm64/kernel/Makefile.syscalls | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/Makefile.syscalls b/arch/arm64/kernel/Makefile.syscalls
> index 0542a718871a..958f2335ec1b 100644
> --- a/arch/arm64/kernel/Makefile.syscalls
> +++ b/arch/arm64/kernel/Makefile.syscalls
> @@ -3,4 +3,4 @@
>   syscall_abis_32 +=
>   syscall_abis_64 += renameat rlimit memfd_secret
>   
> -syscalltbl = arch/arm64/tools/syscall_%.tbl
> +syscalltbl = $(srctree)/arch/arm64/tools/syscall_%.tbl
> 
> base-commit: edde060637b92607f3522252c03d64ad06369933


