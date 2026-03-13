Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1009105F7AF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zODNumC46MLvCkMonrBPDEfQiNJaKK5wD0jqteL2m8U=; b=0RO9Tmd8Lm6ibxgyuPlkt1Tsr8
	JHnDJy0n3qJZSwoFqo4tP5q5UwglJx441UGdUpE7v+nxpesVvw3LxdQTRgzqysMmpLCUCaA2En+uF
	+XFJYlNCeaeLJssnu815dfg/f1d1aZngnsKR2Nn7EpMHcCUIB8plpnUm7B0Bzzfy7XSDiVwBYhPUH
	hUra951yOTf3bSZyvaP9xKsxy6TQ1ruqh5i70Odx5MkKBeOlBe1OjKqrrUZ22DZu1J7j4MGEoUHbl
	52ewRuoclOPAu7uSCAgq+xlINAqFWVbZBDwGNyhoUNeJvwV3KZWcCueN1qbMtEfPZPIb4Xn+cBSnZ
	8shUOQbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w139Q-00000000Krr-3XDU;
	Fri, 13 Mar 2026 14:06:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w139P-00000000Krc-09RU;
	Fri, 13 Mar 2026 14:06:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 29A976183F;
	Fri, 13 Mar 2026 14:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30084C19421;
	Fri, 13 Mar 2026 14:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773410761;
	bh=CtWBsxNWkPj8OE14jFaHauUv7MbBm2S14GcKwHf3QlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ohqqRSxeyqxwDPUmrevk/jyKsdpNpcf9V9MhgfY7ddRP7pk1g9yy5wKLEnhwnredY
	 u+DEI5H1qe8jDeUzia1TzGuGNyk0tkBJGqp63AAgnCKmZ0jAYCswFC+yVax99omKrq
	 tqr0rJA4uvt0dXWrX14ledkG2neVs/98nsxG2D/RPC/kVrThQgRwO5T44A22amvS0E
	 ON+ph8o3qz/fksqt9NXCeOiW11EesdVvALyC84cf13lmWXXQ0pQ48zvz1lBGUVU/QN
	 A2tNA5jlRVqZKeCpnZxvBeJd0KX+1oL6lPymtJToWcBt8bC3ZCrFHc82PI+D+Ka5x+
	 GHKGamJ27plpA==
Date: Fri, 13 Mar 2026 19:35:45 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Niklas Cassel <cassel@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Hans Zhang <18255117159@163.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Wilfred Mallawa <wilfred.mallawa@wdc.com>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>, 
	Grimmauld <grimmauld@grimmauld.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, driver-core@lists.linux.dev, Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Enable async probe by default
Message-ID: <gm7p37yom64doo3bbrcri3chbrzpm5zifqk256qqla2krhrrrw@tknda7rvjklv>
References: <177260693908.10259.13055467642416391434.b4-ty@kernel.org>
 <87bc37ee-234c-4568-b72e-955c130a6838@arm.com>
 <f7tfshf7riljjibuqge4ubfjmludubpyh3ppdf6lasurzdzbtj@sw4xxagfhnn3>
 <5d88fb5b-e771-4ea6-8d2c-c5cfd21e5860@arm.com>
 <qwanhqrpztzkudik5fmberhabnzaly7v53677dohqzj5nq4wi2@6ndpiubyxcbi>
 <DGZXF3LPSRK6.2QYN63QTKUQAX@kernel.org>
 <cp5uktfqdf6zs53qsye57ior2ikmssgevxxdtevkzpisaif22h@7mrxspkuibow>
 <DH09EDBW3X6T.2996UB1CFCAW2@kernel.org>
 <55c28218-1638-4b90-a9cd-a177fb5abcb6@arm.com>
 <DH0TM60TVX5D.20W4O1X696ALA@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DH0TM60TVX5D.20W4O1X696ALA@kernel.org>
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

On Thu, Mar 12, 2026 at 01:59:52PM +0100, Danilo Krummrich wrote:
> On Thu Mar 12, 2026 at 1:48 PM CET, Robin Murphy wrote:
> > On 2026-03-11 9:09 pm, Danilo Krummrich wrote:
> >>  From a driver-core perspective I think we're rather limited on what we can do;
> >> we are already in async context at this point and can't magically go back to
> >> initcall context.
> >> 
> >> So, the only thing I can think of is to kick off work on a workqueue, which in
> >> the end would be the same as the deferred probe handling.
> >
> > Hmm, in fact, isn't the deferred probe mechanism itself actually quite
> > appropriate?
> 
> Yes, I've also mentioned this in [1], including the fact that it technically
> even complies with the guarantees given by PROBE_FORCE_SYNCHRONOUS. I.e. the
> documentation says:
> 
> 	Use this to annotate drivers that need their probe routines to run
> 	synchronously with driver and device registration (with the exception of
> 	-EPROBE_DEFER handling - re-probing always ends up being done
> 	asynchronously).
> 
> However, I'm still not sure how I feel about this, since I consider this to be
> more like a workaround that just moves things to a "more approprite" async
> context.
> 
> On the other hand, eventually we want everything to work with
> PROBE_PREFER_ASYNCHRONOUS, so maybe it's also good enough for the time being.
> 

FWIW, I'd love to handle this corner case in the driver core and not spawn a
workqueue/thread in the bus drivers as we would end up duplicating it all over
defeating the purpose of PROBE_PREFER_ASYNCHRONOUS flag.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

