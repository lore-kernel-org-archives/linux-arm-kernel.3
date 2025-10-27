Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EE2CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 13:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F88Mqi1IYE4ZB8FjWzZRJOZCliQhSjDt6+Vbvnc0pWc=; b=QWr2zVdgks+qlNDwBZBePIzYT0
	JsRsUbcHhthlfjhbN0zl1Ahvx/OP6700yRIQSUV2Kd7Cn1QMf7gsDhItLqZNs25SvIe8AOCdgPqlY
	mf8sl231Q/xz3cxZy3rf1IQVVIQeE5Dr0jR5C08uW0ntsdfa9DksoYF6QGD55fF1PS63quPSRrZbK
	qyVzjyMgKRIL4SVc10ewtii2wRaBtcSxzl/90y24eocNl2uD7cCvgRfVccRrkEd6KOdXE4RMYZRDd
	H28j2etyLoQTOwWaUDQCahZb2z9VusIT3ERqsTExze/3Vkq65kF/xLL/UKVOn3Vn7NYfTeDfjwPcI
	7STpNcow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNRh-0000000E4oU-0RT5;
	Mon, 27 Oct 2025 13:39:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNRg-0000000E4oH-0vJB
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Oct 2025 13:39:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=F88Mqi1IYE4ZB8FjWzZRJOZCliQhSjDt6+Vbvnc0pWc=; b=feDn3GzsR3FD67qtvGVW/myTN/
	BKQ+0dqw/O7GqW1sWxIMJkv97sDtsAtd/D8xCGIdPBKu/He9J1kL8UHHVAIrgIvQqla8vx8X4Q9Fe
	DIXrVvmhfeXLANZ00/b7Tu70KjN1wR3MFGe7fpHSkm5avfNC780EKMsD09rPU07PlqSGOwNKnRP0D
	hpPQ2DH1YBViSjSezqyX+Wm3vadE1XpRWatWN2RJ4EgaBD7MnUhikZ/VYnWNPxigZROFeEKzy5TEv
	oNT5h9hOCfDxaBBSE/HKUaoN4RZp0ZVel36QEJl7yA03JvxIHt8wQiHR+z4lpipAxNyH7mDM5mN0e
	DO35VZiA==;
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMZs-00000002Ck1-46zG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 12:44:03 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59RDdGXM1290306;
	Mon, 27 Oct 2025 08:39:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761572356;
	bh=F88Mqi1IYE4ZB8FjWzZRJOZCliQhSjDt6+Vbvnc0pWc=;
	h=Subject:From:To:CC:Date:In-Reply-To:References;
	b=T/jNZQi3mz7QMv2F/V60x7xSZb6IaRnpxcYW0MkCdJxOIAdTGJdl3aAcdHvAXm7XF
	 QjeJAhFl+1LoJ7cz/bCmKb/diHLTLEL+XIDC3cD/u6YHfRkktNa8CnhSzP2dpwss/B
	 3gN8CwXFE8P5s/7ULIsvUF/1ry5D7F5LY4QvauKk=
Received: from DFLE200.ent.ti.com (dfle200.ent.ti.com [10.64.6.58])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59RDdG3K1265503
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Oct 2025 08:39:16 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Oct
 2025 08:39:16 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 27 Oct 2025 08:39:16 -0500
Received: from [10.24.73.74] (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59RDdC6R727568;
	Mon, 27 Oct 2025 08:39:13 -0500
Message-ID: <c2a22a2b7fa709349c509b685f7c050957d3b5d3.camel@ti.com>
Subject: Re: [PATCH v3 1/2] PCI: j721e: Use devm_clk_get_optional_enabled()
 to get the clock
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
        Markus Elfring
	<Markus.Elfring@web.de>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Siddharth
 Vadapalli <s-vadapalli@ti.com>
Date: Mon, 27 Oct 2025 19:09:23 +0530
In-Reply-To: <20251027090310.38999-2-linux.amoon@gmail.com>
References: <20251027090310.38999-1-linux.amoon@gmail.com>
	 <20251027090310.38999-2-linux.amoon@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_124401_354277_FB760FBA 
X-CRM114-Status: GOOD (  11.46  )
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

On Mon, 2025-10-27 at 14:33 +0530, Anand Moon wrote:
> Use devm_clk_get_optional_enabled() helper instead of calling
> devm_clk_get_optional() and then clk_prepare_enable(). It simplifies
> the clk_prepare_enable() and clk_disable_unprepare() with proper error
> handling and makes the code more compact.
> The result of devm_clk_get_optional_enabled() is now assigned directly
> to pcie->refclk. This removes a superfluous local clk variable,
> improving code readability and compactness. The functionality
> remains unchanged, but the code is now more streamlined.
>=20
> Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v3: Clock needs to be disabled on Suspend and enabled on Resume.

Thank you for updating the patch.

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

