Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CEFCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 11:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnFF+a8BD8U8x2Sq8mYCuzT9ALRYLFSqBHsEqtzzUfY=; b=le+TMspRKuarvbXN7k4UDn5npd
	b52EcL08eg1ledqUA00elOyCuwAo93gTPAS3OZaJmoWoMqb2jgZQeumPVV1LI67WhO+pOtUo6vdNv
	FfK83RLGKY84Kuwc1WbvjoL66MPEx6LddGBcehU4eQu98wrSsG9MIUwt7VBQUR+cB1RRWG1xZjcNN
	2d3jwE0KuubQAk7gaABnam209zkTl3grBEoncCFFLx63sDsx32RiX4VTlQd41c7FRPm5up+IZUz4a
	NJIkMrdqE9qPQk1V/zNx30yUoVlBKFY+cq6ZDiqkyI7t7Rb1yTOK61K8AV7IAe1xEeQqJQvPOo8N9
	7PVRO8Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8GdZ-0000000D0z8-2hBl;
	Mon, 13 Oct 2025 11:22:45 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8GdW-0000000D0y4-3YM0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 11:22:44 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59DBMbP6809985;
	Mon, 13 Oct 2025 06:22:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760354557;
	bh=MnFF+a8BD8U8x2Sq8mYCuzT9ALRYLFSqBHsEqtzzUfY=;
	h=Subject:From:To:CC:Date:In-Reply-To:References;
	b=EFMaufMyJ/5V6nQXWS//kLmveHdQgtOzK2F7H4tvUBk10Xh11Bq5rolLcHpX2id9H
	 GY3f0cOwfCo1ajVRhOMMMAywpv/VUCEXQtu39UBTqmIEpCNlr2+T47KggPhL1ZTohm
	 zAMBVmfG1LS3DVDEsmXD7z3HuvVZwNVbeYooMeYQ=
Received: from DLEE201.ent.ti.com (dlee201.ent.ti.com [157.170.170.76])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59DBMbsQ2922316
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Oct 2025 06:22:37 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Oct
 2025 06:22:36 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 13 Oct 2025 06:22:36 -0500
Received: from [10.24.73.74] (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59DBMXxD1969614;
	Mon, 13 Oct 2025 06:22:33 -0500
Message-ID: <3c0f63162783f6eaa811901dbff9fbb4fe52c107.camel@ti.com>
Subject: Re: [RFC v1 2/2] PCI: j721e: Use inline reset GPIO assignment and
 drop local variable
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Anand Moon <linux.amoon@gmail.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        Lorenzo Pieralisi
	<lpieralisi@kernel.org>,
        Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=
	<kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        "open
 list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-omap@vger.kernel.org>,
        "open
 list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-pci@vger.kernel.org>,
        "moderated
 list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>
Date: Mon, 13 Oct 2025 16:52:38 +0530
In-Reply-To: <20251013101727.129260-3-linux.amoon@gmail.com>
References: <20251013101727.129260-1-linux.amoon@gmail.com>
	 <20251013101727.129260-3-linux.amoon@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_042242_950446_4A5E435B 
X-CRM114-Status: GOOD (  10.38  )
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

On Mon, 2025-10-13 at 15:47 +0530, Anand Moon wrote:
> Change removes the unnecessary local gpiod variable and assigns the resul=
t
> of the devm_gpiod_get_optional() call directly to pcie->reset_gpio.
> This makes the code more concise and readable without changing the
> behavior.
>=20
> Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

> ---
>  drivers/pci/controller/cadence/pci-j721e.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)

[TRIMMED]

I have also tested the series (despite my feedback on the first patch).
Logs:
https://gist.github.com/Siddharth-Vadapalli-at-TI/ca82a16e15a892b3349396be1=
7b37643

Please address the feedback on the first patch.

Regards,
Siddharth.

