Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57FBC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 20:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7gjPQ9geWQUzmY0HHZDN1BH0YbohllYXnVzPU8aiejM=; b=fwoi2mLocL1/3Q4SGPRnLW9XYL
	F9Y5xlDLyV1ngsyEkQ4Pvq5jtc0cNbTlkyGtXuMQuc4MdzXgOpfWd4A1VsDrlVpWpBpxr/TPt/4vy
	J2GlCYjOP5p8xuR6KNAVTuK7TGufh8GWBcN6UU5f5BstwB1GjlFC6bgc+9HnrDUhMKCu2s+rfVZ6O
	ZtUXxRsKbBRBGvAFaNi/ICNbYge75bwDI2gNGV058bCzEXGXmpNaVda/jpyOdaGPw2PuoavBYHaMa
	ozrA7W2nQjKYCkMgu815jI0ROewiVEblvJRirAYAPWTyuH3OBEoDgVdUt5WbgHjLfeJJ+xUwroHfY
	jTxyLFeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwmsr-0000000AW5q-3XoI;
	Wed, 19 Aug 2026 20:27:37 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwmsp-0000000AW4s-1Ss4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 20:27:37 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 66007EC0177;
	Wed, 19 Aug 2026 16:27:32 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 19 Aug 2026 16:27:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787171251;
	 x=1787257651; bh=7gjPQ9geWQUzmY0HHZDN1BH0YbohllYXnVzPU8aiejM=; b=
	Z33Bmwc2OvXTelCUpnTwIGJ3IH693L2KZYONfsgppHiTRB5c4fHtcydZItAbRoZT
	eTUHuRAIDZWc59a3hv/ECfme3/440KczdvWC8SvFCTP8wpKR/FkZxfw2qo16IsqY
	B6njwHFVDZaM25w63jPjIfoWBS7+DiZiroVIQq56hGTMv7or3bcGcNq9l90WakpP
	scHPvLPefBXRm9njdJxSapm8keNZ4pRtixi/k/X4EBCBlg4O0jvpyLkDyrRP1V5k
	yAOA1eDF+Vh88ecyYqAfwKNlPTBkJ/0JTf/2XuW1Jro4/oBv/K4zT55RuDJZUr+z
	jceGmVowciGS9kKdW7ZQ/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787171251; x=
	1787257651; bh=7gjPQ9geWQUzmY0HHZDN1BH0YbohllYXnVzPU8aiejM=; b=a
	QifVuQsU862f8jORLunz90OO9owcmiO6a3GmJERITp1kGCCNaftn0mKPEAw18g5A
	59Z83aqZl8Lsh85/woa7/HP3TsZQNYVAdVOoO4Xy2Fv3VD8pGaUPsEp3o0Wnfj6c
	Z9NwwkSV0RJAbZAQx7EcfuLmcWpnDjeF1u28Ei7G+2zcZQB9ASqe9O1Oh/5EUdKf
	OxXOfQ98+8+qt4+Vfiy5wA2peBFsctdPYj003UK+1VaxcufUQy5VuUhlr3QBJruB
	P/L0gHJGnk4Y7fjt/i7ASgkrNWn8Kd284C6zGhityYSwxEfwXK9Ce6e6lNC2dzOG
	Iww1Ihuw8PNJs4KAuq8gQ==
X-ME-Sender: <xms:rxGGasduqGfNYrrio37MCEExa7rWB7RdMIrGAfLU9DpZC68UwdofkA>
    <xme:rxGGapDIQAPBaxhmd_gtkeC6wFyDbYVQ6kftYkuNnF0h7AaI8Y6QRclHa8nysV-O3
    buAuZdSgiiOzfS2PxROVZjqkzn5AxH4SgiYwfoSw3UfujcnZLwN02o>
X-ME-Proxy-Cause: dmFkZTEqN7pJJFwSSWvabTUm+thV/naPxY42LQwbud26ooufKPMLbIzFwpAyaDWNzsKjzh
    GKdi4ATJZLq9KLsUfXE8IQPvtvQUlwRnjkLpf+BLaHLmegU5Bsc/qYH0rlwBFz30MTZuoY
    +VH6U/1hm2yX+YW/5V8b0GcdiJhe35W62dKf3UQa9fIcrQOVL7gI7nThOHtEAGrDmOPcHh
    XbiXraaMqYDeBIvTZulkLyRMkrPeTfgQGX9/JeYwmSBLbIahZxqA291r4sgx0gbzF+2CtB
    M1ZYJ5slScgz0XyNSp+19pHr0uqy8UIx3H+BRZ/fxA7DWW/UEmnhlYcbpAI7A7AgWBM0Ui
    w7bXPd5gBwoBUSiGoFZugnRpxgupRvCBEwYJOUe8zKu8MgoT/Vixf23EV1qKXmIxQ5mVS4
    Yv0o3rLuL+WdnpNCO3FAqPicg5zajX/M/8cCW0QtIPkuOLmXR+ViY5nLZn3Wc9S/ffsXKw
    Uz5gVPQbiW2CG4K/mXYZUMzg/y39jeX9IT7VP2+2akPywxGWpvtZhAtGsCd4JahKbEyI8a
    z+XrhstBdWi9f+19DVjth113B+x4Pcsfb0Y/U85p57aYbhLBUzRDI8nbg0a0ajvTn1xaGL
    I0MCP6mJPZ3aVk/HQuQ7iWLX6cMGaR6AoX8/VmsZKLtMIw0nr2Gwfcm4lMMg
X-ME-Proxy: <xmx:sRGGamFAxrP11sppcuVZkVSn0pMWs71SMXJfF4wDJJW-0Y3YsoF_jw>
    <xmx:sRGGahbv-XKmi6iSJdUD0o8-qqp2cO40tuoZcpnogKkIyk4imKfdFg>
    <xmx:sRGGagDsWnFeAjJzBH4LfuYiePnqqSOGYYdwQNwgicH9V2M5DOSwzQ>
    <xmx:sRGGahl3JxJINurRg8F1Zm6KIYQZjVF-wrZltKzZuq2pe8iFUxSx6Q>
    <xmx:sxGGal0zzQfACh0LONTqMnQoLR3IbfBssatpcPiyJ3aTyhT9tNd2dW0G>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 09BEC32A0071; Wed, 19 Aug 2026 16:27:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Aqm_jcT6PvEF
Date: Wed, 19 Aug 2026 22:27:06 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Karl Mehltretter" <kmehltretter@gmail.com>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Ard Biesheuvel" <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <20969b87-a073-491b-960d-8c4c2087845b@app.fastmail.com>
In-Reply-To: <aoX6wpJjMS1vtlVY@gmail.com>
References: <20260817000231.21311-1-kmehltretter@gmail.com>
 <e238944c-9349-497a-9d30-0dd2edd7f115@app.fastmail.com>
 <aoPKzPb9YUVULlXG@gmail.com>
 <e3c463a1-81ae-4bef-b65b-fea1a4eda5bc@app.fastmail.com>
 <aoU2ezSYVbOw0hun@gmail.com>
 <4078f942-e29a-4f6f-b6fc-780e8c6d6874@app.fastmail.com>
 <aoX6wpJjMS1vtlVY@gmail.com>
Subject: Re: [PATCH] arm64: compat: Keep alignment address arithmetic 32-bit
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_132736_026525_C7263C71 
X-CRM114-Status: GOOD (  15.08  )
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

On Wed, Aug 19, 2026, at 20:55, Karl Mehltretter wrote:
> On Wed, Aug 19, 2026 at 01:19:20PM +0100, Arnd Bergmann wrote:
>> 
>> I don't see yet why 64K_PAGES makes a difference. I had
>> expected TASK_SIZE to be 4GiB regardless of the page size, and
>> the top page (but not the bottom page) to be reachable from normal
>> userspace.
>
> There is a special case in arch/arm64/include/asm/processor.h:
>
> #if defined(CONFIG_ARM64_64K_PAGES) && defined(CONFIG_KUSER_HELPERS)
> #define TASK_SIZE_32		UL(0x100000000)
> #else
> #define TASK_SIZE_32		(UL(0x100000000) - PAGE_SIZE)
> #endif
>
> Only ARM64_64K_PAGES with KUSER_HELPERS gives compat tasks the
> full 4 GiB. The 64K kuser mapping then occupies the last
> page.

Ok, I wasn't aware of this bit at all. I think you can just
skip explaining it in the changelog then and not spend
too much time worrying about the case of userspace intentionally 
overflowing the 32-bit address space, as we clearly try hard
to make that impossible in all kinds of ways.

Just explain the important bit with the decrement
causing the compat mode to be completely wrong.

        Arnd

