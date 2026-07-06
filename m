Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6573AC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lby1ztOi/qAa/apjeKoqVuHvfk0wRBTPFZrUMpNmXek=; b=XnWsmQyb1reZi6SvFJ3O5Tn7Mn
	uAPqwXCLRwKuqwY/47naXFZgsXEHbd1oBkU/2h5yxymXpSfGQXPgHACiK1zoDyXIgw9WJbUc6Y5rQ
	BRbznXrvFU7UJjTOHgxQv+4/Yv0sqv7zjWNNg0z0xt2IGQDZdOkfRCN6PcRumNU1HrH4uQ3oVKpk6
	pxzeJARKX8XwF3D+NTMTu3axXi8D58h6kmBMpDXSjDGenuzqVu8g5l0Tkgi20Rmrgm/Z8g4bSBCwc
	Jeb4Amk8uxT6RylXdtYZjrW8OGibNTJ6JIlSd4HoP9ctX1mR+HRGlUGvJr6LigcxQ+eV/xMgWeyYh
	YTyMpdAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgghQ-0000000CElc-33B8;
	Mon, 06 Jul 2026 10:37:16 +0000
Received: from fhigh-b1-smtp.messagingengine.com ([202.12.124.152])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgghO-0000000CEkg-3lIs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:37:16 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C8C577A0114;
	Mon,  6 Jul 2026 06:37:11 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Mon, 06 Jul 2026 06:37:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783334231;
	 x=1783420631; bh=lby1ztOi/qAa/apjeKoqVuHvfk0wRBTPFZrUMpNmXek=; b=
	mIJVGuQE3k1LIii0AaCS0FzZA8Qtm+Fiq5t6dsJMfQnRgL4KCI8SpYWMPSatR8fC
	mrXHI0WnK8Z7pCgvhdL7TqGFdkQXvHesqdOuDnNcWcmeul5yiTVZG1zztZs/QGHH
	J6cHLyCvq5JSiapxeIwdNt0SPHCXgI2Nbk/+mJtofFeT5z8gVTVrbXc+7+kPboJX
	Y8kc8V/b4VxlaRmnVjnrw4q86V5J8+mxBOgbHT5C70frMfgpl0OjnrkO5A5GVK6F
	LvD0IsIxcgxHAOjdO1cGb1cVtJ4YTMned/IvkopdiveluGXMS5rsNAB4sIV7zDFA
	EON1IOwwBPwliW8kn3GFgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783334231; x=
	1783420631; bh=lby1ztOi/qAa/apjeKoqVuHvfk0wRBTPFZrUMpNmXek=; b=g
	w4gyxF4lHZj0S5OSL8icz86W0HKppRfXqCpEqbAvNGkHcECHriJgIoIK4FeV/Tst
	qWkbuo3UfEga5tBmDD64Kq/KfShmSxkXQ5iVO+XWTU+UpMMUPEqy+Zh+Bu95Spn4
	cPtEbgRN8imNRl30tYJkeKggcpSEFZ02fwD5VdUbK/ZUGEhVFlN1fCfJLwC6M+qx
	3xV/VhLWNeBWwE6GA5na1lHfAcM6c2HGPgGb4QOEUHLPJZM0SX0Ec/GN/EURp9z1
	iy81cl/oVyGZQLme9UA+KyIIeqJUkLQz3R2y/4ETHbX3i7g9gIAE4B5k7UxLc7RW
	4RjNLYqpOIdeaDIscUAIw==
X-ME-Sender: <xms:VoVLak_DVKd4xhCMl10kDYpM-PRvTtixVSncW4CewpxeUYNu5E5WBQ>
    <xme:VoVLanj28tCo2bpaq5TYYXaSIRb98tW_N6zFBXvXVGBWOIkbeVG3IAO4tWucxrO_I
    BQ0-Ynzuk4aj4qnDgspJfqvak8VqLq5q47o4bjllPCR-AbDfA7W2CE>
X-ME-Proxy-Cause: dmFkZTER2afZxK3cV+HQuZCMwn9Ezs/DuZzyhM7c//iK6PkqobrlmFeUfO34U7/pbzR9Qe
    ZeH0suv5wbE2ZK8fD6xAva3JDnpK10AQ+rSNYVJILSr9QOXwr6Q6/DEO4JGE/ysxiG0nQG
    z4T//ej7K8TM1F5vktXLpKOZuSO1PA8EX4X9QPp9UXFQ56ZBUuBmsfAERuvJzgTGVG9ulg
    Y1fgmJsKmd6jjzC3UkZKx7OA0f+1dCbIRVHj80snIFdG8cjf2SxSZi2hkjEKuBqsS463EF
    6Q4x5ekF6NfnQ61egUGxmKj84+kQIcSygTLbkRJ293VQUlsl9iCQdjsqC5yztBMMWEWhSv
    IVl3cRWIpV1AtKECHvFYewz5xSgUujsQB8nCfV05R0J0OpUfUP+F0xTgkG+KN0XDUvWFoZ
    DXoUSo8HTDjUj8by8h5DM9fZ4Tf3ndRWJ3AfLIptG1XG6+N7KGEXsaNWN8d73LBene3ktF
    lTxvD9BxsZvXgwKD6e+gSsBCOS+dhTTUyZTT6UMz5DbNi8T795esvoQY2vJOuWTJA3Ivrs
    JSYWhrMJApoHNBUEmI30f5pmAB1Mkk6przZ5F+QskJPwZobb0y9/bvEcU3itCPOdIODIR+
    56ulggozNdLGlh1RKxYtSEa/vbGM82/thEU3AgAsxuR5NrphskKqep4i6eng
X-ME-Proxy: <xmx:VoVLahvkz3V_uxcnStQUenUJPNfkigJjoJSatasGmd0s0MivDoR_ig>
    <xmx:VoVLatBBDNYWMhAqdK6empIOGyQiqsrIA8mMBw8wNqq9PRX1W3B1xQ>
    <xmx:VoVLaoa6NrkoohQX0M9B2nGKehZ07GpofrAHLFi2Sr5_SpYvrBJiVw>
    <xmx:VoVLaoWE9jy7ZoTccAFeK9uZnwgbZs8g-0KkZuzs1eW-BYfmbk1bkg>
    <xmx:V4VLau0QCWaTe6hQP1tZ5vqGFGcI-qvImM1qJuSsabtvminLtDrc77aC>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 964451820082; Mon,  6 Jul 2026 06:37:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A9WOz104Gfyk
Date: Mon, 06 Jul 2026 12:36:50 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Andrew Lunn" <andrew@lunn.ch>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Gregory Clement" <gregory.clement@bootlin.com>
Cc: "Russell King" <linux@armlinux.org.uk>,
 "Bartosz Golaszewski" <brgl@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <35e8b266-233e-4366-b853-76c77a58bccb@app.fastmail.com>
In-Reply-To: <fc4f8eb9-7da0-4e65-b93f-e54f101de351@app.fastmail.com>
References: <20260705-orion-mv78xx0-swnode-v1-0-07d95ef4f447@gmail.com>
 <fc4f8eb9-7da0-4e65-b93f-e54f101de351@app.fastmail.com>
Subject: Re: [PATCH 0/7] ARM: orion: convert legacy gpio-keys to software nodes
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_033715_197024_9C61AD1E 
X-CRM114-Status: GOOD (  14.05  )
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

On Mon, Jul 6, 2026, at 08:50, Arnd Bergmann wrote:
> On Mon, Jul 6, 2026, at 03:29, Dmitry Torokhov wrote:
>> This patch series converts Marvell Orion and MV78xx0 board setup files
>> from legacy platform data to software nodes with the eventual goal of
>> dropping support for legacy gpio API and platform data from gpio-keys
>> driver.
>>
>> The series registers static software nodes for Orion GPIO controllers
>> during gpiochip registration in orion_gpio_init(), allowing board setups
>> to reference GPIO controllers via PROPERTY_ENTRY_GPIO(). It then converts
>> gpio-keys setups to software nodes across MV78xx0 and Orion5x boards
>> (Buffalo WXL, DNS-323, MV2120, Net2Big, QNAP TS-209, and TS-409).
>>
>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>
> Hi Dmitry,
>
> These all look good to me. Unless there is an objection from the
> platform maintainers, I'd suggest you can send them directly to
> soc@lists.linux.dev for inclusion in 7.3, or alternatively
> keep them together with any other gpio-keys patches you have in
> the input tree if that lets you finish off the platform_data
> support in the driver more quickly.

I case this goes through the gpio or input tree:

Acked-by: Arnd Bergmann <arnd@arndb.de>

