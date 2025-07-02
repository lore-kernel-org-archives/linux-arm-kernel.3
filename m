Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28858C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 10:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2YEzbtJvwijZ2p+S0uXHj/8W9vMDLgGXxAH7Q6EK2fs=; b=dSLANFCLhbL6AsWscY1bWweHeI
	5UcQrmPaFtxKJxgCbMQFKx/Dxys/C6FR4XLiD04JZ+dn5OSxfr2TQCAPo4FNRYkUXn39XiV3AjRnD
	h3DWwpr9tNttPwnpSBnT3ufdYUJ/CMgpHq6ahjhajs3zsqb6wktgImj72OEw2pZodbZOFNGB/Jjgy
	2kBNQTJiX5ozZ3zL+2uwb4BBrSGCUcJwG8NrA2+M9XPgsUB6SCD9IRpmJ25hnAk2qrTVH4sTg4P/v
	8mjNc8/rVOKLm/fd1Y+g1BVyHXQ0jt+HFynQGTnAFZ4qnomM6Q+wvkArOY3LlutaNLOyWSd/Thlu5
	NCMxzYPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWv2g-000000080K3-4Bjh;
	Wed, 02 Jul 2025 10:50:19 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWu8X-00000007qsp-14qL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 09:52:19 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E4ED414002F1;
	Wed,  2 Jul 2025 05:52:13 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 02 Jul 2025 05:52:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751449933;
	 x=1751536333; bh=2YEzbtJvwijZ2p+S0uXHj/8W9vMDLgGXxAH7Q6EK2fs=; b=
	JZ6i3CMoiycU945nJIMw1Bic84YQqTlMRdq6VsJcOlKh9BdkhXvhK0GuNI5yVlR9
	P1yY0zfmTJwtbCS508MJbsJ4HokVZ40G72sTGuEhLCIe6I1DDJPPjwX9pOj/b2kY
	I47EG0Qs5iuhGDQl5ZvfhZLSDElBbKM49HO85f21Dc1qzBZBT9OjTIXEtbQZm1ee
	PSlnPCuHq4w7nGLz5gUNBTiow3llHeEltPYVg7VGK7f6xwDPL1/60ZyBI53/7QjI
	iYjGRUEuZEuJ35e5SNG/qmqg/gx55y7l0HqmpvHURbhw/AxxyHAsDTMU/5xeroRa
	Nptbe7HLRBqJLHWwW2i2og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751449933; x=
	1751536333; bh=2YEzbtJvwijZ2p+S0uXHj/8W9vMDLgGXxAH7Q6EK2fs=; b=X
	ey2+BFylnofvC6zhDGuLlegKjp+WYQFUJNZfii2JMYaMGzuzQav/TVduoc1Rk85g
	vQ6ZgxUTnMAmfT+mvyZRomnNHW5clmzy+gZ/EchGf683imOExnIlnhRk1/0mNKPn
	cs/rWebCYrJ6qcMj5qy0uR3eEWHVO1X3yEBPbtw9QPw6FET4yQyuPahKU8FE+fFw
	BBTu807cu4R1CXQgyOdSFPwCyRm6U9/x+y6LCqRAsuFiF+DZn8gQeVKDc4RCY7X0
	CVwSIeXdTD/GUuShvKGH1AaxkmWNmRl6YzBl2rJkhIWW0yw4oTiuUczb+cOzuMtp
	LBXy0m3iurzh03fDRzFUw==
X-ME-Sender: <xms:SwFlaMYwZXrcrY5mAS1VReAwIEJMRsniXtJX6lE9I5i_hjK3DoftFg>
    <xme:SwFlaHbEZfmXOnjWWVsQ21SChuUd6FYpi1kywkm4iiDZoS8Hp_lipsDfwQC1t0apd
    Puf8knDxQi_x2PGkHs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddujedtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfuuh
    hsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpefoggffhffvvefkjghfufgtgfes
    thejredtredttdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnug
    esrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpefgtdegieeuudfgudfhjeelhfdu
    vddtfefgheehleettedvieekveevuddtkeetvdenucffohhmrghinhepghhoohhglhgvrd
    gtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    rghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudegpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehgohhrughonhdrghgvsegsshhtrdgrihdprhgtphhtthho
    pegsshhtqdhuphhsthhrvggrmhessghsthgrihdrthhophdprhgtphhtthhopegrnhhgvg
    hlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllhgrsghorhgrrdgtohhm
    pdhrtghpthhtohepsggvnhdrtghhuhgrnhhgsehgvghnvghshihslhhoghhitgdrtghomh
    drthifpdhrtghpthhtohepvhhitghtohhrrdhshhhihhesghgvnhgvshihshhlohhgihgt
    rdgtohhmrdhtfidprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrh
    drsggvpdhrtghpthhtohepphgsrhhosghinhhsohhnsehgmhgrihhlrdgtohhmpdhrtghp
    thhtohepshhhrghntghhuhhnuddvudeksehgmhgrihhlrdgtohhmpdhrtghpthhtoheprg
    gurhhirghnrdhhuhhnthgvrhesihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:SwFlaG8C_wY40GX8OzkP4VR2-3tzar6bPRPWwnTPMdMom1X9UfUeAg>
    <xmx:SwFlaGov-9tjbNIgKuBTKCvqCnT4MDLD-_jcNVq5RGuB8hDLI6moTA>
    <xmx:SwFlaHowiDQQ84mJ1QEAUxcyvQ4ChT0sSJMS3giqhvV5BRBXM-EdFQ>
    <xmx:SwFlaETc6LaWbnPOZwJOHfvTLQsr4ZyJ9K8GPv6pXPPVtt3kdmBhcQ>
    <xmx:TQFlaF5Ykdng2vdIs4q3sObLSgAcZbki-WT22-T_9yb2L68PwE9lUXMe>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B24C3700065; Wed,  2 Jul 2025 05:52:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Tedb66c89affcaf60
Date: Wed, 02 Jul 2025 11:51:40 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "yangzh0906@thundersoft.com" <yangzh0906@thundersoft.com>,
 "Adrian Hunter" <adrian.hunter@intel.com>,
 "Ulf Hansson" <ulf.hansson@linaro.org>, "gordon.ge" <gordon.ge@bst.ai>
Cc: bst-upstream <bst-upstream@bstai.top>,
 "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Victor Shih" <victor.shih@genesyslogic.com.tw>,
 "Shan-Chun Hung" <shanchun1218@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Peter Robinson" <pbrobinson@gmail.com>,
 "Ben Chuang" <ben.chuang@genesyslogic.com.tw>
Message-Id: <5408ab19-3313-494f-a091-46d5ee58b65c@app.fastmail.com>
In-Reply-To: <202507021657587315993@thundersoft.com>
References: <20250528085453.481320-1-yangzh0906@thundersoft.com>
 <87619781-629b-4393-8c14-b34483a7c734@intel.com>
 <202506271822530452465@thundersoft.com>
 <b6bf0b53-8812-4099-b5d3-39e7fd264777@intel.com>
 <5c0909b4-f3f6-401d-9a17-8560c5a1d7c0@app.fastmail.com>
 <202507021657587315993@thundersoft.com>
Subject: Re: [PATCH v1 5/9] mmc: sdhci: add Black Sesame Technologies BST C1200
 controller driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_025217_670005_BE372EEB 
X-CRM114-Status: GOOD (  27.15  )
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

On Wed, Jul 2, 2025, at 10:57, yangzh0906@thundersoft.com wrote:
>>On Fri, Jun 27, 2025, at 15:19, Adrian Hunter wrote:
>>> On 27/06/2025 13:22, yangzh0906@thundersoft.com wrote:
>> 
>>I would not expect an standard SDHCI to be broken like this any more,
>>and if it is, I think the SDHCI_QUIRK2_BROKEN_64_BIT_DMA quirk is
>>more appropriate than overriding the dma_set_mask() operation.
>
> I add SDHCI_QUIRK2_BROKEN_64_BIT_DMA in quirks2
>  static const struct sdhci_pltfm_data sdhci_dwcmshc_pdata = {
> .ops = &sdhci_dwcmshc_ops,
> .quirks = SDHCI_QUIRK_DELAY_AFTER_POWER |
>   SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN |
>   SDHCI_QUIRK_INVERTED_WRITE_PROTECT,
> .quirks2 = SDHCI_QUIRK2_BROKEN_64_BIT_DMA |
>    SDHCI_QUIRK2_BROKEN_DDR50 |
>    SDHCI_QUIRK2_TUNING_WORK_AROUND |
>    SDHCI_QUIRK2_ACMD23_BROKEN,
> };

>>What sometimes happens though is that the SoC integration itself is
>>broken, and a 64-bit capable DMA master like SDHCI is connected
>>to a 32-bit bus. In this case the DMA limitation should be
>>described in the device tree, using the "dma-ranges" property
>>of the broken bus node. The SDHCI code then still sets the correct
>>64-bit DMA mask according for the device, but the dma_map_single()
>>still uses an swiotlb bounce buffer or the IOMMU to work around
>>the bus restriction.
>
> add the dma-ranges in dts node as below
> mmc0: mmc@22200000 {
> compatible = "bst,c1200-dwcmshc-sdhci";
> reg = <0x0 0x22200000 0x0 0x1000>,
>       <0x0 0x23006000 0x0 0x1000>;
> interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
> clocks = <&clk_mmc>;
> clock-names = "core";
> max-frequency = <200000000>;
> bus-width = <8>;
> non-removable;
> dma-coherent;
> dma-ranges = <0x0 0x0 0x0 0x0 0x1 0x0>;
> };

The dma-ranges property makes no sense as part of the device.
It describes how DMA addresses are translated by a bus, so
it has to be part of the parent node.

As I tried to explain, you should only need to either set
the SDHCI device to 'SDHCI_QUIRK2_BROKEN_64_BIT_DMA' /or/
describe the bus translation, but not both.

Try to find out what the limitation is. If you have a datasheet
for the chip, it should either describe an erratum if the
sdhci device is known to be defective, or list the address
width of the internal link.

The 'dma-coherent' flag in the bst,c1200-dwcmshc-sdhci node is
suspicious as well: unless all DMA masters on this SoC are
cache-coherent, the mmc host is likely not the first thing
that the hardware designers used a coherent port for.

If you bounce all the transfers through an SRAM, it probably
still works correctly regardless of the dma-coherent flag,
but if you manage to configure ZONE_DMA32 RAM for SWIOTLB,
then the 'dma-coherent' flag must only be if the DMA master
is actually coherent with the CPU caches.

>>>>  To resolve this hardware limitation, we implement a bounce buffer allocated via >> dma_alloc_coherent() to satisfy DMA addressing constraints.
>>>
>>> The bounce buffer should not be needed to satisfy DMA addressing
>>> constraints.  It is used when SDHCI ADMA (scatter/gather) is broken.
>> 
>>I wonder if the actual problem here is not the addressing limit
>>but instead the coherency protocol. If the DMA master is cache
>>coherent but listed as non-coherent in DT, or vice versa, there will
>>be data corruption for all addresses, and using a dma_alloc_coherent()
>>bounce buffer may hide this.
>
> Finally, the kernel will raise swiotlb_map error. 
> I put the corresponding kernel log and driver files into it, 
> https://drive.google.com/file/d/10HQE6lr3W-XyqoI7OUBjQzJxwPCaEkpz/view?usp=sharing, 
> https://drive.google.com/file/d/1F8Hn2a7kPjZfSWiX525iSk634UHMo0Ph/view?usp=sharing

I see that there is no 32-bit addressable RAM in the system at
all, the lowest bit of system memory starts at 0x800254000 (32GB)

[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000800254000-0x0000000800254fff]
[    0.000000]   node   0: [mem 0x0000000810000000-0x000000083fffffff]
[    0.000000]   node   0: [mem 0x00000008c0000000-0x00000009bfffffff]
[    0.000000]   node   0: [mem 0x0000000c00000000-0x0000000c3fffffff]

Maybe this is something that can be set up differently by the boot
loader, otherwise this won't be the only last problem with 32-bit
DMA you see on this chip.

Try to configure it so that there is at least 1GB of RAM in ZONE_DMA32,
or in the ideal case move all of the MMIO out of the way so all of
RAM can stay contiguous starting at a low address.

      Arnd

