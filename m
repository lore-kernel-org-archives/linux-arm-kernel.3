Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBABEC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 12:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/WtYtYBZqx4XMAJuxTT0OcqzWgf2/8t867s121qJZNI=; b=JUQvhiXVx9ilc74h1MvdX+J4gS
	nyZdXfj98M5dEV3bu3nDFT60xHRwJYVXDC2z7ywMhue/C/qlqv7MR3ULoe/49YOO5qXYdTcTdVUSE
	gDJjwA5Ksbq8gKwwPvq2vBaXuKoBhl1yvTLf5mXxDLOOFxq5eG2aEetuC8FphW71QbhMXYUBHLvbP
	+KPyUyW0pAe6XQO8xmJ1MHs5WJwX9JAmjulEFRlQyDglIhzeCgSqHXSaRYQdVHsjMH4jW9iID+rmm
	udigCn05zeg53prAqC7qF9YcJZuySOth5hlPmpEhl4tdI75DXVo39OIMWhQUKJZ9AMvdi+mqiazYV
	cVnCRkEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2qjc-0000000ARtJ-32bz;
	Thu, 10 Apr 2025 12:10:20 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2qho-0000000ARXr-1XwA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 12:08:30 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53AC8MtZ1125397
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 07:08:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744286902;
	bh=/WtYtYBZqx4XMAJuxTT0OcqzWgf2/8t867s121qJZNI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=JcrysT00/IQVRByyhqEKtf13FUISI9cLIRAeoihDXEii6UDOiDlgNt1aE5Le/5Qs9
	 qRpLz6GSFYC5ZDyRJQiZmW6mX5MZOlfpfMBXH29b5aZWYKaoKpuIj7bsvpo8b8S/0m
	 +ETYQqVEUQYCO9ozrnH0Yseh15rXqZ6FwhNjmwvI=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53AC8MlO115444
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Apr 2025 07:08:22 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 10
 Apr 2025 07:08:22 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 10 Apr 2025 07:08:22 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53AC8MQT102361;
	Thu, 10 Apr 2025 07:08:22 -0500
Date: Thu, 10 Apr 2025 07:08:22 -0500
From: Nishanth Menon <nm@ti.com>
To: Robert Nelson <robertcnelson@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Vignesh
 Raghavendra" <vigneshr@ti.com>, Andrew Davis <afd@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>,
        Siddharth Vadapalli <s-vadapalli@ti.com>, Judith Mendez
	<jm@ti.com>,
        Andrei Aldea <a-aldea@ti.com>, Dhruva Gole <d-gole@ti.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Deepak Khatri
	<lorforlinux@beagleboard.org>,
        Ayush Singh <ayush@beagleboard.org>, <kamlesh@ti.com>,
        <praneeth@ti.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: ti: Add k3-am62-pocketbeagle2
Message-ID: <20250410120822.3vsrt42iyfs75h6q@spearhead>
References: <20250408231823.826163-1-robertcnelson@gmail.com>
 <20250408231823.826163-2-robertcnelson@gmail.com>
 <CAOCHtYhFKO=LRN8qp-w+rkTGKJ8t-LnqgqbQW9P6CO3=EeuufA@mail.gmail.com>
 <20250409130918.d3cyzv3to65oktv2@vision>
 <CAOCHtYgpkBXZmZEDz6gUCO2x+WGA_paKHFHS-Br=ypo+AFrBmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAOCHtYgpkBXZmZEDz6gUCO2x+WGA_paKHFHS-Br=ypo+AFrBmw@mail.gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_050828_496002_469C177F 
X-CRM114-Status: GOOD (  15.57  )
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

On 10:12-20250409, Robert Nelson wrote:
[..]

> > Any idea why we are crashing?
> > https://gist.github.com/RobertCNelson/c68c96a8a1dc6e4d39d8c48fc13ca1c1#file-gistfile1-txt-L311
> >
> > I don't see the same crash in beagleplay:
> > https://gist.github.com/nmenon/5709a8714d3ab31cac5c00b515d04752
> 
> On 6.14.x i have a little more, info...
> 
> I've got all the CRYPTO stuff enabled, pretty sure that comes from
> CONFIG_CRYPTO_MANAGER
> 
> CONFIG_CRYPTO_MANAGER=y
> CONFIG_CRYPTO_MANAGER2=y
> CONFIG_CRYPTO_USER=y
> # CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
> # CONFIG_CRYPTO_MANAGER_EXTRA_TESTS is not set
> 
> https://openbeagle.org/RobertCNelson/arm64-multiplatform/-/blob/v6.15.x-arm64-k3/patches/defconfig?ref_type=heads#L9578

OK this looks like to be a independent pre-existing bug then and needs
to be investigated, but it is probably independent of this patch itself.

Could you share a clean defconfig bootlog? I have no existing scheme to
test this on my end. In the logs, please also print
/sys/kernel/debug/devices_deferred to ensure we have nothing sticking
out in our defconfig?

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

