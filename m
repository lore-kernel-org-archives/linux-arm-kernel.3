Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D34FC369D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 19:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TR1wne2z6M0V0X3ccLc0XGsWg0Ga+NHut6t6xs/k11A=; b=o7JTgVac+h8/K7ahqMlSHaE9+6
	23OirrrW1DKHwG4/c/8O6WYszXVdBE63RKWTndjmOkOq3Q4ekqS/ark31crTC/yP+aYTqjvi4yb26
	xC7Ii6sjJXmddrVRsuEqd9RGSPu4cAudcLthclbXfUxcqz3NoYhcv4za59lGZU/i65+mLTfKybl3p
	7CPKmpaDWTPOkJJW41/TpN03H4+guVRS5doO5UGWRlVItW1BFMPRdB7I91sQ5/V19XZpe2Rp85bMX
	ytSDA+JuTDB4iPkR21e8RQ6nL7iTphhhJIEuppHV/h9m49llSmw5qW7LZ7DwEHkAbLrWaWbVInHv9
	mT7gn9XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Jaf-00000008Lme-1JRZ;
	Tue, 22 Apr 2025 19:47:33 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Gkn-00000007xhG-09YU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 16:45:50 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MGjgEr1280827
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 11:45:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745340342;
	bh=TR1wne2z6M0V0X3ccLc0XGsWg0Ga+NHut6t6xs/k11A=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yk++wuDgc5NBWyPrVnhcZUtVuEVBFYBQlwWw3MNmpaKKwn2N7Zrv5O7vl7RlE6hr5
	 /KIbE9x/daMdN/EJ0ixKVIpZ4qEnc5Lvq3l41PErThzBo2vO09/L+lBoLykzGBJ+de
	 /zCu/wuGvbl6vP6GYaFZRBjPUelBK6u01vTSLoqI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MGjgWE078413
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 11:45:42 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 11:45:42 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 11:45:42 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MGjfx6051531;
	Tue, 22 Apr 2025 11:45:41 -0500
Message-ID: <39ead65c-0040-4a22-9cdc-081696b3d967@ti.com>
Date: Tue, 22 Apr 2025 11:45:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: mfd: syscon: Add ti,am62-ddr-pmctrl
To: David Lechner <dlechner@baylibre.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Markus Schneider-Pargmann
	<msp@baylibre.com>
CC: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Siddharth
 Vadapalli <s-vadapalli@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20250122-topic-am62-dt-syscon-v6-13-v1-0-515d56edc35e@baylibre.com>
 <20250122-topic-am62-dt-syscon-v6-13-v1-2-515d56edc35e@baylibre.com>
 <20250124-heavy-jaybird-of-vitality-4cbe24@krzk-bin>
 <20250124-able-beagle-of-prowess-f5eb7a@krzk-bin>
 <mocfnpebc67xegcis6tx3ekhsjcsqnvhwtipufycrtq2be4nbh@pmxhir5gmkos>
 <639b4e3a-3f68-4fba-aa33-c46dcb6fc88f@linaro.org>
 <d6252b73-0bcc-4724-8144-d6a98c8980f8@ti.com>
 <74ee6d9b-fd78-4d8a-a94f-b2c4dc794b60@linaro.org>
 <ebsbaaxyatrcikoem75t2blkhhceuidq3wnj3r2hbezfcmtc3u@ptffexrigbff>
 <f9a2247e-e0eb-4e22-8626-80e87afa9386@linaro.org>
 <qjwlppsq4eorzepvjsgjjyyaddouo5w2rjguu5c2mqesd6luwp@f426xeghy2ht>
 <2130b439-74d0-475d-8429-1a1b4d9738aa@linaro.org>
 <b7f6570f-3b80-4fc1-8201-d44f5692867f@ti.com>
 <07bf9f93-deb8-48a1-aae9-a8a053680cc9@linaro.org>
 <6241ff00-27e6-45ab-808e-f04e39854753@ti.com>
 <8fe546e7-4fbc-4c63-ad0f-576ffb117508@baylibre.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <8fe546e7-4fbc-4c63-ad0f-576ffb117508@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_094549_212899_C8E8508A 
X-CRM114-Status: GOOD (  19.79  )
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

On 4/22/25 11:12 AM, David Lechner wrote:
> On 4/21/25 12:03 PM, Andrew Davis wrote:
> 
> ...
> 
>> Which parent device? That is my point, if the top level node for the
>> whole CTRL_MMR region is made into one big syscon, then a big regmap
>> is made that covers the whole region. All the child devices also make
>> regmaps covering their device range. Now these registers under the child
>> device belong to two different regmaps. No synchronization is done as
>> these are not the same regmap, regmap only handles this for multiple
>> access to registers within the same regmap.
>>
> 
> Why does the child device have to create a new/separate regmap? Can it not use
> something like syscon_regmap_lookup_by_phandle_args() to get the regmap from
> the "syscon" node along with 1 or more args specifying the one or few registers
> out of the full range that are assigned to that specific child node? This way,
> all child nodes would be using the same shared regmap.
> 
> (And yes, I know technically they don't need to be child nodes - just using that
> terminology to be consistent with the previous discussion.)

Yes, this can be done, and is done for a couple drivers today. The issue is most
drivers do not expect to be a child node of a syscon nor fetch a regmap with
syscon_regmap_lookup_*() functions. The vast majority drivers do the normal thing,
which is platform_get_resource() and similar, that gets the memory from the standard
"reg" property inside their own node.

We have then two options, retrofit all the existing drivers we might use with
support for fetching syscon regmaps (some drivers do not use regmap in the
first place, so we would also have to add regmap support first). Or we do what
we are doing here, which is to have these devices not use overlapping register
regions (which has the minor side effect of sometimes causing some nodes to
cover only small range of registers, which seems to be a problem?).

We went for the latter option, and it has been working fine for all our
new devices. And we are fixing the same for some of our older devices, we
are actually almost done with that too (if we could get this patch and maybe
two others in we would be completely converted).

Andrew

