Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE85103E18D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 14:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EjoyOHkKeAphkVr3xy66lZASob2HNzkrFl8r/4hjxWg=; b=GoFoLmgBwwefBk/IiK5eiRykUl
	eu1kTeeh114t9nmJE/TfT+PPRjaLAQ5SAy7SnKlgdxphnf2eTwDn3w9Ez0pXgGFVdEkxrDBHAf4Wq
	P6c1CBVM9haCtp5LBtJk9TBjLtfuDv9qGnHG88vs0xJh2nPmiaehXxXoZ2K//o7hZJ7ltAlsSwBn7
	+OE31jJD6f9eQAdsSqfe7GXZMkcgi/wpjxdj5Nu9yeKjoXl26pzdFiY2n68SAoAjMzkboN+CdIbMZ
	WX3OyAOR1yoPCe0IhJr6i3/PlO+nt1WYm7mD6YAEE8AmrrNQ72lvlbtOMV4ibq+C/tHpndib9SXkg
	VU6xEMJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rk3-00000008a6P-2trC;
	Wed, 18 Mar 2026 14:19:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rk2-00000008a6D-2QaA;
	Wed, 18 Mar 2026 14:19:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 48C4160053;
	Wed, 18 Mar 2026 14:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D06A3C19421;
	Wed, 18 Mar 2026 14:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773843561;
	bh=pL+9AgAL3F3wRdPCa1QHTuK609k/1f2ZWXG3gFuWVY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZhaMIifPFwUHxTAEClEjhWsFQcrgE2R4GXTqotwrcKE6CEPnVIq49gX8JLo3S9uSd
	 J5/G1kwmw74trSok0ANAT/+34bMR/39Lcrnrq2f7xWnz93cezeKVnAMI2MYC4tqmaR
	 nJg2BffI1I/l4lRG3IF639GaCiUERhKaKl3E72JY=
Date: Wed, 18 Mar 2026 15:19:16 +0100
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Zhiyong Tao =?utf-8?B?KOmZtuW/l+WLhyk=?= <Zhiyong.Tao@mediatek.com>
Cc: Project_Global_Digits_Upstream_Group <Project_Global_Digits_Upstream_Group@mediatek.com>,
	"fred2599@gmail.com" <fred2599@gmail.com>,
	Yenchia Chen =?utf-8?B?KOmZs+W9peWYiSk=?= <Yenchia.Chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vasanth Reddy <Vasanth.Reddy@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Liguo Zhang =?utf-8?B?KOW8oOeri+WbvSk=?= <Liguo.Zhang@mediatek.com>,
	"jirislaby@kernel.org" <jirislaby@kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] MEDIATEK: serial: 8250_mtk: Add ACPI support
Message-ID: <2026031837-slimness-playset-a62b@gregkh>
References: <20260105024103.2027085-1-zhiyong.tao@mediatek.com>
 <20260105024103.2027085-2-zhiyong.tao@mediatek.com>
 <2026010643-ladybug-tiring-7f3c@gregkh>
 <434e34f05bb5f87b59402811012e3a2f56f2182e.camel@mediatek.com>
 <6478a71ffca65e58fa19a5edbc25eb5f51a8cc12.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6478a71ffca65e58fa19a5edbc25eb5f51a8cc12.camel@mediatek.com>
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

On Wed, Mar 18, 2026 at 12:12:36PM +0000, Zhiyong Tao (陶志勇) wrote:
> On Wed, 2026-01-21 at 14:23 +0800, Zhiyong Tao wrote:
> > On Tue, 2026-01-06 at 11:02 +0100, Greg KH wrote:
> > > On Mon, Jan 05, 2026 at 10:39:55AM +0800, Zhiyong Tao wrote:
> > > > From: "Zhiyong.Tao" <zhiyong.tao@mediatek.com>
> > > > 
> > > > Add ACPI support to 8250_mtk driver. This makes it possible to
> > > > use UART on ARM-based desktops with EDK2 UEFI firmware.
> > > > 
> > > > Signed-off-by: Yenchia Chen <yenchia.chen@mediatek.com>
> > > > Signed-off-by: Zhiyong.Tao <zhiyong.tao@mediatek.com>
> > > > ---
> > > >  drivers/tty/serial/8250/8250_mtk.c | 23 +++++++++++++++++++----
> > > >  1 file changed, 19 insertions(+), 4 deletions(-)
> > > 
> > > This is a resend of the previous version, right?  Or did something
> > > change?
> > > 
> > > confused,
> > > 
> > > greg k-h
> > 
> > ==> Hi Greg,
> > Yes, previously Yenchia Chen helped to send out a version. Currently,
> > this solution is specifically for the GB10 project and was made to
> > support Windows ACPI settings. 
> > 
> > In actual application scenarios, the apdma clk will not be turned off
> > in normal mode. It is only turned off in the SSPM microprocessor
> > after
> > entering standby, and when resuming, the apdma clk is re-enabled by
> > SSPM.
> > 
> > As for other Linux projects, apdma still uses the DTS node.
> > 
> > Thanks
> > 
> 
> Hi Greg,
> Do you have other suggestion for this?

You can't just resend something and not say why you are resending it.
Also, the authorship information seems to be backwards.

thanks,

greg k-h

