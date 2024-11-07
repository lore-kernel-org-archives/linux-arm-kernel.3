Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8C9D5D688
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 20:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=io8TXEYE9icYBRJ/cs7EIWEraXfA8nvVKqYfy+4pRMg=; b=Hzm1TuaE6ilC9KjEz4oCHtqY57
	Ai6QutiQNUzJHm4i9pXR4tZy6kH1fVyrNiXUakHwFTZHdyGiYRypUkAe+MOjmgIJ7NBb3X2jlDP+R
	etlMFV5BVnbq0+UW6OI6AqwINAMoD+zLJkgMV5mCxZIjbzGRh7Xmk7eUYeje4YsvMHzVArrApsR6f
	Gwhl5FM62MxHuKSZ7MNus4r3VNgey4n0sVhfOSWhhtkfI+PWmNNMDYZezf3gh+4FihHBVp0SeIo1A
	gGjMLk5nKOHVaZG2Dg3G5d36MqS2QNMQ7u/rg1QXszilolMjG6p96bMYJaod5R5oC4IYWWGSvB6m8
	KYBN35AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t98qq-00000008DCT-2AYe;
	Thu, 07 Nov 2024 20:11:32 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t98UN-000000088eK-10t7;
	Thu, 07 Nov 2024 19:48:20 +0000
Received: from umang.jain (unknown [IPv6:2405:201:2015:f873:c173:4b:4a04:3a21])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA73822A;
	Thu,  7 Nov 2024 20:48:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731008886;
	bh=GZ3n4cGUFb9X0QXdd9Kdf3Hk/WUzfeCTMfx/Vj51ysE=;
	h=From:To:Cc:Subject:Date:From;
	b=jXjBq2JlXpoAA9J7MX0LWSdJ/tjY8Pl5LCVuMjW9T9lJd8RHkA1frsHXyT4ssxyyc
	 R+9exTw54vl3e1iIZeq9grpedm/NOYSUBgHiAJku7yylySTRLmF5Qrkv7afqOobhB5
	 xJ8/71lKtccCxAqsbQ62NSlB5tL/3HAcYHBtqVO8=
From: Umang Jain <umang.jain@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 0/3] staging: vc04_services: Assorted fixes
Date: Fri,  8 Nov 2024 01:18:03 +0530
Message-ID: <20241107194806.90408-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_114819_448750_9B657E3B 
X-CRM114-Status: UNSURE (   6.43  )
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

Assorted fixes for headers and TODO file

Umang Jain (3):
  staging: vc04_services: Cleanup TODO entry
  staging: vchiq_core: Rectify header include for vchiq_dump_state()
  staging: vchiq_debugfs: Use forward declarations

 drivers/staging/vc04_services/interface/TODO             | 9 ---------
 .../vc04_services/interface/vchiq_arm/vchiq_core.h       | 2 +-
 .../vc04_services/interface/vchiq_arm/vchiq_debugfs.h    | 3 ++-
 3 files changed, 3 insertions(+), 11 deletions(-)

-- 
2.45.2


