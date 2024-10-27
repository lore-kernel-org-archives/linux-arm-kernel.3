Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E94D13585
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 20:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S8MMBpRyWguzB6I6ZQ4pEqDoklRnmZ9DbCxasDWvdNE=; b=F/ELUaUjNNUD5LG858WiBPZk0j
	jXdVKOUYdzuhgMZ6vRo8iU5cnJMrLc31yrQ9jO9ce1xLC8J2mY7jNAadISkgaww9IQ3nLxQydB+Zu
	OiusE1oYsqKt4mQvH7Vjlbc+s5gVJ5FQXxUJCHzkuKycPC55CHTuNqf0S+tArbXUr2kc6KRzFgY+S
	N7w4dDrKlQYvEk2/m2DIdxQOgkuzOgzXwbRy1oxZk0Z9HVhr5FWCa4gskQzpVkUP14zlHHkcYd8Kp
	yL8OGSFHXl2aiYOdfncgUkVkcR9LNnK+dXPhWUxHiRindifH0LDXRPS6XudxkUY1+7Rr4fRffjPA4
	Dn7B82LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5A91-00000008sLR-0j1t;
	Sun, 27 Oct 2024 20:45:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5A6b-00000008rzW-2YRk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 20:43:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7F05CA4139C;
	Sun, 27 Oct 2024 20:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51DB9C4CEC3;
	Sun, 27 Oct 2024 20:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730061800;
	bh=qvujWRAqdpKJn304U7F5jeDAVb+FedOCfe/qiEKOYTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GQ7XnWoFLsKwXIdsVWpeNEua6b7zNYi8q+Ferq/6ckQ7pnWD/E0KLmXwzGWVihUwU
	 JKlSjOC32M/g8Kwqgi5Mm+v7OoyfIadYdlLzs6d8if8xXvwjTl+bub2X0aKr9m0jSF
	 Uj9dG0Z20+lpisHeSTLqiE/e9iCqTHc45uYkhgDBUig+oQU4lIPAHnb2FfdjEITbcw
	 dFpm8Azg35ZUO+M0FH2MOaEfT/toHBXEWTE5cBh9UpT8MnHacQAH/RUf4L45kZL2fi
	 HNYuS7FGibaqWP7KJcorc+NKsAd9WqMWF8ooZIO5e6Xmo1jGb2hMlmw6HMWHClV1RS
	 ho/a9qwQmMjWQ==
Date: Sun, 27 Oct 2024 21:43:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?Q3PDs2vDoXMs?= Bence <csokas.bence@prolan.hu>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Mesih Kilinc <mesihkilinc@gmail.com>, Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 02/10] dma-engine: sun4i: Add has_reset option to quirk
Message-ID: <dsuadjqzybikpnuyr7q2fbq5jdzev33rqqhnehh3ns2lgfvdlb@bdmib46vlxt3>
References: <4b614d6c-6b46-438a-b5c3-de1e69f0feb8@prolan.hu>
 <20241027180903.2035820-2-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241027180903.2035820-2-csokas.bence@prolan.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_134321_736433_37CBF197 
X-CRM114-Status: GOOD (  11.14  )
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

On Sun, Oct 27, 2024 at 07:08:55PM +0100, Cs=C3=B3k=C3=A1s, Bence wrote:
> From: Mesih Kilinc <mesihkilinc@gmail.com>
>=20
> Allwinner suniv F1C100s has a reset bit for DMA in CCU. Sun4i do not
> has this bit but in order to support suniv we need to add it. So add
> support for reset bit.
>=20
> Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
> [ csokas.bence: Rebased and addressed comments ]
> Signed-off-by: Cs=C3=B3k=C3=A1s, Bence <csokas.bence@prolan.hu>
> ---
>=20
> Notes:
>     Changes in v2:
>     * Call reset_control_deassert() unconditionally, as it supports optio=
nal resets
>     * Use dev_err_probe()
>     * Whitespace
>     Changes in v3:
>     * More dev_err_probe()

You did not build v2. Then you send v3... which you also did not build.

Please start at least compiling your own code. Then start testing it,
but without building it cannot obviously be even tested.

Best regards,
Krzysztof


