Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31E2106FD66
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 02:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eVYTEjXHAKaLJ8SqH3MmyoWpK711OH2o7ARIQ3NXxpc=; b=mYsBt/ML1yq1JgLfnx5H2opKrn
	+DlCYVM9iQbyMGE1rAQYjX3rqxsTWuvTB80Wdqq9ThsMeQmqxAGu477RsGlIi3fCxmAX8iKwW+hrG
	UYHwUZRXIuCs9qYNw/IFdQk0QNot8bGfK8g7OYB7jx2GmmP7Wq6DyvKYMYxmtDeujP/3IY/CaUcbs
	JlgCqruYdftJFFO+BuBrciewwY3sN8K8fvCQOWFHcrMk3/Ijz/PKfK79EoRFUXDd1hmi3x86DuiFZ
	SGjFR6GemLe+yt/FhLP8Xc0BAGFUAegYNIxMDKIvSXPy4rJrQ6zOAxzHLhvrbSvpX2HiKFEvdCetS
	Gpi/E5rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0sPu-0000000GGVe-1Z6c;
	Fri, 13 Mar 2026 02:38:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0sPs-0000000GGUU-3bhJ;
	Fri, 13 Mar 2026 02:38:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eVYTEjXHAKaLJ8SqH3MmyoWpK711OH2o7ARIQ3NXxpc=; b=EyM09x1Q3RYJ/eIMhP1vyArLD9
	YYqt0NW0kwljlmxPCpd4MlvUPjPDnyP/DqohujK2mgM/rH7P1e52Fr1N7Qt+EXSmUxCpRUDLcWh+k
	2xNVqEX+HZDxqEy3HuT1/wAXT6y3SUUazJd3q8oSVtgY3Pl4qAEcalzO1dYUqdZyjkKL3tdTjtpNi
	aaC7C3VIwgaPxpuPZ6Olu22uXyha+NULE/XAzYZ632TiSPvT7KSfBv+f1Ynq22GzUa8LguNwOoyxx
	ZzZYWJ7WVtJJEGRAwcx7NP5G+NUoJwpxqaDN2gB/UaweWw4dwSi9NchJLwLmOxA/qUv3Pxi7q/uzU
	YWQDdXrA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0sPi-00000002TEV-1XCx;
	Fri, 13 Mar 2026 02:38:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B8B2409CF;
	Fri, 13 Mar 2026 02:38:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268FAC116C6;
	Fri, 13 Mar 2026 02:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773369483;
	bh=cXgUEDCxpb0VJM5NocwDb3y+egwZEcpfq0JderV9xYo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HZmGErkudO/UsvBnemx/cgWFLZAevqTXjslEtTDHabT3yxPJIFMTX6Q7ygD4VcNO9
	 d4ZrG9RBHupYbJglUOLEKhH2YmSgDCHSN2QxcrTxkBrQtKlHbhRQScs+xcc4HNr1O2
	 vFJOmjJnM5rvMY6e8TZt1hNTI4L3NKSELZNOW8mYvwSkU0Aeaz3X3qWVskEfm1g34d
	 9b+hsVvMuRKOnBDLs0BqDCDLy9059cwWrfQQ+eHylhVGC1K5uzQo76MwefIGxnnJkK
	 D1YY8jw3tzyoHrpIBmdtMloiXb1A+qepUI/C4U8QK4TVdj0CQnqkfoOboUxvVi6aJ+
	 byWPAXlZ+c2QQ==
Date: Thu, 12 Mar 2026 19:38:01 -0700
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
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>, Shangjuan
 Wei <weishangjuan@eswincomputing.com>, Boon Khai Ng
 <boon.khai.ng@altera.com>, Quentin Schulz <quentin.schulz@cherry.de>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu
 <joabreu@synopsys.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin
 Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v9 3/4] net: stmmac: Add glue layer for
 Spacemit K3 SoC
Message-ID: <20260312193801.61c30de4@kernel.org>
In-Reply-To: <20260312012232.373713-4-inochiama@gmail.com>
References: <20260312012232.373713-1-inochiama@gmail.com>
	<20260312012232.373713-4-inochiama@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_023810_964856_51605AB6 
X-CRM114-Status: UNSURE (   8.88  )
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

Some nit picks only to be addressed in case the AI complaint on patch 1
is legit..

On Thu, 12 Mar 2026 09:22:25 +0800 Inochi Amaoto wrote:
> +config DWMAC_SPACEMIT
> +	tristate "Spacemit dwmac support"
> +	depends on OF && (ARCH_SPACEMIT || COMPILE_TEST)
> +	select MFD_SYSCON
> +	default m if ARCH_SPACEMIT

I know other STMMAC sub-drivers do it but isn't the defconfig for 
the platform the right place to add this sort of default?

> +	apmu = syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node,
> +						    "spacemit,apmu", 2,
> +						    offset);
> +	if (IS_ERR(apmu))
> +		return dev_err_probe(dev, PTR_ERR(apmu),
> +				"Failed to get apmu regmap\n");

looks mis-aligned 

