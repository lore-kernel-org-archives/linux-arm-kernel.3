Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B275D3A67B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 18:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6XhsNOq3Xb6DlFbdh+eqFWbKB2WPUnNMo5K0T4jrL4=; b=1PzlTxi2ayQxSueIQRw7yxd/L2
	jCygC8PRXBw+ajAbKhEgBI1gh8UCfRwzyZQnDsj80PE5D5uxdBV8yqdid1vu/WEHMz+z9UVLoL5g1
	AJIO1i876ONhZw22XtCaoNxtJ7pcPF1vK2M6x5+1+M2Fp/h6b1pHNbC1a7+/8PwFO1zYHrGkg20Ip
	e2hHe1zOaueVBsqGX/q5TI13KlBDACJgNYDk9MSAuGeTEH2xuubNm567XCwEKORVlYIx/3mLRib+5
	raDGPRVqbIRWflvACRNb0mx4gWsKSY8sksofzVXDxqdWSlqcsGM4kPX30t8o+b0t1u+yfA48x+VKT
	EjD179rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rDk-0000000FWi0-2axV;
	Tue, 29 Oct 2024 18:45:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5osd-0000000F5GD-3MdF
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Oct 2024 16:15:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=t6XhsNOq3Xb6DlFbdh+eqFWbKB2WPUnNMo5K0T4jrL4=; b=RLEqRuxTWMZLBRpDArDctw2aB8
	24PiCPg7c9CImQU5/U+yVJAFb1cUt56FXgzT0ChzyfBkrZMO1/a87FtY/CCuFHS6T4ZTzUjQdbc2v
	ijRLprQJX1KSlDb2wEQr+NE4+Vrpke5NgOvRKKL9wyvUR8ZjAtXJHKpBDIOq2raz/K9I67EyaAjDb
	MgkcP1ZE896p7vQ+YxR4V7PWuNQfsR7qf04U50DL2/VqX2SLR7dfuZ86DjzwBGXB6JerDAP4aFYTs
	WHAVYV46JOZwJvdcQhafw5yai36bLohEJMPcKktGkyLR5F+5tr7r2EpKwDteITHwTCTI+0yc+mSYA
	uAmGCWhg==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5osa-00000009wu8-2DVZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 16:15:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4D968A42FF2;
	Tue, 29 Oct 2024 16:13:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D75B2C4CEEB;
	Tue, 29 Oct 2024 16:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730218533;
	bh=vsyWoTwbsiRwsb9EYXxM+GmOQGioC2wxUoNjmlnpZ7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k3aZv97JusL09VW1UTsVJVdg/QpFlLRqjHiiIveXEkXQrrF4LPp7Z/2ZLuMcumsh3
	 3Ve1OTTJYhmlHYWtxSKUUmD/+vgRwp14hnO5EpcfH4D39sWfkxGZVAx/U7oxljWtlc
	 8hwT8NsIFNpOH0N0MzmcJrMEHjjLLJqv7LywZZHiLxlApI4h1L3WjDFaA4cxZaeWef
	 uYBsFbusOxn83i2oE5Sk3mon2C51Mdkdet7xIGx4DkYCaKhWWKssFZsU+YE10i9zpF
	 KY0tEfiUxi/p/92rZs06NsFxFpiioW/WaaJm0tUoiSf8i75HhNij9oHoRTXnR2bsoo
	 NjtXqopSboMWg==
From: Will Deacon <will@kernel.org>
To: Russell King <linux@armlinux.org.uk>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: pmuv3: Add missing write_pmuacr()
Date: Tue, 29 Oct 2024 16:15:15 +0000
Message-Id: <173020672798.2294098.11077870064387450759.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241029120602.4061566-2-robh@kernel.org>
References: <20241029120602.4061566-2-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_161536_949801_896E3411 
X-CRM114-Status: UNSURE (   7.36  )
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

On Tue, 29 Oct 2024 07:06:02 -0500, Rob Herring (Arm) wrote:
> Fix compilation on Arm by adding missing static inline write_pmuacr()
> declaration.
> 
> 

Applied to will (for-next/perf), thanks!

[1/1] ARM: pmuv3: Add missing write_pmuacr()
      https://git.kernel.org/will/c/bdc9a64c8b20

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

