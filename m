Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF70BCA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 08:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=80dzrh8aYZfGg2XUHBNmSgUetz0wp59La7rrflIHLYk=; b=HED0LxBjDqsOMAvCuffPH52h+B
	5gHGRD/v23FlOTp1JhQPLZIxJy4MQt32T3m/P11Qs9VQaPlJ6rGwr8Njxwyhr2glQxZtt2xU6+AHl
	OtvS1i/3h+1eJHIiFhK43nCTE744uhOr0b2TE4TVW5SEMuJaLsic/8vu/vygaVWK/PAIBKUOJ3N37
	2lkgD5c55IbM8xhfiLjJfTe/3liFyLd1sZEBwuRqtdoqOkk87Pbp6dzr2Ae1x2Ho8ElNOvsq7+UrT
	IjFOBvdVoUs74XDHbG5VmJF1USOq38xIO7voNd0LtzC18jO2SJt0GAjvTTFNCP1Dz9u388uF/YXkw
	X8fUFv0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqSeo-00000007KH7-04TV;
	Mon, 25 Aug 2025 08:34:26 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqRwI-00000007D0r-0b9W;
	Mon, 25 Aug 2025 07:48:28 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1756108093; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Mif53jBa6MJhiFA3/aeaKEpanFEPOgAIH7H2ZuUdsrAtRPu/MgbOT3DP6FBY2rj6ePbMjSECj12yIiQqzo9EC3onYNcemMOPA7kexfcK9xKDYPuR6j4sRJVelnLZBLEQG0X38Apa47eBKSzmFFuNz9vrZ2uFGldXO/K346zQY/c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1756108093; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=80dzrh8aYZfGg2XUHBNmSgUetz0wp59La7rrflIHLYk=; 
	b=hTrQDB+vFRUoh2TzCLNct7ZH6mA+ZiLxyi08MHJ278n9kJefJSS8W0fZv6yV5vnJvzDAcQZhLzydoq1k/A5PczB6y4tbslyaC/qdgSZhpG/4L25+svqU468G3JXb+BZHKPSOMfmr/+kta3MYdiQArODPHxGvpuzc+7VGFRmUwYk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756108093;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=80dzrh8aYZfGg2XUHBNmSgUetz0wp59La7rrflIHLYk=;
	b=F+CZpcEHNCcVVD5E2eusUhfW3VOUS/ZWUIpDXxI5z5QeKjtOV9RCcGxyZ/bOxE14
	x+XVoB1b6xaPLKM4peUQofBqgx8GIHy0CMMo5WJvpvX22tuJAS78545/+5x34SM4fh0
	HU9zR45BRWmSNqHl8sXRyIGwQroD2o9wsHxVH/9U=
Received: by mx.zohomail.com with SMTPS id 1756108090913704.2939268893988;
	Mon, 25 Aug 2025 00:48:10 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2 19/20] clk: sp7021: switch to FIELD_PREP_WM16 macro
Date: Mon, 25 Aug 2025 09:48:05 +0200
Message-ID: <2795210.mvXUDI8C0e@workhorse>
In-Reply-To: <175340605069.3513.18204498860033427106@lazor>
References: <20250623-byeword-update-v2-0-cf1fc08a2e1f@collabora.com>
 <20250623-byeword-update-v2-19-cf1fc08a2e1f@collabora.com>
 <175340605069.3513.18204498860033427106@lazor>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_004826_250656_47397A73 
X-CRM114-Status: GOOD (  13.16  )
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

On Friday, 25 July 2025 03:14:10 Central European Summer Time Stephen Boyd wrote:
> Quoting Nicolas Frattaroli (2025-06-23 09:05:47)
> > The sp7021 clock driver has its own shifted high word mask macro,
> > similar to the ones many Rockchip drivers have.
> > 
> > Remove it, and replace instances of it with hw_bitfield.h's
> > FIELD_PREP_WM16 macro, which does the same thing except in a common
> > macro that also does compile-time error checking.
> > 
> > This was compile-tested with 32-bit ARM with Clang, no runtime tests
> > were performed as I lack the hardware. However, I verified that fix
> > commit 5c667d5a5a3e ("clk: sp7021: Adjust width of _m in HWM_FIELD_PREP()")
> > is not regressed. No warning is produced.
> 
> Does it generate the same code before and after?
> 

Yes, the generated machine code is exactly the same, at least with
clang, and I'll assume it'll be the same for gcc.

Kind regards,
Nicolas Frattaroli



