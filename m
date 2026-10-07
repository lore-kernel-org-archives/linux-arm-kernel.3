Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32D0CA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 19:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vM4MEwdHs570z1trHR1waD0+VoMhgMGlPDSlu4CvcM=; b=3/s+gGg0J5wutL09cTXqxJ97Jz
	VV9wArvJdLrAURNuDcIqtA8HLMSRV/tOFE7jHUmsWymoSFRj5qcSQb61L9ugXItVfYu5a6BWdDpp1
	kSR2zvWb0S8p0+P+Bc2srF69NtvmbOcd7CjCk/nCnG4oto4VCHkSQbQhdvvxxcK9Xapy+2mJVNKlX
	J1SN5rbUmq5DXB9hc0POqlmwEJSIJCmJMXYtXiEH/ESZ2l82yYwVO7ko41WUzvbNc1HT2hjhsMPDb
	VgTHD2o8f463Ae2FdwsO8Iv/PiFl/kvos1ZWRzXK2l5nHZsNqLen2+kZLcfFiT41yO192HVcqXaTD
	hMVT55+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEXP8-000000032hL-2Z24;
	Wed, 07 Oct 2026 19:34:18 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEXP5-000000032gp-2Ty7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 19:34:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2vM4MEwdHs570z1trHR1waD0+VoMhgMGlPDSlu4CvcM=; b=DbS60WIGzG3WiDfzoqQEcENQmb
	bevs6cpS5TOuX+NfNXHngSavpXHo+JHSjIC5Tg2lXeYBbOJFVPiAOYEcwm+RrI9OiiiqJBMQEniJQ
	gmKrEO+aAiHUzjTJUnemKPvkfQg4bIGRnUWs/eH0KcABlYn/H2FRBJ0FGl6mLY5JjSl8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xEXOt-009VZv-PH; Wed, 07 Oct 2026 21:34:03 +0200
Date: Wed, 7 Oct 2026 21:34:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev-bot+sinfo@kernel.org,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: stmmac: unwind the WoL IRQ after a safety
 IRQ request failure
Message-ID: <8cd651e5-d240-4663-8361-c3b939d664e9@lunn.ch>
References: <179127056620.2231598.8882282421523696709@kernel.org>
 <CADvTj4orth=RYtb78ND1rdiYh2yb6d+TjZt5ohK_-+1mnVpqfQ@mail.gmail.com>
 <20261006155214.63c5cb5b@kernel.org>
 <CADvTj4obBNgR4w3BW4-gCU-=LUxesQdTRN=EdWTcx7VznFi4kA@mail.gmail.com>
 <e7fea95d-1ce2-4c5a-891d-5e5899931329@lunn.ch>
 <CADvTj4pm8fbgGDiyXVHubnM93qOey7o18O+MDU68MSisXVvHtw@mail.gmail.com>
 <f304ee6d-bbc2-4f76-964a-998c3febb8dc@lunn.ch>
 <CADvTj4pniuLUzsHP_kv03rFUkUD87PD9yVZ=HnW0CsZX78OxLQ@mail.gmail.com>
 <98a7f952-37cd-4886-acb2-e87743e51fba@lunn.ch>
 <CADvTj4ozfxA3E13g5sV2tPogDk=S+VOyf_PAXZVQyaozoe3O0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADvTj4ozfxA3E13g5sV2tPogDk=S+VOyf_PAXZVQyaozoe3O0w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_123415_650147_A8988110 
X-CRM114-Status: UNSURE (   7.19  )
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

> Should I re-spin this on net-next with the fixes tag dropped? Or does
> this apply as-is on net-next?

You should respin.

We get hundreds of patches a day. Maintainers have no time to see if
is applies cleanly, compiles and passes basic smoke tests on hardware.

   Andrew

