Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30B6C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 07:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDSu5/EVHFrCNsSIo9MPis9K1+uBYhIFfq4Okm82ftE=; b=2jkVmg+LzdxnzalViFH68sG4fW
	Imh+vCvxKYWX7JPKQBcoKFu2Epc61hqgVx2+f0eDBCXVsw+CAPoQGUQTAJstrtYAq9gsHvw/8scN3
	JQbHgGVI6geIFjoLT0k5Jpi0g0s5yaKSWjOPEWn/Zg1m5uYgS/6jllShoKEVtysh3BfRZe/bApvOY
	OzrAvb6AXQE32BzYJ24jfyxXhKjwMP86BSya+GpUavgFMpYG5to3WMur7IOlTtF1zg3RiUoIiwXoT
	o8YfGMDFGFrKMx32bzkRm3Ay0hV7oab+CMjikLtt5Y+6fTxhiEfjiWQof0kyuvl12DIET7JUyyFox
	rO+t07MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3s4s-0000000GutN-0oYd;
	Sun, 13 Apr 2025 07:48:30 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3s2b-0000000GujR-3EH4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 07:46:11 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6e8fb83e137so25653206d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Apr 2025 00:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744530368; x=1745135168; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDSu5/EVHFrCNsSIo9MPis9K1+uBYhIFfq4Okm82ftE=;
        b=ZHl/Jgr1fkg4CevWi4tlgBtHjmJUdVvDGFc7jW1wy8QDedVRoNw5XIvx814ZV5/Y1i
         ivWLaOmBYL6Oh8KaybhjE9XvVM83wAEhWc/Wgzjq/VuAVIBEJPjSH8uxY7labmanSX/g
         XqS5Vf0kQ9cNnkqwPyRZGfPYyCuhLI0hNSTCZPQV9toZKEDo2bcDkf6UKaM0anCmvDKu
         G0vhtIX+hHWVPZu16hbG4rtP53VRKZ0aMSYbYW5P5id3codq8hSfrSSncp4Ts2ctoOOH
         fTLVeRWMfJM9jAcFW0tNCSu5hoz49/oITVQsD1IaNDjKeRnkQvRIBoBVYWFSkuhyK+My
         SWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744530368; x=1745135168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDSu5/EVHFrCNsSIo9MPis9K1+uBYhIFfq4Okm82ftE=;
        b=mtNvQjVJmp4t8PDJiIySUqppzz4WmP0WycMG2MZSQLZPppVqwl7Skwx4gvJKYtXsKd
         hMbvufV6R3ECarD6fZdZuX1vWDf9zL2T6Govxx/xs5fwa1L+mN/ytzJqQmxqTpC0zlGr
         z0ewE8jmDmCF1InZEcteeJpcp9yuDLP5pk3SLKZnTfJZTAsiopVE5mqV6hktjbFJODN7
         Iq4Fs83wm7tFl//M/Wuyd9wl6s4/vgC9R3adYzI8zrCJKCnAgB7pnWRdWqDY3mSewolF
         1QanOtOMirsgeB+60Po2xN9dQ1h6Tp5pkA8riID3D6xBRYV7I+8y4IqjQexdbS9PHvaH
         9tUA==
X-Forwarded-Encrypted: i=1; AJvYcCXXv9VG0pkzUPys3P4n/HculfwES/tBOZ0CekNUteqCSn7zrjGPXfYepseLOy9ZbU86bVj29GB4xSx6dPDwjvj+@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp2VzEGhheKTTIbmg0KwX5iJGxXn7S/pOCijsr1F/fa2AdQTVp
	QhpYbynI5Y485Ci6HmRUaRSUwZtok80fRWmyjhml4M1lrndsKW6KbFbWpoOs1zSY0SejoWiaIH1
	YcIK32oeE0WjKdtzBw/YN5xMd4lk=
X-Gm-Gg: ASbGncu/m1QYoWrsUenHfzyWGD+lYWYEecGm50iHUDafmxGNfGdDpaSBIV1aRgqGrdk
	gJk4r8VJ0inn7vWPRmJYt3nKZMlTaN479zwj057XJxuVjNlEVXnZENkEOw15VIvS/j70tZ4dXMy
	FEyBUpzxtUt/gGmX1R2lq4CpXF+TDK4Z5vkZ/diKG4SjT6dLcw
X-Google-Smtp-Source: AGHT+IE2ltyuOxfGOryXdaLo+W43seZVcMMz3+9+li7smTXP3KjLa9lJvabIEPh7RW1u+VRnSNyF0yWPYUQYYsnOyvY=
X-Received: by 2002:a05:6214:496:b0:6ea:d604:9e59 with SMTP id
 6a1803df08f44-6f230caf43fmr148715986d6.9.1744530367915; Sun, 13 Apr 2025
 00:46:07 -0700 (PDT)
MIME-Version: 1.0
References: <3727de04-7993-4b81-80c0-adb40b847307@web.de> <20250409133610.59d42bec@donnerap.manchester.arm.com>
 <e10ecbe1-d8c3-444d-92cb-647a1c54675f@web.de>
In-Reply-To: <e10ecbe1-d8c3-444d-92cb-647a1c54675f@web.de>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Sun, 13 Apr 2025 17:45:56 +1000
X-Gm-Features: ATxdqUGCfzpcdhEUWjj5b9x98mojrheGEprGdWhLMUFri6RCu-8lKdWby7ULwLo
Message-ID: <CAGRGNgUV6Dq6ZR9bcgomzj1PMQj4vLq9qJCy0dxVd0vQoPWYXA@mail.gmail.com>
Subject: Re: crypto: sun8i-ce-hash - Refine exception handling in sun8i_ce_hash_run()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Andre Przywara <andre.przywara@arm.com>, Ovidiu Panait <ovidiu.panait.oss@gmail.com>, 
	linux-sunxi@lists.linux.dev, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, 
	Corentin Labbe <clabbe.montjoie@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, LKML <linux-kernel@vger.kernel.org>, 
	Julia Lawall <julia.lawall@inria.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_004609_807734_E874911E 
X-CRM114-Status: GOOD (  13.43  )
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

Hi Markus,

On Wed, Apr 9, 2025 at 10:47=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> >> Two if branches contained duplicate source code.
> >> Thus avoid the specification of repeated error code assignments by usi=
ng
> >> additional labels instead.
> =E2=80=A6
> > Now there is one rather opaque label it goes to, so a reader doesn't se=
e
> > the error code immediately. And it really just saves one line per case
> > here. =E2=80=A6
> I imagine that such a code refinement can occasionally matter.

Just because you imagine that such a code refinement might matter,
doesn't mean it's actually useful.

1. this is making the code significantly less readable to save 1 line.
2. gotos into control blocks are weird at best and problematic and
confusing at worst. There's a reason why nobody writes code like this.
3. this sort of tail merging is something a compiler would apply
automatically when optimising for size and it can do a much better job
of this than you can.

I note that you said you did this using the Coccinelle software. Is
the semantic patch something you're trying to get upstream at part of
coccicheck? If so, could you please get that semantic patch merged
before posting these patches?

Thanks,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/

