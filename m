Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0D5CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 16:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CSdeUl0+Wlj3wrQusnKRTtGq1C5jdr7eduitM3MGZgo=; b=HiJJWff1IcVFs1H0eSD9xf0UYM
	VTx4IrZSWvV4bwPOjkTl985d5UwQGPU7m28ra0XIeEGCtfcH63qmY7i9zkxtR3Zk5murrctjetMAR
	1HXcVysNUYZbcdDAf0JyOlsO0QOtg7mg0CIuM73qYyUHm5ykOAJjsHy7FkVOTkGz4a6YwpWO2Vdmf
	zCxDDTpug301BGPAjODJvV8Ix0Ix6gIBFkxLZdgBHcktukKtakBUs2LMjzEzLj1ajoqXE10BUS8jT
	d7S3U4T/D2U09ucWAFSF48KR+mdD5FtI8OcxnmWjtLiPBPIguUEsS2OJjk1mXvLbsrIsuaDTQUzw8
	QZOdAa5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6AXq-00000002P90-0I3e;
	Tue, 07 Oct 2025 16:28:10 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6AXm-00000002P8b-3lZz;
	Tue, 07 Oct 2025 16:28:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CSdeUl0+Wlj3wrQusnKRTtGq1C5jdr7eduitM3MGZgo=; b=zspHA+iWPxTcZTxT/Je2B4G6tw
	v534xoaaXgJXV7v2hC90Zwk4epC3hYCX3ntpzHLoS6snCOfo02fOfHMWw8lGqVd/V0iQjfqrfo9aL
	S0dtRxcKDb0X7AOyf14bE07Uf9IvbJsrcNnauB3jzCZSrvz142bz40vvhiUkiOy7ESb7t8EaexArE
	vl5J/TnKfxTKNnfJImi4I+X+4nLUXDwTydF0ccP/m15Khrii/uUE2dj/jKnj5Bz9xx4b+7yRWQ63o
	w7NCEmkPmM0sFRQHO56bXcVcX+jWImi2kDXUWcKQ+sdu9L0hlp1i//GhivJwMeWTjyWbX2eTamTtk
	PqFESXUA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53078)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v6AXV-000000005Li-4389;
	Tue, 07 Oct 2025 17:27:50 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v6AXU-0000000032l-0FFc;
	Tue, 07 Oct 2025 17:27:48 +0100
Date: Tue, 7 Oct 2025 17:27:47 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Diederik de Haas <didi.debian@cknow.org>
Cc: jjm2473 <jjm2473@gmail.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, heiko@sntech.de, quentin.schulz@cherry.de,
	kever.yang@rock-chips.com, naoki@radxa.com, honyuenkwun@gmail.com,
	inindev@gmail.com, ivan8215145640@gmail.com,
	neil.armstrong@linaro.org, mani@kernel.org, dsimic@manjaro.org,
	pbrobinson@gmail.com, alchark@gmail.com, jbx6244@gmail.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] arm64: dts: rockchip: introduce LinkEase EasePi R1
Message-ID: <aOU_g-47JEycc8ZV@shell.armlinux.org.uk>
References: <20250929065714.27741-1-jjm2473@gmail.com>
 <DD57IZJQ4FQM.3T5791FLUQ8KQ@cknow.org>
 <CAP_9mL6+uoeG7LX8YCcUFjoU13De1CdPFqxNNfoJvOdsOrYo5Q@mail.gmail.com>
 <DD63EEOKPWNV.3IK12D6CFPTQZ@cknow.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DD63EEOKPWNV.3IK12D6CFPTQZ@cknow.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_092806_935175_96AA698C 
X-CRM114-Status: GOOD (  17.47  )
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

On Tue, Sep 30, 2025 at 01:19:21PM +0200, Diederik de Haas wrote:
> On Mon Sep 29, 2025 at 8:09 PM CEST, jjm2473 wrote:
> > I have another question. If there are reviewers or co-authors later,
> > do I need to add it to the commit message and send it again?
> > Or should the reviewer or co-author add the message and
> > continue to deliver the patch?
> 
> When you get a Reviewed-by tag, you should add that tag too to a new
> version. But there's no need to send a new version to just add those
> tags, the tooling used by maintainers picks those up themselves.

The only exception to this is if something changes in the patch
after the reviewed-by tag has been given - because changes mean
that the changes haven't been reviewed.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

