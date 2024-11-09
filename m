Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C918FD5E379
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 17:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TMDsyqDQ0pHvp2k1/uQnLMixLG+oX5cPjrDKtufuaPE=; b=KxnEYh3Yr8TSSrJD+h6mDGQZr1
	n7L8MENxzXklWr9kDfb5cpg2QRdKAv3JaZ9Jdit1m7jwAjzE+5Ee1YIftS/zA8g1ppJg8sgPoQCzv
	R2lPGfxNKpRmCQPig6RvwXPWO0+jlTRHLfbjxeALEjlRkWaakvXclEAO/QSwNosFkp+ZObdBG7Sgy
	+WOIDB8rJ1sLxvYyUOTh/roPxdnJ3BtMyrGY9QnBNcY9G/tLhdw4r6RqhuekIzQ0bHPnm3s9VqDYo
	IhLzcfsbfP7CLnm8hPnShOwaMIf2NuLcjHGx6BtbKKcB4jhs0p4Cc6e72nlIdr8gFgpteyeLi9ySP
	2VHIoJbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9p7P-0000000DiMG-0Dm7;
	Sat, 09 Nov 2024 17:19:27 +0000
Received: from thales.epochal.quest ([51.222.15.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9p5d-0000000DiFV-1LoB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 17:17:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1731172654;
	bh=TMDsyqDQ0pHvp2k1/uQnLMixLG+oX5cPjrDKtufuaPE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bTOFOFM+V+Vjnfh6JFW/4AI7emhyGc9yKxXwgL9v2C0SAPbobCZRpCWvbK8jAh0CG
	 JgnaQDy0f7JnKDvq6owZa9n5GlgsmwAzliEyWdIdYyLSjf3gO4WNWq8F+Fcckpr7Em
	 i58rutDcD6To0pOmyWxVyOwb2wb7E7QyziVBOUlYhV6OG2z7JBoAscQV/0Br2bJTRt
	 +ajvY6ebHAU1/Ir+cl1zFhAhBI1JRdcTTPiSPBI+gXyYQc15Eu5+t4/+jW0E/M4/C6
	 ZitB/n6phl+HjeGfBtUB/9O7nAWF4r+3KDVB0rOxfXtnM0KaQE++9+ZMh2qevj8A01
	 vYouC3PadruzQ==
X-Virus-Scanned: by epochal.quest
MIME-Version: 1.0
Date: Sat, 09 Nov 2024 13:17:32 -0400
From: Cody Eksal <masterr3c0rd@epochal.quest>
To: wens@csie.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, Rob
 Herring <robh@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Parthiban <parthiban@linumiz.com>, Andre
 Przywara <andre.przywara@arm.com>, stable@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: a100: enable MMC clock reparenting
In-Reply-To: <CAGb2v663xMyiEx4BpPkuRew9t8fAgbz6EENEj--8Y57E87Lgcg@mail.gmail.com>
References: <20241109003739.3440904-1-masterr3c0rd@epochal.quest>
 <CAGb2v663xMyiEx4BpPkuRew9t8fAgbz6EENEj--8Y57E87Lgcg@mail.gmail.com>
Message-ID: <ad31f44044d56dda935698012c0dd595@epochal.quest>
X-Sender: masterr3c0rd@epochal.quest
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_091737_471476_171A828C 
X-CRM114-Status: UNSURE (   7.13  )
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

On 2024/11/09 12:02 pm, Chen-Yu Tsai wrote:
> You should still keep the version number from the original series if
> resending or increment it if changes were made.
Noted, sorry; still getting used to LKML norms. Since I was resubmitting just
this patch for stable, I wasn't sure what the norms were.

The contents of the patch are unchanged from my series; the only modifications
made were modifying the commit message and adding stable tags.

Thanks!
- Cody
>
> ChenYu

