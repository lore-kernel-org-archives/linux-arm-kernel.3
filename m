Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759C4C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 12:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VweVgqDUJQ1kSuNrRmIIrWkoGES3ruNGpOhx1JTlt3o=; b=p4q1TSFSVHxUq5Ex8f5o03ptky
	KVQ7bRl/Yc0HSgqLqvmzpkK8RTx5dM0dQI7uoYlsACiLusaF4qwAda1YwhJ0vk9kttKMr5QgYfVMe
	/YXCVIjR0m9lyBhLePlA4/BQZuf2pA61eclgS/Arp/URgZVb5pyaPpoBnCfimAYmo8wNjmz0ndT0A
	i+oY2DA6Roi2AK0cs0IamugVpsX/eKxc97O7mwZpzuF1VBNP8E6DQ3d4fShETdNvrnrhu6azOxpW/
	LshJPQUwft+Z8zCS8ZFR1oqIUu1nvKtlQ16BFD8qNPOkwWWhoTyuDVL8tCdZdWY/M644pZkjcYLr6
	FW6F8ixA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tncnL-00000007Jwj-0pGy;
	Thu, 27 Feb 2025 12:15:15 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tncLz-00000007EP6-1qNx;
	Thu, 27 Feb 2025 11:47:00 +0000
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:a3f5:6799:2ce9:5b66])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C1906A6;
	Thu, 27 Feb 2025 12:45:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740656728;
	bh=m0byIXM8l1cSjYztsjedplkoLC9ZBtvnC08V8sv8PfM=;
	h=From:To:Cc:Subject:Date:From;
	b=U2/9bzRLid0pBsKRIyD9nae+aOeDLTcv4guOuQog4GnnVNNw17mnTz34zBreMfu1P
	 pUl8GEg2EhwH2JmV8vjxLqSalGj/ReCv6zNxKlWzjq9FxmXVY6F9rOaAYad74LIjYR
	 NRf7ES2BoZEwRAIRSHjmza5UGnxgB7e2hFR1o0HQ=
From: Stefan Klug <stefan.klug@ideasonboard.com>
To: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Fix full range quantization on rkisp1 based devices
Date: Thu, 27 Feb 2025 12:44:58 +0100
Message-ID: <20250227114558.3097101-1-stefan.klug@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_034659_798196_19FAA13C 
X-CRM114-Status: UNSURE (   9.77  )
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

Hi all,

After I sent a patch too early yesterday, I'm sending the corrected
version now. This series fixes two issues with the rkisp1 driver and
full range quantization. It was developed and tested on a imx8mp board
(Debix Som). With the current code it is impossible to get full range
YUV data by selecting color space JPEG (fixed by patch 1). But even
explicitly setting the range to full range results in image artifacts
due to incorrect range handling in CPROC (fixed by patch 2).

Please see the individual patches for more details.

Best regards,
Stefan

Stefan Klug (3):
  media: rkisp1: Set format defaults based on requested color space
  media: rkisp1: Fix the quantization settings of CPROC
  media: rkisp1: Remove unnecessary defines

 .../media/platform/rockchip/rkisp1/rkisp1-isp.c   | 15 ++++++++++++++-
 .../platform/rockchip/rkisp1/rkisp1-params.c      |  8 +-------
 .../media/platform/rockchip/rkisp1/rkisp1-regs.h  |  7 -------
 3 files changed, 15 insertions(+), 15 deletions(-)

-- 
2.43.0


