Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13856CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 13:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=219KhmwH9vSJQBVzznt3qHsEccda/bfcCm5kTcULkl0=; b=Ed2KsvxD4yt39BjgOgCXg3iL83
	4cZR+CLNf+0GKhlS9x7KS0vL5nEziR0xjxJF5ay+6DmOZMixbYyhZJoWOJsz9dsxMlI9HY/7ihdl1
	BXMCPbNeXcn/kPt6pndn9CCiwAYA8d81RGAhMik8ENWyfKDG+qutUuycoUsl1qvsoRBywUtkWMW/Z
	nVH8OhUXYpUCzB2Nhv3I19tWElk6xVAHmkqgdwEe6BbfkTzrFb41/YcmjCYwASzVixZWitM6F9Icp
	1U/i6OSeeBkhOAtSmXSRDuoqzv8uvs/y5n9//oDlaj1Nb7OaZIyRffSFZp6MStvv/BRIdVQ66cNJV
	v+oYXgxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXfVO-00000009WLs-1C0m;
	Thu, 11 Jun 2026 13:31:34 +0000
Received: from fhigh-b2-smtp.messagingengine.com ([202.12.124.153])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXfVJ-00000009WLL-0rdi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 13:31:32 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D31537A0126;
	Thu, 11 Jun 2026 09:31:27 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 11 Jun 2026 09:31:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781184687;
	 x=1781271087; bh=219KhmwH9vSJQBVzznt3qHsEccda/bfcCm5kTcULkl0=; b=
	PssYklmMgQd/NnegOykes7WiD+c+jK3rBjaDDaJP/DERwZGNjRRwtlcHp8N57RKr
	vmIMcgBnRxvlvarv270mXZtqRCfGDw3b6hsmA+Wc7GnG5kp5Yc/hVywPw2IAy74e
	lyXDf7kxzoyx80QgZQdm71OaC55kzXmzHTr52L2CB3Ps1HciFs95N5Vt0UcNN/TN
	mcdy/5YCSfPQy68XCSBRN5HUIFlflTKxfHBVuo8sgnYCZ4w7HgyGHsCMK7LJuhCa
	eUUOtI6IbzuOCnqnt6W2bUmphB2JSkR56/8ukmtzB4QaPhEhTtuNG5rslDUTv8Ak
	zXZdXVsBHJGIXVhYkTyiLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781184687; x=
	1781271087; bh=219KhmwH9vSJQBVzznt3qHsEccda/bfcCm5kTcULkl0=; b=C
	T1UiX+luP1/onOleAgWv7yjEiLS0siasnezAEza95WW4YPytNdDXaKBnz4qb9bVS
	z7cinPN4gt2gQ51Pa6SBqMy6FCHcYdc+cAmwBeFvPRMI9qXgDVihCntsACGlnrT2
	0kC9EyhlPU9DTZbI1v32V/CZ8Nl0Xr9tUh73bdp6XdwRAht+sV1FLkL3RgYCxRQ1
	ri/Z4E4YZ4eSm66OhdmNpkp/GfggZgLSLQbIZvJQ92NA2CNeBHYDFAxgQ0vSBIZq
	ck1GH1hZiciCZp53yrAgQ1LrtY7t+VtTmYhSS1kZbKGnrUG4ytByP2DLUT9YqWlz
	fDyGUK+UunpkIUNwXj9tg==
X-ME-Sender: <xms:r7gqag0bpm5ww4T4HVsdr1TbWgLE5SRfgGoIXQKRPTwZSA02XdPjRQ>
    <xme:r7gqal4GkmrHtD36sCj56PA4-gdPtkdMGZKwoINR-AlD49Q8fTy6oCad9QBQMHNEB
    5CC2Qr153-gE1JvnWc02wNPAYXdnJeIbc7vGw-Hzr7a_gS2ZDR1YiM>
X-ME-Proxy-Cause: dmFkZTEYPqUH0OyBvMlLDpHJgbwSXLSQRB+fH/e8ybYbUTpYWToxjLYyQcEgHUbFh1Itst
    k1oaJ0vZMj1Koa8RVRsUGgbbmsxoeIikzMQYu24GAbbg+bSzyIDj7KhlGyveNB+3XbBaf+
    bGX1zT8pAOH5krjE28tdXN/MBAYm4hJ8X7oBRR/c7NJaWCwmcTWXFAN2Nq1zE2AhzTioVc
    Fbe3kvg905wdMZSZn9Aa45i0Dd7qKvGzjnTUzqOme2F1QTxJEjX3AjhfDMc7g/KJRTeyfF
    Jpewztda69LMKEvcDiqniX6hxoBhvTAnVmAqL0S4saJWPiA7ROKw6xK3lOo+lmS28t80FU
    7wPr2i6w1USiY0fGZ3qEZ+ixFLgWOfxum225M09NG77ib+epuzVstK7xnAeNopFkRThc2b
    RcNSt8wZiyrnTIjZrKmyvgOjX9NgodFH0qGHw2KTtM5IVbbEmZe7hW2Osdc3T88TcKvl+8
    6Hvpk/fgQtUVdG24zGzhh6Bi10wtdpos5nhEKmuiLGJjWqOWupETIFuJfwGmCtreYCLuuK
    HuTnjxnEzf7hbWiNQ507mvE0OxwbHhEw0lDU3yjXxp+vvsmobXQ11JdPdLrgTdnRR0qWzU
    SsxUYZj6kjc6CfXUOfcPhK2V95EN+DJRDs2owabgnGC4RC3LSmMdM469yegg
X-ME-Proxy: <xmx:r7gqalP7iWbxcYWIDa-10JIZ8EjTgLtM3dSkyrDor0fPdZYLGibJew>
    <xmx:r7gqaooCwNmbhXeW4Bly6JjDjg_sgnqEnwXyz3DF9rlNhZnGAfV4zw>
    <xmx:r7gqaifl9YMKpjlDQlmpnLXekeJFMCOccEnebvnSOc_r3ZOsTrLGgQ>
    <xmx:r7gqamT71H8pbY9om7MsLzSMh_5aBUDLq-YG8i4QsFdlPMCIPc8SYw>
    <xmx:r7gqar6kd_mA-GCgtKwWlBp_Zt8Tt-_Dnnrbum4Jj1rzq5ouW8d5TE9i>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4E2EF1820082; Thu, 11 Jun 2026 09:31:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AUV8JOC_Zpjc
Date: Thu, 11 Jun 2026 15:30:55 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Aleksander Jan Bajkowski" <olek2@wp.pl>,
 "Gregory Clement" <gregory.clement@bootlin.com>, arm <arm@kernel.org>,
 soc@kernel.org
Cc: "Andrew Lunn" <andrew@lunn.ch>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Message-Id: <8de15abe-8352-41f2-85c6-bdb50eb18e9a@app.fastmail.com>
In-Reply-To: <956403e3-d47f-498c-9f62-79d39c1cf5db@app.fastmail.com>
References: <8733z1c8uj.fsf@BLaptop.bootlin.com>
 <bf8092a3-d037-44ee-8e08-8b2204e5cc95@app.fastmail.com>
 <4e690104-b42f-4a2b-ac52-5ebfc82f6853@wp.pl>
 <956403e3-d47f-498c-9f62-79d39c1cf5db@app.fastmail.com>
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v7.2 (#1)
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_063129_681347_8BB69B7A 
X-CRM114-Status: GOOD (  20.56  )
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

On Tue, Jun 9, 2026, at 21:29, Arnd Bergmann wrote:
> On Tue, Jun 9, 2026, at 19:35, Aleksander Jan Bajkowski wrote:
>> On 09/06/2026 18:11, Arnd Bergmann wrote:
>>> I'm a bit surprised by this oneline change. Since you successfully tested
>>> this, I assume the change is correct, but I have two questions that
>>> I would like to have an answer for before I pull it.
>> By the way, the upstream safexcel driver works correctly only on 
>> coherent
>> platforms. On non-coherent platforms (MediaTek), the SHA-384 and SHA-512
>> selftests fail. Since the selftests pass on Armada's SoC, I assume I'm 
>> right.
>
> It's not necessarily proof that this is correct, but it is quite likely.
>
> After checking the datasheet some more and finding that this should
> indeed be coherent everywhere, I remembered that even the old
> 32-bit Armada 370 had a coherency manager. At the time, we used a hack
> in  arch/arm/mach-mvebu/coherency.c to mark all device nodes as coherent,
> since the original DTB did not contain the correct annotations.
>
> I suspect that the Armada 37xx started out with a copy of the
> old DT files and also never had the annotation, but then never
> had the same hack because arch/arm64 does not have platform
> specific code.

After investigating a little more, I think the correct fix here
will be to mark all DMA masters in this SoC as dma-coherent.
I thought there was a way to do this for an entire system,
but I could not find that, so this likely has to be done
for each DMA master separately.

Not sure who still has the hardware and has time to
test this properly. Given that the incorrect DT has
existed for over 10 years now, I assume this is not
urgent and I will skip the pull request for 7.2.

     Arnd

