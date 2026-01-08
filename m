Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF22BD1D494
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 21:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TemeuWi2wCTioypOE3JNNIJOW8KjtfzrrE2QX3Yv0/c=; b=3Zrl+km1N1TnW/7wpbv52J3PjE
	EjoLkJ7omfWRHrgkmL1BPJZtOZPi16Jz4f+hMh5Ht1Q95/srBytgMK952XpVdxKNQ4B0nYvy9/C0X
	CRTHRsLJOw56ruDzaWqZqYqlvyNlkLVoQLNmGRWCYfmb5PyDXkmGEVEqh8z+CY84TgGpbQZ+/RJPF
	aHK+QNdwthOlbBssyTz9Zhl2qVowGdiNPE3gU3f6qom+KrWMwmRWmAh3n8tPv+71VrZgyGwTyIf1z
	lb88psu/rZB3+9d3nq0fiu+k1xcM5VXn1ES7nK3nzIOGaUd8ZdiFGEldb16UZl0R5Fbcqh4PDCfm4
	AYtBfn/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxOO-00000000skt-1AaR;
	Thu, 08 Jan 2026 21:18:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxOL-00000000sjL-2NQv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 21:18:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TemeuWi2wCTioypOE3JNNIJOW8KjtfzrrE2QX3Yv0/c=;
	b=MdClGVAO8L/SdGOKt0kpM4Tft4Z+nETAjOxs7lvauG1+yqeS8Is5TQZyMv4BnNviVtDfN6
	cwN2Ipe+uD8VY1Je9QGGmaDsNAXoCbLebnX0mmXGnovq1TLk2zgGwGBvZPRWr5J/HwSUEw
	PRDXsTTy03es3BrMTDDdcVpZOX6rE4A=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-Zy6_Az_IOXWpUGFcGVY5ug-1; Thu, 08 Jan 2026 16:17:58 -0500
X-MC-Unique: Zy6_Az_IOXWpUGFcGVY5ug-1
X-Mimecast-MFC-AGG-ID: Zy6_Az_IOXWpUGFcGVY5ug_1767907078
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5eea3c9e00bso1071073137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 13:17:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907078; x=1768511878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TemeuWi2wCTioypOE3JNNIJOW8KjtfzrrE2QX3Yv0/c=;
        b=I9MCgXNutOzwA9OlQuzFt9MU6oWyZuuFMiaD+3ztojjka69lZGFL/5WQR7CEyZqece
         LbgSvl5LahD2YGCvWaXMwA8QYVneAfiAoSsEWw0yE9AQMaAfq3R+dRGrVayBZYu8sSCO
         RpqnBGN5kzGXQK3WcNpqYkubAjGJ/NyKl4yx3ZPn+3JROb5dDCo+EvPKBOmfMAV7l4hU
         iR+O1Kuep9VIevGpSrMNfLGYWecrOpKiqLnoDMXFL93bRxSvPeTEKQx6uTbVlPEXw9Zw
         Ab05IKu9TUJYE8Jc899MADnqTxtbVfhudrxb6EnLnFVgtioMddlBUFWBQVWvPGqPdjlu
         Wr1w==
X-Forwarded-Encrypted: i=1; AJvYcCVdmnXYsmNBH3Y29DUYnaDEnaEKue6eQAuoZRGQ2k2Qg2BWFbsFD/3yn+p7jfOzmI7y6oeUCHiM0n2OiMsSk/UY@lists.infradead.org
X-Gm-Message-State: AOJu0YwV0miGndpWx8AqHYBNmszxWj0oXIRb+ngrGLtyWvhsgTkOzwH8
	xPl6DBQYflYkWLQWmW0gQP1VLaFII/oG3J7wtnSc+m9YjkBmU7RVXRP1hAgP+2xy2mStaKzrITc
	9nczIAcZMkTol/wIydO02/crX8PRwgTUvMFPOpND7MxpdosLZHhsyW+XStX/XjU9HcNWIyuKCov
	Yz
X-Gm-Gg: AY/fxX6b2ptpGKBppRmiURukcxjUu16RHRg9B0BXjruP7RUiDYPjTGs0qr1Goif+YcU
	WrFqixJA6rRfrNxojK49AV2aiy/VDPzxIqL+T1I1PZNOl2Q/+Tm9mfu60RN2oJEsdyo35OnscFX
	5MOkAjSesPVyqMCRVKpqxSw1PMAqo07iESgpd/uBXZrKpWGEmOe568/ndowCQkKpsByY8n4/yt5
	faqwzq+AVj/Y4XF3VIm+xZ6QabBGPpmWx4xK5G663v6RBIWp/LDyNR4aaKuIEe08DBL+vAJdAbD
	ZI/tWepJ1qR0jOl6Qjcc0Dtj26dmY138nZhIeVKTvlx7BVBGqXO5kQIV06ViUHoXcrBJrG3XbMv
	lQHOLKO/jQXZOABo=
X-Received: by 2002:a05:6102:5048:b0:5db:e77e:7828 with SMTP id ada2fe7eead31-5ecb687b373mr3139779137.16.1767907078168;
        Thu, 08 Jan 2026 13:17:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHedDwn3URCaGkSiOZuFLs9y04mybp6etKanr4h3QJEAdm0N8i2NP17eLN1PW6ZVp8OknusUg==
X-Received: by 2002:a05:6102:5048:b0:5db:e77e:7828 with SMTP id ada2fe7eead31-5ecb687b373mr3139768137.16.1767907077681;
        Thu, 08 Jan 2026 13:17:57 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:17:57 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:28 -0500
Subject: [PATCH 10/27] clk: milbeaut: convert from divider_ro_round_rate()
 to divider_ro_determine_rate()
MIME-Version: 1.0
Message-Id: <20260108-clk-divider-round-rate-v1-10-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1629; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=K0FQ99DF6G2l9smIVVgE4dnwkD9e+LTmW0IKTcacQ4A=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5LYLpZoFf969VuziTr0HNSu8/TiOuTtmmn8+/lmri
 WGzhrZRRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABM5/JOR4f36uesTb501K1ES
 f/j/mABriXHF4nk+k2wehFR5rc7a6M7w38/60aErvD8luKQWMS3P3zDr/xet5RUJLAVeha45nCq
 V7AA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RlTzRakJgN4fpuNdQBCXfzN9PpzB53gAeSjUs_CtknY_1767907078
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_131801_678992_E4A960FA 
X-CRM114-Status: GOOD (  13.03  )
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

The divider_ro_round_rate() function is now deprecated, so let's migrate
to divider_ro_determine_rate() instead so that this deprecated API can
be removed.

Note that when the main function itself was migrated to use
determine_rate, this was mistakenly converted to:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value.

Fixes: fe67c682f91c ("clk: milbeaut: convert from divider_round_rate() to divider_determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Taichi Sugaya <sugaya.taichi@socionext.com>
To: Takao Orito <orito.takao@socionext.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/clk/clk-milbeaut.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk-milbeaut.c b/drivers/clk/clk-milbeaut.c
index b4f9b7143eaa658a7f2a14ff3cc9d91d8aa071c6..4e3790b7fc9064484c20a068d0315b8fc8241290 100644
--- a/drivers/clk/clk-milbeaut.c
+++ b/drivers/clk/clk-milbeaut.c
@@ -398,13 +398,9 @@ static int m10v_clk_divider_determine_rate(struct clk_hw *hw,
 		val = readl(divider->reg) >> divider->shift;
 		val &= clk_div_mask(divider->width);
 
-		req->rate = divider_ro_round_rate(hw, req->rate,
-						  &req->best_parent_rate,
-						  divider->table,
-						  divider->width,
-						  divider->flags, val);
-
-		return 0;
+		return divider_ro_determine_rate(hw, req, divider->table,
+						 divider->width, divider->flags,
+						 val);
 	}
 
 	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,

-- 
2.52.0


