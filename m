Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AECC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 18:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P6V5AHCcs6/PjkfWZUhc1hNG9sBgklw9wJ1nl2qB6QM=; b=Kk5B3FKu0nKhQMkVZT9z8mAhFd
	vCC0a3zfMjMauxhCObBLhgt+yn4Dr5K79duBh/5NJkCRNcgRlqN3RKOKK8Z+z3kHyk0lWHhno7LCi
	UKa3bmJ91D1OF/ya49vi39ZDbiLF1s7JZkL9AECSDbmg0QdH5d7KoXkiNVsYzK0KyRk7YJw5BcUTh
	vAy7B1+giYFv0M0dnfxqbgmcsNofFyDMoFILbaQzPCr0ihrMKTLS8tV0Pq0wYe1ii163R8xOyZK+L
	q8noGhy41y1OKbXjpeT/OzTJ9N+oFRit1gm8SkZH9H/gFFq2u527cYstUsMnO/Y4ndJVhWYrFDm5L
	kkJ3x7Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzqa-00000000zMh-2LXh;
	Tue, 25 Feb 2025 18:40:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmz6r-00000000lG4-1oG8;
	Tue, 25 Feb 2025 17:52:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A8C8D5C5475;
	Tue, 25 Feb 2025 17:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44A32C4CEDD;
	Tue, 25 Feb 2025 17:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740505964;
	bh=w0EkbHkGHBYElQYWfADsG+yNVibDYgCQClR6E5omnNM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VFzZAOVB1a78DBjHDtOtuMrJTGr8jVuKit5KqKgfyh/fX73Y6Is0do1MFFrz+Jemp
	 Lbhlg7xS6yHIZaTOWiszvYatZeN/iv+ogT1Za46h/vkopmjCPLm5TwsWwEC80+Kt07
	 A2YDXuIPr6QRVYzYIUlUVeZADuuoe/qm/7R47h6ErvqrkGpSsmCqggvlOE/uz7f8zz
	 peh/7+xGpi7QJ/r4uV9nNEC+HJHbHk6OThzJxJrC/S4+QyoUX2cChMnnIOXLrUZe49
	 1NjBsFrGwjtJxyM4ounylZapEAZfSXeiQ/IIMS6S+yDeBzA19sVB5M3X7cEVJvyy5p
	 eYbjFj/YbZxNg==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e04064af07so9230831a12.0;
        Tue, 25 Feb 2025 09:52:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUpZ7T6AHFVir7RmpXIoW38x9gQJCU2YVovztj7uPcCpTjYm6Hs3oFaQO/0A0mW1Q6GRF57nHuaeWtWHTI8Q2l9@lists.infradead.org, AJvYcCXi87jCsb/NeSULtZEpEqyZdArHevKzDOjEx3tverKiyD56qJ0zO4WWDNMNKD4C9NUgIom7cuBL3ZLCHlYbcgA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzbUfoXl3mTI1VBm02oCQm5H++cUvpNsHub5PL8MW9Kd8IoQqQv
	ws7tqcabNnFXFBCTJAq9w1Hse8MNOfdCPTL2OPNrhJZmlpEn3mgpGDjQGR+6pEMDEQKci7X/fKD
	/9cVK+hpBIfLGOumFR1CUr5vhWA==
X-Google-Smtp-Source: AGHT+IF6yxHJA3YSV+Mc7KCSIMedD8jUXEbB4xXTDLc0/UNGPOBcZs5+0oQlFOlVb1ificfP0x+i/oVnnr4HgeYGyas=
X-Received: by 2002:a05:6402:440b:b0:5de:aa54:dc30 with SMTP id
 4fb4d7f45d1cf-5e444481387mr4585735a12.5.1740505962886; Tue, 25 Feb 2025
 09:52:42 -0800 (PST)
MIME-Version: 1.0
References: <20241226050205.30241-1-val@packett.cool> <20241226050205.30241-5-val@packett.cool>
 <173920541986.1887800.1972669785800121190.b4-ty@kernel.org>
In-Reply-To: <173920541986.1887800.1972669785800121190.b4-ty@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 25 Feb 2025 11:52:31 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+PPYeFxr=utwZLemUVCzk5iabtMckOJmNy1-LO39cqeQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jq1Iz82X3jYxZcNLZTXQB24STg7TFTfP3ZcCT_Tig0_TFrubDNC8pk8KUg
Message-ID: <CAL_Jsq+PPYeFxr=utwZLemUVCzk5iabtMckOJmNy1-LO39cqeQ@mail.gmail.com>
Subject: Re: (subset) [PATCH 4/9] mfd: mt6397: Add support for MT6392 pmic
To: Lee Jones <lee@kernel.org>
Cc: Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Eddie Huang <eddie.huang@mediatek.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, Yassine Oudjana <y.oudjana@protonmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_095245_509266_DEF7FB1F 
X-CRM114-Status: GOOD (  10.13  )
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

On Mon, Feb 10, 2025 at 10:37=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> On Thu, 26 Dec 2024 01:58:04 -0300, Val Packett wrote:
> > Update the MT6397 MFD driver to support the MT6392 PMIC.
> >
> >
>
> Applied, thanks!
>
> [4/9] mfd: mt6397: Add support for MT6392 pmic
>       commit: 896b1eb4ca771b37ea50feb4d90a78dd4e9cb388

This should be dropped. Missing the sender's S-o-b and the rest of the
series has issues still.


Rob

