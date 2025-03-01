Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1E8C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 18:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7aAluflwF8uxqGPtsL2kQpy/Mt+z1OejY+ngR/xlVwA=; b=XwnK2aZCeFJf/F2k3DJVJ2+tfj
	z0lwOjL3IionyuoN9+GF0CQfE3MT+tLLqrfAgD0JwYo4Y+Wzo7GUd6LJB8eEf5wPL2dZDbLDZMNfg
	yFTuJu4PEMb0wfofjK0gj0GwOeaB9CXId6+tC5ojlIzVPDnnhEHDLUp8nVXkOS3a+p4iy4sZeG2ZN
	8q4lNDrbozY04SqP8WZWorYahSLAmCQ7nMkDTw7kGjVSWTpdKA4LAXFzm6rjVDiiDxvFh+g+Ekpjn
	2hCDRli3G4A6AH9yO+DWvExs5qdmIZOultFGIT7zhQ4O+kn1UQDIYsPvQWV6SrSq8svuOi1S04v3g
	EdJxCP7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toRJ0-0000000EkEL-2khp;
	Sat, 01 Mar 2025 18:11:18 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toRHQ-0000000Ek6u-3s5c
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 18:09:42 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1740852577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7aAluflwF8uxqGPtsL2kQpy/Mt+z1OejY+ngR/xlVwA=;
	b=wpczwOyWMsIC5xL2dzr/GEWVo681ybJMAa+f0e7K8fW51ZCfsUYSjDzvjIhWIvq2ud7yW+
	9VbEDuNAYHIvhW7Xe4XhLYvHHR/YuPwqoL2uKsN58NaK3dLwf/3or9U9jMJBD5r7KJj3dL
	WozYGrEoI0Q0QucZF5/RohIu1r5+xRbrpV3Oh8RocPpEVrsn+PjYpQmY4TW98MS0v9NwGs
	cOPceCK9wps63cE0Ah0F2Dw3hGQ+hT4dxWRdeOBj2IF7lE7lvWCEf3CM8GnKCu9C7ifbbB
	ycoHiW6RLyj+I6mnW4e4PsfoxEsh8Xru4haSb334UuKdXhW03TjurxMEgkEChg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1740852577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7aAluflwF8uxqGPtsL2kQpy/Mt+z1OejY+ngR/xlVwA=;
	b=bOD5z77+FsiaBwISDB+ppOhZwXZLsW93CjTdva9DyZjaS2IgUkbkM357Wb/3WsV+YQlN8Y
	mMHtAgK+F3jkw3Aw==
To: Marc Zyngier <maz@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Anup Patel <apatel@ventanamicro.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich
 <dakr@kernel.org>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, Shuah
 Khan <shuah@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach
 <l.stach@pengutronix.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 dlemoal@kernel.org, jdmason@kudzu.us, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-kselftest@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v15 00/15] PCI: EP: Add RC-to-EP doorbell with platform
 MSI controller
In-Reply-To: <86ldtpot6m.wl-maz@kernel.org>
References: <20250211-ep-msi-v15-0-bcacc1f2b1a9@nxp.com>
 <Z7eKBsxrmthtElpz@lizhi-Precision-Tower-5810>
 <86ldtpot6m.wl-maz@kernel.org>
Date: Sat, 01 Mar 2025 19:09:35 +0100
Message-ID: <87senwd3mo.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_100941_109417_89AC2BA5 
X-CRM114-Status: UNSURE (   9.56  )
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

On Sat, Mar 01 2025 at 12:02, Marc Zyngier wrote:
> - This IMMUTABLE thing serves no purpose, because you don't randomly
>   plug this end-point block on any MSI controller. They come as part
>   of an SoC.

Yes and no. The problem is that the EP implementation is meant to be a
generic library and while GIC-ITS guarantees immutability of the
address/data pair after setup, there are architectures (x86, loongson,
riscv) where the base MSI controller does not and immutability is only
achieved when interrupt remapping is enabled. The latter can be disabled
at boot-time and then the EP implementation becomes a lottery across
affinity changes.

That was my concern about this library implementation and that's why I
asked for a mechanism to ensure that the underlying irqdomain provides a
immutable address/data pair.

So it does not matter for GIC-ITS, but in the larger picture it matters.

Thanks,

        tglx

