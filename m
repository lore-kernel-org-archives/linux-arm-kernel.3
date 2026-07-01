Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD39C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 20:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ayUOZ2QprH56XGGDon1vuJ84zCr1jeUOuFnvGJtUCCQ=; b=ZKkd8rOsYzl9ttFxLFLJ2g1XYq
	dA0pUA/Juk2VtE9wEfj55CYBv7KmEqoFeupqrAZ1SQn8Bsh2lt3fo3IHmVTfxJP+G4QGTSJXeZU/U
	iUSAvRRgAJVgAM5uFPiN7FbYOSGjhPzBiV73GBxyNZmPesKG8oEN+ADYlPJL0y+vIgnePHwc7rfK6
	F3zQbCK2gVw8cBUC70kGm7dubBt0CFe9Z/GW3q7eMQBAbptrVBXYRK1e6EpGTt7KQEKbOaZbL135L
	3HaXyGyWd6/3Uu3YAUn6E1K0T7JhRn1MhyKmKwHZdnDWMC6lzauzgu4Yx3TW+HdZZ5snMjPFULyZX
	ASAKZpCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1v0-000000030EZ-0OSW;
	Wed, 01 Jul 2026 20:52:26 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1uy-000000030Dy-116l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 20:52:25 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4grBz720vsz8v1C;
	Wed, 01 Jul 2026 22:52:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782939139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ayUOZ2QprH56XGGDon1vuJ84zCr1jeUOuFnvGJtUCCQ=;
	b=fAns894L4EkNHKwaThlEnJ7HXRkYjkE8PqnKTZrmXiTHFLDhD2sADLXT0iSXxl7Y3Z0xSZ
	ihYCfgybwOKGDyjB3idHE8jOuuBwR4K+8as2T4TIEc4sIYBRSRGnoDcynjTL+Qiijlk1yb
	sQPPTyv0Bm/45WS+qPZbM5by4NYgn03uxBkYXKaiy2YFChhrlLYn1g4fvsQ805iH37UYFE
	IO3iRmJATNHhhvii1FaZ5kO3XHQQ8N8w/k0ri3+b8gLfaro6m6uzqZkJg2MPZzEfvboVFN
	IMnUNDwsbLuidVbbxA8GyeaGQ/eDO/WsAav7Ih6JIABYgPT+/nOmXAR6aWF77A==
Message-ID: <9b5efef3-421b-4fce-b299-f3c818cab8b6@mailbox.org>
Date: Wed, 1 Jul 2026 22:40:42 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/4] PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not
 used
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-pci@vger.kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260618220427.14325-1-marek.vasut+renesas@mailbox.org>
 <20260618220427.14325-2-marek.vasut+renesas@mailbox.org>
 <ck6i6tdw4ngde6vmtamfrvryg47ixycpmd74ny5hpzury5ekpr@ibgrw7o6uewj>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <ck6i6tdw4ngde6vmtamfrvryg47ixycpmd74ny5hpzury5ekpr@ibgrw7o6uewj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: jz9cyeakpmxsygjbxd35i5fcbz36dybz
X-MBO-RS-ID: ff32e8b634b5259b038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_135224_455971_5FEBD91A 
X-CRM114-Status: GOOD (  10.64  )
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

On 6/30/26 6:22 PM, Manivannan Sadhasivam wrote:

Hello Manivannan,

> On Fri, Jun 19, 2026 at 12:01:59AM +0200, Marek Vasut wrote:
>> In case MSI are enabled, but DWC built-in iMSI-RX is not in use, the
>> MSI are handled via GIC ITS. Configure all controller MSI registers
>> fully.
>>
>> Set or clear MSI capability register MSICAP0 MSI enable MSIE bit and
>> PCIe Interrupt Status 0 Enable register PCIEINTSTS0EN MSI interrupt
>> enable MSI_CTRL_INT bit according to MSI enable state, set both bits
>> if MSI are enabled, clear both bits if MSI are disabled.
>>
>> If MSI are disabled, or MSI are enabled and iMSI-RX is used, then
>> deconfigure AXIINTCADDR and AXIINTCCONT to 0, which disables any
>> pass through of MSI TLPs onto the AXI bus and then further into
>> GIC ITS translation registers.
>>
>> If MSI are enabled and iMSI-RX is not used, the configure AXIINTCADDR
>> with target address of GIC ITS translation registers, and configure
>> AXIINTCCONT to enable MSI TLP pass through onto AXI bus and into the
>> GIC ITS. This specific configuration allows handling of MSI via the
>> GIC ITS instead of integrated iMSI-RX.
>>
>> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Same as patch 3, SoB chain is broken. Rest LGTM!
I hope this is now addressed in V3.

