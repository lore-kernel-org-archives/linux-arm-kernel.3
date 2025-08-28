Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F1ACA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 18:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UTOF6xiQv0qzQRLjdqMkKKYD5QGR1e1uQsj6mloKX+U=; b=Ju1nqj9FGPoe1wUjO7UyeLdfjq
	zzeiUBQFK8O5XyA0YCkRcxtLk1CNLTRxJnuH+TVP4ttfnrx3LmfWFH+oaDL8EFIdvqYxXxHMx2jnm
	31JwRG3oCJpHi5RjUQs+oq/FKLE0llO13Q++jJqJGTrBU/aeNBAmjZUSH4OXWOkd2ukcbN2/3ZP6l
	hkg2RFOXh5iN8sYLAYcnQrg6qKitAp4QnZSbJ/c+16p5SQCHPSrjNUnBZlWkm2XkHx1TVrXtGiBZ0
	86zSAzM8DJVzN5+V4/csn0K0IGwSDoQGMGot1Py+/2o7pfwASbpVVfaxR3f66VQfq7lwNP9PIGOwV
	PJKVmyeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhWN-00000002oEH-01qd;
	Thu, 28 Aug 2025 18:38:51 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urceX-00000001jgH-3Sov
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 13:26:58 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-55f469ad067so1052931e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 06:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756387616; x=1756992416; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTOF6xiQv0qzQRLjdqMkKKYD5QGR1e1uQsj6mloKX+U=;
        b=oQLXP55PsERRzZM7y+WCPdYjsSdJq1+D6vNbQY017i5XeH6qIbYqtdtjse2+yLTs3j
         xs0wvCKV9fCHZGih5v+vcW0qrtiKFJucnlUV7+hLrkNm6axUo4dxNKYTPNfBcVovjLI5
         cGt2dODkEYfuucxS7LbgxEYVtMcOmU84L+cLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756387616; x=1756992416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTOF6xiQv0qzQRLjdqMkKKYD5QGR1e1uQsj6mloKX+U=;
        b=oiE19jJKThItyRDaOm2fQ3G0M9pv7xTs2fvGhjrwCa02qbcsQMiIzbENqJ9A4rw3WB
         QN9G6pYwuG4OCZjgFj5TbJJaknooEk8ai36FThpuzjyauk9u75EQ2qB0QF3WWPUf2WRf
         QUtb9AX3zhwQCAgCiL5b3AAwmV1QycFQWpRkB/lnIPoH4Z7PS7v3MlZrS96PajMvi39y
         uJ0FAiHIfDbHrwAxmyV2tsLiQJk+GUAqVBDtGX1SJwvQa4GKbkvXwOQ7t66N9sZhuK78
         NSxreWCsjsYnNbzM2AOq5xecqG4pnm1NRkZwbj5Mrotbvyd5ctOOw+fHQI2nZvHZLGk8
         GuRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN9CSRs8xKZxb00J1DFQgpjf3EktazMtQUoqGFBCTDRNimpbQ0Uvr/96qvV51tgCwSz874CRcJs9hmXQAXHGD2@lists.infradead.org
X-Gm-Message-State: AOJu0YxBH8zbOUehTsVXQbCBRA/s48K9Yyfi2/CkiNyL9/mwgDRtC969
	s9FpF0kDBzVC7c8jLIMZh7LUdIlYV4DF9+HRcWCRSKXrzOfKznoHxFKCkfhuY+ddbojZCAG55mg
	aZ6+2RvXXUwlm7ZKO4aXuL9ME7Yq8cWZpaW2wf/Z0
X-Gm-Gg: ASbGncvc5I6JGoo+MQBPtIBSdYPcIMlbg4eWiVHdSNGzg6o9N8qYeP3eD/Ow59AZXfD
	jxUmai/7k1MbYFJzUUMP/762+GKaN1S5uxCOFthTGMVB3GssibjIvMLJJ330S0/q0o3HIFDEb1N
	6V+kIdrSgYJFekgH2hANbvCoOym3BiYPM5scA3SrYqFa9hSYHf1ndP6bdFW/w8Tfk7Tqo+c2jwP
	uGQ9KrEEEBg93775WIXGD0fMC3kCT7bMxZ7+A==
X-Google-Smtp-Source: AGHT+IGKaP7lckMwAVsqZkce2iGR63rMwp/YwXpHrLXd8d9BSHElcYzrrAlXcYiXDcwUU0dCjGA+bOrjwY+YJkMmFn0=
X-Received: by 2002:a05:6512:3b97:b0:55f:4c92:f4c8 with SMTP id
 2adb3069b0e04-55f4f4c6b92mr2765248e87.8.1756387615553; Thu, 28 Aug 2025
 06:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250214074353.1169864-1-chun-jen.tseng@mediatek.com>
 <20250214074353.1169864-2-chun-jen.tseng@mediatek.com> <20250219054209.erwfp7sgzchaiuds@vireshk-i7>
 <e8337c5eee0cadb797bacf26b00f1ca303c5147f.camel@mediatek.com>
 <20250321045624.mwm2mnkqeow5uids@vireshk-i7> <2a73b5ca35692c8ffa68c9ff0df73e24a592967d.camel@mediatek.com>
 <20250321060148.adhxjexpnm4dkpnt@vireshk-i7> <e1c2c12bace22d1803d16ecbfb32129518d87157.camel@mediatek.com>
 <20250324054333.sgwwksawnybx3lp4@vireshk-i7> <06356a55cdb3c34dfc716349d1967f95655b0ab2.camel@mediatek.com>
 <20250416080517.feansrkpycsynk6t@vireshk-i7>
In-Reply-To: <20250416080517.feansrkpycsynk6t@vireshk-i7>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 28 Aug 2025 15:26:44 +0200
X-Gm-Features: Ac12FXxYNpnEAlBmbtFHr64VxND_7eVbeCYS5BHUQbSiC1qF3AAnoY211E0MhhA
Message-ID: <CAGXv+5FyR8bt16nLvS0V=_YRWM6G7V0OOpxctA+_4hVnnCjDtg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] cpufreq: mediatek: using global lock avoid race condition
To: Viresh Kumar <viresh.kumar@linaro.org>, 
	"myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>, 
	"kyungmin.park@samsung.com" <kyungmin.park@samsung.com>, "cw00.choi@samsung.com" <cw00.choi@samsung.com>
Cc: =?UTF-8?B?Q2h1bi1KZW4gVHNlbmcgKOabvuS/iuS7gSk=?= <Chun-Jen.Tseng@mediatek.com>, 
	"rafael@kernel.org" <rafael@kernel.org>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_062657_862279_222D04E7 
X-CRM114-Status: GOOD (  23.18  )
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

On Wed, Apr 16, 2025 at 4:07=E2=80=AFPM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> On 14-04-25, 08:42, Chun-Jen Tseng (=E6=9B=BE=E4=BF=8A=E4=BB=81) wrote:
> > Hi Viresh,
> >
> > The CCI level choose by Max_Level(LCPU & BCPU frequency) in devfreq
> > driver.
> > without global lock, It may choose wrong CCI level and cause system
> > stall.
> >
> > I hope this flow is serial setting like, BCPU / LCPU set frequency ->
> > set CCI level -> BCPU / LCPU set frequency -> set CCI level -> ......
> >
> > without global lock, it could be LCPU / BCPU set frequency -> set CCI
> > level(during this time, it may change BCPU / LCPU frequency and cause
> > system stall.
> >
> > I also can only do global lock on ccifreq_support SoC.
>
> As explained earlier, I don't think there is a race here. May be I am
> wrong. And so I need a clear code path example from you, which proves
> that there is a race here.

Maybe a different set of eyes will help. I talked to Chun-Jen offline,
and I'll try to explain what I understand.

First of all, the issue lies not in cpufreq, but in the CCI devfreq,
and how the passive devfreq governor is linked to cpufreq.

The CCI hardware unit on the MT8186 is sensitive to frequency changes.
If the performance level of the CCI unit is much lower than either
of the CPU clusters, it  will hard hang the whole system. So the CCI
devfreq must always take into account the performance level of both
clusters, or in other words the settings of both cpufreq policies.

Since the cpufreq policies only serialize with themselves, it is possible
for one policy to change and trigger a devfreq update, and when the
CCI devfreq driver is doing its calculations, the other policy changes
and causes a big deviation from the assumed performance levels, leaving the
CCI into a non-matching performance level and causing a system hang.

So I think we need to handle CPUFREQ_PRECHANGE events for the frequency
increase direction, as well as enlarging the devfreq mutex to cover
the CPU frequency tracking bits in the passive governor.

I hope that makes sense.


Thanks
ChenYu

