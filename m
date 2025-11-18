Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98476CED624
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 12:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m9Ag0XwVcJ/i2TFhn9hX//x3aSHh7Km+I2yQlj3xFy0=; b=IfR2KwiPj+FncZI6iCv1aorANy
	8PMpjL+kEUfQELIZirw5q0ZqOph7aR4sElVM20s9/coIr8+A5xGEpmVgCYtY6Cfj1qcykFTZNv6Wu
	jf14kBrfvVYwFty5jatFKPcIWqUE2w6UQHEjAbe6Tlbb/apBrW/BmeTBm5R3eA/I2cktF3lsnB1q+
	eQBwBkZY8U4NT//WkgXKz86iMan1uC4Bg9B7Nvs6Obe7vSkdZMGlDSc4Qa4HYtVijjhZfJ6Hl51a2
	5VCAtKDKKodt4ThiDImvQYumS8hFdAXjJ3PmMMo3Yf3kCRQQi2O9tfShS7ZUTBbzwQgUk2GWxBtEV
	UAYq616Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKrl-00000000QMe-3ix0;
	Tue, 18 Nov 2025 12:31:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKrk-00000000QMP-1JuD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 12:31:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2EFE9601AA
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 12:31:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B3DC19425
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 12:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763469082;
	bh=m9Ag0XwVcJ/i2TFhn9hX//x3aSHh7Km+I2yQlj3xFy0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eKUSGF9sEwGdNyHbnmH2ofCDD/ZK8dIfn8RY0IyqXljGFe179G4lGMGZ8wM0lBbye
	 qipa0QBnWOJsZv38ldxduNXX4Hd35XASoHtoQxscJGlyi1HpYlHCRfyzok6XiqLveV
	 Xk8Mhw57n75+o8xs6SEQXEoPJBKpJ6IJONixCkQWjN0AdhEXMVyTCXwpdMkbIKBSaj
	 m9nCcjLahT8vkhP2B+vE+swL6LVbUpGIYl/vV8OdNhSs1WVHjsXRiPDYvoxoC6D1iq
	 OtodYdLlWug+er6JUf8/SFG/6UzzpdGMcjQp0XtnZjPOuYB5ck8UIh+EOgvV4mQZT9
	 7+7WEkXLoHjZw==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-640b0639dabso9534146a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 04:31:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVXoYs5z3cnjPwevITUhBYR6QsvDpgry1tVC8YFinoV7lmmdZXq3oaamGY7+0Na9X+SqbFCoRcEfnYrfMYK8ETe@lists.infradead.org
X-Gm-Message-State: AOJu0YwOAKfw2onesWK8EEqw/S1fJ/uPvfW14+katr9M7lQ5gsYIi0rF
	vmqIEO2C2tLwpgw0A6kOQhAQDchtuSeUhDv8ZkGwozzpLzHcSAqA2lupiM9N9+Gvoxaiw9MvHWG
	DDKHyyrR/P1vobA7T9Q8LOYdLaQsygQ==
X-Google-Smtp-Source: AGHT+IGLxy/uh+U7H2PxxZlqgLgPmhKuaV5k4O0onhRVWFJDD4hQPNzjBubtkUHLJz8ovFsi5apooakSSoclnXyLM9M=
X-Received: by 2002:a05:6402:42c8:b0:63b:ee26:546d with SMTP id
 4fb4d7f45d1cf-64350e20abamr13777696a12.12.1763469080768; Tue, 18 Nov 2025
 04:31:20 -0800 (PST)
MIME-Version: 1.0
References: <20251117211306.725678-1-robh@kernel.org> <679c1f30-7c62-484e-b4e5-7351a23f15e5@collabora.com>
In-Reply-To: <679c1f30-7c62-484e-b4e5-7351a23f15e5@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 18 Nov 2025 06:31:08 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK4jvZQTQAXCjPgxBCUiENGKgkgaDgZ680QqL1XpS6bbw@mail.gmail.com>
X-Gm-Features: AWmQ_bnX-Hy8ABX9esWeMfZpv2yXK2YBtFjlmKu751pMQcabZozJHtnbzue0-FU
Message-ID: <CAL_JsqK4jvZQTQAXCjPgxBCUiENGKgkgaDgZ680QqL1XpS6bbw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: Apply all DT overlays at build time
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Nov 18, 2025 at 3:36=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 17/11/25 22:13, Rob Herring (Arm) ha scritto:
> > It's a requirement that DT overlays be applied at build time in order t=
o
> > validate them as overlays are not validated on their own.
> >
> > Add targets for all the Mediatek overlays.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > This will soon be a warning[1].
> >
> > Note that if it is desired that the combined .dtb is not installed, the=
n
> > the combined .dtb should be added to 'dtb-' variable instead.
> >
>
> Uhm, sorry, can't we do something such that we don't generate a DTB with =
a
> preapplied overlay?
>
> Even something like generating those and deleting before build finalizati=
on
> could work, I guess, though that'd be hacky maybe.
>
> I don't know if this is the case, but I'm worried that various people hav=
e
> scripts to copy DTBs somewhere (in some partition) or embed those in imag=
es,
> and if they get the preapplied overlay dtbs in the same place, havoc coul=
d
> happen as the bootloaders might be selecting wrong dtbs (as a plus, there=
 is
> no dtbo that varies machine compatible strings, rightfully).

If they aren't using dtbs_install for that, then that is their
problem. When we moved all the arm32 DTs to vendor directories,
dtbs_install maintained the old structure which seemed sufficient to
not break folks. The same should apply here.

Rob

