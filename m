Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCD4EA3C5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 13:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NP2RJ66pcWorJoxBXQYII24RrX/72c449YHlQi1jxp8=; b=1jdIlUVaD3DdoAphaVm2rSMjVH
	vt9r0cgdOlWFF3gLb87fRA1MNmNrYG5YHpwC1OT38xdVf2nW49/gobPunGqSMe74c2rN53/7GRUZQ
	QodD1L+8YezZzKN9uCue9+wj0aA1Lb25DlvIqtMHuU0Ay8Nn39WO0GWI5YLXqyDNb8BSFh0fsKLYX
	BE+CubAncEUTbXnU0cl9NvS0AWF2O8TOYsWgOryveSCEUtBI6ZYojEYM3hET0IZEFdKxpjtuWGJ43
	MlNMKySPzBv5MaIMskPuq0uSeWanP8RZBNupjsq8Y3S4yDIauo/O79HEoYSNz96zKNsY/Oy/ZP3DW
	joDLSpAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApnm-0000000AaJV-0jJa;
	Thu, 09 Apr 2026 13:52:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApnL-0000000Aa0j-06UZ;
	Thu, 09 Apr 2026 13:51:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775742700;
	bh=DMIweKgSOV3fIxZqhTvgTz9sRtOIz37xELaVKWgzSTk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ve14zFZ9i+yeRKHWwgsEz5P+v66JA7tDwkhMXZ8Aalp5WOttwW2F5W0TQZZewlpoJ
	 t/kLOh5SFVIq5WxxuSXqVbF6yXe6HQBr0OOJQeJyxtMMZj95KtJlJQhy7j3KjXm7DA
	 sGOp9IFCYRPFY0fbpcko5kapedROjNDeC1OzcGP1l8i/XQd/3maQ1+ECYIJtoCeRwn
	 YQ+y3EkW+q36PQcIVx7+/Q0fP4EIITjFc0n+ojtaREikctWPozUstChODtV5+ALBRy
	 KpkGnHQet7Phb9FTqzaju4OmfzE89sRE22rA1fkEHR0ZRjMKAMUkYlhNmsc0YJUx/q
	 3zgblwtSl+oJA==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A9F4417E1380;
	Thu,  9 Apr 2026 15:51:38 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Thu, 09 Apr 2026 09:50:41 -0400
Subject: [PATCH 6/7] media: rkvdec: Wait for all buffers before
 stop_streaming
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-rkvdec-multicore-v1-6-62b316abf0f7@collabora.com>
References: <20260409-rkvdec-multicore-v1-0-62b316abf0f7@collabora.com>
In-Reply-To: <20260409-rkvdec-multicore-v1-0-62b316abf0f7@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Jonas Karlman <jonas@kwiboo.se>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_065143_638698_C5F8C85B 
X-CRM114-Status: GOOD (  10.96  )
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

Because the jobs are marked as finished before the buffer are marked
as done, the stop_streaming callback can be called while the decoder
is still running.

This could even go further and deallocate buffers that are still
being used by the hardware.

Fortunately, to avoid that, the vb2_wait_for_all_buffers() function
can be used at the beginning of the stop_streaming callback to make sure
that cleanup functions are called after the last buffer has been returned
to the queue.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 5667d625f016..c2818f1575ef 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1027,6 +1027,8 @@ static void rkvdec_stop_streaming(struct vb2_queue *q)
 
 		if (desc->ops->stop)
 			desc->ops->stop(ctx);
+
+		vb2_wait_for_all_buffers(q);
 	}
 
 	rkvdec_queue_cleanup(q, VB2_BUF_STATE_ERROR);

-- 
2.53.0


