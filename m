Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440F1C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 04:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EL8jXAZdg4d+0UegI3uA5v5X0bH/2EC+cV61o4j2lMc=; b=mMay68TCYpXulNgoDooNCpTE/w
	7HFB7TsbzvJgAdWGnSKV4tP1y/dRlIcSCo7Q6uJ+ylQMPGlcTRjw7FeUO19Gk/v5a8J0Mawp6ciJr
	bGKm9VzjFFFx+n1+Cu/cj/zPYNM9pusX4kI4TpRVHnsrHTIG7RT+Np9bL+JzuQel7jUOQIsiTvmSc
	z5++bhv3Uir39FT2fIHtYjt/NZHldtPIbYtEmlEYlbWi21vjlpEleRNloq2hzrlqxUEn8VXZuGY4Y
	mVnx3qB2VZqgVwmfcGieBdRDH4M8Qo/0s20hm29pMgDrif3jh7eg2BZavhEcLBx1PP/mya1yHQh6g
	Ix67lTqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2NUz-000000066VW-2MVR;
	Wed, 09 Apr 2025 04:57:17 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2NT9-000000066QF-3DCd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 04:55:27 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5394tAMc1398897
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Apr 2025 23:55:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744174510;
	bh=EL8jXAZdg4d+0UegI3uA5v5X0bH/2EC+cV61o4j2lMc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=lC5HMd9hpEFUSsdW0DjvzAUDfKbORIXI9h+SBqtfl9I8e1/qHYjYo2I5BeOZx+WcL
	 +yst7KIcfAk0wosaVSi5bZH3HuBXAPoEiG2lIHXp6FKUJ3eXV9LwWFDW9fAdVZP1dE
	 H/LPYoYXKTfde8xeQbyv8yIaF1HHo2eD0Tp8uyEY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5394tACe041603
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Apr 2025 23:55:10 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Apr 2025 23:55:09 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Apr 2025 23:55:09 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5394t8It123674;
	Tue, 8 Apr 2025 23:55:09 -0500
Date: Wed, 9 Apr 2025 10:25:08 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Robert Nelson <robertcnelson@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, "Andrew
 Davis" <afd@ti.com>,
        Andrei Aldea <a-aldea@ti.com>,
        Jason Kridner
	<jkridner@beagleboard.org>,
        Deepak Khatri <lorforlinux@beagleboard.org>,
        Ayush Singh <ayush@beagleboard.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: ti: Add PocketBeagle2
Message-ID: <20250409045508.tywtknafajned2ak@lcpd911>
References: <20250408231823.826163-1-robertcnelson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250408231823.826163-1-robertcnelson@gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_215525_903053_D008F785 
X-CRM114-Status: UNSURE (   9.36  )
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

On Apr 08, 2025 at 18:18:22 -0500, Robert Nelson wrote:
> This board is based on ti,am625 family using the am6232 and am6254 variations.
> 
> https://www.beagleboard.org/boards/pocketbeagle-2
> https://openbeagle.org/pocketbeagle/pocketbeagle-2
> 
> Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> CC: Nishanth Menon <nm@ti.com>
> CC: Vignesh Raghavendra <vigneshr@ti.com>
> CC: Tero Kristo <kristo@kernel.org>
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: Conor Dooley <conor+dt@kernel.org>
> CC: Andrew Davis <afd@ti.com>
> CC: Andrei Aldea <a-aldea@ti.com>
> CC: Dhruva Gole <d-gole@ti.com>
> CC: Jason Kridner <jkridner@beagleboard.org>
> CC: Deepak Khatri <lorforlinux@beagleboard.org>
> CC: Ayush Singh <ayush@beagleboard.org>
> ---
Reviewed-by: Dhruva Gole <d-gole@ti.com>


-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

