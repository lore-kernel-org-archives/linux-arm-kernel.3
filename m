Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA2AD49C7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 08:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MqHUmsGNQXV2y+7VYbmSgRiDDTAtnxMDFNlT3hVXtrU=; b=kQ7pTJIhG2JuRhqLDo/ksgxrUo
	VzLBSxMkCnhkKxMaOPJeLcN3igKyL3BYKh2tRNXIc7plzssmKfELUyifgOj6dzAHKa+634di6En6s
	MzGxW8wpuCmJ+MLKe2VD3PBoLjfH8T6gGQI3vLH3SgAWGKaMLWxriWOX2TYgWvLKu/rLEyZ8cQFSJ
	/WiKUehxZJPxs/PaOe5wmEhL0l3ArvW2akY4rWaq2dVliKiaIUk53lxiXbHGVBgsPn7eClDm1pIKn
	InY2HPfvZsgX8paqTLrG6fttPMjOi7wC4OcWSD+C3/esOHb8D7fA0kb/fndWWgD13hoPWJGh6r9Zz
	KocdKcPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlkLX-00000001F1A-3Msn;
	Fri, 30 Jan 2026 08:59:19 +0000
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlkLU-00000001F0p-1iEv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 08:59:17 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 80CEE7A006B;
	Fri, 30 Jan 2026 03:59:12 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 30 Jan 2026 03:59:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1769763552;
	 x=1769849952; bh=MqHUmsGNQXV2y+7VYbmSgRiDDTAtnxMDFNlT3hVXtrU=; b=
	jZjo46jcnTpbePFHbFu9O5ZWMiOpCPyg4Dt0C0lIX+n4E3F34jO/tpwC2I+vBJMT
	PtDSNgM5F4VZVxtVo+3zEyODf561zh7CeJT/JVYoSJHWaNLq7l+jlyWgJJxZ/vv8
	OS5kAoEWTgkHyA5qM7/PQAIxQIPl66FQHpbG4+j/N/+aSfrrxcl/4cORi8UJJRY9
	DfwFouAzWfTiJk+0m6rWODS+gm4joSC+CPi3IINh7dsEGF7DhS6E1mLs/6ARtw+q
	bczJSlH926SMorufjd4+G/6STcPPTyL5j7uZDmbGKmDVM/zxUUonpZDwezxoxV5A
	iNnRyBsWQsv/I8QWTPQYqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1769763552; x=
	1769849952; bh=MqHUmsGNQXV2y+7VYbmSgRiDDTAtnxMDFNlT3hVXtrU=; b=g
	KU7xZgjj+pnxO/r4+lQ3cUyhgajlhtSjoLsfWtIk+9HrUNX/1tHb0U0kWR+/89lG
	HDQJyFBurjt8Klp1STao7NRKtUoB8SSryAnjS7G5A+SaF5L61KlIYc4tsgSTa0DO
	2b2ntm1UUUVozvzIsG8D/fmZOcz0mW5OWS23WZ9MdMBPUwPKsebJIbLWHfB06Zjh
	BHZo6NmK/eWViNcAGjikHqjR15HRbcXkQTXa+FirjB/O8pqwuH5BDyL4Z4vp82+z
	vFY3J+Mh9XcKeAEU+7Wh56Zr8B3UxSWTUar4S31C409W+cKqmFOLeUrXocemlmN5
	DV4q9MoXqENCbTgntpciQ==
X-ME-Sender: <xms:33J8aZO-RPnGK-D2uE6MZK_4XqnDcs-71gKQiqFZrRcZBsiBbZ4Ayw>
    <xme:33J8aWwKkOrsIftQHUpqzLexi5sp0ly6c5dKcDgjCH60VmpFhrUOMicR5wXBr-zLw
    Uo-w9wunPnECYzok5zRF937hzgn-gbhXrsWvTu7Lqw6-ByyhVc4W14>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieekiedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepshhtvghfrghnughovghsihhnghgvrhesghhmrghilhdrtghomhdprh
    gtphhtthhopehjuhhnrdhnihgvsehlihhnrghrohdrohhrghdprhgtphhtthhopehlihhn
    uhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprh
    gtphhtthhopehsohgtsehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:33J8abWljcjP3SmeN7kCTLoXQ9MiSBqtM5nPXuMRV-fqUKB73M-wDg>
    <xmx:33J8afB5oq4LMgxCmgT6-q3Sp33bRXXWggCZkOBL3BTc6u1osrJX1Q>
    <xmx:33J8aa6e5mU9sjcOE_CiU91lzuJDX1vhuwEwlfP3h_RyeaAeG16DUw>
    <xmx:33J8aazKVt2A-MdH-rFvyZ4v5vnTHQc48eMH_OnfjOq-O30fZdSV-Q>
    <xmx:4HJ8aeyE9p6sspAJNWhC3hsvLfUv1cmaYxESF9qo9-y1zBC8AG1lpyok>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 894F4700065; Fri, 30 Jan 2026 03:59:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Agif6myIRndF
Date: Fri, 30 Jan 2026 09:58:40 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Cc: soc@lists.linux.dev, "Jun Nie" <jun.nie@linaro.org>
Message-Id: <9325c1b8-40f8-4403-8098-b924124e3868@app.fastmail.com>
In-Reply-To: <2936803.ElGaqSPkdT@grey>
References: <20260128203455.38569-1-stefandoesinger@gmail.com>
 <b94d1ea2-8092-4692-a5ec-02d83ae1c1a2@app.fastmail.com>
 <2936803.ElGaqSPkdT@grey>
Subject: Re: [RFC PATCH v2 0/7] Add support for ZTE zx297520v3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_005916_817793_57B3A04E 
X-CRM114-Status: GOOD (  24.26  )
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

On Thu, Jan 29, 2026, at 20:38, Stefan D=C3=B6singer wrote:
> Am Donnerstag, 29. Januar 2026, 01:00:08 Ostafrikanische Zeit schrieb =
Arnd=20
> Bergmann:
>> On Wed, Jan 28, 2026, at 21:34, Stefan D=C3=B6singer wrote:
>
> I am certain switching to EL3 is working here because I am using it in=
 the=20
> same way to set up ICC_SRE_EL*. (And yes, I know this code doesn't bel=
ong in=20
> this place. It's just more comfortable for my development tree for now)

Ok

>> I've never seen a Cortex-A53 without FPU and NEON, but since this
>> is optional, it was a matter of time before we got one ;-)
>
> The ZTE 3.4 kernel code suggests that there is/was a zx297520v2 that w=
as=20
> Cortex A9 based, and then ZTE replaced the Cortex-A9 with a Cortex-A53=
 and=20
> left the rest of the system unchanged.
>
> A later version of this SoC, zx298501 switched to 64 bit, including ke=
rnel +=20
> userland. But I don't have any hardware based on either of them.

Right, it's quite possible that v3 was a node shrink and Cortex-A9
was not available for the new process.

>> Support for 64-bit cores is actually quite rudimentary in 32-bit
>> more, as we are missing a lot of the errata workarounds and ARMv8
>> specific features in the kernel. If you can figure out how to
>> use 64-bit kernel mode, that would be ideal.
>
> One of my co-hackers is giving it another try. Pairing a 64 bit kernel=
 with 32=20
> bit userspace seems reasonable. Of course the other question is what q=
uirks=20
> are hiding in the hardware when we run them in a mode the vendor never=
 tested.

Right, that is clearly a risk. I see that we do support FPU-less
systems, e.g. 82e0191a1aa1 ("arm64: Support systems without
FP/ASIMD"), but I doubt that this code path is well tested.

For the core itself, I would expect fewer problems with 64-bit
kernels than 32-bit ones, but the problems are going to be different
of course.

For 32-bit compat userspace, there is a chance that you have
device drivers missing compat ioctl handlers, especially if you
need non-upstream drivers. There are also a few differences in
handling of deprecated instructions like ARMv6 style barriers
or unaligned ldm/stm data accesses, which require you to enable
the workarounds at boot time on 64-bit kernels.

     Arnd

