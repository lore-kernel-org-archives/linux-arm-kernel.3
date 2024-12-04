Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6D5E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 09:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHrIZaLEeFmzu5KQ0LKYc7lzyVxc78OLSyYQ7PV95dk=; b=o7CMR/6eWlaCBVUAYyY6ls2yvy
	/HzYhczrWkPa24ze+UJSuqYwXCnJuANXArt8vw2rmVZ6gIivQrnBg4tg4fOKx2NkPYhxFcMfBQhsu
	FHsyR93UjC08pejGahW0ihxd9Y0KLQDCQ8tKlr2v2LF0Et/enCHz5O5nBULgnB07uCQjkaI3hZkxg
	RafivliGzG++Ql+HvxG7XJQXEa/q/V/QJfkWGmUvhP0sT3JNVC3YdUkdv4Gxh4tPswGz4f1Qhzu+L
	fNpYm/56Y8j1/OUml7nZcVfz6dkcILDF+USs9nBNueroBAeb5Lj6Ejsbto/l3PBVrvMck0w2Mk+Cd
	QLhilk4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlhr-0000000C2qb-0G8s;
	Wed, 04 Dec 2024 09:30:03 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlgr-0000000C2dE-0SHZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 09:29:02 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e39841c8fd6so5039044276.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 01:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733304539; x=1733909339; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pHrIZaLEeFmzu5KQ0LKYc7lzyVxc78OLSyYQ7PV95dk=;
        b=L+ibu61YflVUoaXFlQcEwiT5B+2smVck+TfEgQtLvV3LCrxyLDOkEB+N3BXDONhSIw
         GSoI+rlSzs2QEbKmklxMuioD+vcsLnk8ebFOrTQwSygq08IKH1D4msjqu66ZUL5t2pjD
         Aasr73yYhH4xND1FhDgd8uIsI0sy6LGpgsnAOGqep1pF5SV8x0ZfkIYeGwLSV9sHMEJ6
         6hSwbCen1x4nAavgPehELTg8A2AjzxZCZZSbCMnSZjkESkL/mcO/3+f/t8Bck1w8Cjjz
         oGXbZyKOlBOsClgCLG230f3x2lB5Rtz5rwka0SIcoZ7gwWghH8XYEY1XvSNkxBacpodJ
         wxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733304539; x=1733909339;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pHrIZaLEeFmzu5KQ0LKYc7lzyVxc78OLSyYQ7PV95dk=;
        b=DNM7BTTLgTcfdjeLAXonC+D8Rp9Y9m+vH2Ik+PY9myYKw5NWcPbiTt33f455RxWVu8
         BjbXvrMQNUwELnlHUku16DPsvoE/zVyeaTvhFs9llbjWNwHyxs0YTf4oKedR4nD7IVhJ
         OJMnFzuobud7ZVSobpyh5ag/A0tnMQxjaEwekv3ohSld/ShGUx/duFCa/fezU9OAGxX/
         oZ9elr1MVkST1pD+Rky4+p86fWY9Nq2z84oDjq7S93A+TO+6xidJ8jRZUj40f4GzS6pV
         262IHqyZBnolc7DrQAeSIm25iTFAlQUtk52v+24/8uj7W3wtnX0kMcriUxcXL8fczi2l
         S07Q==
X-Forwarded-Encrypted: i=1; AJvYcCVNDRqk0jwFphVsYef2hcM7iKqL8FlZjH35XwMioBe9UMIdBZX6ySzQn1Qygy5tKr4D52Mk9Vkt3qYsNyQueTne@lists.infradead.org
X-Gm-Message-State: AOJu0YzWP50MuEBLcr+lyUlFR5rIlrNBq7MinJaQxGVjE/+OCl5RnZnM
	0yM2M28cgVVoCNg0eL6j4zb0upUm0AC7hisiRNV1wxuCeUiY3XdNiyHQHpAVZWgudFP7wu9y6p4
	W1gLeT+2qUSzPxyn6r2MplERvvnx+Tw==
X-Gm-Gg: ASbGncuk2PLSIRZjHDhe+Y9Z4WhLaOL6LOErF/1uvaBS9li6QxCviITVnipW9ZiMpxj
	2jjDx8gpebbD5iKCUN/+UKlRl20Wu+wGo
X-Google-Smtp-Source: AGHT+IHmiUq5JaZBzDl7/VKOgdhADM9Ii0ineCplj6K99/74ASpMyAFGBPqR+m4ORzqcODkAuKrJN0c0KPHOQNpBbMg=
X-Received: by 2002:a05:6902:2d91:b0:e30:cea9:b071 with SMTP id
 3f1490d57ef6-e39d3e20f00mr4260700276.29.1733304539556; Wed, 04 Dec 2024
 01:28:59 -0800 (PST)
MIME-Version: 1.0
References: <20241128-z2-v2-0-76cc59bbf117@gmail.com> <20241128-z2-v2-2-76cc59bbf117@gmail.com>
 <Z0-PRapfiAUGvr4W@google.com>
In-Reply-To: <Z0-PRapfiAUGvr4W@google.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 4 Dec 2024 10:28:48 +0100
Message-ID: <CAMT+MTQ3M1gfz5aLWd17R-RODJi-wnxKJvf9zoX+TjoZMKjCKA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] input: apple_z2: Add a driver for Apple Z2 touchscreens
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_012901_145703_80344359 
X-CRM114-Status: GOOD (  13.04  )
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

On Wed, 4 Dec 2024 at 00:07, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > +     z2->counter = 1 - z2->counter;
>
> Is this toggling between 1 and 0? Should it be "counter = !counter"? And
> is there better name than counter?

message_index_parity? Kind of a mouthful.

> > +     .remove   = apple_z2_shutdown,
>
> Purring the device into reset state before tearing down interrupt
> handler, etc, may lead to weird errors. Why do you need to do this on
> removal instead of letting devm tear down the device?

The interrupt is masked before putting the device into reset,
and i do need to put it into reset when removing it.

