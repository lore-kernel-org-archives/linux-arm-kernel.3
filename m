Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FE6CA6018
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 11:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWFAa3FlRVlkGRW/o5QZDawPsX279VU1DGq1SPr0IVA=; b=hdgg/Lb4bf8NfFlHR1RM4KH4Oh
	imSWIfjD8oBLaIFi/umMWwvSNvNkazgR+eB4gCcaOhi5PbLpxTwmq8Kxo1AMYSBe/nBCj5iN5b+/i
	BIxppZYh4/4igHv0n/RMFrdDHrpU1LI+3O2kSEmJhiDhWmOyBH9bl8p0h6GlmjT9CS4G83lGGiWX1
	0xAmA8rbERO6DyqQkTpnAv/5SrsRKjcPe6YN7gepaU/OE1Lt4Y6ILvTgCbgDrDQfw7ATad5cJwIHs
	DNWOsKII6/YY3FU3gBovBPteFZMr29SH3VJYjrZ+7RZtJV8SvtPtl4uruIV0OvoN97zYOXf9UvBah
	QZVp7/qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF8o2-00000006B7D-0VRO;
	Fri, 09 Oct 2026 11:30:30 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF8o0-00000006B67-1P1B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 11:30:29 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-6768403e9bbso4201103d50.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 04:30:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791545426; cv=none;
        d=google.com; s=arc-20260327;
        b=cM9qsmghV8pTrT2UB7wTFtd+Hs/5zo/UNG9E310fVPpS4TM6Hs2epoLtBFFsm9InQi
         IfrdbOiQ3qvDUjxVXJCiAT4i+wGqiGn4bS24R3uruTdhqyzzWbcpRc8cM50hFZ4FSs6+
         FrK26nBA2oR1vzAoTP4li8lKRGy9XdHmHwUWBPul8klmyasNPVu+HXjZGTfBYH1ykn7r
         AHi17dfdgH3pPtEeFIvLKG6Qam7syKIYPgNn1MQXJcuGe41zrI1ZO3q5HaDX89729xhD
         BPPkugX7HWAmKzdkwPJS0ZU/EODCPnMfMuetJB/49R2geN/ykTdH9mvfyEJXyqA/SUhf
         F71A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SWFAa3FlRVlkGRW/o5QZDawPsX279VU1DGq1SPr0IVA=;
        fh=K1stqW/CNnZuuRq11b75TYhH4j+MiVPQ6ZYIAA48zYg=;
        b=OU5mEmT0pd+4ggehmaUyJR5B04Zvg9TJKB2PJzUQZ2PE8tbYm+HeV6U7hvaUsDGOU3
         Ak5t4LblvKMkp0mQGffwsRmsJg1/nGxL+O8EFs4GtJhtR1xYwQR6c7tk5eyE2HvyMysG
         /ehCA0K6TmVjdk45z2u2jFvL7ulYca4Ksheqczaq/CUW+q7qULAdWKmmKg8eINL7oxyB
         yS6cEBPhoDgzYSX3N3f0tmRy2O8IOElpnL87SOSJfQBWMfhHxFWXlEWTJg/Ny5fnI16g
         ql7faDUz9RJw4kh7x4GEzgdLBQB236aSBumPpfx2kiGpKUL1MljOkwqXt4JggSZcrRny
         Fb9A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791545426; x=1792150226; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SWFAa3FlRVlkGRW/o5QZDawPsX279VU1DGq1SPr0IVA=;
        b=a26VKFcDATqpCF46Kl1aLNCcYGfW0MTxihU8Kzfq4gG4JihxIA0/dU7B4bJyeOAfz+
         1qsSlCfgAidZ4e0snL+DkrXb6VErjNinP8o+9F87fIqlQEgFAYKDqoq78DIUsuj2xGsB
         Q0lM4B8ixsk8SaSV4iztKafNm/FK9hW92mdtBrHXzwzhLugHQAYpzBlE6nttS5Ntovl9
         OtLPyTw3nBkyezgIqS2P+PGJXvRpt02LTVAKkWwtBz+piHGO7s/IvwGQYbZN2+lwpGT5
         LNWBFQnlYuShCWd3YJVvUD6xtFyOPNYeb4cbaFLwbknzyjyck3s0Txd41XN/DYi1O7MT
         QP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545426; x=1792150226;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SWFAa3FlRVlkGRW/o5QZDawPsX279VU1DGq1SPr0IVA=;
        b=id5TbdqKOwkCrzt5FJAWAPWT9m/ILvMACXBRRQjThu1kyrbuqp1qm1D/RJOcWj3ixk
         HtDgU27J6iPhjxsk5sn6BIdl66TYjGupC91eHa3lN/OkYvtXuhyYvzEdbTo0yP5gCbGJ
         TNKOklDA4dF04iq8tu17KGjj1TFly9EYzMk+I3svN6Jxk9jZe6ZkfYFxka2osFvIfFs9
         vLmY73EVQRwWncg4YzDiqYdS0Xo6D253ubgLNmBC1TmsOJNXsUN+d3MGfxrV1RARGySO
         2LPhqrqj3MK5wNSe4X+PIIt/vWaMdeXBUWd/Yvr7z5IL3xs/h8HqgEZd1C6Yv9GhZDzC
         YQ9A==
X-Forwarded-Encrypted: i=1; AKwUvBxc4je2PwAd5+2RmK0vF/1AMXmvlU5inTiu0U8ZCYWzLggEBl+7+SkV3uzAJF4ZMkt18amNKQ9l6snR/jDKzHx8@lists.infradead.org
X-Gm-Message-State: AFq9FYKOMCQCNvsLA2OoW/spV5xhnfxVbC4ULUQQCOjCe9lUJ2+4lOGE
	IwKB1wTaFIBWrvoqAmcDkM3FyvUVQA0cGah09tbtxF8hxT41ujjCrM+dQesj3VqCBKO/zWTa1AJ
	Fpbqrsl02Y3W2QFdZrTXpLOKkMAvNsWI=
X-Gm-Gg: AYBFou3AS8LoRCqhwR5+6oVTdAaedFj+/R/0sNM87KqDYPWj4yWDM0fkSjtPTTCQtoG
	dE6M9bbQ1ToBVqfDzu6qdmoOoC2+PrPLANz9R8nKGYAi9RO218Rd9CvZdmP1gOwWIqLEJsyH4LO
	DcyjNl46bCqGm4eFjLIs1dGqOZgAvMM9k2YiJuVu8mZaOHVzTXV3SJzFNcsXsRn2Ey5R6JCQLnr
	f7ysJvAGEaE8RflyO0GbHswd053HB71vUurm/yfIhWwzGnzm79eATp6dLvBQz8ZdRmrQ96r86Aj
	KqUG19uBNTiTkzSdhYei3nuAKQHANYevP0hOHAoiehljS4XHFlxI4BzithQqxxbB1cHOhqFMcbu
	MY/W/hI0qt7rojE/YHt/ajfk=
X-Received: by 2002:a05:690e:b49:b0:675:6da9:1473 with SMTP id
 956f58d0204a3-67936984122mr569837d50.19.1791545426481; Fri, 09 Oct 2026
 04:30:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260908090448.3332-1-ansuelsmth@gmail.com> <6c610758-5f34-4408-a6e5-f3718218ba94@intel.com>
In-Reply-To: <6c610758-5f34-4408-a6e5-f3718218ba94@intel.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Fri, 9 Oct 2026 13:30:12 +0200
X-Gm-Features: AclHuK8eqfw6Ev6f1SKA8eu2eg8tRj5EFkf2BXzzFiX-0ipAFbVTyYej92ofmYs
Message-ID: <CA+_ehUwrzx2gLS88438mqQC=ms71kaJpoU9ib8=zAdpsrXcGeA@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] ASoC: Add support for Airoha AN7581
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Darren Ye <darren.ye@mediatek.com>, Rosen Penev <rosenp@gmail.com>, 
	Daniel Golle <daniel@makrotopia.org>, bui duc phuc <phucduc.bui@gmail.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_043028_386461_F7202ADB 
X-CRM114-Status: GOOD (  21.52  )
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

Il giorno ven 9 ott 2026 alle ore 13:25 Cezary Rojewski
<cezary.rojewski@intel.com> ha scritto:
>
> On 9/8/2026 11:04 AM, Christian Marangi wrote:
> > Add all the patch and documentation to support Airoha AN7581
> > sound driver.
> >
> > The card follows similar implementation with Mediatek with
> > the codec present on i2c but with a simplified implementation
> > register wise and additional frequency supported.
> >
> > Changes v6:
> > - Fix PCM probe allocation logic
> > - Split driver patch to dedicated PCM/ETDM patch and machine driver
> > Changes v5:
> > - Address comments from bot
> > - Better handle concurrent irq status bit
> > - Protect enable etdm
> > - Add Review tag for documentation patch
> > - Address formal comments from Cezary
>
> You've not included all the reviewers in the Cc list despite addressing
> some of the comments. I hope that wasn't done in bad faith to avoid
> further review.
>

Absolutely not. I usually use get_maintainers script to get
the emails so it's totally possible I make mistake and I forget
to include reviewers.

If you have a better process, please suggest it!

Anyway, what did I miss? I can totally send a followup patch
to address them! More than welcome to fix anything.

> > Changes v4:
> > - Improve Documentation YAML
> > - Move IRQ regmap to mtk_base_afe_irq
> > - Use mutex for user tracking in ETDM
> > - Register IRQ after memif allocation
> > - Address suggestion from bot
> > Changes v3:
> > - Major fix to the ETDM code
> > - Add duplex support
> > - Improve Kconfig setup
> > - Rework and improve YAML schema
> > Changes v2:
> > - Fix wrong edit in MAINTAINERS file
>
>

