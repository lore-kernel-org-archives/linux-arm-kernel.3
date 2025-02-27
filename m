Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC75C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 14:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WF9LzLHCkRSu0ysovFG2P0lkkTg7dv5c/Mx/XIoFkfI=; b=XlOXbbcwpBd35kcz+USpFHLQf6
	yqrkVILCEmioGkd5GrT59Ml3upqByLKXYDZnwul/mpCtQd6wr5Eq3MyhE2JldB7oWR2TS5+bMArnx
	G0/Qju/PSxqVipytHPlKOcP9mWAN2Y6ERrD7Tr/y4KQhB3lKuFoxwSYpbYqtw6ack62d9XyXkHl3+
	iDQTW2lyaqlvbuDONwlZpq9sOT+hJCqqU4WmJxqPxkskiwhGxHtuDYZ4dUCAo5ffa0/jlE67fQGwF
	X9NrLJ+kCqO0eLM6cRaGmq/BoFDJinCTzQQBDMi03cXqnSKmuCvXyIJTjWB2Uc3T3VDqI/53aiw00
	OD5urAeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf9d-00000007o7M-1A2Y;
	Thu, 27 Feb 2025 14:46:25 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnerk-00000007jJA-0nz3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 14:27:57 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 9755DA0C24;
	Thu, 27 Feb 2025 15:27:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=WF9LzLHCkRSu0ysovFG2P0lkkTg7dv5c/Mx/XIoFkfI=; b=
	H8T8ZpXTQFc2B2M7Ed0MP3NeBv3NqCye2OrVN1y+7RKuZaNJQXvItUo5/QlVapii
	GweFKa4NhJ9ugM/Je3UVC10CkD0U3NNgAg8zJp4kvQotxExJm3ZsRA8RKOTRG7cF
	PE3dgaCOI7PWAwETWC1ERBowo+fPK4KnPcr7OQDsA08hyEaH6/j/uifCspD4KaHl
	XX0NW2P+XJH/btV6wnHbcfKyuYKSQUe1B7nWxIuY66Pc0Z5NZ3bcpUGS/50KfIRB
	YC1UG8QAh+SRV1KZETDZyQYywUmkZauYVk0+QRTBNbDo4c6ltNt5sf4pZHSLzkNp
	zxDvEgK7MnVlOfBPe8psG/367NS62hNbNY/1hsPr0r0KRL/0qKJHyeAWvfuXcBYU
	uVtIf/Z2MNChv1JRly7Ps7WUtvx5N4xchZjBKPIAxmtRUhqyOicFX57WycqRhg/y
	9snzjKnZAY2aMNs3DHcMcI4Lc9OjAdMKIB1t2ZfGYrPp5AAf3GsCSWUeq1E/Io0R
	NEBumqGycbcS/Pp5nn1vIATnYlX1N67gz5PGBsy+dLB91ayrPHFTk6lkZ0XnDqYV
	AHrMyY907PB7sxcOLGXVUmheuT5KU60Pko+NXwGaw2DgoZrhqWYaXBZZDTrU3/mu
	+Jm0sP7YDHBXfLNRRfWsDMVsOZVRWINVv0dlaGf4Vn0=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, "Kamel
 Bouhara" <kamel.bouhara@bootlin.com>, William Breathitt Gray
	<wbg@kernel.org>, <Dharma.B@microchip.com>
Subject: [PATCH v5 0/3] microchip-tcb-capture: Add Capture, Compare, Overflow etc. events
Date: Thu, 27 Feb 2025 15:27:45 +0100
Message-ID: <20250227142751.61496-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1740666474;VERSION=7985;MC=20500670;ID=1457592;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852637760
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_062756_393375_48DBC022 
X-CRM114-Status: UNSURE (   6.95  )
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

The TCB has three R/W-able "general purpose" hardware registers:
RA, RB and RC. The hardware is capable of:
* sampling Counter Value Register (CV) to RA/RB on a trigger edge
* sending an interrupt of this change
* sending an interrupt on CV change due to trigger
* triggering an interrupt on CV compare to RC
* stop counting after sampling to RB

To enable using these features in user-space, an interrupt handler
was added, generating the necessary counter events. On top, RA/RB
registers are added as Count Extensions. To aid interoperation, a
uapi header was also added, containing the various numeral IDs of
the Extensions, Event channels etc.

Bence Csókás (3):
  include: uapi: counter: Add microchip-tcb-capture.h
  counter: microchip-tcb-capture: Add IRQ handling
  counter: microchip-tcb-capture: Add capture extensions for registers
    RA-RC

 MAINTAINERS                                   |   1 +
 drivers/counter/microchip-tcb-capture.c       | 137 ++++++++++++++++++
 .../linux/counter/microchip-tcb-capture.h     |  49 +++++++
 3 files changed, 187 insertions(+)
 create mode 100644 include/uapi/linux/counter/microchip-tcb-capture.h

-- 
2.48.1



