Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D723DCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 09:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/SGUs0YIEd66VF0qWd6efTVsGi0XgveZiOoh/RTgHw=; b=AKei7vhoW0ABl+Fc4b/IcVoYjQ
	LDaRX6d9av7SUQwSNI8fmSncncldZHY1o7HbuFC/WRmMC4cM1zmFMTwHzC2kIWkW5bnEyCWTYnOZu
	C9An7BBoit9S81cbmObw3oHdRqNlnXTTwjUxNrZJtGwxkMpV8O3uyZp4Hn91AvMy3Gsdm1BKfiTcL
	THp5wncZMDKqTA28Dr6FC+Sl/YgTENVznaJtCVC6vST8phKLXNBENsRU6wB7/siDTbpJ8YGelNjBv
	YRW7Zk3EZkp4okexpn6iYAAO/tXRHByfE7yiBfvnU3AJGcxiSRAONl0WiIEiaVz7+oeITxGsl3X1A
	J/8Liesw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXyOq-0000000AgsE-2CE6;
	Fri, 12 Jun 2026 09:42:04 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXyOn-0000000Agrt-0kqi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 09:42:02 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 13D17EC0064;
	Fri, 12 Jun 2026 05:41:58 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 12 Jun 2026 05:41:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781257318;
	 x=1781343718; bh=i/SGUs0YIEd66VF0qWd6efTVsGi0XgveZiOoh/RTgHw=; b=
	D8dKg5fajuE3OL0JkbZbNuDlvTzK3k2/SSOqUTeN46HcOkwbX2uea6DrkqbPigc5
	DnmTW+NVkTjVEOtAuNDBV30W/aGdRvTL+yDZDBs6wnF4x5vANJJW6MA9pxKEeXcG
	PnS7mkIxWMunvC1qmz2tajAkFMbx1BSqsa34SaOAEMzz7LOBd00eY8vRv7C5HPv0
	M/4G+9RuA+Mx2ui3P/OeH2frqJZYEfUO9ald0ZfgFYOeoaJsXnjd60HsRarERANk
	/PG88QJaUp0fY2lazG/QmR/atQTEmZCiTcF7LKtyhNNWSdUJP9g4Kv12uXaYDG6Z
	4TXLdyqf4yuM4OaoGTtHuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781257318; x=
	1781343718; bh=i/SGUs0YIEd66VF0qWd6efTVsGi0XgveZiOoh/RTgHw=; b=E
	BMEYjKfnEP8rMDXG+OnyejCTZegA0X8TZ1+hSuenPePtlylK5z6qmzAgS3SEReI0
	gvRahFO/RV+lgQhXfM5kzwKtxJbKEECaJBjCcJtJXFpsj7Wed52Xi2KwgcCdodP3
	uKAxMz1KP80qMCyz5Lt9M/L92jx3XLfHYBnHH5bIRw6ryQqvzM0ExmN9/4SEKOyq
	UI4Nc2liXduATAPihz63xu37md+6nAyxUR9EvkMXOM/DHRshRiATpPU0pciGEsuj
	eMEO6SjQsotigpUNAFtd4RObbyyAWz0AZn3o4ZJk2p0aA8HyBIg2oXKFftZx1oxH
	6YiMC70O3hpf7ds75nwJg==
X-ME-Sender: <xms:ZdQral3Txnp_3JimMTsQwUPG-p2Y4AeM7fLWFnmN8Tv9iMsZmNQ7jQ>
    <xme:ZdQram5g2ENuFmc5k_iNJajQmhQIVdoqgCi56fac6LiSeZ7ouIDInoAk28OLZT77h
    PHPhhjSJdwmyHx28jivF_IxwHRIwvPymedlub3aaoq5L3DTjiujlPGH>
X-ME-Proxy-Cause: dmFkZTEgOGkI4ef/CF24QtYWuT/qA10jYmWmTDetkenrgcnokgLI/1fIQX65pyUvZ6BqIF
    oKAfkJNgTaftZi+RwmlzvUhIM7wxaAJxC0Hy72I31N0XOwabtUw9tNg8DnBTL2+1UlrsNy
    8PXIVHl8E46TxotjHiKb7G/VQUBHqwZe+RcsEw4y1Bv1kVDYNE4PLKkB3aSY/F1OgAdu8v
    1xf96B7Rmc3aeaL5ouKhVsigTyeA3Q6vbC3hHePAipDPme76TA4rKM55E0eoEDX4EQsJX5
    79aIr1uzAzomOmVMv0FbvZCLSwgdxNYjKhaRCQNxhoXHlcMxIKqWERgg5XyMq9IKETVhsV
    Yle1f60NkBMJVML+stKP8wOJnQLIKeQ4BPZg3AXwO6FelAZHVhLlSQ06mqEUeIzvoOysKz
    9NLBorfV7y88B6MlRj90JtWCmo3DsoyYYLaJxn5X6RfKhtzYZxlSUVoCro5kyKYn6fo3ap
    Rp0lZ5N6Cx+Dt7e5jz7v2W9Mym2gBnR1isHRdxGTCC12s3DJot8YsdcV5psh/bFvWRxkJR
    wnxrk5x5ZksQfuh/OIwbq12bFqToGL6d8SGhpj8cB546XcpY106x75yXI8toT3yezQEdWO
    6lfcR0g1GGptt5+xGN6GAwG8OqdVBN16YvKfhB7g4mNlCqdChPaVpHQh38GA
X-ME-Proxy: <xmx:ZdQragX2QwQR8V3xWTpjKfUkq0QTKfTtjvu2Z-GoNQcFoKyKgu4ZeA>
    <xmx:ZdQragk8TOPrA0pEPVQ6WRnxflCwXPxdPDIJC_xmNgLfdZ8n3tiX7A>
    <xmx:ZdQramn2dO6dxAOsn5Towq7cXu06X0G9DzfmnqTg42xHDp0sNgt3CA>
    <xmx:ZdQragYhrwb1gx-RPOZ0hbNPdxYFL-670bBm-wvWhEsRYAA-ZdSCFA>
    <xmx:ZtQrakQYYh83HJpCgwDuIYjEPHBH2cpbM5MTwOcpGxDWDAio0DHZXVNm>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BB036182007E; Fri, 12 Jun 2026 05:41:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Ap3K6gjQ-9OJ
Date: Fri, 12 Jun 2026 11:41:18 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Maxime Ripard" <mripard@kernel.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Linus Walleij" <linusw@kernel.org>, "Drew Fustini" <fustini@kernel.org>,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 "Andrew Davis" <afd@ti.com>
Message-Id: <6a93097b-fc06-414d-a5f4-cf2dc98474d5@app.fastmail.com>
In-Reply-To: <20260612-indigo-sparrow-of-action-d2bcbe@houat>
References: <20260527084135.842736-1-mripard@kernel.org>
 <422d7885-67bf-485b-b2fc-f0604a2213db@app.fastmail.com>
 <20260612-indigo-sparrow-of-action-d2bcbe@houat>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable dma-buf heaps
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_024201_533802_975D5844 
X-CRM114-Status: GOOD (  12.90  )
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

On Fri, Jun 12, 2026, at 10:33, Maxime Ripard wrote:
> On Wed, May 27, 2026 at 10:50:02AM +0200, Arnd Bergmann wrote:
>> On Wed, May 27, 2026, at 10:41, Maxime Ripard wrote:
>>
>> I'd like to wait until we have resolved the build regression
>> from the earlier patch[1][2]. I don't have a strong opinion on how
>> to resolve it, but at least for now Christoph is asking to have
>> your change reverted.
>
> I believe it's now fixed, even though not through a revert, and is on
> its way to Linus:
> https://lore.kernel.org/dri-devel/c7a9dbb0-a5c8-4e67-904e-1a52b3de9bb4@linux.intel.com/
>
> arch/arm doesn't select ARCH_HAS_MEM_ENCRYPT afaik, so this patch can be
> applied as is I think?

Yes, I've added it to the soc/defconfig branch already, though
the automatic notification apparently did not trigger.

     Arnd

