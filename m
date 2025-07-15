Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA88C83F39
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lxm0BMHsTQDJY5VVN8bBo0QKdZrScIjjqvDsm2mUM54=; b=ivcye6lTxRuV6A003RzrtxSv0c
	phX3Q2ewypoWfKtb2efr4fbllwH4GTyBtmZj+dxdqhZp3Mfi3vh6iX/QxAXlbKzcfeOILAkjTO1Pm
	RNCn5FMYgUTyPCPfW+glgLUVGBMIcayRqTiAbq5q5cF5hwn3bXXIrMBGpWbOP/LSb3LjprjILmePp
	hFv1nWC0bgvrgFtphPaJ6U/KFVq0GHYIjAtH4+lLwcplJJkINRNBs8IXq0N/Z7nAGHRZWFkuC+2Jv
	/+pqqiNXQjwVcLJwxH93RmFpmP6670BqHNnadbMqJjHEuCKa6S6ZQI/JA94JGrvGvBxHuYP1EzYDi
	DcgrQ9uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubl6x-00000005xwU-2H99;
	Tue, 15 Jul 2025 19:14:43 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubhJB-00000005YGi-1E0a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 15:11:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=lxm0BMHsTQDJY5VVN8bBo0QKdZrScIjjqvDsm2mUM54=; b=Z9
	PvVpBz0hEgqOXkhF+yiuI1ocj439iMwU8DxWZ9XrTewgSy5HO2xkaijOlzjAby3u1qCkJ8mFWjjtw
	RtRLfC35IZRqkUmdqv2HIrJJ4JNVKSJ63XEG2ftONaG6Oo9UWQA8P+mpUeir5lFjLuxN8hXZfCNVe
	xN9DOodvCcwAbsY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ubhIx-001bDi-8L; Tue, 15 Jul 2025 17:10:51 +0200
Date: Tue, 15 Jul 2025 17:10:51 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Matthew Gerlach <matthew.gerlach@altera.com>
Subject: Re: [PATCH net-next 2/3] net: stmmac: xgmac: Correct supported speed
 modes
Message-ID: <2154c04a-b9ad-4382-95c9-1e3d7d342c9b@lunn.ch>
References: <20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com>
 <20250714-xgmac-minor-fixes-v1-2-c34092a88a72@altera.com>
 <b192c96a-2989-4bdf-ba4f-8b7bcfd09cfa@lunn.ch>
 <e903cb0f-3970-4ad2-a0a2-ee58551779dc@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e903cb0f-3970-4ad2-a0a2-ee58551779dc@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_081105_329091_56E86EEB 
X-CRM114-Status: GOOD (  12.03  )
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

> As per the XGMAC databook ver 3.10a, GMIISEL bit of MAC_HW_Feature_0
> register indicates whether the XGMAC IP on the SOC is synthesized with
> DWCXG_GMII_SUPPORT. Specifically, it states:
> "1000/100/10 Mbps Support. This bit is set to 1 when the GMII Interface
> option is selected."
> 
> So yes, it’s likely that Serge was working with a SERDES interface which
> doesn't support 10/100Mbps speeds. Do you think it would be appropriate
> to add a check for this bit before enabling 10/100Mbps speeds?

Yes.

That is the problem with stuff you can synthesizer. You have no idea
what it actually is unless you read all the self enumerating
registers. Flexibility at the cost of complexity.

	Andrew

