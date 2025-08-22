Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CD0CA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 08:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2IEjcATmZpSD2ir9CJuLBpahYky8S7Kv1XpSSpNmgY=; b=z/6W889EAzk/uzv+RvgJn9v5Dt
	lFCrHqB85gWFai0htEmClCJIujEO3NWQ8gCUbjA1JtUUwT7M4SJXqozJGtcCliBmnIb8LKyVHTAJc
	QOj+Inc3+oPinlRuWUyf8CxWA8k3hGLVsYHall/4oiDLMRauzQCffEN3oym4cm6QpIs0GBkKM0cWU
	qWDoSZUnO1LsSDsrVtt68y+DGsHK+daj+nvNWDLw+0DwRlZKEva+q/MILsMgHPW5oAtdWlRfC8y2V
	Xw1oC7gKYXHF7TPJIEZFQjzbF5VP2DRtVmcbumD/eslXaGdm45Jx1H1wPf1uXYhC07esbOfNcLiQ9
	fpShfRuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjTN-00000004Kcg-1qaf;
	Sat, 23 Aug 2025 08:19:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upXdS-00000003OQO-1s4T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 19:41:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C5F8544C39;
	Fri, 22 Aug 2025 19:41:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D118C4CEED;
	Fri, 22 Aug 2025 19:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755891673;
	bh=wnhJq56I7lMIJYREykBLr5qAtnaHGCueson7w3C/oLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=abcpVINMN7hAw4gMuShkqK4UrCQv1uKT0Wyrl3U7OP9WjTQRFns6EWed77LhxeE15
	 vbyfM4XOx6kEaZln9hMTveq01+2/6VmegTjOUy+RIBNZhlvAKw0flOkK9tHxn4CRZL
	 xHO5iUy+/55RWm8DAuzfqLdO7PIvONvlPV9B7JKKqGP7hi6pvAKn6K35Kj2N3rPgZO
	 5dtfyWJB3KbmeUiNNb7shnYSxcPGUYEtRh4r0PYasdps7gsPgQbnLimyGXXgt+t3r7
	 v7CVb6AEMm/sqGn59ePp0rbTFFkl5qPDQ7Lm5+YuVQcw04LbB29GZuUqCztnVMictT
	 cPHO4/Z5VSpjQ==
Date: Fri, 22 Aug 2025 14:41:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ravi Patel <ravi.patel@samsung.com>
Cc: pjsin865@coasia.com, inbaraj.e@samsung.com, s.nawrocki@samsung.com,
	linux-clk@vger.kernel.org, hrishikesh.d@samsung.com,
	pankaj.dubey@samsung.com, cw00.choi@samsung.com,
	jesper.nilsson@axis.com, tomasz.figa@gmail.com,
	shradha.t@samsung.com, sboyd@kernel.org, alim.akhtar@samsung.com,
	swathi.ks@samsung.com, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	mingyoungbo@coasia.com, linux-kernel@vger.kernel.org, arnd@arndb.de,
	soc@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	conor+dt@kernel.org, krzk@kernel.org, hgkim05@coasia.com,
	linux-arm-kernel@axis.com, linux-gpio@vger.kernel.org,
	smn1196@coasia.com, gwk1013@coasia.com, hypmean.kim@samsung.com,
	kenkim@coasia.com, linus.walleij@linaro.org,
	catalin.marinas@arm.com, will@kernel.org, dj76.yang@samsung.com,
	ksk4725@coasia.com, mturquette@baylibre.com
Subject: Re: [PATCH v2 06/10] dt-bindings: arm: Convert Axis board/soc
 bindings to json-schema
Message-ID: <175589167241.193457.14325190564820337424.robh@kernel.org>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
 <20250821123310.94089-1-ravi.patel@samsung.com>
 <CGME20250821124045epcas5p37f0a50fb18e6f468a7c57ab406795419@epcas5p3.samsung.com>
 <20250821123310.94089-7-ravi.patel@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821123310.94089-7-ravi.patel@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_124114_504430_C559DE37 
X-CRM114-Status: UNSURE (   8.99  )
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


On Thu, 21 Aug 2025 18:02:50 +0530, Ravi Patel wrote:
> Convert Axis SoC bindings to DT schema format using json-schema.
> Existing bindings supports ARTPEC-6 SoC and board.
> 
> Signed-off-by: SungMin Park <smn1196@coasia.com>
> Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
> Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
> ---
>  .../devicetree/bindings/arm/axis.txt          | 13 ---------
>  .../devicetree/bindings/arm/axis.yaml         | 29 +++++++++++++++++++
>  2 files changed, 29 insertions(+), 13 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/axis.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/axis.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


