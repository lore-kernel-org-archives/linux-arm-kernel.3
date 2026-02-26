Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1AEFD9E13
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 21:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lYcfFZkednrYiZw48JQ5YW4yz9I8kADvaQm8u3bDPig=; b=GfpxH9Y78Lxa+yK9TW4aYKXGnx
	o3/+gs6dLIsR8tCGrfRT9j3HNJ+4xxVQzjbAWDCNhSrybRW3y/WfXCr1zAgTafWrZYsrUmjAs4apF
	Z6Tah90kbyenOjv98HZSQ3LO8yI3hoQ1BsWevx8Ivvy1CGu7T6Tkyq/RWzRHKWGgQo87ljIEOpof9
	EZBgEQF5DUIVUh9CILmnBXxtZv2uDRuiWipg6DKAh5xQik6yArZBuNNhtEUrVwmGdEVdzL2GdwrId
	nA3oH697+HGkxl7lAr03sh5zJ7mlParG/3wYKtp5V1UdPJPxv3uRjEC1NwFBT1pY5ElN1ZYvtBfdW
	KnLhE3nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvigT-00000007D6I-2mjk;
	Thu, 26 Feb 2026 21:14:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvigR-00000007D5r-44DW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 21:14:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A49E41B1C;
	Thu, 26 Feb 2026 21:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD30DC116C6;
	Thu, 26 Feb 2026 21:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772140447;
	bh=p+nQrqubGpHurZZtPn/aeXXk5EP9EA2Ye/VBiS7O1B4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IiBoyLAJL/7A6Efk4sZ/y12JwNyLCShAKaVtiZgkMf5gBJ9vWuKVuTXsS1ZF5xvi3
	 saumJkI6E4CstJQiu+gEeOw6DA3YiXHUfXui3fKuX9qi6iG7yt3Z/S1poo0bJXrnXs
	 /LaBC2rWj+xdMrHKVBLbfV6ZNU5UzjSOAAWSPX+OHPhlB7Z1glEkEMDEaaaRJNA2Gc
	 2b4J8Q1FdICKtea8990pQk4OwfojD0OKO+ol0uWLUNKR9z3ImwrsX3ZCFwc8Wv0klx
	 xWd8BaTPqd4p/JqwtQN/WfvMw7wbcqlYsDGSQYOZNIwy3pdGD1tMFWXK56TmKAt+5l
	 ln+Ch/diVv5eg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Lukas Timmermann <linux@timmermann.space>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Alexandre Marquet <tb@a-marquet.fr>, 
 Henrik Grimler <henrik@grimler.se>
In-Reply-To: <20260127-lat3st-staging-v4-3-797469aaaf9d@timmermann.space>
References: <20260127-lat3st-staging-v4-0-797469aaaf9d@timmermann.space>
 <20260127-lat3st-staging-v4-3-797469aaaf9d@timmermann.space>
Subject: Re: (subset) [PATCH v4 3/3] ARM: samsung: exynos5250: Allow CPU1
 to boot
Message-Id: <177214044450.341643.10542668846868518849.b4-ty@kernel.org>
Date: Thu, 26 Feb 2026 22:14:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_131408_029815_DCB86C1F 
X-CRM114-Status: UNSURE (   9.04  )
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


On Tue, 27 Jan 2026 21:40:58 +0100, Lukas Timmermann wrote:
> The firmware trustzone needs a special call to bring up the secondary
> cpu core on the Manta board. This seems to be not needed on other
> exynos5 boards and comes down to the available firmware on
> a particular board.
> 
> 

Applied, thanks!

[3/3] ARM: samsung: exynos5250: Allow CPU1 to boot
      https://git.kernel.org/krzk/linux/c/32d4b991f25eeffac7568ef51367f924394fbdc5

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


