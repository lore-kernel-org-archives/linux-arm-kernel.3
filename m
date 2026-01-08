Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5865D1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ppl5WpXiO8c21GQ2jFirARVPaV5HmW7WYNGfTwD8Xs=; b=yH6AnEwTxQ9zkgXwicvIeXIo/C
	+sCNjRLqUQGF6xDWO+yyi4TIcyXtNmrkcrpOy+cnbfY+DQ5uQt33OSfYj5MHK9ImrWJf8jN42uwA3
	La7M1FftXgufICO9f9hNMjyydVx0uXkUve+24AtNFwbccRpfELo11f+/dqqOkT6XlIQPaEWB/jJpY
	ajpZ9Ytml0NrDpn7uplniylJ7EEQG5/SfiwNn3WHFPLv5+uCFWjkp9PFi/b67smwELMELm39EDNfq
	yuAHaGvNaxwK1CyAFT3QeH1/CUnj36AScMCExRoAU/1WKjnxDH8K2Rn/wdk5XyeuF32DonoOkyy/T
	FvWq9qvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtsc-00000000Plv-3FuP;
	Thu, 08 Jan 2026 17:33:02 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtsR-00000000Pbi-3SqW;
	Thu, 08 Jan 2026 17:32:53 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 6E560C01B58D;
	Thu,  8 Jan 2026 09:32:51 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 6E560C01B58D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1767893571;
	bh=+6LJw45byJ0D4Sf6IB/oExgAext8Z4a2RyMcQDJnNx0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UqrRO7lYSq5avlNSLayX4oBtLA5GlldPFKILHAsuxwuHZv+c/BzTAxFpbKLqgOEtZ
	 wd7eKUFjs6H2pqb/i90Etz9uzdZSx35S5nHqr81c2d8Zs7xs8ktgm3ZaCtN3Z/Uogd
	 lAUWBnGVJ6YtR8AHQM2tn2FXReKvEFMgyldL0/QE=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 428531CAF3;
	Thu,  8 Jan 2026 09:32:51 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/13] ARM: dts: broadcom: bcm2835-rpi: Move non simple-bus nodes to root level
Date: Thu,  8 Jan 2026 09:32:51 -0800
Message-ID: <20260108173251.3783878-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106-dt-dtbs-broadcom-fixes-v1-2-ba45874e4553@kernel.org>
References: <20260106-dt-dtbs-broadcom-fixes-v1-0-ba45874e4553@kernel.org> <20260106-dt-dtbs-broadcom-fixes-v1-2-ba45874e4553@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_093252_485856_06226918 
X-CRM114-Status: UNSURE (   9.09  )
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

On Tue, 06 Jan 2026 20:09:41 -0600, "Rob Herring (Arm)" <robh@kernel.org> wrote:
> The 'gpu' and 'firmware' nodes are not MMIO devices, so they should not be
> under a 'simple-bus'. Additionally, the "raspberrypi,bcm2835-power" node
> is part of the firmware, so move it under the /firmware node.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

