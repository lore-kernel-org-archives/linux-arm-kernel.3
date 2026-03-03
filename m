Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A038AEDEBF1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 21:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=28CxBeTt3kOsCs8skczdKMpkv349+QFzE1KV3dW7sn0=; b=iTojf0HZhhNAa0yKjKJ88Okoal
	Xxno5II4LpssV6q/tWDFx2crki30Q6H35NS3QuO7Zcua5yDl4w2RxoGXFamOfnWsuQY6/YPGlCR6O
	16D9i9NEPU40v/5qZqIkncSF4aNJxTKMuB+LZMcipf8Gfp8zAUlaijmZOFPv2w95cKxQ9xJNvNsk0
	+n0MzpQLZjE71qa3QE+57hVhy56qOMwdDHcsP4vsV1X4BNYJo4uRJFORg6s95cbTzNFHXHZKrJPzl
	PvTwkQPXv2d/sEeZHsnbLHxXf8DxllpyQ+mh+0uucBD3zax8CV9iKLHoJumNVe+SXntnefkpMsKEd
	mpe2RG0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxXHX-0000000Fz4s-2aYx;
	Tue, 03 Mar 2026 21:27:55 +0000
Received: from fout-b7-smtp.messagingengine.com ([202.12.124.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxXHV-0000000Fz4C-3pF6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 21:27:55 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 5A02A1D001DB;
	Tue,  3 Mar 2026 16:27:51 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 03 Mar 2026 16:27:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772573271;
	 x=1772659671; bh=28CxBeTt3kOsCs8skczdKMpkv349+QFzE1KV3dW7sn0=; b=
	lZCV9T01LXpLtoPsH4lUH9cYniHQeu2vrjSiCNoGVAaaB8oeeQhbOvFeeDs+936u
	a+hB8JXW2HRJ5vHnKp9Ym7GVriUOb2fh5hDRGxZ3JfMaF59F+OwdMMlvGVGPfbaD
	XUop8hy9UshnIcub/R0VsfNXmqB3NlMI8GYcM+axHhkdHBAaM2ZcHX0nJ1mOtzZR
	vhJJ7uB2XhsKJmw91VoPRMUJ4LB5P9KwM4TUZFGQZQiaOf7Boy3jJ/yNWKBCGmCp
	3PA6cgkrUfLxBTy0L2CwpNrDWaDAuL4dQV3u+30y9RnDzPM+dRrCVLCDMEb6POdz
	Yb/GjrgRyF9xcF1+juIODQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772573271; x=
	1772659671; bh=28CxBeTt3kOsCs8skczdKMpkv349+QFzE1KV3dW7sn0=; b=P
	hIeBIWU/DDgQgVF3uTqLj3/kF5yeo5z4skzYBWBx2ybEGK9GBTNI+i5JE8iyDUU1
	9cp0p3DoQyBtRJ79kMj2viS61BWLalPOh4tE7VfGX3Riwn5lleR3PgPqRmv7+KQt
	oXQX9AsdGFNuiHx1EsWhW88xx32Hfs7dIG/cHSYc/8lVhPric3HLzjIOcAiq+LIM
	ecPC3thmr7A9ruR0HSNI0EMML3Dcy84R8upF5JrNIkcI2OkjxJ/l42K6N7OEtgGD
	s5zyoD/dM37zDd71oKjAXblspKqNmiEX7VXBuL7TdOiGyJdAJGHLkRX92Xw8krIq
	SCvAhj74DuhAzMBMSub9A==
X-ME-Sender: <xms:VVKnaYg4tnQxAZgRC0wJdP4mFK6_IXvHa7X4_en6jD0MR1IlEdGauQ>
    <xme:VVKnab0VT1FCevR3MDgXsRAC8k4pVsRPqfFNw-ksHAGYuDStEKSa2P65tsbVA0NmF
    V9KhqSk7CKNs5wCSo1a6JnrUux1ZRE-07O4WysODwe0jn671GFW85U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieduieejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
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
X-ME-Proxy: <xmx:VVKnaVcrU-9VwnlmWGxBZRivKWAFveS6JaifkuuRoOpwHv-9ozBDNw>
    <xmx:VVKnaexEn8uDcE14Stq58ColeH6KVzUPpXb4IrYCsbooyacEaQrJiQ>
    <xmx:VVKnaej8RsplonwyHAIHr7J9g40_5nYtiAPuTKdB6IKwwMeqUNOjJg>
    <xmx:VVKnaT4Soz_WFPFXJYdtynMJnvWHYd0Bh4irP8gSIA_jmFCVBjNXzQ>
    <xmx:V1KnadB0MhYISDQR-2fGEVcVFLF8w_6U-1QIxVi6lmY9aqTdwhBz4dTR>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 311D5700069; Tue,  3 Mar 2026 16:27:49 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ARwL1vy566MZ
Date: Tue, 03 Mar 2026 22:27:27 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "H. Peter Anvin" <hpa@zytor.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: "Andy Lutomirski" <luto@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Message-Id: <d92f424c-9aee-417e-899e-3a0002a80f4a@app.fastmail.com>
In-Reply-To: <56591FD5-0DD0-4117-BC7B-4565E3F6512E@zytor.com>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
 <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
 <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
 <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de>
 <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
 <2b1ac7b9-fcc8-4aa3-a0ad-eb37e4bce030@app.fastmail.com>
 <56591FD5-0DD0-4117-BC7B-4565E3F6512E@zytor.com>
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_132753_995797_B36442FA 
X-CRM114-Status: GOOD (  10.66  )
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

On Tue, Mar 3, 2026, at 22:00, H. Peter Anvin wrote:
> On March 3, 2026 12:50:33 PM PST, Arnd Bergmann <arnd@arndb.de> wrote:
>>On Tue, Mar 3, 2026, at 19:11, H. Peter Anvin wrote:
>>> A bigger question is whether or not we should omit these from the vDSO
>>> completely (potentially causing link failures) or replace them with stubs
>>> returning -ENOSYS.
>>
>>I see no harm in keeping gettimeofday() in the vdso when
>>COMPAT_32BIT_TIME is turned on, as existing code will call it
>>no matter whether it's in the vdso or the syscall.
>
> That wasn't the point. The point was what kind of error behavior we want.

I see. I would argue here that a link failure is actually the best
case then: the entire point of CONFIG_COMPAT_32BIT_TIME=n is to
enforce the fail-early case, as opposed to silent data corruption
after (now) 12 years of operation.

I don't think there is an actual link failure here, as dl_vdso_vsym()
resolves it at runtime by glibc (when using time32), while musl
doesn't use __vdso_gettimeofday at all.

      Arnd

