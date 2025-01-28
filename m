Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BEAC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 21:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HxJIMLcjaJXk/w1cbB1BarvyzClmerYs4PfSxDI+02k=; b=GKuAUIFnFC5wPlQMUkIbl52Kii
	BAoNGsMHU3mABA8dUfJpbvGxTUynx2Q0TEPXPofgN65vbhLp1r5DIOUxpJjciz3sNlu/8hs6uQyCr
	G3UUqk5x0mHDPJch1RHGUzzIgg45EcIhwAN1f46XeMb+JLEraw0wJyymkIizHtn6hlBstGVzPIOSd
	BhCUa58iJZpZ+ThX2iAYrsHat3NsYaAlg2SwVFaLbq9uUkR8MUsThlaZ7y18VRmxWTQzqmm6EXEKI
	iVzwMfgJgIMFWNxVUdNSWG63+nHxf1bZ+ckQ90eHJ9qNl+pP6vdyQXIaCwBCqvZXv+ebjx0wkddfE
	jq6FqCgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tctYg-00000005saT-3Bx1;
	Tue, 28 Jan 2025 21:55:46 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.209])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tctW5-00000005sLd-3ZwU;
	Tue, 28 Jan 2025 21:53:07 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 7BDBAC00499C;
	Tue, 28 Jan 2025 13:53:04 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 7BDBAC00499C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1738101184;
	bh=ouAUmnB+IQUs2iVlJWxke5993KtKRO9YWSyZ8IgOniU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KIrgP1RjZ6XFs5cve2I9XF7/mfWN40XOZbYY76GNErcC/wpM6IMJjjhOPF9xJS6qC
	 0Md4gUFE+qusXPxlKkpxJKDEvPvZY3U7gu8qlZi4jEba+lQwnGvNgZPtCLhC7K/rim
	 gx9YVuRfTJ2oCc4fr+3NLWB84Rv+ry6hXBh8mcZg=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 09BD418041CAC6;
	Tue, 28 Jan 2025 13:53:04 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Stanimir Varbanov <svarbanov@suse.de>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	kw@linux.com,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v5 -next 11/11] arm64: dts: broadcom: bcm2712-rpi-5-b: Enable PCIe DT nodes
Date: Tue, 28 Jan 2025 13:53:03 -0800
Message-ID: <20250128215303.1902738-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250120130119.671119-12-svarbanov@suse.de>
References: <20250120130119.671119-1-svarbanov@suse.de> <20250120130119.671119-12-svarbanov@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_135305_972613_58EDC5BB 
X-CRM114-Status: UNSURE (   9.16  )
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

On Mon, 20 Jan 2025 15:01:19 +0200, Stanimir Varbanov <svarbanov@suse.de> wrote:
> Enable pcie1 and pcie2 DT nodes. Pcie1 is used for the extension
> connector and pcie2 is used for RP1 south-bridge.
> 
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

