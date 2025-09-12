Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7146CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 13:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1QwMEVkzC77rV7TEVB4ZQxwruyo9VsaKM2Zj3Ph0wQ=; b=crypKcnZ6t+KBr1DMxxUuNhUV4
	wHuKiDkmspQHEVPUNJw0stbfxT3DN9CJ4EZkWoyivCXS1GIJ3gq0JTS2ds9i1/J1a7cEd2SyWxupo
	S2pzAcKhFbcqqu5+A4AaDT2cETNYhdMF4OSCuA37wyJ8xxeikbyr45zk567LWbOb41/+pIlyXN/Ad
	ZBSnhaYHx3V2nQ7X7EC/rOMI8M1P15/0go0xG6qdWXE2j8348JqNOi/x2r5O0MXxkW2cUb0sJwNT4
	dgQuZKziaYxeS5czXvTn78MqiK+ic/WHT6yEHr4l0E0CG6DNQTVUw0WjS2NsLQkLyyNLz13Clsy5G
	dr/Z8Z7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3e8-00000009Urt-376t;
	Fri, 12 Sep 2025 13:17:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3e8-00000009UrA-0Pq4
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 12 Sep 2025 13:17:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=O1QwMEVkzC77rV7TEVB4ZQxwruyo9VsaKM2Zj3Ph0wQ=; b=V7hbJdPnNgBvGak31eOz58Mf1P
	otiV4vFRfmengjQC3i3FF81bSu7SfBAe1eqxiJzNTi1R4gLaN8u0wpffGkz1JpY9jt3Yom4hqcBia
	EH96uZOoSoxiTz2Zj9io0vk5m2EHlsDzoA0vREw85DvJq2B06EH11KXlog8cNmVcJCJG39zhOd8bH
	mw/2V1agjKxuu9Vbd/bpA2oQZ2D7UqzEV3AGXt9sdRGaY3X9Wj3XwpXZotScYIF+ba+xeGTIUi/TN
	VO8oGIY/qzBSbT23U9PZt7aVPiRKyyRiP8iuAoGvZoxA6fv7XIBlghM+z0k6GaIFOdVxXRMVL3YMB
	LcM8h7vA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3e1-0000000GJeP-3Q7n;
	Fri, 12 Sep 2025 13:16:53 +0000
Date: Fri, 12 Sep 2025 14:16:53 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Andreas Larsson <andreas@gaisler.com>, Arnd Bergmann <arnd@arndb.de>,
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Richard Weinberger <richard@nod.at>,
	Lucas Stach <l.stach@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Message-ID: <aMQdRfcMGGZQrW1_@casper.infradead.org>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <5d2fec2b-8e59-417e-b9e6-12c6e27dd5f0@gaisler.com>
 <E986779F-C7AA-4940-9508-08601EE2FDD0@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E986779F-C7AA-4940-9508-08601EE2FDD0@zytor.com>
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

On Fri, Sep 12, 2025 at 02:58:48AM -0700, H. Peter Anvin wrote:
> On September 10, 2025 10:38:15 PM PDT, Andreas Larsson <andreas@gaisler.com> wrote:
> >We have a upcoming SoC with support for up to 16 GiB of DRAM. When that is
> >used in LEON sparc32 configuration (using 36-bit physical addressing), a
> >removed CONFIG_HIGHMEM would be a considerable limitation, even after an
> >introduction of different CONFIG_VMSPLIT_* options for sparc32.
> 
> It really sounds like a self-inflicted problem... getting your customers switched over to the RV64 side is probably the best you can do for them.


"We only support configurations above 4GB when using the RV64 core".

