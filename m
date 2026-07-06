Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B05C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 14:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37+4q7COOhXJEW+gXuemdFa5O7sFCIJzgfNUlkoW+l8=; b=TJZA+8R1WVYhZwFyPA2wS4Bh5j
	shf2bVEBQ9n+jbbGTMq+UuUH9Vr8Fqw5HR6CWGmv2X5ShHSeQcVx3kG8NunvT9AS00u9ZPzeR/k2/
	WI/G641TJWoWuFv7RXpdlWFf656OU+k3D6ZyZavEkkzUFiRTNhobZ6VOMn82RBoTmo6Zg3PKe/Nof
	kXOv/uKk3cSC6B8sPpd0hwE4z6vk0FQ1B2VWyMypXk00M2pR7gRQXEA1htVx7eWO1W0VW8lk4x3JA
	56bvDYvBGQHVnNdVX963D+BCyfx5+XkjCBNA7rZilReNKAIkFS6rWB6gEmDstxp2b89OTSf1ig8pY
	R5Osh5/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgk2h-0000000Ch6c-2A6H;
	Mon, 06 Jul 2026 14:11:27 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgk2f-0000000Ch6A-04wo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 14:11:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3F0FD1A0E95;
	Mon,  6 Jul 2026 14:11:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 093DD601A2;
	Mon,  6 Jul 2026 14:11:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 702DA11BBA4EC;
	Mon,  6 Jul 2026 16:11:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783347081; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=37+4q7COOhXJEW+gXuemdFa5O7sFCIJzgfNUlkoW+l8=;
	b=LyHjOFnP41JECW6ndU1QxZDuK/Xnq0yE+IfSIR9YL3JX3IkRw9d4z+Pf9+wWFBVVsBeZ89
	izKa/IfvGTxTrfNd9HUnUHJH8oWQfpV6qngk44s59M+9KyFQddMyxL7DXhixY43HbN5bbp
	PD9BatHpbG+b78I/ykLupTRjufQa4rSh3/W7KaPvQT+la+nqYxYHf8vzQlrYSb1aJeivBN
	PUQBNJyVLf77rPN2ijoHe2NpQ5BS24Ug+u+Dy2p8w1DtAl8nbBTezc5a87TXPiYVjI7uoJ
	MjjWmP+LKEbLM2VHl/N+6GmLq48cELxwckPzjqWI5aF4a7tuHmxNTSycFD/kUg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org,  "Rafael J. Wysocki" <rafael@kernel.org>,
  Daniel Lezcano <daniel.lezcano@kernel.org>,  Zhang Rui
 <rui.zhang@intel.com>,  Lukasz Luba <lukasz.luba@arm.com>,  Vasily
 Khoruzhick <anarsoul@gmail.com>,  Yangtao Li <tiny.windzz@gmail.com>,
  Chen-Yu Tsai <wens@kernel.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
  linux-pm@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] thermal: remove unneeded 'fast_io' parameter in
 regmap_config
In-Reply-To: <20260705164311.2273-2-wsa+renesas@sang-engineering.com> (Wolfram
	Sang's message of "Sun, 5 Jul 2026 18:43:12 +0200")
References: <20260705164311.2273-2-wsa+renesas@sang-engineering.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 06 Jul 2026 16:11:18 +0200
Message-ID: <87o6gkky2h.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_071125_199371_A6C325C3 
X-CRM114-Status: UNSURE (   6.03  )
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

Hello,

On 05/07/2026 at 18:43:12 +02, Wolfram Sang <wsa+renesas@sang-engineering.c=
om> wrote:

> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l

