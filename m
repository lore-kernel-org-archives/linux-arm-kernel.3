Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD855FD5310
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 08:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xwefPv2uVlZj1+2rN1oX1U6/y4L5neteDEWAT3K3DU0=; b=rq/o9mFvDm9Vt24/bYYKC+vogp
	cU/p3+0XZ5qYM+jlmwHKs2Qbpf2q/swRDm6PunNM1iBmYk2DnpMJp2Zvvhfnt/1c9UvkBu8Ru1PZk
	yaAjI90aIqQhRWcuBRYCyjAmXvtqhXuGV1FHegQN/br8SAR+pafTI74jQqKgEfBJg4uvYqTSfVUcI
	gwItQG2C9qk273y7+Kpvj32ETlM6VDkxIgbBVonW3KmB5GQYFy//fiWMqrO3wsV9TNfKzcWHxZF7D
	kauqn3W/qXwKy6oCpoByCRTJO4ESUFXJqhSfc4ilSPfSN6Yz4gI8hG7PIrYBCx1jY60457wGuYMXW
	Cuq48akQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtY4-000000081pV-3gad;
	Fri, 27 Feb 2026 08:50:12 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtY3-000000081p1-1gdH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 08:50:12 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DDEA77A006C;
	Fri, 27 Feb 2026 03:50:09 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 27 Feb 2026 03:50:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772182209;
	 x=1772268609; bh=xwefPv2uVlZj1+2rN1oX1U6/y4L5neteDEWAT3K3DU0=; b=
	CpQkqgYfKds40olKRxYLSKAiGe5Rmy/9BCh5Z7MPXPxZ5F9LkngTRdlArkVNRjl8
	7ZqGnCIKRmMyrZJeCBiLf4/HN2UwaqtGzYvz33ugvRadhG1Ukrmp9gQIHnpcxj2z
	4tWE0307vhEYdklvnh8Hp2KUVlCY1Kc6fUscg6oVc4PMeNbnjdT+Jw4IKQ5SIwGf
	A0XFJqGIxJV+b9Pw1NfRhTq32a56fOkq43bvOQgPrBhd+4BNZGnpTo63/4pVj+X3
	ziLnwuOGm/2TpCZHvvuD3JP8kb36KC7Oxq5r8aLFdoVFMaA29W4RRCcbbb9lHQNC
	z9UDShjAp+mcTUCLvFglqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1772182209; x=
	1772268609; bh=xwefPv2uVlZj1+2rN1oX1U6/y4L5neteDEWAT3K3DU0=; b=Y
	a59htWC7mo5ur5Ru4AgAGJLqF9zIgIxnBpDFt5UgHdLUD8RPtbpyt3V3Nt80/SK1
	k1hirZHj7G2q9sY4pZHUbqslH90QY8FE6DUnSY2L43FKyo0yHdaX1R+i9qRbdueL
	oL5yGYKXrCmJmqN9TiNymHUKYlqr4aejj6YWngHGjFwY1NTAMsVN2i5jFim4J+HC
	jCNbCrQQqButTpG/aSIHiFGyg7L7CdSE0663rkLBd0WsuSZ5mk9mfHw6i39ZWAyk
	Il+1PcbDoIlUFKKriY3O+5tFM3Eh7mCjfOS6/3ejj2OtGerRvi9WC0OxavVSe0pz
	8M9CQwwTcyQnTocXUICqA==
X-ME-Sender: <xms:wVqhacI1rkOi6xw-07DwQDbocsXu_hDWjrP2hK5KGSJsQn4jHH6Gog>
    <xme:wVqhaW8D4Pu5jKC7Qcu7NwRD1ra8Pw5CMbd0Q6E6L46abVMVGzPr63Yj3dB8PfSR5
    QMVPd3tdG80nQ3287dbrTxU2-um9ej7tIYsHfo_fg3gtluKACfkysiP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeekheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvddupdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopehtshgsohhgvg
    hnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtoheptggrthgrlhhinhdr
    mhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehvihhntggvnhiiohdrfhhrrg
    hstghinhhosegrrhhmrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhig
    rdhorhhgrdhukhdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdprh
    gtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtoheptghhlhgv
    rhhohieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhuthhosehkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:wVqhaaHGvD1Eiphu0UQvGUsq8vY3JJvW3HPTel60R0guHhN6xnR5Rw>
    <xmx:wVqhaW7fUmT6ZYnp_qtntaBRP9PPVqGSyZrlJMiGqJqhTltRN6xefA>
    <xmx:wVqhaUKSaFcKmvsheEHP93T2yCFnay2qeiSgMOXt0_B0uhzNXAAM5w>
    <xmx:wVqhaZCFFj7dMt-LHLYVuTBmp18q048sjfw7koAKvPBMhqTeSHu69A>
    <xmx:wVqhaVIB3264bON7NJGum-trK_DULEFvHVCsrGVbwK02X2Xrf1p4BHQc>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6ED33700065; Fri, 27 Feb 2026 03:50:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AULtxbNmleaw
Date: Fri, 27 Feb 2026 09:49:49 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Andy Lutomirski" <luto@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Message-Id: <0b12efc9-0c3f-4a4a-b6fc-0e5c9a6d2cde@app.fastmail.com>
In-Reply-To: <20260227-vdso-compat_32bit_time-v1-7-3f0286a7bac3@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-7-3f0286a7bac3@linutronix.de>
Subject: Re: [PATCH 7/7] vdso/gettimeofday: Verify COMPAT_32BIT_TIME interactions
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_005011_484179_A046FF24 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
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

On Fri, Feb 27, 2026, at 07:57, Thomas Wei=C3=9Fschuh wrote:
> If CONFIG_COMPAT_32BIT_TIME is disabled then the vDSO should not
> provide any 32-bit time related functionality.
>
> Add some build-time validations to make sure the architecture-specific
> glue satisfies this requirement.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

Good idea

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

