Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308AACDDE74
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 11:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vpLg9OGzAhNCA/ueBvjFO4tB5KkrKG5Fjl+MN0oNc1w=; b=jbR6oT8znTxWwxGC2bq32qknDm
	tzsSF83MeVNCuGG8juzMj1+HTxJPe4MIRoRaA9CsxG9a0wbRv6iUXyGde/FwGT0l7J25UWh+XKfGh
	GPeyjs03BeGirwws+04+AcbsAz5JzY7kxTkuZKU6N4NQpQhwKqfXWPwsklv0kaLI8X4+6ga5u9Lus
	sq23hVQBe1UdefSV5UzucUhXqXDXghlTiuT1J5JMoUQHAEAYPhipqRjaSNeuh49HHLGrzgJCe/k65
	N5AWnfFAN7PmCBkkNskf4STxYModU5tkyuNfXriaalJfySWk1M6WyxuVNsWwzXSt2s+9vF906ySDa
	thzTh+xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ZpD-0000000EBv0-3FlK;
	Wed, 23 Oct 2024 11:46:51 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ZAU-0000000E4ur-3lmc;
	Wed, 23 Oct 2024 11:04:48 +0000
Received: from umang.jain (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE4A382A;
	Wed, 23 Oct 2024 13:02:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729681376;
	bh=mgBvfrl3vzYkOmmt/1RDTsr84t06CJd4a1PW6agEUnY=;
	h=From:To:Cc:Subject:Date:From;
	b=MC08WefE5jYCOunqjEPolR2OEF0I6OAhIkxuxXTlhlnnW3lTIpfaJmMVVf9yfwnhk
	 GT+WW9q9HfP3W+Ns8dTw3pel11YPfU+GDlsUK878P1Fy3hv0lz/AD/OTREO22fZrMb
	 YDczwbS7DzVS1s8rl/6gMoSUBWO3moSQW8M4F0vA=
From: Umang Jain <umang.jain@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	kernel-list@raspberrypi.com,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 0/6] staging: vc04_services: Clarify bulk 'userdata' usage
Date: Wed, 23 Oct 2024 16:34:00 +0530
Message-ID: <20241023110406.885199-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_040447_102287_196364E0 
X-CRM114-Status: UNSURE (   8.32  )
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

The bulk 'userdata' pointer is categorically abused through the
vc04_services interface. This series attempts to fix it and clarify
what it is and its usage.

Patch 1/6 simply renames a member for dma_addr handle for better
readability.

Patch 2/6 dissociates 'userdata' being used as bulk_waiter pointer
in bulking mode.

Patch 3/6 renames vchiq_bulk 'userdata' to 'cb_data' - which is what it
essentially is - data pointer to callback in VCHIQ_BULK_CALLBACK_MODE

Patch 4/6 similar to 3/6 for completion_data struct.

Patch 5/6 and 6/6 helps track the data pointer when initiated from
user interface.

Umang Jain (6):
  staging: vchiq_arm: Rename a struct vchiq_bulk member
  staging: vchiq_core: Bulk waiter should not piggy back on bulk
    userdata
  staging: vchiq_core: Rename struct vchiq_bulk 'userdata'
  staging: vchiq: Rename vchiq_completion_data 'bulk_userdata'
  staging: vchiq_core: Pass vchiq_bulk pointer to
    make_service_callback()
  staging: vchiq_arm: Track bulk user data pointer separately

 .../bcm2835-audio/bcm2835-vchiq.c             |  3 +-
 .../include/linux/raspberrypi/vchiq.h         |  7 +--
 drivers/staging/vc04_services/interface/TODO  |  4 --
 .../interface/vchiq_arm/vchiq_arm.c           | 39 ++++++++-------
 .../interface/vchiq_arm/vchiq_arm.h           |  3 +-
 .../interface/vchiq_arm/vchiq_core.c          | 48 ++++++++++++-------
 .../interface/vchiq_arm/vchiq_core.h          |  6 ++-
 .../interface/vchiq_arm/vchiq_dev.c           | 16 +++----
 .../interface/vchiq_arm/vchiq_ioctl.h         |  2 +-
 .../vc04_services/vchiq-mmal/mmal-vchiq.c     |  7 +--
 10 files changed, 74 insertions(+), 61 deletions(-)

-- 
2.45.2


