Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35BAD3942F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1SNxA2IdJIAQvNBrAHaZTbGLncC78QjdN2K/PuVhRE=; b=KJ3sd5XFFgKMNzFVZDYbRy/WLK
	UMYfXadSsQNTJYAGMHc0ebZC+9E1eC5/ENpFuB8jzXQlUcW5bxbs4E0NjvjBXMRWqbh1HfJOePqQA
	Hrd+iJc5e3NfWXQu5BXPWTMpzZm9+foKIc2mNmgWzOpbRjudDdKQjhNRK6H+EWbliojet7lQlqoL/
	EFY7UgY9vlkM7z0HABaRIfrlLCoq8wTjcQOwVJUPFqkCFYlcinZ6Pe+vaf+tF6V/2vEYYgSUuCS1D
	UienomDTPS8PcW1zXOIcHpzanAiZ8NpgaTjtrloubUnoEb7HDc7NlSqN3XrVYRHd5cX04Fuj4LOpo
	9WYrOEOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JLo-00000000NIL-348A;
	Thu, 02 Apr 2026 14:48:52 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JLm-00000000NHc-22IF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 14:48:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=N1SNxA2IdJIAQvNBrAHaZTbGLncC78QjdN2K/PuVhRE=; b=rMHvxoWlM+uejA3NiqMqiuF1t6
	dH1qT0uo1/cR6Dz9GPprsbtC9TfoS+6pl44lH3+gwrFr1/R1W2cORlZDXXbtz2pGCCcC2SX1g+muo
	mqRxTLJh7jAhYkPalAFwnSSmU5YXQUVFWVGF+SZHnES4qjy+ayFAVAE+r9IhvAaZurgdtQcbuysLM
	JrTqZEWFo2xdkFLupjvO8x0ot3AVrRgNO00IucaBzti7qDbtE566rSVyHqQz1vaslsBYM9bcKRpOV
	4kGCME+4w91t5U2NFARLx647e+ftRl4A5WlKLg9u2uuJbTHut0ojQCjo3qQo+WjpziwtAGJzEAb6r
	GbuYxOVw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57336)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w8JLh-000000004bC-1f0M;
	Thu, 02 Apr 2026 15:48:45 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w8JLf-000000005qE-3QcM;
	Thu, 02 Apr 2026 15:48:43 +0100
Date: Thu, 2 Apr 2026 15:48:43 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Julian Braha <julianbraha@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, manabian@gmail.com,
	davem@davemloft.net, peppe.cavallaro@st.com,
	alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] stmmac: cleanup dead dependencies on STMMAC_PLATFORM and
 STMMAC_ETH in Kconfig
Message-ID: <ac6By0rLzTm7R5HC@shell.armlinux.org.uk>
References: <20260331125817.117091-1-julianbraha@gmail.com>
 <20260401185814.45dfc444@kernel.org>
 <cec5001d-7ac7-4b21-a3d6-6052e1d8fc87@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cec5001d-7ac7-4b21-a3d6-6052e1d8fc87@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_074850_541936_B929112A 
X-CRM114-Status: UNSURE (   7.60  )
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

On Thu, Apr 02, 2026 at 03:47:24PM +0100, Julian Braha wrote:
> Whoops! You're right, good catch. Looks like I've been staring at too
> many 'depends on' lately...
> 
> I'll send out a v2 - thanks for reviewing Jakub!

Feel free to keep my r-b.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

