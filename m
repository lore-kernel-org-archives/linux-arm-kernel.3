Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03051CCF2E4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 12:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q1kDGFOBuUTvyA06Flp2KWhLjMc4oScSjHsi2pPF/t0=; b=uZWh5PNuoeRXbt
	3jsxWJC6jSxou7vn+d3YAuaxjmc7pme7Gvq7r/iQVvSbiURsHeXxU7rRVB/lU+EPmJqEuYs5cVkNE
	CZM2593krYn0bCs0GsLM72/ykgVBZd1LLNo/mB6oV3qkFPUizmi67+Xm3dkGuj1CLUEMQr61turRZ
	T5836Ku2xgpAYDOU0WN8y3E8m7romntBfWu9b1h2cK8tF2AROmHaFuxt7KWNXV8rnNZ5j4aNBU+GE
	J3jfsADM/3/Hvj5tiUYB1QBTlyizgVohGngaLtYyed/2HAJTdMv+dNWVtboDdXM7HbQGrwHOzocG0
	wFnV2edqNuSQiNarU5Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImYh-00000007OoK-2mOr;
	Mon, 19 Oct 2026 12:33:43 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImYc-00000007OlD-3OFH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 12:33:41 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so12123745e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 05:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792413216; x=1793018016; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q1kDGFOBuUTvyA06Flp2KWhLjMc4oScSjHsi2pPF/t0=;
        b=GC6TQILMwHA2H6cFc6XdM0anYHd/KnIzyTjV68NKQCuhW8VB7Ge4LXaHuTcLgqlYd3
         jhgwmiGnGWehYz90MaIMzsK+NqIUT73PSO+gSkZQAf7jm1PRaeIyOwVkq0WPaS+KVtYG
         +u3uQv+ZYRtMRrIWwJdz56frV01zzaXgnVMjrdhNrHHKqah7cswG/+njtHgB44YGmC8h
         RErVWa87wOQ7TS0haMtl5+GXTk0bguqItCPbR2QH+95Zf5u4AjNahepYHemGyqw7Tg4Q
         ZqikoV+i4NIX2lC9+j+w6XP3VFRyBRD7NwaX+lz2obbYFEASHOJmdGPIkt2KITIY3MDj
         e/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413216; x=1793018016;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q1kDGFOBuUTvyA06Flp2KWhLjMc4oScSjHsi2pPF/t0=;
        b=J/cimQoMbR30bDG+T06v+4aFXWjG53xR39Nzfp1LDs0yPBzEHVhxMe7ZWUbF5X24VH
         aNLb7VbspbmrnLqTGdbN3McRJMQi/JNWnQiz97Tpu+NR5wItxw/wyspY9FP/WqzX6jlg
         iadt5BcAkTSP/y0KkEP5/sLq81VryL6oKBwJltAl5mxRbWK1sjciXsCFSkxcXZ6LNDdk
         hniwQIsdmyahsGjM3yLeIV/7QGxxxQdn4WGR/QEsAizb39UtBp/0ikzPjXs5qX3zF1ae
         8kn+nUc+wbMuK+3+mleDNdgJ3ObPDOZu8aCte/d4Lp9rTDAQXu+sfWY97YwvDFteT6vI
         hkHg==
X-Forwarded-Encrypted: i=1; AKwUvBwdxDFa1PlUvpJ5dN3JN/ctPpQMZ0/3V7fIKRliJZRQ2LkeZY7V6cLYkaCPXEYyM8pRwjRgL7vIXKO4zrNuAn7l@lists.infradead.org
X-Gm-Message-State: AFq9FYJp1RCIbclHCYY6ebnu54JgAgsnjJSkMN0RzkMF8if9GO90ynqr
	ecjJqxAUK5dKoAIIgU8P2oHJr+H/18vziBIbjAvWHiq7uOp7M3GbNjzidB93t+ZK4Jw=
X-Gm-Gg: AYBFou107lgvdriyGaEs0CgMQyzpODmKCYlDuITganuCwFomXyMBzoBSv5SqiaD9ykw
	fw2ErtW0igCeKw9fXCV5fwwJnNVoQCav+WefmMcPAGb3CXiApyLVse1sqkt5kar5VW5lDYZfQ4a
	0YH5tjmlT0FyeE9z/++2H2aBTLeMBmvnK64imtH80B0sIML2093zFMchVRqy3Y+N7lwbRc9QNOG
	hIm8SPHFEIsUk56Z1BzSdzErQ9+h9mgHB9mkWCVaCjESHAgmeVk13tegcvUlzSR+hO+z8lew09H
	qbtSow4RlRLimFQyfvb79sgL7p7BV7LBlxfDHKxURH3cbPrgf7tIOVaYo/ioE2lchIAteTFjN94
	/zDKZgZUZe1oP1l/2xlPVrqsOnU9yFHD57p2GyV5aQO/MYo7GNHzjMMDb2aKx1OeR3nSxeBz2Wx
	nv/Qm9J6ibR3jqI8YIhyBYjgI+rJDQBiDJW9kCf164LCHtPrD5mWeJDRRFfvixwyOgPHCgYHMxm
	/dtdu4TDTCnKDcA+qujQXqhMk3QcBAMjKwQjyYBuG4oob2cwuaU+CTwr2TucAip+nt+/20RjveF
	3+pO45N18MCxs+qz82RYWfU9Gqik0QUmqgMO2syBYqyomHBNRyWmV3w=
X-Received: by 2002:a05:600c:154e:b0:4a1:e11f:b2e8 with SMTP id 5b1f17b1804b1-4a1e11fc15dmr105829485e9.34.1792413215929;
        Mon, 19 Oct 2026 05:33:35 -0700 (PDT)
Received: from [192.168.1.100] (2a02-8434-7c41-c701-8278-849f-666b-c282.rev.sfr.net. [2a02:8434:7c41:c701:8278:849f:666b:c282])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f576asm24677930f8f.32.2026.10.19.05.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:33:35 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 0/2] pmdomain: mediatek: mt8365: fix defines and add
 missing one
Date: Mon, 19 Oct 2026 14:33:54 +0200
Message-Id: <20261019-pmdomain-mtk-mt8365-fix-defines-v1-0-dfd445dc3763@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQrCMBBFr1Jm7UBTSbBeRVykyURHSVoyVQqld
 3daF3/x+PDeCkKVSeDarFDpy8JjUTCnBsLTlwchR2Xo2s6Z1vQ45ThmzwXz/NZdzs5i4gUjJS4
 kGNxAzqYUfG9BLVPVYzkKt/uf5TO8KMy7FrbtB6RUIEmDAAAA
X-Change-ID: 20261019-pmdomain-mtk-mt8365-fix-defines-c6be65ffca95
To: Ulf Hansson <ulfh@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_053338_876217_0808E1B5 
X-CRM114-Status: UNSURE (   9.57  )
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

While trying to add a missing define for BIT(25) in
MT8365_POWER_DOMAIN_MFG, I realized that the name was already wrongly
assigned to BIT(22). Trying to fix it, I also checked all other defines
for MT8365 and noticed a few other mismatches between the defines and the
datasheet.
This series fixes the MT8365 defines and adds the missing one. While at
it, also fix some indentation issues.

Cheers
Julien

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
Julien Stephan (2):
      pmdomain: mediatek: mt8365: fix defines
      pmdomain: mediatek: mt8365: add missing define

 drivers/pmdomain/mediatek/mt8365-pm-domains.h | 11 ++++++-----
 include/linux/soc/mediatek/infracfg.h         | 21 +++++++++++----------
 2 files changed, 17 insertions(+), 15 deletions(-)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261019-pmdomain-mtk-mt8365-fix-defines-c6be65ffca95

Best regards,
--  
Julien Stephan <jstephan@baylibre.com>


