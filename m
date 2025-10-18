Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D009BCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 08:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+w9ozdXv+jtOTpdMh8kVqGtWeZqhONyyLmPuIecXPU=; b=eav+z+c8l+vFTroD1uMNywHpT/
	l/SMYd20TTDuYTWiEZsyOA8CyO3yxveLzgP0iIh+vrScbLq1Enp4uviEuvhzogKGgl6wbnKHdyItF
	CD+//8DTYV+2xEOKP/N67rwPj1GFnxYdElNKthkY87SS9kjzBy2MmoK4rCXJpNO0ojWcWDyvaREPt
	CSh/juFIevNDZWDShVgHhc9bMYiqNrqWwJZRYLV7ScvVvQDcLUdehrwyjD4fUVuujCq/j6OQeKr49
	nMar0krgluEyyHEaWV6EZPqNqxOx5Ns0ezTlft4ssBsRgMIYurRhBJyKD5glwPf/ezKJOF6jWOvIc
	XtrNIQEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA2je-00000009hvF-14Sg;
	Sat, 18 Oct 2025 08:56:22 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA2jb-00000009huu-0v9f
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 08:56:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1760777775; x=1761382575; i=markus.elfring@web.de;
	bh=g+w9ozdXv+jtOTpdMh8kVqGtWeZqhONyyLmPuIecXPU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=NtRO03gNfPmsGg4wcK5WJKEyO1G2I55f2AUrwE7r0uQXTk9Kh1KIFCnAaavIkovR
	 2rrgRHePQS/oU2H8KERSSx3zNf+cwVA8eDndFKKW9V90FM5dQOG2qU5HGUUZMY+2B
	 6sn80wnKlCZ+CGYRJzgRfxJa97ewhKeM9bWfoiB9fQescm9yi8mHc1z3zhfWsu502
	 kxmhDCLlctrN3pFalUfOo2T93RyxfCGkUXlhGOxRXQT/ykci4ECX4xzfb4Ml+2Cxd
	 zyBghDRZH9n8O9/JtGXnK0/6uaZUYBtMNgEw7sA4XxXQNZYVnknzLDKD5qc9I3ict
	 n6XQwyjkzdKhf28bkg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.233]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MqZQY-1uNnkF2M5o-00fwg6; Sat, 18
 Oct 2025 10:56:15 +0200
Message-ID: <a2cefc72-de44-4a23-92d2-44b58c8c13fe@web.de>
Date: Sat, 18 Oct 2025 10:56:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Anand Moon <linux.amoon@gmail.com>, linux-pci@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <20251014113234.44418-2-linux.amoon@gmail.com>
Subject: Re: [PATCH 1/3] PCI: j721e: Propagate dev_err_probe return value
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251014113234.44418-2-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:uLW6/xJ1TTtvUc8EYspA3MB+3V7+4EYB+3Zi3k5QVAkrTbegG4M
 +tswJfsVXQaOUo/baaQNzysjX+xXLpdpP1zYZVJ77FpTnNdfvl2UpQhrBPKq6dOtl0DWL5p
 nQOrlXQq6hE4qMw22/g45crCXnxMrK9/rhyoEDahKFj02fQHZTmoWCVG8ZkG0TBXv3yZU0B
 jl7WqBjpADCvMRyCAtJPQ==
UI-OutboundReport: notjunk:1;M01:P0:lX49hhShdHA=;t2gNsOh/88RFdmRxmQBMUsfwTyD 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 eMYKlJ0TKgcXeus+7eCRpiKbk8eozOA7jXk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_015619_549117_1FB55EBE 
X-CRM114-Status: UNSURE (   7.14  )
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

> Ensure that the return value from dev_err_probe() is consistently assigned
> back to ret in all error paths within j721e_pcie_probe(). This ensures
> the original error code are propagation for debugging.

I find the change description improvable.


I propose to take another source code transformation approach better into account.
https://elixir.bootlin.com/linux/v6.17.1/source/drivers/base/core.c#L5031-L5075

Example:
https://elixir.bootlin.com/linux/v6.17.1/source/drivers/pci/controller/cadence/pci-j721e.c#L444-L636

	ret = dev_err_probe(dev, cdns_pcie_init_phy(dev, cdns_pcie), "Failed to init phy\n");
	if (ret)
		goto err_get_sync;


How do you think about to achieve such a source code variant also with the help of
the semantic patch language (Coccinelle software)?

Regards,
Markus

