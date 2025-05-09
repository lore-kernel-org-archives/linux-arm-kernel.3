Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C96C3ABCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 21:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSyySAF4j0iKqkU5qxmkvVHdf1lqlJa4ib6Tz/GhSWk=; b=OiR/UpJVHTVGXgy2bsHxs1dxIc
	5Lo74oV0i1KVcOuFwzz/S1sx7k5/0AqfN93F/rs5tdDR7038+3Z/tBalOzdxfQTXQS5nZ5FEN0wBm
	so7CL9vUfhnD1xmoBTXTTMNUo38hsymTqKSMpLzIp0KypybDTVUlEtw2KWgspS7frZrOKsbJuZ1ve
	8fQdiVqy8qlf4ZhTn5yzjxNJ+q4c+ceOtd+Yobyk3nO9gGLlA1gk8Yh1RCAk0+/dqdvW+t7DZp4ta
	/2QHdLRp+UngPT5zC84q6sqOgJqy1cccX09ZkRjRPat/vIs5itsq6BS5uhJsNJSOEkw6FfmMIBnNP
	EX148pXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUxh-00000004uc8-2Ts5;
	Fri, 09 May 2025 21:08:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDTVy-00000004gAE-1fRI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 19:36:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7A119A4D2F8;
	Fri,  9 May 2025 19:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC7BBC4CEE4;
	Fri,  9 May 2025 19:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746819369;
	bh=2wr73b/j+3h7jOVG9AtnBt3hTUmdy8M2hdaX+BsWRcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gvAKp9bv0AgWLH7iSUSO9ihmi7WU9Z1bJN6V5jo/LsF+m/Lb48pD22un9TgooryDf
	 MLlSlljtHnodVuOkAIufYZ/oYaoLjyuLEJguvu/IDiD9wiYqhVbsqoXnPLZ3yhQ83T
	 2rgwpN3Uqi2AqxunIakoBjHmmyUPyO3SM+YLRcuCrOCK08+qVXZifRBXD8MxDJDY5C
	 5Jz8aJoHV4e7p3/pmObraHdkbRttQFITyotyMmg+zy82k+hvjv9Dc+Phxg6PAedi83
	 eCiAZ55Sooc5JNUepHMlacNxJp9swkUKlFW1eVKptmvrZfEW526BZNXu4/QCEI29iD
	 QDZxb5mKofC3A==
Date: Fri, 9 May 2025 14:36:07 -0500
From: Rob Herring <robh@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
	manivannan.sadhasivam@linaro.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	mturquette@baylibre.com, sboyd@kernel.org, saravanak@google.com,
	p.zabel@pengutronix.de, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 3/8] of/irq: Export of_irq_count()
Message-ID: <20250509193607.GA4076274-robh@kernel.org>
References: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
 <20250430103236.3511989-4-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430103236.3511989-4-claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_123610_501449_8CFDF672 
X-CRM114-Status: GOOD (  10.81  )
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

On Wed, Apr 30, 2025 at 01:32:31PM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Export of_irq_count() to be able to use it in modules.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  drivers/of/irq.c | 1 +
>  1 file changed, 1 insertion(+)

Already have a similar patch pending.

Rob

[1] https://lore.kernel.org/all/20250331230034.806124-2-willmcvicker@google.com/

