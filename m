Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E9AC55182
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 02:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUHZK43CT/N++9FBcUl1JAIfA+cKuOObfqC5yDHgHUM=; b=2LPjUGf/ENE50mlIU6uPDSEwfM
	XbtGtEbo0OMva9i2/c17PoUPfLLJ6GlRqtvFtUBdFrSfymchuwyf0ckzxwdNDXAvbDtvadmU4OHxp
	9SJ1qqsCRQco8oyDDt3LZxOpQnyeLNMg23KC0qlS+BLktjv/d6OsEdBUxsiqKRNOlFdjQpR1HTCIY
	CQ97ySk8LcCnnTfjhfUFP57RsDt58ve7e0W1fFFPeyrhfa0ERA7I2EgQidO2FTsUfQoJexc/1jIXV
	Adv/0ayd/XFF3/UJDgaNnjRi6OHxxVugRTDgIid2hjgbau4zF6L+7BvhU+CWbT9VM03PYu+hoyekj
	vMBhOmmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5A4-00000000rXu-0q9z;
	Tue, 04 Aug 2026 02:45:48 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5A1-00000000rX9-1soS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 02:45:47 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-81e9f7491ffso61192457b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 19:45:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785811544; cv=none;
        d=google.com; s=arc-20260327;
        b=mjHXF4BLvFPmXs5E9VXqKSkOXCu1pPEQq8F8Amf293AA94ZKeN+RdKbr4oKRw1+uXm
         ZetzIP4VXTWKTtxfssv7DP2UGdpPBDPWMEHxLX1X0CbPgQhA0GT47b9Ry6TDnDbmmyAz
         ABJ/KGOGYiStgUySe4/ALJSeTF2c2WW5UzfvhRppUmepGEpbYvY2w8+g2xkr1HTdmGlB
         irPuEYtI45vKw6gO1YmW+gk1AlejnjL/VcwANkTBA+Uvfxef6nMLHOebPGUz4Lxu39lT
         85D6TQtn57SRc4WxKXGyRbclmZ1yJfu0aj94el4NyAn9gZMqMbG5QVqsmXwn2Lb2UXer
         +NtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AUHZK43CT/N++9FBcUl1JAIfA+cKuOObfqC5yDHgHUM=;
        fh=ivIpCYRj/AN4+2P32ps4lgdKR7QmPyP0lJwzLhIF6s8=;
        b=OonbeWfbEk9x59F7doPS5POzS5TpV2E+AC+muG1Px5NjTs1zrAZ+y7c9h7QtsiwhPX
         BiproC34ELA8AOBbTQ4mpvnxrNUSK+1Tq7gjrRWtuPJcJnKg5T1yNDtXD0PxIJucDbO8
         E6PmeEOzNTNVtmFI1amrur8OP3nlPA/Ajd91psZOp+wajD0juyHsiSRb8WpNniCI7CnZ
         nASP1fF0Rz0huwOmQGjaf5DDxD1rmk1caGh3aaGXHCs1fRj6mShEemk1iI/j3J5Fj/cn
         nJgTnyqoHesgKvEyR2nEsYsGwpwFLyKVsLNJ8U6Vhb882KcDGg6WHr2JjQr7Wdaztz20
         OhWg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785811544; x=1786416344; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AUHZK43CT/N++9FBcUl1JAIfA+cKuOObfqC5yDHgHUM=;
        b=c5jGwZJUO7jktYNXEpTput21lHWXAaE59WLcU0bawQzGp/hHXqyhJ+Ml3bJPCI06Zq
         r2SoIjbIqM7RPjrrXK4OBVyNlACZdiDlXQ6yg9iqSWA9a1L23LuvMKMXOgtrbmEBAdK6
         mmqVTcTSetZUe8zS2JJ6ZZF84fRBCpJC5OtX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785811544; x=1786416344;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AUHZK43CT/N++9FBcUl1JAIfA+cKuOObfqC5yDHgHUM=;
        b=ThLleP64QxUGKAOsgOD2++Luk+i+k+WjAxAeOPIVX9CofhLOY7vFYPN8RJNIBoebzX
         yOVMQWpSO4rLyP62lgIvurWjYRQ97wIt7jGpQMLrNQ74kASmCTulRcwgUU2kmr6hHwCi
         2sw2nusrRXMedX7EuXRjjr9wibkYBnHLMWptp/QX95fXgbO1WpCIPUVKc7skZAqqes+p
         NjYoVmQmIuDuU6RB0q8QSn4D0NQOUNuhBNITaw92e9E9He9LB+OuMl6ebxsRuMN+jcfQ
         NQ4Q5f8n4m2FZz9vMmV13GCuXziiqNZ582e9vcPyzjVwzFW6N0TDw7y0A3lpGcVMBSOp
         s/xA==
X-Forwarded-Encrypted: i=1; AHgh+Rp+AuubI4/LH2g+z5cTscqZcwfb3Cf6eOjzhVosFDkAz96E/mbiyvNSBdCH4SZdEIJQXkdXFrppChIVCdH74EfG@lists.infradead.org
X-Gm-Message-State: AOJu0YwxNm3bT7tbCPQ02WVDAu67uLa/hqEv4AVJ7OAwHpNY4sL67cVx
	/W5X6w5k52HLIt+Py7avuRKpTpeDuIpefFKzzs2SwSoiJPXhPzwEniRQ6eHFvRkZf4m8HgSjuA8
	HoGW+MyVDj/s/v+Lk547fZjqBcGL9pFlFtizq6Yc1
X-Gm-Gg: AR+sD10wRFpX0ESYg7Awhl/ygo1rc6Rptd8zDCURnAcGVYZV5viFL9RwLV2d4h29DuT
	EzbW4/kJcYok7daR/ugoTWr4KtvKvqYudnE6J6hV25tgX7VxwehDetgKtYh+r5HE1a4EP8pTYjR
	55EK5q+622fv1aluEo+kohOJsAX/nM2Hb3rb5BTVrB7VNzRR92hqd93Twev7ZQtKNIn/w3VXEK3
	mGxOnCHBqsVX3QXUhKjsTJAa607zSoDmoh3xKzXQ4XY7z3TaZiXJ8w31wi2/mPwpVqehAk+ZXSP
	789nkeD2sxrMtLwUEpR+iAGnngEGHd3uVqhJ97te2HdY2B8=
X-Received: by 2002:a05:690c:6d07:b0:81f:27f8:2de4 with SMTP id
 00721157ae682-81fd4a04799mr160372987b3.8.1785811544182; Mon, 03 Aug 2026
 19:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260803141659.559129-1-akkun11.open@gmail.com> <20260803141659.559129-14-akkun11.open@gmail.com>
In-Reply-To: <20260803141659.559129-14-akkun11.open@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 4 Aug 2026 10:45:33 +0800
X-Gm-Features: AUfX_mwLcNdgKSX0dY1YbYf9cwLK9DsvJWUXl-Ukek71RJiEJ4s-l_75YEo7Ku0
Message-ID: <CAGXv+5HRsFFhzSYPdk-zmipLTVwxPkHLbuFP=wn_f_D+3ejAMQ@mail.gmail.com>
Subject: Re: [PATCH 13/32] clk: mediatek: mt2701: Switch to common
 probe/remove helpers
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Laura Nao <laura.nao@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Danilo Krummrich <dakr@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Takashi Sakamoto <o-takashi@sakamocchi.jp>, Haotian Zhang <vulab@iscas.ac.cn>, Kees Cook <kees@kernel.org>, 
	Miles Chen <miles.chen@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, 
	Sam Shih <sam.shih@mediatek.com>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:b|_)ptp(?:b|_)" <netdev@vger.kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_194545_484868_DBDC95D6 
X-CRM114-Status: GOOD (  12.08  )
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

On Mon, Aug 3, 2026 at 10:18=E2=80=AFPM Akari Tsuyukusa <akkun11.open@gmail=
.com> wrote:
>
> The MT2701 clock drivers can use the MediaTek clock framework
> common initialization sequence. Reduce boilerplate code by creating
> struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.

For all the subsequent conversion patches, please try to mention _what_
led to the converted driver being able to use the common helpers, i.e.
what prevented it from being used before. Was it the PLL, or PLLFH, or
something else?

Details matter.


ChenYu

