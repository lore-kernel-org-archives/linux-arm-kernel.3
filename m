Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F9CD3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 12:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mPFZD4pa0qe8EUtPfRTXmK3rQTpd7YvTU5TQV57xMAQ=; b=rGZAU+w8R5OXIdRE/4HgAgNGgU
	QXknyGvzrq84uAvjhSMTg2y02oMMiNXFxJBoOMHb6cQyT/6txtOFg2ezEMh0SfZ12fGBgPjEH4dMe
	Wb6IKrod2PolZIifxZneBJl6PQcXE9DUsSaxRhpGCdk2rlmY7argg1ojjqm7UySO8pu9UhteyJgHy
	vu0u904lSojRESD7Vp5m5NfOooeHHQDcvKWb9PaPIKfcIbqY8uihvzDCOGW6meg0Q7bw9ukatfD/1
	jcWWMqWpAP1Cp5X/SbXrW/AV6Dqvhmd8grTrBHpkKA+5yZtRMpfTWC2iLSLfidx1fCu1K6HIoGwDH
	hj/YBD5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSwsl-0000000EFI9-3RTf;
	Tue, 09 Dec 2025 12:31:55 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSwsj-0000000EFGx-3Njp;
	Tue, 09 Dec 2025 12:31:55 +0000
Received: from isaac-ThinkPad-T16-Gen-2.infra.iob (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC3FB667;
	Tue,  9 Dec 2025 13:31:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765283507;
	bh=6nkPAaFnJtZWqHjfWRExA7w5rIBqcrVJKOcMVmoZAco=;
	h=From:To:Cc:Subject:Date:From;
	b=JUxqUeoWHQEzltin3ct5hFJ7jAkR+R1h1zg5u1N2eDxMa1RczSFmwUF0cXsIMH943
	 JFOAq/BZaybEL8nD1+a4+KOrWNRV7kiisVCfeNmU2ELWVdptbPA3tpbFDtgj9D935K
	 05ovnCbcFDSpLpmOn36lAY3HFI3vM15EWef5LMeA=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: dafna@fastmail.com
Cc: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	heiko@sntech.de,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [RFC PATCH 0/6] media: rkisp1: Add YUV bypass support for rkisp1 
Date: Tue,  9 Dec 2025 12:31:30 +0000
Message-ID: <20251209123136.273938-1-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_043153_985145_FAEAE047 
X-CRM114-Status: GOOD (  12.59  )
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

Hi All,

The rkisp1 features the capability to use YUV bypass, which lets input
YUV streams to bypass all ISP blocks, and be presented at the output of
the ISP without being modified. This functionality is uimplemented
currently.

At the moment, it is possible to get YUV streams at the output of the
rkisp1, but only if the input is a bayer format. This series allows
YUV to be accepted as both an input and output format, when the YUV data
contains embedded H/VSYNC signals, which are interpreted as the data
start/stop signals for frame data.

This series is tested and works on the Debix Model A iMX8 MPlus with a
GC2145 camera sensor outputting UYVY8_1X16, compiled on top of
media/next.

I am marking this series as RFC because I am keen to know if any other
developers have any ideas on how to improve the series, or if there are
other considerations / edge cases that I need to address.

Thank you very much!

Best wishes,
Isaac

Isaac Scott (6):
  media: rkisp1-resizer: Add YUV source formats to resizer
  media: rkisp1-isp: Add in_bypass flag for YUV bypass
  media: rkisp1-isp: Add target_format
  media: rkisp1: Set input configuration to data mode in bypass
  media: Propagate sink -> source format in YUV passthough
  media: rkisp1: Give buffers back instead of dropping in bypass mode

 .../platform/rockchip/rkisp1/rkisp1-capture.c |  5 ++++
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  1 +
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 25 +++++++++++++------
 .../platform/rockchip/rkisp1/rkisp1-resizer.c | 16 ++++++++++++
 4 files changed, 40 insertions(+), 7 deletions(-)

-- 
2.43.0


