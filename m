Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0828CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 13:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zlKLNJPOGiDKqWlVl/uUtpjI3Xr5vwkpin4+jwj51A4=; b=IU4Pkch3KVdQVbWe2sZjr/usil
	8Z8f2ZWPA0e0fSX6CExikyuVGnnIE1Dv76CRSdu0lA0peoSWm1LE88lE0NFgfKxNhf6F3xzwYS2HV
	Zvqh5wA/u4YwyQcvnV6OTh9yGTec1wezAYXMlWzgK4Nvf8g8WH6s9E2+X6siTxeqS+iW8G7Tvq1Jo
	vxSrrbhmHWFoBhpem6yppmZPOUq9IuE//gO0G4ClEqOjAX5Kxy4CunDP1Y9M8nlyMQBSSq2IEAcEM
	KZwli9qYUk1oBeVkPbqnIDBO/fx1j57hX2i5flCr24GBhI2/N4BZ1NAep1wmVGBikmLpJkF3w9PVo
	pZ1DC9yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiBO3-000000051Rr-361W;
	Fri, 10 Jul 2026 13:35:27 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiBO0-000000051RL-3Xw3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 13:35:26 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gxXrj5TZ7z8txZ;
	Fri, 10 Jul 2026 15:35:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783690517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zlKLNJPOGiDKqWlVl/uUtpjI3Xr5vwkpin4+jwj51A4=;
	b=FJJxmCIVt4hbz0GcuAzOD5mSpmcsjTnSJgrxCHghbGivf1Dkcd3M4z9rFhJWFg20UWKD39
	mArdJWRl/y32FYiRJQcatQdN091jZQoC7Paz6gweqie3AqfP8b6Hp4l78nu5krwcRynQwB
	4zegO5t8mrZbHwC4YIpuMZfrrw/tAOfbJFyWOa0af5cIGCXt3egqU7eCBQGOr70+rJa4hV
	gKVylEMRpUk3b6H63tA8q6QuhGvLnvHZIwWDCclCxm/A7KSmn7v7xf0jgjI4khnE+8O4Ew
	PauB/VmiEs60KqqKfk88beChhnqUwcN8Mq/q0Ry67f685oyQY4bl7WYxSDW+3Q==
Message-ID: <2cb03029-0957-4ed8-98bd-9b3e0e0bce2d@mailbox.org>
Date: Fri, 10 Jul 2026 15:35:10 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] PCI: rcar-gen4: Inline GIC_TRANSLATER offset macro
To: Marc Zyngier <maz@kernel.org>
Cc: linux-pci@vger.kernel.org, kernel test robot <lkp@intel.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260709201103.90162-1-marek.vasut+renesas@mailbox.org>
 <87qzlb5jsl.wl-maz@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <87qzlb5jsl.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 39334qfx7t74yz6t7hkn76hnui4r95h5
X-MBO-RS-ID: c43d4b05b532b168186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_063525_029383_2C9F6958 
X-CRM114-Status: GOOD (  19.49  )
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

On 7/10/26 10:30 AM, Marc Zyngier wrote:
> On Thu, 09 Jul 2026 21:10:03 +0100,
> Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
>>
>> Instead of pulling in the whole linux/irqchip/arm-gic-v3.h , copy the
>> one GITS_TRANSLATER register offset macro directly into the driver.
>> This repairs the ability to build the driver on non-ARM non-GIC targets
>> the way it was possible until now, which retains good build test coverage.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202607100310.iQw5m9Uo-lkp@intel.com/
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> ---
>> Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
>> Cc: Bjorn Helgaas <bhelgaas@google.com>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
>> Cc: Manivannan Sadhasivam <mani@kernel.org>
>> Cc: Marc Zyngier <maz@kernel.org>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-doc@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-pci@vger.kernel.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>> Note: The alternative I could think of would be ifdeffery which
>>        is not nice and thwarts the build coverage, or limit the
>>        driver to ARM/ARM64 in Kconfig which also thwarts the build
>>        coverage. I could also split off the register macros in
>>        linux/irqchip/arm-gic-v3.h into some separate header
>>        linux/irqchip/arm-gic-v3-regs.h and include that which
>>        might be OKish and avoids duplication. Thoughts ?
> 
> No, I'm not hacking something that is purely architecture specific for
> the purpose of a bizarre integration quirk that should be handled by
> the boot firmware, and not Linux.

The PCIe controller is fully controlled by Linux. I don't think this can 
be handled by the boot firmware. The GIC ITS TRANSLATER address could be 
derived from the DT compatible string of the PCIe controller (I had that 
implemented before), but that is the less generic option.

> Add whatever you want to the PCI glue code, limit this to arm64 (which
> is the only architecture this can ever be used on, and the build
> coverage argument really doesn't hold), but please leave the GIC code
> alone.
So in the end, it is either this patch or limit the build to arm/arm64 . 
At least this patch still allows building this driver with more 
compilers on the various build bots, so I would opt for this patch here.

Thank you for your help !

