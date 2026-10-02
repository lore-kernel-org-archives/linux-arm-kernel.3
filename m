Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB2ECA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 19:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rko1U6OoJC3n7W8qpIuhWiCDlnVmuYaiccHeKEGfF6U=; b=ZGDvit4sZpN3AswX8xV4/AED7U
	A1b4BDLzQVjcboIjlLpkCmAy9VR1MYtwA2dNZShdJXcQNjNb3h3a7eIkLCA3NgsJAh64SK3lyRVzc
	WpzZnxElQRQvzLF1/wymkDpIWTEl59OGbeApIIpql/3p51ZcigSxyiYlpRuJAB7vdA6jMDOb7wISX
	FWb90IfwJiIJB2l7O4/qNQ51y1HlLPhqJBYp4JJ3/xTsHKiqQ/lasXJsdCP4UJEmdBoxB9H/ylNjx
	aNqdH+HTUWSBx4M5fVIN0GDWNh6OGev+tWGiuay2LcmEHr6yOFjB8M6yMdBpnDmaZVnM6wa7MjZMN
	h5beVdEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjB8-0000000CQGT-3fcZ;
	Fri, 02 Oct 2026 19:44:23 +0000
Received: from mail-dy2-x10.google.com ([2607:f8b0:4864:36::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjB5-0000000CQF3-1sE4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 19:44:20 +0000
Received: by mail-dy2-x10.google.com with SMTP id 5a478bee46e88-3396cec93b6so9061799eec.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 12:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790970258; x=1791575058; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rko1U6OoJC3n7W8qpIuhWiCDlnVmuYaiccHeKEGfF6U=;
        b=SXjXAumYLFaDuvW7/GZ03bYqhhiOnb3izwedX+JDiKcPDHfJZZsjNOVYDqy+OT3k6k
         A6GChqEttYJcidOJfr5wvlsi1uMj/CJJdyz4fuwCa+22TRqf9Y5d8Ozgw6SmSAshI/h4
         shLeRfC4+OMiy4mYwM0T6Dr6BhmhwgqYSo4HfSHfIZLPH5yypy1V1sS1qBXnCI8QEiD6
         DogGPNzz67AQef1DWrfn3bxVXCq6jP8dPC5t4kymLMnExxlnIVcJv2xZmQcJ0i4oJtE4
         qD3gw8TtQUTwU3NLgS/H+k7d2bS+f9TuRh8ie8EGHmvqzkTyt5nO4OPI5fIA/qd03NYt
         8f5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970258; x=1791575058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rko1U6OoJC3n7W8qpIuhWiCDlnVmuYaiccHeKEGfF6U=;
        b=qQw2FIsC8g7FEAZhyn/EX4MbsuG6VXE43/N8oWCeMh0s7IbUoFJwoNqVWokDf3BKq3
         2Os2wwjS4OTNhirXOG/dOZ2zSMlgQXfaE3JZ+k/rIkH0U7f22YV4tTwGsL6qo034d2Ib
         QHrm8sWeVmd/pB9pKC+piANjdmZaBbTvdOo2pDWiQb2q1xlIPyUT9ngdbtg0n6sq9tLJ
         P162HjyA3aXB8zSLjJdYSjGV65z9ppLITlY/OIl7EBuIJgaXg0Bf3EGwpx1x5MtvJ9cN
         mr2TlUt0ubUNdewlt9OjVwN1pYgARZpwv3BELetBI3bxZqBFKhlpurIz6nNE4iTkb9re
         4MAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzH+wivqXsanftxSoDdf6O66XamJNQcxpuHZU0i4FqS5c+8g5fJ5jV/bx1/ayRBqwf2gtCQYQsxfvlexrD5EnkF@lists.infradead.org
X-Gm-Message-State: AFuF++nwn0/CZLriY9ChAMPYF7sKWpv1sW9qcrM5AFIFLenPA1JW6I7Z
	iHXxPxjWxQORoXjD+DxSxMW6D/MrP11/J4LrbpdijWkFtTXfSNgh1sANi7GVBCO/yGM=
X-Gm-Gg: AYBFou2b6RTMxzBtKzP6hQgrmryYtLtPOiSn2/lf/fArsLpCbXZ8vU0vdjs8RMqHkgc
	4yZp5mcFdwnUPcgnB42kDH/VXqFkKe7ch/dfkocl9nPIkF1/maUPhrf7Nhqz544Ra9bWVxokqTv
	Re4SsqkcyN9BolvAmW54n60PyR+L64yhOzKQHLpdL7aDe4Sp9An/0s0UwFK2CeQK2vI88rtY+SU
	nxfrC4q8COFQCL+y5GqBLBPIgFiH5MOhF4RhLQh259QWXI5aPAvjt0z+SzwjFtX7azSCIakrf5+
	aFVvt3UGl976F6oHwR9t7+RJnNmVW6jX6dXdDiv8eX9rE2Fmrj7Bc+n4HAf1eRKTDOfOPpc7vOM
	yJhVbxzWweKzeyTstjDk/Q8NIU21ymm6pJleo09+KvbN26D3hDOEEAMRYCY/C1uHn9IG2Ox6KTz
	n+lmSkjNUgWJ3MVPo+XVrl4GMN26x65m8OFLYFRavLLXB2hgrGibSlTCaJZI0Ij/wkEDwfmG6aI
	jU5YPZ4+oJiyUTFu5F6hBI+H+WkzyN8txqVf1nCTYCYPSQdl/t5fuUQJK8UQqdW88iMtyk=
X-Received: by 2002:a05:7301:4545:b0:342:94b:aa28 with SMTP id 5a478bee46e88-34f219610a0mr4295623eec.27.1790970257502;
        Fri, 02 Oct 2026 12:44:17 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bcf9:6140:24a9:d1e7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14fcd065sm7236803eec.19.2026.10.02.12.44.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 02 Oct 2026 12:44:17 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Simona Vetter <simona@ffwll.ch>,
	jason-jh.lin@mediatek.com
Subject: [PATCH 6.1.y] drm/mediatek: Fix potential NULL dereference in mtk_crtc_destroy()
Date: Fri,  2 Oct 2026 15:44:12 -0400
Message-ID: <20261002194413.20810-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_124419_482231_DAB35E77 
X-CRM114-Status: GOOD (  16.58  )
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

From: Dan Carpenter <dan.carpenter@linaro.org>

[ Upstream commit 4018651ba5c409034149f297d3dd3328b91561fd ]

In mtk_crtc_create(), if the call to mbox_request_channel() fails then we
set the "mtk_crtc->cmdq_client.chan" pointer to NULL.  In that situation,
we do not call cmdq_pkt_create().

During the cleanup, we need to check if the "mtk_crtc->cmdq_client.chan"
is NULL first before calling cmdq_pkt_destroy().  Calling
cmdq_pkt_destroy() is unnecessary if we didn't call cmdq_pkt_create() and
it will result in a NULL pointer dereference.

[ Backport to 6.1.y: used the older Mediatek CRTC file and helper names. ]

Fixes: 7627122fd1c0 ("drm/mediatek: Add cmdq_handle in mtk_crtc")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Link: https://patchwork.kernel.org/project/dri-devel/patch/cc537bd6-837f-4c85-a37b-1a007e268310@stanley.mountain/
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and drm mediatek maintainers,

I am working through the small CVE backports still missing from 6.1.y.
This one addresses CVE-2024-53056. It skips command-packet destruction when
channel setup failed before packet creation.

The corresponding 6.6.y backport is already in the 6.6.y stable queue.
The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not
in 6.1.y.
The target-specific adjustment is recorded in the bracketed note above.

Could you please queue it for 6.1.y?

CVE: CVE-2024-53056
Upstream: 4018651ba5c409034149f297d3dd3328b91561fd

AI assistance: An LLM helped identify, adapt, and validate this backport; I
reviewed the resulting code and validation evidence.

Thanks,
Artem Dinaburg

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 59b310f7327c86..8e72b3bb51eb94 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -161,9 +161,8 @@ static void mtk_drm_crtc_destroy(struct drm_crtc *crtc)
 
 	mtk_mutex_put(mtk_crtc->mutex);
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	mtk_drm_cmdq_pkt_destroy(&mtk_crtc->cmdq_handle);
-
 	if (mtk_crtc->cmdq_client.chan) {
+		mtk_drm_cmdq_pkt_destroy(&mtk_crtc->cmdq_handle);
 		mbox_free_channel(mtk_crtc->cmdq_client.chan);
 		mtk_crtc->cmdq_client.chan = NULL;
 	}
-- 
2.39.5


