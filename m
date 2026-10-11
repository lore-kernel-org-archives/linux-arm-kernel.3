Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90FECA9ECA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 00:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKMM/5NJTGuE+7PUxcL8x7aaEFcwMXWe96PcY9zklq0=; b=1yrmdfrFSv7yEzudDTO9HCib/s
	UhUnFMU0TlTGVdNIxmUA2Bda5KgJLIkQ3ZCFQr1dESGYdrzhPiGB4Ac5f8AFR805pfLPuyBU9UHMk
	3OF8xOSz/1lYsG/kXlbo5XsU+SX3p20qCqDLUybACmgtQrDdo6pTZOlogKdPoSLZPy0uMvRb8BVyC
	UmpN+kDTJV2+vpXsltqWl/i4A+V2DcRuA8DJtOk1Euo+9Ee9DYkCe0kLWVENx5WWw5EextuGU+7h1
	2Sa/wIkEBF2I5E3JlJRCSmS/QGDzLBaffT3lnu7F6nd/1EkhojX11tBrNvqUT6zTqSxmrqx3DF6jY
	NuYfSYvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFhey-00000008abg-24j7;
	Sun, 11 Oct 2026 00:43:28 +0000
Received: from mail-qk2-x06.google.com ([2607:f8b0:4864:34::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFhed-00000008aXh-2Omh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 00:43:15 +0000
Received: by mail-qk2-x06.google.com with SMTP id af79cd13be357-93bfb25817cso77594085a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 17:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791679386; x=1792284186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wKMM/5NJTGuE+7PUxcL8x7aaEFcwMXWe96PcY9zklq0=;
        b=l2yQ1BNJjYRuUv3az64IC7nFcoHdfoqNUU+40R3ThjC7RqGOIE9Ys3lg/6cuIfEjiU
         6ADeJdOssrDnE1GBGQesUiqmVxv77wTXkVWmy7DtsAq7psjFBRChGEYGz4+qpPAGe3UJ
         xOrePKIyqVoHxrtZ3q7JRAqulwhpfjgPsKP5Y3Qv8lKkWQKsxeDO1i/sl1RZPcQHuyJI
         PPadQ0J786M+iVvXMIx+GMp3OBQEFdHuFtJNAcxb9lSw6tBAQi8cFIQ9ssHG601+rzZB
         gzKCn9CUw8o0eyThTKvw8UFr8qugA9f+3IKczucY6oA34XhW3SB4CH8HVzF0Axjcud96
         LsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791679386; x=1792284186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wKMM/5NJTGuE+7PUxcL8x7aaEFcwMXWe96PcY9zklq0=;
        b=higC37JCxDou4i/Tf5sIPllnUEjIrPa1mK06lZmY5vDSuU0wsiO9lDnmxGVm4DTT1Z
         oiXjc9bRRNsw0DzcPq1L1FQbcpbixbb3UoTew9+PE1w00KiKKY8JG5VLP2/We58I0s6R
         ktXnFKHt3dDbVDX5SVJmKMSMHLufsBnpwV/MlvdS2f75rJQ9PFqpit88FUBvZIBrYO7/
         /Xan+BJcuWleoM55SI/GTUX8pEt8sK8Fbk0GY/lh/V+UmH/15LGWwbinVhjSnB9kpKXw
         aX37XNx9DgWgmkKh05MlvN2KPrOeuzwrnoOjF9YnUyZof89XDl9O5dq1IGyWXoeZwlaw
         YQsw==
X-Forwarded-Encrypted: i=1; AKwUvBxnpqX0dmdJLVzHIhrs0jcU8agstHamfLB+bvdavozha0iZQZxsdiPpCj4HgvxEGGR6UMYYqmgCK8+ugeH+mHdq@lists.infradead.org
X-Gm-Message-State: AFq9FYL6pYFXd+gJinOzj+1TWJI2AaRjRoPi2GNCK7OmDY8+6gmSpGVA
	+ET0GfLqpoJ9yqphK8IYdn8vClVpWX6GGQNBgZKTk0KZrD1yDIqFXUsX
X-Gm-Gg: AYBFou3jPbnCI6feKAGZZMZickF4yOBiSyYxfBXOowVlstBsKXM82isFPhImWWOAqpI
	Rsw4kJjFTuQNCF/2g/NR3j9yQScqfEKqfmQ7OZz5rz1cUFF4KZt7idPDot4a5nEL6Flhya/RY7W
	JurllLXAP0fH7/IGyTctzJz9cIjY10vCGKSa/WTNV/LF/MOv7+ZzHBnSNALbqh4/pBAAbOBRdqd
	Kki+Dd/tpO4zHVqtY/xCWPLClp5eCxJK3z2b6BQpLEnX5lIeSNvt4GItYCv8WZl0SQ+YOhZaUZ5
	Admp3G/AehEWC9Pi1zQRyMSLG3EXFGUS7AXCfuWua2mYGH1Re/TAuyrjhFyc6FPoYpcwZu70o8H
	DVhVvObYHrqa3+CIOAZG1syd4npOFoJsWI3cCx9OptsKZMeo5bRQFouHPhZkugPkz0/tVPW43fc
	BTYMxhhfhqqbp1YTwVC6DzrgBg65e+tUSMQ0h0e7ZaQwwPfIK3aJ0ZPj0D+6+QJqzmcKg=
X-Received: by 2002:a05:620a:3187:b0:93e:c12c:9b73 with SMTP id af79cd13be357-93ec12c9f14mr906360385a.78.1791679386387;
        Sat, 10 Oct 2026 17:43:06 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:6ff:277e:31c7:ac13])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9848702sm532320085a.12.2026.10.10.17.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 17:43:05 -0700 (PDT)
From: zoan37 <agentzoan@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jason-JH Lin <jason-jh.lin@mediatek.com>,
	CK Hu <ck.hu@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>,
	Nathan Lu <nathan.lu@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm/mediatek: mtk_crtc: Pick the connector route on every CRTC enable
Date: Sat, 10 Oct 2026 20:42:48 -0400
Message-ID: <20261011004248.1117649-4-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261011004248.1117649-1-agentzoan@gmail.com>
References: <20261011004248.1117649-1-agentzoan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_174313_616937_688E7CF6 
X-CRM114-Status: GOOD (  14.50  )
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

mtk_crtc_update_output() only picks the output component of a CRTC
with connector routes when connectors_changed is set in the commit that
enables the CRTC. But connectors_changed only says that the connectors
changed in that commit, not since the CRTC was last enabled. A connector
can be attached to (or moved to) the CRTC while it is inactive, and the
later commit that only sets ACTIVE then has active_changed but not
connectors_changed:

- If the CRTC had never been enabled, the route slot is still NULL and
  mtk_crtc_ddp_hw_init() dereferences it (mtk_ddp_comp_clk_enable()
  and so on).
- If the CRTC was driven through another route before, e.g. a CRTC
  shared by an HDMI bridge on DSI and a DisplayPort output that is
  switched off (DPMS) while the monitor moves from one to the other,
  the pipeline is set up for the old output.

update_output() only runs from atomic_enable and the lookup is a short
loop over the routes, so do it on every enable.

Fixes: 01389b324c97 ("drm/mediatek: Add connector dynamic selection capability")
Assisted-by: LLM
Signed-off-by: zoan37 <agentzoan@gmail.com>
---

Notes:
    Testing: found by reading the code. The same change runs on the MT8189
    Chromebook described in patch 1, where one routed CRTC drives either
    HDMI or USB-C DisplayPort: DPMS off/on and suspend/resume with a DP
    monitor attached come back. The sequence that fails without it
    (connector attached or swapped while the CRTC is inactive, then only
    ACTIVE set) was not reproduced on purpose. Compile-tested (W=1) on
    next-20261008.

 drivers/gpu/drm/mediatek/mtk_crtc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 704931b369b6..0bfd17f68282 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -695,9 +695,6 @@ static void mtk_crtc_update_output(struct drm_crtc *crtc,
 	struct mtk_drm_private *priv;
 	unsigned int encoder_mask = crtc_state->encoder_mask;
 
-	if (!crtc_state->connectors_changed)
-		return;
-
 	if (!mtk_crtc->num_conn_routes)
 		return;
 
-- 
2.43.0


