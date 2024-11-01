Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792D0E674B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 07:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t02WB/+mgUCe1qSERAS1NxoYpe37YoESOauiLD+Ams4=; b=NbWXrrI9MwPQimfBEzTbHb1veh
	yW+fH4qlcXcIKowREEpcSSpVKtYwNa7TOARfPCTELjvVqdI1i+g4MXUeVPhrNhisuhWOrR4MokJG+
	2WSuEoEf/8/0RmVDcSRWK3LSXxzMO9y618yDfowGR+w3BUusq/WPrChd4ruIR3M9H71D/utTZ5Rcr
	MPaqJUCYIOe2HgvD4z4ryojaYLHWrKs9IzLZoRgs4vTrOtSpUorSV2qYu7obJHUsaxk0xSboJQmVC
	Sl9MQxcE0bK5fyo9ZwwPFM86d8Z2neOFnqlR+TEe/YIEP7jdN5QnDRKvM+L0al06JhkxykubcI/K0
	YBo0fy7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6mSq-00000006Asn-1VJs;
	Fri, 01 Nov 2024 07:53:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6mRA-00000006AfU-0aIy;
	Fri, 01 Nov 2024 07:51:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9B4615CBD3D;
	Fri,  1 Nov 2024 07:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F071C4CECD;
	Fri,  1 Nov 2024 07:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730447475;
	bh=WzA5otiOSUL6o5Euerp+1UpdYOZq+P7lE1gAI6ODFsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iYk1Kh6JVKRcNIC4hb/yBHxRh8hXwWAf+wkojDf07TMwx15qqsjpxSo/t52kJUqac
	 ytYPa2XLyaItfJWZrmCcC3Lsb9mIRII2xSvQaO58e7SWsvKJLQZGwd9NVZD95Hh7VM
	 Twzsi1uVv/zp3SoKEwj2MG7PocdrY4tFXBV5TmpttU1P9cr40QUJXLcCqz363+2YBB
	 qRASwsw/mOlxK3f/cxbHUbPcqsyBsMDerLkBhNcRQp1W/uypa991XyQgUahSa43pE/
	 fEVK3yyJrcdYDwyezahBW2QFp6i5eG0+LY9KSfrvTMwJvjXD2o1QX4S2sTTECcHlv9
	 0zGkTZK2VMsag==
Date: Fri, 1 Nov 2024 08:51:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH RFC net-next 1/3] dt-bindings: net: Add support for
 Sophgo SG2044 dwmac
Message-ID: <uzr6gpmyng3irrhuf3q3bvswlbzyxnr74jwccyosplr32ceczu@jjrva67iq4ce>
References: <20241101014327.513732-1-inochiama@gmail.com>
 <20241101014327.513732-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241101014327.513732-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_005116_263289_507E32E7 
X-CRM114-Status: GOOD (  12.14  )
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

On Fri, Nov 01, 2024 at 09:43:25AM +0800, Inochi Amaoto wrote:
> The GMAC IP on SG2044 is almost a standard Synopsys DesignWare
> MAC (version 5.30a) with some extra clock.
> 
> Add necessary compatible string for this device.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   4 +
>  .../bindings/net/sophgo,sg2044-dwmac.yaml     | 124 ++++++++++++++++++
>  2 files changed, 128 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> 

I wish patches for review were not marked as RFC. I remember this
patch, so I don't consider this as RFC... but that's rather exception.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


