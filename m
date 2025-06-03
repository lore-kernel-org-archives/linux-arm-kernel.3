Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD83EC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 07:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9mWWJ4qkLqAKjbZWE9dxZ2w1NtcxwU3up5LkH0O13tA=; b=YhcKLNjDJ7JmcKgI0pF3dLCh4L
	914dOq7gys10ryADW6rpo9nOyG02tWQViiXcM+M9b8ACYJ0MqYpNpQVeey7fDiSpVJs02fZ9w8BAY
	NIsjy0R6qgcWXtHMM1w7h5w1BZpHTh4LzyUxOp5LCZhy0qsAksfS6U5Ex+Pr+WjscxGg7CKQqPK0P
	WPDIRfmxV3LHEcbD8Vemw4PP2u7a7MVyI0eziVpcSqHENnmuzS73v9Y48mAfFyQoB4mKckylGcWuD
	nvq9aRmpSpJ5PMVgx0DDwYrdl5AHLeJN62ncxnwnISxVCTTVNJgQNsFA8aPVqeFn8ahMBP7WBZoSf
	tHUaVHug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMMRN-0000000ACxp-2FA0;
	Tue, 03 Jun 2025 07:52:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMMNf-0000000ACC4-1wVL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 07:48:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AC37744D39;
	Tue,  3 Jun 2025 07:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A4DC4CEED;
	Tue,  3 Jun 2025 07:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748936898;
	bh=7/E2PZuS4xuO6ru4tVmW9wWcgEN+UdjTQfwPp/jVbLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bPJcWEegGmPrknxY/HQNjWITDH1jVIsj4qm7CIV5o0hvAbjeGtz7MW8+a3SNZdCdh
	 bc4OTGVFjVCTT+oF/GR0JZaZb1IuazvjGxfnM4IiEdeHtBJlz3r63lvs8HbRLKfvVo
	 aK/AtHpjGbJoA2A6tANmgeArsq7kixhM6Ed8ymmBY6aCvhA4dScXcFCk5TlsJq36J6
	 lbyaZdo9Ardhe6ixAg/j6vFNdrNDrrN6mIPak3Jx2uBsn63RJUapN7K6rUayoMnAvr
	 ttEEp6wtGPOyk9yQFW0wATtiPcDApPZ9NhKfiKVShk2e/Zr0Mh4RwZEOD18UU9Q6GH
	 ZOTyDZfjE8w/A==
Date: Tue, 3 Jun 2025 09:48:09 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, andre.przywara@arm.com,
	Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, suzuki.poulose@arm.com
Subject: Re: [PATCH v4 01/26] dt-bindings: interrupt-controller: Add Arm GICv5
Message-ID: <aD6ouVAXy5qcZtM/@lpieralisi>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org>
 <aDhWlytLCxONZdF9@lpieralisi>
 <CAFEAcA_3YLMSy+OsSsRayaRciQ1+jjh-dGzEjrh2Wa8BqdmqrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_3YLMSy+OsSsRayaRciQ1+jjh-dGzEjrh2Wa8BqdmqrA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_004819_546895_B1D18606 
X-CRM114-Status: GOOD (  28.84  )
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

On Thu, May 29, 2025 at 02:17:26PM +0100, Peter Maydell wrote:
> On Thu, 29 May 2025 at 13:44, Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> >
> > [+Andre, Peter]
> >
> > On Tue, May 13, 2025 at 07:47:54PM +0200, Lorenzo Pieralisi wrote:
> > > +      reg:
> > > +        minItems: 1
> > > +        items:
> > > +          - description: IRS control frame
> >
> > I came across it while testing EL3 firmware, raising the topic for
> > discussion.
> >
> > The IRS (and the ITS) has a config frame (need to patch the typo
> > s/control/config, already done) per interrupt domain supported, that is,
> > it can have up to 4 config frames:
> >
> > - EL3
> > - Secure
> > - Realm
> > - Non-Secure
> >
> > The one described in this binding is the non-secure one.
> >
> > IIUC, everything described in the DT represents the non-secure address
> > space.
> 
> The dt bindings do allow for describing Secure-world devices:
> Documentation/devicetree/bindings/arm/secure.txt has the
> details. We use this in QEMU so we can provide a DTB to
> guest EL3 firmware that tells it where the hardware is
> (and which EL3 can then pass on to an NS kernel). It would
> be helpful for the GICv5 binding to be defined in a way that
> we can do this for a GICv5 system too.

It would be good to understand what DT {should/should not} describe and
whether this DT usage to configure firmware is under the DT maintainers
radar or it is an attempt at reusing it to avoid implementing a
configuration scheme.

Rob, Krzysztof,

Any thoughts on the matter please ?

[...]

> The tempting thing to do is to have regs[] list the frames
> in some given order, but the spec makes them not simple
> supersets, allowing all of:
>  * NS
>  * S
>  * NS, S, EL3
>  * NS, Realm, EL3
>  * NS, Realm, S, EL3

Maybe reg-names can help ? Even though first we need to understand
what resources should be described in DT.

Current bindings are reviewed and I am not keen on dragging this
discussion on forever - the information the kernel requires is there,
I'd like to bring this to a close.

Thanks,
Lorenzo

> 
> secure.txt says:
> # The general principle of the naming scheme for Secure world bindings
> # is that any property that needs a different value in the Secure world
> # can be supported by prefixing the property name with "secure-". So for
> # instance "secure-foo" would override "foo".
> 
> So maybe we could have
>  reg : the NS frame(s)
>  secure-reg : the S frame(s)
>  realm-reg : the Realm frame(s)
>  root-reg : the EL3 frame(s)
> 
> ??
> 
> thanks
> -- PMM

