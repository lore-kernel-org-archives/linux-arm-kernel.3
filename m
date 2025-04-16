Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350DDC369B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 08:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=inoGsYpigja5jTUghwsLjcEVgXmFJ+nXb0AjbaYD9QM=; b=3jKOoWeV+N7utSwYg/VNtTnVtn
	i/BRM6meNJdvWO/Efp1a/Ow60DKlXmfI4UBk59gIjzAOvI9mkJTj1q1UMJ+3J0KGdE0qXTOekb9M5
	WGDtMe/Iu+9c5G2VQCIHYdkT6uTFKjVm3+e12pXcX+/QQQ5KInXyTlZvlIKr7NoGXk23vJyF1P51y
	sPXMBMD1NM0KmvIVweszNUgnY/vRbAFaPRveqF93Z+zJ2/h8+J47kOZmp9o2Oz1gTiXCWEWn+DAUS
	yMgGZABO1aLLpaQpEsuqhio8StEwR/1+lICIRFm47JiiacYQWyM0/UNK26XApx1qnRtP3CwhEUEFO
	id1UctTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xpD-00000008keS-3pGV;
	Wed, 16 Apr 2025 08:08:51 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xlo-00000008jtm-3MX6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 08:05:22 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-73c17c770a7so1814063b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 01:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744790720; x=1745395520; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=inoGsYpigja5jTUghwsLjcEVgXmFJ+nXb0AjbaYD9QM=;
        b=ToCuc8Nqdn3j+ES5QlKlicHoYl8UyLeTKEiB+DpXY0dwvi/+OP3xbMT6A3qrU+BTMk
         dasUXs/nCKHNP6AxtDpW2q9vmUArl1VGdlgcuGYJX46JEmoTi0SCkNwaXqGIXw3n3Bfz
         xal5pae1MjgGyiWTgY8LFCWZWl2OI1L1qiifeGdMfNFHKsF58nPc06R2nUiDzlvrcarq
         769IguzDOfhkZp+oImL+PHWrbBTPYt0UNLIuvSaZ9SE/8eymdnLETF4Ipi54cyp3FRs2
         /ytZMKYZ8TpC8CMU4j1AMLp3MKXmB+JwLq8kXBije9h1G95BHv/PbzFoIfvjQ9YL4lFg
         tq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744790720; x=1745395520;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=inoGsYpigja5jTUghwsLjcEVgXmFJ+nXb0AjbaYD9QM=;
        b=JnYf8JbgTzQDSpWBbwJw2G3RHNf6tJqT6FjbuiRPlf+4BTPulbI7CxDujz0YJJG+Jp
         kaT4g48utE15/QYlNHDBPP8hUslD/SxPtSWupd0TQSwh6+gZAe4z9265EEjH7l0J8sAb
         zsi32zX8DuYGvrqYXuH3++O7+8nv+e++aRfcUfiVJMiWtqqC6Z4DrkzH9WmRogTgvB9n
         j7v4kt+DGbnmifZJ/iG3FiSJjpcVgW3QbRo7M2pTXnWkH80FIz3EEMiP3NjYDqe56OPn
         LWfZhH2pqog7bc+rJs78TPpWFwqEmTDzlXUgwk5cc3ldBViI70smkbxpm3N8fyvo+F3z
         mSdg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ641pyfBxopC47DM35FTtPtqsPXUGv48XVy7zs1a7nl9IJqI4r3NUIHX0PNbUhmfisX4a31fLiWheV2ix+BKm@lists.infradead.org
X-Gm-Message-State: AOJu0YxzWYDADJ7C+8MJZNVcyBsSEyqeaqhF8744S+FlHDjUKTp6U3ms
	vTzDC3EUDiukVk9ajmLS0MwEGRHvBGM8Bkw9/az5LgonggDG49Sw6TDKXXcCFcU=
X-Gm-Gg: ASbGnctHWKpzBLNYXM1pfJ5PN15p2/rOicFUFCkHG9Lq1zmFICb4yYzMIAinBIwN/hO
	GDOcXZj0jlLZJIg35GMP1RyvlYU7p2UhiTi1Zq+lpVEWberfVmskpUKFNP+QYFeKg1OdS8fa5xt
	43PpmXu17E3bFmTna7XF2MeICmxH5BagQFMhwHJp7fBEKlNir7KDaIgtTvM7JFWgwN7lmS38sAo
	CqYKONHVICTcYx+nX5pImIRgf6kp/Xb0LjyjYhCR3PvZVevpDwyYd/RHklH+7QLMWMXCPioxtpc
	N0HPsQ1K3TtFRtTzUZFrXKCSUDHOSYnH2Qw1o1Bz8vDXQXUCezwb
X-Google-Smtp-Source: AGHT+IHE9GKOiXUJRd9ZbjDhVSEPnNsM58LQq5KKO/sJrxGQ10BPtZiiagmUa7v9I1/Pe/Ala+WMrA==
X-Received: by 2002:aa7:888d:0:b0:736:baa0:2acd with SMTP id d2e1a72fcca58-73c267f1bebmr1314183b3a.20.1744790720067;
        Wed, 16 Apr 2025 01:05:20 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230dd17sm9721455b3a.129.2025.04.16.01.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:05:19 -0700 (PDT)
Date: Wed, 16 Apr 2025 13:35:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Chun-Jen Tseng =?utf-8?B?KOabvuS/iuS7gSk=?= <Chun-Jen.Tseng@mediatek.com>
Cc: "cw00.choi@samsung.com" <cw00.choi@samsung.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v3 1/3] cpufreq: mediatek: using global lock avoid race
 condition
Message-ID: <20250416080517.feansrkpycsynk6t@vireshk-i7>
References: <20250214074353.1169864-1-chun-jen.tseng@mediatek.com>
 <20250214074353.1169864-2-chun-jen.tseng@mediatek.com>
 <20250219054209.erwfp7sgzchaiuds@vireshk-i7>
 <e8337c5eee0cadb797bacf26b00f1ca303c5147f.camel@mediatek.com>
 <20250321045624.mwm2mnkqeow5uids@vireshk-i7>
 <2a73b5ca35692c8ffa68c9ff0df73e24a592967d.camel@mediatek.com>
 <20250321060148.adhxjexpnm4dkpnt@vireshk-i7>
 <e1c2c12bace22d1803d16ecbfb32129518d87157.camel@mediatek.com>
 <20250324054333.sgwwksawnybx3lp4@vireshk-i7>
 <06356a55cdb3c34dfc716349d1967f95655b0ab2.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06356a55cdb3c34dfc716349d1967f95655b0ab2.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_010520_853683_521DB750 
X-CRM114-Status: GOOD (  12.48  )
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

On 14-04-25, 08:42, Chun-Jen Tseng (曾俊仁) wrote:
> Hi Viresh,
> 
> The CCI level choose by Max_Level(LCPU & BCPU frequency) in devfreq
> driver.
> without global lock, It may choose wrong CCI level and cause system
> stall.
> 
> I hope this flow is serial setting like, BCPU / LCPU set frequency ->
> set CCI level -> BCPU / LCPU set frequency -> set CCI level -> ......
> 
> without global lock, it could be LCPU / BCPU set frequency -> set CCI
> level(during this time, it may change BCPU / LCPU frequency and cause
> system stall.
> 
> I also can only do global lock on ccifreq_support SoC.

As explained earlier, I don't think there is a race here. May be I am
wrong. And so I need a clear code path example from you, which proves
that there is a race here.

-- 
viresh

