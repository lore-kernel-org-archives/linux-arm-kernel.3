Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9527AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 14:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/PMJfwXDmjutwz2ZqUdHqOQ1qGXDhEDRkGoA21ZDRuY=; b=E5ZuCdT/7qM34FEdOlC07NP8z4
	OQK4NicxQaAzcwcD/mgsSTj8oXprHhQKeR4hsZJLbMT7ffq9bePBjRq+6n4mN+2ZUdPvPcAKC8kX8
	/ljc/Zq2kq2D3bI60tGWONfWVbMpsnRGHT/J5OO9D3f0EVBemvTwjzk+4gAGj4EFb21VOjJlR1a7w
	3VvotFC91NaVHM9mwVj2doFxQOLGOMgCKmOSXfXVcrvaUq2450Qz3aWZS8BRDz5fqO5u/WQ/yi1tY
	wpEvvrMtXZQ4vpFXEWrWIu53ONliepLZZ5vYyOnyPtO9afqWguWPfdb1PjdAESt+zKB5bqJBjazar
	GdB9N3og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevzp-00000002Idt-3ST1;
	Wed, 01 Jul 2026 14:33:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevzn-00000002IdY-3hpa
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Jul 2026 14:33:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/PMJfwXDmjutwz2ZqUdHqOQ1qGXDhEDRkGoA21ZDRuY=; b=bxFfXPB9ReovImXpPNq/QZXl9v
	MGiypUbkqhuzclFcT3nqB8LssGnKLRdcmgG5GWRFJGmNolN0fr3PZv18ZSUCB2tq5O4OtukMCFNOp
	yy53/aFO3/YAhaLdPBsg2+UaoqNncP+gka0BWUsuSt2mNDF9SJnSuluQv7utsAGpxKqGFxDvjWIV7
	JcndD5E/WaDmAnn3l9UFEMAVhfVvKUcmWjdH9XTkxp8di/98XGtdYW6o3ls9MkDVArVG5adyElG4G
	fMTqq2P7FOMvudL6SQjbHb0J24lH6zIlxfTEENWsFO7jdeXauSWChLCoqcXg4Wfs7gFSsiPm/DoZj
	DeXmpDVA==;
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wevzl-00000002tJb-0HMr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 14:32:58 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-664cdeab266so914068d50.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 07:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782916374; cv=none;
        d=google.com; s=arc-20260327;
        b=hsjcO6O5LHGDzTVaxVjvx/2h9cm2pZ+XQ+6PXR+tDZB0GnD5IlVgQCICTDSTiyeFmn
         5h6n6HLcsOwUiwfxCbrxawCCm3Ph1RlVDTGwzq4bkZqu3kv1nYiytY7/AM/RwnLxQ/XH
         O0MQl1Uu0Siz0PDYIswBjEoLh/+uZchPA0uCbcASIksNwiWT6vLyjPSiwR2AOWJVDlsY
         fV/NA3NYLIE5jTV/eLwT7VCHcP4QXow0wRunPP7jphMIOtL0AZTBpb/RlJHAZ53YSvbu
         3p71xEt7BLlYS0L/wZlEnFFvsiIEiDsWuDusasGoNwbB4xG+ZxciBhodxrZzMczjytfV
         Ygmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/PMJfwXDmjutwz2ZqUdHqOQ1qGXDhEDRkGoA21ZDRuY=;
        fh=8FphMBLLB8R9zoONZe1BEWv0xy4Oc87KztO6eSTj4ls=;
        b=UwUx7Ck/s1oMDOsEF6ahUwP3nYNTE5z9Yo9LNxxiasaALbJX1xSRrT2dY04Q0N8zDa
         BVXAAUX8h/kCTOwPePA8zdlobHGVgU+I3BZGKnDimdrFy/ARQNQBCoztor7mdDYeli1K
         spZwHfaX06ymxAnvqygjiz8+1ppR+ODLps1/HRzEybbAiAwNhyThPT97n0AtPh3ANoO0
         5dzF/u8yL0JcLDJzPhmM5yGEWiWzO0Jn6Tm3dfjg6MazzZ1tSQlgFVsIUwb3Nxugleag
         VI5lEhPD1Ns6m9mG4YxjZs0jB+tcCUinqg5HgKZLbaXiCkknSLtX1WaNROXA8T+0Mx46
         dR7g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782916374; x=1783521174; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/PMJfwXDmjutwz2ZqUdHqOQ1qGXDhEDRkGoA21ZDRuY=;
        b=PPRJklVmYNH8uA71N33luvooc6gkF8KU/Nyk3mp01BVOLCwUaFwsENd9bsDLhUrFuA
         HEGdevYMR4b/t+hCTk8ZQzMKoYO80XM6ya3UO1yB8mFeAEAvE0MoSRScXLEm6BKlqRVy
         T2WLLT4QpakQcR1k+vEI/x4ZPe6KHY1u3Fa2hr9IrqFvH4i0fPD07iHE8nZyH/jOvwqb
         Y8FSVISujICRxEjAUHa/UjO6G0bg4LHFZ6rfksEDwJJVQRo2ZgcHKYr9tXtTd/pWqu78
         p7IFkWLJFmuJ8Ai81139iMDXG5Jnm6Y09IxoptEV5pL7T6/F1LBr9j3xy5hAfqS+SQah
         jrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916374; x=1783521174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/PMJfwXDmjutwz2ZqUdHqOQ1qGXDhEDRkGoA21ZDRuY=;
        b=aQNlAlwvR50eJEGTEf/qSgOXrL5L5ByvnBworzEQzVvXWPtTg+4bamxl1CTIKLx69D
         pkAHBScgeg+vp7ylqIacU711d7NloLtqDrcNuEmn1FR3P0cowmv28EA9odSJ3SXKr2ke
         fTf+K8cneItVI6eB/0kJdPF6j0W5PozXnd6Tg2SeahaO1epMDZoZUvV4Ra5EYeDYdW23
         dEHXFbqEFI7fSypVKUPfQTbOw/zubUN8qpV/EJPJ/lJki8NDon3Qn8i+c5Dn1q1IZK9v
         ZhBt+eLYPzg+6eIyczq0BZwMr+pFdmQTwCWvmo4UC6e3gV8In7gAmisFjBXWe/8OXElw
         HBtQ==
X-Forwarded-Encrypted: i=1; AHgh+RrtNfP011HrUvZc9KThMuJoRXB7cKBoTTGRzvbw35EE6Zb0ZKgP/2NYhxbgafr9HVqcc7r/pTe9wmdywo6wtzA6@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3E/I7t+h3X97AHfgVkxC9rtVXuFrEE0Vp6CpDhrl40tLPBQB8
	85Qq8XuzVyF4JPa7hfhH1Wcr6j0IRktwfc3OMcwEBlQtQ6oIBTVYyIZNXYPcInqbTzGTfTdnZoi
	ksoOWhc/onBWgbTX/ewixlMzi1V/OHUE=
X-Gm-Gg: AfdE7ck6amXzn9dHzkIluKQcItcJQ3puAg+x1MoScF/sgCrKooIeoqQXeMgH8NaZPTn
	JjvYUbpLdVQRkbEiHNww9rEi1p07M7tj+Kvq9mb5OBH0weAeDrYlo6ksD1SziL/QtFy/Tmxbm9C
	agWswlHRvYY8xEvgf7NQ0ecU63Q4hCAzH89rQTxch6IZAVZvTI4C9TQ1sA3QUGhuWH6XpSmlcMZ
	ETssTN7hUW1ftdgnYM9nxq78uj/y1rVSoOha6cm/SqXnjc/1Qot2fU8VZBUSeS0axEaVeadkrBp
	OFnJgU83CEtPS9VNXX3A8LEGBzy8UiMQQ5okD3m4EmY6gAZINa3+TnokuLqyXg==
X-Received: by 2002:a05:690e:bce:b0:660:a41d:d175 with SMTP id
 956f58d0204a3-66521b945c8mr1896345d50.55.1782916373989; Wed, 01 Jul 2026
 07:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
 <20260630-apple-mtp-keyboard-final-v1-8-506d936a1707@gmail.com> <05d39c4d-8405-4fe7-a798-c8a9c92699ed@cyberchaos.dev>
In-Reply-To: <05d39c4d-8405-4fe7-a798-c8a9c92699ed@cyberchaos.dev>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Thu, 2 Jul 2026 00:32:42 +1000
X-Gm-Features: AVVi8Cf357Gij5feihuaNZJkJ4WRqS0nufoZDV_3Bt4D6iI9pAVwxlHJbwtr7a8
Message-ID: <CANpmGNs3s2yLw05jkpZ9mscQNZ9JvfbqEgyW8V=cMD29aU8c2A@mail.gmail.com>
Subject: Re: [PATCH 08/10] HID: apple: Add DockChannel HID transport driver
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, iommu@lists.linux.dev, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_153257_250306_2E33892A 
X-CRM114-Status: GOOD (  23.95  )
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

Hi Yureka,

Thank you for the review and the feedback.

On Tue, Jun 30, 2026 at 11:21=E2=80=AFPM Yureka Lilian <yureka@cyberchaos.d=
ev> wrote:
[...]
> > +     strscpy(hid->uniq, dchid->serial, sizeof(hid->uniq));
> If the keyboard appeared before stm, dchip->serial might be uninitialized=
.
Yes, true, thank you for picking this up!
[...]
> > +     /*
> > +      * Prefer to enable STM first, since it provides device IDs. Some
> > +      * firmware versions do not expose STM, so let the keyboard start
> > +      * without it.
> > +      */
> > +     if (iface->dchid->id_ready || !strcmp(iface->name, "stm") ||
> > +         !strcmp(iface->name, "keyboard"))
>
> I specifically asked for a mechanism to let the keyboard probe even on
> devices which do not expose/have stm. Thanks for adding that!
> However, I think this might need some more sophisticated mechanism to
> decide whether the stm is still going to appear after the keyboard, or
> not at all. I'm not sure if there is a way to tell this at this point,
> or we need to add a timeout for the stm to appearing, which needs to
> expire before we create the other interfaces with fake serials.
>
I do not think there is a way to tell at this point, unfortunately.

I think the best way to resolve this would be to implement a delayed work
item that is scheduled during probe. If STM appears and initalises before
the timer (I'm not sure how long it should be right now, I will prototype a=
nd
experiment) we cancel the delayed work, get the real serial, and spin up
the keyboard. If the timeout expires without seeing the STM interface, we
assume the platform does not have one, mark id_ready as true, and
proceed to init the keyboard.

I will work on this and experiment to see if it's the best solution or
if there's
any others as well as to find the ideal timeout, and submit as part of v2.
[...]

Thanks again,
Michael

