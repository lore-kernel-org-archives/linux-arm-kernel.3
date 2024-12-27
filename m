Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F2AE7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 15:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L0eDlOw9p3DnVtbNe3F5E+YgQxPXK7eYD6omdeJR05k=; b=LXi9Dl3+9Q61N4
	hDe59w+cY/dBNRqom9bAHg+/yUzZMXvdsCkaFr7spOfxm4UQUxpDbDAvjUEyOJcdIrsGY/1+usUCF
	CYtpPsv2jbyYqvt7RDARUgPavX1jbEnixvbomanTK4M5hKNIcIgOAEnSTfbZGgmnMq9q0+X3pmXuH
	begYzkacx57nS9fzqttdebJeUghrNJR/BYpR5s/R78IEofKFZSR1XfXBsZ4WAx//RbeUwa/voSyD9
	aY5FHccUkdUqWq0EXsoZnFmRbl7SJ2FomwuWqnMF4Ah0B99cl1+sLixAkg3zDu5ckYelbqfU/UkkA
	TO7mda9SoQ7LEmRlX3Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRC7l-00000000Vu5-0Avb;
	Fri, 27 Dec 2024 15:19:37 +0000
Received: from mail-lf1-f46.google.com ([209.85.167.46])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRC6b-00000000Vea-0fEZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 15:18:26 +0000
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54020b0dcd2so8960661e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 07:18:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735312702; x=1735917502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L0eDlOw9p3DnVtbNe3F5E+YgQxPXK7eYD6omdeJR05k=;
        b=bCVqIWhybsrB5/3J5soOHzG8zudoKsK6q1leh+Viq2FvYWisrQYuQId5XdTEc/BKZs
         ZoAsxTL/ErA8MA6Bq/8wLPT9EARs+m/CEv0QkiRvSYL5VU+W87+n6Lko20mHBy62yWcU
         ZPD5YBotSqcdNtBO/QHx49rkjmZQS7C79resyl9EsuHcZ4pOYlI6SjuGUOcnIixBJpJR
         GR4qDP0SBDNCrSC6mIz/K235OSCuMMAbVw5Nbu8wG1j2e2yVcYJy+wCWfLRbRCr+nw00
         icc0HBaD0HCDw0NlXXQEal+X0oC4q+cPkd+C2usud0scTy/qiTBHFJe2iXgSjz1x15m9
         liFw==
X-Forwarded-Encrypted: i=1; AJvYcCUFkf5bth+3h9V9IJUf358YvxHrPURxhMkWYMwzDX+rGoJUAeEdGeR/INXj+RWGPqJFMPzutDoaCFJuNpIcdK59@lists.infradead.org
X-Gm-Message-State: AOJu0YyAO5EtcXxdCqIYRb+WxtombdIvnMSLvOGDFE5dvdF1ouXMkAim
	fXf9S1/61QMPuKstCKPCJzvBMDGYRuUkjq88zIPLLyWZ7DMk3FxKS8nvNrTn
X-Gm-Gg: ASbGncv1VE97FC/n3zHMe8aJHiytEbTwEzwSQ8D/Sw/t+VrDVKOgQEt+NihWkpsp7O0
	O+PVpfWBd0g9VBcQgvO0Evz8LaRlk62M1KDREdUixK/cDadz1iiqGa8lD69ybGTrAiGyhTLHg26
	GAM34z4AZkKuRx/krh42m8BygXDcHgZQCKFW6T/OVENEKBFW/UbXjrPiCyozzu5QRoVrum8CVG/
	QHqyE5Qm7Hs3TnbueVVN8RGxNKLgF/RIQIun3S3GI5HFjuKmdq3BStmbADQlKs9WOr06h17aFUA
	oveC2ADvQkvqOw==
X-Google-Smtp-Source: AGHT+IG31PKemB6gFi9Y5yZlEY9ntnanDwCGBOnqhM689UT1ot0kAE6B2NWXAL1ZRIwGle2FG0W13g==
X-Received: by 2002:a05:6512:1247:b0:540:3550:b0ef with SMTP id 2adb3069b0e04-54229443501mr8450602e87.11.1735312701692;
        Fri, 27 Dec 2024 07:18:21 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235fecb7sm2400118e87.64.2024.12.27.07.18.20
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Dec 2024 07:18:20 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30225b2586cso90272151fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 07:18:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXrWFqkwFPY97AE6cQRPKFGo+5Ym5Tzf4Xg/GkDA30dDetL2+cbzlgS6BY3S8uJ6UKIR1no3yc0KZGV8kSVCjKH@lists.infradead.org
X-Received: by 2002:a2e:a591:0:b0:302:1fce:393d with SMTP id
 38308e7fff4ca-3045833692cmr107500831fa.2.1735312700069; Fri, 27 Dec 2024
 07:18:20 -0800 (PST)
MIME-Version: 1.0
References: <20241109003739.3440904-1-masterr3c0rd@epochal.quest>
 <173124139852.3585539.10704015898700065278.b4-ty@csie.org> <9415ca9c-f303-4507-8cd6-cb08ee09e988@linumiz.com>
In-Reply-To: <9415ca9c-f303-4507-8cd6-cb08ee09e988@linumiz.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 27 Dec 2024 23:18:06 +0800
X-Gmail-Original-Message-ID: <CAGb2v650sctP83mdoYtcws2zVzJzfBqq=AvAXYH-WaOoPBDx2Q@mail.gmail.com>
Message-ID: <CAGb2v650sctP83mdoYtcws2zVzJzfBqq=AvAXYH-WaOoPBDx2Q@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: a100: enable MMC clock reparenting
To: Parthiban <parthiban@linumiz.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Yangtao Li <frank@allwinnertech.com>, Maxime Ripard <mripard@kernel.org>, 
	Rob Herring <robh@kernel.org>, Cody Eksal <masterr3c0rd@epochal.quest>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_071825_198300_98C2DE11 
X-CRM114-Status: GOOD (  16.61  )
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

On Fri, Dec 27, 2024 at 4:45=E2=80=AFPM Parthiban <parthiban@linumiz.com> w=
rote:
>
> On 11/10/24 5:53 PM, Chen-Yu Tsai wrote:
> > On Fri, 08 Nov 2024 20:37:37 -0400, Cody Eksal wrote:
> >> While testing the MMC nodes proposed in [1], it was noted that mmc0/1
> >> would fail to initialize, with "mmc: fatal err update clk timeout" in
> >> the kernel logs. A closer look at the clock definitions showed that th=
e MMC
> >> MPs had the "CLK_SET_RATE_NO_REPARENT" flag set. No reason was given f=
or
> >> adding this flag in the first place, and its original purpose is unkno=
wn,
> >> but it doesn't seem to make sense and results in severe limitations to=
 MMC
> >> speeds. Thus, remove this flag from the 3 MMC MPs.
> >>
> >> [...]
> >
> > Applied to clk-for-6.13 in git@github.com:linux-sunxi/linux-sunxi.git, =
thanks!
> >
> > [1/1] clk: sunxi-ng: a100: enable MMC clock reparenting
> >       commit: 3fd8177f0015c32fdb0af0feab0bcf344aa74832
> This commit is missing in 6.13-rc4. Will it be merged in the next rcX?

It looks like I tagged the wrong commit when I sent the pull request.

I'll try to send a PR for it as a fix.

ChenYu

