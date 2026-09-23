Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27B6C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+bqb+VtEm4AKhCFkz+jnSq4qU2iI/9v5eFR8nmksBac=; b=KGV5NkoO9ZM7YqvcwGjEpfRGGd
	RzWx7Z1Pe5j7X4NOQGuNMhNj7rhWSFdmHpo4fdCA/bPWCt/7WsAHqE5JFbzbIr0JSa9CEaOt3wKGV
	p4k3L9JYTQO0P8+UEEPSOT2TgyP8nYW2jHn0dA/7JoiAhfSuuPlK0HlovTzfqwTneJlYQCJWmUOx7
	T4iqNg3yhFktsrKWF1zTzCw/lRcviPiVfQbohfQiu3kXrV617xRr9X4P2cU6P+x9DctYzrvcQBll2
	POVUmCXG6V9PGI4uAh+dLgKPtoSaBiY1EPzrlY/MeqKcJdQ0g5aBNq5JH050tVJsaV29wjmYn/S6y
	HK6qTHRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IU6-00000007YRn-3OpM;
	Wed, 23 Sep 2026 08:37:46 +0000
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ITz-00000007YOV-0hDc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 08:37:40 +0000
Received: by mail-pz2-x0d.google.com with SMTP id 41be03b00d2f7-cc50d1b048eso490012a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 01:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790152658; x=1790757458; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+bqb+VtEm4AKhCFkz+jnSq4qU2iI/9v5eFR8nmksBac=;
        b=m6B7xFa0KaHUeSIJ2CRymEXuSHgJRlWt0clCJZ0CIlfuCXIRSE+Jnaki85cOlxVVjq
         NxG4mt5VnZp7KPeURPzEjafAQcHxDdYisXyc8cPV7CPavyneFRv/vSd7lLxk6iEhvYer
         zfTwWvPCvfll0nUCuk9LCJT+UlTwlJQfctqU+Xskh2ThdKyxoGClTPMQumPFvj4LN7wp
         oPvsrWBxXvQkdvkUfzqmC5Ugwjtm+dwUWelkiFKz/uoMzEZLGi7chiEuzOwczyU+QSwn
         5VVqzFGQWkuI7WEYiXE2RhBqoeUOveyoh88vh8Q7um3kMz1KulGtr2LznnKBWbJt8znm
         PmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152658; x=1790757458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+bqb+VtEm4AKhCFkz+jnSq4qU2iI/9v5eFR8nmksBac=;
        b=qG9OYeQT2YmAZKbgFX3qE6yebLyhRzdTZxrWZmaMPnveYz9oax4kFF3TNfNbIAESmU
         DozPbTrLTEwcrDqVdwCF8pYK84nlIg9JT1LRGeHTzDNKrWeNuIc4q/Q3dlBXg4r7pXeT
         Qwh043QevA97ShErnuA0zFIBx2NtTfwP67BkeYV4oBEvhXnAxFgBDsv56Sj+9qgAHFE2
         mNPZ4W1XCQ+Tg2xxfWFhm/VuPFnPRCVh2NyAX5dWYZhK+hd/zSoNtl2Vi2g8DnU+gk8W
         8BuEFfxc3tdGIW1XMrUhEhn+lEB/VIvkNNnb1vbVSxMi68JlvnDABP5HcqVayO+lglVQ
         AMyg==
X-Forwarded-Encrypted: i=1; AKwUvByxGRcTof5Hwo/xin60lH7vfVlvsbPtbk3zkhbxe0ezUsWaaTuGUAXKGb5Bo9hDU0L30r4RYRyuifiDfJm6/tyL@lists.infradead.org
X-Gm-Message-State: AFuF++nz6s3cO/QLJQN7EkpsxCbPO0VHNwQ0yn5ALImDdlmjTTG8O/7h
	xTqYirNeQur+mGncRatxk0nJMvUqbw8F5Gef56u8luREMN0iOuo+X2zh
X-Gm-Gg: AYBFou0oPl8FFrMyOsbXrebahUnFjoaAHAunXfRzR2Hp6k4YiCrAwQu86naawxmYIUM
	o9nDmO/p6I1Y68nID+5LZ9SknzyAQkx3j0J7HC3uHQLACJvE5OXUe9kjJ7x8Mi9dPUpyX8S/Ryt
	ntF0UCLRAX34MOCFyqWQHaSU26x2u6xuSp4MKOQBscPIM6ZbERJFZ0/SaAjuBL0DnYrw30dGUIQ
	M2aR8l1f62yXQl0KNhjgJsr1eJU3p0TptbSL8PLjQn1OzSCY8UHFKD81yxdYbIzOO2p0OoXdetE
	KqpatzDvPGrWd2rEILLo5NVZtDd32LtBn6Q5kcnts+wkt9DAEEA2t9BD7zn+w0NAXtCFk1Z7G2H
	87DLLhE5JIyW2XtLuxrd/ogBVwvL4vsL2qCdj1XJZ3AEiIwResD2akdLT0IzD+XrtAlQHcMTW+j
	4+ppZd6trM3Kx4+Ze9WgVAoYl8XhxOHDsuZkcHEPvca2LpnevDehpbEnMskTUwNchO9FwsGDD4R
	CRrKJjCfazuyX5ue2REcUkY8UgyIB3olNECnwFDxg7uqIeJDk77vy41Dh8WEEN1/ie2eLKl0TOR
	D4ojXqz+d8Eu
X-Received: by 2002:a17:90a:e704:b0:39e:6c6a:6579 with SMTP id 98e67ed59e1d1-3a07e695391mr1778896a91.60.1790152657874;
        Wed, 23 Sep 2026 01:37:37 -0700 (PDT)
Received: from localhost.localdomain (ec2-13-212-242-176.ap-southeast-1.compute.amazonaws.com. [13.212.242.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07db883b5sm4314751a91.2.2026.09.23.01.37.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 23 Sep 2026 01:37:37 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: s.nawrocki@samsung.com,
	alim.akhtar@samsung.com
Cc: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: exynos4-is: Fix a race between s_stream(0) and the interrupt handler
Date: Wed, 23 Sep 2026 16:37:29 +0800
Message-ID: <20260923083729.64831-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_013739_203677_F8332EF4 
X-CRM114-Status: GOOD (  10.78  )
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

fimc_lite_subdev_s_stream(on = 0) sets ST_FLITE_OFF outside of the
fimc->slock protected region and only then stops the capture in the hardware.
flite_irq_handler() runs under fimc->slock and clears ST_FLITE_OFF, so an
interrupt can be handled in between: the handler finds ST_FLITE_OFF already
set, clears it and wakes up fimc->irq_queue before the capture has actually
been stopped.  The wait_event_timeout() right after it then returns
immediately and the driver continues as if the capture had stopped.

Set ST_FLITE_OFF in the same critical section that stops the capture, as
fimc_lite_stop_capture() already does.

Fixes: 6319d6a ("[media] fimc-lite: Add ISP FIFO output support")
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
 drivers/media/platform/samsung/exynos4-is/fimc-lite.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
--- a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
@@ -1209,9 +1209,8 @@ static int fimc_lite_subdev_s_stream(struct v4l2_subde
 			spin_unlock_irqrestore(&fimc->slock, flags);
 		}
 	} else {
-		set_bit(ST_FLITE_OFF, &fimc->state);
-
 		spin_lock_irqsave(&fimc->slock, flags);
+		set_bit(ST_FLITE_OFF, &fimc->state);
 		flite_hw_capture_stop(fimc);
 		spin_unlock_irqrestore(&fimc->slock, flags);
 
-- 
2.43.0


