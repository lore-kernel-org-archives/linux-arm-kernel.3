Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE024CF857B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 10:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DW9Tu141hYAgi7uXkPAdOBwpEa0ZYRizhqLUUtu9aUU=; b=uAsB04+0X41oSuvfMCq8PH6JT7
	XzUcB6t16d1bjy/1JffQx0xRAZzqo3uAEmOGkyHEXVCjb++ZkFZUeSCjdXtAbtdMFuzXLspoDKcYS
	zj/5LNHCHfl5DiSVbewTnZ6lyVO9A+nILgyBjJj02dyDPk0p7kmTQLxlm2FFtN047d3+BAkQZiNcv
	BtsbN4UGQ3goJ7IpuP69esH/59RdbRCWJzFQ7SeB1K+UxUKnLZm/fFyZdzwy5FAKptUGWLnDp8Lsj
	4z6l50pxYXeOeg1O/CZtnrrw42bAAAOjrnBIjYEzOwrKSjZSXu9nrcz+MWHC2H5lo7BxfhzRDFufM
	9M5lRyRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2FF-00000006XCn-2JdT;
	Thu, 20 Nov 2025 10:50:33 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2F8-00000006XBv-2M20;
	Thu, 20 Nov 2025 10:50:27 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763635821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DW9Tu141hYAgi7uXkPAdOBwpEa0ZYRizhqLUUtu9aUU=;
	b=HfoVFISpAFsVjd2CCyf/9VJzquqA/McJr2754cxjvaViQDQPZ4uWw67F10UXY7wePE1lmm
	kMHJHTvefzIPAZLE95maISfE0wnVcPYp9fnWHkyD7x7iX60taqIVQA2JZSiDCkGo8z9YWD
	SfO2X4K3muadBUUL4mubNu+isOZNvVugOzoSlsQGV/TPh5CEVFpgDoipypitq+JUTCV757
	uns9El+hygAD6b0SdK9M0ByLcrNwG9+38kGKyF4wu1otKZnbjcUCcRRKBlGJEjRimRFOoV
	H5xSezRvsDKDo43nCJm8QRtlLkSJ5BY7eAVB72GC6pJJINgJDG4hoi0u+3ozJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763635821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DW9Tu141hYAgi7uXkPAdOBwpEa0ZYRizhqLUUtu9aUU=;
	b=Kqap7FwcH4qCtJ5Ocmu+ArgFF0diHbiF4lrIGO3Z/hgFZpoIqeDqJctcrjJxD93OOaB0Uk
	33ZqcJoHDjzleXDA==
To: Neil Armstrong <neil.armstrong@linaro.org>, xianwei.zhao@amlogic.com,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 0/5] Add GPIO interrupt support for Amlogic S6 S7 and S7D
In-Reply-To: <d2b2807a-285a-40bb-8aa8-eacba97b1f14@linaro.org>
References: <20251105-irqchip-gpio-s6-s7-s7d-v1-0-b4d1fe4781c1@amlogic.com>
 <d2b2807a-285a-40bb-8aa8-eacba97b1f14@linaro.org>
Date: Thu, 20 Nov 2025 11:50:20 +0100
Message-ID: <877bvlkmfn.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_025026_765202_F0FA7183 
X-CRM114-Status: UNSURE (   9.48  )
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

On Thu, Nov 20 2025 at 08:54, Neil Armstrong wrote:

> Hi Thomas,
>
> On 11/5/25 10:45, Xianwei Zhao via B4 Relay wrote:
>> This patch adds GPIO interrupt support for Amlogic S6 S7 and S7D SoCs.
>> 
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>> Xianwei Zhao (5):
>>        dt-bindings: interrupt-controller: Add support for Amlogic S6 S7 and S7D SoCs
>>        irqchip: Add support for Amlogic S6 S7 and S7D SoCs
>>        arm64: dts: Add gpio_intc node for Amlogic S6 SoCs
>>        arm64: dts: Add gpio_intc node for Amlogic S7 SoCs
>>        arm64: dts: Add gpio_intc node for Amlogic S7D SoCs
>
> Coud you drop the DT changes from the tip irq/drivers tree ?

Done.

