Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FB2C83F35
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tELAcnZVNd8b1stwXqZxFS8cE4bNgApGcuDGoeyxKzk=; b=2sflqJsy/Tbo1hx2pkvGtJQMF0
	xdHKY8Z8ZS+7gf4ZO0DbXdm0VP3DwyfyGbMTgxsEXabMq1XBrmdq/a5sAtuIXdX9MllqxZDWFURZt
	UmXbawO/7/dsfVj9eLanjUko2FI2W6k5d8FEYj9a21rCnp1xOyeuWhD2Q2cXa/cz+68uuml9oMQZj
	gEHs4ptEVC/N26N0VKKvMabHV7+ajZtkuwvwMvxxdcXk1kA77bHyTlzUgVSd7u/PVCY5BU4sPSNwZ
	GSxs1gJ4/fJsYLIlUJuqjQcZfAki2l5VHNazBxAi100orrrP4zNrybWScx7lAbm1b9KSXmKzJ/CLc
	WvkQK8xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubl6p-00000005xpl-0gpW;
	Tue, 15 Jul 2025 19:14:35 +0000
Received: from mail-ej1-f51.google.com ([209.85.218.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubgMd-00000005Jwu-2N9K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 14:10:36 +0000
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ae04d3d63e6so1070852866b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 07:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752588633; x=1753193433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tELAcnZVNd8b1stwXqZxFS8cE4bNgApGcuDGoeyxKzk=;
        b=GNHBCduuD65XBDfr3a1fhbEDI85Uq1mM8cLn94qG3lRS/TwNTMtUC340bAKnoGgGUg
         xNF7zAOzOyd6jC9EbxfV+HRtsrxFqbNURVqncOxVCwkioxU++I4CrV+Z6J1PsUMcX76t
         98G4dPlnS7S95qfN1J4i68dDwE1kYIJbztXhKqxdCWJtpzzCEWkvvgnPBAOzclu4YRC5
         H2Wl96/rgqva2kTejR7HbbQ5FQbUqHdCo2Y74RB5cg56mX961Xn3/9EMsVVzAZjuqTed
         wnX7cLlz5NRAUfhPAxykUn0PYIlCw84VWNa/AauOYA/4rNbTWax/hELlIchQB/JKRQ+d
         5l0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5zsyD6drI/D7gRROQnpoXsq2mcnQ7oL6pFqu+S/IUHkfPWRe1bE0mM8l58hRdrZOu3niWox1VBeShmDdmTAaq@lists.infradead.org
X-Gm-Message-State: AOJu0YxQmeapKIkTWKs+4Ga4GFe831uXVlUxtOgvvD4WNTzqsLsXItiH
	zqeFP+afYfDsYucCWfrI0LHP3guaRCNUfbdJ8AEgMbhAMIootMdt/6DH
X-Gm-Gg: ASbGnctWp86mypRrnjR5+OjW4FxmSZrVfBI00Z3DkY1sHXwMxYxxYroPyDKreCQsWok
	C6PEXHDxtoGF1RouZU29kFxQ8rZRcbVcPyPYmgFYvUkhv9v80i7BFGZyEjapdvBaKDwIVwbouu5
	FA3B9pVU2awRA3q5HXUS3QKJz2OdvV4gZQMIyzZsVWUq1d7wF5Ukkuke3KRoE2s/gilkpe1nEuc
	TKZ2Gsl5Oc46xCiZaDCsHyFvnY0caKMfawHM6MZVo/cDNQGJVsSMAOsYKC2DIGLqFnW7Cu+j37+
	aJGykI7TQo9Ipyllt4uwK77FbvgP3+5YyBvA2/UPFU0GFBI6qzTNFGq5lQ7r4IboroSETOglRLh
	aly7OrpHZTGjhVqelbABeAh+g
X-Google-Smtp-Source: AGHT+IEbyl1a/QSsIQLOHzGok9IQBsWgH6iuwWhFnpACxKR9fLabguJ1GjnLGBVzOQT1BEOKFXRITA==
X-Received: by 2002:a17:907:1b0b:b0:ae3:5e70:330d with SMTP id a640c23a62f3a-ae6fbc109bamr1654095266b.12.1752588632995;
        Tue, 15 Jul 2025 07:10:32 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:70::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7eeae5fsm1014433766b.64.2025.07.15.07.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 07:10:32 -0700 (PDT)
Date: Tue, 15 Jul 2025 07:10:29 -0700
From: Breno Leitao <leitao@debian.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Sascha Bischoff <sascha.bischoff@arm.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Timothy Hayes <timothy.hayes@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Peter Maydell <peter.maydell@linaro.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v7 18/31] arm64: smp: Support non-SGIs for IPIs
Message-ID: <7mhnql75p3l4vaeaipge6m76bw4wivskkpvzy5vx3she3wogk4@k62f5hzgx5wr>
References: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
 <20250703-gicv5-host-v7-18-12e71f1b3528@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-gicv5-host-v7-18-12e71f1b3528@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_071035_602099_E3518488 
X-CRM114-Status: GOOD (  16.43  )
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

Hello Lorenzo, Marc,

On Thu, Jul 03, 2025 at 12:25:08PM +0200, Lorenzo Pieralisi wrote:
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 3b3f6b56e733..2c501e917d38 100644

> @@ -1046,11 +1068,15 @@ static void ipi_setup(int cpu)
>  		return;
>  
>  	for (i = 0; i < nr_ipi; i++) {
> -		if (ipi_should_be_nmi(i)) {
> -			prepare_percpu_nmi(ipi_irq_base + i);
> -			enable_percpu_nmi(ipi_irq_base + i, 0);
> +		if (!percpu_ipi_descs) {
> +			if (ipi_should_be_nmi(i)) {
> +				prepare_percpu_nmi(ipi_irq_base + i);

I am testing linux-next on commit 0be23810e32e6d0 ("Add linux-next
specific files for 20250714") on a Grace (GiCv3), and I am getting
a bunch of those:

	[    0.007992] WARNING: kernel/irq/manage.c:2599 at prepare_percpu_nmi+0x178/0x1b0, CPU#2: swapper/2/0

	[    0.007996] pstate: 600003c9 (nZCv DAIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
	[    0.007997] pc : prepare_percpu_nmi (kernel/irq/manage.c:2599 (discriminator 1))
	[    0.007998] lr : prepare_percpu_nmi (kernel/irq/manage.c:2599 (discriminator 1))

	[    0.008011] Call trace:
	[    0.008011] prepare_percpu_nmi (kernel/irq/manage.c:2599 (discriminator 1)) (P)
	[    0.008012] ipi_setup (arch/arm64/kernel/smp.c:1057)
	[    0.008014] secondary_start_kernel (arch/arm64/kernel/smp.c:245)
	[    0.008016] __secondary_switched (arch/arm64/kernel/head.S:405)

I haven't bissected the problem to this patch specifically, but
I decided to share in case this is a known issue, given you are touching
this code.

I would be happy to bissect it, in case it doesn't ring a bell.

Thanks
--breno

