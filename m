Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B74C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vDHDpA7JX0IfKfzEPB4rBqEuUrfcVoTPbDvJEtnYxvI=; b=h+oCx5VkjPsGCbKn+KYlhGmAC5
	1S2+r/Njq3vmY/fWoC/TAbHOQXYAy0i3fZnTxGVHrhP+BEe9VYg+Gyont6SX1J21OhTOBtAMDos2I
	Pto24bzphDh+C7SSOrd2NoLEycAcmwl/nB13ww2v4lgiXSRYoiIVLQqpV9b5kxpwVZoIv+XVAaAJA
	G0/fYNBRPRGlXLwb53YEb0/5SXLzRoAHSOLoLIWTkT1WFhb9KBphHsyyl23M9G3R4m67O6IWkAt4n
	4m4ZDRqtVm3UGlfSwCdtim9TqOeAqDOLW0G7EgzLjbryLacSPKYu4tOxcpkPKzstulPHn5Zdf4w+U
	WBo9VLVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR1S-0000000CWH2-2uMh;
	Thu, 03 Jul 2025 20:59:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMQf-0000000Bvu5-1ZVA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 16:04:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A809C46552;
	Thu,  3 Jul 2025 16:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499FAC4CEE3;
	Thu,  3 Jul 2025 16:04:49 +0000 (UTC)
Date: Thu, 3 Jul 2025 17:04:47 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v7 19/31] arm64: Add support for GICv5 GSB barriers
Message-ID: <aGaqH4kJdlk3_qOf@arm.com>
References: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
 <20250703-gicv5-host-v7-19-12e71f1b3528@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-gicv5-host-v7-19-12e71f1b3528@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_090453_430237_3A1A4D44 
X-CRM114-Status: GOOD (  10.11  )
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

On Thu, Jul 03, 2025 at 12:25:09PM +0200, Lorenzo Pieralisi wrote:
> The GICv5 architecture introduces two barriers instructions
> (GSB SYS, GSB ACK) that are used to manage interrupt effects.
> 
> Rework macro used to emit the SB barrier instruction and implement
> the GSB barriers on top of it.
> 
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

