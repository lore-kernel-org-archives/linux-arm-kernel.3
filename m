Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A57FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 17:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lhKfBgVLzd53/xf8WYhlbf471gUVHM73ZZMecnUo5fI=; b=AHlJKOKTok0Kmd
	WmOHcLnGJ3Aeh0CeLx0ujDrZxBBQhOUabtUym5rTKa6B2qSy1aM8DCSUjTwg82N5ak/XUrJwQ+j8V
	78udnxJrrsj7fJnv54P38qdWs8geAYZAYLQnt4aZRgViTRXXf/ziaPNlN69yCfR3fD7skXl2qtfZb
	N1xFHUsCx4lDRRKH+tZWYw4kWkODuFLXpoNY/1bc1c5i7eBky/oggJYjz7lsBU0l8sr5bGLU5CBaN
	Z7qlGivTrl+AtdS+RZXK7C/MjQuB5zMiRfO4EXRyRPm8+JJy+jAbadxT41ogpRFYnLnF7ntpam9rL
	pyM90DGHHBjZ5TB02mEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPmi-00000008b7x-0d5r;
	Sun, 22 Dec 2024 17:30:32 +0000
Received: from mail-io1-f45.google.com ([209.85.166.45])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPbD-00000008Zg5-2PC4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:18:40 +0000
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-844e161a8b4so105506039f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:18:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887915; x=1735492715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lhKfBgVLzd53/xf8WYhlbf471gUVHM73ZZMecnUo5fI=;
        b=ovy0sp22nFt/5QalGEwQmdqSAFTUTXvSUZz3lfSh+c7fFF0zef+/7c6RS9x+uHlPU0
         flZhYQ5BT5EFf7Ix0EOoq130fa6k6zGByZgdTSadpr1pD8oEyrSf4SKKtuP7ZaBvWtjo
         GsLNI+Bt8MRYX21UsUxbyK+TwA8VPABjXrMjy8jwn8cKFpbqYk4/t/cjy9/Ao37rPQm5
         Sa1RGSgmpoITZuFvqrlAJUq4n1eSr+dJMHcyqQNJjUNEecAqXWyhGeJj9RLNvho6iYAT
         1h6HxtZ8rYXA2ayOJeyf1yhqh/0cyifccw/RoU6/DIw0k9NB5kH1mAGFR844F8OKdxjX
         cy4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6UUxuMpo95S9Q2kocR3VSlbfP0qRJcI+ZtLWzNRtTFaSn03UyzspakxWag+Hff2IMJLN0h3Kw7gEOEfUmN0wX@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1/aUbFy4r8GVvtGEnD7Qs2uEgE/Eo0nWG5KZww8pM6XGvqKX8
	DXrtmDZdBZBxJBB0LtjZXCmYRGlFS2vP7/ZMG6VUQAk6V2vDPCqJxB+pb/dfkao=
X-Gm-Gg: ASbGncsDy5uZbAoCrG+hAp42Ptc6GcHckhW9UGEi80KCRzdu501kVFEqxqqS06fePCx
	qJIwej6Vrq59WZvtUCV4ByHTZZjkdZ5yhQC1HXKEAf+bZgkotGPU16tWiaNq7X5Gs1sAGDtEtUo
	ZhulhsFXtMu72DGnXi8vk9IPUnmCWZ2dzdCWW18w0bekbZGyOwcEylqRqK1stW9MqXsbvsnb2CL
	2rpYu8f0YLmUUraeoE7V3EtjdUJrtIHA4pyhrREMmBgxaf0J58bsSh/rcskp6dzyqk299w7OEx1
	a43rx6OE/TRDUA==
X-Google-Smtp-Source: AGHT+IGJO4A27HsetD51KVU/F0ZoBLaFjm0+mqW1sMhBcHi17nAP3WhvBCShfpZsj5xAPvZ5/lrEkQ==
X-Received: by 2002:a05:6e02:1d0c:b0:3ab:a274:d73 with SMTP id e9e14a558f8ab-3c2d2276f0bmr70572505ab.7.1734887914879;
        Sun, 22 Dec 2024 09:18:34 -0800 (PST)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com. [209.85.166.182])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e68bf66f52sm1793757173.34.2024.12.22.09.18.34
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Dec 2024 09:18:34 -0800 (PST)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3a8f1c97ef1so11081475ab.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:18:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVrnHQlWcd73/g1cN60t6SpMdFCXO50Jgli1IJtvn8QGI/L/bLkCOFG7NM+1MrzMr4bfpOTFqJD6licIpBuhbzI@lists.infradead.org
X-Received: by 2002:a92:c56e:0:b0:3a7:1dcb:d44b with SMTP id
 e9e14a558f8ab-3c2d2975b28mr69446075ab.11.1734887914006; Sun, 22 Dec 2024
 09:18:34 -0800 (PST)
MIME-Version: 1.0
References: <20241213195433.GA1568@lemon.iwr.uni-heidelberg.de>
 <20241214011612.4fd9e4bf@minigeek.lan> <e61c927a4dfe909f4ede4a07dffd9dcd762875be.camel@icenowy.me>
 <20241220172134.GA9899@lemon.iwr.uni-heidelberg.de>
In-Reply-To: <20241220172134.GA9899@lemon.iwr.uni-heidelberg.de>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 23 Dec 2024 01:18:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v64ovacuS+G+k3zBvQR+rW2_TSYh4p5frj7fLxz81K9Kmg@mail.gmail.com>
Message-ID: <CAGb2v64ovacuS+G+k3zBvQR+rW2_TSYh4p5frj7fLxz81K9Kmg@mail.gmail.com>
Subject: Re: Re: [PATCH v2] ARM: dts: sun8i-r40: remove unused GPIO regulator
To: Hermann Lauer <Hermann.Lauer@iwr.uni-heidelberg.de>
Cc: Icenowy Zheng <uwu@icenowy.me>, Andre Przywara <andre.przywara@arm.com>, 
	Hermann.Lauer@uni-heidelberg.de, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_091839_614072_DAA177E9 
X-CRM114-Status: GOOD (  23.13  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Dec 21, 2024 at 1:21=E2=80=AFAM Hermann Lauer
<Hermann.Lauer@iwr.uni-heidelberg.de> wrote:
>
> Hi,
>
> On Sat, Dec 14, 2024 at 03:13:23PM +0800, Icenowy Zheng wrote:
> > > CC:ing Icenowy, who added the regulator originally, with commit
> > > 0ca12c1ee43c ("ARM: sun8i: r40: add 5V regulator for Banana Pi M2
> > > Ultra").
> ...
> > > Icenowy: can you clarify what "newer" version this was referring to
> > > in
> > > that commit message? That commit in itself doesn't seem to do
> > > anything,
> > > as the regulator isn't referenced, and it's not always-on. It's only
> > > later when the USB nodes were added that it got used?
> > > So was PH23 really necessary? As Hermann reports, setting PH23 on a
> > > v1.1
> > > makes it reboot.
>
> diagnosed that futher now: PH23 is indeed powering the USB-Ports. Whats
> happens ist that I powered the board through the micro USB port which tur=
ned
> out to be limited to 900mA in axp221s. So the setting of reg 0x30 is
> the real culprit: Setting the two lowest bits in this register allows
> unlimited power over micro usb.
>
> In U-Boot:
>  i2c dev 0
>  i2c mw 34 30 63
>
> Or power the board through the barrel connector.
>
> In all cases the kernel turns on USB-A power and boots.
>
> > I am not sure, the schematics I have here (which says V1.0) have PH23
> > as NC... Well, the M2 Berry schematics have PH23 as 5V EN, maybe I
> > messed up M2U and M2B when developing?
>
> While V1.0 didn't need the PH23 setup due to nc, V1.1 needs it. Maybe V1.=
1
> was already on the horizon...

It seems this patch isn't needed then?


ChenYu

> Thanks for the insights and your support, guys.
>
> With seasons greetings
>   Hermann

