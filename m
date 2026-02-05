Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E843EC1E98
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 10:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2Dd7BTSth+KMcNQU9YekO9AVNHjwLtIiXtbPFSkyAk4=; b=BiL9Tk9rh89oYeznuVKB0VR/J2
	vcm385pmvPhHeTavZ9Y1lxOd97KEGdszAMyhgKmncYVlu8QT93ndw4G6mgZNTNKhW1NPwOmAt+vBb
	LP7odh4/98ISNpLpyYTVqO+DFae29ZTJ1Ohua9004Y9kluqzYfH5ul7fDOdcLWNdj5YbJyYM1IKu9
	RKx4U7s1bO3eIjs19f+s0kv1hcAOcj+VNY29JtS8pQx1GiEaEIAPPs3evmHXF60SlWHlZlGAGDPL9
	c7RLn0enrYOuSpc2b3hP8jGruZVVUSflr6rulTZA63CKAueaVLqvdo1vbI0RsrfM+rReYzDfk5gtN
	tokrCACw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwes-00000009mbi-0MAr;
	Thu, 05 Feb 2026 10:32:22 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwep-00000009mas-3YlD;
	Thu, 05 Feb 2026 10:32:21 +0000
Received: from t16.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC222227;
	Thu,  5 Feb 2026 11:31:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770287495;
	bh=nqkEWE8u3v5K0zhn+hN7T3tGMkKmwjfDCb3TALTIHg4=;
	h=From:To:Cc:Subject:Date:From;
	b=BPzSDVJ6klyXqDn/csJXDVOLbr/DUNfsqsAvrA5xvhZC746pZJRUgWIuajhQ5x3og
	 K8axTc5h+bxwAS77rHPYgMdsPbTn+gbLYaEupBacicBS7OET0TpEfHEqxic9US7YKt
	 4JQAhyBaKVDzdGLo0kirHBtnu7pSRYCox7ESk6Zk=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: dafna@fastmail.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	heiko@sntech.de,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v2 0/2] media: rkisp1: Add YUV bypass support for rkisp1
Date: Thu,  5 Feb 2026 10:32:05 +0000
Message-ID: <20260205103207.4020959-1-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_023220_044834_A34F36A8 
X-CRM114-Status: GOOD (  14.43  )
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

Hi all,

"Smart" cameras that do all image processing on the camera module itself
may not have the ability to output image data in RAW formats. These
cameras would require the use of the ISI, which is sometimes not
included in the hardware.

In hotplug systems, it is also impossible to switch between the ISP and
ISI at runtime, meaning if a media pipeline was set up between the
sensor and the rkisp1 ISP capture device, it would not be possible to
switch from a sensor supporting RAW formats to one outputting only YUV.

Thankfully, the ISP can be configured to allow the incoming YUV stream
to "bypass" the ISP blocks, allowing these sensors to be used. It
bypasses all ISP blocks and passes through the resizer, with the input
image data being presented at the output of the ISP to be captured.

In bypass mode, stats buffers are not provided by the ISP.

This series adds support for "YUV bypass", allowing sensors which only
output YUV streams to be used through the rkisp1.

Tested on: v6.18
Compile-tested on: media/next

---

Changelog since v1:
- Dropped patches 1, 3, 4 and 5.
- Removed the in_bypass flag from patch 2, as it is not needed due to
  the removal of the other patches.

Isaac Scott (2):
  media: rkisp1-isp: Set correct data mode for YUV bypass
  media: rkisp1: Treat 8 bus width and 16 bus width formats the same

 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.43.0


