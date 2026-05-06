Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55986CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 08:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i7i67lqwqKk10wMuYQxF5+U/o7nLQyiyUN7/CthSSj4=; b=qt5eVdRxk36XUgGchYrijSmQ3L
	ou9s8TeXxScJOWXmsrIcj0zK2ecbCK5ANxyB+JAiea/kuI/JPltL0LE1V0ggd+rOn/bzqLqCMqyjT
	v1ZGMDh9yeUr7qvCBVnPgsgOeEx6shNqCdioSowZ9xJi98hcRj3Nomv53qCkaUAryOYtej/i86PH6
	hoBIH6rgAyPxEsBi4Z05P5NHG4UrMJoXnuGpZzNMvLhnm4zNItyc9lkOgE49WYf513o3YVwQdes34
	TuOr3d6sB6KP4pzGqhmTSFWjXNmg+hjwAx13aiZgI60XHFLZiRK9t0f7SorjJLukcl/9EX2F69b1m
	LPV5a/Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXyH-00000000EAo-1doR;
	Wed, 06 May 2026 08:51:09 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXyE-00000000E8J-2jvu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 08:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778057466; x=1809593466;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gH4tNHByD1p7a5F+z6izPFgbESyPETnNCM9qNzu3rBw=;
  b=OZlTGtuhMJR/1viI2G27rjiq84inC5oxBK1nF/Zhqzjtu0iupHMo9cEE
   9H90DdbhvuqbFH+Hyi2LTxPYUR//dZRfPOeUHUxMnzSMV2imE3zXXFitX
   K/7TQQwfA0Iut4znv8ND1dZFmZ8D23CV1n5NxTf9/VK/u1xolosc9gEqc
   hXRBeWjmzb78oY3m0Oi4hDw4OlFUXBLn2S2+SCYiS7H4KAJFmO006jsg5
   KsIRuXUo+NBoTKkIzTnuDzLkZvNaXokFldNphRE5EuFcSGwv1WmSASGVX
   XPr7UuCMINvrmQ6TFVW8ag1l8VTHCwN5lwJ+Puw4ihJKItM1VsfgQRUSE
   A==;
X-CSE-ConnectionGUID: pJz2oUMzS6ewDQO8HsiYsA==
X-CSE-MsgGUID: nv33d9uWSteM7fki4VSXqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78869744"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="78869744"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 01:49:05 -0700
X-CSE-ConnectionGUID: d2Qu+C2NTJOdJ6Z0amNnPQ==
X-CSE-MsgGUID: /FRO+juXR4qywqDmV2LS9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="259510102"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 06 May 2026 01:49:01 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id EEEE995; Wed, 06 May 2026 10:48:59 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Niklas Cassel <cassel@kernel.org>,
	Koichiro Den <den@valinux.co.jp>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Greentime Hu <greentime.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
Subject: [PATCH v1 0/4] PCI: dwc: Drop or replace unused linux/gpio.h
Date: Wed,  6 May 2026 10:47:23 +0200
Message-ID: <20260506084858.867884-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_015106_729223_D8565CD3 
X-CRM114-Status: UNSURE (   8.01  )
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

The <linux/gpio.h> is a legacy header that is going to die.
Make sure that PCI DesignWare drivers do not include it.

Compile tested on x86_64.

Andy Shevchenko (4):
  PCI: amd-mdb: Use the right GPIO header
  PCI: designware-plat: Drop unused include
  PCI: fu740: Drop unused include
  PCI: visconti: Drop unused include

 drivers/pci/controller/dwc/pcie-amd-mdb.c         | 2 +-
 drivers/pci/controller/dwc/pcie-designware-plat.c | 1 -
 drivers/pci/controller/dwc/pcie-fu740.c           | 1 -
 drivers/pci/controller/dwc/pcie-visconti.c        | 1 -
 4 files changed, 1 insertion(+), 4 deletions(-)

-- 
2.50.1


