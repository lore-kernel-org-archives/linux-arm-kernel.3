Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFE1CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 20:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UrpmziZLfotMS5CEoKkLYKoC2t3idXqYLHnfrjpqSoM=; b=UET136TUkDZOKDfwUUU/TUR4sG
	QQpcuNpibFAW7/V20z7K3kTW+XHcmsFqjymUCUXRGnBu6zw9WMTLXo7nSw0Pp3Kh0fzXKyvA1QhfJ
	9cn0Qyihlbrnf0gDFYZRu4hQAbM92qFIQbV8gk4DmNFJfTEHSFVLxb/zTSrCq/Q7Lxrw7VE9mZzun
	tlpvkyuXKr2hrQ78sojkEs0D4DCsF8xANvQfPcZDzZmKiA88nPSsFfdNjIjtTFsBVYjHizkZwUjSM
	p2C1+8MxnbMxseI7k8NiiUnBnCsLJ2kg+omALsPY9wthxFK5DzBe7QFWhuWlb+4sHhupv6R8npRp6
	Mzq9hgtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyFfq-00000005bQJ-32P5;
	Mon, 15 Sep 2025 20:19:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyFfp-00000005bQ7-0Br5;
	Mon, 15 Sep 2025 20:19:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A87C60227;
	Mon, 15 Sep 2025 20:19:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 938B5C4CEF1;
	Mon, 15 Sep 2025 20:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757967579;
	bh=XdJ7z/q77YUFL/QosenW4NKVcYFIhAWClP3csrjOEHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EZqHnVo/0vRzL1QXtPlDyW6r5wT1/RXhbRcDV/QJDqD0XKxxh6MQ23H7OABUjt2mK
	 Grlghu0fggLO5017FGMY4UIIxvlIlw2chH0Ewcql3s1kFY7kSsQF/Dok0LTC/Pn7Zf
	 3sUgI+p7lztQaBlhl8AkNFbDPkkb0K81d14POIRd15kAeSGF1vrXFcIrZMs4mq9lC8
	 EXdca9Wa7KqtgUoWWPR3OW8ms7veuUurvmEmkhaDlczzi35gKr1Auq82QGdyEWCW5y
	 AL9iX3CsI1xr1ZxgQSD+eMF1SgbrDOh16/rSSIC/b67im/jRftRMPfjkeBERRhCUgl
	 onhjUo0TpfT5Q==
Date: Mon, 15 Sep 2025 15:19:38 -0500
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
	devicetree@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	DENG Qingfang <dqfext@gmail.com>, Lee Jones <lee@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Subject: Re: [net-next PATCH v18 3/8] dt-bindings: mfd: Document support for
 Airoha AN8855 Switch SoC
Message-ID: <20250915201938.GA3326233-robh@kernel.org>
References: <20250915104545.1742-1-ansuelsmth@gmail.com>
 <20250915104545.1742-4-ansuelsmth@gmail.com>
 <175795551518.2905345.11331954231627495466.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175795551518.2905345.11331954231627495466.robh@kernel.org>
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

On Mon, Sep 15, 2025 at 12:01:47PM -0500, Rob Herring (Arm) wrote:
> 
> On Mon, 15 Sep 2025 12:45:39 +0200, Christian Marangi wrote:
> > Document support for Airoha AN8855 Switch SoC. This SoC expose various
> > peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.
> > 
> > It does also support i2c and timers but those are not currently
> > supported/used.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../bindings/mfd/airoha,an8855.yaml           | 173 ++++++++++++++++++
> >  1 file changed, 173 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml:
> 	Error in referenced schema matching $id: http://devicetree.org/schemas/nvmem/airoha,an8855-efuse.yaml
> 	Tried these paths (check schema $id if path is wrong):
> 	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
> 	/usr/local/lib/python3.13/dist-packages/dtschema/schemas/nvmem/airoha,an8855-efuse.yaml
> 
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/airoha,an8855.example.dtb: soc@1 (airoha,an8855): efuse: {'compatible': ['airoha,an8855-efuse'], '#nvmem-cell-cells': 0, 'nvmem-layout': {'compatible': ['fixed-layout'], '#address-cells': 1, '#size-cells': 1, 'shift-sel-port0-tx-a@c': {'reg': [[12, 4]], 'phandle': 3}, 'shift-sel-port0-tx-b@10': {'reg': [[16, 4]], 'phandle': 4}, 'shift-sel-port0-tx-c@14': {'reg': [[20, 4]], 'phandle': 5}, 'shift-sel-port0-tx-d@18': {'reg': [[24, 4]], 'phandle': 6}, 'shift-sel-port1-tx-a@1c': {'reg': [[28, 4]], 'phandle': 7}, 'shift-sel-port1-tx-b@20': {'reg': [[32, 4]], 'phandle': 8}, 'shift-sel-port1-tx-c@24': {'reg': [[36, 4]], 'phandle': 9}, 'shift-sel-port1-tx-d@28': {'reg': [[40, 4]], 'phandle': 10}}} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/nvmem/airoha,an8855-efuse.yaml#"}
> 	from schema $id: http://devicetree.org/schemas/mfd/airoha,an8855.yaml#
> Documentation/devicetree/bindings/mfd/airoha,an8855.example.dtb: /example-0/mdio/soc@1/efuse: failed to match any schema with compatible: ['airoha,an8855-efuse']

Why are we on v18 and still getting errors? I only review patches 
without errors.

Rob

