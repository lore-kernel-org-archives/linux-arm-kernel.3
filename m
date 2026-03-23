Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79939F483D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 17:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9w/05BIl6C5UPAlKrmDSRzbmSzN+L5hTClA52vqlcgI=; b=kZt0j6gCZin7fV
	vSLrqq4APvEhzBzxVE0jggBaL+G3xjAbOBNtWtIlpqrTe1sv64AycF4Jr8lnLH2Y9Thl48EKG20wZ
	/8ET3Lxoye6x/jMU2CoXrSXKOXooFt0tcbjElcisQbgD8cHLPsKpGh1mR+4fMbmHufDOBOWSoMXOG
	mELvMQJFz+OQDxynEg3y1C8LihdzEAbf1R2HlmxO5iFDlCA2S6w5GgODQUaW/sRNK1RN/DxAp9nZi
	IFAEZzdB4ob4pKZl1WP31HWtwsdyMvpmXWWawwXfdwuTANY55+IRwxq72SUVrH9YsbiN8h16WrXnd
	ipyOt+HEIVUaqcC8M73A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iko-0000000HC9M-1aKX;
	Mon, 23 Mar 2026 17:07:50 +0000
Received: from mail-lf1-f52.google.com ([209.85.167.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ikl-0000000HC8q-1Zaz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 17:07:48 +0000
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a27c021b58so398967e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 10:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774285664; x=1774890464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9w/05BIl6C5UPAlKrmDSRzbmSzN+L5hTClA52vqlcgI=;
        b=hhHCdPGRsGtfg88gz46c+gXhB2UeOi9quspbWnLzf8i2nWR1jNGeBKw6MmyeX8Gbqh
         4aKo4bmzrSNZbZHrdkud5kcpiVNZlXxU5Y1ERMolXjJo7Zw7tsQDIfwC3pm4VaTQMQki
         Ii1EQZBWhB4af6Riru+8h9e45kvdmyFueIpcUYia792qyhfI7cIWZ9rRei/J/W9jCEmR
         hst2sSldRI+uuETWnV1iELOksNwMyn+WaMKlm8ClK5hahnVf1k6Y/SDQmydhGmtqYsQy
         ynawSrX39s1C3hZUXYAFLqkpjqEj9DibMqyu7+bzwUcFjoVT13EQipEFv7H0WIkDifi3
         iF6g==
X-Forwarded-Encrypted: i=1; AJvYcCVyA5ql2yv7oXtb65FCtbJ+wP0HPcIYXoN3jkTE67CCFwFyam+sioQWtCAH24qJtAw27QZIlr7RkE4qRibJTpPo@lists.infradead.org
X-Gm-Message-State: AOJu0YzAJPnMTHIwJOk5snLFAvUjGAAl8kuFJAT1SDjlbjjOSLfpjDgK
	Qzxt5JusiXw2AVXMpnSpkxpNTelKAMFFwcLPUnrhuJs5pLNCRw+07iDH2lSV8bDA
X-Gm-Gg: ATEYQzzHBTsovCYv8SLhtuEbFCP4/wZdsPdfQlNaGBtv7hhlfL7TcL6l2UkbrgFPT1b
	X2glQR+gu10opX9uySv7ZXd2NTb4EidyMlbmCVodPuYgBSG2v2jMDU5EuL0ePFl6VtfBEy3I9k2
	kuYknstbgwwOQDnySpcDicYhfWymZ1A31vDSk9G5UNhxYkTnG6uOFMwIomggGz0jbkcTZIkmNKd
	7qB/PRCjtnSBjHx+Fit3FaI1M5DNquP2Hxd95TcJ9OJMnqanGN0kAv9eXEiLRaZqllkqS51O/PO
	tTGd/z08KlnjIGSRepNCCW1TrcY9j+oG7+DILzHkDrVPR2bDC2lhICxqmrj0W6+3OPyTIot3qbt
	MP50I13irj9IrNlsD1mJfspITO01y9WpbRDy7wr7Q9svD8bdasXhyzjorbvbasdCdJX4guKUIkv
	fUqEKdsgkF6iQWtTx7YPHRhOO/RROyCXX4WQzygAvOVX/GMJdwD7B/SOM=
X-Received: by 2002:a05:6512:138f:b0:5a2:7ba1:493e with SMTP id 2adb3069b0e04-5a285af3c08mr4371012e87.13.1774285663595;
        Mon, 23 Mar 2026 10:07:43 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285305e23sm2718916e87.69.2026.03.23.10.07.42
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 10:07:43 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38bd3bc3061so3636461fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 10:07:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3RO/ctJt8LPAkfWT5KwmH5Kv2isuep9ujIKuSQhE84qsERQ6lCSduhukiYKzJZJL4yaP/MQCpRFCuSW9Qri1X@lists.infradead.org
X-Received: by 2002:a2e:9bd2:0:b0:38b:f0f0:e3c0 with SMTP id
 38308e7fff4ca-38bf963ddd7mr33026081fa.9.1774285662722; Mon, 23 Mar 2026
 10:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260323110151.2352832-1-andre.przywara@arm.com> <20260323110151.2352832-3-andre.przywara@arm.com>
In-Reply-To: <20260323110151.2352832-3-andre.przywara@arm.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 24 Mar 2026 01:07:30 +0800
X-Gmail-Original-Message-ID: <CAGb2v65RBGK4Tb0=2D=8_37AQDt2GL_kEwd1OjqQ6ziRWqy4tQ@mail.gmail.com>
X-Gm-Features: AQROBzA5T8F1z2ogDDbAkrNKbAgfLdiandHWSkKdFT2S7GO1Ch51csLHtutzo-M
Message-ID: <CAGb2v65RBGK4Tb0=2D=8_37AQDt2GL_kEwd1OjqQ6ziRWqy4tQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] pinctrl: sunxi: Remove unneeded IRQ remuxing for some SoCs
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michal Piekos <michal.piekos@mmpsystems.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_100747_421868_070D2775 
X-CRM114-Status: GOOD (  19.16  )
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

On Mon, Mar 23, 2026 at 7:02=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The Allwinner A10 and H3 SoCs cannot read the state of a GPIO line when
> that line is muxed for IRQ triggering (muxval 6), but only if it's
> explicitly muxed for GPIO input (muxval 0). Other SoCs do not show this
> behaviour, so we added a optional workaround, triggered by a quirk bit,
> which triggers remuxing the pin when it's configured for IRQ, while we
> need to read its value.
>
> For some reasons this quirk flag was copied over to newer SoCs, even
> though they don't show this behaviour, and the GPIO data register
> reflects the true GPIO state even with a pin configured to muxval 6
> (IRQ). The workaround is just more costly, but doesn't break otherwise,
> so this was probably never noticed by anyone.
> Experiments confirm that the H5, H6, H616 and A523 do not need this
> workaround, they show the GPIO line value with both muxval 0 and 6.
>
> Remove the unneeded quirk from those SoC's pinctrl driver description.
> This should have no obvious effect on the H5, H6, H616 (other than
> being more efficient), but the workaround is broken for the A523, so
> it fixes (one part of the) interrupt operation there.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Fixes: b8a51e95b376 ("pinctrl: sunxi: Add support for the secondary A523 =
GPIO ports")

Acked-by: Chen-Yu Tsai <wens@kernel.org>

