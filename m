Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BEFD29C3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 16:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L8EWer9va4PMCPeiXWm5LUi6W7Ruo1VzwHiLnjS8mAE=; b=fWNgHY/6243XYCQDT6snXEdvE7
	24mRsMpVIVbLzJRKu4z5+X7RzHsyOKnpjuZgCXWWB1HofD0/XVcofvfTIFo8S4TDOr5+UC7W/RxQf
	N5gjHzB7PDZQKIDWlynfMZl9dsJBWYhurRFqyMqVTlFdd/sLuOVtebxANVl2v7vBpxLpnmOkbc9P6
	kZA2MO00lmZif4TfsEapRq2S5sD2/4IISiIw4pdi9zzSmuu7MeEOUUBoECxztfOoUKE4zVawlOqvy
	Cub50EHOrprVBb99nv9m0WQ+1xblhhWL059ZX5NCuBEbLHPcl/LDsxq3UoU8G2jXcoFue/ZKPT1xP
	f4oa+eEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhruk-00000002RIY-21wG;
	Mon, 19 Jan 2026 16:15:41 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhruc-00000002RGt-0MQH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 16:15:36 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so41697925e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 08:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768839328; x=1769444128; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L8EWer9va4PMCPeiXWm5LUi6W7Ruo1VzwHiLnjS8mAE=;
        b=F3Bbts9vwaUc6uCheetJ3ogcfm5V8/7lOAI/8F7wxJKbgEXzNde1/YHnuRfAXY5SmX
         yZjXfb0pR9yha40vAruFnn6lSsrPFJY12lNOSNjmXx4ZREGVuYVW2AD33z3WIpBPzA/z
         FVh/1uUXVbPxN3vDhxh4+Ac/FlR+Sz8DsQHnjK0JicZzRkQMgHx1nMhn+vTmhAp8pV3d
         P97GWB/Hc3rKP67zFGwfMPrCqf/GxTVbLAjPmWt3L1S+hANwYRaMkR6x2s8Z4zBwfARR
         jhsrm+xA+zHNHRHEfcjAPe0F+q6BCiQSkTEGDVpBka4e0Yv5GRgYg/U+TY4Kjq7+NARg
         4P0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768839328; x=1769444128;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L8EWer9va4PMCPeiXWm5LUi6W7Ruo1VzwHiLnjS8mAE=;
        b=Y8jNfTPKbuo4yQ3iXgJ6MCK1PtHrxCx3iWI3VG9vRwPR0sjUagT+AdGdBUad9a/Ae2
         rXUrgY2Wx5UxOAuWZtjhd9j7CNLjItE02w47ICkqVqLqdpOR77G5Cewbr4nb0rCZXdav
         bAfOI54sZ/oRITOLrqrCWtak+XbBgBiSWdDKzBr7Pj2MH3hp/XcxYSsez5A778Co4mxl
         CdBV2LVvdFUp/9rufX80r6IZtBWmJ8rwiuE0pH4j5i+zg6hsVXobWxYrb3bJSsgqAE3q
         +THBo4Rs3IuZVt4J+q24ccbmwkJDxkBGpLfK2rbcauHsUG4lTAeMED8FNKAhDxcvCKT8
         eRgA==
X-Forwarded-Encrypted: i=1; AJvYcCVFGVcQZvVOi2Bxf8/MrF9Kk7zuDF8STltQgMPE8VQAluiI0pQdQ0MTF826bERNCZnvxfW2pFxoKhRUquH2zu46@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7lD/+yqWQkylsnLNZlFoGVlZJp58fjLWz3lJLUvowTUj7RCmF
	8ua+lP56TKyZ+yOdcAXKiwcUb8RPUgM7zS6uNnMJNuHMyXbrp44JTHGD/7WTJBXi4NA=
X-Gm-Gg: AZuq6aJ49AdV6kfq75KSiQK7ZZwkwXyV+akvLKH/sOvJe75Ba6z07d/jm7wOBye2JJE
	NlTMIjeolG63m2Kaz/x5GeV0Gc0jlxzZDnQSJdTwMdRVFI8A2iA/VoSy1xp6SiS2ycJsiLe7GmY
	tm5wosSwaBsP9LA45CrOIekSFZclCkWL53vtF/F6FwFPpWUsTkY7aJQVrtpyiTlf7k6XKmoYX/B
	xdh8aHS/ra+7RbOnlxcA0nrQwzawVlW9Rm8BeyHgwQ9qHcW48j+tTe5yxl5Vo9NxXYJHGtyOQc8
	2HbH9U9Wj4cdAhphazM/sWkzFp6G3G4fTfFleqXkSavfeW70xhFf5ts83W9b4NPtKmCfSeeD/MY
	8jXtKxlCYTTZU8AFxDWbDPc1cgL7U/k1pY7D2U7y20IB0I9Y5AGBiE2cHIxrdZD6jBEL55k7QZR
	b2fGS+hKwhEsTXE4pSzXeJXmt6SpSSR2dIO7KZJ/F1EhkTDkDkGLavDec361Vu0gFOBk50Vz/sD
	RshgQ2xRi+Wlc0lexOJRDAXOk/zl/iGJicIrFaLhRDLU3dKoVSIftTl6Y+ZyhnGn+1deMpM
X-Received: by 2002:a05:6000:2506:b0:432:8504:befd with SMTP id ffacd0b85a97d-43569bbb23dmr15947030f8f.32.1768839328088;
        Mon, 19 Jan 2026 08:15:28 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921da2sm23988345f8f.1.2026.01.19.08.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 08:15:27 -0800 (PST)
Date: Mon, 19 Jan 2026 16:15:25 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
Subject: Re: iommu: Fix NULL pointer deref when io_page_fault tracepoint fires
Message-ID: <aW5YnTnOJ2dJNuhq@aspen.lan>
References: <20260116-iommu-io_page_fault_null_fix-v1-1-6c20c2e62987@riscstar.com>
 <fca8f2cd-c3e5-40b0-a793-bded109e37bc@web.de>
 <aW5CIA1aCC8FVyFl@aspen.lan>
 <a2aa3091-4a93-48be-970a-8bc506fb0cd3@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a2aa3091-4a93-48be-970a-8bc506fb0cd3@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_081532_257077_2C57255C 
X-CRM114-Status: GOOD (  20.41  )
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

On Mon, Jan 19, 2026 at 04:56:04PM +0100, Markus Elfring wrote:
> >> …
> >>> Fix this by adding logic to the tracepoint to safely propagate NULL.
> >>
> >> * How do you think about to add any tags (like “Fixes” and “Cc”) accordingly?
> >
> > I could add a
> >
> > Fixes: f8f934c180f6 ("iommu/arm-smmu: Add support for driver IOMMU fault handlers")
> >
> > However, who do you think I neglected to Cc:?
>
> See also once more:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.19-rc5#n262
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/stable-kernel-rules.rst?h=v6.19-rc5#n34

That's not what I asked! You suggested I add people to Cc:, who do you
think I missed?


> >> * Would a summary phrase like “Prevent null pointer dereference for a tracepoint”
> >>   be a bit nicer?
> >
> > I don't understand what is wrong with the original phrasing. Can you
> > explain why this change matters to you?
>
> * Questionable abbreviation “deref”
> * when clause

I dislike the proposed new summary. I think keeping "io_page_fault"
in the summary is a much better use of characters than spelling
dereference in full.


Daniel.

