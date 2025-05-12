Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0721C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 12:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJUy7lLmXYcF7E6mCCr7BGqQ9L4GgJNGI82AWY3FskM=; b=ztamtrVymPnO5DmdStJeMZuE2S
	dF35h/VDV0sH2WTgmnx6ad8Z4jAoEsvjBhKMlv6gaIHQLcqKbjZIIBwT5SRzHnNQ8b6qZLxjaQaug
	l1H8w3bNsZvupZ9qPkJNyTfQqhSlw66nJf9xqM3Y2FjDVd9CcXOrj+s9YJfkY+xkrXroemBXFOFMv
	ApHeIlL3wRAdRZyzXSHnW+yDueSMiucUml021GI1n1NtveBqjqdiwFcEmFskKY8JV7ijm/I3wGPiK
	Z0o1irGRDitpi9F/PQ/K5WI1j+OpAKmPFYRcc28pdFsfXLSnDLLsxTi/QJ1CP6EE+LMpPlrI3Zj22
	LreROX/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESi2-00000009Scb-2gz2;
	Mon, 12 May 2025 12:56:42 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESHj-00000009Niu-3ql5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 12:29:33 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-54fcffd6b9dso1873462e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 05:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747052970; x=1747657770; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJUy7lLmXYcF7E6mCCr7BGqQ9L4GgJNGI82AWY3FskM=;
        b=KEy6Hes6iGuZCU2t65htA8a1Z/OjTbfFTFn4/ewBVXgWj1/iq0BT4KgGlEq5c52B86
         lDgO9MdGLMyJ44psypmNBZmkxB887Ta1CT9vftEAnTQKtQQJ/OaTVYpFwnUzYtXF6Wxp
         Xi8hlRHwMhgu477lObAo6zkKdKWfgwBNfqqOXf2DvjhNeBauaXVSe+sjToGh+Vu9oEtd
         +LofKQhrnRLAypD9sL0dItjrrqMb7qKh4tFO0x4LanerRkVV73XlTfVsP8bhoQsn6Kbn
         Jc/deEfneQUMTFuToP53d7p++OZ0AKkZIgrk5q+UiF0aGd1HUZCUZTrn56Wn5dO1xh4q
         QQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747052970; x=1747657770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJUy7lLmXYcF7E6mCCr7BGqQ9L4GgJNGI82AWY3FskM=;
        b=hRzTbtgHtkDKVvXD30KGTeveGk4e6sqNvki2rjl4KtEo7ebzHzWu/aM9WKOswC+eG5
         dQTHKZOG29bnn4eYmcalVDc/LG1+Oy9gSIW2pLjfHnil5VItNhXr7G7fUK0w4raLWy+n
         nDD7n/rtiQko8dqjTeWi0cRZuuxdT7Kqv6aD/HTIXpwiWZ728kc1dxOIOkVFKJe9jR2X
         J3R/AjsUYhM9YT6LaPP+BDqh6sv4/rGlg1UKf/hCqyIY093yOYAYcfbPeI+ugNAJcJTX
         A+513IEmWRjR7+rQjNWvH4akmMZ+gBfTMiwj2GjSJspLKhd/o6208e+GtE+kEfbC6JbK
         m3Yg==
X-Forwarded-Encrypted: i=1; AJvYcCXn0c4hcqb8j5b+kPzn5S382TzQrg7NTzohSWr0IOWwTteBANTM2pjbx/LqjNZVpHMOreGtdpzXthcSxIDSJBC4@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7O30adlo3Ga+pKuwDDh+33qyVT00tF52PZhoofcwegWB9OqLt
	qyaLnYIPa7g+MLci6WICUpGHHKqF0kKzWkiEu5JyPcgYo2Ct1p2n56w7hWTtG7wSLLu2DGA9BX6
	WnWCLWqWYmWmDxzfQEBEc+MhbEPbcXuJgy6tfQg==
X-Gm-Gg: ASbGncsmXzvX7y3DERUoH1QW5leVNs6DtuxweSiKWCt2R2GsEIl0fGaGSRlCBdO47ve
	QdsE1/zNVBZ0g2Wno+bYqJZRinznr2q0WAP569dC5TwRHQEFm/U/UAShIZznpOQ0IGvKkE1BgcD
	Tuq39fEUvFV3LyUGHf5zqMdfEJ7OI9U+1WSQ7P81nFZIw=
X-Google-Smtp-Source: AGHT+IH5teHFpZT2DOrcAB+txD7/G79w+37iktbttp2yohMQWhCCqnOPjEwdESmtjygl2sxgr8fUwJazQYzfyOJpzag=
X-Received: by 2002:a05:6512:6816:b0:549:5c5f:c0c0 with SMTP id
 2adb3069b0e04-54fc67e28e2mr4791732e87.41.1747052969843; Mon, 12 May 2025
 05:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250508211043.3388702-1-vladimir.oltean@nxp.com>
In-Reply-To: <20250508211043.3388702-1-vladimir.oltean@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 12 May 2025 14:29:18 +0200
X-Gm-Features: AX0GCFuVB3OcEUGN1FzLQPrl4GJJ-z0JMr3VodsFOFwKqSoHqyxxq7JqSWnGH4k
Message-ID: <CACRpkdY58DH9O5g35Ai5PjE2gDSSbF1GodDNj94-xhPKfHURkw@mail.gmail.com>
Subject: Re: [PATCH net-next] net: ixp4xx_eth: convert to ndo_hwtstamp_get()
 and ndo_hwtstamp_set()
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, 
	linux-arm-kernel@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_052931_962447_29AED249 
X-CRM114-Status: GOOD (  18.60  )
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

On Thu, May 8, 2025 at 11:12=E2=80=AFPM Vladimir Oltean <vladimir.oltean@nx=
p.com> wrote:

> New timestamping API was introduced in commit 66f7223039c0 ("net: add
> NDOs for configuring hardware timestamping") from kernel v6.6. It is
> time to convert the intel ixp4xx ethernet driver to the new API, so that
> the ndo_eth_ioctl() path can be removed completely.
>
> hwtstamp_get() and hwtstamp_set() are only called if netif_running()
> when the code path is engaged through the legacy ioctl. As I don't
> want to make an unnecessary functional change which I can't test,
> preserve that restriction when going through the new operations.
>
> When cpu_is_ixp46x() is false, the execution of SIOCGHWTSTAMP and
> SIOCSHWTSTAMP falls through to phy_mii_ioctl(), which may process it in
> case of a timestamping PHY, or may return -EOPNOTSUPP. In the new API,
> the core handles timestamping PHYs directly and does not call the netdev
> driver, so just return -EOPNOTSUPP directly for equivalent logic.
>
> A gratuitous change I chose to do anyway is prefixing hwtstamp_get() and
> hwtstamp_set() with the driver name, ipx4xx. This reflects modern coding
> sensibilities, and we are touching the involved lines anyway.
>
> The remainder of eth_ioctl() is exactly equivalent to
> phy_do_ioctl_running(), so use that.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Overall looks good to me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

