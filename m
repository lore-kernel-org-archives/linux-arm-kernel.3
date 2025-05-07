Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58396C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 16:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxVNvXmX3G7YqiFJjCXO2/8wx0H+3R188qUBHuj112U=; b=nAP9ZDYnOrnMJVmNOIEuRZKHnS
	hE3H98REqsRxitOidJZEpdiHm1ZwjUY1rdHM+s1fJ9dMKU/X/dVF0RGJkuv0z0ZLSFMz/GzJkRQcj
	/X1OJnw3XgTP/QwnPeZpnWZTmvY7fW1yBuLI4bj0G/KGR8PpNkTkXsuCIdioQpZvRV36iVYUKm72g
	2trRSCB5obEBa/3H/q61ZuSeJmgK4p2AO+0r96vHoDMZmloHI1CGTksKWNq15mi4DiRuZhFQpY8Xd
	6pxN3fRl1kEmqXXdjeL2wSBGC7Hydpfge+3emKF0A2Wz/KkUvpMTyz3LbMNdkejnbotbRHvxYrKTc
	xhlNvqsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChIU-0000000G6BB-3fW9;
	Wed, 07 May 2025 16:07:02 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgIv-0000000Ft5H-4Afw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 15:03:27 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746630201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BxVNvXmX3G7YqiFJjCXO2/8wx0H+3R188qUBHuj112U=;
	b=bLRmj+zUZntLyvQFMmKu0xbGmpTv8TCeHzGUjOiqfU3GRjgMHMwROeus+qjM6exXcSf9tA
	odzG/WvwRfHj3mP/2S1UrxTNr6VXnxilsxIrGhcVyXqV2ZQp9ekT95592eZCBquktC+zTw
	KAi3JKfng/myFWcbLCd8JTlV0Yyqz51aegALDoGQoFdoAMXu0N76yVdUsoczP7oRSlP5Kx
	fMKE1DCVcdAQ0ikDmk3JVMfelrFARUnTgybwj9XMZDLB69io6LLTN6vlCTx5Ok30bl1YQi
	Zrg0I+S8jbdJFqUxKNCFH+Wge89qiYqg4oRUBXroorLa5xD/ccgpRSoWQd5+5w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746630201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BxVNvXmX3G7YqiFJjCXO2/8wx0H+3R188qUBHuj112U=;
	b=VL09x8MT8p3aOzBp9Ybavyc/IFho5MstQvQR/Lq6igZtH/K5HdZHOKFW9+mIyFQ3PVMlEv
	VIMnwVcLpyyIDGBw==
To: Frank Li <Frank.Li@nxp.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Anup Patel
 <apatel@ventanamicro.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, Shuah Khan
 <shuah@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach
 <l.stach@pengutronix.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob
 Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Niklas Cassel <cassel@kernel.org>, dlemoal@kernel.org, jdmason@kudzu.us,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org, linux-kselftest@vger.kernel.org,
 imx@lists.linux.dev, devicetree@vger.kernel.org, Frank Li
 <Frank.Li@nxp.com>
Subject: Re: [PATCH v18 08/15] PCI: endpoint: pci-ep-msi: Add MSI
 address/data pair mutable check
In-Reply-To: <20250414-ep-msi-v18-8-f69b49917464@nxp.com>
References: <20250414-ep-msi-v18-0-f69b49917464@nxp.com>
 <20250414-ep-msi-v18-8-f69b49917464@nxp.com>
Date: Wed, 07 May 2025 17:03:21 +0200
Message-ID: <871pt0mpja.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_080326_169922_A1A51C37 
X-CRM114-Status: UNSURE (   6.55  )
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

On Mon, Apr 14 2025 at 14:31, Frank Li wrote:
> Some MSI controller change address/data pair when irq_set_affinity().
> Current PCI endpoint can't support this type MSI controller. So add flag
> MSI_FLAG_MUTABLE in include/linux/msi.h and check it when allocate
> doorbell.

This changelog has no relation to the patch.

