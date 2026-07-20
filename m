Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06BEC44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 19:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADiUitgJtlg1qZ/LHubhQUG1lGSN9jDviGJhaJgAv74=; b=q6Ku6b1xicnfOUh0EFpGiVuk4w
	B2HY0x4P/ch2Kf3DGZEJbLTxYbdccRBsedRRw76rMQzW1YsjNXM+VSxUhQTYgZTXxwcGh3ARVJ6s/
	cTDLcvwulINSpdwg6W/1aO9X7Vr/NsGMz+Fc29JNo9LLH0ty3Jni9dQBTy4/Y+Vp8khbbg/f7iuz4
	5H+Yp0VrOWCcNU5wzF4KaXPTzY3rP1HNS8otBYOhfG3BqR4DG9Z7WVS0NQOiZDDBg7vgo36yH8szL
	zAKdr67FRHB1fgmiLFRRuwkSM8ywM3OscmXRqkmNuQg+1ivBZiGm7MuBxrDG/Ryt7i9vVurAc2N5L
	t7ukbF5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltGf-00000007i6N-38XI;
	Mon, 20 Jul 2026 19:03:09 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltGc-00000007i5d-05RJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 19:03:07 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49546c690ffso27654705e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 12:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784574184; x=1785178984; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ADiUitgJtlg1qZ/LHubhQUG1lGSN9jDviGJhaJgAv74=;
        b=bk2/QTa23/8ivERGmWXqgvi2f+46fHBXuKPGA6SUUycL57s11ztuF4ZMi9z5hoL60x
         z71Mp1hyGi7FsFdSFHRuVcJMXSCj6vDNkUyVbZOT8XkZiRTF7RE42zHxmXrXMp6Nhg7y
         ydH7ErTvg4A7EjlXwsBT3ggFCYKp2iLTxh+f0926Yy5fCWh7RkVt43h2FoZo1MrIPlOI
         vwApJz0bakH20Pglb8N4kNx2sEfzHl6byrMPWVDxcRHPHvPfx+l2NDMAO6fONua/MQ9u
         cIZA3KH6J7VlOQ78lZbOVxswqzSw+n2cySTRkISD6bCenLZDSwONEg1XWjBOsaLW9vIr
         mEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784574184; x=1785178984;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ADiUitgJtlg1qZ/LHubhQUG1lGSN9jDviGJhaJgAv74=;
        b=aK3Sxwho7p25JkMNch/q89/0aa4Vjsg4EiqK98ggSGD+OHwS93Lc/5X+YxuYzrOS6c
         CDuymICdk/WpEONOxvPHpgGkh+DMWfprAhzysh/tif3ZXQpOToxjHC2UWnQnAbbteIb/
         KpTruXowXlTKDCaPdka9ErCeKy5AN1GU18rjJM+mCjMzSxAtsTnwSgf57l698dvSSPmZ
         jjKypI3FPeBYeiYIx9L2GsaH6Q5YiFB3Yetw1EyukrnkK6gA71hny6k3sPUw6xMVLdSX
         0MjQKaw63GjnAMLWr3e0p/hqvLX3hwTju7EAHqwpm/Uj1WxBrUzBkC5VwvEtqmFQnVTt
         xsFQ==
X-Forwarded-Encrypted: i=1; AHgh+RrVJMI61bFR6GVmUuj0nkCeseKtm9Cpm1F7aq98m5nD5RSNFCd0jIEVxmTxVr/0yHxQPmmdNB+NaoOhGSNb0x4N@lists.infradead.org
X-Gm-Message-State: AOJu0YyaEDWPz5HtXp+wgr2p3u91zjbgt1iwRNAnJtFCL9NUfP991TpR
	uFtUitYFrnNndjmkclKnOfQROXmpFgba4W0+00ajz2zCd8/cnbOjMrY+y+hWNJb6qQ==
X-Gm-Gg: AfdE7ck03it+fhuwFMoImrBehW54ryJKoTIgjMdURizxFbXaUMwnVziAlmwgqWV90pi
	VuORutnm3H1PQa4JmhVHAm4iObIJqn2dmkdleVA35MmnmMRrLG3ZT0eDNJuvfSozU34iMlgL68V
	BbW437O8CUA/Bq08W4mlJg1VgXlYMvcGDGmoD8t4yJN9N46txiQlzQh3yGN1DuNv0zIR+LKbNzg
	OeewtNcy6ah6keKvodSW72f2XAI63ropbzmzDKTmSDCA5xin37PCdnHNExqndK8dnooB+X5YiN7
	2Vk/MX2j8quv5iwFu8fkAC+maD9FCCb2RBHaSMa/ssWN+auGiusRAW7pPTWouBgwmde9s2OSo4+
	cpKFz8ORgn8XkGSBNzYjgMGlIvYXAYrt85BGdoNDsmogjUPCcnJxviXhOcMRtq2CYanw85LdWji
	pCZeAECCDntXiBC/w0fhMpYCkZiljB5gn2Tf8l2mXv
X-Received: by 2002:a05:600c:3114:b0:493:f278:ba2f with SMTP id 5b1f17b1804b1-4954a3ed46bmr179664585e9.9.1784574183734;
        Mon, 20 Jul 2026 12:03:03 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956537c6besm9428245e9.8.2026.07.20.12.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:03:03 -0700 (PDT)
Date: Mon, 20 Jul 2026 20:02:59 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, will@kernel.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-kernel@vger.kernel.org, tabba@google.com
Subject: Re: [PATCH] KVM: arm64: Stop the hyp trace clock worker on disable
Message-ID: <al5w4wn9ZhPsZYUR@google.com>
References: <20260720184850.1826630-1-fuad.tabba@linux.dev>
 <al5wo9x7oUGzlbTo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al5wo9x7oUGzlbTo@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_120306_073731_5B4CE417 
X-CRM114-Status: GOOD (  18.40  )
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

On Mon, Jul 20, 2026 at 08:01:55PM +0100, Vincent Donnefort wrote:
> On Mon, Jul 20, 2026 at 07:48:50PM +0100, Fuad Tabba wrote:
> > When disabling, hyp_trace_clock_enable() cancels the clock work but then
> > falls through into the enable path, which re-schedules it and marks the
> > clock running again, so the worker never stops. Return once the work is
> > cancelled.
> > 
> > Fixes: b22888917fa41 ("KVM: arm64: Sync boot clock with the nVHE/pKVM hyp")
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Closes: https://lore.kernel.org/all/20260720172923.E4F161F000E9@smtp.kernel.org/
> > Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> 
> Done here already https://lore.kernel.org/all/alczBmnItMwq8xj4@google.com/

sorry I meant here:

https://lore.kernel.org/all/20260715105100.3178255-1-vdonnefort@google.com/


> 
> > ---
> >  arch/arm64/kvm/hyp_trace.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
> > index 2411b4c32932c..27367843fd211 100644
> > --- a/arch/arm64/kvm/hyp_trace.c
> > +++ b/arch/arm64/kvm/hyp_trace.c
> > @@ -116,6 +116,7 @@ static void hyp_trace_clock_enable(struct hyp_trace_clock *hyp_clock, bool enabl
> >  	if (!enable) {
> >  		cancel_delayed_work_sync(&hyp_clock->work);
> >  		hyp_clock->running = false;
> > +		return;
> >  	}
> >  
> >  	ktime_get_snapshot_id(CLOCK_BOOTTIME, &snap);
> > 
> > base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
> > -- 
> > 2.39.5
> > 

