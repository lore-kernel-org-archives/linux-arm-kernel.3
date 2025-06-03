Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F56CC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 16:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+8j0QbVPvAazw41RnGapY/bRkRu1YdVj+NJ6gNt84M=; b=t3NWlhzIbqA6BTLCnYzfJHb6Ne
	4CAdedfC1GY2s7K3L+u/ZJiyK5p0jBoOa9M2gPyCLIQFebresyzifyG/+dTw/bVQVh0xKXqj5XDb+
	ZZP40x1dxKzeDKgxfDA66KskgVEfAKltoDeGBncK+cmCPJF8UP9L5ILlKagHaU+2v1P9aYDNSrcK6
	zW/5GAJrfcZ76JQh17PiwGJRrtTh27wWUEcLNmqAhNorF1A3O/3aBMD8XNq3YYW9IbNeEBlLXOTV4
	XkcTsKLB0jD2YWXhc81o2jxjjyDBZtxmjewWpIu5wMfCD3zip9GslSbEDptSznoGbsUaYW47GmJDU
	wSQAQvYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMU4n-0000000BMNv-47YR;
	Tue, 03 Jun 2025 16:01:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMTxI-0000000BKs5-0lX3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 15:53:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E2AF749C66;
	Tue,  3 Jun 2025 15:53:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C608BC4CEED;
	Tue,  3 Jun 2025 15:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748966015;
	bh=ujm9MuI/e9VolCk4e0eb1/DBEfCNPcM/FoVXZk/NeXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bUPrDeKN6S5ATwkVju4UuE4PGM3yT9mWmZc47U6x6ymNepe8Gv/IW133YFTeBEo/T
	 mnbFsDX11nCCrBnr+7UZXR+8fDAiEeeDkOBC6Voi4Mr+t8pGTQemHkMHUQYu1HOHPV
	 iSiMGus9LNTzHAQnu/Eq4CxyS8Cxd9WFY4k29P2UGrirQARIhAo6hXLRzZ5vyksPjD
	 LRYWBBdAF2u64Nt+OvCOJEPXAI2wu1MpPPMHTNRPI8SZBa9N7eJqhZ/pXj5JuwcyLw
	 wFSM/vfOvFIBFt229CJhraqS3Q0mpDEWujvVM3Y2J21iiiCQc9K6romdITw/Snp9Ez
	 uP9JCowCZNdWA==
Date: Tue, 3 Jun 2025 17:53:26 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
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
Message-ID: <aD8adnQWcII5XO2J@lpieralisi>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org>
 <aDhWlytLCxONZdF9@lpieralisi>
 <CAFEAcA_3YLMSy+OsSsRayaRciQ1+jjh-dGzEjrh2Wa8BqdmqrA@mail.gmail.com>
 <aD6ouVAXy5qcZtM/@lpieralisi>
 <CAL_JsqJ5N2ZUBeAes=wexq=EstRSZ5=heF1_6crAw76yZ9uXog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqJ5N2ZUBeAes=wexq=EstRSZ5=heF1_6crAw76yZ9uXog@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_085336_268676_70C64089 
X-CRM114-Status: GOOD (  44.66  )
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

On Tue, Jun 03, 2025 at 10:15:25AM -0500, Rob Herring wrote:
> On Tue, Jun 3, 2025 at 2:48 AM Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> >
> > On Thu, May 29, 2025 at 02:17:26PM +0100, Peter Maydell wrote:
> > > On Thu, 29 May 2025 at 13:44, Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > > >
> > > > [+Andre, Peter]
> > > >
> > > > On Tue, May 13, 2025 at 07:47:54PM +0200, Lorenzo Pieralisi wrote:
> > > > > +      reg:
> > > > > +        minItems: 1
> > > > > +        items:
> > > > > +          - description: IRS control frame
> > > >
> > > > I came across it while testing EL3 firmware, raising the topic for
> > > > discussion.
> > > >
> > > > The IRS (and the ITS) has a config frame (need to patch the typo
> > > > s/control/config, already done) per interrupt domain supported, that is,
> > > > it can have up to 4 config frames:
> > > >
> > > > - EL3
> > > > - Secure
> > > > - Realm
> > > > - Non-Secure
> > > >
> > > > The one described in this binding is the non-secure one.
> > > >
> > > > IIUC, everything described in the DT represents the non-secure address
> > > > space.
> > >
> > > The dt bindings do allow for describing Secure-world devices:
> > > Documentation/devicetree/bindings/arm/secure.txt has the
> > > details. We use this in QEMU so we can provide a DTB to
> > > guest EL3 firmware that tells it where the hardware is
> > > (and which EL3 can then pass on to an NS kernel). It would
> > > be helpful for the GICv5 binding to be defined in a way that
> > > we can do this for a GICv5 system too.
> >
> > It would be good to understand what DT {should/should not} describe and
> > whether this DT usage to configure firmware is under the DT maintainers
> > radar or it is an attempt at reusing it to avoid implementing a
> > configuration scheme.
> >
> > Rob, Krzysztof,
> >
> > Any thoughts on the matter please ?
> 
> I'm all for firmware using DT, but using a single DT for all
> components with an ABI between all components is an impractical dream.
> You can take that a step further even with a single DT for all
> processors in a system (aka System DT). Ultimately, the DT is a view
> of the system for a client (OS). Different views may need different
> DTs.

Specifically, for IRS/ITS frames then - what the current schema does is
correct, namely, it does _not_ spell out whether the IRS/ITS config
frame is NS/S/Realm/Root interrupt domain, that's information that the
client implicitly assumes.

Are we OK with this approach ? This would leave open the possibility
of having a DT per security-state.

If in the DT schema I define eg reg -> "IRS NS config frame" by
construction the binding can't be used for anything else.

Please let me know if we are in agreement on this matter.

Lorenzo

> u-boot and Linux sharing a DT makes sense as they have the same world
> view. Secure and NS not so much.
> 
> > [...]
> >
> > > The tempting thing to do is to have regs[] list the frames
> > > in some given order, but the spec makes them not simple
> > > supersets, allowing all of:
> > >  * NS
> > >  * S
> > >  * NS, S, EL3
> > >  * NS, Realm, EL3
> > >  * NS, Realm, S, EL3
> >
> > Maybe reg-names can help ? Even though first we need to understand
> > what resources should be described in DT.
> >
> > Current bindings are reviewed and I am not keen on dragging this
> > discussion on forever - the information the kernel requires is there,
> > I'd like to bring this to a close.
> >
> > Thanks,
> > Lorenzo
> >
> > >
> > > secure.txt says:
> > > # The general principle of the naming scheme for Secure world bindings
> > > # is that any property that needs a different value in the Secure world
> > > # can be supported by prefixing the property name with "secure-". So for
> > > # instance "secure-foo" would override "foo".
> 
> Today I would say a 'secure-' prefix is a mistake. To my knowledge,
> it's never been used anyways. But I don't have much visibility into
> what secure world firmware is doing.
> 
> > >
> > > So maybe we could have
> > >  reg : the NS frame(s)
> > >  secure-reg : the S frame(s)
> > >  realm-reg : the Realm frame(s)
> > >  root-reg : the EL3 frame(s)
> 
> Here's why. It really doesn't scale.
> 
> Rob

