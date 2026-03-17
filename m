Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E2EFB5EA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 03:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mw78aQKLNFIE89wcC2MksDk2g7vvEFLxJ3H6KDIyUc4=; b=3kYa4VlEdqAn4p9kkEg6JZmxOs
	0eZvUq1yEu/ddvrwP6XhLj01NyhJdwBb2JQMBjpCbjSIzGS8GhiXrBxBp7dUnAwQeVUqiUxEY/bnF
	kSCwqG3ZvEDd3gbJInzOo7WywANAuohHZHOgS3NQChmNgB0+BWWadrN4pHNTKRVqY4TdjFsNz0Cq5
	0vB1ScitivfT3XpoNNWZ2gSfTtoyAAYZB4tVUL5dlXWQ+ZQ/UjkzMjhGkCHtqh1iKNoNY8Y81DwsT
	Pv6fEKk+IwDCjGOHmbryf24CmSbm/HvUJvCsiGxo5AmiEQ3aBmZQAMDH6UVtNLEkbEEHh5GDpayBE
	YP7o79JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2L0C-00000005Ibn-2eEM;
	Tue, 17 Mar 2026 03:21:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2L0A-00000005IbP-2NfE;
	Tue, 17 Mar 2026 03:21:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3FC2840B19;
	Tue, 17 Mar 2026 03:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F062C19421;
	Tue, 17 Mar 2026 03:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773717710;
	bh=2kpU1JJYKn+nMJDIDxbv+GgYoKMUunK160GUW0ypx78=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QkR7dLbx7a+ct3rh6FeCJn220b3UqKaggyq5g81S7cnw62UX0l7QtHtlT6WUT8nVf
	 0P/55uZOqYzMpW1nX8TzE5zbl7eS1GKOndPmR9IZKHBFHjTKHHph3Dl3L4s//urtTh
	 O0chTqs2zZAGdT1EQUb1upXGG64C/1ygiBwAf/qjasVWc0dFXMXQKCjOK9gpk6PUPD
	 ta/YVxTk5siE/1FomstF9a9eomkwKr4Rv9AWXq7wbE9/W6bbCAK/WIu2AsuQtZxyIv
	 OXguMWyKO56lKOePBow329/2cT6vdJqB/64+b9omo5dd/sXVErzbwsC+2Mj/2M77y3
	 ZlF9paWqkmyUA==
Date: Mon, 16 Mar 2026 20:21:47 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan
 <dlan@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Richard Cochran
 <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Yao
 Zi <me@ziyao.cc>, Yanteng Si <siyanteng@cqsoftware.com.cn>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Shangjuan Wei
 <weishangjuan@eswincomputing.com>, Chen-Yu Tsai <wens@kernel.org>, Zhi Li
 <lizhi2@eswincomputing.com>, Boon Khai Ng <boon.khai.ng@altera.com>, Maxime
 Chevallier <maxime.chevallier@bootlin.com>, Quentin Schulz
 <quentin.schulz@cherry.de>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin
 Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v10 1/4] dt-bindings: net: Add support for
 Spacemit K3 dwmac
Message-ID: <20260316202147.431d9aeb@kernel.org>
In-Reply-To: <20260316010041.164360-2-inochiama@gmail.com>
References: <20260316010041.164360-1-inochiama@gmail.com>
	<20260316010041.164360-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_202150_626987_FFB9EE67 
X-CRM114-Status: UNSURE (   9.49  )
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

On Mon, 16 Mar 2026 09:00:37 +0800 Inochi Amaoto wrote:
> The GMAC IP on Spacemit K3 is almost a standard Synopsys DesignWare
> MAC (version 5.40a) with some extra clock.
> 
> Add necessary compatible string for this device.

In the previous version the AI reviewer complained that we're not
adding the new entry to the select at the top of the file. Other
compatibles appear in 3 places in
Documentation/devicetree/bindings/net/snps,dwmac.yaml

Also I asked whether we can drop the "default m"

Did you disagree with those comments or did you miss them?
stmmac is a strange beast I don't really know what's going on in 
the binding, so just double checking this is intentional.. 

