Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A453DC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 06:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GwOPl6TUJvjurtx0SFT9PFDoGeN1jMxDAChV6NjVqrM=; b=zf9wHUzeMUSd6ce9srTdeyh2+t
	tjwD/7VpOqqHdVLS6kkBeDjjp91H1atL4LjYTN0mZeZO5sJHjRh8zIFwAbMtuEMri0ngL7XCWxdnU
	xg12Wag5/fEy/Jby9/EhVqWasTfJcPVGucVdMBVethskMjT0TDBU3p4oVATKsd56YYzMiXolAHFD2
	HFlMwtWKcokoJIbcPZawG5HfCPXVKSd51n/WXRUieomCEYTtnYXLua55Cj3tHReATf4aAmp0vmoS1
	9yFLAhASfqmGB/s30rSNgGPq6PuW0unE2sL2vxuHwbKv5pXYFBsA5sMctHb3UwYKRZl9jxE4zaTlp
	SQgYVXgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YDN-0000000DVeQ-1D2c;
	Thu, 10 Sep 2026 06:24:53 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YDK-0000000DVdc-2s6A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 06:24:51 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4843e9c5960so6299597f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 23:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789021488; x=1789626288; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GwOPl6TUJvjurtx0SFT9PFDoGeN1jMxDAChV6NjVqrM=;
        b=mxdrg6oLsTJbHiqe5fzNiBgmuc2K675BmDe/LE8w1vXdgLEvLSBfAycQbJobF8FSdp
         cUS1xpr3rU3S3o+HaVmAXKWGl5hUPvZ2+7QHS4znoZ5KG+nGGi4EHRNAqDrYBn0xUc68
         dDDKn36EXhZtLkXuXe8tqjMjBuDItKBGSM510b8AlKTM+ov1zpvswq7K8f/ThkcZ5qbm
         xEDhspJ4Xy5QiMbBMauPy8VvNAaO3cfi9iefC+YxTCwku/TlVGfGmexMr9wTGKMdqogT
         JePHi4XkhT2eXYD4n8McBzOqXUMXHXd2kUT0Nh5NlQcrXVih2VS1KK1ElXF4ldvtZGxE
         dE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021488; x=1789626288;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GwOPl6TUJvjurtx0SFT9PFDoGeN1jMxDAChV6NjVqrM=;
        b=RZgwQIsPn6CFbUCBvloTYCZaDMfKzschMYSY6rexBfU7I6018nwh3rRfmp03yvbzrU
         jd1KGBPqi29zNf/V+u908Btdge6tNTE7bzRcy3+nRw1AwengYbe2Ho68nsH6WBkw7jFA
         10cftGGAMVz6wNoL2sNJGzHGDmE5YDoHtGt8x2++fnPuy9hR7Lw2CYoDvb0lce2EqgqF
         knCRLAvu+y+dpaZQgKHPtetFH8vh8DnWSEvqOUYuN8jl/N8ZzKXBSEPdbBpI6zMhUiIK
         DG5eUfFm2A81vAclHXiYn9putndy38Wzco0jIupg5eFIyQh7+Csh82HwND7ocJShSc0J
         00Dw==
X-Forwarded-Encrypted: i=1; AKwUvBzHyA8hIAdiJ2HM9rMpy2Lp6ZyYR35LZe6RYPInJvogFNa52dYf2olHF7hrQ6VV97khR1Lfpv/cs6wAkqBwKP30@lists.infradead.org
X-Gm-Message-State: AFuF++klABEWbpq5eXD2PM67deIhLISjHlDOkFO/G9kT9aubSrbQt1AP
	1FM/ZOzKFOE0sZtsgsrpixB0//4QXx8fZBOQtH1wvwjJ86OmuEM2Bzmy
X-Gm-Gg: AYBFou0qSzP4Rjfqroiul+u4wLg/Jfbs5Pf1Li6i1I+adM5uoDePQT1FQKUlbNS+/Ww
	cmuLaB6/Alf6uZtO90rLHWs8wo1/X920j2yqKiUDfYx1MONp0eMuMqqpBpnUmfMJba1CSEiAaOg
	9YO6nfokATJlo+/R1D83anFuiLaCF22Qqb19ud7LGoGlenMloPQpMNrdq0Lp12sPXtkv0XMKH91
	MdN5Uywnkp1PYjXzIgH0MXg5oMW6NwpypOyLTw6WD4Q8xyqon7wAvCgNT4YPCPsYRMFvvzJLjJb
	24SAmjAHVe/CmocpiLSUG6ejgClK+M3n5duNJX3ACUwT5PM6SAd51IDPcpjtZMMneFy+e47YuCd
	eyZNMjMKPqvAjW8DtmeyL1245sMv4CwUHkmZB9vmOrkp6FwkmqvZmuvSz/3YgWC30dJSDQukuUc
	HEyLiNWiPEY3qitciegihwYDo4rD5HMNbUsDEdoHpqLI3ffJggR8XciT54EM4Hpu/PScIpEuPt/
	v/6f1VgJbzDzLtU21YT7mKDPgo1Bmv3PdYVvoAIjw4k0lkS97Mi75VI9R6FZzVynrA2/+Gu6EMX
	X6+1gwJoM3ggP0oPi5rQmHN7xwmodFDd0FKCSCs6IpzM/Jt1c+EAvOcUBJ7ywj3aRFYsWzWN3Vf
	gf4pwJLtayvLN
X-Received: by 2002:a05:6000:310d:b0:486:e24f:335a with SMTP id ffacd0b85a97d-486e24f39e9mr2649724f8f.21.1789021488301;
        Wed, 09 Sep 2026 23:24:48 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b3d9-b901-0402-5aad-0ef4-88ac.310.pool.telefonica.de. [2a02:3100:b3d9:b901:402:5aad:ef4:88ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm53896552f8f.25.2026.09.09.23.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:24:47 -0700 (PDT)
Date: Thu, 10 Sep 2026 08:24:45 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>, 
	Nicolas Pitre <npitre@baylibre.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dma-mapping: split cache maintenance at highmem
 boundary
Message-ID: <aqJJ5fQ60Nm6xf5G@gmail.com>
References: <20260909064443.90544-1-kmehltretter@gmail.com>
 <ff220a24-edae-4b75-9873-1a58f5948a01@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff220a24-edae-4b75-9873-1a58f5948a01@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_232450_736281_4E01C0C5 
X-CRM114-Status: GOOD (  17.03  )
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

On Wed, Sep 09, 2026 at 09:24:23AM +0100, Arnd Bergmann wrote:
> I can see how the fix addresses the problem, but I don't yet see
> how you can arrive in this situation. What type of memory allocation
> can produce a physically contiguous page range from multiple
> zones?
> 

Hi Arnd,

You're right that a buddy allocation cannot span zones. I found this issue
during code review while investigating another ARM DMA issue. I plan to
post a patch for that soon.

My Pi test deliberately reserved the last lowmem and first highmem pages
in DT. It confirms the crash with a crossing SG entry, but I have not
found an ordinary workload that creates one. I should have made that
clear in the changelog.

In a follow-up QEMU test, sg_alloc_table_from_pages() merged the reserved
pair into one 8192-byte entry. It checks that the pages are physically
adjacent but does not check page_zone().

I also searched a bit for a real-world example. Rockchip's vendor 4.4
boot-logo code looks like a possible case: it builds an SG table from
firmware-reserved pages and calls dma_map_sg() when no display IOMMU is
used. Product logs show the boot-logo feature in use, but I found no
record of its reserved memory crossing the lowmem/highmem boundary.
Such a crossing seems unlikely.

I still think the change is worthwhile. For v2, I will update the
changelog to make the test setup and its limits clear. I may also drop the
Cc: stable tag.

Thanks,
Karl

