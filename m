Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B9BC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 13:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUZgFTHeEy6hrwjjvFHHumFdJNoNVibZ3QUB37fvzWQ=; b=uzQYrZDLDCMSrLWH77ZgKB8hqE
	5XMm2EQLxWM5jaXLev7FjCxk52zkv/kHQ/Ybsk1HOfbfzo+tJJuJRag5ugGX03HDOPaA5hP+ZHMti
	k1pGpyUkc2FQpov5+sdljk2kqGbO+Z+JE2osRGOGCWVRW3OraK1Mn5ckPSbhqW/PgEhL1e86qLisx
	Ma2/4wu0GodDY9CYeT6skvZE6DoxjTcCdrdkKhCJAKwpOVj7Iryk3i/Eu3R1piR0hAzdEps1XiO4U
	etq7nsty7hGjPgrv0pWZcXwS9jvXfd5rWly1qlMyoiArlAQQB4P2pewzQud4juPrl16jsxB/CJuf3
	jl6zXiiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2VD2-00000007EqJ-3esc;
	Wed, 09 Apr 2025 13:11:16 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2VBH-00000007EiE-0lVS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 13:09:28 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 539D9JEa1473192
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Apr 2025 08:09:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744204159;
	bh=eUZgFTHeEy6hrwjjvFHHumFdJNoNVibZ3QUB37fvzWQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=fml/j+2TsDO6QXwxGPWbx3MglajG2+DjXCUc8dXHHS18VYQFxRLxpldEMwNI3aOR/
	 Rscsof1bc8HivOvj5O0nSYvSJU4meOW/dp9KRfjC9NHzn2Z+xRE4pfubSMvucMfVA+
	 ZvGCAsGLXT1jqdg6TSu2rPfhGSCEiPuh3AQARJ5U=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 539D9Jfd029117
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 9 Apr 2025 08:09:19 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 9
 Apr 2025 08:09:18 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 9 Apr 2025 08:09:19 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 539D9JZk064335;
	Wed, 9 Apr 2025 08:09:19 -0500
Date: Wed, 9 Apr 2025 08:09:18 -0500
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
        Ayush Singh <ayush@beagleboard.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: ti: Add k3-am62-pocketbeagle2
Message-ID: <20250409130918.d3cyzv3to65oktv2@vision>
References: <20250408231823.826163-1-robertcnelson@gmail.com>
 <20250408231823.826163-2-robertcnelson@gmail.com>
 <CAOCHtYhFKO=LRN8qp-w+rkTGKJ8t-LnqgqbQW9P6CO3=EeuufA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOCHtYhFKO=LRN8qp-w+rkTGKJ8t-LnqgqbQW9P6CO3=EeuufA@mail.gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_060927_313487_F5ED7A01 
X-CRM114-Status: GOOD (  12.25  )
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

On 18:19-20250408, Robert Nelson wrote:
> On Tue, Apr 8, 2025 at 6:18 PM Robert Nelson <robertcnelson@gmail.com> wrote:
> >
> > BeagleBoard.org PocketBeagle 2 is an upgraded version of the popular
> > PocketBeagle.  It is based on Texas Instruments AM6232 or AM6254 SoC.
> > Its dual or quad A53 cores can provide higher performance than classic
> > PocketBeagle. The new design comes with pre-soldered headers, a 3-pin
> > JST-SH 1.00mm UART debug port, a USB-C port, Texas Instruments
> > MSPM0L1105 Cortex-M0+ MCU for ADC, 512MB RAM, and a LiPo Battery charger.
> >
> > https://www.beagleboard.org/boards/pocketbeagle-2
> > https://openbeagle.org/pocketbeagle/pocketbeagle-2
> 
> dmesg:
> 
> https://gist.github.com/RobertCNelson/c68c96a8a1dc6e4d39d8c48fc13ca1c1
> 



Any idea why we are crashing?
https://gist.github.com/RobertCNelson/c68c96a8a1dc6e4d39d8c48fc13ca1c1#file-gistfile1-txt-L311

I don't see the same crash in beagleplay:
https://gist.github.com/nmenon/5709a8714d3ab31cac5c00b515d04752
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

