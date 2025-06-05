Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E780DC61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 08:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oV7RNixC88Byf1NsKe1vq8fd89ayGvf+AvVVbIB7lpI=; b=QgBHh9qosBT6n7BIIFoJ24axL/
	EzO7luMze9yKpM1V3QUoqlI6PARDKJbpv/a4lZGE0tqiUuzJ7Ns3LnIWZvrt7Dulo2pY+C9zTrP+0
	dO1xRDwJI2YJkXjGjUT57M6Q/4IJeVs6Bf1dSETRP0SJEihJaa5xpEpintbyeV7Nld+TDDsnhfjWs
	ASNyzT8eIKxSYFI+/aFSMhkHVbt0uP/k0sKDsTAYy/WxBEQCtnylJgaaIyqRPV8R+3Airg0cLyoPC
	O6q0IVo1/EvslktdKcq7AAUagDrb48OOi9cMoR1a46+atE9Kg/x6CncRuSGBXk+gSgSyqJjCeY44N
	4ydjTbjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN5eX-0000000F23V-2ejp;
	Thu, 05 Jun 2025 08:08:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN5cM-0000000F1ve-1mFU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 08:06:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B5B160007;
	Thu,  5 Jun 2025 08:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9997C4CEE7;
	Thu,  5 Jun 2025 08:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749110789;
	bh=2iz0xU6HSrN4K4tK4hEhiPBRQmZaCe79rTHf++duDHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tKmO/cgTih5V5cwtej6E/eOSdd8IfM2dq4hEQ64rqvF1XNV4O2Kdv3bsek8VhtSwX
	 FUz9a77eJG2BnpptEdaokF+6TjeZ8YF8tTOlDu02OjC7IkGk1BbipUuName+rv1y4m
	 oWp8Ot3S8uamg/bAa/JNKUn0aBJ/0hWLpIQGYaFXrJLZciTOPa9za/ZtbZOv60ig+R
	 cGP75HXbzRmRAmGEUnpokkwk/9dhwUwiNejkjEszVEHtQZKYDBz383+XywHhDvnPtV
	 LzXEqmHBlObHMVg5kmUE4yc6sNntDigJNpCSKEjHJJmRnUHxWU29PH5zWPgP0QURPB
	 HJGR63N5mki4g==
Date: Thu, 5 Jun 2025 10:06:19 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
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
Message-ID: <aEFP+wsYCmMgIyhs@lpieralisi>
References: <aDhWlytLCxONZdF9@lpieralisi>
 <CAFEAcA_3YLMSy+OsSsRayaRciQ1+jjh-dGzEjrh2Wa8BqdmqrA@mail.gmail.com>
 <aD6ouVAXy5qcZtM/@lpieralisi>
 <CAL_JsqJ5N2ZUBeAes=wexq=EstRSZ5=heF1_6crAw76yZ9uXog@mail.gmail.com>
 <CAFEAcA-JrS0BiT66iin-pRVFadrY-pnJZ8TkDNxcjErknSCnUA@mail.gmail.com>
 <CAL_JsqL7x53an2-MaLHP5tfVXb4JxT8ORUMaA8pL-gMsWLJqkA@mail.gmail.com>
 <aD/0tuak7Hja8k4g@lpieralisi>
 <878qm7ec19.wl-maz@kernel.org>
 <aEB10JC1bwwOJfWh@lpieralisi>
 <CAFEAcA9xBJiRQ+UMvyOSOqOwMPYrjja0Vhk8j4_0V7f7_0ETtg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9xBJiRQ+UMvyOSOqOwMPYrjja0Vhk8j4_0V7f7_0ETtg@mail.gmail.com>
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

On Wed, Jun 04, 2025 at 09:09:27PM +0100, Peter Maydell wrote:

[...]

> > When I said "a separate problem", I meant that, extending secure- tag
> > (that applies to the "status" property only) to cover other PASes is
> > independent from the GICv5 binding *if* we define, for a single DT an eg
> > IRS device per-PAS (with realm-status, root-status, describing what the
> > reg property represents. Is that what secure-status does today ? Does
> > it say "this device MMIO space is secure-only" ?).
> >
> > It does not look like there is much appetite for tagging the reg
> > property either and making it GICv5 specific is a shortcut IMO.
> 
> I think something GICv5 specific is not unreasonable.

We need to define up to 4 interrupt domains (so max 4 frames per
component per frame type: EL3, Secure, Realm, Non-Secure).

Options:

1) Using reg and reg-names, I don't know if reg-names allows us to
   describe all possible resource names and the order does not matter,
   please let me know. Keep in mind that some resources are optional.

   Something like, for an IRS:

   reg-names = "el3-config", "secure-config", "realm-config",
   "non-secure-config", "el3-setlpi", "secure-setlpi", "realm-setlpi",
   "non-secure-setlpi";

   With that, I would remove the description in the reg property and
   just say minItems: 1

   This implicitly means that describing in DT a resource that the
   CPU possibly is not able to reach depending on
   security-state/exception level is OK. AFAICS reg-names achieves
   the same purpose of tagging below, at the end of the day it is
   a means to say eg "if you are non-secure stay away from something
   that does not belong to you".

2) We add a tagged "reg" property for GICv5 ("reg" refers to non-secure):

   reg
   el3-reg
   secure-reg
   realm-reg

3) We add a GICv5 tagged "status" property and define an eg IRS device per
   interrupt-domain ("status" refers to non-secure):

   status
   el3-status
   secure-status
   realm-status

4) Anything else that I have not thought of

What's the best option ? Please let me know, I'd like to repost the
series at v6.16-rc1 with a solution.

Thanks,
Lorenzo

