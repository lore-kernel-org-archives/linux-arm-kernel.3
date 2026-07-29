Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1003C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 14:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VrzGFMnJSG8RS1Ua9Ap8Q6qp41waby9L/H9BOPTAg8Q=; b=aTd7zmUXiBvF2ok8MqU7GoCdGb
	mdZFsdL551lrBiFs42s1JObyQIlrjS/LN4IlJ2yTO5wXJ+pmaf1lMGgB8trjZxix1UrIfDCXALl3I
	Q9yWJkd0yiiGyK5/6vH2pmuB/z4/SIFWSk5T7nyLbP6NdWBtnjJTvSNCtEGw5xtK6jdgtBfSaGpg3
	LUtkTatyy0VX/F1foawYz3OMtmM1RDwUYOfVAMAIObhOhN0YNllmsq/DAkCb6pgwQwacwA8MJzuef
	ARCSj+V5yX/5vfvZRbgB8tZbaedWoYQ8g5RV5uudQ1wP1iOXeRHbSbT5pwBd5JZjIPbsTmMjK2W9b
	YrNuRhZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4wi-00000008Cqp-0evN;
	Wed, 29 Jul 2026 14:07:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4wg-00000008CqP-34rm
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Jul 2026 14:07:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VrzGFMnJSG8RS1Ua9Ap8Q6qp41waby9L/H9BOPTAg8Q=; b=VVuq1YhBv08T24iSi/SxpMqvSM
	1dH1itI77n98RCxSggYN2qwcYpVg8EqKKo5jjn0xm9t8E+TUR1CLCOTgaVUE78OQbbYWyuaFqV5f4
	k3dnNLJ/Vy0Mxcy8qKUdJPlC8qdjLI/3UDbJHVoI1WP/V0S13/2bb5J2FNiCyq8Ui/LQy/5obRPTz
	o+kRzkP0MMMjhIexrvZU/An3qAyFsuW9DvVYHB67tdCee7ZovJl9TYxYw6hf9WSvcCN1OeU/3BrlE
	YJsDBfc42RMhhczkRX8tQuztBxCBWMNmNEAN8wsbZbkZEPCvfmTbE5qAjE+VQ0Gm/5ENj6ym7tUAC
	SJbCu6cA==;
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wp4wd-00000005sze-2U57
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 14:07:41 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6a063d211ebso795427a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 07:07:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785334057; cv=none;
        d=google.com; s=arc-20260327;
        b=ZKCr4jT4wztsIYm4IZopGIhWpZxlUONyR05+gUNr/4JpSM+CKsh9QrfVjjRXfHyf3+
         xh9MXS8vIueuS3yZuZ/xhU9ydL2varE5qadfswQt2tsksAqwksozuR6x8SwHo+vVD5Iw
         uqj3Ohl5jQimfw3/rFBrm5lMBm8wI6biVClrvJeFJ7sSVhGNI7fdvW3JFw8UWBsNVc6Q
         8Y4TsnAbVVHU+2XYXSoHGLqsXbJtm2kEcgig4Op1YlEPZ8QYXokQm4JqUBFZyORW1CKz
         o5pRzvpUWGi0M9Dr2aNzZ2nGZ7sVVbx0MWoNAgmFUBDd/64v94UVGiWSvNw7RWETy+V3
         gM1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VrzGFMnJSG8RS1Ua9Ap8Q6qp41waby9L/H9BOPTAg8Q=;
        fh=QQg7npvG0Ihd3tS5bSW0MWf0lgLW19haRM2cDEDg2cg=;
        b=Tcz89IONyULVJKCkNx/teF8z6CPGoJbua2tkz9t84yi9zt4I+qH7Gavd2ID5nNsRWT
         QxPfG8LVzZHTU2Io+hQ+ic7DAvBY0d81Dj5rMo3cHmZ8kZnykXXdp21m8eWjBDK/3EQI
         n7DnTxoYoFDfk91ZFvC9bjD8xA2cZplNgnjXA0S5w39L98mZigURTzW80zK1OH8y5XcI
         udMAksbZWZGKtAl7KUAKpRWFxPGt8TFulq3H9xdiiZXe0kq9EyUlBQ1JwQ4LH2t/kxdc
         2QXkuT18YTGoQk2iWNTgda8WbY75lPlYF0okr28npMjKlk9cjO8mg8o5cB+0IRcKtIC7
         Qpng==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785334057; x=1785938857; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VrzGFMnJSG8RS1Ua9Ap8Q6qp41waby9L/H9BOPTAg8Q=;
        b=O1F3tH9NxPQhdpZAIyvaZzOP94SEYn1S135PSvSwI74R/JQ1KjCatnTaXx3zcDy0Uv
         0RhU5kICAzegUuPJ7ZODBxQnWJ91m3rd2Qw17I6pynLEwQwwcxjvVIC+Rp3x0dXEVT0r
         16kWtiFzLtcfwUIRjNo9MnUX8IQAwQ508/Wu2UBpC3j1N1TgvSSlkvHIJawntEmf5HQB
         5451StW8cVGle9GV+RjSHyRo3cU8fp8zMjEKaK9P9mRvPtQWSdT6YJ9bhdiubpjkTQhQ
         SDlKV0q+Wi04Q2aqC+6zWf+iPr4cLHCKwFJ4Dd2RUeT9R0iqTyLg9M2luKltPce0Beze
         zohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785334057; x=1785938857;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VrzGFMnJSG8RS1Ua9Ap8Q6qp41waby9L/H9BOPTAg8Q=;
        b=AGq/3nufU7qg0TvMQlfvATJ577AT30V+jAB8sLOIKTN1/bsRC7sXMifSkpyPIO1jkM
         rE8za9RJfVNlUGvhxW6/m/p5wA0ThtcMyb3aIWpTDb65avkk+HecGlr7+VNpTXT/7YUU
         1m6LONt05t0+cwmeCWa2piOnwS9ds0mQ1BryJ6AJRrUz35JpD7pKF27ZoSBcgsmMJP2q
         ywU1G1RXiDxXHHqXA3F4HjiEHEcjDpcnt/EY628lF4QYC2Wl0WnTIoU0DmtolNxOeKYb
         eK5sUgJD71UnoWu97elb6vdaoBCSlmq7vz9wSVW4gnOqMdJuW8qg/a75BC1iHSoFARLW
         NZkw==
X-Forwarded-Encrypted: i=1; AHgh+RpwO0O3I6K7HjJNjbxBEBPzrGf7zRXPEp3DNwo0ybo4P9LlCE0thTj2hd7ZsM5iOenJy/Zv8mHPFlzMkZxguwKs@lists.infradead.org
X-Gm-Message-State: AOJu0Ywpp/XwwkFaPMi7HJ2er0IxeVVaNuqUzwv9WfwVhpPbqVGNFAvr
	BFvzmYb+MCo6539xRSmcWkF7adPsKPkEsA5hfX869NRpZdOLj9BwL1CyfPzZwlHGS3UZjaRWggp
	icBnaHX1clQHUr6Btt3ZDNV8iYqERBUQ=
X-Gm-Gg: AR+sD12feKvvx0B6RfpT/RQwUlUxMVICbQdyH9U9sKAam3V+iIHYwSU/rcMBJE3zgfg
	0yGEpRrAB78zfV3ogtRG1mHcfwQFAf8KE661rqg79vOcnA3dfO/AYUFoQBWZ15BqrmDQkf1H6sx
	nUy1mPCIrXMdT/nyX6u/HQ67CnlR1DZdbRrSleaLroc376NR9eD8UsSotI9jstq0g5u8n6TmNV+
	IWUugu0vmLIlkTmdishANVJEnZCjt0E3g3vr2qUYqxeq0t2dUO9csfrNMbWDFpW1ShXlQAMlyh9
	kz6+bUzhsXefJWmnSIJmkbEakhrqpuPYyAgbWigclymiYLijWWmzVxJSk5tPy0Zfml1VImE7ohQ
	3i6m9JP87/8DiAGzyN+iLhNG0TkF1AQfHGT5RO0oAd2iXVle02XsWSSXlu51UXrUE
X-Received: by 2002:a17:906:9c8a:b0:c1c:332b:7611 with SMTP id
 a640c23a62f3a-c1f7250305bmr372713166b.65.1785334057138; Wed, 29 Jul 2026
 07:07:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260728-arm-dts-beagleyai-gpio-info-v1-0-783ec90d54da@baylibre.com>
 <20260728-arm-dts-beagleyai-gpio-info-v1-2-783ec90d54da@baylibre.com>
In-Reply-To: <20260728-arm-dts-beagleyai-gpio-info-v1-2-783ec90d54da@baylibre.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Wed, 29 Jul 2026 09:07:07 -0500
X-Gm-Features: AUfX_mwiRGtPxSNnFBSea-x0qqLP9Q9SD_5RU2rCzNqnBoXpjkML7G6TFOH4u-s
Message-ID: <CAOCHtYjeBV3JK+cJt2Acc7Q_s6r1Pox2JTkk6n5UuFG+HEwCAA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: ti: k3-am67a-beagley-ai: Add gpio line names
To: "David Lechner (TI)" <dlechner@baylibre.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_150739_847598_F5BB1BBF 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jul 28, 2026 at 2:45=E2=80=AFPM David Lechner (TI)
<dlechner@baylibre.com> wrote:
>
> Add gpio-line-names properties to the BeagleY-AI .dts so that gpios
> can be requested by the documented name on the 40-pin header (and a
> few other board functions).
>
> Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>

Acked-by: Robert Nelson <robertcnelson@gmail.com>

Regards,

--=20
Robert Nelson
https://rcn-ee.com/

