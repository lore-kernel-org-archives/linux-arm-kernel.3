Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4B31067055
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 15:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3iW59Rq94iMJ0of46dXFu361mU75QK0Mi9ODqjR2rE=; b=ucx9+rPDuyDWbQodtwJljrooZR
	frh9j5HTkqrqFKuRK6i51RF/Mpab+JNLzs6FjfQznhdBQTYp2Os1rHhh9P82AF7KvjSOPVK9kZdSs
	aqvw+O+gsPd4TjjosyH2Aisg2HN+YWU7hnsd0rWFtxQrEF2Ahdh11PmGKLG7P+WnZqTXvuVk4MW5v
	9WyeDzkb4utPYe5pfHWYjcYxEfihOqVMgnx46/uzF3PRk+1bWnEYatFbzGabYcO/7klvaSCGnEtd1
	iK6BsNhi4FgVeA/o1C/t0FsY4V0w52oirKZVRDX5HRMTOpFkLZIU6ZpzZ+cIRDf+QudeE7TSk9TQ6
	GHuGeS9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0i7i-0000000EPW7-2o8X;
	Thu, 12 Mar 2026 15:38:54 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0i7c-0000000EPUE-3VS9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 15:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=A3iW59Rq94iMJ0of46dXFu361mU75QK0Mi9ODqjR2rE=; b=kiz7YYbC8J/DCCvncsRKf4mUhS
	YnOhX1MP9MRh5bXbzFZTGuyZ3abw+P/61Opku+Wnh4WcK2hhCpHGjX+sCLYt7fCvc0yYIUor8BsWK
	FZlFQCmoryGsbc/+voxkq/L5nIVyOSKj5ZAAdJ5VeYCjeckbIeoLrXMRCFIbkZcacJ2w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w0i7O-00BLJS-M4; Thu, 12 Mar 2026 16:38:34 +0100
Date: Thu, 12 Mar 2026 16:38:34 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: phy: Handle PHY reset during initial PHY
 ID read
Message-ID: <eb4bb781-18a3-4d72-8118-1c86eba9997f@lunn.ch>
References: <20260302144458.3180702-1-wens@kernel.org>
 <5f8e32e1-c73c-4a3f-a1ff-21b78f764bfd@lunn.ch>
 <CAGb2v66MY02xvA_Mvt=6O001XEgz1AVH6ePorPvNtL0s8=W8rw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGb2v66MY02xvA_Mvt=6O001XEgz1AVH6ePorPvNtL0s8=W8rw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_083848_873596_14B42B97 
X-CRM114-Status: GOOD (  12.06  )
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

> I agree it's not just a MDIO/PHY problem. I am looking into it for all
> the common enumerable bus types.

Great.

> We already have the power sequencing framework (drivers/power/sequencing).
> So instead of the open coded reset GPIO I did in this patch, it would
> just be calls to pwrseq_get() and pwrseq_power_on(). I would need to
> figure out how to actually work them into the MDIO subsystem, and also
> how to model a generic PHY power sequencing provider. But the recent
> M.2 slot work [1] provides some good examples.

You need to be careful with "generic PHY". That generally means
drivers/phy and the config symbol GENERIC_PHY. Ethernet PHYs have been
around a long time, so PHY generally means Ethernet PHY. But
"recently", devices with SERDES interfaces, PCIe, SATA, USB, Ethernet
PCS have a 'phy' which needs configuring, so we gained the Generic PHY
subsystem. And we gained the confusion of PHY vs Generic PHY.

> Does that sound more acceptable?

Yes it does.

Thanks
	Andrew

