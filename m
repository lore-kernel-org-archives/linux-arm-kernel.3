Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4FCD1951B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 01:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2YE5s1bijAQDZReq0VS5CSCfgItE0+kBRJAAhOXBkx4=; b=3BaEM8s24/Xk1h9UrLhKs54m/T
	9yr7GwxhuST9ZQFnGrkfy+dZR7VSlc5SDDDWXSMI2oR/2rMbWotvQom1a1Al9/1hcXmJC/GP5lHzt
	k6IdwGVUJ5msfn44krdC/7CQqHpS/h5q2unpOTj2pmt/WhV2cMbOFvX4jXEcUSf0aE3kSvpjaX0n4
	f95a0k6IdHzjl6bx5z4Ns7QAY3nWI1LO+xRShR+paV13XBE+vvqr3eeMhhicg18Bj5+QOLlLucMkv
	OADASBXIDyKDIUVQ8ZGEzplf89Q0X/PVLgewUlDTzX3vcx4JVm5bpseFwrwV0sPRqcSuHrhswvNzL
	C3rti8pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkXgh-0000000DQJS-43Gh;
	Tue, 27 Jan 2026 01:16:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkXgf-0000000DQJ4-18Jl;
	Tue, 27 Jan 2026 01:16:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8239440184;
	Tue, 27 Jan 2026 01:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8FBBC116C6;
	Tue, 27 Jan 2026 01:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769476568;
	bh=PWUrFDaZymwHGwAF/jInaMszPNXRgniP+HW2yijeOLU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dmxrjDsL4BXwTxbaXPruNdQTZilZ/Es6cUwSrTDI19LNLLlOVul/Eg/QnBdhGLH0V
	 1Y/GOeFtRavJcbwq3NjPxWKjX/zIteq4DJdVmSwFyw16zeyoGGO3WchvvWOWVHJTIt
	 clBGn5qiuEfaQzlx0itO79PSMDK0dHYIHcKUb99YwyQ6kKIKZ+t+E10aDKxoPVBUiF
	 WCGimFuhpZyqOdeiEEJurPrVRvuycnoiaw3KCN2VI0CMFFUSgGTCQjOObWQq5GZ5sn
	 MFYSdTzI6xhw5iR34dRNtCiAKypxeHHLd5tpbgRHvVj3diZJOlj+QpTTlk1/fD1VgI
	 Kvwol6/iDxGoQ==
Date: Mon, 26 Jan 2026 17:16:06 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Heiko
 Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org, Paolo
 Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 06/22] net: stmmac: rk: add SoC specific
 ->init() method
Message-ID: <20260126171606.6153aa1a@kernel.org>
In-Reply-To: <aXgN2UjiI_OxWHH-@shell.armlinux.org.uk>
References: <aXdTi4ViCkhhXvFI@shell.armlinux.org.uk>
	<E1vkL28-00000005usi-30YC@rmk-PC.armlinux.org.uk>
	<aXd7aSk7KIxlQd5z@shell.armlinux.org.uk>
	<20260126165144.25055591@kernel.org>
	<aXgN2UjiI_OxWHH-@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_171609_345090_5BCB443C 
X-CRM114-Status: GOOD (  18.03  )
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

On Tue, 27 Jan 2026 00:59:05 +0000 Russell King (Oracle) wrote:
> > > and there's no way to find out for about 9 hours (more like 19 hours
> > > for me because of the timezone) as the AI reviews are not accessible
> > > until then.  
> > 
> > The patchwork checks are for maintainers. If someone wants to build
> > a public CI for contributors that'd be great. We can even provide
> > funds from the netdev foundation. But let us be clear that the current
> > setup is until now maintained primarily by me for me on the weekends.
> > Unless you make an effort to actually help I don't think it is in good
> > taste to complain.  
> 
> This sounds like my contributions to netdev aren't valued, and if that's
> the case, I will stop.

Quite the opposite, what I'm saying is that your complaints make me
feel like the weekends spent on trying to make this project come out 
of stone age testing-wise are not appreciated. Of course your
contributions are appreciated.

The AI code reviews on existing buggy code are indeed very painful.
Not sure what we can do here to make the contributing easier.
It costs us around $2 now to review a single patch so we can't afford
public access. I think Google is working on making Gemini code reviews
public and free, hopefully that materializes.

