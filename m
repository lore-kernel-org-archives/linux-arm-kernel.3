Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B3CC982FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 20:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yG1gxdLIiczbqATL2il7iM6aKwGQj0684D9Q9eoZBXU=; b=KFMMc54NQz8ZsWF+spKEJlchYy
	l/a7b1SeA/LRUKgYARufo/T/2p5TIFedPA2mmXw2zEuLd7cZMLwmX811XYBKXRSc9jo8uJx2pviLh
	YE91rQdTonB72Ej9NnQP2r73+Sp2GrMivR0ys3KH1wR0INPKgAMm7Iiq8t505dKrksGnqJ9y9oT/J
	PBPwEMOJk9j4ujHUmP/QbLnP/mLVTE80O75FmNnUxdCY26GlFRrAANjePrfMzc32eEuRMoKZhZGVv
	CByS4QbBZYiCeAeJ4UaVKO/VdpTeExCGqyTjV9sUbE0ydYIptCGJ0665ZBnRtzf/+4s2C8G/G8Qll
	+/MVWFTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgqAp-0000000EmqL-2ShG;
	Fri, 16 Jan 2026 20:11:59 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgqAn-0000000Empn-3zCY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 20:11:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=yG1gxdLIiczbqATL2il7iM6aKwGQj0684D9Q9eoZBXU=; b=zK
	hdmH5Mi0C8gQkomOnTXRgoiMXkxBVgVi1vUCdIiIvjxyfCTn4jcy/bxVXL3PXM6MHlWmZp3Olold4
	4tDxgR914dDj1SAnmf49vZPXvefkEnew1jidJvURuoLkwli4994+ZPKD7tp+xVTF0TytFAqeNrtgl
	+4XERhJ9jH7IGPk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vgqAf-0037BL-7s; Fri, 16 Jan 2026 21:11:49 +0100
Date: Fri, 16 Jan 2026 21:11:49 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Mark Brown <broonie@kernel.org>, Michal Simek <michal.simek@amd.com>,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: xilinx: use device property accessors.
Message-ID: <608a92f1-9403-45c8-b4bf-085f85876aad@lunn.ch>
References: <20260115003328.26095-1-abdurrahman@nexthop.ai>
 <12f527c6-7728-4512-a4f1-08c778627ea8@lunn.ch>
 <87C51F3B-7770-4BFA-8BBC-5E83A71920E1@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87C51F3B-7770-4BFA-8BBC-5E83A71920E1@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_121157_991152_5E7CA7B2 
X-CRM114-Status: GOOD (  15.24  )
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

On Fri, Jan 16, 2026 at 12:00:35PM -0800, Abdurrahman Hussain wrote:
> 
> 
> > On Jan 16, 2026, at 7:23 AM, Andrew Lunn <andrew@lunn.ch> wrote:
> > 
> > On Thu, Jan 15, 2026 at 12:33:28AM +0000, Abdurrahman Hussain wrote:
> >> This makes the driver work on non-OF platforms.
> >> Also, make irq optional, since the driver can already work in
> >> polling mode.
> > 
> > Are you saying ACPI cannot describe interrupts?
> > 
> >    Andrew
> 

> It can. We have enabled the interrupts through ACPI on Xilinx I2C
> block and it works great.  For the SPI block we currently have an
> issue with our FPGA. Luckily the driver works just fine in the
> polling mode. By just making the interrupts optional makes the same
> driver usable on a wider range of hardware platforms, with or
> without the interrupts.

It would be good to split this change into two patches, one making the
interrupt optional, and one swapping to device_foo calls. They are
logically different changes. And the commit message can then explain
you are doing this so the driver works with hardware with broken
interrupts.

Actually, you need three patches, you need to change the DT binding,
spi-xilinx.yaml, since currently interrupts are required, not
optional.

       Andrew

