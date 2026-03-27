Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8323910BA434
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 15:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GBOQYwWxJLZbFUEm/xyHdxZ6WK5WdZpA4GL5+FEdHNo=; b=xHI0EE1ikUcqKJ
	7e3j2tXU9x52frbDb8a/88kWCnJSBnd/ns6reTUw3TBX7gCrcSDoAivevIxm7qvUqGk+FppX+W9hK
	0U0gH9lr7GZ97rHT5WWNs8JtaATCrzFCAubZPjaCbjSl3LAg+Xq5cv75zkZL13Mqp+7vXvkbB3fED
	Aj6zCesqEv0E3hRE81qGNi3yFzeuLhbtQeBVbF0Gih0u/8sOnPhS8bjJ2avyUryn2AVChOmKzesb4
	FtleUwyW/ahyZNFQ8dmCrUUUX9YW2XsHHzyWfLmowIw9YAXsQ1LHQrv26LBYXMdKRXoxQHto0/Fzl
	pC/I5pJdPnIgBtVr4XeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w68uw-00000007fZl-1jVm;
	Fri, 27 Mar 2026 15:16:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w68ut-00000007fXw-15kG;
	Fri, 27 Mar 2026 15:16:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774624564;
	bh=GklGLwJruxxCBqdiF2yNlz/pCwjKi6IpbWoG97hl45U=;
	h=From:Subject:Date:To:Cc:From;
	b=NczD2fvsNvnPYKVl+HB0VESISWa5CSibbFLoh6UlXu3EChWSs1GQm3Sci17xbRMg7
	 cjK4CShwTzoHL+92HAp0lODxLULkNrmY2rxRbf6RKfXc66nZHaRKr6WQKXXyjydjke
	 WJ+jDWseoArnDRt5MQGnHQwbBXXMM3BMYcUrTli7Oi3sO/cptkgJaOcUCXtvuzCaWt
	 eNZ05UnqSOl1Fxu/m4toBSCDkGMZ9Ei7Y7MMksuuoK+qovWVpjwqD4HuC29g6x1Krc
	 ThpnmO7eqCXhOPOY8r9QbSiY9EikUHH4E7Kb6R121MHJ2u8UPBkde+vFtDmyaBU5DR
	 aMUIAWX9uNyEg==
Received: from [192.168.0.15] (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A059017E58B9;
	Fri, 27 Mar 2026 16:16:02 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH 0/4] media: rkvdec: Switch to using a bitwriter
Date: Fri, 27 Mar 2026 11:15:59 -0400
Message-Id: <20260327-rkvdec-use-bitwriter-v1-0-982cf872b590@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMAyA4VchPdOEDQPRVyEcXNdpNUHTDjQhv
 LsTjt/h/1cwVmGDS7WC8iImr6nA1RXQ/TrdGCUWg29817S+R30ukQlnYwySPyqZFZOL7nQOLaW
 eoKRv5STffTuMh20OD6b8f8G2/QB+N5kQeAAAAA==
X-Change-ID: 20260327-rkvdec-use-bitwriter-f1d149b3cf7c
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Jonas Karlman <jonas@kwiboo.se>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 llvm@lists.linux.dev, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_081607_522759_5FF365CE 
X-CRM114-Status: UNSURE (   9.63  )
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

Using bitfields in large structures where fields are mostly unaligned can
be hard on the compiler.

Issues have been reported with clang ([1], [2]) and, even though those
issues are addressed by clang devs, some setup can't or won't update clang
just to compile a driver.

Even when fixed, the compiler still might have to allocate a bigger stack
frame to manage misalignement. Coupled with other features like KASAN, the
stack becomes larger than the kernel's maximum [3].

To avoid this, let's drop the bitfield implementation and switch to a
bitwriter. There is already one for the older variants, so make it global
and use it in other variants.

Note that only buffer structures are switched to the bitwriter. The
registers representation structures are kept with bitfields, as they are
properly aligned every 32 bits and don't require heavy stack overhead.

Also note that the VDPU381 SPS and PPS structs are kept with bitfields,
for the same reason that they are small and aligned enough not to require
heavy stack overhead.

[1]: https://lore.kernel.org/oe-kbuild-all/202601211924.rqKS2Ihm-lkp@intel.com/
[2]: https://github.com/llvm/llvm-project/issues/178535
[3]: https://yhbt.net/lore/llvm/20260121230406.GA2625738@ax162/T/#mad878ec24a8224e1387ef5e73cb77b9ada55e3f2

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
Detlev Casanova (4):
      media: rkvdec: Introduce a global bitwriter helper
      media: rkvdec: Use the global bitwriter instead of local one
      media: rkvdec: common: Drop bitfields for the bitwriter
      media: rkvdec: vdpu383: Drop bitfields for the bitwriter

 drivers/media/platform/rockchip/rkvdec/Makefile    |   1 +
 .../platform/rockchip/rkvdec/rkvdec-bitwriter.c    |  30 ++
 .../platform/rockchip/rkvdec/rkvdec-bitwriter.h    |  25 +
 .../platform/rockchip/rkvdec/rkvdec-h264-common.c  |  51 +--
 .../platform/rockchip/rkvdec/rkvdec-h264-common.h  |  40 +-
 .../media/platform/rockchip/rkvdec/rkvdec-h264.c   | 109 ++---
 .../platform/rockchip/rkvdec/rkvdec-hevc-common.c  |  92 +---
 .../platform/rockchip/rkvdec/rkvdec-hevc-common.h  |  57 +--
 .../media/platform/rockchip/rkvdec/rkvdec-hevc.c   | 171 +++----
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c | 351 ++++++--------
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c | 502 +++++++++------------
 11 files changed, 578 insertions(+), 851 deletions(-)
---
base-commit: bbeb83d3182abe0d245318e274e8531e5dd7a948
change-id: 20260327-rkvdec-use-bitwriter-f1d149b3cf7c

Best regards,
--  
Detlev Casanova <detlev.casanova@collabora.com>


