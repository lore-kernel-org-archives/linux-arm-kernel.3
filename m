Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F51AF46101
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 13:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4euLU3dzlJaKSg+W6fHDQOReg72+Z4efBvrwOXxb+0=; b=4qhzQzq3EzxYGc1fIiYh5P00N8
	xIxoZ3K4wavw59zf+6D7u8Mxj7H867Ehkz+dfuuHfjprVXLV8f1JjBDzFe5ccWcweb2XhKqOp5qhf
	jQGIxWBwki4mQV58fe9scNf17a8xKPb8WZbJ+YBKYgYjBFFcRQp8gFcUET1ORQWkaRk/A2xWiohpU
	EFj4iwTubi3hhTrBIXsCKsy8xceVdhAvoDvVYRf1rVInp3y1Ob2mVojynDgtnAFOEOdUfO5/7Z1U2
	hvJRSvrqSbHsa6DTJHonUQIMHDaDZFV1d42iXe4xPzBLOletcspqndjFpG7Ko0rhBaTPFfb592hOq
	fKnpSJxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fG7-0000000GoRS-2DCb;
	Mon, 23 Mar 2026 13:23:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fG5-0000000GoQz-2sic
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 13:23:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 242EC4401C
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 13:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 048B8C2BCB3
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 13:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774272233;
	bh=p4euLU3dzlJaKSg+W6fHDQOReg72+Z4efBvrwOXxb+0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e5HtEG+7Z0hUDOWD3lrZNo7a5ayfeIp4SuizcRE4uO+9EmsW6BKXHcDeifvaxe2rG
	 /ceh2tyMi5IQbD7GLa5h7LrgBy3Y8VacInQubtMZaeCLkxtliLIBn4nQGNwUOe/wBW
	 QbjfMaLR5sJXIU8YSZUO3SCti6TsRFNn4FiLOVdWtKVlTErmN0xUNv/9tkq88PPhTf
	 qssJrNQOt2HkVZyO8EvMkPR1qSjAZeNS8e6159kq2ha/5Iyvs43bh3AeN6D2/fXZU4
	 JHf64I8vwPYntE4oEO7/Bi25jM18wKuNtomZjGX6ciHWT02qSMeWrXH8R2oY8QYTFb
	 TJZQJ7uCmsVEQ==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79a60975dc5so1916787b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 06:23:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUN45ut00CK4ne7YpBj+BvFjkiyrnQnwPSJxHjBhqC0K/MmweADN8Yx6w+YalJnaNFwqm1V/FWMHfnnLaMpPU4j@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0V2vpExblIM7Tg4oU/CVkIX+ftt3F3CceDoo7HH54yKD/8+eH
	qv/tKN1rTbLJpWOLcnPVUxoRzNzpuCAJCh8NcS7sS9qQvc98BkdAYE62N50iZhVPOhEC7ps/W4s
	qOCPUlBSwb61uZdE4z8xjoqKwXoVVrlk=
X-Received: by 2002:a05:690c:2605:b0:798:1219:c78d with SMTP id
 00721157ae682-79a90c0a53emr125159107b3.50.1774272232374; Mon, 23 Mar 2026
 06:23:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260320-rc2-boot-hang-v6-0-74dca70dd60e@mmpsystems.pl>
In-Reply-To: <20260320-rc2-boot-hang-v6-0-74dca70dd60e@mmpsystems.pl>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Mar 2026 14:23:41 +0100
X-Gmail-Original-Message-ID: <CAD++jL=ztBrtMxaN3JohArsPm5sYaJ8=54v8VrCHyFRPOBsROQ@mail.gmail.com>
X-Gm-Features: AQROBzCnimvZvEKxbgJqnARSDh8ZkIJDbBTIcd5gmgSkLxqAgXbW8hAX9GtTaeY
Message-ID: <CAD++jL=ztBrtMxaN3JohArsPm5sYaJ8=54v8VrCHyFRPOBsROQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] fix gpiochip_lock_as_irq() failure when pinmux is unknown
To: michal.piekos@mmpsystems.pl
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_062353_760789_4FE8E4A8 
X-CRM114-Status: UNSURE (   7.11  )
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

Hi Michal,

this v6 patchset applied for fixes!

Yours,
Linus Walleij

