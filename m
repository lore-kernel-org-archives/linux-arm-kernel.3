Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9B8C28B23
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 13:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/UxPbmKXr3I3XApnAtyCIoCLXfkY8WP19iA5l9VOJgc=; b=iiFTCJdx+WzsZBdTqvg7tIRpw2
	imVT2LSLtQgHCjFkql/+3X2IccNhmEm4cjItinsJdAe2bI7cYe5zqjCXiQAMYWxrBzo9p/x5jcYTd
	xhwx/wpS8k2nJyvUd2qb3IA7hNdcVLDFGInNJ87F7qxavu6NR2s7GwKExoqo/D+BxaYJACU/1POus
	wF0yY+6G66KJNZvnXEGqYBtEt2SUll2tbg8gnQhd6tMMR2f0BQlVBG9Li8pMEK0b6DZEY1pNB5jeB
	c2nshcRAVkx3pZGZ5w+DK6ZIMNF68xQKp2gn+Y2RMB0NxEYomyHno5VJowhwwEzsIXSXKjWJZw9to
	QUniLAfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBh4-0000000B7PI-1jSN;
	Thu, 06 Mar 2025 13:55:22 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBWy-0000000B5j4-0Ra2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 13:44:59 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 5C4BEA0433;
	Thu,  6 Mar 2025 14:44:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=/UxPbmKXr3I3XApnAtyCIoCLXfkY8WP19iA5l9VOJgc=; b=
	VlfubMQ+0465Ik0rVug7Smjik7/YeRLRztoDu6XBjD0E4Dn4/NqArJ2QorOzFZx9
	hMPZcvP2bLFrXXoQSxkrDpzF29NjKEvhJ9g/gvUn8EY8ZZyqnPh+RU6SQkRp5PWX
	sgqBfTlEvns7Tfsliic4x2Lw4o2e7LEB3ox/wRbNqU9WaqA7yeud+/41a/m9nGAr
	LKI0XMcRS+5SaMFzcTipdCE3BJh1axRsXXxM7QYc/fgKmdsMJqCO+mRfQT2vaMuF
	a0LXA3EH5IThpbO704+uOilii6SisrEeBg+n8p7N9eoH+vnN7WY9c3q6CGHj89Ev
	HltDLzzzYq/syuXaK5qgtp7Tr00ZNgKY4hVDj4AQLBJkcTWuH3MaEaCeA5SlAltq
	l0V/sRY46detqHzyHxTdOCgsEhsnUI/uOJf0OHJtSr7OHoVS0kL2JAuzrRHq213O
	8LBDnBwmrtWbXgLUKbl+eNDOFVDMyns1iEvrqBL8FORxu5Yv/0oUNXNFDRgOvlrO
	/624U7qcG2m5Lep2RaISXVh8UIgnZZk1KAmMZjQUkAtkXpr6EPpREImLvY+QV09D
	RyJUok4J0eZhpL2404wBhKNMQdRTb9BQXdpSGaGivVPxg6KHTMUxWn1ornRKDwh5
	hT3qjFL5Gahs/qpHXMC1llgnU3JIA8PX4LkOUfl8fUY=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, "Kamel
 Bouhara" <kamel.bouhara@bootlin.com>, William Breathitt Gray
	<wbg@kernel.org>, <Dharma.B@microchip.com>
Subject: [PATCH v8 0/2] microchip-tcb-capture: Add Capture, Compare, Overflow etc. events
Date: Thu, 6 Mar 2025 14:44:35 +0100
Message-ID: <20250306134441.582819-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1741268682;VERSION=7985;MC=612642565;ID=1566293;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852637C6A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_054456_668624_500EEBCF 
X-CRM114-Status: UNSURE (   7.00  )
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

Bence Csókás (2):
  counter: microchip-tcb-capture: Add IRQ handling
  counter: microchip-tcb-capture: Add capture extensions for registers
    RA/RB

 MAINTAINERS                                   |   1 +
 drivers/counter/microchip-tcb-capture.c       | 132 ++++++++++++++++++
 .../linux/counter/microchip-tcb-capture.h     |  40 ++++++
 3 files changed, 173 insertions(+)
 create mode 100644 include/uapi/linux/counter/microchip-tcb-capture.h

-- 
2.48.1



