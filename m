Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2FFE63F08
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Feb 2026 22:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JoXcfX7QZiwqawmcK7WDWbqjkD7o01Kl41BVrnneLZk=; b=sK/N6oIGPalghxuPVUFTvcHZFg
	hcEwrchNEuJZoiu5eJl3pSoDNO0ARqDVQtt4cTGPv8OVbUK+cupS8mHf8yX/WbFIJ7Lezc2nq/9DM
	NlbscmQdl3U1tHvNBa6q6HE67+SXzz99d6QgW4V+2Q588qW2oYGidlGLha2ahxqvi21eV5vDVEc/6
	ZzqTv04sjRaREyxlqpRdOVZmFVNIluOf1KwF8Aun+uxIxDEO5kkyn0drkemGLXgBQkORmx8nvlWKq
	KmpnfPvUeNbGtwEgqKLv9RNsnyGijqqPGvNLEdgH9Siq/Afg6inkWL6IimNYnZhBj0MH9sOoEf38k
	MZmsulMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrkUw-00000005iG6-0zEs;
	Sun, 15 Feb 2026 22:21:50 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrkUt-00000005iFB-0Jrg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Feb 2026 22:21:48 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7d4c543472fso1753012a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Feb 2026 14:21:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771194105; cv=none;
        d=google.com; s=arc-20240605;
        b=JBaeRm2cjIJKbfkzX5FEqJPtJHUrFmG2J0ZSH5gdK1sW3oWKM5lCDvg63jrLY7dW4s
         ViWNzB8WLzag5PHawbJQKCpZtNMlAXico72mXze4SBLAme55KbG9iUdxNnj8O61zNVuH
         s+FFJASf9qjwRwmhXkzMhPiNChTbHBpJwcriLi41Hc/YDLr+pa9brcnJ6i2mmTSXaB9g
         wje77eiLCvY2VEB6T1Iyim7RK7bKrE+72FHSsJHWMgbk3BoD4ltCN6DrMEHf/Hz4zV+U
         qr7SaZpal74Kf+7344urAXN3jYXja1E2sEh8KGF1V/uNOSXqMsh0WAbApkTcPAUuK6Mg
         BbqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JoXcfX7QZiwqawmcK7WDWbqjkD7o01Kl41BVrnneLZk=;
        fh=KcaRvrIg2z569eY9V8i0cELa0um6GVV93NAE5UCbpkw=;
        b=Lnrb4QaulKUp3uY0tSIqj8Jg78uCPzBKwzGml/nTNzVVD1OM0AXY6uhTbCMP+xZQrt
         uqi+4+JiwiHtoavSY9uuuWI13Apgz7nr6lmjko+DGGvSeXbHL4Z7Bu2Z0wT1fBFY686n
         +3h/8OkUEYkP5xaWnBUdD6pDlKxEwekcHFbiDWnxoB0c40f5TT6ubK7+fg3Q0QQGcZwS
         2kWa0mBK0uHddIv95kOlvjQDnF4Inrqaq9K0Ov2Zx2BJdDTTTHCFOcqoTqfzMo4zITg5
         2DUjRBlMW+6ibRqaW8ZTvZ9XdYaQFehGSYo+ckusC6u0Jms2E9JkcUsfkY0joGbRYwDn
         J8uA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771194105; x=1771798905; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JoXcfX7QZiwqawmcK7WDWbqjkD7o01Kl41BVrnneLZk=;
        b=DtmJl+tJDTKGGvGdHhk57GpUMngerXiyEG7ceH8yr3WHX0NY5nCVCoB5nyBg1/gJOS
         pFFQ47hbiwPwrr8CsRKTKp4nS6lCXMVbJyk31yr+q8DSPdHagCf/a+DM17ybpDXLOVfe
         WwTknrAeaUylqogpIn6yo8NUlgAFHpwKn3OT1gRA/LaeRzIwsCa1aLkGTEEuhZkBEi8J
         Qbt0LaGHpVsUq9rTjtyOltgdsY2BbL6Mj+0bWbGh5n8mk/GP8MyfVKzpZLwv2sdaCFmQ
         xPb6Pm/U5k4YCcTOGOX4u3j+wzpdQLMiqcnctDL04H8s60TjEzzEqWJ7PfFxCijbbf1l
         n92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771194105; x=1771798905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JoXcfX7QZiwqawmcK7WDWbqjkD7o01Kl41BVrnneLZk=;
        b=OqtEiG5Ok9ghSvYB1IH/68MNftVnnFtTKiYFpdKkTdroGbsqQctjUGqgcTB9Req1zG
         YBWZCY4ZPS6ung/qUnwpQy2pp3746g/L+E0Br0VWUQMPK+AKnlni5GNTA6TttIqVpB/q
         tPRnKNZL8f5aUivQIcj9y7LPR7blHncY5ItTDiqLAoF5cmTypP31XMqtpGA76NZ6iFbc
         yn3n2wmnXOI3bWBePp3QatNYdPkQN3Mh1l6oylYZFrLgnocxWnq31M8YcjBLtWJeNI3R
         l76kLkoPt197wlizFBcy63aZkDzDVivC0cTTu1s/601+Zjfb3cSdar6AyaKB9U5QNP+F
         4Rmg==
X-Forwarded-Encrypted: i=1; AJvYcCV3CALPEqfGB8U69QY0J84Bu1W1TNTeLUTPmsWZZLqnI+QqRpcBDU25LrinIsArtPK60eJZtSvrr+3NuvtF3Qy2@lists.infradead.org
X-Gm-Message-State: AOJu0YyCbQ/fVkm8OJFkKjdq2pgpseO7Naym9SLMWD0IvwN/PB6Q5OSc
	axVshUrCe8HibpmVJDT/KViKZGma2P7LgUScNs9nHuY5I0e08GThz7eAfZv2JW7VEIpJzlfhmxj
	mQpbhr63xL3HkyVA872HZatgL5N6L4+Y=
X-Gm-Gg: AZuq6aIxdKrfGkNEhgKEXW8cKARTsNMrFj2FGIGX7aezP4NBZSO7WNuSMwXYR6P6iiN
	Phti+iyyp5zMWVzyWCO8q7P8QZPv6ptJmMwUzENAfuG8PG76lTBa+NHrXCEl+A1pa3f+g1P/ODy
	tRwXVKhWK3DaQN8z15H25bVz2z7BaQOtW0AnEhElhXaQ1F9LKbUL4LuG7XM7JECvrNZ8KmaeEwZ
	FcXDUuLg1HR9j/sz2a46nJmiH/3UTksfMkVXbakxkmriCqKzjzxHlvRl6SkMJrE84r7snaymEMj
	iLbLjvq4hOX3iZAn
X-Received: by 2002:a05:6820:3090:b0:676:ad01:3c2a with SMTP id
 006d021491bc7-678220d7fd0mr4298684eaf.21.1771194105145; Sun, 15 Feb 2026
 14:21:45 -0800 (PST)
MIME-Version: 1.0
References: <20260215100302.136719-1-work@onurozkan.dev> <20260215100302.136719-2-work@onurozkan.dev>
In-Reply-To: <20260215100302.136719-2-work@onurozkan.dev>
From: Adam Ford <aford173@gmail.com>
Date: Sun, 15 Feb 2026 16:21:34 -0600
X-Gm-Features: AaiRm50FAT8RVr0tUWCN3V2Yh-fEe1_rpCxpthfdlSnrl4R1jpbzNo5n6ndNC5o
Message-ID: <CAHCN7xJJgLxPSf0QJ9nvY4Z3BguDmYJtpeprT+obD5DgA8rOgQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm/panthor: treat sram as mandatory except mt8196
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_142147_115417_899DE63A 
X-CRM114-Status: GOOD (  22.80  )
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

On Sun, Feb 15, 2026 at 4:04=E2=80=AFAM Onur =C3=96zkan <work@onurozkan.dev=
> wrote:
>
> If sram-supply is missing, Panthor falls back to a
> dummy regulator with a warning. This implicit behavior
> hides missing DT wiring behind regulator core fallback.
>
> Make SRAM handling explicit: require sram-supply for all
> Panthor compatibles except mt8196-mali where GPU supplies
> are intentionally managed outside Panthor and DT does not
> model sram-supply for that compatible.
>
> This keeps DT power modeling explicit and avoids relying on
> dummy-regulator fallback.
>
> Link: https://lore.kernel.org/all/20260213155937.6af75786@nimda/
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/=
panthor/panthor_devfreq.c
> index 2249b41ca4af..5f6075f18fe3 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> @@ -206,12 +206,17 @@ int panthor_devfreq_init(struct panthor_device *ptd=
ev)
>          * But without knowing if it's beneficial or not (in term of powe=
r
>          * consumption), or how much it slows down the suspend/resume ste=
ps,
>          * let's just keep regulators enabled for the device lifetime.
> +        *
> +        * Treat sram-supply as mandatory except for mt8196-mali. It mana=
ges
> +        * SRAM outside Panthor so this driver must not require direct co=
ntrol
> +        * over it.
>          */
> -       ret =3D devm_regulator_get_enable_optional(dev, "sram");
> -       if (ret && ret !=3D -ENODEV) {
> -               if (ret !=3D -EPROBE_DEFER)
> +       if (!of_device_is_compatible(dev->of_node, "mediatek,mt8196-mali"=
)) {

I wonder if a more generic device tree flag would be better here.
What happens if others do the same as Mediatek or Mediatek decides to
do this with more processors and this list grows?  It seems like a
panthor binding might be useful to prevent future bloat.  As of right
now, the 8196 isn't uptream,so it seems like adding this flag would be
harmless to everything else, and it woudl likely be required on mt8196


adam


> +               ret =3D devm_regulator_get_enable_optional(dev, "sram");
> +               if (ret) {
>                         DRM_DEV_ERROR(dev, "Couldn't retrieve/enable sram=
 supply\n");
> -               return ret;
> +                       return ret;
> +               }
>         }
>
>         opp =3D devfreq_recommended_opp(dev, &cur_freq, 0);
> --
> 2.51.2
>
>

