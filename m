Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA35CCC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 07:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=98Qa2o/S1XoEMPrlowsac7BQiNC+nqGa1kAsrr8UqXY=; b=er4YUcGae8q0rmzq7pkbLWZfsu
	9w4xKSHFV8X9TZdaMlCqdIqLdfqjYBAqmJ0EulUfQf1vmBz1k92ggRb+fetMaCEhdcg7UDNjN4kgy
	RtupWeBOKRqq7Sv67N0bDTEDF0Cjuu3htqVogJT1KkVcBFgxoBlk9uqqtzj/ZXRcGd43q+s3N5Imo
	7B6owmOvhPASvJp0doHQHr3E8s6QlhwFWadjZogcjusCyRDiQaWraVXg+XCT/K7/8v3ew8eV8yB4o
	LSCfFUqYZVLBV/ZC7Ltbm7PzSUaVpXDontSqoTgKxBx4E6NJpCp9UaiuJaI4OBWV25ZoV+uXAUB9B
	gK9YQriA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXEn-0000000CFau-1REd;
	Tue, 13 Oct 2026 07:47:54 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXEk-0000000CFaH-3cFf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 07:47:51 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so19505375e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 00:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791877668; x=1792482468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=98Qa2o/S1XoEMPrlowsac7BQiNC+nqGa1kAsrr8UqXY=;
        b=Jqbfd2ZVcN9pofmX1E8QdjPB+PDGvTSJSTbo9uw5QgrCMVb6pC6tLfeXORUA82n3aC
         NAzU7SVEPJGu0d0g1/0x1OE8LfWOmjUWelC0T+TaUmVWZnzQeQUfJ42HCH59g3uv8Jkw
         Ujw1uWaHginevIVyiqlPbjZqbwzEbWQHuwvzRmIXG4rRBXzG6bxxGkGcoaAXk7KUDqcW
         2l1g3BAvWwGC22jJhNnxrnQEbUoq6hs3x1XRXw7ku8Sb0p213zqyawPpo40lDSZtmPm7
         Xn3BdeOZZxnJN2XYgrFhBiFp5LfwPzXay5ktEbYUayffemzpYkQkLR2EwSDUhSU9eAX6
         Gsxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791877668; x=1792482468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98Qa2o/S1XoEMPrlowsac7BQiNC+nqGa1kAsrr8UqXY=;
        b=Jxt0gtlmB77s8xXZbIqC4bZe4Ftx5qSgPtjd90YlWyRtJZRp88OHkkQo8dcK7sslZL
         Nt3XOJpUFE2TUtjkFxACgTGNVVzmSQCYbcfLmJee9K2NIPQy2yZqe8eQMHP6R2nJCI48
         iiRFz6DyYTTw+wcww7ZDUKcbQwJ+tBAq5zFZGpEHzBcAJjyfiuAWQ6fv94cEIOusep67
         B46cHW2pgbx8Qwrlhy/gkbFVuZN2TEHuAwRkN8w9DD5AKsGVcSR6Qlr6471cZgPfx33W
         eP+FDQvi40EztwnUfuCxOkQ3ZMb+RKV2AtT+qXCwNNjfSWRUa0b63V6Ie1M/U6KN9mZL
         UhFA==
X-Forwarded-Encrypted: i=1; AKwUvBzuPGMZ6dMVa45i0RkvV+ncxliBjWs28zqukta5ZA5XPMKv7UJxgUI4IBrfCjHVOlrkUpxCv8SHGlr38qBmOLhI@lists.infradead.org
X-Gm-Message-State: AFq9FYJ7UHdZ/E3EzHOwrC1aoIiayb6bRuy7TyQA49aQ0H2vr676NzMn
	rHWMV/QzvOc7R+3ZoVFKXt6FdioDwdOvEBEUHZ8SzTmXU+tVGlvNfROx
X-Gm-Gg: AYBFou0TvO5Fx1mhVKtdhkd+Uwv6WVGRSZJh0KKy0MsHHuThMYgMeeqrYrEctCk2mbz
	+nX8BF4J0fisLxyo1sG45jEkAGephBs/M/JRJDNF2xnYEb9+a+HegF2RRmkJ6WUfb8PFtX+GEiO
	R04LVTgghu3PfVY7cOUss/UfsZzSDRxV5yfLCTm6Gw7pZEkxQTXYR8HHHQWty5p5ffMrVVTAlnt
	pRzoOT4+7XRYiFySrvkaGmznu3o2Zrrk44YH1PpN8m8I0fSG1lifpC7N/XIXcvkCuv0UHWbwEQd
	2jrT+wxZJVsd3jEtEBXYFM0yZ7lf0tFeyixu1TtyLQfhWNu1slp1vsQqDQdDlomXdkIgOEb6L4O
	d3sdJkd9tVhkYdRM7c7+MYTv8wui/do/S7RsLzwBvw0piE9REaYTRshb3kmz47f8fHywEqbb4dy
	qe4aYC/p4iIaS/SavFA/TXth+M+EGVHhFQswbcX5f6hcxo1qQXqh6kr0g9GfIC5gsGyVlKpPu+E
	NlaZA==
X-Received: by 2002:a05:600c:1c21:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-4a18e4b6241mr274887295e9.16.1791877668407;
        Tue, 13 Oct 2026 00:47:48 -0700 (PDT)
Received: from LAPTOP-AVI.lan ([2a06:c701:4778:c500:c7f5:a913:e714:a9c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f249692sm274850085e9.3.2026.10.13.00.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:47:48 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Pi-Hsun Shih <pihsun@chromium.org>,
	linux-remoteproc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] rpmsg: mtk: release channel OF node on device teardown
Date: Tue, 13 Oct 2026 10:47:44 +0300
Message-ID: <20261013074744.942560-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_004750_904685_F3C30A80 
X-CRM114-Status: GOOD (  10.15  )
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

mtk_rpmsg_match_device_subnode() returns a referenced OF child
node, which is stored in rpdev->dev.of_node.

mtk_rpmsg_release_device() later frees the containing allocation
without dropping that ref.

Release the OF node when the RPMsg device is destroyed.

Fixes: 7017996951fd ("rpmsg: add rpmsg support for mt8183 SCP.")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/rpmsg/mtk_rpmsg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
index 1b670ed54cfa2..430a9b2aa7bb9 100644
--- a/drivers/rpmsg/mtk_rpmsg.c
+++ b/drivers/rpmsg/mtk_rpmsg.c
@@ -168,6 +168,7 @@ static void mtk_rpmsg_release_device(struct device *dev)
 	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
 	struct mtk_rpmsg_device *mdev = to_mtk_rpmsg_device(rpdev);
 
+	of_node_put(dev->of_node);
 	kfree(mdev);
 }
 

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.43.0


