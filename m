Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31956C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 23:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuYhx4ivzz0E1AuPp+VdpQD15ncC9/RM8+DNV9taH/M=; b=LUbEgO3sXF8IC1kDyYyCOO+86C
	HT54TycFc4Wo1eGV7eBQQetzDvr6rRpx9csz25IvESSv+NEpIK/xcixjIR4LuGUJ6jauAtUWkBQUY
	LiHeLalgRzle4AnVRiNdoMmgzzOXhY/XhnGFdhRESn+33MT5F+ysPact0SNWRNWFJIQ9yMJXZaU5z
	rps+IGtb9Uglfq8QeSH7gMybGnmyR+kE8K0z5+Ig7GBFTnyn9jFIooQzoT97sz1AXGNSr+TPKb2li
	LFjNlDEyjex9Kt+E1GAOOWtIA2qN+eMN+K1o0zF+b1xlTFBLp4q/oJmyzsVDUeGBcU1C6/pttWn8T
	elSh9MNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taO2X-00000008zhE-2r9H;
	Tue, 21 Jan 2025 23:52:13 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taO1F-00000008zbf-3ela;
	Tue, 21 Jan 2025 23:50:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=AuYhx4ivzz0E1AuPp+VdpQD15ncC9/RM8+DNV9taH/M=; b=A6QEpfly++bM7NYGmP3SnrNw46
	tzmrW4bt3urzf1A4m8tC0jM+IPQbXwCo6UjGQnaXpgaSxnQwj7NTl3gMT250EkSz8azZGdC6FTKkH
	mAQZcJBLjsXeUD+EdhuPJGZtujaBkPOe/s9/hh4QEdd4cm5G6OWOqq+jSIct6tfDA4Qg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1taO0v-006mUm-5p; Wed, 22 Jan 2025 00:50:33 +0100
Date: Wed, 22 Jan 2025 00:50:33 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Shengyu Qu <wiagn233@outlook.com>
Cc: Elad Yifee <eladwf@gmail.com>, Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Golle <daniel@makrotopia.org>,
	Joe Damato <jdamato@fastly.com>, sr@denx.de
Subject: Re: [PATCH net-next v2 1/2] net: ethernet: mtk_eth_soc: use prefetch
 methods
Message-ID: <6359f0e9-6f13-4b87-993a-313a378742d5@lunn.ch>
References: <20240729183038.1959-1-eladwf@gmail.com>
 <20240729183038.1959-2-eladwf@gmail.com>
 <TYCPR01MB8437EC132CBC033368FC40A998102@TYCPR01MB8437.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCPR01MB8437EC132CBC033368FC40A998102@TYCPR01MB8437.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_155053_909637_1B3B4017 
X-CRM114-Status: GOOD (  10.53  )
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

On Mon, Jan 06, 2025 at 10:28:46PM +0800, Shengyu Qu wrote:
> Hello,
> 
> Sorry to bother, but what happened to this patch? Is it given up or
> something?

There appear to be open questions about it. Those questions need
answering. Also, the net-next is closed at the moment for the merge
window. So a new version will need to be submitted once net-next
reopens in two weeks time.


    Andrew

---
pw-bot: cr

