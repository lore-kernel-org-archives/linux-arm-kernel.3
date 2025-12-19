Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D000E6688C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 20:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lwyEdu6XbgiSsGtQ4IbkpbtgmNyvAZ5gzOV5F+MzB9s=; b=gpU5SUgET3YEsZ3NaJSHiXfpwa
	X7r5ArQ1HodB3Y4Fj0rdP4sHAHAK5/wzhZVa+c2OPjrRSYpTsB1k0WbUBSNgRkfEN/09EL6sa6q3f
	b1zuUg2XZ3nsNl4tEoIoqF5wKnRwsVPY6PqzL0ON4MVkw94TPlpVb72TATPEY1uDHK9Mfom5SSc/K
	KxZMPbzIyFcv6QXZrSrCwoFrK+KUhtwpPEp8teOHzP/ZAAe5P2HTPdPL/cRjJlrmbHqh7gHGScgP9
	nN+EnvwLS1KvXecOh94CPAHDPRuAhHKIXvJKszRxJxtecGu2zSVhz3UWfHohzeL7i2zMl28YYjtxp
	GOzQVg+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWhHq-0000000AxOp-2Jlk;
	Fri, 19 Dec 2025 20:41:20 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWhHn-0000000AxOR-3YBF;
	Fri, 19 Dec 2025 20:41:17 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 432FFC0003E5;
	Fri, 19 Dec 2025 12:41:12 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 432FFC0003E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1766176872;
	bh=eXvglLzfTlazaDlfmtpwIdLoXBeMFW1gMdms6uDntaE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=v5PLJgwOS7xl1UTelwOsDq1oICX6raWwQjUTgxmYoTR3rdvdE8k1MqSvnpVhDXlIk
	 RyhwpyGRwHc2u27NpwjlMzskhNnM/gfCwp4XLb1lUmmxJoBIs3QtS9y6D/1ODleI1y
	 tikhcDN+q4G8eU7ZOQa26+AFr0WzYLVxTA6cjToI=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id CB517867F;
	Fri, 19 Dec 2025 12:41:11 -0800 (PST)
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
Subject: Re: [PATCH 1/4] dt-bindings: misc: pci1de4,1: add required reg property for endpoint
Date: Fri, 19 Dec 2025 12:41:11 -0800
Message-ID: <20251219204111.1015295-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <b58bfcd957b2270fcf932d463f2db534b2ae1a6d.1766077285.git.andrea.porta@suse.com>
References: <cover.1766077285.git.andrea.porta@suse.com> <b58bfcd957b2270fcf932d463f2db534b2ae1a6d.1766077285.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_124115_997190_EFD28A19 
X-CRM114-Status: UNSURE (   9.69  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Thu, 18 Dec 2025 20:09:06 +0100, Andrea della Porta <andrea.porta@suse.com> wrote:
> The PCI subsystem links an endpoint Device Tree node to its corresponding
> pci_dev structure only if the Bus/Device/Function (BDF) encoded in the
> 'reg' property matches the actual hardware topology.
> 
> Add the 'reg' property and mark it as required to ensure proper binding
> between the device_node and the pci_dev.
> 
> Update the example to reflect this requirement.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/fixes, thanks!
--
Florian

