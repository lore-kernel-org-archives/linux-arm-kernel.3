Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DEFCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 13:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kaVGNsXYbHtXZ4uzqeFlf4o6f/3jgmyRexy/RaPVZk=; b=sqBdg2vzXl654J3GOHTrTZXWr1
	2c7D8UmjhHkUoW9N1R1M4YF2aCir3gFgUUs9y2y8bRKNyWJhvqPTcil2UUtVOAfnRElIvt4cDfu24
	XBvFnzeHtjUveioKjAR9R9vfX3gxKc8zOTUPB5O7h3LBR0xL/YhL0U3ERT88VAF45Mf4tC3TXUvtI
	onoA88CTkcrGaGv9/Dem+guiciqtryyAQKEiSKH5vlO8lK5z5KdZRmkyXjkuuQirM9V/VvipcSNCx
	Wr52Je4yvGNV0ZqUQ4jG+qwteKv74tbaST3ddveIJ+v/h5H1K878/W1FwQyaTpjQHlXLQN5aOuV6a
	gAcAJrYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1Ur-0000000AvnB-1tJd;
	Fri, 12 Jun 2026 13:00:29 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1Uo-0000000Avlv-1pn7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 13:00:27 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-687ed9aabb3so1794919a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 06:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781269224; x=1781874024; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6kaVGNsXYbHtXZ4uzqeFlf4o6f/3jgmyRexy/RaPVZk=;
        b=GZlGW+ee4FCRKfYFa+UOoYssY9Gg8rOxrNqDByC2az/DKWj6d07nUKgaU14+d5bWYq
         P/cm4PiIiGLNqf+3R/qkgOoabRTZTyU6BzhKBrnPVT8Tr60zYIWZF/GYXZ8J5oREtzqi
         vWco0qSLREi2j0OHSJ7GhQxONfyIk1SQNKdLXR/Sk3l0C5F1aOMDPFcoPJKNvz9PCl+B
         CEeN3NDfTxMi13avhrTnHz3VN9L36xW6YOfr+Mbc08ete77skAmmgPL+QenFSZg9Nuqo
         SC6TI3Q4KQ+dRgRFASc4KiECauZazPYdWhv7qI17SW95WD9F6a2xaad2njKvvYa56I2F
         vziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781269225; x=1781874025;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6kaVGNsXYbHtXZ4uzqeFlf4o6f/3jgmyRexy/RaPVZk=;
        b=bMAfY/ruOBoljM3g2utk6ha6f4ynqRkBBrvJAFbzMShF3n+AEsJ5xm3FmwxdoDHwfs
         8wAfk24nE1cu2+8sqfNL1YC8ySMjcGjKyag8wmb7s8ps/CUyCWtDtFePBNU9/a7le2Mm
         +2uK+WWFv2/C9vS9tD6s4Pqf6UGoyxgpUVCuCBbzYUotZIXKwohU8nWOu79vDmxvPCpc
         zHCSvxW2yh3yQkdVzeQ9MZF9Kw85tR+9aYN3Z777rxMnwJSQ7MFSqTZbx90DiWIhNorw
         Kh1XUwTjhk5ZNIES8KTeS9gnWkv5zv1R/NLHa/BBDDXRZ14I4uYUvsYKxOaDzbLZEZ51
         O+PA==
X-Forwarded-Encrypted: i=1; AFNElJ+J8CldnEixgnuef3B75FH2HHenHYl0SkxQ7G25zNmvyprdFD+9wg7+T1phfA8Bxxzy3R36K4MYOSG9u3ihaUxc@lists.infradead.org
X-Gm-Message-State: AOJu0YxtKUGJilkUsgyCerz1gSzla9L3c10WI+hjYvQrC481D4sZSbbX
	BkJ67D3cg1u69E6oBHMDwOUCnX3BZNfsMcMHF6h3RfIMWpmuq6Ak+uszyPLBdjd36go=
X-Gm-Gg: Acq92OEHVkBnKFIqphPzannmo8eAYhHR6PummRXLa9gAbDfQqCqhpVgzhlKME+KvSnW
	aSVfJkEzPdjxSyhBXi6tT5OnP6cAmKtqmQHrIwQwqRW0S3nIOWr/Je6olK+JjpyjFqQkS1JkW1l
	OgV9BAi/UFGmOqXRpqoZii6Y23/vyysZnOYkS7jJjOTQ/obJXNmCCUG5AmUcJeZq7ZPCbJVipL3
	bgs8ms4Lw5gvhT5E5mKhBgA4QGWe+J5GbEYvcaEGftWSplH1WiaqartJKgM+BbyS8ETyA9FU/Ou
	B+ZfbdHJnxaKEgkwRZ7xyWZJEvf40B8Uc0vtxgZOJPou9Eial4/bzHq+TBR8hopbRL8BLhf56q9
	xeq0DVtLHGfovdtDbgd53X02HathpmgiLwh2dHPuG0k3U9HJ+22co7/T4KzEtqx9VsuNwvM+isY
	5mwnfoF5Cik+YrjRCrEKXE
X-Received: by 2002:a05:6402:4404:b0:687:9c0f:5897 with SMTP id 4fb4d7f45d1cf-693788fcf92mr1468576a12.9.1781269224595;
        Fri, 12 Jun 2026 06:00:24 -0700 (PDT)
Received: from localhost ([195.94.146.6])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937949fb19sm610192a12.27.2026.06.12.06.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:00:24 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 12 Jun 2026 15:03:45 +0200
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: Andrea della Porta <andrea.porta@suse.com>, netdev@vger.kernel.org,
	Theo Lebrun <theo.lebrun@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Lukasz Raczylo <lukasz@raczylo.com>,
	Steffen Jaeckel <sjaeckel@suse.de>
Subject: Re: [PATCH] net: macb: add TX stall timeout callback to recover from
 lost TSTART write
Message-ID: <aiwDsd-1IzeBzcaD@apocalypse>
References: <771b8faeaee1fce4a84a5ba2661d60b35a65a6d5.1781253818.git.andrea.porta@suse.com>
 <dbc25b24865a1ad92555bc826bef4267@tipi-net.de>
 <aiwA1dD-qXcT3hds@apocalypse>
 <85507fd0fb42fca280aca1ee02178ca9@tipi-net.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85507fd0fb42fca280aca1ee02178ca9@tipi-net.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_060026_490548_24EED95E 
X-CRM114-Status: GOOD (  22.52  )
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

Hi Nicolai,

On 14:53 Fri 12 Jun     , Nicolai Buchwitz wrote:
> Hi Andrea
> 
> On 12.6.2026 14:51, Andrea della Porta wrote:
> 
> > [...]
> 
> > > 
> > > The commit message describes it as RP1 specific, but it gets applied
> > > to all
> > > other variants?
> > 
> > I've seen this issue happening only on RaspberryPi 5, but AFAIK it
> > could affect also other MACB blocks connected through PCIe, so it
> > may be widespread (even though it should have probably already been
> > noticed in the past). In the orginal driver there's no timeout callback
> > defined and this is much like pretgending the issue causing the timeout
> > to happen to go away without doing anything (whatever the cause ot the
> > specific hw are). So in my opinion we can just extend that to all MACB.
> > Or maybe we should execute the restart conditionally on
> > .compatible = "raspberrypi,rp1-gem"?
> 
> I just observed the issue once, but other people reported it to be happen
> more
> frequently. If we can narrow down a reproducer, it would be good to test on
> other
> blocks too (like EyeQ at Théo's).|
> 
> So maybe you can imagine a good repro for this issue?

Sure, it's happening quite often during bulk dataflow, at least
on my RPi5.
It can be reproduced with the following, issued from the DUT:

  iperf -c <SERVER_IP> -P 10 -t 3000 -w 4M -i 1

plus, of course, the related command on server side: iperf -s.

It usually happens a couple of times withing a few hours.

Regards,
Andrea

> 
> Thanks,
> Nicolai

