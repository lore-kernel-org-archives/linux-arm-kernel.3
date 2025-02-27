Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F041C1B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7+U/H48sVhDKT4EC1mYrNr5/JRrYqDkzYSFlQnG2vr8=; b=hEhsl+Pz6gX7ocUFiuSNtcqevt
	S1kZls7Ae6z5e5cXRv3OCTB3yNqb18zGzkxKm7FWNkmaSf1pPzzer3sO2yh3wzRgF/bVnHu+fCxli
	Du58GGVfcu/55Eho9rQv6hRQcG9AhGt/ITMGuI3PqR8V9rCJmI7fIbPDI9Ai65Cn+tGAq17cFXEGc
	HTf1L9fbPsrsIQyOMqnP8Hn32+TuFqwm3BTyWu4qhiRTjaTN4AzFVVigU3Y6RM4/0MyWugncU+BRj
	zNFidNM23DrCKaXHJCtYRoZT1BI07D9/rY1wtgkIEK8/fZ2TPzNaBtvVoyTvTziLNmx8oAEEs6EX5
	innMdfVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjh5-00000008Th5-0Hcc;
	Thu, 27 Feb 2025 19:37:15 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf4O-00000007mpb-14MP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 14:41:01 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id A4C2AA0622;
	Thu, 27 Feb 2025 15:40:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=7+U/H48sVhDKT4EC1mYrNr5/JRrYqDkzYSFlQnG2vr8=; b=
	gI7SsqlzWMgZVk7fqNN+kHmCrqYnQ7hn4k77RkEs2V7qldFQ+Gi2IMt9DVyAsSuX
	WcrTk/nQ/pecNCkQjTWyRbG8LPz3nL2Y2R8t3831tJ6JYKqVMh2vc1sOdpNVG8jn
	pUZIGbBjxltXbfg+qNZw5PVUqLpkDhdaJq/DCXH/IRoA5lakR5ENUi70eS7G0XGL
	ADyDBf8tnB/0+SIJrlA7i2o6RuZ20nwU0anEOYmcIZjqtK6x/uuxF7EeQObNKpRL
	75CIizcobZAr6JObcz+Mn4yAB7hi/F35wykYh3DJbjQ0wY0hjR/Q0mgg1hzMpTQc
	UyoVT/fLSRdTxMBqMamAQ02kOueGmtC1Xzw0zQruZvqJkvHbWF73/5blSY32/Ram
	Dbktb/psWk0XdZrUR2Q21pSGlnh1Nqn8F7pcp7yDKizmQ71FHKMx3ABZr3qlEOll
	ZEnsmo5huqkTTOSqsjSkcGCdZ4TJ9+3WJfK4UgINDiG8eUzj5rWgR0uchtyYciNg
	MCJygyYLG+D0CHK2kMghIY8OqU73eNBvK673++NnUHEBwMvwRN/f+YkI8Ar2iovl
	PHAdmEKSA8UyRibZiM2crAQKLivRZTVp8Oc6hxl0Pam3hRef87H25+Q0IcQ0QK15
	Qr2e4TCAT7AuZiBw+o90ewmxA7w0i+2pmDv1+oU5Fe8=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, "Kamel
 Bouhara" <kamel.bouhara@bootlin.com>, William Breathitt Gray
	<wbg@kernel.org>, <Dharma.B@microchip.com>
Subject: [PATCH v6 0/3] microchip-tcb-capture: Add Capture, Compare, Overflow etc. events
Date: Thu, 27 Feb 2025 15:40:17 +0100
Message-ID: <20250227144023.64530-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1740667258;VERSION=7985;MC=1480940311;ID=1459460;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852637760
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_064100_458840_8F3F050E 
X-CRM114-Status: UNSURE (   7.06  )
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
    RA/RB

 MAINTAINERS                                   |   1 +
 drivers/counter/microchip-tcb-capture.c       | 131 ++++++++++++++++++
 .../linux/counter/microchip-tcb-capture.h     |  49 +++++++
 3 files changed, 181 insertions(+)
 create mode 100644 include/uapi/linux/counter/microchip-tcb-capture.h

-- 
2.48.1



