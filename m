Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09499CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 07:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGMFrm6EMrXrVFbpoOcvMp4m0AfriiOIio3hMd6Tp4c=; b=Ud+NwMmsZTs9iY6rJIkcYGKPQ0
	N2h5A+nd42SjHm7KTJPPeBEUdU7mbPAsn81K7+k9sh/lQ7mDf8RjH4YJSmMEI2qjF3abLQShkglWn
	lIXJyyS0DP/T8xzMGsISUhAStvY84+ch1yH1HXhi6cypXzqUGM8RZtGmcmYx/TmCCsxlI046YBzU6
	HE0qX+VyYo8FQEz+V3kM4wFgdcQh2LSAOB/4qWB0JXdn8hAgM7u2l3uWN8kchFmhw0nJe0CQqDTvl
	PyTtFi6UOzPI7mNR9C5p/gpNxW5SaQBREqznjdIHjypGn+aTB9hcKhQZqcWI5/wyS6R9uCQFHzkXo
	RCad5+Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2Pz-0000000GIgo-0Xp8;
	Thu, 04 Jun 2026 07:23:07 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2Pw-0000000GIgQ-30Ud
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 07:23:05 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-7e255c15ffcso811777b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 00:23:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780557783; cv=none;
        d=google.com; s=arc-20240605;
        b=CF8ye4MPGKFl4DVCE/sqAoUTZsCQOh4KIIonUgmHA8Ojsknh/xOAQqWl+Ovuw4Rpxm
         xTmZOMsKL0EJtxhN1x52L/efgruzlkKrqAWqZXT9moG3z4KWzRhY48KnrhB2jDApA6NV
         Wxc2BxZODhe6LhyNtLN6gT+n32DgDG1FjqbDxYeE0PCoh7bE+U2tBQ/2jTd0m9zeq7VP
         wvbZF36QZa67OZoaj1DMj+OqLugiUWWetHCc5KvtUrRk7KkccPz57TMkWzwIVKHYVj7U
         Q7VQmh8MTZZlLkxQLtmIjsvO1EbZW6jYtsiCzWqh4JCuapycr1G67laewQmfjvzzXA2P
         eLtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kGMFrm6EMrXrVFbpoOcvMp4m0AfriiOIio3hMd6Tp4c=;
        fh=HGZlYuvFpFZQMgFXB0lIiVbbRRnAfZ2DqoUHZVkJV9g=;
        b=YglNxNT/3slDbAhtc+vJeIRCSC403eMWhiTS2XjJckJzGJmF+3Az6Yxf0B2ex+8y75
         uYTHIg2bWchDL+z3MgN2z3UvtifabYrHAdvv1H2qNyQ61T3doO+FhxLdFLJYiBqabrOs
         P6lLhkTDBaIG21zFLaKGyLRE/d8hfjqPuCqFeMfZs1b6iXgZuZTrnbt54na95ZXDmEPv
         Dv17a3bIRHQOkW1lI6qXZsqPpNDjuyRvun0X0WUL1q4bu8YTdCLDm3U5TeTg3N5sSc9f
         QdteJ1BsBLWd6+z+j9BiWscQj/4thwfE2loPHLl8THqgDvMUj2Wrl/IeNfCH9fQmn/gU
         BhuA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780557783; x=1781162583; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGMFrm6EMrXrVFbpoOcvMp4m0AfriiOIio3hMd6Tp4c=;
        b=fKqSggfp/E0l9fqzEyBsImVa9LDg4L6TuB8S1vhdNmjudYSg886csqEkVgs/F6JGSI
         B0NH1Tg7dgxKo6sMOft5b4iysLT1tZUI8HicqgvjvpQZw2v5dzUg+QkBOUR66i5Q+sYj
         unCUVGF5h2TyPsYFDux0QGn7IjUes3XnGYpPao50K3f6b4taDG+3e+Hofs9lW9Hw3hof
         GWKwzbrzW7Utct//ZRmBonR7IqFJuFDjg9BGIlh+MJDauR5uwjjq97BtWPjd4bKJkHUW
         slx1ADizzQSW295u4syiVQmuSMhH8KTeLy/BdNl3KAiIQhUc3euZmlYncQUFVUKdrbau
         kxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780557783; x=1781162583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kGMFrm6EMrXrVFbpoOcvMp4m0AfriiOIio3hMd6Tp4c=;
        b=gYllDhWIiBXTJ4hn8aeVihfKuX7Xc+g4u6aUm+icYmBHJmQL/tCe4TZNJIAxx6R9zO
         rb9HhMq8IWpy6mmirB/TH4n4rCLW3iYoMuBoV7h+Wu9t3P9s9HGBsJgg6PazZWXJ/Kf8
         T3eL3PrWsD1MFYWEQ34x4aslggSfMziSBgBRbYyDCfUYnzsF/IPWqXl56dP9RxHlTM8K
         J8H5OryMkOe94ZDWfAY20+y6rBUFnKKOA8ztu9SagMmOxxsMRMJ9nDQggcYv+Ce13JtJ
         41jRu9WkZOafSSBUS680QyDJ/sTlDKMnEXGDKXWz3kQwKRWku+nDzYNQxZM/mx+fCT1n
         FzJw==
X-Forwarded-Encrypted: i=1; AFNElJ/KSJg9XHAPeNtN2YEMD/Kefsag+aTCfyLygNZhkf6FzC4Vuya2mCYKGT5msk1AOV2b8MiCU2HQxvcO7J3wYODl@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7HcoMo9DV/7CEe3LqE3B019wZEf29ueM1JA2/ZXThbBqDi3Vx
	UfnIF+OHnqTXqm026du5GafgBOd9MF7+vZ1pMYSFPipek2vx4cbAmD/LgiJjWffJeD/M0tYJGtq
	rmK98lOjyBpst1AORH/ljiVdI8qP9xlk=
X-Gm-Gg: Acq92OFFL8V4fST++jrunKjPx15izb9DY6UxGMhfsUhDNwWdgifYFhe8p2kgSX/3KCy
	PPupiOsYNVmRBa3dQBSJvaW1dkEejAeRqZECfkYqgqwk7CTqarEoQxMNFU4QE3+vt7QLo+nOu3X
	AnIeZsgta193OcovKRzj/X/y26oaIGe7XNk5OIdQraf8pP5uyjSCNttmw8fA5VtYawpjQaltns6
	Bz3kRqGeXON/JIvz4ETkVOxnMEp1EPkGIEzHGX0IxDNQFBtdAr4t/VRkhoPcjOaT+hrbiBqFSnR
	EX+S63XGcI287uQ=
X-Received: by 2002:a05:690e:b4e:b0:653:1298:2757 with SMTP id
 956f58d0204a3-660f40fd7eamr810427d50.3.1780557783018; Thu, 04 Jun 2026
 00:23:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260512224349.64621-11-l.rubusch@gmail.com> <20260601090329.52616-1-marco.crivellari@suse.com>
In-Reply-To: <20260601090329.52616-1-marco.crivellari@suse.com>
From: Lothar Rubusch <l.rubusch@gmail.com>
Date: Thu, 4 Jun 2026 09:22:24 +0200
X-Gm-Features: AVHnY4LwRu92F53BArrCe-tkeP9ej-aZpiASNoZK4Sv5BA0YGwuO5g8QXL7iscc
Message-ID: <CAFXKEHYS7brYaz0ROMfj0gJUc-kHW+M04WG=_BWPaM3an6TcAQ@mail.gmail.com>
Subject: Re: [PATCH 10/12] crypto: atmel - update workqueue flags and add
 flush on exit
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
	davem@davemloft.net, herbert@gondor.apana.org.au, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com, 
	thorsten.blum@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_002304_785137_5B87863A 
X-CRM114-Status: GOOD (  14.07  )
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

Hi Marco,

On Mon, Jun 1, 2026 at 11:03=E2=80=AFAM Marco Crivellari
<marco.crivellari@suse.com> wrote:
>
> Hi,
>
> > Update workqueue initialization to use WQ_MEM_RECLAIM instead of
> > WQ_PERCPU
>
> Not sure if you're working on this series right now, but this must keep
> the WQ_PERCPU flag. WQ_PERCPU has been added to mark explicitly mark
> workqueue that are per-CPU (it is the complement of WQ_UNBOUND).
>
Yes. I plan on splitting up the material presented in this series.

This particular patch was one of the things I was a unsure, if this
actually could be done.
Therefore it was already separted out. I highly appreciate your
feedback. I will drop this
change and leave WQ_PERCPU until I get there.

>
> Thanks!
>

