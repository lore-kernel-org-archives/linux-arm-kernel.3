Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E25C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 07:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UASOpUd27FajnWGTY24G2odoU+/JdXfm1+0N2JzuaTY=; b=IFFCwbKrqkIsMb4h8oL/HKP2T8
	t3arO/b3JiDPkVev7M94ZccvlALXwJSz8lh32d5duK1tPUQPEZ9lQWUQpaEGe+p3rSCsUTR19NSys
	eIJ0Ocm6jzHTGib78fqu8gn2MLHg9kTdkHvCsVd5on+qi6OAYy48SCoNH1BYyENNdiYw/G5vHucPO
	u6vcQ9/vf5OgW5PMyu9SygIxEWHeBdwQvSlwFXrhOf3NOqP2WRvi19LaeWq+8JpWrEIWVQAWDmNmy
	qIiJKFO8AQjK5/0NFu+NLzWUQykhGX4JZUI6kUHDKF3gU4EtDwjpoIO6JIHJ9LuSpTOUalgG75Ctt
	+8KXQS8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAGr-0000000FhET-0y2C;
	Fri, 24 Jul 2026 07:24:37 +0000
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAGo-0000000FhDk-16qN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 07:24:35 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id E80DAEC0114;
	Fri, 24 Jul 2026 03:24:30 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 24 Jul 2026 03:24:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1784877870;
	 x=1784964270; bh=UASOpUd27FajnWGTY24G2odoU+/JdXfm1+0N2JzuaTY=; b=
	EEj/FyvVPQjH3e+Ov5yt3NGjD3UbynL3+x1AgfgfbsZH+W0L7oDzhm4TOfz6UN3F
	6TCxw2jOzuidNWeoyVwgvvlNg0w3DUuAkhL2IjDob6ieCzNZ54Y5USD5BM34/Q+9
	mcxA6l4Ba4wEeDCtS+RJ+zoFUhLmqxCQ1A2KsScGPlEGK7DBNkG1uT9xcd/MgXFs
	cuKsXGN8/IzvxgBHVzMbktQcdvdPrZK1wmsFfQWTwGzcrh/7Ngbk9qoGnVinxVYK
	JbwxvR81bm6vbneXQho7oD/H+rYaapWarD/i3V5vAYTDH1xkjpiUvqoJ9CUlxOlS
	CuXZf2HPQSpYtLVj9JItcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784877870; x=
	1784964270; bh=UASOpUd27FajnWGTY24G2odoU+/JdXfm1+0N2JzuaTY=; b=Q
	Dyj6lWYOxXmE4ZXZ0SNH1SYy3/Xd7acx8R5FI8hCWtIzYzwaCzt6zzU6gM/+iUOX
	xdj18vCoF57ZihSrY5QQ7DmzBdYNi1mUp990S1NbZ0Hk/ziSVgb08WRZ5pOktrW7
	wt8ceUZMw1ztXtHJMcCCwfVntOvfmlcixOj14cSN/jQTdw+lrAsBHse5AY7lJ8su
	Xh/OdmU6PRbk6v3ln2Q3ggSWLp91mra5Sc3JszizEa/ZtLa0RVaLLwv2KRPC/mfB
	b6gnck96NL7RGWHCNu6MHwdrXjEiHzx4lUH2937NTery/8JERYkTZcQyx2z3FJ/o
	Gvec3y11EUxDDJ+St45dA==
X-ME-Sender: <xms:LhNjam0-MmsIAI9dK2c32eTxhoo0zThxSAoDFcHcFbdfgy5e2EQ9bg>
    <xme:LhNjaj5WhbYSgl_-eaAeCnmHeiNrVb3cDIzx_xwoPlwRhIWSK8f0aXPmChIV83xBi
    WDM6Njx6zpNCL2w62ZlPIz2iPnAs0IS8LckGC9U_Av2piR_ZET-nQU>
X-ME-Proxy-Cause: dmFkZTEI9HgjTApJjrBlMcMOf/zGKkrThW/LhcCA33Z3UN4oMNQsjz+GL0eU8ZqGDS7XlC
    K12OfdYebsrdrlHTAMnZZz2Cp3w87CgRPcVRc7WrLiKIBtmAPVM5QzmpM0NeE9vcDD9Mnw
    g6XpWFgRp24Ep1tTU22kfTY+cCCfN7MlbvJ0tbQ4iKtdEvM/pKCS3qx5Cx3lGkHaCWyYOr
    RQy1jFjX/xFfh6kc0/03Cv14NlZ1FejvEfyuMUIwMUrzdYOxTOcCKQPlfg2OgxEBKgN9mS
    GLXZefR4VU9BpUFKaCNSCGDnMp5+jB9TWTGAdNoKjEdf0cDCv+2MiRJrb7jNL/UEdRVMWK
    wAJaJvmRl54Mk48f8jcrjHUggiCwyMloJ/uqiL3qgUQKoMeI9QFxcf8zmw3rzmZPx+TgHu
    6X0XnN8Wedtkoh5PrE6SdGD5bFW15/yAzX4BMY9Q1y5zBb84zs3FziZl9wCdHT8zmWO0oF
    STlUKwxWSvzO98kaSfhuxvK5GOME9b+b/6silPJngitRfg7Kv9T8G/biW4gWEkn00CSMSv
    tX2v4WfbQWsK6tzQgVPek3s2jGaVRLJRmcoItjxHwYkngLb2hERLivAUWpiBb5ZTeDjsPv
    jyLugyP14wNQzj3J6b2V50Lf9AJVQLMlIC4KcWzs25tZrnNM9M+XfUIFSPgg
X-ME-Proxy: <xmx:LhNjajDcXsz9s-9-Y8nRFMEzU_unfkdO1S6_-vIsaMvawiwcA4yk8A>
    <xmx:LhNjaic6c94MwzO9NkLa6vyQm97FIi4OW51cOqBvGwHNLeP9r3_Oww>
    <xmx:LhNjaqIUfAGjp1udsG89ovmYHghDZxLH9vU2RT63hB7cM1T7OS-Qow>
    <xmx:LhNjal2WJ5Xm-setWKKwvtdmBL0arv27tAfTWh2PiCXffSwDd2e2nQ>
    <xmx:LhNjarR5xj6s3TkRP8WCAyYsDdOlRAHrL-tWoqBcpjcU8DjHCktQLVK4>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9AD49182007E; Fri, 24 Jul 2026 03:24:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AG5wu2mxzL5c
Date: Fri, 24 Jul 2026 09:23:45 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Karl Mehltretter" <kmehltretter@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Cc: "Russell King" <linux@armlinux.org.uk>,
 "Kevin Cernekee" <cernekee@gmail.com>,
 "Gregory Fong" <gregory.0xf0@gmail.com>
Message-Id: <3c79d2dc-8fbd-40fc-8b2d-9d1b4f8ed34e@app.fastmail.com>
In-Reply-To: <20260724063048.12565-1-kmehltretter@gmail.com>
References: <20260724063048.12565-1-kmehltretter@gmail.com>
Subject: Re: [PATCH] ARM: set MAX_PHYSMEM_BITS to 32 for !LPAE
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_002434_589343_3B8BDFBA 
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

On Fri, Jul 24, 2026, at 08:30, Karl Mehltretter wrote:
> The default MAX_PHYSMEM_BITS of 36 was introduced for LPAE platforms,
> but also applies to non-LPAE ARM, which has 32-bit physical addresses.
> With GET_FREE_REGION and CONFIG_WERROR, this causes:
>
>   error: conversion from 'long long unsigned int' to 'resource_size_t'
>   changes value from '68719476735' to '4294967295'
>
> Use a 36-bit default only for LPAE builds.
>
> Fixes: db57f88e4ccb ("ARM: 8411/1: Add default SPARSEMEM settings")
> Assisted-by: Claude:claude-fable-5

When we added the 36 bit limit, that was specifically to account
for CONFIG_IO_36 on XSC3 cores, see commit 23bdf86aa06e ("[ARM]
3377/2: add support for intel xsc3 core") and the thread around

https://lore.kernel.org/all/CAK8P3a2MCdUbN0QSb+M3g5_6HjPsaQwtKxFjADMZWomdry4-Ww@mail.gmail.com/

It's probably safe to assume that none of this is used in
practice, as only PXA3xx has this CPU core now that IXP23xx and IOP
are gone, and PXA does not use the high addressing. Similarly, we
never had any platform attempt to use IO_36 on ARMv6 or ARMv7-A.

Can you update the patch to also remove CONFIG_IO_36 and explain
the dependency?

     Arnd

