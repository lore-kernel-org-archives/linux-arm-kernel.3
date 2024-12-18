Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E372DE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 16:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hU1Z8+lcg+ptXSveEoYze+mbRwLw9U4+cd4zYPlrev0=; b=o820K7A23mGpA7eSfKRo8kjGIc
	eGakcMAKxUAMAX2dfNxK4rIAO8YcZ4DKWDBilV92kNo2Xz/3K16FbcQTNcpBrnJx3vUtq/4f23NDx
	s0NcFVGzfhLTDIRCASZccgZ65puJ21uLb4aB849AI/jr0hPXFdSNNkrHptVARzWkeVLB/zKtTppB/
	oZri4lAFuOG2IFkUH2AuT3+q4AwI1l1euWUkZ4enrHaj2o3+KwOOT1fw6EYeKR6xn8xzgRCrJ9gma
	6zECaXpzhO8T2UPNzfedadP1ez70gpWkYvXhs78wlFpy4jvw2MxoZodmnNpUIV1ye0Wt1TRYfFqLZ
	KVhphUjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNx2p-0000000HCfH-0sLy;
	Wed, 18 Dec 2024 16:37:07 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNx1i-0000000HCQ9-3miQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 16:36:00 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4678c9310afso272121cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 08:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734539757; x=1735144557; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hU1Z8+lcg+ptXSveEoYze+mbRwLw9U4+cd4zYPlrev0=;
        b=YEI1+E47o+Jv6qm+AX68W4x7TiYQGTWuIqvk1wJyMLjLpmylUEXIssMy1Z0w+tUtxq
         d7t9uRpNQg3GGrnAE5uNaaBujqes0vGygToZ30/50gnLgtg+Ir12euUWJAgQ5fHfl2Ab
         hntAuLq3YMoC9qpo1kofQn3GDbydr8JRg2wZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734539757; x=1735144557;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hU1Z8+lcg+ptXSveEoYze+mbRwLw9U4+cd4zYPlrev0=;
        b=MAQN4Z8eJBczgVMZrYInvdBBkPies698Gt4s5Jk9uj+IkBA7xFhMa9CdWvTVnrclGq
         Pq3b+99+x5r3t2uv5LBku2kfWxiTwXJH+46K0sET9dr5g6xhGjzQ96MYXmNts1Ku7zmW
         kBqqTi4GS/wA6W2ke5psuFwVj7OmcL5I0yxfoeALiwcC7OMjyL4hwbsI4ZjwSTw6yKq9
         qzgkOIpPJfOZxV5it7FNWKJsDFph68Ib1sO5ro+DcvcQUoFT+esPFrJ7hYERs9HOFglL
         GbWix1QopISXEBmo4xuEU4Hn/9YaQ9raGmIlsvG4rLm49W/czOYbsDEKC9i83JjRuK1T
         S5ww==
X-Forwarded-Encrypted: i=1; AJvYcCW8rIEniqeA0Cu9hgzr7yNVZsUPNY0cDDZK/BdPlDZQjRk1M0GP1AT6spKo2K6cf3jTV7kMu3ICqzrHErNX8lSo@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2vjnGAMCEB3qhGyviQkQRQclPM1ydSRodpM9SqY7IURkDoJAS
	5Kltv/W210bKn0SV/OQRJyugsLspD0GVDXs3yKB9/To8IvNkpXssNj/LePK1ICrHt+gehdHBMMm
	+KLrVerW3urdW25I1VGBpveBH8VysM764Ej83
X-Gm-Gg: ASbGnctc0hJnH4q5wRP/2Nqlr9Y9OmAf6xjo3GsLA2wbar4fr8/cLm73iorFk6KMNtr
	375rErAGtla0cy2M/YTY3GsBo/sEbLnpfzovqLdZYLBkeBcLV3bnl6dU2/wI8hg9aANELRQ==
X-Google-Smtp-Source: AGHT+IGlf+Wlv9h2+51DeY+YpWsJpttrKLiQ4T5hKVUT5e2IblIuVjyaICps4zat75Zd9spNCR9Zv3byB1374eRD8gw=
X-Received: by 2002:ac8:5f49:0:b0:467:7ef7:88a3 with SMTP id
 d75a77b69052e-469090dc683mr4277431cf.16.1734539756443; Wed, 18 Dec 2024
 08:35:56 -0800 (PST)
MIME-Version: 1.0
References: <20241214005248.198803-1-dianders@chromium.org>
 <20241213165201.v2.1.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid>
 <CAODwPW_c+Ycu_zhiDOKN-fH2FEWf2pxr+FcugpqEjLX-nVjQrg@mail.gmail.com>
 <CAD=FV=UHBA7zXZEw3K6TRpZEN-ApOkmymhRCOkz7h+yrAkR_Dw@mail.gmail.com>
 <CAODwPW8s4GhWGuZMUbWVNLYw_EVJe=EeMDacy1hxDLmnthwoFg@mail.gmail.com> <CAD=FV=X61y+RmbWCiZut_HHVS4jPdv_ZB8F+_Hs0R-1aKHdK4w@mail.gmail.com>
In-Reply-To: <CAD=FV=X61y+RmbWCiZut_HHVS4jPdv_ZB8F+_Hs0R-1aKHdK4w@mail.gmail.com>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 18 Dec 2024 17:35:45 +0100
Message-ID: <CAODwPW_UNVkyXKxyhZv830bhzsy5idu6GiuR9mut+-qGOtv1pw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] arm64: errata: Assume that unknown CPUs _are_
 vulnerable to Spectre BHB
To: Doug Anderson <dianders@chromium.org>
Cc: Julius Werner <jwerner@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-arm-kernel@lists.infradead.org, 
	Roxana Bradescu <roxabee@google.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	bjorn.andersson@oss.qualcomm.com, stable@vger.kernel.org, 
	James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_083559_021907_F46CBC2E 
X-CRM114-Status: GOOD (  20.38  )
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

> Given that I'm not going to change the way the existing predicates
> work, if I move the "fallback" setting `max_bhb_k` to 32 to
> spectre_bhb_enable_mitigation() then when we set `max_bhb_k` becomes
> inconsistent between recognized and unrecognized CPUs.

A clean way to fix that could be to change spectre_bhb_loop_affected()
to just return the K-value (rather than change max_bhb_k directly),
and then set max_bhb_k to the max() of that return value and the
existing value when it is called from spectre_bhb_enable_mitigation().
That way, max_bhb_k would only be updated from
spectre_bhb_enable_mitigation().

> I would also say that having `max_bhb_k` get set in an inconsistent
> place opens us up for bugs in the future. Even if it works today, I
> imagine someone could change things in the future such that
> spectre_bhb_enable_mitigation() reads `max_bhb_k` and essentially
> caches it (maybe it constructs an instruction based on it). If that
> happened things could be subtly broken for the "unrecognized CPU" case
> because the first CPU would "cache" the value without it having been
> called on all CPUs.

This would likely already be a problem with the current code, since
spectre_bhb_enable_mitigations() is called one at a time for each CPU
and the max_bhb_k value is only valid once it has been called on all
CPUs. If someone tried to just immediately use the value inside the
function that would just be a bug either way. (Right now this should
not be a problem because max_bhb_k is only used by
spectre_bhb_patch_loop_iter() which ends up being called through
apply_alternatives_all(), which should only run after all those CPU
errata cpu_enable callbacks have been called.)

