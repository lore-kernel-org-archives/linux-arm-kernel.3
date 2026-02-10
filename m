Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9AEEB26F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 17:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DAcKfWlVvFpjnpX3kQn9TetvuG3kY2q/0ckoODgRSz8=; b=QvWLyPewlpj5KCvBZdZKBz3kUa
	EQHUsKEijFI5A2YzRc6humBcI/WAirCFSXTs1fCsI2/gSX3Mh3kuRst2f3r4tL3+q62JLWliaxx0b
	BbHU/3xTtXS7Qwlf+QSmvzccpUUbXuHjlpplmyCn3Hhl3svtU/SyQQfuv0ZN9Vl08xMTv6Ex38Szw
	Agwl3oS9ClqSWSLe0dT2GEEJJ5MQ+i7SU/Xl4enA5AES7Ez7pIAtjQKDmEj0TBPMj20cj5JlLG/CN
	KSgy62g+g8L7/y9HCMvvuNqNhoiVplyo6IBPBpV0GibccjU6E1b77UTSEV8uitlnnj4X6oOUXluMT
	U14W+22Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vprYD-0000000HMcV-1mGX;
	Tue, 10 Feb 2026 17:29:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vprYB-0000000HMc9-30aW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 17:29:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DAcKfWlVvFpjnpX3kQn9TetvuG3kY2q/0ckoODgRSz8=; b=lS8ZExtN/PJ9GM/RXNnUoJG8xu
	6BflzLkWMBbQhdzgpK+AV0vqxRBebBiUyfiu1SKrZKq0gxMvq/yfGWHJ58V4fIHc8e/uD0A/7Jq5f
	4lfO1aLUAJMDynrbTDZX7UShpk1ocV/xlbxN5Ncp4XBC8Ixw04ZXkOj7HJEVUbR80+dOjZne1sTKJ
	pDbP72WGuFcqTmncwm9RI8+6OtP9ZKl85doJvfuVOi+Jwqs/F1BskWyp0AGt5dVBnfDAK+NvN5MBC
	/SDZwjKf53yuDARAK6J/+9RKq2q3auogNniNAidjRbxw1a+ACOIscIzERYhkwtxE+t6NkAZLV4CaC
	8zegnKLg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49462)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vprXy-000000002oy-37Of;
	Tue, 10 Feb 2026 17:29:10 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vprXv-000000002xA-2Lqw;
	Tue, 10 Feb 2026 17:29:07 +0000
Date: Tue, 10 Feb 2026 17:29:07 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Florian Bezdeka <florian.bezdeka@siemens.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	Voon Weifeng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: stmmac: Use cpumask_local_spread() for
 IRQ spreading
Message-ID: <aYtq4ypxXTvn_Is6@shell.armlinux.org.uk>
References: <20260210-flo-net-stmmac-default-affinity-core-v1-0-4e76612444e1@siemens.com>
 <20260210-flo-net-stmmac-default-affinity-core-v1-2-4e76612444e1@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210-flo-net-stmmac-default-affinity-core-v1-2-4e76612444e1@siemens.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_092923_777918_890CA238 
X-CRM114-Status: GOOD (  13.08  )
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

On Tue, Feb 10, 2026 at 05:28:15PM +0100, Florian Bezdeka wrote:
> The stmmac driver was previously implementing a self-made IRQ
> spreading mechanism based on num_online_cpus(). By migrating to
> cpumask_local_spread() the spreading gets NUMA aware.
> 
> In addition, most drivers seem to use cpumask_local_spread(),
> aligning / harmonizing a bit more.

Oh great... sizeof(struct stmmac_priv) is already large at 880 bytes,
and adding 16 pointers or CPU mask arrays for PCI MSI adds another
128 bytes on top, whether _this_ stmmac device is PCI or not.

A better solution needs to be found. Please consider what can be done
to make MSI (a) generic to stmmac so it can live in stmmac_libpci.c,
and (b) avoid adding overhead to platforms that don't use MSI.

As an example of an improvement, the int_name_*[] strings are only
used for MSI interrupts, and each one uses over 16 bytes. I calculate
the entire usage to be 665 bytes just for these strings which are
only ever used for MSI.

With the addition of the cpumasks, we're looking at getting on for
800 bytes of this structure which are only used for MSI.

We can surely do better than this.


So, how about moving the int_name_* to its own separate struct::

struct stmmac_msi {
	/*irq_name */
	char int_name_mac[IFNAMSIZ + 9];
	... other int_name_* ...
	cpumask_var_t rx_affinity[MTL_MAX_RX_QUEUES];
	cpumask_var_t tx_affinity[MTL_MAX_TX_QUEUES];
};

and replace the existing with int_name* with a simple:

	struct stmmac_msi *msi;

This struct would only be allocated when we need it for
stmmac_request_irq_multi_msi(), and can be requested using devm in
stmmac_dvr_probe() only when required.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

