Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3AFD2629E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 20:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YqoCEoGScXb2qskUTOfF9b2CQAOOiVd4gaLNwGWvgJY=; b=rO7EIBOesrnqaVzkuGymxpqe9h
	4Gd3MmXfH7gQ1M8jWZS1hgIRO/fzwloNgNPwOH2nyb2LKbduzdqTDFQMBucK+gtaV6VRSUBkj85nG
	5NyCHKCHvskiIFBzrT+2ZoKyErat4zKoP9YxKVsJX6IRTb5qKcNKX2Vft1nTD5j5Xkhyeyns/i96f
	FvzLrII+6R4gDsHsK4AzPULJq8dO/Q1+25Ca+/mGIb8boAXTBOAvWqtuy1ETa68FlSDQJMoNQJbm7
	xZk9CtJj2CVbyMc+at3tcznrm6h0nWUnzqoEMLK/eOWhzy6jeSneRgSb/NROA19ea13bOpFrksl+o
	LVHHLKVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viIXj-00000004S8C-20BU;
	Tue, 20 Jan 2026 20:41:39 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viIXh-00000004S7o-2O6k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 20:41:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=YqoCEoGScXb2qskUTOfF9b2CQAOOiVd4gaLNwGWvgJY=; b=hB
	kg/u0dhM/724wh3XOQtS8EBwpbdjgjLsydQVhl9LgXH+98jKP+CDn45O3PMMCyGTsyOI69ZENlcdp
	ns/C4Z7Yt9zwqP37Ae7MCfd/y/lgembYDR04JGZepifzETU1oJ0jZufh46MPqbE7nh1pl56IOItIk
	OkdN5BEcG6RJygI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1viIXX-003ikT-7c; Tue, 20 Jan 2026 21:41:27 +0100
Date: Tue, 20 Jan 2026 21:41:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Mark Brown <broonie@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] spi: xilinx: use device property accessors.
Message-ID: <d5909def-1ce8-409e-a5cd-2405da89e5e2@lunn.ch>
References: <b9ad8ab8-7985-4c89-a82b-c7f31d32c167@sirena.org.uk>
 <a6d57890-89c1-445e-836c-d8239d20c621@amd.com>
 <b03307f7-93f6-4680-9241-cf28b5456fd0@sirena.org.uk>
 <a3fcef3a-d1e9-4b46-b114-3a82575e052e@amd.com>
 <980ad372-a2c7-417c-91f9-4958d3d1aaca@sirena.org.uk>
 <4831B269-DFC1-40E0-96B7-67981AC72562@nexthop.ai>
 <6e06696e-09a4-46e0-98fa-252690b888e0@sirena.org.uk>
 <BF71A04E-7FFB-42D1-8C8D-6FD13415EED5@nexthop.ai>
 <c3fc04a4-4b09-4c6a-a0f1-e5aa92a22976@sirena.org.uk>
 <80A8F67E-7A01-4F9F-9D84-29722678A2CE@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80A8F67E-7A01-4F9F-9D84-29722678A2CE@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_124137_608470_6929AA0A 
X-CRM114-Status: GOOD (  14.37  )
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

> We could, but we don’t own the Xilinx IP blocks. Are we not justified in using PRP0001
> hack until the driver owner adds the HIDs? Wasn’t PRP0001 created as an escape hatch for
> these kind of scenarios?

I suspect your wording is wrong here. You probably have a license for
the Xilinx IP blocks, you are using in your synthesising for use in
your FPGA.

That i think you are trying to say is that you don't own the software
driver for the Xilinx IP blocks? But that should not matter. The Linux
community Maintains these drivers, and can make modifications to them.
You as part of this community can propose a patch which adds the
needed IDs to the driver.

The "escape hatch" is generally used when there is a mature DT
binding, but nothing for ACPI. Linux has a mature and complex set of
DT bindings around network device sub-components, where Linux drivers
all the sub-components. ACPI has nothing in this area, because network
devices used in the ACPI world tend to use firmware, not Linux to
drive the hardware. In such a case, using the escape hatch makes
sense. However, I2C, SPI, etc all have well established ACPI bindings
and are part of the basic ACPI standard. It makes no sense to use the
"escape hatch" hatch for such devices. Please follow the ACPI
standard.

       Andrew

