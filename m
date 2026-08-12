Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59573C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 03:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wq84iKL6ygCiqJNdxYyZKwxW2cAVvh8TSQKqYwcZIsA=; b=w41JbX633As/4uhKtfc94q0jqJ
	5KVKxpPe1GTYXHV8MXuhjODkE7f5YusjX1dGvIaICkULZBuV/sRDi0tPxXhjFteXOZS4Vr2WY1V2q
	SdZ8GGQ2zqM0wzAIBOiHiOhNAYZ073gUNBv3ozt5/s2vFmjK9yfTRIRo510GjHJQxShvikqQ7eW1C
	wTsYCHFkRv//KohRAyBCw1WoXg8rdpj9xd6h5C1if7aipHggOCD+ocxqvgyD2+grldli7WZO9CuQU
	wlf8B8Mh9RKDio4+AJPmsCobJjeAq7oYMSIc8Ra5xF/xp4rMAlv3wzUj5kA6XfwXhGWgoApnHv/4y
	0bIilR9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtzL8-0000000FKgh-02uw;
	Wed, 12 Aug 2026 03:09:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtzL7-0000000FKgV-0qFv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 03:09:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A6FB9600E2;
	Wed, 12 Aug 2026 03:09:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392BB1F000E9;
	Wed, 12 Aug 2026 03:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786504151;
	bh=Wq84iKL6ygCiqJNdxYyZKwxW2cAVvh8TSQKqYwcZIsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UI0oQMOq8J4lT7ZxYWnt7iJe8XtrPaGn69ki5MObrDpjOySp1gDePDUSqdTgCKfF8
	 LB4gqrSoEu/QbEIV9iCIZwfkXqPDB4cMjjvxzMNezNAlhX8ZYAgxQkLLuR+p8vokrr
	 jGl/J2xJV0+RpNKeBgYzqacUtmvoogvvRptTZNo4LzmWHXK1bFLraCLRbmRhZzGdRj
	 IIk08qPZ+jbYf+Eg6eI79EF6HRDhNiFg0H3VGuehuSBTkPhgFc7BVFs2M5BIerb+EQ
	 EXlBAwVGAIQy3yq2IpEcNvJMukBZHAGVJPnO0ujbTBkAlw0ZhATobsNDy+obRjMwXU
	 3JYbK9XJEr3qA==
Date: Tue, 11 Aug 2026 22:09:10 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, Michal Simek <michal.simek@amd.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	driver-core@lists.linux.dev,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH net-next v2 3/7] dt-bindings: net: xlnx,xxv-ethernet: Add
 Xilinx XXV 10G/25G Ethernet
Message-ID: <178650415010.657438.15353116551924864643.robh@kernel.org>
References: <20260723123838.125145-1-suraj.gupta2@amd.com>
 <20260806181153.1213996-1-suraj.gupta2@amd.com>
 <20260806181153.1213996-4-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806181153.1213996-4-suraj.gupta2@amd.com>
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


On Thu, 06 Aug 2026 23:41:49 +0530, Suraj Gupta wrote:
> The XXV Ethernet IP integrates a 10G/25G Ethernet MAC with an in-core
> PCS/PMA driving a high-speed serial transceiver. Its payload is moved by
> an external AXI DMA (or multichannel DMA) controller referenced through
> the dmas/dma-names properties. Document the IP in a dedicated schema
> file.
> 
> Add the "xlnx,xxv-ethernet-1.0" compatible with the 10gbase-r and
> 25gbase-r phy-modes, the rx_core/drp/s_axi clocks and the AXI DMA
> channel properties.
> 
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> ---
>  .../bindings/net/xlnx,xxv-ethernet.yaml       | 107 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/xlnx,xxv-ethernet.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


