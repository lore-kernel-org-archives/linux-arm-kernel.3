Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A7CD5CC9A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 11:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eqlPk3VbpPRo0CwoqYeA+mkYbzA2YumBxWU5LsG9F6I=; b=bfx3gw9blsudyl4yDscRbpu+hy
	/0dXqDuaTwjD4S2TqjeYOLl2uZt5bIrP3sEgfjGeQwkJzjYs4HmA69yfY2j0UW3EQJ9THc7n58axr
	uBfPgygdQM4fjN4mIalHm+7nnCaRFxMbGb7baT+50Zu3P0koEIpFLOlA97D1xDL6Vi6mQ2BjoLTah
	SK3WiZOiDkSzrPri+Wjd60gX+nUN5Jfhko7zrsu+unnIoMgF2ZwDj37fRSp0ENDVtwffMbBtkoXPf
	irTocBGIwJx/OE7dfhfbcFs8Huwu425UUbWwjKgPOcIgpQYKyYvlxpJdi7nnDnlrkJIBj9qf+D2IX
	qefhViLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t676p-00000000Bt7-25fs;
	Wed, 30 Oct 2024 11:43:31 +0000
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t66lH-0000000074Y-0SPS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 11:21:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1730287242; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=LmkKYPnwFayGvNkyNGGwfTRPC30WQtV7XVBUPB46vNmTh2YUIvWSJJ3KTu2oXkPWg9
    TQbPRw+CLNAPa0Z7npruX/zRsusDgjrQcxVYqaXL1tWDY0p0sPl4NanMz6fAvfJwXe0C
    KUTGNayfcIHxeQdwzQQNOgzJeYObE27j9ZsBWz+uD6Y2Y1SXVK6poG3pWVPb9UBS+Lpq
    ZY6FWCXj8CRkxAPQ0hy9izvHRDQHsAbqV0qN42ks+wvHybgBmSqh/AeZMoWYtCI9Gz6G
    1y4yrzpMopQETTqMY0Mxiz11hVl9yX1KHPVKmF5HDZjGUjVIXHIMb9XdRO9VyX2FtZiz
    t+4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1730287242;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=eqlPk3VbpPRo0CwoqYeA+mkYbzA2YumBxWU5LsG9F6I=;
    b=NBtam4dkLBq0eRjr70Gb2zRoQxURDptQp8EQT8w2lNfmJwaBkuPlKa3n7hWODPdPbZ
    FnqxBLOVgQ3ShuH1k2YPGkCtQLYByn2RTQtK7jD4INLIv8sW2nZ/o3NeifENIlDSaMMx
    d82ZPsfucbBpQqv4zpUQ1+mdVvj5fU6bzSo8QLJDeqSabiZE5eaOXZra5VEXX/o5Kyq5
    YrYYJClbQ7ogLI90U5CJ+rv+EFiuG0n7HKNxb01XNoLtaoR3cnQmZYnsr619eMSG1xfF
    JEUXjSPkNi2sZogTYpzoSgq2vsP57WccPFgOjkVlq3suIrdqAN9M3f5uH8pgwaBH4y2v
    UJ6g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1730287242;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=eqlPk3VbpPRo0CwoqYeA+mkYbzA2YumBxWU5LsG9F6I=;
    b=Qn5HcpE+a9FbmOVJItB3kUbL0rgA+G2bddmVOCUSfLabE3qcPoE/Gr1J9tmmmwkpXP
    v+o/GQkMBWuT8Wfq7YnXCqz4rQVVRL3f9l37pJCIvRpztlo/onzPjuxFWry40nFSRjwB
    MhWu9ocxBgpDeJumK6dRUxer6tRSKk+W7tRKKChQahmiAp5hSGZUbTxtvmcyNzFFsmZ6
    utC+bVhy3TrZDGsq6ycE56w+vq2vOQiD2DM4LuU3HQGsD71FT1ynBj5tOEnhe5UyM0K9
    3x2IYcBYfJPW5VkHrWzEHhcXtB09Px13+ndbiChmRWnbGZTGHkGYV01z+qlHnRV4sbK2
    1vyA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1730287242;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=eqlPk3VbpPRo0CwoqYeA+mkYbzA2YumBxWU5LsG9F6I=;
    b=6UZADULYg4bR6wpt3xghzPOnsSR2uVqfNG6++6FbYSlefN4k43O5NvtlftKYmzEquZ
    b3Mh5+sSFIUqA5xMIgBg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrSiJpeyMiNH8TaiW2pBcBKxu1ib9gQlpMMsbZm"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.11 AUTH)
    with ESMTPSA id Qb7e4009UBKgS5B
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Wed, 30 Oct 2024 12:20:42 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH 0/4] Fix omap-iommu bitrot
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <ZyIClriScBy4s6LX@8bytes.org>
Date: Wed, 30 Oct 2024 12:20:31 +0100
Cc: Robin Murphy <robin.murphy@arm.com>,
 will@kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 mchehab@kernel.org,
 andersson@kernel.org,
 mathieu.poirier@linaro.org,
 Beleswar Padhi <b-padhi@ti.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 iommu@lists.linux.dev,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-media@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <515D7932-3939-4C3E-BA3E-CC3152E64749@goldelico.com>
References: <cover.1730136799.git.robin.murphy@arm.com>
 <ZyIClriScBy4s6LX@8bytes.org>
To: Joerg Roedel <joro@8bytes.org>
X-Mailer: Apple Mail (2.3776.700.51.11.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_042115_631406_73D40392 
X-CRM114-Status: GOOD (  12.95  )
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



> Am 30.10.2024 um 10:55 schrieb Joerg Roedel <joro@8bytes.org>:
>=20
> On Mon, Oct 28, 2024 at 05:58:34PM +0000, Robin Murphy wrote:
>> It seems omap-iommu hasn't had enough mainline users to avoid =
bitrotting
>> through the more recent evolution of the IOMMU API internals. These
>> patches attempt to bring it and its consumers sufficiently up-to-date
>> to work again, in a manner that's hopefully backportable. This is
>> largely all written by inspection, but I have managed to lightly boot
>> test patch #3 on an OMAP4 Pandaboard to confirm iommu_probe_device()
>> working again.
>=20
> My initial reflex would have been to just wipe the omap drivers,

Why that? There was a discussion and everyone agreed to remove omap2,
but not omap3 and later.

> hardware is 10+ years out of production, no? So who is still using =
this
> hardware with recent kernels for other purposes than kernel testing?

There are some devices besides the PandaBoard. I am aware of these where
this is relevant: Epson BT200, Samsung Galaxy Tab 2, Pyra Handheld
(in production) and we are currently thinking about producing a tiny =
series
of the DM3730 based GTA04A5 with spare parts.

And of course we want to participate from the latest and greatest =
upstream changes.

>=20
>> This supersedes my previous patch[1]. Patches #1 and #2 are =
functionally
>> independent, and can be applied directly to their respective trees if
>> preferred.
>=20
> I applied patches 3 and 4 to the ti/omap branch.

Thanks,
Nikolaus


