Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2F3E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 07:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZK4ANdQwMthdZPgZXovlMz9cS65njBFRy3Gen4Y5IGE=; b=KO7GPUcP+SBIYkUq+nb3/Wdz+n
	4gzHjZBZGqCyuASX5CCM0neDjCjlCuxHSXSn/j1f2r9SaaxKKPqkGAgaMl9r2qw1SzkxvI/RG3KaV
	Z4wggMCb7zhgU9fz7hfNFFNbHV2mV66+FDnUeK32fh+I3Xb87u0hpCzbRfIOjU9tPRzVvv3R0qM3P
	JUxAVnujkvHTnuqa7bw6imecNDVTpIAMO+E7ey2d/40kl/gHA0iKADylMFgXPB/VfUCo7/VaZUd+6
	EjVhkmiZ1FLMBt071Nb8rtWnIrYQ4+iwif/WcLjqZsQYcXAXas2U1ES3voYqvUA/B9C0QBkzPIXvE
	VzoLu7SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOBOC-00000001B7V-2YyY;
	Thu, 19 Dec 2024 07:56:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOB8r-000000017Zh-2T2X;
	Thu, 19 Dec 2024 07:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZK4ANdQwMthdZPgZXovlMz9cS65njBFRy3Gen4Y5IGE=; b=HFV1EV+US/WRTNvPiH50JiOqLV
	45+nt83L7yn/r/uwaTwDqqms+wCaUeIOOUsjgRXOP6x0XAlNnxLXJ0J9k7DCRxkt+i+k3MKLm7jZ8
	YeKPASktI3JWPuENee7QXEVvB8/Q0T2rO8PsdBdjNCPTxACaqeZ/ARnqUv3UgSH7UZxpNWyvLw4EO
	FQTVMYpbI8SAiiCK918/K62/Cwc3lZksuBA1sJRdfsZY8t5ac+Jhn/jd0obnXAtUoXrEKY0YPo2zo
	bHfWK84HUsY2ayb81vVkAjtQQ23PGllC5jbpzRcwY0G2Fkt5we2Jdinohw8e5O8YpCVyNSanaPVwM
	sqcpS3MQ==;
Received: from m16.mail.163.com ([117.135.210.3])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOB8n-00000005PFk-0En3;
	Thu, 19 Dec 2024 07:40:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=ZK4AN
	dQwMthdZPgZXovlMz9cS65njBFRy3Gen4Y5IGE=; b=LDOrvX74cr+LEUCgRVC/3
	447ZQIkc2dAKUsYaaVriVA1ERKWIEilDdwRHmLs9IzEDvCHSl/2topw6HSdjUgW1
	gXqcnzgnLNUgKjw3iXOk+pka/vUMHde6N2aQxD0LgrNNeauIHYR2DsgSmSzQnARG
	dpYD6y3rX2FKF7/Ef60N6E=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wBnUtq0zWNnL5jUAA--.6492S9;
	Thu, 19 Dec 2024 15:39:43 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	krzk+dt@kernel.org,
	sebastian.reichel@collabora.com,
	devicetree@vger.kernel.org,
	daniel@fooishbar.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	derek.foreman@collabora.com,
	detlev.casanova@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>,
	Michael Riesch <michael.riesch@wolfvision.net>
Subject: [PATCH v7 7/9] drm/rockchip: vop2: Add uv swap for cluster window
Date: Thu, 19 Dec 2024 15:39:15 +0800
Message-ID: <20241219073931.3997788-8-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241219073931.3997788-1-andyshrk@163.com>
References: <20241219073931.3997788-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBnUtq0zWNnL5jUAA--.6492S9
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFW8Ww1kAF4UAw47JFy7ZFb_yoW8XrWfpr
	43ZrWqgr45Kw4Iq34kJFW5AFWftwnxKay7Zws7tw1F9ry3KFyDGwn0kFWUArnFyanFka17
	tF93JrW7Zr4jvrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jsZ2-UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqRm6XmdjzK8caAAAsH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_074013_597237_599760B2 
X-CRM114-Status: UNSURE (   9.69  )
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

From: Andy Yan <andy.yan@rock-chips.com>

The Cluster windows of upcoming VOP on rk3576 also support
linear YUV support, we need to set uv swap bit for it.

As the VOP2_WIN_UV_SWA register defined on rk3568/rk3588 is
0xffffffff, so this register will not be touched on these
two platforms.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Tested-by: Michael Riesch <michael.riesch@wolfvision.net> # on RK3568
Tested-by: Detlev Casanova <detlev.casanova@collabora.com>
---

(no changes since v1)

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 0b79f2006836..0ddfafa3c208 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1373,10 +1373,8 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 
 	rb_swap = vop2_win_rb_swap(fb->format->format);
 	vop2_win_write(win, VOP2_WIN_RB_SWAP, rb_swap);
-	if (!vop2_cluster_window(win)) {
-		uv_swap = vop2_win_uv_swap(fb->format->format);
-		vop2_win_write(win, VOP2_WIN_UV_SWAP, uv_swap);
-	}
+	uv_swap = vop2_win_uv_swap(fb->format->format);
+	vop2_win_write(win, VOP2_WIN_UV_SWAP, uv_swap);
 
 	if (fb->format->is_yuv) {
 		vop2_win_write(win, VOP2_WIN_UV_VIR, DIV_ROUND_UP(fb->pitches[1], 4));
-- 
2.34.1


