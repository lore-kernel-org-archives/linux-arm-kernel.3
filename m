Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0E3C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 04:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LmbMgLZE7b6ypDWrYFdumpBtIii9gwTKgDBjmZLXE6M=; b=qGEXB/+xBXJG7nxq0TRipz4wPA
	wG/v9G63qlfutCzSR7YDcCu8Jf7Zf+birv2o+TyufW5SKP+G9PG96QnrkeIlNqYbT1twTXptXgLxh
	K5cJuvAaS3Jw+bAUaQXvj/sf/XweO8HCpDxxLjip4GFpqswy0VcIxAEyKFX1EAN6BJi/Cgxct5v6O
	GZBgdwtYiR23WXevfJx+CL2Vx82eqJcZ0H+Kt8n1brolc9QIPTdHztR5S4Tqko8uKjlg0ayXUAX5c
	lFXAZjFuVjSMvz1QRw8U8ugiQSlT7JegvmRmy/n4SoJlmJIKY23oiMUOxtfgag+HtdOLrUKdJ99ZI
	h7QzfKcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq2rm-00000009zRV-2z1q;
	Thu, 06 Mar 2025 04:29:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq2qB-00000009zF7-27bZ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Mar 2025 04:28:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=LmbMgLZE7b6ypDWrYFdumpBtIii9gwTKgDBjmZLXE6M=; b=fONIF490oO+k8y2bj/J/d1g0dq
	LAQXE4a0Vf10Bx+Se/C+wQZUaiACDu9iJk4ZN6DhUM6QXOJqXXyrtAP1SaDT6bv7qq1Q/PwWRjYzX
	DypJbIfGU32mkR9DdeNZfIo+ouGgk2fXi0odHlLr/RukfKl+7OaJkdxrFM0hLkjMk1pV4YrlidPou
	5vMFQ0ZBXJ/W3vP7NSPyiE1OQjgo+hxyi1wFWeL2RzYPRY4X+AfDz9l+Ukr1xqN3UIDKsS1wStSI7
	QS6d+WqYbtzsGAEptGMqHmu1VuQYRqoUZpCw7g6fD8O/BfCtHA7MLA0Iv3g4pS1CA15rEyjrH7xAP
	V3W6i2FA==;
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq2q6-00000000u0F-1ZvA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 04:28:09 +0000
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-01 (Coremail) with SMTP id qwCowADn7286JMlno9vFEg--.61141S2;
	Thu, 06 Mar 2025 12:27:42 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: jani.nikula@linux.intel.com,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] drm/exynos/vidi: Remove redundant error handling in vidi_get_modes()
Date: Thu,  6 Mar 2025 12:27:20 +0800
Message-ID: <20250306042720.2296-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowADn7286JMlno9vFEg--.61141S2
X-Coremail-Antispam: 1UD129KBjvJXoW7urW5Ww1UGr1DurWkXr4fKrg_yoW8GryxpF
	W7Kr92yryDt3yrAa4jyF1FkFyYya9FkFWqgr4Duwnxur4UArn7ZF4ft3WUXa48Cr95Z34j
	v3WDtrs8JF1kCr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8XwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUhZ2-UUUUU=
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCQ4MA2fIkRkNFQACs1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_042807_472279_7610FFF7 
X-CRM114-Status: UNSURE (   8.51  )
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

In the vidi_get_modes() function, if either drm_edid_dup() or 
drm_edid_alloc() fails, the function will immediately return 0,
indicating that no display modes can be retrieved. However, in
the event of failure in these two functions, it is still necessary
to call the subsequent drm_edid_connector_update() function with
a NULL drm_edid as an argument. This ensures that operations such
as connector settings are performed in its callee function, 
_drm_edid_connector_property_update. To maintain the integrity of
the operation, redundant error handling needs to be removed.

Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index fd388b1dbe68..a956cdb2f33a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -312,9 +312,6 @@ static int vidi_get_modes(struct drm_connector *connector)
 	else
 		drm_edid = drm_edid_alloc(fake_edid_info, sizeof(fake_edid_info));
 
-	if (!drm_edid)
-		return 0;
-
 	drm_edid_connector_update(connector, drm_edid);
 
 	count = drm_edid_connector_add_modes(connector);
-- 
2.42.0.windows.2


