Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECE5C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 07:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2y5QAVeNEbw4rwpIis7dsdZArac2vQn3qNAs9Ae58oc=; b=WRme85znzOjEToA8csOr8gfljU
	Ao9kOwSpW2AUqJDK8tHSLVRfiq/qznQOitndnjZhjUsFssN7OCHAEPrijwAac7Jjgr5p0KQVzi100
	SvWSFFUVCJX15zHmWwTbtBo3J+nxx8B8drKMIFieMmXPYD8M+Vyp9uZaFqtTPs/vrvAFDDQOwmM3w
	+3kbrDtDC8GxlFVeviJSnaf/+w33fyto7C+Yhyekd7NeiLk+gBFZWLUHJjeAXiVdPZ0faq/rGpDCH
	Y54Ge+yxXsJPolWumakzobD24qBDjSlSCn2tP/s3WOJc967qOEDNzXQTmgWAkMPIZMdSSvDppckdO
	DR0ngHJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpL39-00000009j1l-02eH;
	Thu, 30 Jul 2026 07:19:27 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpL36-00000009j1L-3XNr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 07:19:26 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4954df200ddso10460325e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 00:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785395963; x=1786000763; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2y5QAVeNEbw4rwpIis7dsdZArac2vQn3qNAs9Ae58oc=;
        b=UqwRsloJsFbJlfxz6145aenT96ha8C83gZsH1kVkFqfJQTocqtfg0WzCXpfK74HDPP
         /EIKYhuRfSnDaQ6w0bva26kdifho15HIizZtrGn50YwFyXc2ctl/3ooxpvvJKkV9/d/W
         0V3u0bZzenQ6upScJL2QW4CepBV3QuUrbdCgnVh9LvtG43/HBh+kP7mVJfnyZz0UP7sk
         c8vLawwl71Mv1CEfHEZvaY/8ynVNPAB3oZeMhUWzAzjF6Dk33hfaBm6yu7m7zQeang8X
         dBaNBccVLhiZX323bmTJQRJIPOXmIk6clhBjA1CPwwuPCBEzPkUAIIZmKqtYefbnoCDL
         vnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785395963; x=1786000763;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2y5QAVeNEbw4rwpIis7dsdZArac2vQn3qNAs9Ae58oc=;
        b=NyruRSrGHCqdseoXm79YnpnOOzLrBXetviVCCOnArZQx+fpIJBrHEUA6dhqmEhZFvO
         2C/QxqkJyGRF0vg4bJHtBwjOEnQS08cQakcXt3cqYb4/toELo9e9SSeGX61KV/3scgmU
         yqE3S9Niq50V+uQa78B1C9wo9qOqpsJ+AM69C338Q1+NDxlJ1ErmhThzAjZh0H0ZMx5g
         XMdlM1oLNAKEtnv0HAY6YohXXkWJND19sWFX4rbVDhsNhabAqw58c2AigcY8x1sHYkKU
         Ii+iKb4EFb+TJXU7Gw1jl55PnrOia4EZ26eW8lpoACuHMAkA8k1VOBCpyz1/7IZjxYhP
         l1WA==
X-Forwarded-Encrypted: i=1; AHgh+RoEyjqsSn+VTudNSa1xt+67uqXIlSplKsKucf3lgjMR5nalySH8D5opWPW31B4YT3JKJN3LmYlLdncAFkxC4Yeq@lists.infradead.org
X-Gm-Message-State: AOJu0YyMeSmvaHTqJQ5+DnJ9jo9HiitfsaO7Il1gBsfnqXJzK62feiYu
	dULv94ZMTiyFKGxuh6Wu5dKyp6bAzLuoBfkxys/6Ikh6gKlEMj1rpIS7
X-Gm-Gg: AR+sD136fm+3VFbInIVcdsgRu+Z8ms5VyUsavAV7LICRepGl4TVUPfpnjr756FKwtJn
	W2E5m0qxtUyG0Upv938M4jk3BsDgzWwe679P+b7cDnPngjZhEhiLbOQwKNbpJwWDJdxynaw6Y7a
	6mzrLPWlICJcnDwvOHxroP8yYq2FjiBPkupCPIqfy5pguYgrOGnCnRnw5wJNCW4xbO+e1SUhMNJ
	BPutUIhJxzvEJlRuAZhclETU6k6E+qCf0KgrUHyuLjEbZhGJXpjwvULucyx3may5cNWlC/3yKWy
	DC//yxvIs7RrMVIpEwr4rwTn2pGBtAJWQGHFgmcf35HauXrWsW6sKXlGe6e0ZKyrdUYDdlLv1U5
	PdjfqrdlBn/u+ywU6fOF0qoDoEmLae+AxKyub0iGMqI7jTBVJBetm8M7q0IMusCJJSOTFKdtXnf
	0EiiZ5iC858P7Si3ylOHLpUpnDbftLKVAbUZ381SpcfqUo6i+sFpH3DaA87C38xm4tAM+tSWcbt
	KZxE0gnFtzKDFyEGft1Z+SkrXVwUdVfSg0xk9m9XANL3TB0ECvwFJVem8NCMJ2Ab9zZat0uyD/i
	Sls6WyHDRFBTJF1bD3m0P8q/F9vwVWA9LOb535P6Pbc94Ye1ImgNIbQLpnYAydhrlsBGx3fFsjA
	DhvFJ4sMbBQkbl82BUlBparwEEd92e0cXXpzdWEw9s4cnm1/lBuxVWFisn7Kh+33bP7woy7jZ
X-Received: by 2002:a05:600c:3306:b0:493:b6ee:fcb7 with SMTP id 5b1f17b1804b1-49800e753admr10529425e9.14.1785395962626;
        Thu, 30 Jul 2026 00:19:22 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc88d6e68sm3625182f8f.7.2026.07.30.00.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 00:19:22 -0700 (PDT)
Date: Thu, 30 Jul 2026 09:19:21 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: "Kaustabh Chakraborty" <kauschluss@disroot.org>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH 2/3] iio: proximity: add driver for Sharp GP2AP070S
 proximity sensor
Message-ID: <20260730091921.00002d45@gmail.com>
In-Reply-To: <DKB8WW9AK4KQ.2A9KVJWD5ORFT@disroot.org>
References: <20260723-gp2ap070s-v1-0-b8ca3a4c10dd@disroot.org>
	<20260723-gp2ap070s-v1-2-b8ca3a4c10dd@disroot.org>
	<20260723234439.06411731@systembl0wer>
	<DKB8WW9AK4KQ.2A9KVJWD5ORFT@disroot.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_001924_910394_DB9D571E 
X-CRM114-Status: GOOD (  20.37  )
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

On Wed, 29 Jul 2026 23:23:45 +0530
"Kaustabh Chakraborty" <kauschluss@disroot.org> wrote:

...

> > Please add iio/* includes after the generic linux/* headers. Ensure
> > that there is a blank line between the two groups.
> >
> > Additionally, you're also missing <asm/byteorder.h>, array_size.h, err.h,
> > types.h and delay.h.  
> 
> By the way, is there any tooling to satisfactorily point out the
> shortfalls with includes? Or is it just intuition and experience?

"Fully satisfactorily" no, but there is a tool called iwyu_tool (IWYU
meaning include-what-you-use). It requires Clang/LLVM on your machine
but it can serve as a pretty good starting point when cleaning up
includes. There is an unofficial mapping file for IIO that makes the
output of the tool less noisy, however it will probably still need
tweaking. Here's the link to that thread:

https://lore.kernel.org/linux-iio/20260512073505.1310-1-joshua.crofts1@gmail.com/

Setting it up may be a bit tedious, but I found Gemini to be pretty
good at this.

> 
> >> +	ret = devm_request_threaded_irq(dev, client->irq, NULL,
> >> +					gp2ap070s_irq_handler, IRQF_ONESHOT,
> >> +					"gp2ap070s-irq", indio_dev);
> >> +	if (ret)
> >> +		return dev_err_probe(dev, ret, "Failed to request IRQ");  
> >
> > Just return ret instead, dev_err_probe() is called automatically on failure.  
> 
> Are you sure about that? I happen to call dev_err_probe() on all other
> places and other drivers (as of late) as well (other than -ENOMEM).

See the comment at the devm_request_threaded_irq definition here:

https://elixir.bootlin.com/linux/v7.2-rc4/source/kernel/irq/devres.c#L94

-- 
Kind regards,
Joshua Crofts

