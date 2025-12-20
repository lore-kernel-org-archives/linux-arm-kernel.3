Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DFAE668AA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 02:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQzVZFVJ1ygwoAgm8WNTLMxDGxREtxfVMJzFVIdTl0s=; b=F1WPPtvRuVpEhBpdQSDIfji9NQ
	q2s/jDg2RrPusaUyUkusrb/yb2k2La4e9RtA/YNcEt3GZsmjBxMJ2RfDxJK62VPctXNjsoOxwM+iy
	lE2SBNlhF+6cY9zGP6z20/Z8fpv4wZqIrOarU6AKPmC/B5lG3SogveWI3ExYYs4MHxiZh8GmUwQte
	ddgjB2IN71XnuXL9aws2Q9AlgBNyDlKAkKiN9qKmYXIUzasLYoZ01Ut/2un4MLotwHMg/3O9AfeF1
	C+8zGuZSv6Z8bQYBx+MlBnw2jmeleDSP0+0DYJiuz7zRgFB+86+vTufId3MnGv9g2dj04JUYMDd07
	gQ//jXwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWmNE-0000000BCTx-2jXX;
	Sat, 20 Dec 2025 02:07:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWmND-0000000BCTr-3DqN
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 20 Dec 2025 02:07:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TQzVZFVJ1ygwoAgm8WNTLMxDGxREtxfVMJzFVIdTl0s=; b=DP503VIGuvYRCAEsNV3KK21xci
	3px0Ljl8tudoQFmA9fMqVAFdz7eH+wKQnr8UiBdG9eq+mAu0NUNq8BWufYSOVJJen2N4z5VB8bJf6
	+7mx2fkh+fMaUZ9Kvp/gpz9XA9i9bDKpzecxMpqUJy0JxFlaMj1oZds0YaNzubDEtG/FLqDPp53lm
	2XNf2UE0b6GwSCrOvK5ROUm2u9O2rKt5KjZ4fHC1dgDHkOzc8akVXsrXgRXvazQmTJW1CGvTHUciB
	S3BrDO3S64vvRfaecOcvRc7YX1c7KHyP3VZ+RjbuX6Ew2XHNZ1WCZ4IHAc6rF6aKW/1yhWTZD8i6s
	V2DKRVJg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWlVi-0000000Bvjk-09Ek
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 01:11:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B29D40A64;
	Sat, 20 Dec 2025 02:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11690C4CEF1;
	Sat, 20 Dec 2025 02:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766196421;
	bh=wEXvmEKyIFrnHKRquW8HLOdmbtTIV8EBnBes5n6SzFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pu1atnqPB+6Plnmla0u814Vr+bOstL6yGKPEBrVZReTYp0Sfg/2484wUdqfAeV+Zn
	 tNn3ftAEz3VwF/xX/KBdb2OZLjOZKZMaMajFcQEgy2AMROFRwIzXAoWOGcY8MSUZ6T
	 p3Up0w2hYUmqT0Sz9/OJHdJ0nfyb5cLIpfIDedJAwdpZf2CbM4+DURHn46yzdZZkCk
	 cb1rg6YdJUp3FRZvC5dwuB//UFZ9m3+YybaHpUFvxKHE3CXQWL6zQnUo0xR9o64aW1
	 GBbfs/ekwST6PPVlZ5r1x03UzcjM6WhV49J2VVjGfwO+DEKVx11Xk5WQhYDvDXvCOm
	 EBzeDyA1rjEuQ==
Date: Fri, 19 Dec 2025 20:06:59 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com, Peter Chen <peter.chen@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	linux-usb@vger.kernel.org, Marek Vasut <marex@denx.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Roger Quadros <rogerq@kernel.org>, linux-clk@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 4/6] dt-bindings: arm: fsl: add bindings for TQMa8x
Message-ID: <176619641876.374149.1170239999077862047.robh@kernel.org>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
 <20251218152058.1521806-5-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218152058.1521806-5-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_011154_450222_DF857D3E 
X-CRM114-Status: UNSURE (   9.27  )
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


On Thu, 18 Dec 2025 16:20:51 +0100, Alexander Stein wrote:
> TQMa8x is a SOM family using NXP i.MX8QM CPU family
> MBa8x is an evaluation mainboard for this SOM.
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


