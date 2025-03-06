Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E229C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 07:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0fa0jpFVGys+Af7ZQ3I/qoj7WI0GjkMs0NhFI0S68Ys=; b=KvGyWXXD6Ytg11s4dNIdXwxh/y
	yp0hMOSK865WbOq8O9MkVxnAETTXlMXUArPTnAX/Y6GhOTGBO+nezN+QsRlMkyaSk/97vB+gO/NQp
	4oVtwbguvXx2zF2dlqIfL3oUzXX5GfbCg/jf8qc7ErLW5rXDsgddpBA//8TbbOBtVV3C1gef9vPNI
	142hR+sHrcaMGHv+Sfa4PG8I3LG+nvSIHEKvE0RoE4OGm24PfAUNf+WFL/NVVYcQMUT5OuHYaeWXe
	Zt6Jqp6WnGPHIioyGySwP4/A0V4ohr3C4rEi7Y1BCqY/dqrSPOVkEu3c9v2tYqjKWOJloQ7XiYXT5
	BB3l3F8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq5WW-0000000ACHB-3agw;
	Thu, 06 Mar 2025 07:20:04 +0000
Received: from fgw20-7.mail.saunalahti.fi ([62.142.5.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq5SN-0000000ABrI-00hN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 07:15:48 +0000
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id cef8990e-fa5a-11ef-8397-005056bdd08f;
	Thu, 06 Mar 2025 09:15:42 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 6 Mar 2025 09:15:39 +0200
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: Simon Horman <horms@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	David E Box <david.e.box@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	David E Box <david.e.box@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Serge Semin <fancer.lancer@gmail.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v9 5/6] net: stmmac: configure SerDes according
 to the interface mode
Message-ID: <Z8lLm9Ze9VAx3cE_@surfacebook.localdomain>
References: <20250227121522.1802832-1-yong.liang.choong@linux.intel.com>
 <20250227121522.1802832-6-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227121522.1802832-6-yong.liang.choong@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_231547_216829_17130BCC 
X-CRM114-Status: GOOD (  13.36  )
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

Thu, Feb 27, 2025 at 08:15:21PM +0800, Choong Yong Liang kirjoitti:
> Intel platform will configure the SerDes through PMC API based on the
> provided interface mode.

> This patch adds several new functions below:-
> - intel_tsn_lane_is_available(): This new function reads FIA lane
>   ownership registers and common lane registers through IPC commands
>   to know which lane the mGbE port is assigned to.
> - intel_mac_finish(): To configure the SerDes based on the assigned
>   lane and latest interface mode, it sends IPC command to the PMC through
>   PMC driver/API. The PMC acts as a proxy for R/W on behalf of the driver.
> - intel_set_reg_access(): Set the register access to the available TSN
>   interface.

...

> config DWMAC_INTEL

>  	default X86
>  	depends on X86 && STMMAC_ETH && PCI
>  	depends on COMMON_CLK
> +	depends on ACPI

Stray and unexplained change. Please, fix it. We don't need the dependencies
which are not realised in the compile time.

-- 
With Best Regards,
Andy Shevchenko



