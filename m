Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC6DC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 07:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bFgfoqbXBmLuwpBeWiaSnIfZqbpHx+6wXGb+4ajd7II=; b=XA+CEMIPpd45Bhr0b/57HMbaLa
	P3gBmilqBhQSmtwdr1dUVIK4sMGFeaGzDf1JArOIWvbhl5osW6Fe7qT3x9EfIF4TT2esw/K3xaEiE
	6U0P9u0B7yNeblqZvBahsNboqX0WPF7bpwzrhlaB4Hrkmw6cqHZtszJofuSyEb1NHBkpKf6YwjRO7
	38kpQ4EL8Z8enxyTHcKMKgjnQBAgkNezgZ8mQGS53SQI7sZNrXk+64Yjez0ye2BMsyV/e1wJjpA1n
	3yizzRsBrT5LOsBAbRNgdGYVB8vSj2RlXL5NRBndBVxpt+zh5oddwYrV+Q66uom+FO52O7xFoxvme
	OOPnVvTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMiWa-0000000Cleh-2JxV;
	Wed, 04 Jun 2025 07:27:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMiUS-0000000ClMb-2Efc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 07:24:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 07FEB5C3E57;
	Wed,  4 Jun 2025 07:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD61C4CEE7;
	Wed,  4 Jun 2025 07:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749021887;
	bh=d5VGZY3wjHIhKCGDSeV6VZbiBPYwu9t4ayf8AO8OlwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=odyy8wQ5ON02zPffOE2SJpBxUwUYz5rmT5lsE2yOgNbb2cDXnIwb0ACfUhTX9uK8c
	 bqVyvG+X44TOpZ6BjZz+yFBUGipEXDmEzroDs9BVd6rU1kd+cBPUWr4UygZJrRyDew
	 2CvhfHn6EhiRYyOc99eZpfidTitTHMZs/OH+xzIToCaZNP4v3VLaXeHt8xZCAG+AR1
	 HygqPF1tjl1zS5OKj2rvtKGX5HTGDoSj7qKMgGJEKYXjlNWHRkXg0QWLSlkBw8asQD
	 FH64MJHBBiUK2uTUApfPhWXBcE6MzA63npN2mN7MtdGj9u9vf32BHi+hkcr+OfHtVx
	 QFPWrpJi2/V7A==
Date: Wed, 4 Jun 2025 09:24:38 +0200
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
Message-ID: <aD/0tuak7Hja8k4g@lpieralisi>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org>
 <aDhWlytLCxONZdF9@lpieralisi>
 <CAFEAcA_3YLMSy+OsSsRayaRciQ1+jjh-dGzEjrh2Wa8BqdmqrA@mail.gmail.com>
 <aD6ouVAXy5qcZtM/@lpieralisi>
 <CAL_JsqJ5N2ZUBeAes=wexq=EstRSZ5=heF1_6crAw76yZ9uXog@mail.gmail.com>
 <CAFEAcA-JrS0BiT66iin-pRVFadrY-pnJZ8TkDNxcjErknSCnUA@mail.gmail.com>
 <CAL_JsqL7x53an2-MaLHP5tfVXb4JxT8ORUMaA8pL-gMsWLJqkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqL7x53an2-MaLHP5tfVXb4JxT8ORUMaA8pL-gMsWLJqkA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_002448_657281_793FE218 
X-CRM114-Status: GOOD (  27.83  )
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

On Tue, Jun 03, 2025 at 02:11:34PM -0500, Rob Herring wrote:
> On Tue, Jun 3, 2025 at 10:37 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Tue, 3 Jun 2025 at 16:15, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Tue, Jun 3, 2025 at 2:48 AM Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > > >
> > > > On Thu, May 29, 2025 at 02:17:26PM +0100, Peter Maydell wrote:
> > > > > secure.txt says:
> > > > > # The general principle of the naming scheme for Secure world bindings
> > > > > # is that any property that needs a different value in the Secure world
> > > > > # can be supported by prefixing the property name with "secure-". So for
> > > > > # instance "secure-foo" would override "foo".
> > >
> > > Today I would say a 'secure-' prefix is a mistake. To my knowledge,
> > > it's never been used anyways. But I don't have much visibility into
> > > what secure world firmware is doing.
> >
> > QEMU uses it for communicating with the secure firmware if
> > you run secure firmware on the virt board. It's done that
> > since we introduced that binding. Indeed that use case is *why*
> > the binding is there. It works fine for the intended purpose,
> > which is "most devices are visible in both S and NS, but a few
> > things are S only (UART, a bit of RAM, secure-only flash").
> 
> I meant "secure-" as a prefix allowed on *any* property, not
> "secure-status" specifically, which is the only thing QEMU uses
> AFAICT. IOW, I don't think we should be creating secure-reg,
> secure-interrupts, secure-clocks, etc.

Reading secure.txt, what does it mean "device present and usable in
the secure world" ?

So:

status = "disabled"
secure-status = "okay"

basically means that the device in question allows secure-only MMIO
access, is that what it says ?

If that's the case and we really want to have all config frames
in a single DT, would it be reasonable to have an IRS/ITS DT node
per-frame ?

Then yes, the secure- tag is not enough any longer (because we have to
cope with 4 interrupt domains) but that's a separate problem - again,
this would leave the current reviewed bindings unchanged.

Other than that as I mentioned we could use (? aka clutching at straws)
reg-names but I don't think it is correct to have in the DT address
space that the CPU is not allowed to address.

Lorenzo

