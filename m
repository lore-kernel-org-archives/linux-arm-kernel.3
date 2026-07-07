Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DA4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 08:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ksJfUuprun+MhATLDi0LER8gCeLSodgatS7pFZp+C0k=; b=BV/o9RdBKIwN6dmOlwfieltoo3
	w5LFLxO2pp/Kbn/amoPACjSNRacFGhLboz8elXfgyUu2w0gTb+kPMV9U64bFeCSGFr25RzSwU4AWf
	HoXKfeo7hQeDIZsACaJZM1LSDmF23rM2gAXKTHxVOCcsNVRk7l3x4uTeYJRFqEM0RJId53P6iNqGv
	FDg8vCMkH3EvpSpN1Bw1wCRdSdUcI4z6ZpeJVd1uuu8x/ftedfab9zVE2nOTIQb4qD8ZCDX4oyyQN
	7Ib7zZgLLglS5fn+IBkGJKRjALzMhs+0E2BolWRvT4qmaDFN3WGZiMoEOLrMR93WROslwhWi8Kt/M
	gr+2yCyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0xZ-0000000ERNd-1QQy;
	Tue, 07 Jul 2026 08:15:17 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0xW-0000000ERLW-3hqY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 08:15:16 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B41967A0144;
	Tue,  7 Jul 2026 04:15:13 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 07 Jul 2026 04:15:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783412113;
	 x=1783498513; bh=ksJfUuprun+MhATLDi0LER8gCeLSodgatS7pFZp+C0k=; b=
	xpvw0O67yy5FBKU6rOXtWOrtWspRY7P6BVM/obWyN3sERt8ykH4V9veFkIVlYAVk
	jyGIg2Z+FwpRv4MPZ/khFehaMiusfCX/sspcqbfqbyzrE3FLoNW8HIyhFfdVY38K
	1/roiqwuVUPC7Z1gWOf0cOKayXhHG3p1SrRg7HQIj6fBucbqxvKoyedU5GMoWlPd
	55aBTtQbVryQIAE4Esgzu39XNacL/L6oiNJ3PLLpYeWyesBBQLhLJBxtJZDXVK4h
	ez1QYwJrbThAkL0AfaJBg/Ho0CbPvYyRFQDkUw3VobjngZVdPIEvHFZm6Rl6PSj/
	nXjPLDNGfve1gOVvZwmPOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783412113; x=
	1783498513; bh=ksJfUuprun+MhATLDi0LER8gCeLSodgatS7pFZp+C0k=; b=l
	i3FHACEhOUORRioWZk0bAsZIUwd61EqaAwtJjl1nwJDlF9iqp5flel5T2flTDLkT
	COa/wRbQSoNZze6DzitWefsIKUs+A640L5l/PNzeCB6gUxS/j1q/K9YN1wf6HyGd
	aaAFCbo2aKWsfWHA2VTI62x7J5XzMo0z7UsfkALhy3k5lCW8itl6CKIBLycDnx5+
	NWyhQ9FAjMo8huYc8+j0GzGO4Tws54MsBuwid1EqADHUR5eDEinTtTjfgmC8e/dm
	ZvHCOibHm9hquHLsoqtMy1k8IBVT6kxKatFBpNyQnF4HSseghq+Fu1aELu6+DqVE
	lEGe3YpnzMB9fXk4D5HZg==
X-ME-Sender: <xms:kLVMat593qrpDI2j9Id5XiMvpmEv_vp_HFU52-1H1dRTI0m20fruew>
    <xme:kLVMalvfBw4caDNKyoWxSmuo1VJJXV84rP-my4YdDpWoucr9sVJySpl7Lqw20LM_Z
    7Au8B2IbThteDnXXzXW0KgAq2os6rO4EE9hXlhDIIuoElwho4ZdIA>
X-ME-Proxy-Cause: dmFkZTGmDHHJeVxwC3PNVwH9WBFHWFauttB5daISxm+xlRx9GY+UQqKoNlbj9PfeQY+pGf
    HP++0AgB3cUYgY75wzCwa2iZ6HNfDwO5g/XzBWjVGfOYqkiI5k9n2imT1G7LN2XJyFWLwn
    voKiqNjUigloECOJAk/DYPtO2WxxGtuT8awPZCThuizoUwsp65wngOCKUdE0yXeNXRXQax
    htuNPfLOQcPMLZ5Ib7Kp8h3RbTIPN8ng3Iz3BD04Yf4tjyzOSPXIDWgvi5k67dsWJkcbXr
    KorK7n13sCthqzXSzVsBb0Ljjt7jaDJApmib+6v3kvStB8zBScrKyZL6RwBj4QlNr7ltG1
    eDLhTKHl5xUUehs5lVlsNezLtupqtzL5Bgc/1ActDuIIbAhezWiO9cueth/u3jj6+uZUdP
    Ja/GqS4GFOHFpsJZQF9BovNxDccSBxBCaTzcXs5qehbAYB4aD6qQuLilrDgpX2PhSjf61N
    VRymSULBAxBbPMeBC4l9fOVv5kaRLfZ+ROLktLwpBYOVZ+LhRl5BKYp9R5ZgM9PU6cj/Bl
    99yOczeWYSXyKvWxmW75IYsJRL/JKmA34ryZUjoiPXD5GbTWH7HPtpTRxHIuqM+pfVGLY0
    7gQBH24P8t9ctcvzM7LH3VIkDF0kRWGLmtkL055FFL11UygUjaDkxSEpw1WA
X-ME-Proxy: <xmx:kbVMahIROndA0W6gg4nPmlihoo8ISGUnMR2bd0M6zq4qQcsKbcAaxw>
    <xmx:kbVMatkmSVmQOoCmFqH1T7AaAYuOVfA3W6P8bpEQ8zeds4_jrpG8uw>
    <xmx:kbVMaqZ8H4SldcilE0xndpdvLO4FKPMp_gTpOPutNGb08i6CdoYJxw>
    <xmx:kbVMap8dOeD0pDh6YMIEwZQSmUfRg6tpnQLQzU3P001qIIU7XcKS-w>
    <xmx:kbVMarrASjHC69LJ0Y7c6fEUk-luVa3zeNjtLZKamQPDR28w3oqz-uQP>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E57831820082; Tue,  7 Jul 2026 04:15:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A29kydqouFdV
Date: Tue, 07 Jul 2026 10:14:52 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bartosz Golaszewski" <brgl@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "Russell King" <linux@armlinux.org.uk>, "Linus Walleij" <linusw@kernel.org>,
 soc@lists.linux.dev
Message-Id: <1cb45fa8-df33-4e6b-be0a-63abdaf9d0a8@app.fastmail.com>
In-Reply-To: <CAMRc=MdfRs13TAqRqwff+=v3SrTXynyhCb75udG46hmwTRwuKw@mail.gmail.com>
References: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
 <CAMRc=MdfRs13TAqRqwff+=v3SrTXynyhCb75udG46hmwTRwuKw@mail.gmail.com>
Subject: Re: [PATCH 0/4] ARM: sa1100: convert gpio-keys to software nodes
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_011515_245998_C4A38063 
X-CRM114-Status: GOOD (  12.08  )
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

On Tue, Jul 7, 2026, at 10:08, Bartosz Golaszewski wrote:
> On Tue, 7 Jul 2026 05:13:59 +0200, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> said:
>> This patch series converts StrongARM SA-1100 evaluation and handheld
>> boards (Assabet, Collie, and HP iPAQ H3xxx) from legacy platform data
>> (struct gpio_keys_platform_data) to static software nodes and device
>> properties.
>>
>> The first patch registers a shared software node for the SA-1100 SoC
>> GPIO controller in drivers/gpio/gpio-sa1100.c, attaching its firmware
>> node directly to the GPIO chip prior to registration. The subsequent
>> patches convert the board setup files to define static software nodes
>> referencing the SoC GPIO controller directly, allowing pin bindings to
>> be resolved via the attached firmware node without relying on name
>> matching.
>>
>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

> Will this board not die?

I have proposed removing almost all remaining non-DT board files
including this one after the next LTS kernel, i.e. in the
7.4 merge window, see

https://lore.kernel.org/all/20260701212353.2196041-15-arnd@kernel.org/

       Arnd

