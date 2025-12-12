Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7179BD59D6F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 16:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+cf2YB2yPY6D9Xqu12v/MSaqOZTHilr3XRxCT44e6Zc=; b=ovopEF7/QFv1IRcEY/HWRBF2m8
	21ZsTQMgL7lX8pqnoaWa3kVvVI8Bgi+MzH8x9SWvu0D7qj4m/qih51DKrG/ECmk5DzGYjTEf2f1Ao
	PwtX5rkfhTPNvz4UYN+ZS7NQw3uQQew9jSYJJKaTs5+zqrJJME7vfL/DFvHDWsjP+hT5jVrDzBTAo
	T/B/LqL2SehcbPVmdxXdj6hiBMtqdBH6gb+rqN2oITIg8ULcpk5urMk7OtDBkRapOvengr2A68T1Q
	83ld46nWtKwQQcB6wq4CCMxwD3avdw3eP4V+cuOmwoQQT1OQ8nnR2+IgYG/vjCpG7jz0FuuiRpNcJ
	n4CRIsmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU5aR-00000000nDp-2PjG;
	Fri, 12 Dec 2025 16:01:43 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU5aP-00000000nCy-0jlb;
	Fri, 12 Dec 2025 16:01:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765555297;
	bh=6C8YphqfTDdebCVna2Q5xUBkPyfF4qogtfqUDvYjttI=;
	h=From:To:Cc:Subject:Date:From;
	b=DsvJs9f1sRzjm+YY0eNrDP1xdN/n/oLQlVdleX2EJ3TcFQ/AMdOiCLvuWhChrgSzm
	 mnFSpgGQbRfZLvUYjNTY6rwzmcxvX9cvXvEpZ+QKuxOcL8xmaQyU65ZEDGAfCZL12a
	 Nm/eYEwdXeCwhTnKkQHnc1UOYowI23+YpdfI0cGtfB2mkeMy/5QKMcKHhFwkWwc3lL
	 VPAzNrVyVfzxFISh/2nhllw7zso6KW69QHmjwGTqkUGZ0lSvCqoe7w29tnvO2lxZb6
	 yJo+bHKpER/VlFNxX6rKgA1hW78A7C58FeUx3WqFWCE/TZnJ5cyU8k0LNFmYhkp9xI
	 OCc44jmhB5XQA==
Received: from trenzalore (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0A77B17E0465;
	Fri, 12 Dec 2025 17:01:35 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	kernel test robot <lkp@intel.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH] media: rkvdec: vp9: Fix probs struct alignment
Date: Fri, 12 Dec 2025 11:01:01 -0500
Message-ID: <20251212160101.146684-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_080141_404980_9748F4C2 
X-CRM114-Status: GOOD (  12.10  )
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

When building for arm 32 bits, the struct alignment changes and the compiler
adds 3 padding bits to the anonymous mv struct in
rkvdec_vp9_inter_frame_probs.

Therefore, the BUILD_BUG_ON used to check that the struct size is aligned
to 128 bits (hardware requirement) fails.

As that mv struct is at the end of the global rkvdec_vp9_probs struct
and is followed by 11 padding bits, the 3 padding bits can be explicitely
set in the mv struct and removed from the 11 following it.

This makes sure that the mv struct is 32 bits aligned.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512110229.R6YCf1Le-lkp@intel.com/
Fixes: d968e50b5c26 ("media: rkvdec: Unstage the driver")
Suggested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
index b4bf01e839ef..23c733ca2e8e 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
@@ -66,6 +66,8 @@ struct rkvdec_vp9_inter_frame_probs {
 		u8 fr[2][3];
 		u8 class0_hp[2];
 		u8 hp[2];
+		/* 32 bit alignment */
+		u8 padding6[3];
 	} mv;
 };
 
@@ -85,7 +87,7 @@ struct rkvdec_vp9_probs {
 		struct rkvdec_vp9_intra_only_frame_probs intra_only;
 	};
 	/* 128 bit alignment */
-	u8 padding1[11];
+	u8 padding1[8];
 };
 
 /* Data structure describing auxiliary buffer format. */
-- 
2.52.0


