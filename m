Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071D2FD532D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 10:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nEaP1MgVxgQ3e7YsVXAGPgHJKsnww/Vf3QcZ3FbEIXM=; b=T/wYavuvCWgsP4WMOEW+Kn5TqG
	Phl4QOQUvfS8Xulczm/qrMolgNUZKqO/oNcamZCqZklDtS1qboqwf0I6EJACuUq71OKIwrbekq9lI
	cT1UgEMmw+mdlSAO1/tE47GLL5Ryw9QZMbIUvCtD/CjVloqoO/o/DBoKveB2Fq/phIBD83wiYb0Eb
	WXox8F9bAfVpnJ7ladZgw2n9M3dm0J/XBOqUVxwAOLWAOynhUF29OBfxk0PttiF36tSsJoom4apH8
	RQe/uDNvCoJ2t6HyLzSo/spAjOdpPxjyC/9ZDfZ4pXBakNrWctR0eCxYJa5qXg864zaBRIHaZiNrw
	ZGom446Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuhT-00000008CYS-3dZu;
	Fri, 27 Feb 2026 10:03:59 +0000
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuhQ-00000008CY6-1pnN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 10:03:57 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 8617C1D00147;
	Fri, 27 Feb 2026 05:03:53 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 27 Feb 2026 05:03:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772186633;
	 x=1772273033; bh=nEaP1MgVxgQ3e7YsVXAGPgHJKsnww/Vf3QcZ3FbEIXM=; b=
	lrmG/SqQnIpRcITU3E0XLKe+Y7T8Fgs99aJSdN94YJY2XfdV9Ymr2Lpp2Fd9A1h1
	93QEoC6K4RhOUU/0CXS8Q3y0jyFpfsgPJidPVp83NV4wvxaaU6ov9GD/HIoAeH58
	R36PuaW/OYXMBSU7gLzkRKjb6Y909d2WWWRce5us9F4DJdQLItv/yC+SQbZ8lx5T
	OcE4BQVUdiB39F4rs9bvLWeGU+2fJDdamENFL1vlG3oHgHF1qIg8qU5lO3lkRWDT
	sPgr1PAZpDU32yF4BxgcFDHOOeW5YhICl5cymsd7NmvQB+nrnONNrIHLIP7JYjrV
	tyLTTigwbetFiaaJW8MpGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1772186633; x=
	1772273033; bh=nEaP1MgVxgQ3e7YsVXAGPgHJKsnww/Vf3QcZ3FbEIXM=; b=b
	MYZLxBpXhZv/mJ8+g59OMglmBI+6sDOkz3q7qSimffuFO990wOlZdH6PE4h7qltJ
	vh2rUBHLfFMP78Tv1hQq8Ht0f/fuzhlIvkAeYzNrf5JGdiRfzFU9iwDjHP1Sej1/
	msktaoVxQWZpiTre12+rZouOQ5QG5ccFJav5JRP+Id72/EMrYjRph9EYpJZkEZ7/
	ObmY2NPFFXPQcZmdaJIMXo/1GstLyM+mhCG5MsZpQAZF9lFaeBZ5Hb1zgLeJu6LF
	VdUDHQ9gOZ5sOhlgqCRvsNVL9HsN/+KW7COOT/NKP8D8yqE5qn00RxBGPxDXysBP
	QKwWyHrOg+XCDuteEf9ZA==
X-ME-Sender: <xms:B2yhaT5qOXD_21o2B_pfBMxe2xbsAZauhwJEgUFGmoKSTKyH8jRXGA>
    <xme:B2yhaTvEnO5qed2AJCMka9Koh9uWNJeDy2su-OqclA5-NSGJR-0ZjRWptBWiY6vog
    htKhgw4vdL4ESZbk6_dxc3dQHhhKX7xARjRDEvnbj3qTsHpLuNBTg4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeekjeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvddupdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopehtshgsohhgvg
    hnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtoheptggrthgrlhhinhdr
    mhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehvihhntggvnhiiohdrfhhrrg
    hstghinhhosegrrhhmrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhig
    rdhorhhgrdhukhdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdprh
    gtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtoheptghhlhgv
    rhhohieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhuthhosehkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:B2yhaX0MMhK2hJ8xKYmKGjEeUCgFwabdV8J3J-4bQCQ7W_KL3E17DA>
    <xmx:B2yhaRpG1WW1_Y1W3dyhN1BiKGzxBLlmlIQe873sQvra-br8Y9qaug>
    <xmx:B2yhaX7RvPLc-eiFM8dDqfJc91ZhnTYp74OuIq3CHOn6f9Ki4qaI7w>
    <xmx:B2yhaRxaFWUSMm8gLpWuJeIN_bWR_6nGSVh1CEfd8Tag38ai0Sjs_w>
    <xmx:CWyhaU663-xqNWC5VjCK0RwTSsUG_79PFncgIvGG1hfcm2Zdv24MqNHX>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AC08A700065; Fri, 27 Feb 2026 05:03:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AC9z6Mxcl7jk
Date: Fri, 27 Feb 2026 11:03:30 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: "Andy Lutomirski" <luto@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Message-Id: <a1533e92-5d95-4c11-959a-a73d90eaf030@app.fastmail.com>
In-Reply-To: <20260227100849-fb0bfec5-4d67-409c-8dc4-dad10c84fe98@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-5-3f0286a7bac3@linutronix.de>
 <7fb5b531-2d78-409f-8f65-e12757f9296e@app.fastmail.com>
 <20260227100849-fb0bfec5-4d67-409c-8dc4-dad10c84fe98@linutronix.de>
Subject: Re: [PATCH 5/7] MIPS: VDSO: Drop kconfig MIPS_CLOCK_VSYSCALL
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_020356_758174_C6816025 
X-CRM114-Status: GOOD (  21.63  )
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

On Fri, Feb 27, 2026, at 10:31, Thomas Wei=C3=9Fschuh wrote:
> On Fri, Feb 27, 2026 at 09:46:23AM +0100, Arnd Bergmann wrote:
>> On Fri, Feb 27, 2026, at 07:57, Thomas Wei=C3=9Fschuh wrote:
>>=20
>> The #ifdef was originally been added in commit 7d2aa4bb90f5 ("mips:
>> Fix gettimeofday() in the vdso library") as a bug fix. This may not
>> have been the correct fix because I don't see how it addressed the
>> case of a kernel with MIPS_CLOCK_VSYSCALL enabled running on a
>> CPU without the timer registers, but I think we should try to make
>> sure that there is no regression from reverting it now.
>
> I can't make sense out of this commit. The generic vDSO automatically =
falls
> back to the syscall if it can not handle the current clocksource.
> There is no explanation *why* this should be broken on MIPS.
> It works correctly on my x86 machines.

Agreed, the explanation is incomplete at best. Maybe Vincenzo remembers
more details as he did the original patch.

Maybe the fallback logic didn't exist at the time of that fix?

> Also vdso_clock_gettime() uses the same codepaths as vdso_gettimeofday=
()
> and apparently that is not broken.

Not sure, maybe nobody noticed the bug yet, or maybe both=20
vdso_gettimeofday() and vdso_clock_gettime() now work correctly
after another bugfix.

The condition is fairly rare, as almost all MIPS systems have
a working clocksource, the few exceptions I see in Kconfig are

- R3000 based DECstation
- Sibyte
- Ingenic Xburst
- Octeon

There are not many users left on R3000 and Sibyte platforms, but
Xburst and Octeon were reasonably common in the past, so it should
have come up at some point.

>>  config MIPS_DISABLE_VDSO
>> -	def_bool CPU_MICROMIPS
>> +	def_bool CPU_MICROMIPS || !(CSRC_R4K || CLKSRC_MIPS_GIC)
>
> That is an an independent optimization IMO.

The idea here was that doing this would save you the trouble
of figuring out exactly how it was broken in the past and
whether the #ifdef is still needed.

     Arnd

