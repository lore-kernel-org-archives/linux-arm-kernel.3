Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB1DD43363
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 06:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NSbzMD0hLhCiTs05CoSSKYQBdIqRUhE17GYjADgTfWI=; b=wEEpLZvKLz9GRiDtCtKKX1k7Fi
	mlQyL2ExWReftE4JeKw1DHjyefFRpqqXHt3LGW9BPciIHASuoHYxbvU6w2jk/q3azb+7Jn5qDgF11
	IdsxGn58AtXo1yJZRlntSk3uH7Jw/OXmR/gtg6LuYFc3OvAzsmeUNHIkfEobmu2YnU2P0gcJCAg3Q
	kPbHFRFk7hjz2mCoxGbrUOl001/8K4atiuSh+8NwYfzKMXSovHOfnTyCPLomnoeU92Fw8RV5hzklv
	U0PG0ykZ4iQeLsFLpmKhhuYX4y81AajqMGsvEus5Jxjw0KuWVPsU3zCTi4OK8ILdkOpmryHrtXxtk
	BuSmlsuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTwmU-00000000AGj-0p8W;
	Fri, 12 Dec 2025 06:37:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTwmT-00000000AGU-1CrW;
	Fri, 12 Dec 2025 06:37:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E907600C3;
	Fri, 12 Dec 2025 06:37:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26324C4CEF1;
	Fri, 12 Dec 2025 06:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765521452;
	bh=CljOmxvU25QjtRs5y/lM3NXwAA/cz01Tq61VK0RzWJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rM/JbITFT/eEnaHoT230alIn2hsNTXGJZwHNJwtCMLun+SxiLGLBFOdCqoa3J3HRv
	 ZY/jzHbrgVujYTvzIXx6ufU/jFkLa2zM9b2F01TJS4oUTtP9oA1Z3DrFqU9mHtAZ24
	 3F/m5RaWoppfzzfX+MtQJAhDh1D+vtU20Jvh3Lc1nNwWKf9tiCCM3aO27GOEcu+8ZB
	 6CVeteThfOkNiSr0fBO0m4ZFXiNLghPkFxkISAWRzQgaefi+O0zxoMB84S/zGFjzsQ
	 GSvMgwaAkOB0LU8igwAsLXoyCUyvBs3+dqvwTLOHM+mAdZuAiD/R2RyiMAY23F+/4P
	 A7PTw78NB7NJQ==
Date: Fri, 12 Dec 2025 15:37:26 +0900
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] PCI: dwc: Make Link Up IRQ logic handle already
 powered on PCIe switches
Message-ID: <aTu4JgDcfb_58qBK@fedora>
References: <20251201063634.4115762-2-cassel@kernel.org>
 <f1059d5d-3fa5-423a-8093-0e99b65d5f4c@oss.qualcomm.com>
 <aTev28wihes6iJqs@dhcp-10-89-81-223>
 <dad4957c-ca13-4742-b46d-03f0478911d5@oss.qualcomm.com>
 <aTe1bA7lcVzFD5L7@dhcp-10-89-81-223>
 <pjn2gs43rqbe3odh6zvh4qaftxxl6qvdzpm6pgpadxeeid42ko@4a2qradscaqd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pjn2gs43rqbe3odh6zvh4qaftxxl6qvdzpm6pgpadxeeid42ko@4a2qradscaqd>
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

Hello Mani,

On Fri, Dec 12, 2025 at 12:52:35PM +0900, Manivannan Sadhasivam wrote:
> > This patch missed the v6.19 merge window (and so did the pwrctrl rework
> > series), so as long as Mani queues up both for v6.20 (with the pwrctrl
> > rework series getting applied first), I think we are good.
> > 
> 
> The plan is to merge pwrctrl series to v6.20 (unless we get strong objections),
> but once that happens, Qcom doesn't need this patch.
> 
> So it'd be good if you can just limit this patch to just Rockchip. Then once the
> Rockchip also moves to pwrctrl, we can revert this patch (also the whole IRQ
> based link up since the Root Port is not hotplug capable).

The main reason why I did not like a revert, was because it would remove
the nice feature where the bus is enumerated automatically on link up.

I assumed that the plan was to add Link Up IRQ support in pwrctrl in the
future.

If that is not the case, and the plan is instead to eventually remove the
existing Link Up IRQ support, then perhaps you could simply apply patches
from:
https://lore.kernel.org/linux-pci/20251111105100.869997-8-cassel@kernel.org/

Either the whole series or just patch 1 and 2, maintainer's choice :)


Kind regards,
Niklas

