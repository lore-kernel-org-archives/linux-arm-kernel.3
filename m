Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD25EC44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 12:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BW7OEygY66DEhI2gw8GlDcm88r50fl2ii7fNHg4fiQg=; b=yZNHdbRZn4tQ5wSbi7gJAuj43H
	gG0pRdyo9q6BF684xYLZo7NqUonbL+M8tWAFEKQzLZoDR3ryoHUIM/Nl4KktloOadwVt8fOsmZCgW
	fzD06oancKIx7/2QNqlH7oXqIGg+IHA2rNaHb4ABsxTrW2yiC/0WJw6EXKzJ38+45DW6yfERI8gah
	lD+9XqoS2Sc46TqlJlTJ7DwSYoQ8c4Mzu5PjpnYji3ptCyrZDRFQj3QVakIZzH/di8AA+DwwXhOSM
	jKDYM8CQq4TfAZhZjAQ1V3+nnuI3DR5wQobJXKjOjnZdcmH/A/XkRQYUnbnsahQxJoZT/fpuqEeav
	f3+7AxlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVvB-0000000Bk55-11V1;
	Wed, 22 Jul 2026 12:19:33 +0000
Received: from m101-out-mua-6.websupport.se ([109.235.175.106])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVv8-0000000BjU5-1qBH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 12:19:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=palvencia.se;
	s=mail; t=1784722636;
	bh=BW7OEygY66DEhI2gw8GlDcm88r50fl2ii7fNHg4fiQg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PZGxsJNnB+OFXdwYg3vSq7H0PZ9wkf8d+wjSIewLXQec5tpvQFZZav/DKzKbQJOBJ
	 yyWvCk6eIzphNAoON7RMUI/Hqka9xZ8MUfGOzCsqA46Xzw7H6s/mhotFsbrEFOixtR
	 39veTDQzlVvjiFTbwFcYOjHyMQoaKykqKE9W1hlQK7GCX+Bla9xHOR81YZBawzXEad
	 UvEEu5WVxt+ZqB2QoovzSydsb8nwalEEij+vthmwWPECLN/oiQZxBQHQF/HnwpIuSK
	 r7+lxUhsZDZdD6l77nW8aIyt7NrCMQ2XvsN9cxQoIYtIzRcfZgERrErj+4GI60cF95
	 Po0jzOFFPtQ4w==
Received: from m101-u7-ing.websupport.se (unknown [10.30.7.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by m101-out-mua-6.websupport.se (Postfix) with ESMTPS id 4h4tY85C6mz1qYv;
	Wed, 22 Jul 2026 14:17:16 +0200 (CEST)
X-Authenticated-Sender: per@palvencia.se
Authentication-Results: m101-u7-ing.websupport.se;
	auth=pass smtp.auth=per@palvencia.se smtp.mailfrom=per@palvencia.se
Received: from rpi (unknown [193.180.91.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: per@palvencia.se)
	by m101-u7-ing.websupport.se (Postfix) with ESMTPSA id 4h4tY621RkzqHv;
	Wed, 22 Jul 2026 14:17:14 +0200 (CEST)
Date: Wed, 22 Jul 2026 14:17:00 +0200
From: Per Larsson <per@palvencia.se>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sunxi: A523: fix voltage withstand encoding
Message-ID: <20260722141700.7fe240f1@rpi>
In-Reply-To: <20260721223956.13665-1-andre.przywara@arm.com>
References: <20260721223956.13665-1-andre.przywara@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Out-Spamd-Result: default: False [1.90 / 1000.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[dt];
	RCVD_COUNT_ZERO(0.00)[0];
	BAYES_HAM(0.00)[41.58%];
	ASN(0.00)[asn:35790, ipnet:193.180.91.0/24, country:SE];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_X_AS(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev]
X-Out-Rspamd-Queue-Id: 4h4tY621RkzqHv
X-Out-Rspamd-Server: m101-rspamd-out-5
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-purgate-size: 1114
X-purgate-ID: 155908::1784722636-3C7051C6-336E3020/0/0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_051930_767042_74DAAAEE 
X-CRM114-Status: GOOD (  16.45  )
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

On Wed, 22 Jul 2026 00:39:56 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> The Allwinner A523 uses the same GPIO voltage "withstand" programming
> (setting the input level voltage thresholds) as the previous SoCs, but
> for some odd reason inverts the encoding of 1.8V vs. 3.3V.
> 
> Add a new bias voltage type to note this difference, and select it for
> the A523. At the same time also use the newer "CTL" version, which in
> addition allows to turn off the withstand programming for I/O voltages
> other than exact 1.8V or 3.3V (for instance for 2.5V sometimes used
> for Ethernet PHYs). The A523 has that enable register, but didn't use
> it so far.
> 
> This fixes eMMC and reportedly Ethernet operation on some A523 boards.
> 
> Fixes: 648be4cd9517 ("pinctrl: sunxi: Add support for the Allwinner
> A523") Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---

I'd say this looks like the correct fix. With this (and removing
the incorrect voltage bump "fix") the eMMC on my X96QPro+ works.
Not seeing any regressions, so

Tested-by: Per Larsson <per@palvencia.se>

