Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E81CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 16:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/RvxSYlM/twIIgpH3kj5I2fsJv0XikpfNScMhyHup9o=; b=BRsfzdN+4KKx8WdlWx0xOw+7vu
	1UZyihKgHRcSaukaFsbvfIzDytZnLy8h4l8sLoVivSkbh6APEmV+3JCSj3BH6v/4DBIY9M4rv4qRg
	jgg/nZJ3rk5dnOuv2JpYZHPuxIo1av4ZlzwfGZsbgtNMPeIcKQfrykeMwHQJ4VNfdfJuOXIrKE17P
	IOUBCFXCBAZWbjxMjKAgZLH87/ZasgRXJ+EwvjL8VbidMB6zYASHR2dhJYIFmOGL3MC5S3eXrq+z/
	Plf0+nF/cKDSi1ZQfQu876Ey3Ed5qZJuv2XdtXcU8NPoO4gVGwpUjsCUnAPwoXHjXh2MhVvhWEibn
	MH/yOnMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWz3i-000000060YD-08rZ;
	Tue, 09 Jun 2026 16:12:10 +0000
Received: from fout-b5-smtp.messagingengine.com ([202.12.124.148])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWz3f-000000060Wm-3o5x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 16:12:09 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 6E2C81D0006F;
	Tue,  9 Jun 2026 12:12:06 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 09 Jun 2026 12:12:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781021526;
	 x=1781107926; bh=/RvxSYlM/twIIgpH3kj5I2fsJv0XikpfNScMhyHup9o=; b=
	QygQNULOkUV4nWCxEImhr6xamOaYyI3aJtv1XjCya7JmSG8IfPhMYx5pKFOVML+j
	C45cuLQKukTZ7uDBbbTkT5QTg3dfcbLdjnDqapBocmQhS394wsVGiaMILT7lMb44
	hILvnY1w9yaWoJTheDt73/AMWgi/SCmGvQWNjDEplniLyWFguy8UqxHVwD0NVaop
	w2kXp/dAHZljXmaOKk20KHWl25UBqum5+43t7oDYxxqTtzq9YFMwE1MaNbqPic6X
	3/XYuxc1qqe6+02YYvQUk4hT7eQF9IbIemBjRSAp10iFUM1dmc8aEiJRe+0dLD2l
	o+p9G/vUgm5HGAJ8UmK3Fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781021526; x=
	1781107926; bh=/RvxSYlM/twIIgpH3kj5I2fsJv0XikpfNScMhyHup9o=; b=Q
	DhbPw7vEzr3x4Q42tcJIJhnt0AfQlxA0u+44aEBkfFqM6B1ys+HONdSBK5sze+1V
	Zs7DNTDEGFj9GvBOylPvrCDQ70AKIZ4dmzpM6mJtx7LGnzYBhlmdpKTJfrDwPX+9
	cLkG7Aut56DucMiJ0xJKDkh+/G5PzZTgY/2kpZDxlwdF4jPZVzQGtWlsjsA+w/XA
	f8ztk3/z4weehX9Fa5un5oK2EaIP/E+mg4uScQE6XRYRHkXb+2tB7cigQr73eQl4
	sCODc/LZNVw2pnPzj09bTwgFHRuYS8SZpawo80Rw5wtBEbHwCazXXlQxXxTtt+PO
	SL4Cw1j2mG/PR3uqvJhgA==
X-ME-Sender: <xms:VTsoavKUnL6v-nXhZXwJlIMPyxImA-yX7z-Z5ngRIuHGYlmIMjsprQ>
    <xme:VTsoat-qI92DlKuc2Gee-sI66BAi8VPAnVMccEuh75KWbnhQFsYv3NSsyjY8_6zMt
    KJ9ohlFzF5B7OsSPp5EjdeGab_1vqbBvG9qGlNYc0pWPX91hl1XeiU>
X-ME-Proxy-Cause: dmFkZTFb6VnIwIzooEwwEqskmLizFX/ukRKZyIcrj+/WWSHHMok+ECOHIw6mfqN6BeZAQD
    ddihDiuzVNRot2dlu1hkyg1a2hTRnDX+OezP6PWXpRfObYrcZ3Q0A5RgHiUqqW58k5oQ6D
    ZcmptSb4RO8wiD7sNgEQ+v+KK45zAd1b1zEZqqZ8guT3udGa+QUlBhHJWgL1sRu8Nl2DFv
    Ga3fmvQy8kydhBqw65Qtb2IxZeL7cadcghKymODatCb7q8UV586nWU/cnWP2ImOrQIUYa4
    sp8e7eoIjKoEIA/FPUUge2Fd/8LuD9wcHGexvJBYmPMIc7OTzfvhi+LQPEBeSDsh6U74ao
    5chIzweQNPu5dYa2n4+KF292g1QiddImilql6+ps7Q4mrI+KrOJxI4cHzo3Arfxry7aMBD
    mHvfdECx652VAYlmPapjij3biPz5nK1l5T75tCTuyBe7AgxoXNoctwY3aTyYIkFsCv9xI9
    aLxL6SBCuS4j4daJzBsDGsxtihLxfRmvP7fzQdqkQ7U9G953I/XCpSfq1OjYz3urAemCjE
    htAfjYXaWSpPGuyVnt3EpupBq/XrPArcGnMnHRqBAfMTLf+HcRQHOq5ge6pXYIhdyXHbqG
    LjzjgpM9g86PVYM3aBPMJMuf/QCyABf91lefZ1oUrvZg7XDrjgHvtgMK78sQ
X-ME-Proxy: <xmx:VTsoajCb5V4euRW4p7nB0YEV3vuFipWebrU9Bsg3we4N2pfmBA9FXA>
    <xmx:VTsoaqOhH_DhoUU_ywOQ6s8QLtG1FuXlS25o1SVZkN9w_PBaaqxRKg>
    <xmx:VTsoaswYqUw86rw4erh-yyGKyzRNOMzc5jB1vgev2x6ksciOtAjfPw>
    <xmx:VTsoaqU2pKa7tq35G2fimgY3nizedD_H9abq8sS7bZN5oA7q8qEAHA>
    <xmx:VjsoapuOL1krTF8kMralGT7XGqPLEbhT0Fx74A9ofPdJ7pzSgh4n6U8e>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 89A8A182007E; Tue,  9 Jun 2026 12:12:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AUV8JOC_Zpjc
Date: Tue, 09 Jun 2026 18:11:45 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Gregory Clement" <gregory.clement@bootlin.com>, arm <arm@kernel.org>,
 soc@kernel.org
Cc: "Andrew Lunn" <andrew@lunn.ch>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 "Aleksander Jan Bajkowski" <olek2@wp.pl>
Message-Id: <bf8092a3-d037-44ee-8e08-8b2204e5cc95@app.fastmail.com>
In-Reply-To: <8733z1c8uj.fsf@BLaptop.bootlin.com>
References: <8733z1c8uj.fsf@BLaptop.bootlin.com>
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v7.2 (#1)
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_091208_254467_D3C551DA 
X-CRM114-Status: GOOD (  11.32  )
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

On Fri, Jun 5, 2026, at 17:20, Gregory CLEMENT wrote:
>
> ----------------------------------------------------------------
> mvebu dt64 for 7.2 (part 1)
>
> Mark EIP97 as dma-coherent for Armada 3720
>
> ----------------------------------------------------------------
> Aleksander Jan Bajkowski (1):
>       arm64: dts: marvell: armada-37xx: mark EIP97 as dma-coherent

Hi Gregory and Aleksander,

I'm a bit surprised by this oneline change. Since you successfully tested
this, I assume the change is correct, but I have two questions that
I would like to have an answer for before I pull it.

- I would expect a missing 'dma-coherent' property to cause data
  corruption, as the DMA master may write directly into the L2
  cache, which is then invalidated before the CPU accesses it.
  Do you have any idea how this one ends up working even when
  the property is missing?

- I see that the Product Brief for Armada 37xx mentions that it
  has a "High-bandwidth, low-latency IO Cache Coherency" interconnect,
  which also indicates that the patch is correct. However I don't
  see why it's only the crypto engine that needs it. What about
  the other high-speed DMA masters (neta, xhci, pcie, sata, ...)?

       Arnd

