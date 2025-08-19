Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525AFCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 22:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:CC:To:Message-ID:Date:Content-Type:Content-Transfer-Encoding:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZKXiseSnpS0hEdhK0+cUyUK3qXOByXmJNN2AiTy/3Q=; b=qJuBj7W2rtrRUBLpbvdgc3b87H
	leuoUzl3/EliuNUJyhL7uvmeTLrV0yY0EFsLjM8eLXDKgwymD3ITg2JP1JOgViHOC0wTbGSWjTLkH
	pMeZ2uvbIHOERGyd5mIIH3PN+zFwVzGpX0WLXIZJzqjtVwJWGeGSue+neN2c/SQIYlZ7S81xLvYt0
	foR3POsxmWoiQZzs+jA0A078ShxotISvvpeDI7TvcWum/KFfu9TspQkY4CsoJvvrMdcT0FVCyTlcB
	Gg07zMueKjzhl0x5v5cT4UgYCc7Jp1vYwqg263SRqEWBmULpHYneXxc9fZlFyJinDYlV4s6eSrely
	A7ZIcQpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoV4Q-0000000Bm88-31Rh;
	Tue, 19 Aug 2025 22:44:46 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoTFL-0000000BabI-42Qc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 20:47:57 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57JKlmZW3036127;
	Tue, 19 Aug 2025 15:47:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755636468;
	bh=rZKXiseSnpS0hEdhK0+cUyUK3qXOByXmJNN2AiTy/3Q=;
	h=Date:To:CC:Subject:From:References:In-Reply-To;
	b=w8juffTo+pGNMf1xoRk/8cjRqfejZO8YpqMmfdSWRByw9zHQBKqaxJlkKYwM+yocC
	 p4BMKQzR+mpEILNmIvX3xnDrAa6ePA7ckitdHJEnYgQHEeUOFK/q+l+8cqZemx3BRT
	 JW0KVvcgHqZ/ZSUmVxwDiKzokslMcRaUQgrcNX5Q=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57JKlmnk1534906
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 19 Aug 2025 15:47:48 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 19
 Aug 2025 15:47:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 19 Aug 2025 15:47:47 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57JKllt63304944;
	Tue, 19 Aug 2025 15:47:47 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 19 Aug 2025 15:47:47 -0500
Message-ID: <DC6P6R1L2ZED.2UR8XRHH5RPJ0@ti.com>
To: Michael Walle <michael@walle.cc>
CC: Nishanth Menon <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <d-gole@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <detheridge@ti.com>,
        <matt.coster@imgtec.com>
Subject: Re: [PATCH 3/3] arm64: dts: ti: k3-j784s4-j742s2: enable the
 bxs-4-64
From: Randolph Sapp <rs@ti.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250808232522.1296240-1-rs@ti.com>
 <20250808232522.1296240-3-rs@ti.com>
 <20250813151819.5rthljjrpryfwezz@skinning>
 <DC1HU458W3QA.YLONSMYKK0C4@ti.com>
 <20250813181300.xfpsu23arx7xy4fy@anointer>
 <DC5C5JA237HD.1ACBQVG1LYQ7Z@walle.cc> <DC5T752T3P8B.1UC57G2GH35Z5@ti.com>
 <f0353dea24751f2f2ad6e7735232b933@walle.cc>
In-Reply-To: <f0353dea24751f2f2ad6e7735232b933@walle.cc>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_134756_143121_344A4C15 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
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

On Tue Aug 19, 2025 at 1:38 AM CDT, Michael Walle wrote:
> Hi,
>
>>> Apart from that, we now have two series which partly overlap.
>>> Should I repost mine, as that's more than just the DT entry? (Which
>>> doesn't work as is, I'd guess.)
>>=20
>> Ah, I don't see that series on the linux-arm-kernel list. If you can=20
>> forward me
>> that I can work around whatever you've got.
>
> That was the one Nishanth mentioned earlier:
> https://lore.kernel.org/linux-arm-kernel/20250716134717.4085567-1-mwalle@=
kernel.org/
>
> Also this:
> https://lore.kernel.org/all/DC5KCSEUZQUJ.3KPENNUQBUFM8@kernel.org/
>
> -michael

Ah, alright. I'll hold off on this series until the AM62P related sections =
you
were proposing are picked up.

