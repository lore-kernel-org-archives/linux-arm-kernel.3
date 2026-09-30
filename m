Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4504BCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 21:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BdHV7DMCXxsggz4//I4AlWe1QoSNzGSaCcBE0kpC5j4=; b=JrzZUJG9KZWzbjF0vIdxmYV/Ij
	UqktkBI5fvppQfgyj77jZC+43cLFpsMOuw9tSbXWpZ6SEyeu8WtwIW2H+4ci45SZ2wJN/1kcRWmtV
	fEj0nMuHUxQ0hWOQFg99GUYzK81aMO2rQdKwfHtlvQ/BaqwswdHlsEXm9t/Fk6EsI43bMyfUGIay5
	3grlzakX5DQrRlzB2Azq2wWmAL7GZQr0JuY5KpBTRkq0nvALYotGtdX6EV6OU1xeTyvAQEE4ubja/
	bcmNqpeoF6XTpu4DdlTe9+Odc7ur+6dChNeI6dWSzjd8wrV2ewvlAb1jw6r6ZXA5o3t4wom6sC/xH
	oYo/3j5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1PR-00000007Ddu-0fox;
	Wed, 30 Sep 2026 21:00:13 +0000
Received: from mail-wr2-x08.google.com ([2a00:1450:4864:30::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1PO-00000007DcP-2x5B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 21:00:11 +0000
Received: by mail-wr2-x08.google.com with SMTP id ffacd0b85a97d-48b05d75172so135594f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 14:00:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790802008; cv=none;
        d=google.com; s=arc-20260327;
        b=sb2IJZfZa4xWIZDCQ+i2A1ynm5pbinASdmEatsp3vzvjA8RvZTpRvK5r4lIxai6hqM
         h9v6hfy4TOMhiwFmwDbVY20Y2nFc7O7HYbXMYLJw3DKyp08wB+9jWmp1aWLVXx+HXV/H
         eefmESaoezbyStEJNbpfimsNGaAJ3GPVPlr7k0TpBZmJlEFRIdZfB8aRs1fnwuPZlv93
         5fTzIosj+TsuVt0Xvba9OSnWdbvMC0JRt8G3eOixKyPQQi1LodQE+6T65ApR2693IJqd
         Nb4740lnmo61ieNCXzYBt6QyYvg1UO8KYAsG8TdqWBV/XRxLDulrand3YLgATE/MtxKB
         d92Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BdHV7DMCXxsggz4//I4AlWe1QoSNzGSaCcBE0kpC5j4=;
        fh=TCSjYAmbHayY3TxsU/sqhtQZq3CWxWWZrcX6ZXfZ0k4=;
        b=KElF8L7blrn3XmVV3OgmAOWhpuxLCU2Bj9SYOznkSOS5YNzUdvTRH6UdeJeF4SLIjB
         QSxwgixSVwjpfvpI/tDrsNzEfr06113VMpeh8BDvoNPW1Q871sFuKwslWYRH+MJ4qU67
         EcpVB+qS7BwF8ipI1YXIacO2c6OHxsguH9LVpLpowc3567leyGFqWW0dYAtI6j0ZmyBZ
         6ys5qGP/1hYlA9aN1QDflDkj7TwC7E4G+42aCv/6iPirGIlHCwdK6SaDPutvJSGWp+7u
         qqMTGmnBDyv8MuKLngs3Uvs5P4Ap1EDe8wab9Tt6Ak45IRQPXV4zZ5AGacQ5zyp0WxeE
         +JcA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790802008; x=1791406808; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BdHV7DMCXxsggz4//I4AlWe1QoSNzGSaCcBE0kpC5j4=;
        b=KTkUwybbsRj5LA7D2FVPfCXGTUz1hN6YENb9NsqR03z5BR/mXwFHeAm6xPS/HKb8v+
         aAwA76v2WoUmDOGyluMRLhnQb5Bcc3eAiqilI+wCvFXppUSzdxa5flKWjT+JRrGcEHe+
         p2t2sPOM7ezyN6rohMembPM2KuJ2mvItPTQ2zXnjuu1WIJ3ysQ/vJgWSQRESTF7OSwMB
         6hx42CdJeaHKzELhrRB5DuCmChPuFG9sMbaDTDxUTBoR9JDTMCbF6FtBYJQ0hb0Zdw4b
         Yy8LLNnkECle1kKRZET4nogiuHQDLK1qVBKSFdkQZaLHOCaH9CRsil/v2XGBAAQdsLPl
         GMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790802008; x=1791406808;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BdHV7DMCXxsggz4//I4AlWe1QoSNzGSaCcBE0kpC5j4=;
        b=cMSrwjmFUpWrVswpBQco5JiwKNQrXn4q9y3JFp2/ts8o6OpANUkBuYwTUnOp+jWcdo
         XWqACdiv4OROuChB9xwKSUGG41f94LtYIhae8zrFQOejHP75KzDsSrY3RqJR3YRJvcTR
         xlG/vBolunlzDGBEvvV0OmTp+Z1BQLSm+PaXtbbSgFbxcC81ccg2AKf/A8h0hQDqHVzD
         LJIy76kUUlnh+5KSQ7PT1T/REHl3W0TrWRhsh0DFjAFbZO2qspU4p0Xp8ksqBdnXpZ9K
         rMcc9ezpSuugfKnHWD/4kkWj1YrS4ixAAZVFv9NHHjmyZg20ImV8oQqXFdRfKaWxL3GK
         2jlg==
X-Forwarded-Encrypted: i=1; AKwUvBxil7V20Wy32C2hygvu1es8CQShz0AaCewJPuVXinGEeUt3D4yenBvZSc0nsQB2AvNIf4TrpmbL8YtjRammvW84@lists.infradead.org
X-Gm-Message-State: AFq9FYI+ti0zXQkjmKGFsti7JNQfVQbJI9XhYqqoNhO3lHE/zl5hd6R0
	QO4/J4KYJXs+gKqKUEYP8ASOX416WOvAfO9M/vrV3Ea3f09O8mX5di0+pKGsvaF9p05K3hAjNs8
	yLX5P5MBYeHbcxAorzSf78FGPquvllTY=
X-Gm-Gg: AYBFou1wnaL/ZOlfwOWEYkhViGge32kye4fvxSzeoSRZrlb7ZW9+hiwYF3F4tJp9bih
	gNfnwgqP2vON5iPNluUEiGylBWh/FITLwYTUvtzFyaIz5x/n2KTLKu/RamXKW5r+GTHmKC6op0V
	5b2D6HuC6hd4kuEN3YFopblHs6dbbkipCkjdIiWtJ1xoUC/rOdAvrQi7JArCLE7ukwcbKPlIyfw
	ofenTkJxhLxrt9Qoh/pxy8BBrAEZKWA1tWeToJLn/oaY2jcphSgSTpRaQM12SOKg8e7ZDlOMLjY
	p/TApf8zfHG70+0L/42Q1ruvvXGmfgbdeI0T9nkFQRGTB01PiFzWiilP2TXt31VYn6+VNcuubvG
	jHA+kuAKf8+g3LKsr2X80iTRy03Cj2Hw88JPF1i8QKyQ6vpZbX2veYJLIJEcLdapwLOPK6Pr4KA
	TqGI8IYy/lfg5sJr6YVA==
X-Received: by 2002:a05:6000:2dc6:b0:48b:68:594a with SMTP id
 ffacd0b85a97d-48b024c5716mr5289021f8f.12.1790802008034; Wed, 30 Sep 2026
 14:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
 <6b80cb97-6706-412a-b013-9423f6f75153@linaro.org> <arqhwHiVf00j94J7@beelink>
 <0259fe4b-3118-4ab0-9b62-55101bfd7f33@linaro.org> <arrAqg5n87INTHE6@beelink>
 <674314b4-6b80-4b3a-ac15-eefd31cea607@linaro.org> <artpBMeM13Dd0lLy@houat> <fb7ed8ab-8aea-4731-a5e5-c9476d8bfd38@linaro.org>
In-Reply-To: <fb7ed8ab-8aea-4731-a5e5-c9476d8bfd38@linaro.org>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Wed, 30 Sep 2026 22:59:30 +0200
X-Gm-Features: AclHuK-U6pulImpn0m_SQCkcJ5kAgToTplTEZZASDrUoYoF9BUdVXxkuuMMc3Rg
Message-ID: <CAP01T772Vgc4=ShFHQ5bFBAF0PYuQ07xe3h+biT7LST-tahHhg@mail.gmail.com>
Subject: Re: [PATCH 0/6] drm/bridge: Add a BPF-based MIPI-DSI panel driver
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Albert Esteve <aesteve@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	llvm@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_140010_811188_8F4266B5 
X-CRM114-Status: GOOD (  49.54  )
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

On Wed, 30 Sept 2026 at 15:57, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> [...]
> >>>
> >>> Changing the mindset is the hardest part of it. But once you are making
> >>> the shift, it's actually much better to work with. It doesn't mean you
> >>> can go yolo. You still need to be careful in your choices knowing the
> >>> impact on your users. But the API at version 0 is not frozen and you
> >>> don't need to maintain it forever, especially if you control the loader
> >>> and the headers used to compile the BPFs.
> >>
> >> It's really impressive, but there's no way this would become the de-facto
> >> way to program the panels
> >
> > Nobody said it would? And like I said in my previous mail, I actually
> > expect us to keep merging panel drivers. Do I think it should become the
> > go-to solution for simple panels? yes. But we can always make
> > exceptions, and for more complex panels we should totally do a more
> > complex driver. Like HID has been doing.
> >
> >> and if the motivation is to make it simpler this implementation
> >> requires adding bindings and bpf programs which that are the same as
> >> native panel drivers, but won't be able to work until user-space
> >> starts and will require to be in initramfs or rootfs to have
> >> functional display.
> >>
> >> Not sure to understand what are the positive features here except
> >> isolating the panel code in a safe bpf program (is this really needed
> >> ?).
> >
> >  From the cover letter:
> >
> > """
> > Panels in general, and MIPI-DSI panels in particular, are pretty
> > difficult to support and require pretty much a panel driver for each
> > panel produced. Most of them are pretty simple, and require an opaque
> > initialization sequence that is usually poorly documented.
> >
> > This creates a tension between OEMs and distros because OEMs will
> > typically get a new panel to react to a sourcing issue during
> > production, and thus need some swift turnaround between getting their
> > new panel and it being operational in the OS. Distributions on the other
> > hand can take years to ship a kernel with that new panel driver.
> >
> > To solve this, I followed the example of HID-BPF and wrote a panel
> > driver that will rely on BPF programs to perform the panel
> > initialization. That way, we can ship the programs separately from the
> > kernel, and with a different lifecycle.
> > """
> >
> > You can disagree with the solution, that's fair, we can also discuss on
> > how to solve this problem, but I'd appreciate it if you weren't claiming
> > it's all useless.
>
> I did read the cover-letter and I got the arguments from Benjamin, and
> while in theory it could indeed solve the issue described, in reality
> it won't for the reasons I exposed.
>
> And since it's basically allowing to accept out-of-tree downstream
> driver instead of upstreaming, I'm kind against TBH.
>
> But I'm open to discussion, and I'll talk about display Panel in
> XDC today, Plumbers and ELC next week so I hope we'll find time to
> discuss about this in person!
>

Hi Neil, Maxime, Benjamin, and others,

I've been following the patch set over the past couple of days, mostly
out of curiosity. You folks understand the details of your subsystem
best, therefore I trust you with that, but I've seen a lot of
misunderstandings which feed into unjustified worries about how some
of this will work.

For clarity, as several people have already pointed out:
1) BPF programs ship with complete bytecode and line information from
the source, so I don't think the concern about the program being a
binary blob is justified in any sense. The verifier has to verify it
after all, before it gets loaded into the kernel. They also must be
licensed as GPL to have access to any kernel functionality.
2) Adding BPF interfaces does not lock the kernel side ABI into a
perpetual stability contract. There have been several thriving
communities (sched_ext, HID-BPF) which have used BPF successfully in
practice and have never had to make suboptimal technical choices
because they support BPF-based customization. The interfaces have
changed and in some cases completely rewritten without breaking users.
Of course, you might decide to be less or more graceful w.r.t.
backwards compatibility, but this is a choice left in the hands of
subsystem maintainers.
3) On top of all this, there are several mechanisms in BPF programs to
detect availability of APIs and adapt it during load to allow programs
to work across kernel versions, both for functions the program can
call and data it can access.

As far as people being able to carry downstream changes, I think, at
this point, that is already trivial with or without BPF (esp. with
LLMs), the only thing you change is how easy it is for users to avoid
being tied to kernel release cycles.

With the right incentives people will end up sharing their BPF
programs with the rest of the community. sched_ext and HID-BPF are two
strong examples of this. All programs get developed in the open with
community involvement, even when several companies make use of them
internally for their production use cases. The theoretical worries are
fine, but as far as practical evidence goes it has worked out
positively for everyone involved (not once, but twice).

The only valid concern I saw was the dependency on user space to load
these programs. We have had a bpf_preload mechanism in the tree since
forever, it has not found much traction since existing use cases
didn't often need the ability to load programs early. We'd be happy to
explore how it could be adjusted, or reworked to better support
whatever requirements emerge from this work.

In any case, I am not equipped to decide what is best for your
subsystem, but at least from the BPF side, I saw several
misconceptions which I hope the above can address.

Thanks

> Neil
>
> >
> > Maxime
>
>

