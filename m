Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59376C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 21:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/+95TsSibmJptCdWsSInY+mAYLICEaOnr+mjJvTqlE=; b=3O/q2z6mSyTHCZsEDcH+yCxGgR
	jev9WIpruCfbhkDcpt5731c5j5ZmfWz25F/1k7OP3vqjKFX42z2ridKW3eUM5Dmjb/Dag+D9c7Gt6
	WMLHRVXcfyeRBt8b1tzqOC1XbStdZLpDEoF8w6L8R5yby/6bI7sU/QdQoEDKOQEFUYazhHbrmvbi7
	ZTi8RYhHQIrH3HJm8qQDOlzOzVjOGEKu/IlaLbti6Gu9CvQJ038fkhKiQfV/ZGwKYx/L0Qd0lB8Nd
	+Don2oFhzDVN+AQ94Bs8eoPaeCxw9hQGDCTJg2a/L7wNFXAMtmljaqSkqpq4S4w7CO4fcUZS36Jct
	PTQDdCEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tctXI-00000005sQ2-2sxn;
	Tue, 28 Jan 2025 21:54:20 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.208])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tctVx-00000005sKo-1TgP;
	Tue, 28 Jan 2025 21:52:59 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 386EDC0042EE;
	Tue, 28 Jan 2025 13:52:55 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 386EDC0042EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1738101175;
	bh=DE4i83xDGnACgtqYquPb2U2yd3JFgJyxJZe0R+rjaGk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Um0/XxOybRsk7AN0Rz2y9RHzcv4PTIF46q8+SKrCgoBx2/jqMSTDM9GEHxw/evq9b
	 j1Mc9moz7GUJQWuhsS6ZLAyUpJG1oHOAAi8cakcMtx63NIvpjgbUgwcw7ywPU2U/fb
	 bP5iBR4UtSGKd/hE/YNxz4zMtj7ir8oeUqy2NwtU=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id B1E3918041CAC6;
	Tue, 28 Jan 2025 13:52:54 -0800 (PST)
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
Subject: Re: [PATCH v5 -next 10/11] arm64: dts: broadcom: bcm2712: Add PCIe DT nodes
Date: Tue, 28 Jan 2025 13:52:54 -0800
Message-ID: <20250128215254.1902647-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250120130119.671119-11-svarbanov@suse.de>
References: <20250120130119.671119-1-svarbanov@suse.de> <20250120130119.671119-11-svarbanov@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_135257_507167_7E2676DB 
X-CRM114-Status: UNSURE (   8.42  )
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

On Mon, 20 Jan 2025 15:01:18 +0200, Stanimir Varbanov <svarbanov@suse.de> wrote:
> Add PCIe devicetree nodes, plus needed reset and mip MSI-X
> controllers.
> 
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

