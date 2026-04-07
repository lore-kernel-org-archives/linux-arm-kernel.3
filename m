Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C95105D98A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 23:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5L2Ti0VZeIRm4iRekhYaesfep3WWSsYiWbC0m9BjHNk=; b=i6FFyVW3GfNYTCNqWbvYxQiNqL
	FkO6yBWvdT1pQY5Q7oenP78U49KSyFjK5mzx0blLUfTHW91Z+tzkaTP7NboJvqUJn6T1GVA7Y9qcv
	eQLnVnmpuyXpiX+GC8ZI2GMH9S4A+pheCARi76qgzWaZQ2+cBfTQLnJNVXhQ5/2oCq7DaHa2moX8R
	nTrLSX1VHtMFHix5ZrytELexZzSs+5VZySzj1Rp2wEEit6EX77Tv4xXaqRdgcOteRxTCtTrjZAz6c
	WjSyLsTQc03kMwUr1o+KMB/yj4t0i3K/UsjP+ZxO0HZvA6V5iUL6vd4DCsNV4cd9VFFLSUBxQNXD/
	Ic9qLQfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAGHR-000000081WA-1ILM;
	Tue, 07 Apr 2026 23:56:25 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAGHO-000000081Up-3qk1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 23:56:24 +0000
Received: from mail-acc-it-01.broadcom.com (mail-acc-it-01.acc.broadcom.net [10.35.36.83])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 28278C030951;
	Tue,  7 Apr 2026 16:56:19 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 28278C030951
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1775606179;
	bh=NkCIIF2z9mS3Ez9+Jxm0z7amc66BFTGeo8CZqQ83kuU=;
	h=From:To:Cc:Subject:Date:From;
	b=XZzrEO4wWcbKmprJHvaeh0mtpymK8En4IwSJHqRqRN0sJsAjBw2idbX1GeEd99/5S
	 ihX+qHxe1vPoKoU/NmsJKGSWtv/BAnLZBtJebsD7FY4xKMYKpISPiQlbWmaPJpV82m
	 YHTSxn1jvkmfaTVSJwQRqTkad/ZPBHCJsz/I7Tl0=
Received: from stbirv-lnx-1.igp.broadcom.net (stbirv-lnx-1.igp.broadcom.net [10.67.48.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-acc-it-01.broadcom.com (Postfix) with ESMTPSA id 3930AAE80;
	Tue,  7 Apr 2026 19:56:18 -0400 (EDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:PIN CONTROLLER - SINGLE),
	linux-omap@vger.kernel.org (open list:PIN CONTROLLER - SINGLE)
Subject: [PATCH 0/2] Utilize pinctrl-single for bcm7038-style chips
Date: Tue,  7 Apr 2026 16:56:09 -0700
Message-Id: <20260407235611.550515-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_165623_134121_29BD657F 
X-CRM114-Status: UNSURE (   9.56  )
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

This patch set allows Broadcom STB chips with the BCM7038-style
pinmux/configuration blocks to use pinctrl-single. This does not
preclude us from making use of a more sophisticated driver in the
future, should we need to.

Florian Fainelli (2):
  dt-bindings: pinctrl: pinctrl-single: Add brcm,bcm7038-padconf
  pinctrl: single: Add bcm7038-padconf compatible matching

 .../devicetree/bindings/pinctrl/pinctrl-single.yaml          | 4 ++++
 drivers/pinctrl/pinctrl-single.c                             | 5 +++--
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.34.1


