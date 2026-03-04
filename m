Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3158FEB7EB8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 11:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BtRkwfk+PNdh4uDlD82Pllah5hbXu3rUufazzxcR51E=; b=d9EsrVSQeBp1gULHHzsYmJx8Gq
	fiRtZdC+Eg3tckPHRiWnv0hclh9KDMCD1YAZ4/CP15BE045f6nNkrfXCEKa2biOwxYXA76Lakjkty
	UT+rS5EMbJ1XPtF5A+bjH3zpPOOs3pPtIQF2uPYv+M6iqMxykqvzLIfXs3tNLOK93u63T/3IsX8E4
	x7MbZjVvedPnw/i28ftPyddHQIt4qEfoz870BNeLwDIWoGPiFOkI5rSgnzbnoi1wf8+5Krv7EBoPQ
	fmZ8doOxJwAM79WQoW0MGJ8XRBvnkOgZh5dCdRK8wDelIui+RZnafk5yxT2G40N+B1QrTkHobvfE9
	joThVqVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxkMJ-0000000H5fL-1mqN;
	Wed, 04 Mar 2026 11:25:43 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxkMG-0000000H5eE-2VYF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 11:25:42 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-389fad34e2eso110393891fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 03:25:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772623538; cv=none;
        d=google.com; s=arc-20240605;
        b=SPx8leCAsC4cHk/fX4fXGuHuojTnZVq/6W6L3eQ44pKqNH1gss3ILDrZugSSebrn0q
         eZcjXakq/EMBeG3akgdpdeRImNndCUdAv0xRImv61kniJdnQre0J3a1TE7lNJFY8IebU
         ux9rObF616LHpWQHFmLNoR3upI6uJmbgy4GrP4hrhRXO0NflpwmZqa4lRGlLOFuabBCg
         s3AMj+stKHM/4FTyyxPnnDb7WUnyC1Tqb8BwD4G3GhWiwpH78BGHmJ8k9A7JE86YAcsW
         S0FCWTT7Wo7DiOhxpf3QxWPaARS+ggspPvmjrAMN4Bp3pWSC+4H2aYju1RPXCCYT2RL/
         uHjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BtRkwfk+PNdh4uDlD82Pllah5hbXu3rUufazzxcR51E=;
        fh=E7pU7uQ7iCuGpzxEpWogOK+hhph2QEN4B2EtdTuJjxg=;
        b=FP4baPRGfSqsmIhnjQ3bsZfpQBurJnrGIeD6jA1Zz8u03V50tctH4B/D30CTCzoA75
         5iZDJNFEUpukXP826Gyx3jECJam7/IhvTaa+BigMCOrjeYTDI04dyZ5MeNKRG7kYqeaj
         GZO1DPykBGoOb+7nvVsW1xWdEtwhktTd+rq8YlTDSIWA6iOqdIdOq5Slo+pdsklB4SRZ
         bgdBjJEeVNnbYBo1J3mxRa1AcUCvMhqw/lC7azkj8Qac6yk9L7LuGvj9OOCFuZzzIdCB
         gOY7vvhf2u1Ipz9KmqYLMhE0I1tTqF3yMxC0h2KLH1kgFdmdcxbY3QJVcwXS7VpaFG2O
         eVIg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772623538; x=1773228338; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BtRkwfk+PNdh4uDlD82Pllah5hbXu3rUufazzxcR51E=;
        b=Gqzbx/qztg1Psnz+NTyxUiA+bQT4SLpmv2j3ECO32FcadJw3oKKa8G0azJQbSSOEQ6
         X8BqcdZTjnjCRpuWzTio93oy+ByKoAqLC48f4l9Upuh29UYEGKyk7L+SoolOvi/JO0/S
         UorGTAflYi4HMkxjo1Gf3E2lOMQiiKTDYNvhvgukOTazAxygss+9XduiaCAXWDQpU6bE
         f9JnWWkZSIzoOXad6T2Lzu8nFnl6uUUqoeJ2jRQMRGVVUdhYO9Vl1y9QQLrzpGLM1c5Z
         UkPqOOFstNdgGOVDSrLj5l9BJGdyHG7EigFenA7RWO+tckJAQ+r0BvGOHbEJbXSDfJH8
         LkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772623538; x=1773228338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtRkwfk+PNdh4uDlD82Pllah5hbXu3rUufazzxcR51E=;
        b=jwN2QkTtIdmky263C3IZJhNw6POmP3hgyyMqHtkkRtRUmL+IF+7+4jZOuHwMI1f7I7
         +ywj5PeTOZxizWH4BN3fs+Cwrp1hu9xYyr0bA55N+Lkdi89ejPZ5tX6ouSlCZ87GDTXo
         rL7m/X2llaYfVtkuLbSYhE7uBqRLMksjNhZk+kbQnvV6XMmZq+O7kMuvo+tadCsTk+Av
         YKEVO0W3TV0ymKwBExgk2hrh3W5vGpQ8yF/Jm7l4SpmSGlrtzoNt/JYAJqrQFXJHCKGf
         vZV+YLs/KgNOpC27Jb533sbCiGxGRxrQvw4lDfHV8tyE0r/eAT0A/TVbrgZ+V8pdp6dx
         sA2A==
X-Forwarded-Encrypted: i=1; AJvYcCXQRXEiD6DQExJDXuaR0kNQp85p3D9twyYt9MNDiNtKcx2AXV4RA4V1nZtf6Gx/iyPrROPuqupFwaol2dggcPx6@lists.infradead.org
X-Gm-Message-State: AOJu0YzbPTIIVoVLMp8HHPceND9+tWueeRNrQ9i4LBX+aBq/TIRsySWf
	8pfqMBkkyFhiI2wju05LcZEyc0FxDwl4LgpJATa9bkFDdHfQ98eC/iDzXpxhyAxiLT3Q/aynMa1
	9DpXQKoZZsLNHG612wL9AVRwe4ffd0pvwlBfB0GwPvQ==
X-Gm-Gg: ATEYQzzHXjy37vLz1pBUDGXICNyCAQtGnFt5/v+P4PQhO3XsudJhoWkWxMKZLMzoXb9
	zdwqLRZPJ8ZZ3YqYEp1gv9lqgQjNLRnYlUHDTHO9VjT+WEK4/IZ6vUgV8G4MsVCSOkyGMpup/ek
	Wj2WcwGHY73bQrQksn7T2qYtfB/3xRBg4+OPlJz6lPdY4E6y7BAsv9jv1/uzkNQbz8a89Gwj/aD
	t0PWUowOuOzGDqqzLQSIB+aqOqsJgcUTN59/YX5+TQKXPeFMGrEPvXv2VlxELPgRJYCY9P6umEY
	GCANFaKX
X-Received: by 2002:a2e:bc85:0:b0:38a:291c:dbcc with SMTP id
 38308e7fff4ca-38a2c5b1e30mr14538301fa.19.1772623538449; Wed, 04 Mar 2026
 03:25:38 -0800 (PST)
MIME-Version: 1.0
References: <20260304101457.7470-1-ulf.hansson@linaro.org> <aagINsZj6sgR7pNY@pluto>
In-Reply-To: <aagINsZj6sgR7pNY@pluto>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 4 Mar 2026 12:25:02 +0100
X-Gm-Features: AaiRm50EmpkkbwvQCpRktsjqw5A47RE-7PTWTUJApXKOBbCTS7pFpVE9W3izezc
Message-ID: <CAPDyKFqQQF1BJODNNuRLAathyM4oRFfXJfcx83Db2usRbxQPgw@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: arm: Add print after a successful probe for
 SCMI power domains
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, linux-pm@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_032540_653131_43500EF6 
X-CRM114-Status: GOOD (  12.61  )
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

On Wed, 4 Mar 2026 at 11:24, Cristian Marussi <cristian.marussi@arm.com> wrote:
>
> On Wed, Mar 04, 2026 at 11:14:57AM +0100, Ulf Hansson wrote:
> > It can be discussed how useful a print is after a successful probe. In the
> > SCMI power domain case it's seems valuable, as it let us inform about the
> > number of initialized power domains too, which is fetched from firmware.
>
> Hi,
>
> yes indeed we tend to print such 'summary' info at the end of a
> successful probe in other SCMI drivers.
>
> LGTM.
> Review-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks! I have queued this up for v7.1.

Kind regards
Uffe

