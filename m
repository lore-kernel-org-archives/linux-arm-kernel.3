Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF67C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 08:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bjpxt6wC/Xqqhz10TpneDwIthvnLaZnI4SDqGOP6+ZA=; b=wtQBw3UNpoVNHiHCpuKqSysv0J
	RDE0SJ49ief6k8/CsYzyU44PghP+bS+aRQ1c84ExyIU/lbE66WfR1sal7UZj9hsAny/AxdKPy/X2L
	Afb2Eu1UIkvt8Lsb59h+j3ULLCRFJLRDMLZDXZjfYP0YJvxwC/F7+gdiGZY9iHeLesOxLIOWoLjJD
	KRDiHXFl9nzrG++Z3XCmOW0pILDwEKFbCklEqTSb/m46dFi1mY4mZ9lrJ47OT6b/BL4Xd9ZEw6YUT
	tVDuz1k2afFcgNEkVXYXYI2UUERing2gQNt+vnj3DoEza3ZnQLur0NOS1FKltexlnVseXsYf5DUbb
	3B+pdbzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lqE-00000003rmZ-1erR;
	Sat, 05 Sep 2026 08:33:38 +0000
Received: from fout-b5-smtp.messagingengine.com ([202.12.124.148])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lqA-00000003rm2-3tzE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 08:33:36 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 3177D1D00110;
	Sat,  5 Sep 2026 04:33:30 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Sat, 05 Sep 2026 04:33:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788597209;
	 x=1788683609; bh=bjpxt6wC/Xqqhz10TpneDwIthvnLaZnI4SDqGOP6+ZA=; b=
	XiReQxJf3fKHMVMCFra5ekrLe3In7ybcXSbNVe1BbPL7i5jju30KU8rv2hRyPZ2B
	YUC28h2LYhMZlU3w80UCHefPFEzK5ppUhSkhO7wdXDyQYTGzh+B3OF72UUpeR4YU
	pfJW+U8a/nU1ES0WyGIH4SG9X1m87uckCZlNhKpYUjuAFlAVc3oqV3ZFYuuqkthF
	OaoVQRCyw2jg67qCrBKfRsBSSJ0LOetjunMl75ngJtSBcTC5cIlPBR0miF2EHNxD
	bnMNQOTy+Z44gV7l9l6Tit/4OjSPbHAXMwT+5lZuKqyi2422RX5Y17GzUnr89/CE
	VQTrTjl94LhTxnCq7I9bgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788597209; x=
	1788683609; bh=bjpxt6wC/Xqqhz10TpneDwIthvnLaZnI4SDqGOP6+ZA=; b=d
	JuDjmHJQhIvtJhQP/7cSnXvxpfBzCOpsF31Q0X2TFHl1laVjMwNvFT/SnAFb9pJv
	92IjFXyrGsA3hDTPE+SmZpDixx8FnWkFryKSH0x92rA4jaQqpj5X5PYHDVL1z2Rj
	A+u0XtaTpyupWqBVhRrGULIPB9exeAf1KQBArIgHZ2zENogwm704cEaoJGTUuWXK
	PWYfQnTx9NyeibRHI46BHXpIr6tZdycRoq76QF2xfRiy9DLw1FBzQykoViv5gmH5
	jQtto9rk9Cd3tSNgERxGHwY3et4Uwy216CMaW9bPwxULQcRYwysDYCw9KBwI6ej/
	mE+o3IWXE4iN4M44H2QUA==
X-ME-Sender: <xms:1tObar_sKX-LHkTYCBnV3To_SIb_zCw91et8bHDemH92UGO0vMmm6g>
    <xme:1tObaig7MI3frM1W9mt5Ay1Hyihuzwkq97CKVoWswYgKWnEscmBJuSAkqUkkul1ol
    9Pa0xjK0G_5-7ok8gw4yB_ho9HTlvt3-TYb4XuUlVJhns_xW9fP7of->
X-ME-Proxy-Cause: dmFkZTF7vvIsIfkh8YrQepq3MAeq8OLybosXLfrXuMIxHNKGBQNOOI1uJTUnFAYx+ypv1K
    cOTncklBM80ffcbSwmfekHFIWthX5KxkkpN6XzGP4xL7grJlCj+0H0VbzvxawMTWv4Ryik
    kfA+9vaWM499hmXFrVvAbCrpEvE8XZnT++oI2ylUcd5Lqn0wbFlXVdoaOwJPfn/ZiJ6Hyt
    U/y5vgPsjwMqoQKZonUgCkaoCvomqLZSeS8bfm6ieT0U3xMklR9XEZE8GHirQOuPRiVbnM
    eBxRCF6S5twVgrQtpJS+wWUpoRhWPUl2yBORnSYpHqkkqV/TUlvLzO7nKIqhHtSXcAFhrq
    k6d/fHa6HY6HVp8t6zyhJqU8q+yiAemjho866becBUUE36FqXB2d2zhM55BOupyUIz4ZfG
    jdeI7FYGwJkqZWy8EOPh0nAEvvI8rBJARR793eK4+gCvh1uyPMpzbATOwOcbe/ylaVn/bm
    OThQNWMQzxYwXIit5HiylJJZUGFShilwiJVidWJKqg+xGrQNpFQ094GjuE+SJBrZM7eiAU
    392iCWOrQ+6LUDQFDP5yWk2aZJ9n2lzeFSYIbGns3vY9Hc2BgyHxX03X5nE1GSojPjLNRd
    qSn11h4bXILso8SwmGuBrvJslQ+RKyCLJ+CHA4X6m6r3VDjak7gOdrsWi8eQ
X-ME-Proxy: <xmx:19ObagG7kzvG5o70cAy_KQOK78VQLlodfs-5bI022Y8GFZxbHVdp5Q>
    <xmx:19ObakzTa6lD0Z_KF1p0txglWoq64HJGP2eI0L5b_1MaZKNdF3rjDw>
    <xmx:19ObatpSujzv1G_oog5AyeTTQA90mGi3O0XZvI9_w-8AUT1-jQkztg>
    <xmx:19ObamgJ6skZi7bWTYsVjxp6sMHWcfTmx9ukP_FfMKRdrDTsKm8sTg>
    <xmx:2dObaj4_OMhQ9rVTWFHxM5hGRXzJozJ-03syHECtAQBbLhQvYvU7HawL>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 141CC32A0078; Sat,  5 Sep 2026 04:33:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AFUWYdGrjtbg
Date: Sat, 05 Sep 2026 10:33:05 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Karl Mehltretter" <kmehltretter@gmail.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <a9e4e94a-9325-45de-a8c9-64c9ab8b1eea@app.fastmail.com>
In-Reply-To: <20260905052216.11986-1-kmehltretter@gmail.com>
References: <20260905052216.11986-1-kmehltretter@gmail.com>
Subject: Re: [PATCH] ARM: configs: Update axm55xx FS-Cache options
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_013335_482013_F1C9F3E5 
X-CRM114-Status: GOOD (  10.50  )
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

On Sat, Sep 5, 2026, at 07:22, Karl Mehltretter wrote:
> CONFIG_FSCACHE_HISTOGRAM, CONFIG_CACHEFILES_HISTOGRAM and
> CONFIG_FSCACHE_OBJECT_LIST were removed in v5.15, and
> CONFIG_FSCACHE_DEBUG was renamed to CONFIG_NETFS_DEBUG in v6.11, so
> none of these lines has any effect any more.
>
> Drop the removed options and select NETFS_DEBUG in place of
> FSCACHE_DEBUG, keeping the debugging support this defconfig has always
> asked for rather than silently losing it.
>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  arch/arm/configs/axm55xx_defconfig | 5 +----

I'm going to post a patch to remove all of axm55xx soon, so
I think we can skip this one, otherwise it obviously looks
correct.

     Arnd

