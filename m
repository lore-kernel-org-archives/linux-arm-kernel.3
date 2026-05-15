Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BE4CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 12:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EF+740UnJnqAgctNgdg2R5aHolnMpCTYC3TQf0irLIg=; b=HoWrWYX0FK6v0KARAuCVGDrrks
	ust99wxbTCMisNZYmXupK2f2GHyOnVylDnPYeDvKj/CBJHV2PKviaIW0rCbVPV5grutqnsbTxeebU
	Nvy3mYNce2cLVJVl4WiEMJZ/vgaSdQiSHVLL/EGZQRfBt747fnBknkm3ipN2qTNWbiUuTDdoYxbox
	mKCrv+e6YbeNqxTmbB/mPPGmswtfno6t3xCc7VoMvKlBdw7zzorj25Zqj7bktJCuohwrrzhiM1JUy
	YsY8AsxoBevDhVqr2S9F2LHTzBzjb6l+T27rmcj6ozuNSkKeq+0fTO2ebl5OzfxUJCIbXVnoLJRXO
	qp5Xz5rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNrwj-00000008MgP-1XR5;
	Fri, 15 May 2026 12:47:17 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNrwh-00000008Mfc-0GDA;
	Fri, 15 May 2026 12:47:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=EF+740UnJnqAgctNgdg2R5aHolnMpCTYC3TQf0irLIg=; b=AdIB5a9FUoLhQ4tXb72J/+z7zV
	VgffyIEypIZ1NCJb4YLBK2VXZEv+t1X8oIUGnDxhRLLWnolVTY+zgqJnwfUJZR8PqTpPZ82DaRmXh
	MZSUGME5WHiQBxF5e9CvxdSWWK2+CHHKSr9PHlpbtICid4HGLvOtt68R2tA1Rbo2WHTA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wNrwW-0033xq-8P; Fri, 15 May 2026 14:47:04 +0200
Date: Fri, 15 May 2026 14:47:04 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lukasz Raczylo <lukasz@raczylo.com>
Cc: netdev@vger.kernel.org, Theo Lebrun <theo.lebrun@bootlin.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH net-next] net: macb: fix build of TX stall watchdog by
 replacing undefined netdev_warn_ratelimited
Message-ID: <3aa11074-2b96-422e-8725-35c5522272d3@lunn.ch>
References: <cover.1777064117.git.lukasz@raczylo.com>
 <20260514215459.36109-1-lukasz@raczylo.com>
 <20260514215459.36109-4-lukasz@raczylo.com>
 <20260515095336.92237-1-lukasz@raczylo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515095336.92237-1-lukasz@raczylo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_054715_106168_C4F08C53 
X-CRM114-Status: GOOD (  10.40  )
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

On Fri, May 15, 2026 at 10:53:36AM +0100, Lukasz Raczylo wrote:
> netdev_warn_ratelimited() does not exist in this kernel -- neither
> mainline net-next nor raspberrypi/linux rpi-6.18.y define a
> netdev_*_ratelimited() family.  I confused it with the existing
> net_warn_ratelimited() / pr_warn_ratelimited() macros when
> authoring v2 patch 3 of the macb silent TX stall series, and the
> result fails to build with implicit-function-declaration.
> 
> Replace with the standard `if (printk_ratelimit()) netdev_warn(...)`
> pattern.  Same semantics intended by v2 patch 3 (bounded log noise,
> retains the netdev prefix in the message); works in every kernel
> version.
> 
> Fixes the build of patch 3/3 of:

What you should do is reply to patch 3/3 and say

self NACK

and explain why it is broken.

Then wait 24 hours, and send a new version of the patch series, with
patch 3/3 fixed.

    Andrew

---
pw-bot: cr

