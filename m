Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E41C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 22:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqZXwnT4sTbfdvOMcGPrEviywWtc9S3DZ3O1HarHNx0=; b=1vf2Z1Q1DyIcw0IK8CZAGIFN3B
	AOGiGI+ZWFZJ69O3kRm0soXOHPEbq5vYqC2RwojQoPh9vhzya+GJhiiUEHdlTKsa0T0IBwG/Tjzkk
	knbkU1Cw3rH0IDtqVCSlTziE2e5SnpoVyW4zdVLyHD7c+NKZhuvhwUljZV6Yqq5vekRG0Exk+ZN97
	YLBeub09b5HfWQ7k3euu7Xh2OZgTOjWGyj7kALeRHX1Z00evVWkt/k0O1O8lNGn0u9js9mD7GOfdh
	znTpGLr1XSo+t0MRkvPyXkCWpDpTV3tXRTSGZzBIhtEebpjPAL7JqZuDoOsCAffhZcucr7nVb8ruT
	xJmvt8dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7KZa-0000000Cecf-0Q8f;
	Thu, 17 Sep 2026 22:27:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7KZY-0000000Cebw-3cyR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 22:27:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D54141B0A;
	Thu, 17 Sep 2026 22:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F36F21F000FF;
	Thu, 17 Sep 2026 22:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789684036;
	bh=yqZXwnT4sTbfdvOMcGPrEviywWtc9S3DZ3O1HarHNx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T1Ch8FmEiDOu1G4fnoJuLj1rEhyz4E/ziyDrsJZ9x4LQWGIVRxnAKXftZ6pOkq0cV
	 k/B8IdIfBNledOY1f9g38IVV8BrpBoSMSIu+lh+YHvym5y1Z1NQRJNtF6S3Q7bMBRF
	 dMsU5FV1q4t4A4hIwC7E5PLIF2cNGkC3wolLzWWODHyQxwtkpaLmKs7/zJJlIncvx8
	 NZBsWZICRa0Iq9VByDkAUgeriSBjwz6lhGxW4iCWDZik9l+a1vkX5lWbfhMvYRL82i
	 nbN0PhtXBdsgAigUJoqR4xGqxnL7FxhSzWTFywmuGVz5Pll1HxEfm1SYpAtypTB4wm
	 Nes7zqLQvzOLg==
Date: Thu, 17 Sep 2026 17:27:14 -0500
From: Rob Herring <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
	Oskar Senft <osk@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Vitaly Lubart <lubvital@gmail.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Breno Leitao <leitao@debian.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	James Morse <james.morse@arm.com>, Paolo Abeni <pabeni@redhat.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Dave Penkler <dpenkler@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>, Dan Williams <djbw@kernel.org>,
	Mukesh Rathor <mrathor@linux.microsoft.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Alexandra Winter <wintera@linux.ibm.com>,
	Julian Braha <julianbraha@gmail.com>,
	Karthikeyan KS <karthiproffesional@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>, openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v2 3/4] dt-bindings: uart-routing: Add binding for
 StarFive JHB100 UART routing
Message-ID: <20260917222714.GB4081995-robh@kernel.org>
References: <20260905102901.126035-1-changhuang.liang@starfivetech.com>
 <20260905102901.126035-4-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905102901.126035-4-changhuang.liang@starfivetech.com>
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

On Sat, Sep 05, 2026 at 03:29:00AM -0700, Changhuang Liang wrote:
> Add device tree binding for the StarFive JHB100 UART routing controller.
> This controller allows dynamic routing of inputs between built-in UARTs
> and physical serial I/O ports, enabling use cases such as Host <-> BMC
> communication via UARTs.

Also, drop 'binding for ' in the subject. The subject already said 
binding once.

Rob

