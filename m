Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88D8CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 08:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D+Y6d8UnrGoNFXVY4j5x4i4B2RwDWSIwdnLaT7QqWYA=; b=ACa9Dr4pnciTw8PcxEi1T+YQQ4
	DrVbA6MHreLvPWVIeuJ1QMDXVhhPXF0QPYezNZt0xkXEJvBq62Wra28EIJ2gxvYZPe2BBifg/1eRR
	Bzz6/mdfeibmKu3apYIdqJof1B90WG+UncBWtJEIMaJ2f8i5J5F/VIlATrKnAHSXy1HkDLQREabRo
	WDDPKm6zHVTiX2hc6MK/ajThbw7Z1lJzLb9mVD5hijNnr4zAq56fL8iFmFArqi+Ju/VcGonvzaole
	61TZbtmfWxpsFzR5Dw0Pc56g1otB8QFXi4b+btlIzJ2dAaPT/09qcy9zrZg/wCWQz3H2wHFfWQDxC
	pZ/zD0xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdkP-0000000FpyR-2JMw;
	Mon, 05 Oct 2026 08:08:33 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdkN-0000000Fpxq-1AVA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 08:08:32 +0000
Received: from francesco-nb (93-33-55-11.ip43.fastwebnet.it [93.33.55.11])
	by mail11.truemail.it (Postfix) with ESMTPA id 384511FCC5;
	Mon,  5 Oct 2026 10:08:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1791187709;
	bh=D+Y6d8UnrGoNFXVY4j5x4i4B2RwDWSIwdnLaT7QqWYA=; h=From:To:Subject;
	b=pc46WDqn850L7lcIP9Fhgqz50KA3iyT13iys3P83fFFH2WP1JTTiUdlzjxtjMHvVV
	 HCtW83/A9eD1cpccAu9bCoFi7j0aSvw1PCz7wjrMaLb92gfV/RsN5zPJtscGFMubg9
	 /ZOsBaI0zujfilGLjnXmUYIQgnSpMRoEd8ewqvtkR2KzSYgmVqFDG/CjdDsBJ2Doeq
	 O2WWifHY6ZjZMBtZ+WMQLB8d9W7V6g+UOJ/VGVty3Ri5/ppfw9BGBiLUwBJK92vu0a
	 dRA0n3+jy7CbCP75Dk8d+Cuea+2T9TgZEVE/IxwCusznJrIDAZnnQrCsLH7SrmB55M
	 S/AfgUIpKsrjg==
Date: Mon, 5 Oct 2026 10:08:22 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Ivan T. Ivanov" <iivanov@suse.de>,
	Francesco Dolcini <francesco@dolcini.it>,
	Frank Li <frank.li@nxp.com>, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4] arm64: errata: Add NXP iMX8QM workaround for A53
 cache coherency issue
Message-ID: <20261005080822.GA13120@francesco-nb>
References: <20260824-imx8qm-cache-coherency-v4-v4-1-b2e528c7d05e@nxp.com>
 <aqleHm4stDi3Pt//@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqleHm4stDi3Pt//@shlinux89>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_010831_475003_B095EE2A 
X-CRM114-Status: GOOD (  10.26  )
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

Hello,

On Tue, Sep 15, 2026 at 11:02:54PM +0800, Peng Fan wrote:
> On Mon, Aug 24, 2026 at 12:02:04PM +0800, Peng Fan (OSS) wrote:
> >From: Peng Fan <peng.fan@nxp.com>
> >
> >According to NXP errata document IMX8_1N94W[1], the i.MX8QuadMax SoC
> >suffers from a cache coherency issue (ERR050104). The upper bits, above
> >bit 35, of the ARADDR and ACADDR buses within the Arm A53 subsystem
> >have been incorrectly connected. This causes some TLBI and IC
> >maintenance operations exchanged between the A53 and A72 core clusters
> >to be corrupted.
> >
> 
> Any comments?

Any plan to have this merged?

Francesco


