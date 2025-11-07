Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F84CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 11:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gsS27V0zYbo8yJ9T1sSydfxjZObboVuI8REAIsMuIYA=; b=1VPKWW7+6oR5IEUAnkPODtLYGV
	i5naBO8OhtnYB3Z2B42JxKCEBk9FvD/G1l4P20Hb7q/2nC081DNBclklfhiZM4BLZn7JyfoBYNP9I
	a7SeA5hhWTOtFwF4/g/9EUJiZTR6zQ+Sx8zlOgQY6vw9zMrcLIyUW8AgKFLrqtio9keZ2RJunPWCy
	ijWXkDO+/1Evfvl3ryR9sxhPkz2z7FrDF6j7x7hQHjGg4fl8aSBDX1Mib/OdgNI/UHdbIJJj8s5IU
	rVWmCm0D7wZkhNSxBUapgT38dO2JmmzRkmJudiLSDYLZbi9V4PPI3XfGHg5myA3wXn9ZMjk8vectN
	7egHdnmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHL1x-0000000HFZu-32sd;
	Fri, 07 Nov 2025 11:53:25 +0000
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHL1v-0000000HFZX-0yLw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 11:53:24 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id C72A91D0014F;
	Fri,  7 Nov 2025 06:53:20 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 07 Nov 2025 06:53:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762516400;
	 x=1762602800; bh=gsS27V0zYbo8yJ9T1sSydfxjZObboVuI8REAIsMuIYA=; b=
	nZYPXGpBqzTG8KfhVvOQDNoZLtc3+Vkdh228V8+pj56i/Qm2peUDrvCMygNC5KbD
	JQ/uZ81AmSWUFzCcblz0vmfZSw/7BBT2RPJzzmUfLyYJll5SWnFxnjCphPEHh96w
	8kMu0BSc+o0f2bkkxuvO03zeXRZcanoFzt4q1+pljkveIh+Wk0fC1x28Z6ZRG+pa
	sb1zfC7EMu2wnDrC0J09vliAAwMC2bsc5E+9zE+OhA+whjz+BPe53f7zXfm/KRTJ
	caQ3I+k6uh9GCnHcOWYy+sVxUdu326xn8UzCgmueWeeQwq89GcQB/USiNYN58tFm
	T3iRh2Eskdm1UlbZY1nWgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762516400; x=
	1762602800; bh=gsS27V0zYbo8yJ9T1sSydfxjZObboVuI8REAIsMuIYA=; b=3
	EZfkgsHEaT84CaUc+anzrmrs9QeECQIR5p2OM9fGvHT0fDs7/KV0zn3cAj3UZrXA
	WbPpAoH7zv4+M46Ay0zcSAonKvQggGaqOfQm2REyqgKHpox4MRaJduvZoj6hQpoO
	BSPz4Ou3eVBPo/glrhOU13Ac17xegnClsxl18KWBntOZSsDL8Eus2FVuvLfR3nGV
	U6YdzRvqcfKN+c81TkF5lxy27ya6zva+5tawKd+Gc+jBuyZ8OcJegYxKE6AwqiPk
	wBBVJMPn1toPs9XcG7OlAvBViVy7wac9P5a/oAtaHgT6ZSCVBCYX8r3QOHYQe9xe
	1ZmHuZLgfSmvme1oYx19g==
X-ME-Sender: <xms:r90NaabeM2LyeI1AQ57PK2DWvphAmwIpxUQJ9Q-iesNws4vF3sr9ug>
    <xme:r90NaYPEtXoRPMsXCPgGKOcmSq54PKVMVfwmG3MdxA1wpNp3LhY_CjjmcXLxzmJrs
    nxvK7buXeLbyz40hjEwrpUogYbe7Y-JGyrkdfUURAUJ1u1NohlUK9M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeelheelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvdefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtg
    hpthhtohepjhhovgihrdhgohhulhihsegrrhhmrdgtohhmpdhrtghpthhtohepkhgvvhhi
    nhdrsghrohgushhkhiesrghrmhdrtghomhdprhgtphhtthhopehmrghrkhdrrhhuthhlrg
    hnugesrghrmhdrtghomhdprhgtphhtthhopehmihhkohdrlhgvnhgtiigvfihskhhisegr
    rhhmrdgtohhmpdhrtghpthhtohepshhuiihukhhirdhpohhulhhoshgvsegrrhhmrdgtoh
    hmpdhrtghpthhtohephigvohhrvghumhdrhihunhesrghrmhdrtghomhdprhgtphhtthho
    peihrghnghihihgtohhngheshhhishhilhhitghonhdrtghomhdprhgtphhtthhopeihuh
    iivghnghhhuhhisehhuhgrfigvihdrtghomh
X-ME-Proxy: <xmx:r90Naa08TY73QAwQ15r2x0tWjcVK6iZ1U2jLiQ7uTwmZg-I_ucnftQ>
    <xmx:r90NaYFUvmKHKTbn2nih1V_hWSqX6ycF5ywAeCuxVGwNx4PaMDJP4w>
    <xmx:r90NaZgzqp4uVDE1DBQqjb7wUkxkHU0lvUlcFwlUStCzeGKZG0IMTA>
    <xmx:r90NaZeZO9h15HpmRuk8i_fm0tmCxIyyKoQJmtTN_XzDMsUkCPmSww>
    <xmx:sN0NaXNoJ3py5k8GLIR5-D3o_QeFRMYc_o86Zo7ZZ5QpcIsnJ76i-TNA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A92BF700063; Fri,  7 Nov 2025 06:53:19 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AGYZwPnl2csF
Date: Fri, 07 Nov 2025 12:52:38 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yeoreum Yun" <yeoreum.yun@arm.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Marc Zyngier" <maz@kernel.org>, "Mark Brown" <broonie@kernel.org>,
 "Oliver Upton" <oliver.upton@linux.dev>, miko.lenczewski@arm.com,
 "Kevin Brodsky" <kevin.brodsky@arm.com>, "Ard Biesheuvel" <ardb@kernel.org>,
 "Suzuki K Poulose" <suzuki.poulose@arm.com>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>, yangyicong@hisilicon.com,
 scott@os.amperecomputing.com, "Joey Gouly" <joey.gouly@arm.com>,
 "Zenghui Yu" <yuzenghui@huawei.com>, "Paolo Bonzini" <pbonzini@redhat.com>,
 shuah <shuah@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Message-Id: <9fffb30d-fc9c-4e2e-94d2-c724e81ae3ac@app.fastmail.com>
In-Reply-To: <20251106094023.1371246-10-yeoreum.yun@arm.com>
References: <20251106094023.1371246-1-yeoreum.yun@arm.com>
 <20251106094023.1371246-10-yeoreum.yun@arm.com>
Subject: Re: [PATCH v11 9/9] arm64: armv8_deprecated: apply FEAT_LSUI for swpX
 emulation.
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_035323_330189_A0AF7187 
X-CRM114-Status: GOOD (  11.41  )
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

On Thu, Nov 6, 2025, at 10:40, Yeoreum Yun wrote:
> apply FEAT_LSUI instruction to emulate deprecated swpX instruction.

Can you explain in the changrelog why you do this?

In particular, is this a performance optimization or is this required
for correctness in some scenario?

I would have expected that there is very little benefit in
changing the swp/swpb emulation here if the existing code
has to remain compiled into the kernel and the overhead of
the trap is so much larger than the uaccess_enable_privileged()
overhead.

> +		curval.var = newval.var = oldval;
> +		newval.raw[idx] = *data;
> +
> +		asm volatile("// __lsui_user_swpb_asm\n"
> +		__LSUI_PREAMBLE
> +		"1: cast	%x2, %x3, %1\n"
> +		"2:\n"
> +		_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %w0)
> +		: "+r" (err), "+Q" (*addr_al), "+r" (curval.var)
> +		: "r" (newval.var)
> +		: "memory");

I see that you fixed the race now. I had written an email about
it earlier when I saw the same mistake you found as well, but
it got stuck in my drafts folder. The new version looks correct
to me, I'm just not sure we need the added complexity.

     Arnd

