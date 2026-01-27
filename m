Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FB9D2FED9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 18:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWEaRNjourAX4Er4GXNOVFDCOPNOZh6Kk+37EtEr8ug=; b=HXDpXfc3t4jC5Ah3k5XXCdYRaL
	pArNMF+YPnkCvF/aIWEfo+c6K5hSzwxrgnR3EWgOdqmmSttU6cE9XNxe/LSLH6L10iZMjgdkWvodH
	LLlhpR6kLr9+xp+IboBDf4tZO/lWL/fdaWc9g7VGqlcz9wocwal4ePA4phoRKudr44BeIALolhC6i
	xj9QmntF/pAxJjviLt04ImjJaYeVYcaZ0B1ef60xPHw2BiUxHI6634CMbK4QWLajbLCMaq6cbSzhJ
	SVE5qop8hlZgCa5u1GMtfpUfy8re2siepK+eEn7Npw4mba/sNSStlTQMgNqru+NOy642Hbp2Q44Sj
	skpgCPkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknxS-0000000Epj7-1cMm;
	Tue, 27 Jan 2026 18:38:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknxM-0000000EphQ-1fju;
	Tue, 27 Jan 2026 18:38:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A184E40A65;
	Tue, 27 Jan 2026 18:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2020C116C6;
	Tue, 27 Jan 2026 18:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769539107;
	bh=xnxW/CWgie/RiC6ceA36oB6xfFtPTb0OHKlujCG/RnU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=R5np0NK2ji0Bvsl4dkcDUf6Xv2tMqnpoJLp4Su5Tlndt1VH/kgo9IUEOMlFv3g9hf
	 NWV0vMSiUt0Ty/+U6OkCTNW7gPzsWU9IOwm4NP/q5gZJ4Esj35k51DOxS3iV4/uDUI
	 r0/gFI1VqGmeoEIcPLpLYMl6CMlt+j3gVMklN0OPTIDr57Yo8dQ/9w49avkrhqjMWe
	 XNqSSCWoK8aqFKZcnqXAHKFmUxbuT0758wx7jjFn63jK8Ko/tcSEWTYyh9Lj4B0l5P
	 lEjH0UyOmDHgFdhCsYpefGH9u4MZh4NhGRVvU6hty2mnsoQtj4rt0oK0ZJsPNFyc0I
	 aQrFGI9h1BMXQ==
Date: Tue, 27 Jan 2026 10:38:25 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 pabeni@redhat.com, linux-rockchip@lists.infradead.org, heiko@sntech.de,
 alexandre.torgue@foss.st.com, andrew@lunn.ch, davem@davemloft.net,
 edumazet@google.com
Subject: Re: [net-next,v2,06/22] net: stmmac: rk: add SoC specific ->init()
 method
Message-ID: <20260127103825.7fcc86e3@kernel.org>
In-Reply-To: <aXjq3VisP4XjWYSi@shell.armlinux.org.uk>
References: <E1vkL28-00000005usi-30YC@rmk-PC.armlinux.org.uk>
	<20260127004020.3785641-1-kuba@kernel.org>
	<aXgMIYPiL9JK-c_K@shell.armlinux.org.uk>
	<aXidBha0FahIS6Du@shell.armlinux.org.uk>
	<20260127081804.64841f65@kernel.org>
	<aXjq3VisP4XjWYSi@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_103828_477159_8364244A 
X-CRM114-Status: GOOD (  12.07  )
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

On Tue, 27 Jan 2026 16:42:05 +0000 Russell King (Oracle) wrote:
> If I'm going to have to split it up just for the sake of reducing the
> cost of AI review,

Incorrect, as previously stated do not worry about the cost.
I was citing the cost as the reason we can't give people open 
access to the AI bot.

> can I ask for a moritorium on other development changes to dwmac-rk
> until this is merged?

Seems reasonable, as long as you're posting and making active progress
we can prioritize merging this work.

> As I see it, this is required _because_ of the introduction of AI
> review, not because something has actually changed.

Can't argue with how you feel.

> You have said in the past to me that the 15 patch limit is only
> advisory and can be exceeded where it makes sense to, and for this
> series, it does make sense.

Advisory is too weak. Unless there's a strong reason not to break up
the series it should be under 15 patches.

This conversation doesn't feel very productive. Let me just apply
patches 1-4 and move on :|

