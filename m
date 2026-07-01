Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52CFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 20:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KDjDTATqNVEjy4/eLFLsbZrtthmvzujKNtPqmpMmWw8=; b=Mvq6H7vZYldUip3AXrSRmtz0K7
	xohpwvHEv1r3nJxiqX6gRscAegU6aAJJojwiGZt+CpNw5oW1dbScBCK4iRbqIt6jazwNSYicnoDRh
	WDmnSpqLc7aM2VZ7b131cntPHnd46XlmZgGJv6MT0R2pwizg0rTDLJ2KVyH5nhdLiOrqxm+Suhbiw
	XuzPlZGxkwhI/5kabMOt4B5orGshg4zplBxJi6ws1PmpFiDObmfOmsSeZOZNiCaJTeTiiLfPnxtkD
	WCnt7mXV5s6Obf/v4DhSkWNnm5uGOVfjAP0bthX2a+20qCihnhPk+n3A+TbYKLYUxmga+oDTIY54W
	ttdbp38Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1v3-000000030Fy-1KJq;
	Wed, 01 Jul 2026 20:52:29 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1v0-000000030ET-2uZv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 20:52:28 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4grBzB6Pfbz8v10;
	Wed, 01 Jul 2026 22:52:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782939142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KDjDTATqNVEjy4/eLFLsbZrtthmvzujKNtPqmpMmWw8=;
	b=llrXo7fJqzU25O+uRx7CnozwD4Mcym6LY6K5YXRFfFtVDwy0QlOiP0qKviM9Aj42qCw2BK
	BCwD5CwLgBLBu+d4dCL9QrXomsHp0agyWSyNtjaqgmu2+xplFT0k7H5x8if6hrJUnAiGVR
	MjyFDptl2S7hTBcEtK5rul5B9jnObE4b+vN37Sg56q1jGj8Ngw50RFb4z7srI2ApixgYne
	ySpBU593s5Ub3YBOQw5I/s1FIo0dAkSZGlDHHhiCK0CfLd5t5NtPdoMyWvmzaA5++zFe5r
	H906D5ZN5YVmMDLEYl9SfnZJjgcFJ9rCn8lYzhuXKVtxtVrnoxP/dpUgHtTp4Q==
Message-ID: <4ab6c86a-d809-47c3-bfb3-28da499a1457@mailbox.org>
Date: Wed, 1 Jul 2026 22:42:21 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/4] irqchip/gic-v3: Add Renesas R-Car Gen4 erratum
 workaround
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, linux-pci@vger.kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260618220427.14325-1-marek.vasut+renesas@mailbox.org>
 <20260618220427.14325-4-marek.vasut+renesas@mailbox.org>
 <87cxxkma5p.ffs@fw13> <d6fce333-4353-4e49-873f-eb3187a631e4@mailbox.org>
 <8633yfrrnc.wl-maz@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <8633yfrrnc.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: f3b0010bad76142726e
X-MBO-RS-META: ydwdkqwy6x9kt434cjesqq4qbeoj6erp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_135226_897057_BF90D1BA 
X-CRM114-Status: GOOD (  16.99  )
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

On 6/22/26 8:55 AM, Marc Zyngier wrote:

Hello Marc,

>> On 6/21/26 12:59 PM, Thomas Gleixner wrote:
>>> On Fri, Jun 19 2026 at 00:02, Marek Vasut wrote:
>>>> Renesas R-Car S4/V4H/V4M GIC600 integration has address width for AXI
>>>> or APB interface configured to 32 bit, it can therefore access only
>>>> the first 4 GiB of physical address space. This information comes from
>>>> R-Car V4H Interface Specification sheet, there is currently no technical
>>>> update number assigned to this limitation. Further input from hardware
>>>> engineer indicates that this limitation also applies to R-Car S4 and V4M.
>>>> Name the limitation GEN4GICITS1, and add a driver quirk to mitigate this
>>>> limitation.
>>>>
>>>> The quirk is keyed on the combination of the GIC implementation
>>>> and the platform identification in the device tree.
>>>>
>>>> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>
>>> This SOB chain is broken.
>>
>> Broken ? I don't understand , could you please elaborate ?
> 
> Either Shimoda-san is the sole author of the change and you are
> posting their work, then the first line of the patch should say:
> 
>   From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> 
> with your own SoB immediately following their SoB (see [1]).
> 
> Or this has been co-developed, and both of you should be credited as
> authors. then Shimoda-san's SoB should be preceded by their
> Co-developed-by: tag (see [2]).
> 
>   Co-developed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>   Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>   Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> This shows exactly who did what, who forwarded whose patch, and forms
> the base of the DCO which is documented at [3].
> 
> Thanks,
> 
> 	M.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n449
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n503
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n396
Thank you very much for the clarification!

