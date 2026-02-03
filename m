Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6FEE8B37E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 23:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q95FEOqKEJlFrNQSBcQo7D6IdYS6YFx230wGHstnn1o=; b=qCUVjAvAR8LAxONNLvz7t1B4wp
	MbC2gK1arSpzF+OOnl7V96aIpOfo/onB2xHIeSVoAhEyAED0Ub/hJeUMT6RX0a2xp25qmkjf5ASc0
	ZPjQyvVAMi2vBvnD9lqTFGpBWTY5kf2kaHPXuX12sTIS/dTdWOn3zX1PbPCc1zvVT2MsSWt5TP8zh
	L1+8EDRM/hFBLoP0M/AeqKq6WZsyDoVS8jpZuspPMdJKPl5LDB1Moc1ZdWHqNG66BTBXzqsFKVvUt
	2obLI6n/7qNVkUrk3CMrwtbhbv3kbGTxbwDJdX3PXfSnHzHStb5PFjiVDe5wuNjBKLOsdMYSF4iK7
	/HLimDTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnPuz-00000007ZNV-3ncY;
	Tue, 03 Feb 2026 23:34:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnPuy-00000007ZN8-3i5t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 23:34:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE1B46013A
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Feb 2026 23:34:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F198C19425
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Feb 2026 23:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770161687;
	bh=H3N6t3iT+lRw2Y3wcq0juSNfNc3ZLSsvKLjYx4BlJTM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nqtchg46hJV6r1bQFLQT7aBrl24yYiUpMB5HgW9eCGF1JT/AyvItPIfcJRJxTC4A5
	 C0CcRJov/r6C6UdEbHNQ+0GBUxZ/Kc99tCry5UO6nlDXm93PLJuMrp9ZRf1/0x2djE
	 Uz9k49tDAjcnFpbt4vytBBRSxC2xDZmqx1YopK8OfLlbl8Uvd5Q078y1oa5RFDwncv
	 Dt2ASczc/ILf0ZN6ez/txaG+HUebwqPiQcsiUZbriRUAQT8ePpOXFLIY7eb9HZ8HYJ
	 54ISvN7+WcYtIrd9jA/MU/1iPGmvL4IHhm4Dp721CEaVKZlP6QUKKrx7EKwsPwzZ7C
	 VyiMFb+TvNTKQ==
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-649523de905so547225d50.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 15:34:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXN+QO2i1ZeMygZTd1NBlYSppRm843G5YGdRN8jAukf+1jN151xaylrzI42Hkeob1Nawl1EfHT/HYl0rWSSFR15@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7mUVSZZGTXk0Dx4qsyHuiRaWRvJcyBf1CiomehHW4ZIAokDob
	+EvPoVQYyD2kzxUoa3Rc+fdLfEyxhtMEfmbnygXbnRpyapKWavnJgKqrZPpj2/HDIkiHZWumULx
	bO9Iaz64vxlJmq57e/6TlABJInYdgtqU=
X-Received: by 2002:a05:690e:dce:b0:649:ba22:58d0 with SMTP id
 956f58d0204a3-649dbec902amr1077376d50.29.1770161687019; Tue, 03 Feb 2026
 15:34:47 -0800 (PST)
MIME-Version: 1.0
References: <20260203-craftsman-battered-3491ff68f462@spud>
In-Reply-To: <20260203-craftsman-battered-3491ff68f462@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Feb 2026 00:34:36 +0100
X-Gmail-Original-Message-ID: <CAD++jLn8WOobPaoSrMLitFgFZc_6CH9BQbRy_Gdqq3BLhDXWQg@mail.gmail.com>
X-Gm-Features: AZwV_Qi7lxnWnjXussICca0lyIFaqwLa7DfHaZmiOVa6EJi8C3uLkn3H5EkvZDE
Message-ID: <CAD++jLn8WOobPaoSrMLitFgFZc_6CH9BQbRy_Gdqq3BLhDXWQg@mail.gmail.com>
Subject: Re: [RFC] pinctrl: pinconf-generic: move ..dt_node_to_map_pinmux() to
 amlogic-am4 driver
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

On Tue, Feb 3, 2026 at 5:17=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:

> From: Conor Dooley <conor.dooley@microchip.com>
>
> pinconf_generic_dt_node_to_map_pinmux() is not actually a generic
> function, and really belongs in the amlogic-am4 driver. There are three
> reasons why.
(...)
> The other dt_node_to_map implementations accept a being called for
> either a node containing pin configuration properties or a node
> containing child nodes that each contain the configuration properties.
> IOW, they support the following two devicetree configurations:
>
> | cfg {
> |       label: group {
> |               pinmux =3D <asjhdasjhlajskd>;
> |               config-item1;
> |       };
> | };
>
> | label: cfg {
> |       group1 {
> |               pinmux =3D <dsjhlfka>;
> |               config-item2;
> |       };
> |       group2 {
> |               pinmux =3D <lsdjhaf>;
> |               config-item1;
> |       };
> | };
>
> pinconf_generic_dt_node_to_map_pinmux() only supports the latter.

This alone is a good reason to apply the patch.

I have a strong urge to apply this already for v7.0 despite its RFC state.

Anyone against?

Yours,
Linus Walleij

