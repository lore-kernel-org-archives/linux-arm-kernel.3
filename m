Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A81C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 12:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	Subject:Message-ID:Date:From:MIME-Version:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PrJAjZIsjl9UUPWH1CL5InP4eR7gP6Z551S3b2Da1R4=; b=Wu+urBtihu/3xmI07E9g3iY02R
	BgY7PXK/5MS/uPBKMepuZCrGSH7JtuTMKGljJOqkg2wf7D12zNyBcyKun44Qnce0Mr7KzwSRIgiwO
	DhlmtLhOY/ofy36oErLkewemDoz1JY9zRk76P1Q3uJnuA49IyF2HDmQlNVjH+q2QZwysZMcoPulFh
	U5Uf2sAHz11Vd8CQ/C3XxPuBvAI/j2ohcIUjaDuQnPhAViSpjvsqhRwaCeeImapMKXCWs99dOokPX
	Ni4Bp9NbB3ikaCCnUCVqboUSOXfTOMY80VG7q9gX/dKX9Q5N+55sVI16nQycj6/UbH+1BeQQXG9TL
	Qw7fNqGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxl13-0000000EWR8-1c4o;
	Sat, 22 Aug 2026 12:40:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxl11-0000000EWQw-2yqx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 12:40:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F3F77429E6
	for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 12:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7D161F000E9
	for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 12:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787402400;
	bh=PrJAjZIsjl9UUPWH1CL5InP4eR7gP6Z551S3b2Da1R4=;
	h=Reply-To:From:Date:Subject:To:Cc;
	b=XsyBBvT9XNm4I/fi0uGin8gW8CtriKlUarLGDBkfh7TeFCJGY5P58xvqmBPS+4nC2
	 OD7yIa0QbOyP2y4u4kxIPyDxu+NFQ0xtxdbLKBlZW5z+jIXiCFGSZAISKDYrB4ODuk
	 RgwirKcxvkm+HFnKRkJBhW8Q37/4Qk5w2mtCKeUomY04xU4EBiQexMbLwVplPJVyIa
	 FxZijdNjWzi9S4Zi81Ivsjv/t3AvctBeHLXURnt5PGiUnOLxErp8HSEw1ErOmFXnvs
	 vR1XGMeGtGJEjxeLCFrjEPM7M29pC9qOK59b91ag0yxR+x3HN4pqJIK+W3zgA1YKc0
	 SzbwFK+zj+aAg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b015b2d792so1937484e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 05:40:00 -0700 (PDT)
X-Gm-Message-State: AFuF++lwqLTPqff+zot7gAkirPVVrDjCM3ltEIKo+A85fy7Y79Q4GWyH
	HBYjmmWNADbvXC+tCHrnP3HmOtdQmHosDWZZyfkNbBlxDDE8sa4BMmEtvb+72qL1ndjBvFTxbsk
	Ctl763lqV1uh3fP06EanimWPohmbsrv4=
X-Received: by 2002:a2e:bea4:0:b0:39c:7922:b43d with SMTP id
 38308e7fff4ca-3a1aee84f48mr32697671fa.13.1787402399311; Sat, 22 Aug 2026
 05:39:59 -0700 (PDT)
MIME-Version: 1.0
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 22 Aug 2026 20:39:44 +0800
X-Gmail-Original-Message-ID: <CAGb2v640LRCYpRq8omyRirD4CUSd2mjm72EJ9FtWvZe=Vovg1A@mail.gmail.com>
X-Gm-Features: AcwNN1X0O9LF6pLX5IWOI2SoYEqs1hPU6QRSfUTrpJH9BsWMqiE24CzYyZnH0ig
Message-ID: <CAGb2v640LRCYpRq8omyRirD4CUSd2mjm72EJ9FtWvZe=Vovg1A@mail.gmail.com>
Subject: Bug: PHYS_OFFSET no longer points to DRAM physical starting address
 with CONFIG_ARM64_VA_BITS_52
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, lkml@vger.kernel.org, 
	Jernej Skrabec <jernej@kernel.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On the Allwinner H6 & H616 SoC (and likely others), if running a kernel
compiled with CONFIG_ARM64_VA_BITS_52 and CONFIG_ARM64_PA_BITS_52,
PHYS_OFFSET no longer points to the start of DRAM (0x40000000) but instead
points to 0xfff1000040000000.


I've observed this for quite some time but hadn't really nailed down what
was going on. For context: the IOMMU on these SoCs can only do 32-bit
addresses, and that's pretty fine since the SoC only supports up to 4 GB
DRAM. However the DRAM starts at 1GB offset in the physical address space.
We want to be able to map the highest 1GB I/O virtual address space and
thus need to check if the physical address is within 4GB without the
offset. Having only 32-bits addressing, the address will wrap around fine.
So we check the address against PHYS_OFFSE, which breaks with the mangled
address.


I suspect this is the result of the following commits:

    7bc1a0f9e176 arm64: mm: use single quantity to represent the PA to
VA translation
    9684ec186f8f arm64: Enable LPA2 at boot if supported by the system

The first commit introduces a negative (wrapped around) offset to
memstart_addr (PHYS_OFFSET) to work around mapping restrictions, and the
second commit makes the offset dependent on hardware.


I hope that Ard and the maintainers can look into it and make PHYS_OFFSET
always point to the physical start of DRAM.


Thanks
ChenYu

