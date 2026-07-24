Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23BCC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 13:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5CUcwtybRsnP7K85MNqacwjWecyslUsjby8+ZC9UXw=; b=364GlsspziL+JaeApXOvwZY7l/
	FLQsjSYKPxR5SQSy52j2wK5YHToi2X1zYmEqVPbRr4mvWo2LnL9P6Oyfabpdj4nYsdNf6+8zDbEn6
	PVsrovyub3p8WZBH8Po57wWimpSJ5nMHJweaoN0pNz2ZIQixq+I//U7OTkPszpPTTmUCm0Vj4WElD
	H4WrMWNUe6WrNL43AcuTwFHo/ujfNkZ2q7sVonklKOmucG+k1WrSfxXFd/ObbBKvQ4sqEdc8Sr+Ty
	Ws78/9b3jFXXyRP94EwPEwHxj6jpb3bfZGIOLplcijcYLGIGcw2JQdzTgnHFHxMs0QY7YlYdWY/66
	DLhzOhuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnFlm-0000000GT50-0Pkx;
	Fri, 24 Jul 2026 13:16:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnFlk-0000000GT4o-3abY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 13:16:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CFD2E600B0;
	Fri, 24 Jul 2026 13:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F5311F000E9;
	Fri, 24 Jul 2026 13:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784899011;
	bh=J5CUcwtybRsnP7K85MNqacwjWecyslUsjby8+ZC9UXw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=SfT2mN54HZxMmsREoVtswZlYPLgI8qEJG1+7Hxsj1WWftapWz00QtYB9irMeStjSm
	 XqMvusvqJsssC6KlCh5TzZIuf+44vryFOMpoU/Bo4ebqVSpEHbdUaSR3YrH/Ep7bRW
	 rvh1LIp8AkVxRnJJhIbDEJkNF3IumU4S/3G//pZWHyGIAUffaoPla2XCV4fzI/uhOs
	 S/RawXOOiOwtaew7SnE5ee65HwVkei5jlf8foS8aTrQG3Cg0mDSA6r4VmsdmH8G+1y
	 4Hu8BmSqKlS3/kpN3tSgEFwgcyHCG9ymFbUjvQuHtFxL6fohbeCYYlo+VXNR742ZTR
	 0GTFxZKgNBFXA==
Date: Fri, 24 Jul 2026 08:16:49 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J . Wysocki" <rafael@kernel.org>, driver-core@lists.linux.dev, 
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
 Eric Dumazet <edumazet@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
 Michal Simek <michal.simek@amd.com>, Jonathan Corbet <corbet@lwn.net>, 
 linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Shyam Pandey <radhey.shyam.pandey@xilinx.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S . Miller" <davem@davemloft.net>, linux-doc@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, harini.katakam@amd.com, 
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Suraj Gupta <suraj.gupta2@amd.com>
In-Reply-To: <20260723123838.125145-4-suraj.gupta2@amd.com>
References: <20260723123838.125145-1-suraj.gupta2@amd.com>
 <20260723123838.125145-4-suraj.gupta2@amd.com>
Message-Id: <178489900988.2774291.12161691819404985580.robh@kernel.org>
Subject: Re: [PATCH net-next 3/7] dt-bindings: net: xlnx,axi-ethernet: Add
 10G/25G (XXV) ethernet
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


On Thu, 23 Jul 2026 18:08:34 +0530, Suraj Gupta wrote:
> The XXV Ethernet IP integrates a 10G/25G Ethernet MAC with an in-core
> PCS/PMA driving a high-speed serial transceiver. Extend the existing
> xlnx,axi-ethernet binding to describe it.
> 
> Add the "xlnx,xxv-ethernet-1.0" compatible and make the resource
> requirements conditional based on the XXV compatible string:
> 
>   - "dmas", "dma-names", and "phy-mode" are required.
>   - Interrupt properties are not required as it does not have a dedicated
>     Ethernet core interrupt.
>   - "phy-handle" is not required as it has internal PCS and PMA.
>   - Add the 10gbase-r and 25gbase-r phy-mode values used by XXV.
> Annotate the existing compatibles, generalise the title to cover both
> variants, and add an example node for XXV.
> 
> Define properties at top level per binding style and use if/then to
> constrain requirements and phy-mode per compatible. Forbid 1G-only and
> unused ethernet-controller properties on XXV nodes.
> 
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> ---
>  .../bindings/net/xlnx,axi-ethernet.yaml       | 144 ++++++++++++++----
>  1 file changed, 117 insertions(+), 27 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/xlnx,axi-ethernet.yaml: allOf:2:then:properties:clocks: {'maxItems': 3, 'items': [{'description': 'RX AXI4-Stream clock (rx_core_clk).'}, {'description': 'GT DRP clock (dclk).'}, {'description': 'AXI4-Lite register clock (s_axi_aclk).'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/xlnx,axi-ethernet.yaml: allOf:2:then:properties:clock-names: {'maxItems': 3, 'items': [{'const': 'rx_core_clk'}, {'const': 'dclk'}, {'const': 's_axi_aclk'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260723123838.125145-4-suraj.gupta2@amd.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


