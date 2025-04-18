Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B65C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 19:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AOMCPCVH5mFNR9+7E9QB2UW9eCxznsJSzMrjdheXjNA=; b=IHpi++ZT5WDlgNzQ1SDqkb+QBx
	dtzQ5IccE3hMzQtWjwBBeRcdU0/42xYI2pXZWR2RIUcuzAmnaD9NvQ5oxsU/EuC7WsAjj+A9lOMxk
	WuPQHth1Em5gJJhj0TlYdVwqYrL6n/fcD7Ge0RGlUSfKJ7sJryKxf77tIwmYRXjxmKOrhjAWo6CTq
	73EnZPHF5bjaATZeIxmA2se4VNA0gVhyqMgIZsqkVUJJUWGxrg1eiuJSSRAV21Es5YiZiXfvEAvVp
	oWlrXf3EDWskur+IJVt2XpRsbBCI0ekuS6rHGs8X6A2JfJfbuK4oCBkxwYTdkWMWrctNRUEwv3+LZ
	1gVelbCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5r6z-0000000HZ7E-3VFN;
	Fri, 18 Apr 2025 19:10:53 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5qwn-0000000HXgB-3Dxk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 19:00:23 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53IJ0C2j1061682
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 14:00:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745002812;
	bh=AOMCPCVH5mFNR9+7E9QB2UW9eCxznsJSzMrjdheXjNA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GDueWkKAplp3xSed2AeDL9KGQk9PjCwJ8ZOM0dZp3oL5z4XNaFxzRt7ViscW6dxTq
	 /lw/eGMnwGyZVO54YmxeJmzvzcKRzP8qfecuynkhgG8+CD/fnQndU8qeMyz08qy8Od
	 yOT63BXsjMLce9Refs76emj9Tj1SKwI8u0yU113o=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53IJ0BpT111217
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Apr 2025 14:00:12 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 18
 Apr 2025 14:00:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 18 Apr 2025 14:00:11 -0500
Received: from localhost ([10.249.36.23])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53IJ0Buc121849;
	Fri, 18 Apr 2025 14:00:11 -0500
From: Nishanth Menon <nm@ti.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Robert Nelson <robertcnelson@gmail.com>
CC: Nishanth Menon <nm@ti.com>, Conor Dooley <conor.dooley@microchip.com>,
        Dhruva Gole <d-gole@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrei Aldea
	<a-aldea@ti.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Deepak Khatri
	<lorforlinux@beagleboard.org>,
        Ayush Singh <ayush@beagleboard.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: ti: Add PocketBeagle2
Date: Fri, 18 Apr 2025 14:00:09 -0500
Message-ID: <174500275378.96085.17582484120065140121.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250415225940.3899486-1-robertcnelson@gmail.com>
References: <20250415225940.3899486-1-robertcnelson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_120021_898092_7BDAC8B3 
X-CRM114-Status: GOOD (  14.79  )
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

Hi Robert Nelson,

On Tue, 15 Apr 2025 17:59:39 -0500, Robert Nelson wrote:
> This board is based on ti,am625 family using the am6232 and am6254 variations.
> 
> https://www.beagleboard.org/boards/pocketbeagle-2
> https://openbeagle.org/pocketbeagle/pocketbeagle-2
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].

I have dropped the Cc list as Krystoff pointed out this time around when I
applies the patch, but, please take care of this from the next series on.

Thank you!

[1/2] dt-bindings: arm: ti: Add PocketBeagle2
      commit: 3a5ff313ac521ff034f07ea6687ffb3f2229d62a
[2/2] arm64: dts: ti: Add k3-am62-pocketbeagle2
      commit: 92d8c028aa924286f10ac75b7f9e8edfc9ed432b

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D


