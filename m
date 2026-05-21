Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D74CCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 14:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3uHkCr3Czag36uOPZx+WfiLBDM/EZRglKu7YFz6fG0k=; b=QNO+9CVHvKynzUWIrUVOgxjFI6
	NSFroe0y6XtZQbeUPNYOfVZj+1AvxGHq6E6rWLmwjXhOHnnpZLJDW2XUvl67qiSCJww90wLVsu2uX
	hXdgIpN3sQoXNhEhOMBh5pwEP86RbWW5j+B95Wooo0mTJFwyntN81Yt2if5yKj/Cm/UpEvVmTHlBe
	vEf6uTRE5xegCBXurKdhEcv3RzPtugqDFLpSIiWL8JDuapR2or4cyY351EM2nx7uQ/TO2G0BzNSp4
	+5HxnOjmnoxPnyp5uPoOk7kpnS1QD/e4Zl1n8TIcqaTzHddfHyAUAyl6RpJE/oeVOdQHuNMs1/Oo9
	Jd6SgsiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ48u-000000080j3-1eFX;
	Thu, 21 May 2026 14:12:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ48r-000000080i9-22GW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 14:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779372773; x=1810908773;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3uHkCr3Czag36uOPZx+WfiLBDM/EZRglKu7YFz6fG0k=;
  b=rSjb9hCNJ3wGPaCWykIcVEz3+Yln88S/2zDMRObPMqP/qXKe9vaKp4YQ
   /8yhB9Nv6t7R0NXMyNATqdqI5auF8O2v5HAqnXF1IaNfHx0dJ3MeMSYyk
   aAYVJtypv7opPkkjL0157Ot74Np5LHtvlY9VMTbPnTGuUVBR/EHY1iUMP
   3DxnGqGufZagw7toPM5I6axXS0yXYtnAn5mcYEsIRIrlMFUnAoh829hGO
   CX1G679gZYRc01N6MoMVhsE8bzVfgh5HfT2TfFbB/wgQaCvVSXU5Y8c1R
   u39d97UuTaQE5iancj//JllB3FrdHXLWkOGrntmjJwA2c6hYU8oUAlq7C
   A==;
X-CSE-ConnectionGUID: 3cMiK0fJTeCaxLknjkz8Lw==
X-CSE-MsgGUID: fp/hYsMdTyu9+GLOBX8BnA==
X-IronPort-AV: E=Sophos;i="6.23,246,1770620400"; 
   d="scan'208";a="289245092"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 May 2026 07:12:52 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 21 May 2026 07:12:50 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 21 May 2026 07:12:47 -0700
Date: Thu, 21 May 2026 16:12:47 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Steen Hegelund
	<steen.hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Alexei
 Starovoitov" <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
	"Jesper Dangaard Brouer" <hawk@kernel.org>, John Fastabend
	<john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, Herve
 Codina <herve.codina@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Mohsin Bashir
	<mohsin.bashr@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<bpf@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH net-next v5 00/13] net: lan966x: add support for PCIe FDMA
Message-ID: <20260521141247.h2ekfhhzblopjm6s@DEN-DL-M70577.microsemi.net>
References: <20260520-lan966x-pci-fdma-v5-0-ca56197ae05b@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260520-lan966x-pci-fdma-v5-0-ca56197ae05b@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_071253_794892_EAA70A4D 
X-CRM114-Status: GOOD (  11.56  )
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

> This series adds FDMA (Frame DMA) support for the PCIe path. When
> operating as a PCIe endpoint, the internal FDMA engine on lan966x cannot
> directly access host memory, so DMA buffers are allocated as contiguous
> coherent memory and mapped through the PCIe Address Translation Unit
> (ATU). The ATU provides outbound windows that translate internal FDMA
> addresses to PCIe bus addresses, allowing the FDMA engine to read and
> write host memory. Because the ATU requires contiguous address regions,
> page_pool and normal per-page DMA mappings cannot be used. Instead,
> frames are transferred using memcpy between the ATU-mapped buffers and
> the network stack. With this, throughput increases from ~33 Mbps to
> ~620 Mbps for default MTU.

I went through the sashiko review for v5 (gemini and nipa). AFAICT no new
series-level issues were raised — the only Critical (XDP features exposed before
the xdp_setup() PCIe short-circuit lands) is a per-patch bisectability concern
that sashiko itself flags as "likely fixed by the subsequent patch", and indeed
patch [11/13] adds the guard. The NAPI bailout issue Paolo raised on v4 is
fixed in this version and not reflagged.

