Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EC8C02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 10:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A8a8Vknd+Ac1B5NbwMCS9Rp6ox5pHlVEJ+QCEfo6ioE=; b=HXxEjJdtn5OufNGdLPStqGKEG3
	wEqG26Pm4UJwHfUTynY+Yni50hCYFYo2yXFXhb9RgbOy5odRdHNiX4x+oHPiULFzNpaEaJhOEFACq
	ENUI/uQhj/j6UWI2H94r1GTsMI8yskvJiO2K0iLBAhciUww/RAON4s1MGBFJ4p7XdLrOfUIr1ooBh
	eKEp1hcmzdi/Gt8sUR3C12X0t5qbAttGHDEjOsB0oEdtkSPS2vwCl3/e9W3Jvswh+5yBES5p79VYX
	STkk1VoiW4oOZ/Lvy1XCxGoxZebC6mGi7e197QedxsbgVnF/CKsoofmYiFbLjj21bz646sPUDSbz4
	xye9Gowg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfd2t-00000002xWf-1238;
	Wed, 05 Feb 2025 10:54:15 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfd0L-00000002x02-0SNo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 10:51:38 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id B646BA0031;
	Wed,  5 Feb 2025 11:51:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=A8a8Vknd+Ac1B5NbwMCS9Rp6ox5pHlVEJ+QCEfo6ioE=; b=
	WnoYpEILKm9SvCt3yFSNGC/pL8zToIpwkbYHyPlxp+VVP2rAtXJYcxeEbw4g1E4R
	X14ODohHKGFOHhtxnIaAU6klhR1GAc9GZK4rOXVZFEcsBjcc6QIqIAwggrhwKZCf
	TzahDJATPmmkcZ0HC4vhLitYFpjoq6pwHZJkpvz/QFlOjFfikS5p2oFVnRZ/g72s
	4c7KZXhD232EbMksPdbERtFGUNeevdlhX89lSpPzcnf+u0M6JoZXIQ8JpKD5lxrx
	Tz6OBDNpbotA+Je4hevaZ+Chiy80I+LU9Qcry4CYD5/CTfjytbTVaNGeRKZPhVtK
	huFPGYvVQfS+giv5dcy3vkE48KgdtOnzBPhZ8eUMGf3ZxFPcBpx9Vgyche2h/644
	rhsuDfUgN4LZFMg60ZFipKmy6+2P8AHJz7UJynvvIG7o7EMNiycwH+bXO7hTd1Fq
	GoOWxojUrpCb1dPMeGTJ4oBBIOfhsjAgkUUG1tDDupW2K8I7Zhl60VU8GlTg3kth
	H92Sfa/GXZFSqchZwH8Kfw/789l5TMZmbOpKeeHux3AqFBEJh9GZn/hf8dn5S8Dg
	+h9yLrpGiqvLeIOLZ7gOmlVyc/mv7YWrWwyYut2K3Nkmr8+hw627AlA5y0PpYwsQ
	xd6+28uXypSWwG31J7PypaUvdvLSrDGwUn8jvF7VFzg=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, "Kamel
 Bouhara" <kamel.bouhara@bootlin.com>, William Breathitt Gray <wbg@kernel.org>
Subject: [PATCH v3 0/2] microchip-tcb-capture: Add Capture, Compare, Overflow etc. events
Date: Wed, 5 Feb 2025 11:50:43 +0100
Message-ID: <20250205104957.95236-2-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1738752695;VERSION=7984;MC=1779217303;ID=244308;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852667264
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_025137_300695_11790192 
X-CRM114-Status: UNSURE (   6.08  )
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
Message-ID: <20250205105043.GZ2GiOuZ93zyLzEs81RUQlV0ncWGq4g6kvV4fhv3hU4@z>

The TCB has three R/W-able "general purpose" hardware registers:
RA, RB and RC. The hardware is capable of:
* sampling Counter Value Register (CV) to RA/RB on a trigger edge
* sending an interrupt of this change
* sending an interrupt on CV change due to trigger
* triggering an interrupt on CV compare to RC
* stop counting after sampling to RB

To enable using these features in user-space, an interrupt handler
was added, generating the necessary counter events. On top, RA/B/C
registers are added as Count Extensions.

Bence Csókás (2):
  counter: microchip-tcb-capture: Add IRQ handling
  counter: microchip-tcb-capture: Add capture extensions for registers
    RA-RC

 drivers/counter/microchip-tcb-capture.c | 125 ++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

-- 
2.48.1



