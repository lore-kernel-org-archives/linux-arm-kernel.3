Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D4AC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 16:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RmxXnn15NyHu5iEqG1Dm7qnIbzWveDTdxRI/zLqUA6E=; b=unCHUPqMdsZ2rX9u+mSkNSkE3g
	Mj1q657da6rkuYal6WsdpMGM3NbMj75aVzCpttAXmcgy8P8TsnrMqJQisIwIuSlbvnWrUZZi97fua
	Tga56eAqD6DsFJwWD2XpSTLWiGZrOuReC1PJr5uE2/1Cxh1oampT7R4VgrQQ6S0c/cjeMkLthPq44
	5aZEcvKkwWjmvgqUF7hjqxXiVQgagemXWVtkbvbmribRAii8pvpBHmT+rS9280uPEGeS1PMm0umVA
	vBkHwkmLqF9fcU+eDTS9oO/XPzdwwATCu7bPyJmkKaTHsntB1kDPHyjJbci2NY3jQOW89k3korDfy
	/1vn/Gdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMUwX-0000000BQe7-3PTS;
	Tue, 03 Jun 2025 16:56:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMUuO-0000000BQTq-1Pux
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 16:54:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BC90260010;
	Tue,  3 Jun 2025 16:54:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80DD2C4CEED;
	Tue,  3 Jun 2025 16:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748969679;
	bh=v1gSOUSa/yuBcyqHMjmBJtV13fLkxndWisCuM7m1CY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FN/1mcWK7Q9gz2YciYhXJUD+mkO4RMfAVUp9ry75R7kOt+4xZpQ9BMx2qzAyi86k2
	 vx4UP92/yUOVNd7nYOwzH8lysobtnL/te7If+sNfnfAc6RLv8KEuuBnbdieBqxvOfG
	 4t7DqUdcnFD5JDPXmhMFZkM0JXqz0YJw2lvykoboYghhD8RBiaXa0pb5oWxivApyuE
	 1E0LuCqz0++IgeTwxEELpseM47Nr07RpQm/haDLOQAxVB9fxb2FhGuKtqlfLd9ih+q
	 6NhrS4AgqbD4ckgqJZBsBPTSEKDCr2lqR00uQbkH5LA6FeJeZVPnYIyfJNsaUC4U5A
	 UZsBUHecxwgHQ==
Date: Tue, 3 Jun 2025 18:54:30 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Message-ID: <aD8oxsyuvLre2pY+@lpieralisi>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org>
 <aDhWlytLCxONZdF9@lpieralisi>
 <CAFEAcA_3YLMSy+OsSsRayaRciQ1+jjh-dGzEjrh2Wa8BqdmqrA@mail.gmail.com>
 <aD6ouVAXy5qcZtM/@lpieralisi>
 <CAL_JsqJ5N2ZUBeAes=wexq=EstRSZ5=heF1_6crAw76yZ9uXog@mail.gmail.com>
 <aD8adnQWcII5XO2J@lpieralisi>
 <CAFEAcA9sdrykbVLntW35fo0MgV2VNXnLUFa4AM=Aw34bOBprYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9sdrykbVLntW35fo0MgV2VNXnLUFa4AM=Aw34bOBprYQ@mail.gmail.com>
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

On Tue, Jun 03, 2025 at 05:04:33PM +0100, Peter Maydell wrote:
> On Tue, 3 Jun 2025 at 16:53, Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > Specifically, for IRS/ITS frames then - what the current schema does is
> > correct, namely, it does _not_ spell out whether the IRS/ITS config
> > frame is NS/S/Realm/Root interrupt domain, that's information that the
> > client implicitly assumes.
> >
> > Are we OK with this approach ? This would leave open the possibility
> > of having a DT per security-state.
> >
> > If in the DT schema I define eg reg -> "IRS NS config frame" by
> > construction the binding can't be used for anything else.
> >
> > Please let me know if we are in agreement on this matter.
> 
> This would break the QEMU virt board -> EL3 guest firmware ->
> EL1 Linux flow. We need a binding which lets us optionally
> specify "oh by the way here is where the other non-NS frames are".

Do we "need" a binding ? Or, it is a nice-have to help configure
QEmu (and other SW components, eg bootwrapper/TF-A, etc that decided
to re-use DT for their own consumption) ?

And even so, why can't we have a DT per security state as-per Rob's
reply ?

Given that only the "status" property is tagged with secure- today,
may I ask please how does this work ?

What's "EL3 guest firmware" ? Does it use the secure-status property to
detect that the respective device is secure/non-secure ?

And why does it have to be the same dtb we are passing to the OS client ?

> I don't have a strong view on the specific syntax.

I do because I don't want to revisit this later ;-)

Thanks,
Lorenzo

