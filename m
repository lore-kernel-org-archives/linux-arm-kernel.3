Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4A6CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 09:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOmX8DoVDkdi25dNPPFg/anGS8Ls6i4vihgyINbx3eI=; b=Jpew8dxINikTJFGQ7V83ymKx7l
	E4gRBV4odMoFj5mQr/D7ZsOt6Ci4QVULBFycqcV1lreMLmupCK1egWvqQB6huowg5faB8C4w4CuvI
	i95ohPBV+5DwC7tuuDcWpm6ozKm9VPlS7aBUVX45VZSM1r7RxNAKupCsnNQB78oZehSZB8ATfI0z4
	wWzwKXYz8Sn/j77TpbKWWw0gdxZ9Oc/GrbNujs/tQlskS4Bmgzf34lCXL+fTzYUr9t7p3Qo6L0uhS
	HWGOHFrmtvNPXGctuQllqP4utmORCJ+jKvkaFAf7mkf5r2Nl/9Q35XSFDGa8Pi7VuEerZaKWd+u9Z
	5YRbN2eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1mP-0000000GRGS-3D0E;
	Thu, 21 Aug 2025 09:40:21 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uozuf-0000000G8dq-0Pnh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 07:40:46 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6188b7532f3so1143823a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 00:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1755762043; x=1756366843; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UOmX8DoVDkdi25dNPPFg/anGS8Ls6i4vihgyINbx3eI=;
        b=haqjnecBj2024kjkISM7iA545HT5flzT4nbkZfTWxKXlN/YdqAuUfmpGDqXKD7xjy6
         GhX7FEkQ9legfgBYC46n5TAVOGixyV5mhoOMvEXpP4F1gpRQC2tpRK419IJrfW1mrn9G
         p3H6xTM6ACk23oaHLsOELlZE5++HDo40KmA838g8TnfRyH58MUnTDh+Z0zVbqIoJKHkF
         uwT84hxmgQiLEmRJAaMe0OyiGyIV523Xi96LVcf9ZWSKk0nwK421k/s4LMIJGJtfl38y
         O2/pTTIEXmu01r6mbPGRVuk8q2ec42uAWKdf4eC8yJ/SeCUjlkrLw+GQKy6IdqSNtIRa
         k5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755762043; x=1756366843;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UOmX8DoVDkdi25dNPPFg/anGS8Ls6i4vihgyINbx3eI=;
        b=CQcIAxoGtP0FBFL2zTgknYDrDRfqSIuaoqNZNeHaBEJ8vYWV/I8tetKbE9Q6JSxhd+
         nRffYMX4N5gzkPRKlenByRl7lxPvU/NB4APeZQlGSRp9ll7pBo2oL2WHHBySQhYWGNJi
         49ymTFQKOav8kOdTyIQG5UYT25oXqbrpN1YqeNQKLiyToQVnd7V3AoNWVQxqsNtHz9XE
         nVHK6hJNUT1VU8fw+1vXBm5BqOetuL2NABt8EWdI3+DzN3xyXfnyZznHpArHGTfXGTca
         iFI6G1E+fg2/CJNfuaM+YZ2CHbbcfGH+oo+XElDCapNbBR14/RGzchQnAQiNqlglzkEc
         j3nA==
X-Forwarded-Encrypted: i=1; AJvYcCXw/pRtaYBI40AiOx8NBzZjtMvpjEg1Tpdrjd14LtkRtwpk1tnx5O4zeyMnVnTAlbw+UzTF/9lKAU0ROHugrIfI@lists.infradead.org
X-Gm-Message-State: AOJu0YwXBvzPlBpKkBlJmxTPA98qScTx7InRCe/FCdHqXHX/AXdksWHO
	nnqXcn+wJl+ZstaM2XClbP3kdp7fE1CYbwnTyO4IeFFqHDdJbfHckBkfJwUoOnuGWZA=
X-Gm-Gg: ASbGncs5wu3pzbl3BUuJ6wdxsnwWGflOWayBNq44sjpS/IIMfp0ggB9rgbiiWYa3zXo
	uBJjF5qHynaLbvyiapKnWb9n3nWCusm7PUH/25974ZeIPyN+GuwM1ddZJgnMoyHau84nPDaNgqE
	JoYiep5YdXQNb8PXEZHrjBiufvQOBgESri6h71FC545xBAcbQivvbH8RP1fUigTbCBiJKZQfG2v
	i5luYzJZTLM4JtghOrqMJpUH8o4g2xZ7F+gqj9hgp8Nxb4GBE2vqHRri5FLlrTaYKbYtZAKhPyM
	rXiFLFXEn5cvW+fvOSug1dfINnA/M7UgJ6WRv1h2nzedCz24IW1gAKnbNhhZI1jUgSNxDpeKJ9/
	9AInXDnZPccmZ+LiCsSdS+kkyFLn6Cw==
X-Google-Smtp-Source: AGHT+IHEJwqxJwdifUOCSxwxS8LU3s+6tTaEhqmWIZcz8WNrqBZn4cOf5NK2eo88RGZk0Kt+NV58dg==
X-Received: by 2002:a17:907:3e89:b0:afd:d9e4:5a4a with SMTP id a640c23a62f3a-afe07d61255mr154660366b.62.1755762043006;
        Thu, 21 Aug 2025 00:40:43 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded309f55sm341039666b.47.2025.08.21.00.40.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 00:40:42 -0700 (PDT)
Message-ID: <d004d9c4-f71b-49e6-9ced-031761f5e338@tuxon.dev>
Date: Thu, 21 Aug 2025 10:40:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] PCI: of_property: Restore the arguments of the
 next level parent
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, lizhi.hou@amd.com, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
 <20250704161410.3931884-4-claudiu.beznea.uj@bp.renesas.com>
 <7wmpgldjvznbllotblv6ufybd2qqzb2ole2nhvbx4xiavyqa2b@ezaqwghxmbve>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <7wmpgldjvznbllotblv6ufybd2qqzb2ole2nhvbx4xiavyqa2b@ezaqwghxmbve>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_004045_271972_BEC55B28 
X-CRM114-Status: GOOD (  29.29  )
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

Hi, Manivannan,

On 20.08.2025 20:47, Manivannan Sadhasivam wrote:
> On Fri, Jul 04, 2025 at 07:14:03PM GMT, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> of_pci_make_dev_node() creates a device tree node for the PCIe bridge it
>> detects. The node name follows the format: pci_type@pci_slot,pci_func. If
>> such a node already exists in the current device tree, a new one is not
>> created.
>>
>> When the node is created, its contents are populated with information from
>> the parent node. In the case of root complex nodes described in the device
>> tree, the created node duplicates the interrupt-map property. However, the
>> duplicated interrupt-map property does not correctly point to the next
>> interrupt controller.
>>
>> For example, in the case of the Renesas RZ/G3S SoC, the resulting device
>> tree node is as follows (only relevant DT properties are shown):
>>
>> pcie@11e40000 {
>>
>>     // ...
>>
>>     interrupt-map = <0x00 0x00 0x00 0x01 0x1f 0x00 0x00 0x00 0x00
>>                      0x00 0x00 0x00 0x02 0x1f 0x00 0x00 0x00 0x01
>>                      0x00 0x00 0x00 0x03 0x1f 0x00 0x00 0x00 0x02
>>                      0x00 0x00 0x00 0x04 0x1f 0x00 0x00 0x00 0x03>;
>>     interrupt-map-mask = <0x00 0x00 0x00 0x07>;
>>     interrupt-controller;
>>     #interrupt-cells = <0x01>;
>>
>>     #address-cells = <0x03>;
>>     #size-cells = <0x02>;
>>
>>     phandle = <0x1f>;
>>
>>     // ...
>>
>>     pci@0,0 {
>>         reg = <0x00 0x00 0x00 0x00 0x00>;
>>         interrupt-map = <0x10000 0x00 0x00 0x01 0x1f 0x00 0x11e40000 0x00 0x00
>>                          0x10000 0x00 0x00 0x02 0x1f 0x00 0x11e40000 0x00 0x01
>>                          0x10000 0x00 0x00 0x03 0x1f 0x00 0x11e40000 0x00 0x02
>>                          0x10000 0x00 0x00 0x04 0x1f 0x00 0x11e40000 0x00 0x03>;
>>         interrupt-map-mask = <0xffff00 0x00 0x00 0x07>;
>>         #interrupt-cells = <0x01>;
>>
>>         #address-cells = <0x03>;
>>         #size-cells = <0x02>;
>>
>>         // ...
>>     };
>> };
>>
>> With this pci@0,0 node, the interrupt-map parsing code behaves as follows:
>>
>> When a PCIe endpoint is enumerated and it requests to map a legacy
>> interrupt, of_irq_parse_raw() is called requesting the interrupt from
>> pci@0,0. If INTA is requested, of_irq_parse_raw() first matches:
>>
>> interrupt-map = <0x10000 0x00 0x00 0x01 0x1f 0x00 0x11e40000 0x00 0x00>
>>
>> from the pci@0,0 node. It then follows the phandle 0x1f to the interrupt
>> parent, looking for a mapping for interrupt ID 0x00
>> (0x00 0x11e40000 0x00 0x00). However, the root complex node does not
>> provide this mapping in its interrupt-map property, causing the interrupt
>> request to fail.
>>
> 
> Are you trying to say that the generated bridge node incorrectly uses Root
> Complex node as the interrupt parent?

I'm trying to say that the generated bridge node is wrong because it copies
the interrupt-map from the root complex mapping int 0x1 to 0x0 in the
bridge node, while it should have map the int 0x1 to something valid for
root complex mapping.

E.g. when some device requests INT with id 0x1 from bridge the bridge
mapping returns 0x0 then the returned 0x0 is used to find a new mapping on
the root complex based on what is provided for in with interrupt-map DT
property.


> 
> I'm getting confused since your example above shows '0x1f' as the interrupt
> parent phandle for both Root Complex and bridge nodes. But I don't know to which
> node this phandle corresponds to.

Root complex node from this patch description has:

phandle = <0x1f>;


> 
> In any case, since this seems to be an independent fix, please send it
> separately.

Yes, once port bindings are added this fix is not needed for this driver
anymore. Will post it as a separate fix.

Thank you,
Claudiu


> 
> - Mani
> 
>> To avoid this, in the interrupt-map property of the nodes generated by
>> of_pci_make_dev_node() map legacy interrupts to entries that are valid in
>> the next level interrupt controller in the interrupt mapping tree.
>>
>> With this, the generated pci@0,0 node and its parent look as follows:
>>
>> pcie@11e40000 {
>>     // ...
>>
>>     interrupt-map = <0x00 0x00 0x00 0x01 0x1f 0x00 0x00 0x00 0x00
>>                      0x00 0x00 0x00 0x02 0x1f 0x00 0x00 0x00 0x01
>>                      0x00 0x00 0x00 0x03 0x1f 0x00 0x00 0x00 0x02
>>                      0x00 0x00 0x00 0x04 0x1f 0x00 0x00 0x00 0x03>;
>>     interrupt-map-mask = <0x00 0x00 0x00 0x07>;
>>     interrupt-controller;
>>     #interrupt-cells = <0x01>;
>>
>>     #address-cells = <0x03>;
>>     #size-cells = <0x02>;
>>
>>     phandle = <0x1f>;
>>
>>     // ...
>>
>>     pci@0,0 {
>>         reg = <0x00 0x00 0x00 0x00 0x00>;
>>         interrupt-map = <0x10000 0x00 0x00 0x01 0x1f 0x00 0x11e40000 0x00 0x01
>>                          0x10000 0x00 0x00 0x02 0x1f 0x00 0x11e40000 0x00 0x02
>>                          0x10000 0x00 0x00 0x03 0x1f 0x00 0x11e40000 0x00 0x03
>>                          0x10000 0x00 0x00 0x04 0x1f 0x00 0x11e40000 0x00 0x04>;
>>         interrupt-map-mask = <0xffff00 0x00 0x00 0x07>;
>>         #interrupt-cells = <0x01>;
>>
>>         #address-cells = <0x03>;
>>         #size-cells = <0x02>;
>>     };
>> };
>>
>> Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v3:
>> - none; this patch is new
>>
>>  drivers/pci/of_property.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
>> index 506fcd507113..8dfed096326f 100644
>> --- a/drivers/pci/of_property.c
>> +++ b/drivers/pci/of_property.c
>> @@ -243,6 +243,14 @@ static int of_pci_prop_intr_map(struct pci_dev *pdev, struct of_changeset *ocs,
>>  		}
>>  		of_property_read_u32(out_irq[i].np, "#address-cells",
>>  				     &addr_sz[i]);
>> +
>> +		/*
>> +		 * Restore the arguments of the next level parent if a map
>> +		 * was found.
>> +		 */
>> +		out_irq[i].np = pnode;
>> +		out_irq[i].args_count = 1;
>> +		out_irq[i].args[0] = pin;
>>  	}
>>  
>>  	list_for_each_entry(child, &pdev->subordinate->devices, bus_list) {
>> -- 
>> 2.43.0
>>
> 


