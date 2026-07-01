Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8995FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 20:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tv5Thx4xib2D6u4nvbTd9PHuQp4UEDPoY3zy319g1pI=; b=YwfRFB0TQaF4BZoretbhnM3ah7
	FLtBLh4Sw42Bqb5m26fAZeiBPbRjIMfWeft51GO+VZyBtVQgItkw+m599gbeMpUjF3BOErxayvFAk
	ruPUKowy2yDXNIigK+f1TUKbz7cE263tGOzGoVL0dRp2x2KqcChEqNpm1DwfWnZKAWD50ABwS7are
	W1Jftcfgsc6JSxaPkuBcgu+TWXgJMjsWTcF8J5c/mfRwMLpflZiloV1zIgxk0lqdauU+9pxJk9Gx1
	ZrFqiu27rWq7SxLORM6K/RRC0Df6MuvVgxJQtlUbl3QUA5zjUPy51lgq+MWPLjOh4HSy4OwPZDIvW
	NAEK4iww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1v6-000000030Ha-1yHh;
	Wed, 01 Jul 2026 20:52:32 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1v3-000000030FY-2fnO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 20:52:30 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4grBzG4rRRz8tyR;
	Wed, 01 Jul 2026 22:52:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782939146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tv5Thx4xib2D6u4nvbTd9PHuQp4UEDPoY3zy319g1pI=;
	b=geH9T1arvT8RTmOWz5KdbwFviwOTdh/WRViFR5QKc+jSW/6YrpIe5oyhTCKkx7ZnOQ/JRf
	kzQ9iL8hAlzSCAxaireIkvfa1z5KIp8dTCEGaiGupDPsHH28HHi4+j7wPEdUzc2e4wUbz4
	E/fW0qP1Go3iej80kV3T+MRl0gsy9tFtA2nmKCLWynaVOfEMkS8CEDc2oDtG39Z6dsqQMb
	lcetn1jAsUslp16VJ/vVlELgT4i0CM74jgFPMUIxQEyGmjE70PSgJ1xm+2luUtIzd55VRD
	521wUN7Ebj1Waw8nwaTTQ61nRerjqWZvc8pYzvWPmmaPTXTmH1CF5bq8tM7Hfw==
Message-ID: <5d557687-8c7f-4d96-a9e5-699188faa0e7@mailbox.org>
Date: Wed, 1 Jul 2026 22:42:36 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/4] irqchip/gic-v3: Add Renesas R-Car Gen4 erratum
 workaround
To: Marc Zyngier <maz@kernel.org>
Cc: linux-pci@vger.kernel.org,
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
 <864iivsuaq.wl-maz@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <864iivsuaq.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 266789d046c87441d76
X-MBO-RS-META: d9yyryhzrw8zw46ps7fhxqzeyyscywhd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_135229_850907_AB076B39 
X-CRM114-Status: GOOD (  11.80  )
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

On 6/21/26 7:00 PM, Marc Zyngier wrote:

Hello Marc,

> On Thu, 18 Jun 2026 23:02:01 +0100,
> Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
>>
>> Renesas R-Car S4/V4H/V4M GIC600 integration has address width for AXI
>> or APB interface configured to 32 bit, it can therefore access only
>> the first 4 GiB of physical address space. This information comes from
>> R-Car V4H Interface Specification sheet, there is currently no technical
>> update number assigned to this limitation. Further input from hardware
>> engineer indicates that this limitation also applies to R-Car S4 and V4M.
>> Name the limitation GEN4GICITS1, and add a driver quirk to mitigate this
>> limitation.
>>
>> The quirk is keyed on the combination of the GIC implementation
>> and the platform identification in the device tree.
>>
>> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> With the SoB chain issue addressed:
> 
> Acked-by: Marc Zyngier <maz@kernel.org>
I hope this is now addressed in V3.

