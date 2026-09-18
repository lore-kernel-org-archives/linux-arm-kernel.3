Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9D8C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 07:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Sn10nmJm1GQwcBGq1LhK7EFwVivWxb9ejNgFwhmMHo=; b=g+UjRNbMB85yWefqrrFUQOoaks
	Vs9jv7D2kT0hNMOT2f4lUKmMjG/RjfC5Vqh6949qU8/6VuxRjLmOuoHMO2Mq8Qit3oEI7sAxcX0xb
	1I0OtfdDrvLkL873Quflpb2h3vSdOAnyH/OIwhEzb+c5zpHyzvjLLDOvyy0UEhbwOvzQ1iCus9Fnq
	6rb1SMfwjlyfaGvbokoTW+iKUepr2lAEmkpjKmzViZl5lF6+YLGcR2sXhl21pRNiiX02y2fz/9Pfb
	vmwxxqnt4I65KhYYMeKCZKUtl1B1BKTO4DjcF0RM8Bq3dkCUSOM8MOxcqSSgHlLTOjRxrEzcYJDaP
	q0jCstbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TCP-0000000Dimb-1Tyv;
	Fri, 18 Sep 2026 07:39:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TCN-0000000DimC-3CLL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 07:39:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 42D0D40E38;
	Fri, 18 Sep 2026 07:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8595E1F00899;
	Fri, 18 Sep 2026 07:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789717195;
	bh=8Sn10nmJm1GQwcBGq1LhK7EFwVivWxb9ejNgFwhmMHo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=dZp4VaxvWHQKfepzbajFNtuFNbXMZcB5fzq6bnX1iFe2xA1DStZf0qGdYT1qnrMJ1
	 gGrMI6G+Wj/vD9JaHcJesuO1FQf+LOISM+25Jp2KnZKl0egmbSr4VzTz4fAawzRRma
	 8SdGDQQ9M4KDz44QkGHOUYmVnJaoyc/8oK8uv/+ZDduFO62wX8y4BpTmflEUis69Xk
	 I5FmZLUoPv8VGGgd3RAmiSyP12AD0/toz6TzzD9pc3/ZnNtW8Tsl4GvV9lhzTtv/fF
	 +EBoETTvI5ovQGEXkBlTI8YTD/kpiFAm2wOMFYcyj/DjU98UUxOPOwN8+XtBq6ozs+
	 3QICssqbhHUlQ==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id C22DD198005E;
	Fri, 18 Sep 2026 03:39:52 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Fri, 18 Sep 2026 03:39:52 -0400
X-ME-Sender: <xms:xuqsan8o0egf97xE2FN4ZARyYXOBSHBzCgiIV-6RWCNDRNNj2IqTRQ>
    <xme:xuqsaugrE16pQfJqS8xKVszlLP5n57Kk0HgSXhf1AV_YFd0xZ6co9BpG2erDq_wsv
    nkRlq5MtrtEifayim4lj8PA-rMTt81NVA0cMrDRzIlQ2WKlpuDe35Sp8A>
X-ME-Proxy-Cause: dmFkZTGDxPb1ZM2vdJ8lkztEK7VL3PksPWKk9fJrtsV3WLqwxL7HxUje6aE/n8i4S3z84j
    wCvi9t0/YztFbkiI7Ao4NXTBmRiOQWbkTIEMyPYKBJOmkVaNQO+uyAuid+ZV8wUOjnYXKL
    dN0BTrtDfZby7rRBccczLVY3Wuwak2UJiRvxaJs+mVlfEs2KPtOalCEkDp2Olt9hI8BgVH
    aoaovAelnROLbU0jt4IWmojaAJ5+NOUrBULT/s/GlLgpZVakvZjtZV9MU0/ScCvLMfNOWZ
    3tbe1n0+pHzgBBkc6v9R1ruB0cXpfNyiTglSXQmCq4stPcs6U2bQxbvZc/9PMu5WWaCAoi
    DbI4GGpMDxvwCkZYaXWep4nrXzlThNHQ49Vw8Oi3Eut4LPoB8ujt6FOhFcCui6k5gkmJIU
    /s3Log59PMwlSemj2k5jdskUh99lBNO1KGBMYjyzxZYyA46Ifqkf/UWs3EfuCxwkuxLPiQ
    Ol1OyzvSYm+4C++uzzHSkJq6JgF+sKippTaUsyDZG1t/OPhE01YG9X10c/Pj0hqhOmUdp1
    WzhFx6TFuogv1I1vIVNUFT+Yt6XZWMzjXOn3m+FVmxZjipfckLnpvCvdjV18mLimRpZM45
    1mP358psHnBySA2rf0wZbVVgH/7f71M5WPw0GIXU0M71c8408DEQlZ2APdTA
X-ME-Proxy: <xmx:yOqsanjy3rVwQh6Z7PvV7mRLcfwpwN0_YyqVM-n3U1bTBMf9jovMQw>
    <xmx:yOqsajEIzuLKZV2XMeh67pCkmdFm6KuLm6OEKR8yPL0igBNY_MN0YA>
    <xmx:yOqsatRAzktySsTmw0BMRWJM3sXKib-zjxpi2Cdc5_qLVs-ZLAxsVQ>
    <xmx:yOqsagwwaaVwK14ci7QknyUWtHzf7PPlidF-C6Get3odiQJxivN5Qg>
    <xmx:yOqsapfLQso4KLeIs3rLQz0kO4CLqs6kWZ0KLO_JeaFk62F2gzU9ovyC>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id AE2B2F80083; Fri, 18 Sep 2026 03:39:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 18 Sep 2026 09:39:30 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Eric Biggers" <ebiggers@kernel.org>,
 "Ard Biesheuvel" <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Christoph Hellwig" <hch@lst.de>, "Russell King" <linux@armlinux.org.uk>,
 "Arnd Bergmann" <arnd@arndb.de>
Message-Id: <9e60a8ef-99aa-49f6-9332-53b70e307b5c@app.fastmail.com>
In-Reply-To: <20260918023054.GB1703@sol>
References: <20260909163319.2116279-4-ardb+git@google.com>
 <20260918023054.GB1703@sol>
Subject: Re: [PATCH 0/2] ARM: Use type override hacks only in NEON code
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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


On Fri, 18 Sep 2026, at 04:30, Eric Biggers wrote:
> On Wed, Sep 09, 2026 at 06:33:20PM +0200, Ard Biesheuvel wrote:
>> From: Ard Biesheuvel <ardb@kernel.org>
>> 
>> Now that the RAID-6 code can no longer be built for user space, we can
>> drop the direct dependency on the arm_neon.h system header, and include
>> asm/neon-intrinsics.h instead.
>> 
>> Since asm/neon-intrinsics.h has all the type overrides needed to include
>> arm_neon.h without conflicts in the uintXX_t types, those hacks can be
>> dropped from asm/types.h, and so the file can be dropped entirely.
>> 
>> Cc: Eric Biggers <ebiggers@kernel.org>
>> Cc: Christoph Hellwig <hch@lst.de>
>> Cc: Russell King <linux@armlinux.org.uk>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> 
>> Ard Biesheuvel (2):
>>   lib/raid6: Switch to Linux's NEON intrinsics header
>>   ARM: Remove hacked-up asm/types.h header
>
> Reviewed-by: Eric Biggers <ebiggers@kernel.org>
>

Thanks.

I've dropped these into rmk's patch tracker.


