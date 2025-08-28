Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AB6CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gAeJYPiWvvW/0IyRkIBxLQARRkyu4B4Y9YGUAn6QIxg=; b=ZtWeUKq+dA2DuZ4ow3bLrpllgT
	Im56Mvpnm8LfYYELyw9l6gLXbsAbtbc+s4Rk+H+wipMs/BryioV/xSBhhOpnuZnV5A9YrF2XkeeGY
	IjBCXb6sAel0Bpb6lfeW54jxqkWJDRb1HA5DUpBvSeMCbDMTbfMj3MUPxP9Eou2cEybOeSfMox9sv
	RtH99cYEFekvw+zdLIJkVWvTWxi9ZXLG7zqAdrJo/6hQb4uiEdeZzztKjfaW3nHFJ7Oyl+QdPcO3K
	3/BiWEiLnuEtqO9+Lom7BQ/gTSsPwLR2Xs4zlc9TAJk70wFY8yJtLrGfkdZPZ7oW83DE7iQZWtI09
	AnDjh+QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgLT-00000002Pko-2Tsf;
	Thu, 28 Aug 2025 17:23:32 +0000
Received: from mta-64-227.siemens.flowmailer.net ([185.136.64.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urakb-00000001LKw-1wp8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 11:25:07 +0000
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250828112457d2a4f29aa8000207dc
        for <linux-arm-kernel@lists.infradead.org>;
        Thu, 28 Aug 2025 13:24:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=huaqian.li@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=gAeJYPiWvvW/0IyRkIBxLQARRkyu4B4Y9YGUAn6QIxg=;
 b=ppUKXa/SF25VHu0ObymsZkYC4YZ2jSnCePYE5s6U+rMfKnDLC/YmU0oyNMgEjnmnT+EFvm
 aCqIHHmfIbxEyZqMamA1nVx7Pc0PaSQmO+/9eXxjR8WkNbsyeAKvxFWXKahghSXQGpL6lH1F
 DUGQx6hvEl3TXnBrOm+Y5NcvyAdE1PWTkM8ibq+JL2GRJrJwbINYH2fCSkWDX1UjqDu2IwA0
 IeURwhammbS8kR9Zq2xaBEohFhVgfcQdivDLS+xNUo7wbiFn/z0uD5lEafZ/R/zWwPmvrC/n
 mPxk7yqSx2nGy1bmyp7LIzONckMdbUy7qfiNaBXUZaFFqXXnXN0inu/g==;
From: huaqian.li@siemens.com
To: mani@kernel.org,
	arnd@arndb.de
Cc: baocheng.su@siemens.com,
	bhelgaas@google.com,
	christophe.jaillet@wanadoo.fr,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	diogo.ivo@siemens.com,
	helgaas@kernel.org,
	huaqian.li@siemens.com,
	jan.kiszka@siemens.com,
	kristo@kernel.org,
	krzk+dt@kernel.org,
	kw@linux.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	lkp@intel.com,
	lpieralisi@kernel.org,
	nm@ti.com,
	oe-kbuild-all@lists.linux.dev,
	robh@kernel.org,
	s-vadapalli@ti.com,
	ssantosh@kernel.org,
	vigneshr@ti.com
Subject: Re: [PATCH v12 0/7] soc: ti: Add and use PVU on K3-AM65 for DMA
Date: Thu, 28 Aug 2025 19:24:34 +0800
Message-Id: <20250828112434.2310936-1-huaqian.li@siemens.com>
In-Reply-To: <yhbjfg7dqx3xud75rhwlhq7ayqa4d6wrsan2j7ki7ri3uynpeu@hdv2o33x4hdn>
References: <yhbjfg7dqx3xud75rhwlhq7ayqa4d6wrsan2j7ki7ri3uynpeu@hdv2o33x4hdn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-959203:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_042506_090296_C09D5233 
X-CRM114-Status: UNSURE (   7.24  )
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

Hi Mani,

Thanks for your offer to help with the patch series. Yes, let's proceed
with splitting the submission:

Please go ahead and take the dt-bindings through the PCI tree. That would
be helpful to get them established early.

Hi Arnd,

Could you please take care of the driver code with the cross-dependencies
through the arm-soc tree? The PCI controller driver has the API dependency
with the SoC driver as Mani pointed out. Could you let me know which specific
components of the series you would be willing to take?

Best Regards,
Li Hua Qian


