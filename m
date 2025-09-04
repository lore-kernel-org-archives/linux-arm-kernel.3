Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496AFCA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U08NYMB1Ad3w11Zr/tff+obhn58+XapkrwB6JYyUlOQ=; b=nyHBv/9ZcgHChMZTW/R65+qo7N
	DX6v3oDW4H3gZDwg504zHv779ZIXWv6vPH+mO3Xv9dCG0yK9/Lib8gwrVWo3Fm5Tc7bBgP0mkKqF+
	5hQBhbiw2HCOcHnLcB1CQ5v+FSpSEDZlEYQtXt6uRHNuwYtBiceZv+jcw7PHtVAAKiRxVoL/YSNUS
	JfIAR+VVDZL8EVWIPAW+Fk5QHV5VQ6lOu/+xv/DCeXh2YmJALJk6zCV0i41q6FD7okbLARKQgaKEY
	XWCY6K6CL+m3nHiCy/y60RTVow7Ses1lSViGHRVrgoUnjred1PwLydoeDyLK8Uk+a1nvgvgK8EoEX
	8oAAnZmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCnj-0000000CuHE-23bq;
	Thu, 04 Sep 2025 16:27:07 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9up-0000000Bqq0-0znb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 13:22:16 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 584DLq1c3475583;
	Thu, 4 Sep 2025 08:21:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756992112;
	bh=U08NYMB1Ad3w11Zr/tff+obhn58+XapkrwB6JYyUlOQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=qx9+Mquj3rYrleoQ5Kt01Zx16auOkcL4QsMwyXUqtS8V65ryb7uQcLYZ6NN2Po14a
	 zk2IlaNZz+frBQJdjJFSjZ10dfZAISqt3Un2A1DZ6MzUWJV0zduAE2kTTUJStPaXyI
	 uTpNokX8C7DVyJjdDwkPRx/BkeFFH8G7SPvPNWP8=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 584DLqto3833851
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 4 Sep 2025 08:21:52 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 4
 Sep 2025 08:21:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 4 Sep 2025 08:21:52 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 584DLotj3313729;
	Thu, 4 Sep 2025 08:21:51 -0500
Date: Thu, 4 Sep 2025 18:51:50 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Guillaume La Roque <glaroque@baylibre.com>
CC: Thomas Gleixner <tglx@linutronix.de>, <vigneshr@ti.com>,
        Nishanth Menon
	<nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
        Tero Kristo
	<kristo@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH RESEND v2 1/2] genirq/msi: Export functions to support TI
 SCI INTA MSI module
Message-ID: <20250904132150.vs4tzkigqowzqtzn@lcpd911>
References: <20250902-timsi-v2-0-a5bf0f32905b@baylibre.com>
 <20250902-timsi-v2-1-a5bf0f32905b@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250902-timsi-v2-1-a5bf0f32905b@baylibre.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_062215_317772_9146424D 
X-CRM114-Status: GOOD (  11.09  )
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

On Sep 02, 2025 at 16:43:49 +0200, Guillaume La Roque wrote:
> Export MSI domain management functions to allow the TI SCI INTA MSI
> driver to be compiled as a module.
> 
> The following functions are now available for module use:
> 
> - msi_domain_insert_msi_desc()
> - msi_domain_free_msi_descs_range()
> - msi_setup_device_data()
> - msi_create_irq_domain()
> - msi_domain_alloc_irqs_all_locked()
> 
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---

Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

