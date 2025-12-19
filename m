Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1EBE6688C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 20:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GL9p7qqSXaVfduDz7bNM3qM40uPPM6mLLfdCSoBqEZQ=; b=mItLt6jQ7YQJt06T5TNJ8R3fhb
	1ne4bQ1uHpBSYXfbOGVcM/Hh3jBJhzjEc3lUWlKt8H4e1R2A2a2BSM5qi2OgKMgkgdb/uUGRCYDo6
	/gycyLkmaWY9yKCNoA965Uj2IQGODYjxnG5i7o7kuxY7PS8ON3u+UyUxFjrUgkK1v8qFEvIv12I0E
	tWPj/zPhpdhv1Uk0hcvk9nNpryCEG2E89gHcmd4ZoFgOlP732xDrZs9pTyTO9tR+CU2SQma48LQWM
	GVAHdMuOakkK47rrA5R0on5G/G8DvzCRlhBxAf8hE/zjJwj5Wn3FGMqBpia3MwIWFn+/NX97dTNRu
	L02qRCbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWhIY-0000000AxZB-1f1O;
	Fri, 19 Dec 2025 20:42:02 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWhIV-0000000AxXL-05aW;
	Fri, 19 Dec 2025 20:42:01 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id B992DC000C85;
	Fri, 19 Dec 2025 12:41:57 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com B992DC000C85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1766176917;
	bh=lZ0bxC35naE5+wUog0cgqIFR4ld8pJimi6uVMVZ57Zg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cRys4NeCPx6M6/fxqgmh571+lNk3oKoaXsmnkKrunE1LmpaCBpZIwtwkjNa9b+CuQ
	 R+Hc3vVxTpEeULcrHiBih8YSTVhQsAxRIIViETdQmBBaAEqwMH6k8q4qFkAyTS6wos
	 H/9d2znu9giDTH0vOnwIs6S5sGltwF5jMQfteUSM=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 49451867F;
	Fri, 19 Dec 2025 12:41:27 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Andrea della Porta <andrea.porta@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Phil Elwell <phil@raspberrypi.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 2/4] misc: rp1: drop overlay support
Date: Fri, 19 Dec 2025 12:41:27 -0800
Message-ID: <20251219204127.1015395-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <4b0aa7160877cf128b9bc713776bcac73c46eb24.1766077285.git.andrea.porta@suse.com>
References: <cover.1766077285.git.andrea.porta@suse.com> <4b0aa7160877cf128b9bc713776bcac73c46eb24.1766077285.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_124159_135736_494792E5 
X-CRM114-Status: GOOD (  10.94  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Thu, 18 Dec 2025 20:09:07 +0100, Andrea della Porta <andrea.porta@suse.com> wrote:
> The RP1 driver can load an overlay at runtime to describe the inner
> peripherals. This has led to a lot of confusion regarding the naming
> of nodes, their topology and the reclaiming of related node resources.
> 
> Since the overlay is currently not fully functional, drop its support
> in the driver in favor of the fully described static DT.
> 
> This also means that this driver does not depend on CONFIG_PCI_DYNAMIC_OF_NODES
> and no longer requires PCI quirks to dynamically create the intermediate
> PCI nodes.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/fixes, thanks!
--
Florian

