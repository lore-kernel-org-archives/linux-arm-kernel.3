Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3E8FF6E97
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 22:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ofMa0/9wlAGvcjEpPMNHPWwBvZBFU0APi2CCH5/zA0I=; b=Ck5l4ncGb8iGar
	s+bhK9rLjSubcFBPAW8UswL2gXIknvt60noY2kQ2FdyIc9J9ShZ6sYo59ZuGCgiErYD4rJkyV4sfd
	csFWEiG7sHYHO+pxTWrSIX0rPvT2pZMdoSH/9QGrid6iz4C/bAYMjTmOitvLwLm58Er5X4L53wAym
	FB5qEbK7riRRVfXed1JtVOAE4DQ1bnL1KjrQBtwfAJ4NgiKv+BOn4jQ0REqftJusfgbXBl1ztzsFn
	Znsjm1MltIDGlub8IHgzx2jqtyOh/6fKMhDsPcud4lDWo7e+PzPr3RR0NV1dKH08qfoyrVZn9e9Cj
	ToyaSjls1ha9Y+2oCPqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2d7N-00000007Jj0-3vgi;
	Tue, 17 Mar 2026 22:42:29 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2d7H-00000007Jhd-0c95;
	Tue, 17 Mar 2026 22:42:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ofMa0/9wlAGvcjEpPMNHPWwBvZBFU0APi2CCH5/zA0I=; b=sefz77/0u7GPQtn3w/kiKXjN3+
	y9n5oLcWzm79VYxKXFGYR97ppT5TMgbt2/S2p4l1ONRIBSGEypAxTIh/hJE+slBO0Mf0nHwBxY9oc
	sJLiW/nceaEu8WLTPyO7oeWAOieMdVXlOiylKWCS/YxlzPMcmh3pRjpbvtWj4ik6FgNw/QyIZhYFC
	SS6m182rzoUr4IurF/PCOrl44jeBJaTTeiNcpm+ytY8dV4CcSYCZZBqtSPqY5Ck1VXaKRUg+f+32a
	vMg/WC87FCvdsZPV5RW4AWhxyJiKvDNMghtFZiFke+pSWVdhJnCcJB7K6aFOOEzvcLFSDCPEaj0Dp
	1BujCdyA==;
Received: from [189.7.87.203] (helo=janis.local)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1w2d6y-002VQv-Uc; Tue, 17 Mar 2026 23:42:05 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Subject: [PATCH 0/2] pmdomain: bcm: bcm2835-power: Fix ASB timeout and
 clean up polling loops
Date: Tue, 17 Mar 2026 19:41:48 -0300
Message-Id: <20260317-bcm2835-power-timeout-v1-0-19db323c51f9@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKzYuWkC/x3MSQqAMAxA0atI1gZsggNeRVxojZqFVlonEO9uc
 fkW/z8QxKsEqJMHvJwa1K0RJk3Azt06CeoQDZRRkbEpsbcLVZzj5i7xuOsi7tjRkGXmyjAVDLH
 dvIx6/9+mfd8PwVsw7GcAAAA=
X-Change-ID: 20260317-bcm2835-power-timeout-12c333813263
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>
Cc: kernel-dev@igalia.com, linux-pm@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 stable@vger.kernel.org, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1292; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=QdKw4f/MGqXb5H99rYWCACPHZU8X04ZL8sww2QN6OZA=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpudi4JQvySB5Y8bxPiu6wK1lvRuiX9uItR+aWZ
 DepT8ifVMCJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCabnYuAAKCRA/8w6Kdoj6
 qkjeB/0TZirqsJV85CRS6UflHgIyHqeElHAZAbD/6cbZ4b2SgCH5uFahjdJs6aSarfQIHU3d7f+
 4ARIIvk7wxL3nRTTRkml5OSVjltRGaf0RxFHhUqzim/jCmwTkrzvUu1vBxGCfZM9Ea7usesGBd5
 axS9DRVc9S0SKh0qVQDwbmXpIr9/OS5somlhqcXcV+d8t7dav/Vpe6ac6WQcMWwFYBA1JGsOgQY
 qp0Su2OrxOWT6wyWxPXygnMeud2mNE4jmQ15Y9FqP5f5WIiaatgTG0WmBpfAqWZZSGBgYqGQUBb
 QvVn+nNNRoJKeCVjfEg8TE1gqNfgRFjtB8UZMGuUDYLRNrHm
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_154223_483540_09102F16 
X-CRM114-Status: UNSURE (   7.58  )
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

This small series is a spinoff of the V3D power management series [1],
addressing intermittent ASB bridge timeout failures observed on BCM2711
during V3D runtime PM suspend. It also cleans up all polling loops in
bcm2835-power.

Patch 1 fixes the issue by increasing the ASB control timeout from 1us
to 5us and converts the polling loop to readl_poll_timeout_atomic(). Due
to the large changes in the patch, I preferred to drop Stefan's R-b from
it. If possible, I'd appreciate it if I could get another review from
Stefan and also if this patch could be pushed to the -fixes branch.

Patch 2 extends the readl_poll_timeout_atomic() conversion to the
remaining polling loops in the driver (POWOK and MRDONE).

[1] https://lore.kernel.org/dri-devel/20260312-v3d-power-management-v7-0-9f006a1d4c55@igalia.com/T/

Best regards,
- Maíra

---
Maíra Canal (2):
      pmdomain: bcm: bcm2835-power: Increase ASB control timeout
      pmdomain: bcm: bcm2835-power: Replace open-coded polling with readl_poll_timeout_atomic()

 drivers/pmdomain/bcm/bcm2835-power.c | 37 +++++++++++++-----------------------
 1 file changed, 13 insertions(+), 24 deletions(-)
---
base-commit: 95c541ddfb0815a0ea8477af778bb13bb075079a
change-id: 20260317-bcm2835-power-timeout-12c333813263


