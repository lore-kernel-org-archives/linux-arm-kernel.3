Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8185D10C0B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 12:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmnXAfgH5krb4Qa7xH5WkPMr5z7E41xpqGjszUtCldQ=; b=weUd9gNkug61q+ISGTBU85S/vj
	Oyi7bRH8XGyKkioLNIGRVJ+gMFSqgxzT5c6Zyew4B2aJkrm53Bg3CN/kANnjWAoGUADAhMV6VQl9R
	yNGqXiyxDYyYgO4llMFWQOO+3jPaL2Jgjv8FgfsIeAAD1Ck1orpZF6c3ZK1miy/N6f2dRTHlxfx2O
	LxaNV1Oh0RW7xNchqNNIoZ+3kApOuxwvTF7bx0IKjur7BrRL0AhPm4FdCLWbLaEfJjaqugPNAFh6N
	IIzIvuYl6fqL+GD7+7H6xqSh0iDVryQKCFuRI6sTh2+vIRBOXBTIGa28gaNcpNGQ65vJvsIq3xeHn
	BjOuLDhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Ot6-0000000Akts-273Q;
	Mon, 28 Oct 2024 12:30:24 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5OrU-0000000AkZy-3R8A;
	Mon, 28 Oct 2024 12:28:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OmnXAfgH5krb4Qa7xH5WkPMr5z7E41xpqGjszUtCldQ=; b=X9Gxc8koh4tsaSTZBwfaPLp/kY
	m6eXMrD6ioDtr1nxU1xTZHt+frSGzd5XWC96Tu5CuDdH7ol4XYE/tvXajHbazmoXo8ph7lhrL4WKv
	qMw5WfSghV6DVEw5aJzy7SrUfHvp2qT7ZSxU6ALB+N40ooz4rBIB3Pb2VdVjUTFhmogM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t5Or7-00BRXh-LZ; Mon, 28 Oct 2024 13:28:21 +0100
Date: Mon, 28 Oct 2024 13:28:21 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Drew Fustini <drew@pdp7.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH net-next v5 1/2] dt-bindings: net: Add T-HEAD dwmac
 support
Message-ID: <a3d6c6a1-924c-41a8-b70b-38056fdc079d@lunn.ch>
References: <20241025-th1520-gmac-v5-0-38d0a48406ff@tenstorrent.com>
 <20241025-th1520-gmac-v5-1-38d0a48406ff@tenstorrent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025-th1520-gmac-v5-1-38d0a48406ff@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_052844_876402_1C31D30A 
X-CRM114-Status: UNSURE (   7.74  )
X-CRM114-Notice: Please train this message.
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

On Fri, Oct 25, 2024 at 10:39:08AM -0700, Drew Fustini wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
> 
> Add documentation to describe the DesginWare-based GMAC controllers in
> the T-HEAD TH1520 SoC.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> [drew: rename compatible, add apb registers as second reg of gmac node,
>        add clocks and interrupts poroperties]
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

