Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3E7C5AD05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 22:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YlLDYMvlrjDq4x7wME6iiLL3lLKOG8GUhUotAJ8Ukxk=; b=p3p8hGfh6BM6JbysUtTcsjQFFS
	JU4ovTyiic6SmpghcW9ew14r/qh4Mafjp1GjjQend/JJxGFXPFs4gj5XOjvRua2yfdbS7gdelHYUr
	PHlIVgj6k/8l2dWh7LWfLx+hw1468WHXTp0pI/XiT9f3YsKLXS1eXfGS4V17DFEAZPHzYR0eLxRp0
	acBv5GeFz3IgF3Bu3rYCERRz5GPabRUe1ocE1AeDFUr88IYtFOUrLzX//boU/csgRJucViWS5UrEO
	snUkm4eRiuz+Vh59WQ7+FV6z3/ZcaC5COcuGNr/bdOUbexqEcfSdvEAce8twCed2jj5G1vRmOELky
	wRO7uPGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsTX8-00000008qHH-20jC;
	Fri, 07 Aug 2026 22:59:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsTX7-00000008qH5-2YPY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 22:59:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E271660054;
	Fri,  7 Aug 2026 22:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD2D81F000E9;
	Fri,  7 Aug 2026 22:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786143560;
	bh=YlLDYMvlrjDq4x7wME6iiLL3lLKOG8GUhUotAJ8Ukxk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jPzpUmgjMNShpUhesX+Evfn4FUbm00ImqUAacj/SX9WZIR+zKrh0fbDLx4KGq2ZiV
	 DgnAWf1uqLmEKrpbv3IrUTkYeNptNq0kw0KQ7VLvveofW8zwb0sKbX6wM/sHri+uQ6
	 JW239kThVGiVCrbVCsEzxkxMWD8jImLv12UM2Z2VkUFPvgyXE1z4vnq4CvBWnKGRja
	 ShDNElG5I3UisQzQfW6smwPSg2XZoC4GM/D+gwCmP6w1TrpANspP1UK3DLJaseVmoP
	 U4GogZo34mVZN3UGBkhO1cAaPoZGJainNeADNE0mrgz7pkYFR/Hfcj3AQ2epah5I3Y
	 5jVPoXhaxPPag==
From: Danilo Krummrich <dakr@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	brgl@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ACPI: arm64: use platform_device_set_fwnode()
Date: Sat,  8 Aug 2026 00:59:15 +0200
Message-ID: <20260807225915.122789-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728-acpi-arm64-pdev-set-fwnode-v1-0-b5aff9b2235a@oss.qualcomm.com>
References: <20260728-acpi-arm64-pdev-set-fwnode-v1-0-b5aff9b2235a@oss.qualcomm.com>
X-Patch-Reply: applied
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On Tue, 28 Jul 2026 16:07:15 +0200, Bartosz Golaszewski wrote:
> [PATCH 0/2] ACPI: arm64: use platform_device_set_fwnode()

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/2] ACPI/APMT: use platform_device_set_fwnode()
      commit: 5ab289f5eabc
[2/2] ACPI/IORT: use platform_device_set_fwnode()
      commit: 67b1e7245bd6

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are in the driver-core-testing branch and will be promoted to
driver-core-next after validation.

