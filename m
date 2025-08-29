Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E263C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 05:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SVM2NB/+Q5TwegaC+cQ6efQn2fgkr/tPokgrfCaQZxo=; b=RP3pixPkHJmreQ82IHdLhVvATI
	QyOzPeuvlfGscyi3nQ/BxQvqKSIRLlFjuT3YFOF4GBTVTwwX02LFDHJVT2evxLDy+oWs0DMEOogtI
	+Z8TKWWJj4EPhtfUZL5JZvB38X4JI9/60OTeVPfrscbxJF0aAhoi63qrT4OfOsZs1ptXOJpKokjer
	FyG0uRWU8udS8lEdSlOOhnWXGAM6Ae4zyS3BWMR0lzUIBpchsLhBHnZ/y1e+2oMP7LdjPaQdKykDN
	Mi8lJ0XwuhdTuM7oDtVpqddX4sGUeFuSjsDOHv5quuQDwAZpHKuBk3HEf5OP7YtEBQ4Vta7ULZOei
	YZgJxATw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urs68-00000004ZHV-11k0;
	Fri, 29 Aug 2025 05:56:28 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urrxY-00000004XN4-0ZbB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 05:47:37 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-32326e5f0bfso1441942a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 22:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756446455; x=1757051255; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SVM2NB/+Q5TwegaC+cQ6efQn2fgkr/tPokgrfCaQZxo=;
        b=ln/Lle5vWmcBTBxvjq65wnw2L9W01MNvpvnSwriqEzwMnI3mFZVpBD62tsKLY/4BQr
         VPbcbIJKA6p9LCIUK6hdi/x5HCwuECAykcX2HwzLr/nFoSUAGqvf0O/LwoQy+wefBZIs
         OxifSMboHt4r/RwaKRz8dSbrARxXss12RA7DIhX/Sf4af8wpo8xdEu1BqYmttLQvpwa5
         n0S279z6eklUIrAdM7uJghfOx85Z7Ilf/EdaNtbjv+FmMtZ73EnaOG2YM7Uv+rUMLD3G
         aCUGHPoV4mFEcUXJHrcYFQj1XA/KkzFiO/ewAFDkY6hNoNpO4R8ELOHPDAOZufzNQBUL
         udMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756446455; x=1757051255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVM2NB/+Q5TwegaC+cQ6efQn2fgkr/tPokgrfCaQZxo=;
        b=q+mjs/LZGnxYpWF7LUlfUCE6Q4hty6hZo/SUbgjhoyLkXbVuI6IpiB2G4B+3+IL3ZD
         1DAb79kHrgfBExfYPsm3Wl9dwclCTwk9K7p6vV4bVPWx6V/quvjYNjTjGAgSIm9+oKBK
         sUUeZSXHAze7aZZxI5f5pduBIuNixzNrMtON/XlIeVOIV53MMmuQFFQ59WvTgl6pFFwv
         Qs5LGJGY1dSMIAth/WJ5Uz98HKIUSSyAN+xTn3+QeXL9cRx+jmgTlR0dsIpXGWeuLGYQ
         G8+hOOYIyLkmN3aGv1w5Ee6mLa6gKNM5SXXNA7SnJtkthl2QxFg2VsMWZkvYvDo0L3tt
         9nQw==
X-Forwarded-Encrypted: i=1; AJvYcCVdWj2h9mkidZyVgksxPziUxFhYdX30WFmCEU9sX1ken6aV02KRsaD4+VvAJ1NmApS1EhDxQEl7sNFly2LpeITT@lists.infradead.org
X-Gm-Message-State: AOJu0YzQZS18Zug2tBCFLa2iO1zXNQOQh5YM9QE/LsY44RzoMaPU9Rvf
	SMMkYG8LFtgau1K89Xy0zXishRHFc8nu3Auwim0JR52HoJeEIPhjTuJzD26XQ5U7OJ4=
X-Gm-Gg: ASbGncsNJWkzOot6GYogyOTN5zeAMtt5pPRoEuvnrQ8Cca7vLo95bVoIch2kCVnvtgU
	3zneWjNpCdBoixZNXcGeJEX4iwNCrpuqzInsRP2f+ra3+3s/Rv5n04uDjOLyVKfBowZhYstTYsS
	w7FavgS2PX/xZ0JzVmUaDXSPOTLG2m116tFdFIuuO8pcuDOCrPoZXIrp26Fy5FWwnKHzvzgusif
	pOd5AL8ySV7SX/PCvHrDjEFaFCoBAKPTdazYBCKuCZxMEDOXB2cHncQwBHTLk3Q4LaqYy8+MXFF
	t7nKph9o/CQvXUMT3D7w6aBqfLD4Uuu+8EsB3ca/b8GqBHmkKQ3de0F+uZkYRfZ6tU+dqMYx5yc
	iDeVXg7+44vFuCUa97VQ96+91DfQCweWV5pU=
X-Google-Smtp-Source: AGHT+IFGFRX8jr8klOJHgeApacbbUnrvb94Dt+QaaXsozbhIjGsZDvjH/LL4aUVoWgpbErAkB6CKrg==
X-Received: by 2002:a17:90b:3c0e:b0:327:dce5:f635 with SMTP id 98e67ed59e1d1-327dce5f897mr3153327a91.25.1756446454625;
        Thu, 28 Aug 2025 22:47:34 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327d93547f4sm1536101a91.11.2025.08.28.22.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 22:47:33 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:17:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: "myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>,
	"kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
	"cw00.choi@samsung.com" <cw00.choi@samsung.com>,
	Chun-Jen Tseng =?utf-8?B?KOabvuS/iuS7gSk=?= <Chun-Jen.Tseng@mediatek.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v3 1/3] cpufreq: mediatek: using global lock avoid race
 condition
Message-ID: <20250829054731.utl6pmgan6sg4mfn@vireshk-i7>
References: <20250219054209.erwfp7sgzchaiuds@vireshk-i7>
 <e8337c5eee0cadb797bacf26b00f1ca303c5147f.camel@mediatek.com>
 <20250321045624.mwm2mnkqeow5uids@vireshk-i7>
 <2a73b5ca35692c8ffa68c9ff0df73e24a592967d.camel@mediatek.com>
 <20250321060148.adhxjexpnm4dkpnt@vireshk-i7>
 <e1c2c12bace22d1803d16ecbfb32129518d87157.camel@mediatek.com>
 <20250324054333.sgwwksawnybx3lp4@vireshk-i7>
 <06356a55cdb3c34dfc716349d1967f95655b0ab2.camel@mediatek.com>
 <20250416080517.feansrkpycsynk6t@vireshk-i7>
 <CAGXv+5FyR8bt16nLvS0V=_YRWM6G7V0OOpxctA+_4hVnnCjDtg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGXv+5FyR8bt16nLvS0V=_YRWM6G7V0OOpxctA+_4hVnnCjDtg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_224736_170351_F31B4ED0 
X-CRM114-Status: GOOD (  20.82  )
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

On 28-08-25, 15:26, Chen-Yu Tsai wrote:
> Maybe a different set of eyes will help. I talked to Chun-Jen offline,
> and I'll try to explain what I understand.
> 
> First of all, the issue lies not in cpufreq, but in the CCI devfreq,
> and how the passive devfreq governor is linked to cpufreq.
> 
> The CCI hardware unit on the MT8186 is sensitive to frequency changes.
> If the performance level of the CCI unit is much lower than either
> of the CPU clusters, it  will hard hang the whole system. So the CCI
> devfreq must always take into account the performance level of both
> clusters, or in other words the settings of both cpufreq policies.
> 
> Since the cpufreq policies only serialize with themselves, it is possible
> for one policy to change and trigger a devfreq update, and when the
> CCI devfreq driver is doing its calculations, the other policy changes
> and causes a big deviation from the assumed performance levels, leaving the
> CCI into a non-matching performance level and causing a system hang.
> 
> So I think we need to handle CPUFREQ_PRECHANGE events for the frequency
> increase direction, as well as enlarging the devfreq mutex to cover
> the CPU frequency tracking bits in the passive governor.
> 
> I hope that makes sense.

If some sort of serialization is required in the CCI driver, then a
lock must be present there to prevent the issues.

-- 
viresh

