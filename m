Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336B6FC9EC0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 03:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cbNEIgiTNpmw85aI060/hsX9o2WihZMgdMJ7kcu6K+c=; b=3ySKVUA2K6CSTPRkSlEZawf+MY
	hYNoqmGTbTQlAjaTNP8qR+m1R2I2gOTjPH9+EmyIcmRT35366sQDtr7oVg+0o6XqB6vMrP2iyf8mS
	y6PgTHgyzMq2FMZqtHCbeOpLf8gvBZo5k6gn0MTgJtaNtpKk53to3VcdjudbYZfze8epUMi4vNQ0L
	qIW9zemRHuQ6yZB+y2f3Hm+fhniZGVhR8HEmkOoK+gEQPsi35dwFwie6DkKcL1y+9INNhdz5gkYLF
	sQCcIuAjrppyvPkKa8R6QqgcjtXcs1Ao28JKCBKvkIC5JzBvjFEG/6uM8xfqN8PppAR9wMBg74VVV
	2vf+hiZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyiA9-00000004qbk-11AX;
	Sat, 07 Mar 2026 03:17:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyiA6-00000004qbM-1y0g
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 03:17:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 56FBC40A2C;
	Sat,  7 Mar 2026 03:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6180AC19422;
	Sat,  7 Mar 2026 03:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772853425;
	bh=V0kw35rQpJ4oypB76t7tXjIf/03M4MzSXMI2cFpf1kc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uNfva24NHzWKGR4VboNMUOYDq/HhwJHot2Mijc6vfQ+b3odz0ocelbSp8emCQVxft
	 BndFmN2hw/Ge0CeoYsdpClQn+KPIpgpXWRwwCAwWSaPZbLm3UH1TkXObBnzPYH0Xbk
	 0duDoR409MzuooJCCAixpU1lOoDUxrWH0hDO0wU1SWEyUqnm18xdtaKFjG7t9ThXfC
	 TGv6uj0SRSJR6ripUChe6kAo6e/trsXLPvVigvVeLPVpfp8HtwprnbVxTHQATXjMO/
	 s/MHyrsvDPcINu/7Kr1X3ORKROeU900K3elKAmHbGJp3ed4b+vZI3Kx+oyzJXlzHrD
	 EbRmRNtYmwieQ==
Date: Fri, 6 Mar 2026 19:17:03 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: david.laight.linux@gmail.com
Cc: Johannes Zink <j.zink@pengutronix.de>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Alexis =?UTF-8?B?TG90aG9yw6k=?=
 <alexis.lothore@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Bartosz
 Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Gatien
 Chevallier <gatien.chevallier@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: Re: [PATCH net-next 1/1] net: stmac: actually error requests to
 change the auxiliary snapshot capture channel
Message-ID: <20260306191703.1b67087a@kernel.org>
In-Reply-To: <20260305104133.3101-1-david.laight.linux@gmail.com>
References: <20260305104133.3101-1-david.laight.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_191706_528921_722841F1 
X-CRM114-Status: UNSURE (   5.95  )
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

On Thu,  5 Mar 2026 10:41:33 +0000 david.laight.linux@gmail.com wrote:
> Subject: [PATCH net-next 1/1] net: stmac: actually error requests to change the auxiliary snapshot capture channel

please fix the typo in the subject (stmmac) and CC PTP maintainers and
reviewers

