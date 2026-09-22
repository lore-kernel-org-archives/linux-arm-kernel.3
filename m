Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BE7C982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 06:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37Eexq0zFYxGYgBaFUWATikMtDj/TkGR7YrZ6T7c8q8=; b=tw7+O8+LnNNPQdF5Qh5CilUmxu
	yX7rR/3PmkJqWP7y/ibWy6yMMHImBf0eu7DSKy4bwpR4Q+tV2Pm/rNtXIt4IowURhgsyXCrHyH9xe
	UiheR019W+MEManC0vZHY0MJvpd/kecDf6kDFn/yp199PpXT1uiuDzxu+ydpA3PpdfHBkl1Hil/dK
	BoaksTLhRRHBQ5vmsXb37TdZBKKtq4PWySgxDsMrS/wJfpLsTAOmMfZp/wVLRtDxCwuTky4sAf14n
	qjdbXjZUoSluxI8yFvuX+mPqvKBxjn1ZX69LyWcVU34XTV4c943NWpB4MOYE5IlSdlEjdrH0MotRn
	/PbhRcRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tZn-00000004ItT-2Rz2;
	Tue, 22 Sep 2026 06:01:59 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tZl-00000004It2-2Ktn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 06:01:58 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so2771849a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 23:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790056915; x=1790661715; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37Eexq0zFYxGYgBaFUWATikMtDj/TkGR7YrZ6T7c8q8=;
        b=p+S9J94PNaqyRZaWAqHpuatU2T+qutyPPq2tOz6sE7YLUzToTr+R9TvFRP2ivrss+5
         V3efvIgFbq82lqScoy3imGs8VEDAutnwKq3ifWtkwSFKzdt3O22GX+180MzCl6wFpt/z
         cKzN3SksLkLEAqB4X20nyq+MCftRJo6KkMdCGtIrqs+BvXRwtjuYeRXeNQtEWA0yOVQS
         pn9K64nzkR7+yCNN6Q9L6caUu2s4QzFySmSePTC9mJf2JdOChZxJbQSESWh9vwEzg3Ow
         WBD6lPcHpsPabKdogSW+UL60t7/ZyOelg6mzvSHebDJ0ufcfKhZAXSiMvmYeL5E9VQpo
         4JoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790056915; x=1790661715;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37Eexq0zFYxGYgBaFUWATikMtDj/TkGR7YrZ6T7c8q8=;
        b=w8Ks3LZVOMaqKKSR7HcwomgJXp5504TTTRXWPbfhsD27Mlrk6K4YFUdjgG76Nw+7l6
         O2laEEMtWww51G49Ypay2W9HwdUFtBFZjMuDfRkjSzD/SmSzsIWj+GR83Q9EBJ1cOqFy
         lTEPd6Md2j2cTFTA2Myqi7dWSsS+wu5loEEaw8ccUHixilTrE98BgppsrPV55W0+pD3a
         GzcosVWb2AB0CqZb9daQWrebn8N/M8n7Vq3hAq20HDMbtz4rBQY+HtierK6+qv7Pf7D0
         6YuDAWxPp5TQfh7n6ahi8FRt19P3AXIvc5SjKc3YMQDefpuodfF/pERmbbGhg6M3BFt+
         Fycw==
X-Forwarded-Encrypted: i=1; AKwUvBzVE/luWyYEYTy+5itdmIjQFbaGtakJIrdonyiPWbLJ86eyPdyGjJlUL8Ymq6J+Gsrb3VXEN6QwbTuRGonLPa3I@lists.infradead.org
X-Gm-Message-State: AFuF++nTS8S9Zj+QWD03lc/nUwe9CymZ+OWZdGS34n/WRLVMxWWDOlEK
	jVPmFZS+IGlJR3l7Y968TPLgU6LdPY9GVsYAUYO3+0x8wSMKZ5ypAl5A
X-Gm-Gg: AYBFou1xafjie97Ht8OlbQXihd+onLu43Qf1tIIBcBC3y8voN71q6sPAUklBcYVPIqx
	qfn6ldLro4WQVrf0Emw4R1cY2SxJCr32jjoZpj1OKtkxvZ1bHadUAf5gaKkA+ZV+bGkm7QvNVQC
	M5LJmXKbxG6TzBN4izN++OagxO48gykQmRrseFlrKQsWxBxO2I24+bwUkRqkKDhfL8XuvRZimx/
	LaSX5AtUPYh4v52ZynokjM77B9s0Vy6BUQ/SPpdcPMkqL5Mg5k+2tNBUBq0DaDEs6JZSXPVSc0o
	mitgkpxTutSMf1CdMZyAOH9bhEE2bu3HAl2ClE4BQ4E0Cozi5Xi9bKK1qL8jhuF28MuXdEOSgTO
	QKvazpPEE0jEE8hrCSAkoOwNY1qEkggASlxH0pEIFVmbrt8u7b+P+JVybgNwb2dxG0Ne9IE5Bdm
	l0bCdnDZiVnUulrWaDtM8vGV/41726oLn2IYfSklpbRS2f5mPBlgICmTNXVeSZTPRGjkrkqJPxn
	uHH/CQ8yt3h/1VeHSs=
X-Received: by 2002:a17:90b:558d:b0:39e:1ec8:ee7b with SMTP id 98e67ed59e1d1-3a07309f897mr123698a91.7.1790056915456;
        Mon, 21 Sep 2026 23:01:55 -0700 (PDT)
Received: from [10.25.133.25] ([165.85.205.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e610e8439sm2788903eec.3.2026.09.21.23.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:01:54 -0700 (PDT)
Message-ID: <878dc90c-3a4c-45fb-bfbb-2ba802bfc14c@gmail.com>
Date: Tue, 22 Sep 2026 14:01:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v5 4/5] ASoC: fsl_asrc: expose individual DAIs per
 conversion path
To: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 shawnguo@kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com,
 perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
References: <20260922033428.1690822-1-shengjiu.wang@oss.nxp.com>
 <20260922033428.1690822-5-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20260922033428.1690822-5-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_230157_626140_4B816A79 
X-CRM114-Status: GOOD (  11.25  )
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

On 9/22/2026 11:34 AM, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The i.MX ASRC hardware supports three independent conversion pairs
> (A, B, C). The driver previously registered a single DAI with generic
> stream names "ASRC-Playback" and "ASRC-Capture", which prevents
> multiple independent conversion paths from being used simultaneously.
> 
> Replace the single fsl_asrc_dai instance with an array of three DAI
> drivers to allow up to three independent conversion paths to be active
> at the same time:
> 
>   asrc-0 -- ASRC-Playback / ASRC-Capture (backward compatible)
>   asrc-1 -- ASRC1-Playback / ASRC1-Capture
>   asrc-2 -- ASRC2-Playback / ASRC2-Capture
> 
> asrc-0 retains the original generic stream names to preserve backward
> compatibility with existing machine drivers and board configurations.
> Each DAI retains the same channel, rate and format capabilities as the
> original. Update the devm_snd_soc_register_component() call to register
> all three DAIs.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu


