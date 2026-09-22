Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113B7C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 21:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXYjPHazqBFP5oaNfc4ncajatoT1TniGOC1Liiyaw04=; b=sbePaa9c9aDRGdJpflyJ49sPHy
	TySaK9gdhUEwJmqAsmSduODqhXw3wfX5T8/f/8dAMawpmrtoeBxO1aOp4WU3ju0AgLTlLWsB1wiMw
	o/LrPYI3DtgjEnkeN8fepCJDBYjbMm9SDg2oH1mNl7855rD2vp7e8IPjg/+ZtHuOmicIxJ0zLLZ0F
	YuoGfuaV/5hRUp9YC6odFyUml9/sQPBURphg2qLGGykXYaF6CNrmiH5LwF8dHTs0n9muIzhydsjfr
	CQ3He6rKXr4ImcGiKujvQXM3FgJ6wKvTzuJqMDzhFNST1Pua55L5+yIlcHNWK3l7+80WVY/5PsDXS
	s0ggFXsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98Mb-00000006eJV-32bB;
	Tue, 22 Sep 2026 21:49:21 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98MZ-00000006eIp-2rKC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 21:49:21 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hqDJT08sCzKmt5;
	Tue, 22 Sep 2026 23:49:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1790113753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nXYjPHazqBFP5oaNfc4ncajatoT1TniGOC1Liiyaw04=;
	b=aRTeG9CByuPTJxLZzL1fbbYraCIE1LcqBuL7Wlp+4vOLaybAZZMQJR9WXZIaEiJWoBHLju
	t+s/gXXtMaXp42IL7l/PFu6qTVuRQgvpRIrFTFATUMQ1aekQkS3r1Zew25Iq8Q+a2xzD+E
	7GtZ2DK2YWh6e74h3uTsiuJiqmP3DLMYx/yhULcnrCMr8SxTocNnmJ4M/mX1ZXUgcMju5q
	sJ7jE1KbQ7qWt9LYtvSlGaxcO7T0cn+aWP4tLIYKJfeQct7aIziWk1AiypdfRSW4YetDql
	n17o40LfRw/o/2lAR84gyApkon30h4BDIbH/Ino4qMEIJ7haUxOe5OebUOwEWQ==
Message-ID: <caae0a0b-75e6-4905-8406-266f9e54b5f1@mailbox.org>
Date: Tue, 22 Sep 2026 23:49:08 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] PCI: iproc: Use __free(device_node) in
 iproc_pcie_msi_enable()
To: Fuad Tabba <fuad.tabba@linux.dev>, Manivannan Sadhasivam
 <mani@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: Rob Herring <robh@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>
References: <20260922210839.3765444-1-fuad.tabba@linux.dev>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260922210839.3765444-1-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: e2d277f414c5232cea0
X-MBO-RS-META: ywj9ws3sgoax3on8nhqsbsuyr6wwpk9s
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_144919_866556_6F252DFC 
X-CRM114-Status: UNSURE (   8.56  )
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

On 9/22/26 11:08 PM, Fuad Tabba wrote:
> Declare msi_node with __free(device_node) and drop the out_put_node
> label and its goto: the scoped cleanup puts the MSI controller node on
> every return, as the label did.
> 
> No functional change intended.
> 
> Suggested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Link: https://lore.kernel.org/linux-pci/61488ddc-b346-4ba3-b32a-e972a3bd75a4@mailbox.org/
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>   drivers/pci/controller/pcie-iproc.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
This is nice.

Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thank you.

