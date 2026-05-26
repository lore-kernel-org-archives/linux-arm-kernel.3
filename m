Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB605CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 12:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3YbZlqd0BBc0X5BDowSBVCyi9Ei0k9dPDQCq9TAzo7s=; b=21J9zDlf32VsUur5Y8xjn8GEnq
	kW5ULScKsi8d7w322zvy+jT+l7tOHgHKXvD+DYXPZUD5cePX3sqFc0VpVqnTOEJsMrHF+sJye7Kkv
	nhWhkJAarhwmbYIG+KHcWbwTe/mZTZRIKzCvOFVSyS2o5LeHC9+zkOzArvUoCJYoLRqf68ln7bGRc
	52vELbt6Iwqv7NiaDRv2eFdEWpsMLZczynOOnllz0Eu491ygXbVYlCNrdnCqZv3pQN7JRyR84Hc4q
	FRfS+2twQ3R0GZlGXrCNHD6AlKEO7MdDWml/ncudvsYsRHXujkJ9dqTLh7mFPpRlS7d08NLX3ll7f
	1DUthKlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpoW-00000001llM-28hp;
	Tue, 26 May 2026 11:19:12 +0000
Received: from mailout3.hostsharing.net ([144.76.133.104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpoC-00000001lUi-2dz4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 11:18:57 +0000
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by mailout3.hostsharing.net (Postfix) with ESMTPS id 463BFC93;
	Tue, 26 May 2026 13:10:39 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 1E2B36109E4F; Tue, 26 May 2026 13:10:39 +0200 (CEST)
Date: Tue, 26 May 2026 13:10:39 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczy??ski <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Kevin Xie <kevin.xie@starfivetech.com>, Aksh Garg <a-garg7@ti.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v5 2/4] PCI: Use standard wait times for PCIe link
 monitoring
Message-ID: <ahV_r6NJWnmJptT2@wunner.de>
References: <20260526-tegra264-pcie-v5-0-84a813b979d7@nvidia.com>
 <20260526-tegra264-pcie-v5-2-84a813b979d7@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-tegra264-pcie-v5-2-84a813b979d7@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_041853_716163_CD9AA44F 
X-CRM114-Status: GOOD (  13.57  )
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

On Tue, May 26, 2026 at 10:53:11AM +0200, Thierry Reding wrote:
> Instead of defining the wait values for each driver, use common values
> defined in the core pci.h header file. Note that most drivers don't use
> the millisecond waits, but rather usleep_range(), so add these commonly
> used values to the header so that all drivers can use them.

Hm, why not just replace usleep_range() with msleep() and use the existing
macro instead of defining new ones?

> +++ b/drivers/pci/pci.h
> @@ -63,6 +63,8 @@ struct pcie_tlp_log;
>  /* Parameters for the waiting for link up routine */
>  #define PCIE_LINK_WAIT_MAX_RETRIES	10
>  #define PCIE_LINK_WAIT_SLEEP_MS		90
> +#define PCIE_LINK_WAIT_US_MIN		90000
> +#define PCIE_LINK_WAIT_US_MAX		100000

If you absolutely positively want to add a new macro, consider
90 * USEC_PER_MSEC instead of 90000.  Moreover, consider using
fsleep() instead of adding an additional MAX macro.

Thanks,

Lukas

