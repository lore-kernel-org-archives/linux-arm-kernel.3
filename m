Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9688C02187
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 18:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NML6rTX9L72qLlb7AfCBgnyR2cbBUx3c6akQrbExKxg=; b=DnvaETowSIsCcUloHRWwI9zyDG
	6EKSFsMYc4dLe+jFtB/bYGBKZ/E9f6TLab65oU250KfCkloePLXjQuQwrsBbfNfM64noFB159iWIe
	EpI1WbpNUvWG7+WY33qRcmqUN6tHZit5pg9WqHKze6jgrQFqDJ1iJRaTerOBxMMs/09XRTxHkoNFE
	/GeHvIFd5e4Rz+b4OUCJJlRvAf2ccg6DClFvrMa2NePdoQ+j2Cz6QgOTdYcljaX370FjYqsDTlYF6
	c7YzNf8z1rQ37LzXZhft0h3wn9nhEmhblBkPYvyR9J+zElitS+NoHBX+CdVwG+Y1jZOkI+JHFCJKs
	Sv/YaUyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYUq3-0000000FodR-020S;
	Thu, 16 Jan 2025 18:43:31 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYUom-0000000FoXA-09yq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 18:42:13 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e4930eca0d4so2004823276.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 10:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737052931; x=1737657731; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NML6rTX9L72qLlb7AfCBgnyR2cbBUx3c6akQrbExKxg=;
        b=PwNFtJixAarmJk/NJ4gWfDvFk9P1Z07KMSWXhN8+Xqu2uLa7JDpqRcVCvAmI4eWShs
         lFq9MLJlviDIY2iI13+EyDTvdK0DsfdyKI0dv+2rH1G7hojqlhvcnQgUH7hx8IlUYKKb
         AjeuWYStl9wbGVlPNHWfJEflgvXM82KW7DUqYevW3oi0LNWszrKpVA72pZUQwAQ3VDNv
         cXtx9GsbjiC3e2WlY0E0/Fj2SSqsiduxBNdAvaLmwssP5DuF1oYIItzv5V+qEb6TtA83
         y7N4e5SdZZNswxd0hmUKIfPkV694w0xzAD2G+nvoIPFBtZbBEn/5MT3Zm+5rRjJEWNiv
         8ZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737052931; x=1737657731;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NML6rTX9L72qLlb7AfCBgnyR2cbBUx3c6akQrbExKxg=;
        b=hRF99JvDKc91R7PyvhKdgozTi38v0oirJATRGBQHZPI513LdT4DBZWfF+BhGWQwM8U
         5dJ6EHhJgpnVv+YfY8aII/KtTAor608uaF6Ln2117Mq1c/qhNI2E9/+1Yom9SIu9WIW5
         96RCdKp9mqR05ceBpETWb0iWYvwKSh10KQcDNE6rG5uUrXAP6lHBAgEy2f62I09dLAjp
         ySKI8DKntmBjfy8k3XtntIcPv5mHuwF/kWSSTp3zEm6B208V4ojJgXGaxM4ZSMLANZYO
         fGKZeEBxe1VVNsie5T07u7zGDxlPAH1wMtoIZ68K3XvuUy2q1FkK0ZySpjhanyB32naH
         Dd9g==
X-Forwarded-Encrypted: i=1; AJvYcCWZWdHIcvxHNlnWeqDgaeQvEtO/wlOLNu8NWqQdvIOC64kR5eHyBOfyJGvn8Ys1H2cgn56Rm3m7mfuHXSBK7Oc/@lists.infradead.org
X-Gm-Message-State: AOJu0YyG8APiIfw5SrFGJKvmrqWg2uhydytknPuX8MZHWb7uXzXD+LnQ
	k6ybdhjhxuOziQO0ktxhuQW0ZsSu34Oi9kYhX3MjREM5pBh2gItGHO5sAmtfqwhiknkDM2ZiX+g
	xucY8Coo+ylPn31dJyGTC1I/gRy8=
X-Gm-Gg: ASbGncv2uRtZCMo9GjOel2D17od4XhTHS1QFcdpu01LU5egO+w2a23WiVg3Prw5LV/l
	u7W9FdSNg4GfXJGbzd3efoixAp3YaXUZTBYwyBxA=
X-Google-Smtp-Source: AGHT+IGgrjI/s6xaOVBHbScyM7IE9Im1N4NOLXcypovdtK+sa6A2HqO5UQpSC92AIJbeGu6/Yntga1lOW0CS39rvr40=
X-Received: by 2002:a05:6902:1448:b0:e57:633b:6781 with SMTP id
 3f1490d57ef6-e57633b6cf8mr12550590276.44.1737052930723; Thu, 16 Jan 2025
 10:42:10 -0800 (PST)
MIME-Version: 1.0
References: <20250115-z2-v4-0-d7361ab16ba0@gmail.com> <20250115-z2-v4-2-d7361ab16ba0@gmail.com>
 <3991ab78-d1a2-4cae-bea5-fb4dfa58aba3@wanadoo.fr> <fbfea2a1-71e7-4572-ada2-0d4315c97e91@wanadoo.fr>
In-Reply-To: <fbfea2a1-71e7-4572-ada2-0d4315c97e91@wanadoo.fr>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Thu, 16 Jan 2025 19:41:58 +0100
X-Gm-Features: AbW1kvbV-JZv8ggAR3kH02R-upbl0ZACxuPcSn7inUrp8BPKXzOfVMY_gM5ZC54
Message-ID: <CAMT+MTSTtwsoWMPuF9cHt1oHE8geWYZr4t7EU44wq5m3zbSyew@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] input: apple_z2: Add a driver for Apple Z2 touchscreens
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: devnull+fnkl.kernel.gmail.com@kernel.org, alyssa@rosenzweig.io, 
	asahi@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	dmitry.torokhov@gmail.com, j@jannau.net, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, marcan@marcan.st, neal@gompa.dev, 
	robh@kernel.org, rydberg@bitmath.org, sven@svenpeter.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_104212_081834_AE094465 
X-CRM114-Status: GOOD (  14.36  )
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

On Thu, 16 Jan 2025 at 19:29, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> >> +    z2->tx_buf = devm_kzalloc(dev, sizeof(struct
> >> apple_z2_read_interrupt_cmd), GFP_KERNEL);
> >> +    z2->rx_buf = devm_kzalloc(dev, 4096, GFP_KERNEL);
> >
> > This will allocate 8192 bytes because of the way the allocator works.
> > It needs around 40 bytes for the devm stuff + 4096 requested. So
> > rounding rules will allocate 8192 bytes.
> >
> > So either you could allocate "for free" much more space, or you could
> > allocate (and document...)
> >      z2->rx_buf = devm_kzalloc(dev, 4096 - sizeof(struct devres),
> > GFP_KERNEL);
> >
> > or have an explicit devm_add_action_or_reset() that would require less
> > memory, but would add some LoC.
> >
>
> or leave it as-is, of course ;-)
>
> >
> > See https://elixir.bootlin.com/linux/v6.13-rc3/source/drivers/base/
> > devres.c#L97
> >

The precise size does not matter in this case, 4096 was picked semi-arbitrarily
as a "nice-looking" number that is definitely bigger than the maximum
message size.

