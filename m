Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAE0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w2+YG+Lc9G3ettrpyhhV85laMvWnPE2RhFHAC3mG0Ig=; b=qDyifDNs/K7X6wAny+Mnd7Vklz
	6H51mz5V9t8J/u0Phys1iC4GCvKma8QsP9T10BXEEyF9FSpY4gwNyXn1s3/PHbo2deOnesVV0HA6+
	jl/nVVHC9/ndryGLe5FafbT1S6S2sIL3110hH77MU9InzD+ZOsh2mfXdvhLikNLR2WhqTktsQvOO3
	iAZoHXJrxupyIPEHnHtY9oqr94Yg4qQ1oWR9OKoS1jpSOVK72qnUZjWPxIx4O41pssm1bM/A0jPcv
	ULn3RlXTQoXlkamoJ41fC4+tYYXvfufkJb+ousDYwAmj0CQEYxCPOl+jsYnAFJ0l7Rid2ZI0F6ijG
	YMe1O8eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWNb-0000000B14G-2Aul;
	Tue, 14 Jul 2026 06:12:31 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWNY-0000000B13a-1m5M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 06:12:30 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 3216A1D00119;
	Tue, 14 Jul 2026 02:12:27 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 14 Jul 2026 02:12:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784009547;
	 x=1784095947; bh=w2+YG+Lc9G3ettrpyhhV85laMvWnPE2RhFHAC3mG0Ig=; b=
	Cni5YQ/Lv76m/Bwb3qNT15OoRenShDcFkTAje9PrS7F5GlnfA41d3Zfqo5dSKT0/
	G/HmP9suaXMirvmhcrrD9YFPg/mnmeOY4t87UU/58k/E2VHHCLCVD5xOLJ7HMe5b
	QBgcdKFAFk52jY90/ZRDdNYmPAzIsuE80n03w1RKhezwIK22N6T7DwMz2Gyl1Q/S
	w7hLupc2Wn7RQcu13Xx2OkWMnwac16GENUSokiiVhhi7vW8sUXt2tZzOKbfBxmlr
	WodR2eHya5EClJh3u4XH7+CT7YzBfQLeoBo+m3w/DlQpdSLS1faRiKs/6W67lhjb
	GJBC1Gz9/ETmHxxgY+AKNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784009547; x=
	1784095947; bh=w2+YG+Lc9G3ettrpyhhV85laMvWnPE2RhFHAC3mG0Ig=; b=K
	qemTIRI8Lo4LJ0mFD55/9eEe3dAfZZn1OD6ruhNybXdNsS3azIzfhjlb+Ll/HAw4
	FwOvQgEajCbtmhPcbZzHiRbCe1Mj64HeUFe5RTBK0rXepJDns9MIOyeGsfgq9GPT
	IO1HDuLQEQxMTCwUAp6u9RxIYYkGyDOLE3i0cA2zviPLVFY99pwe6ZV1WYBRBlpv
	C73lXHd4USXGqWWrSEBLHDB6ad72MfmcGAU3glJAmhC1EErFhLiLJ/wxLnG3eDta
	hi7fOeMhO3jtONYPK1xsa8QqxXYPS2HSi5PRP00Y4c4Nlb978UsmvVNMg44Ft9se
	vUu0wnRozSIXOS1xU1KZg==
X-ME-Sender: <xms:StNVakd2cWXjItagJWwcI64TpYBIVcGqxUbO0-85Gac1VWQPFijEyQ>
    <xme:StNVahD6lZgKxsWx5MrIE0nNgqCsFi3F_5ISBHlXPnYH9W4bQES-xZDOhNH6lgxzZ
    Jfi90tF-2X1T63gwdaCexKta9vI0YzHvxUzCZW5HE0tnKR4d0d8Cg>
X-ME-Proxy-Cause: dmFkZTFrsLZ8C4FIUXA7r0r3NoIZpM7J+RaPlyAaJo+Htw65KLUYuJH3CnfMNkbv/0r3xS
    S/Ps9yWAI9gkwy/C4qKRnu4Hit8EwxSpvtxztlB4YJrpAsugNeOVGKj+qZ+dfJZFEqfAQu
    DXLZoQ7VujK59/7ODVZffrtq2w5MsLc+oRxkzsHrUc1a7rCdt9dRTQiVb5cNeC3O7VALAi
    qrkWJq2SdMK+M5WbUkYuRyvx1DZeg6HXqkN9qAmV7/o3iChl4njbtgLYwEZkKj1FRFgoB8
    42JLfEEnLth9dZp/8YJvM4fjKgL+4+r1NJxpAW08WXRUTtorPWcMUnOVQe9U7J46M78xeC
    cFVNtN13loVUO+wLkrhYc04NADV8DcHdNpKOYG7KKgCM+6vv6YpuqUoCqCgAF0iEzRlE9K
    Xw7fefmhhhH6+UjZ+qsW6rSsXZmwtcxVkXjsGqx4eRZ7CW3Oj83mA6FYKRI5PK5dirNVDI
    TSuv0ETBo5/pDOhXaY0no50Y+SvoCJEsLj6URo3zPepv1t7bSapTg99SwfkmP838TpfgHh
    4Zp4uMudtYddHrXOcyhXfBhZkwrtLLIss+q26DWerJvOCaPy8rTTqd+QXpMRGShABMIW2W
    BmOCWlo5eARt+QsqEuPtGk5pyZ1mJhwFgBsyg4mtjGpEWLRJ6i0gzgH5Amzg
X-ME-Proxy: <xmx:StNVaqq8KJKILWlWf40sC62m92nRYELUND-PFhR58KEG3bjtWeKjCw>
    <xmx:StNVahlqjTHzzGB5ldqapRmdvCgyfp0xvJ_w3Ew2siNp6ijQbidEDw>
    <xmx:StNVaqzqzfndqeOi5aMLD5uuS6bsXlO5foUockE2I-M4db3SeQGQ4w>
    <xmx:StNVap-0hNONhoIp2DNcfRndvZOVhb31w8VkODg4TEJTpshU4F37cA>
    <xmx:S9NValOOzcVDO7aXXMZ4YbaQuJmoZf9MK2ADGgqYMyI2jqBiWn5BXGKi>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 97EC7182007E; Tue, 14 Jul 2026 02:12:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: An7HUqEbU7I3
Date: Tue, 14 Jul 2026 08:12:06 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Karl Mehltretter" <kmehltretter@gmail.com>,
 "Vladimir Zapolskiy" <vz@mleia.com>,
 "Piotr Wojtaszczyk" <piotr.wojtaszczyk@timesys.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <8b04868e-1676-4c70-b14b-21609e01d791@app.fastmail.com>
In-Reply-To: <20260713192506.7782-1-kmehltretter@gmail.com>
References: <20260713192506.7782-1-kmehltretter@gmail.com>
Subject: Re: [PATCH v2] ARM: lpc32xx: only run SoC init on LPC32xx hardware
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_231228_923872_26FC5697 
X-CRM114-Status: GOOD (  10.26  )
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

On Mon, Jul 13, 2026, at 21:25, Karl Mehltretter wrote:
> lpc32xx_check_uid() and lpc32xx_pm_init() are arch_initcalls that poke
> LPC32xx-only registers. Since the multiplatform conversion they also
> run on other ARCH_MULTI_V5 boards where access faults e.g. on versatile:
>
>   Unable to handle kernel paging request at virtual address f4004130
>   PC is at lpc32xx_check_uid+0x2c/0x9c
>
> Drop the arch_initcall() registrations and call both functions directly
> from lpc3250_machine_init(), the machine's .init_machine hook.
> The calls are placed in link order (common.c, pm.c, phy3250.c) to
> keep their previous relative ordering.
>
> Fixes: 75bf1bd7d2f9 ("ARM: lpc32xx: allow multiplatform build")
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Looks good to me,

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Vladimir, I assume you'll pick this up and forward it to
soc@lists.linux.dev. Let us know if you prefer Karl to send it
there directly and save you the extra pull request.

      Arnd

