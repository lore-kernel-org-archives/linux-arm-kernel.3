Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8B2C83029
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 18:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZc+c9PIZZMIc+ibI+LVvwhWK2sGNGUIV/jrLybq0cw=; b=kspbk90NkhhRMtBV3vttNVqG62
	zCZ09iNR9pGJ44uN/hmwuJL7+yt5/eBmtM4dCVnlmujzZDhYC6xwhL9i1XAm8pATCGC3L8tnj+XmV
	7kmqC1JkRiqSrJBhbTCEY1VC8nKwH+E/1c9ijD/x/7h9i/Lnpaj0LrbCsiR0SaOe4fvcoFXV7jWeB
	F9I3Cnhu7vrqSdaXXScBpEpxxCd2IT796tYAVi0ka+SCBE6Exk/C64wfPLoeHsWOhbyWRIkBNawN5
	yLwCkpmM9WukdDxVMiGy+H8jnKv7qhHrxvt225RrjZtaoiySCjDYbvmm99WgSSdgpSkx0KLPq7EWX
	0zXV7d9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJ1X-000000039f3-3fDl;
	Mon, 30 Jun 2025 18:14:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWI80-000000033GB-311y
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 30 Jun 2025 17:17:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IZc+c9PIZZMIc+ibI+LVvwhWK2sGNGUIV/jrLybq0cw=; b=GXkRjRHLmvGG+t30RPB+DTIqyG
	R8uujLr7NyQoaft6MFi4FmQDa9zaYWEMwlCIH8uGz76WVtzxO9kt8Fol7Nj50wFoMFdmb2r+Scq2k
	/85/Qja2be2vloQ+Rm7VSoemoUMckoAFFsX5nn/uQ2IMkON5YAcys716mkDCJJfWtI+xMWbKBymZw
	eyhB0Kq/CXAauqqktA4ePHTT7YUjs9UjcGR3uJEPmUZlfIrI1Pjsk11UQdsC6+FP9saRmNDVPbo0d
	IaCGKS0ARmt1vfumfHpW6qAufqWLKwtkxcj3n5w090W1ih6RFp9Bi5x8W6DegO1cqSyi34j/GiLDM
	ELIF/ynQ==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWI7x-00000006pIV-2Hyf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 17:17:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 44E44A5354F;
	Mon, 30 Jun 2025 17:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5D1C4CEE3;
	Mon, 30 Jun 2025 17:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751303825;
	bh=RxENiAIxryG/e9PnDRmuJ2qoeNevxHN+jSL1+CqMpqw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gK7PLjxPWHRqv8leFMCxzAZgWK02KxZqRotqN8kQWL4Io69FgUlJ0Fo2ZgCYWBJlY
	 CeCre45jA8BT+VMmEktD6EtSMdfkCjYyWxky07IUb4TgRoihvNGYCfGgHwN/OYSeif
	 9W7RDwjwepqgEJxMt/owvKqHaszwHtqfAaYrVyn+HOQrPRB1YiVjl2As0HL0IQExd1
	 Jv7zwgafCJbW98b7kjfQCCT4wE/cjPlopOmSyPb1pDVQLsBcTB0Kaekf+LAHdHsgfa
	 vT0o7Yat4+natNFdPbKo49LdEHjQFKvQK+qt0Mx+usj4BSXqBwbItRTTQvMvp2YPRG
	 Qh4Clax4BIHiA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uWI7r-00BJye-1d;
	Mon, 30 Jun 2025 18:17:03 +0100
Date: Mon, 30 Jun 2025 18:17:02 +0100
Message-ID: <86jz4tb14h.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v6 00/31] Arm GICv5: Host driver implementation
In-Reply-To: <20250626-gicv5-host-v6-0-48e046af4642@kernel.org>
References: <20250626-gicv5-host-v6-0-48e046af4642@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: lpieralisi@kernel.org, tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, sascha.bischoff@arm.com, Jonathan.Cameron@huawei.com, timothy.hayes@arm.com, bhelgaas@google.com, Liam.Howlett@oracle.com, peter.maydell@linaro.org, mark.rutland@arm.com, jirislaby@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-pci@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_181709_826899_C22CE3B6 
X-CRM114-Status: GOOD (  17.16  )
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

On Thu, 26 Jun 2025 11:25:51 +0100,
Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> 
> Implement the irqchip kernel driver for the Arm GICv5 architecture,
> as described in the GICv5 beta0 specification, available at:
> 
> https://developer.arm.com/documentation/aes0070
> 
> The GICv5 architecture is composed of multiple components:
> 
> - one or more IRS (Interrupt Routing Service)
> - zero or more ITS (Interrupt Translation Service)
> - zero or more IWB (Interrupt Wire Bridge)

[...]

I think what is here is pretty solid, and definitely in a better shape
than the equivalent GICv3 support patches at a similar point in the
lifetime of the architecture.

For patches in this series except patch 18:

Reviewed-by: Marc Zyngier <maz@kernel.org>

If this goes into 6.17 (which I hope), it'd be good to have this
series on a stable branch so that we can take the corresponding KVM
patches[1] independently if they are deemed in a good enough state.

	M.

[1] https://lore.kernel.org/r/20250627100847.1022515-1-sascha.bischoff@arm.com

-- 
Without deviation from the norm, progress is not possible.

