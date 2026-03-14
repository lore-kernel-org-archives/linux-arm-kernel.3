Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6AB10706FE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 19:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oiOJoFUw+Hyic1c78IIqHGXE+74cb7sOJmmgItlPy5A=; b=fk6Od6Qh+1+0DJY4dhLpB5PjVb
	TayJoA1Plam1RpPED4kQEY4YkK2RRqHI8DGbKWMVbmQCr8qP5kyu9DL8ob1lnMySlFHC4Wn3o5P1A
	VHC2wQBVAmcUDgTCy8QbEdYmzpbgkC4k3MaGyHMURl1VdUHoHaOW6Xq7CMNhZSYv0kAVJooZ5WpDJ
	jbvK7ftgTcXLeF9BnhLVqHznjuEoufvw7H/AnpbA+TA/I0MvfaCrDgDSalHyU4DAd775BQ1Vtdz68
	EpjGsriTbx4N57q9JgUz+Dva8upXW0L+fHM0uJMqS/140+iKLxdrcBMs13TtCrOCiXD28lvK6J4a7
	Iv4L63hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1V2Z-000000027jr-1blI;
	Sat, 14 Mar 2026 19:52:51 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1V2V-000000027jU-1ZId
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 19:52:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oiOJoFUw+Hyic1c78IIqHGXE+74cb7sOJmmgItlPy5A=; b=audYKytx6H6NiRokYT2ySXaNhA
	gtgvys4WuAAWpjvQgjH7WGQaqXvxwlof+myParFA0qFr7D/buY8r5fuE/rtHPLsmfL/J+RI1JiTHd
	jPmQgUUhSu6tg250OpkO9Bt00CSM/CyXEagiq9tlReuJmCOM+w3A4KOwRB6OAJpz3BfZ1aJo5kMHL
	55uGRuyOM5K9hMIy4LX8XTRxHBRKmJOFzeQfKdVhJwF1e7IXCBVEaqGvhmHK2aLoJUxJhEHACVwVL
	JVRw2dlDhcuwVPQOAei9BMPyP+AvhOhRpQvA18cC/UpufEi6UMldln32FmYu7pq2W/aI9xPy4h35x
	BR89FqSw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42084)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w1V2R-000000002Q5-3jnz;
	Sat, 14 Mar 2026 19:52:44 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w1V2Q-0000000013C-1Av5;
	Sat, 14 Mar 2026 19:52:42 +0000
Date: Sat, 14 Mar 2026 19:52:42 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Wang YanQing <udknight@gmail.com>
Cc: akpm@linux-foundation.org, willy@infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm: lpae: fix non-atomic page table entry update issue
Message-ID: <abW8ihEmosactLhr@shell.armlinux.org.uk>
References: <20260314175958.GA7956@udknight>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314175958.GA7956@udknight>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_125247_433990_926C8E8D 
X-CRM114-Status: UNSURE (   6.10  )
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

On Sun, Mar 15, 2026 at 01:59:58AM +0800, Wang YanQing wrote:
> 
> The ARM Architecture Reference Manual explicitly dictates that writes of 64-bit
> translation table descriptors must be single-copy atomic

Please provide a documentation reference.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

