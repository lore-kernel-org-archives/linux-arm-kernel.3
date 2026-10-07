Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D092CA6004
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 21:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TbYPg3uQU1P6rMt+WuOLQFicMNfbSJBbie5yCmhoZc0=; b=p/SlEfXcCmaRth9RLLT01nEr0v
	HPyRwOihUpQOe9rKKKl1HsaNJkzvmMpQBq34YqRfsoLbHO3UwkeQwh61ZscRhm+8yuumeloGSOvJc
	iMETGn6Cwp5z5HAgqta4EipIJYFEkEKcg4RlWcAt+3oIL/ptHEehRxO+Y80Rpjs8FE4bFxYnUmsg0
	PmlU/7wxJyqnp4MA7t74A9hGzFuKodFVwtiNk8R/pchHZDDONa6VX3GnGJwMtpvZYC9k2RJqF9TIN
	jDmp8guB3w6xjRVV1Rm26daG5KRzo0Rsh7rHwctLE7/8St3yyCopW8A7c+AVXFyML3+wG+0BNfamP
	5TjcG5Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEYl4-00000003APg-04Mr;
	Wed, 07 Oct 2026 21:01:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEYl2-00000003AP5-1tRb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 21:01:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CFBC260A53;
	Wed,  7 Oct 2026 21:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5168D1F000FF;
	Wed,  7 Oct 2026 21:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791406859;
	bh=TbYPg3uQU1P6rMt+WuOLQFicMNfbSJBbie5yCmhoZc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DlA7fxezfe1z+1SnRn5LXiq7eRXTf4Wa/Mg0y9+59eWKxQT4DgzFaWCEpnRqIVNQE
	 gN0SXj6ZmBT5Rmm3TdrmyP14EHopZyd9r0EXpEOSaFPU2vKvQToybCkN2NK3HbCHMg
	 ST58deOjUKDl3/uZ571L1lEeLRQO0IDXxaHtEMP4+1vE+svI74ZMqDvCPm8P1tx2wK
	 /KWbLmIpzeWWtGHiDJGBuB5wdNR2jq/xcBk7NAtcrpllfvReO7QYQQ9PEhvPB2d2UU
	 w+Mu56IlWXzOVzF+rGDRuhrSUVAYTHRJs2lQKVfRGyK7rS/F41uzXfWm5bzzsnTD4W
	 RHjzI02XRHE6g==
Date: Wed, 7 Oct 2026 16:00:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Jani Nikula <jani.nikula@intel.com>, Hanjun Guo <guohanjun@huawei.com>,
	Mukesh Rathor <mrathor@linux.microsoft.com>,
	Jakub Kicinski <kuba@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Karthikeyan KS <karthiproffesional@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>, openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Dan Williams <djbw@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Dave Penkler <dpenkler@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	James Morse <james.morse@arm.com>,
	Jonathan Cameron <jic23@kernel.org>, linux-doc@vger.kernel.org,
	Alexandra Winter <wintera@linux.ibm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>, Breno Leitao <leitao@debian.org>,
	Stephen Hemminger <stephen@networkplumber.org>,
	linux-arm-kernel@lists.infradead.org,
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
	Julian Braha <julianbraha@gmail.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oskar Senft <osk@google.com>, Vitaly Lubart <lubvital@gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: soc: starfive: Add StarFive JHB100
 UART routing
Message-ID: <179140685827.281341.11055156225840359821.robh@kernel.org>
References: <20260925050947.9900-1-changhuang.liang@starfivetech.com>
 <20260925050947.9900-4-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925050947.9900-4-changhuang.liang@starfivetech.com>
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


On Thu, 24 Sep 2026 22:09:46 -0700, Changhuang Liang wrote:
> Add device tree binding for the StarFive JHB100 UART routing controller.
> This controller allows dynamic routing of inputs between built-in UARTs
> and physical serial I/O ports, enabling use cases such as Host <-> BMC
> communication via UARTs.
> 
> The clocks property exists in the hardware, but the driver does not use
> it.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../soc/starfive/starfive,uart-routing.yaml   | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,uart-routing.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


