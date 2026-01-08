Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D4ED1D494
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 21:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RBYDw4jtntgqBTWPIcvzRYHJL2SPvYBI1QtaKE/TrD8=; b=I7Tlgl4UkKPeIsSt0vM9d2HDuN
	aXf0tIOTfqykgRhdhYFNcHBogbHo3xRA+B8ejjhVcBt3N2nm737rY227a1uwBsy/HF1AkMcGf4ZRE
	lNHoFXjs+heNEftyBD9sq1WK8L/fOLAgN9HvUkV80MNT2B5k3KlWqbewgeWlh4yzL9QF8aD1N8vDf
	5F7VReBo7tzBrccUhGrXOR+LVAqtk4IER9OyafDJQYhr+XA8dvQOqGN6aaqBfhKM1Ann57Gxuon2a
	DZRbTrXSbhxVLQgo4JypD0y5J7LYEXly62YCK45XAIfIb19mRWB/NW+NmhtXc9NCxYUS0iOX6KfTZ
	u1ivHhFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxNs-00000000sRR-0ALx;
	Thu, 08 Jan 2026 21:17:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxNp-00000000sQO-3Hy8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 21:17:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RBYDw4jtntgqBTWPIcvzRYHJL2SPvYBI1QtaKE/TrD8=;
	b=HuJwp+AYHHE5MiWgtr/+oCN/XgqVpa3LM/QQ5nKGfgqYnjD5M10+jeLAebmyjeMS4PMTNL
	v4Qa54Vdm9TqmdD/tcC669qUbXHWtJ2kRKrcvbcq5XcgoEKnLJE4NqP4x9gkkRiuL6kGtE
	lrZywVSmZIZDTndRxwwzqH+8YR0CVGI=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-VwSBt0e-OjyXAczQ9Kh28w-1; Thu, 08 Jan 2026 16:17:27 -0500
X-MC-Unique: VwSBt0e-OjyXAczQ9Kh28w-1
X-Mimecast-MFC-AGG-ID: VwSBt0e-OjyXAczQ9Kh28w_1767907047
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5eea4536b99so1120220137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 13:17:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907047; x=1768511847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RBYDw4jtntgqBTWPIcvzRYHJL2SPvYBI1QtaKE/TrD8=;
        b=hfcbXFQ1Tu2DdeFGAlgK/fBxS0kknFHBpx8FGBVwmGfG9dWGHZ6B60wJKnpAQHlg0E
         q9pGpPVwY2ekfrIRc+iI3rssPBuBu4R+nUxj7B6wwbVVuV47Td/AF8/3nwI8SPav5vWJ
         2EYmRGeeAVo6wEld/VJjQOmTJyGfdW/YEk4Mo0ShmK+AyAP2jGQMlLLttXddQDQlco+s
         k7/NoAHVYo92g97jzGzx4yf+Wf2QdtsdEE7lEUoJAM6+m1qluPreWbHas3b4fKsdt99s
         8hndn2bKTYXRFg9zGjdKPmGhqUvYcq4KyeYj8a17NYePq1C8Q+9WwaCUveT/xG+3phYc
         CCHw==
X-Forwarded-Encrypted: i=1; AJvYcCXfL/6c67YXteecnKY8jzwTy1N2PD/FRHmJ+7vJSo/tpPb3iH5pAnbRZFcjKA4+Up1tTacbtUj5c7XET5pyGLVk@lists.infradead.org
X-Gm-Message-State: AOJu0YwDkQ6QakD30TTvIw5MfmDcrZ3XzJN5Bj/EtQXYrl89TQQ1Ty+O
	l4jZXueli4Z9nWIkab32Vvz3kmIm8lqAYkJtSovUD3rRd6x9LGBSnx2jWl6bUbxUM+k3FKxQnG0
	xtjMG58dLFqoEBpSva8ZD6aQuevpN335uLCwp8d/Ux3fKakXXzEdmwnkPk5W4Zu61Sw8mXCGLC/
	sM
X-Gm-Gg: AY/fxX7LwO3IXEAQXZVH20i1qFJjG/EH9MgD8uGZaJ5mYeuc/qcxrZ7THMLrrfiPOsH
	sGTNC0uHhwueMQ5B3r6A9A6KWlUo7r08dJWtEVgEn7+AWP8qWN+Qe7dLPh5I/OnbT9sPADd3jxb
	1Y4Lf4d5vifClsTLk95M7j3VIdV00Kwlbdgu2438neqjM4mSOPD71f5GmpyA6QApcf1I+LpUV5Q
	SOqsj7bqt/iIsSnu1D0Ujb1Vjv76U6HFRjYDD29ltLyTsqwLm1578JOOIK9Vy+qIyZKIUitxd4/
	sWxRN/qKQJHR0/GDBf9t8HC2Be6T0v6Jx37JXaOUggYNB0j9aX9RusPIwpKFx1rhrTk6whrKIun
	awHHJfYizn3Xc/jE=
X-Received: by 2002:a05:6102:f85:b0:5df:c33d:6e54 with SMTP id ada2fe7eead31-5ecb1e6f41fmr2971661137.3.1767907047323;
        Thu, 08 Jan 2026 13:17:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNwWf0onPsPTub4yUrXc/8gn5GVOhb2j2Ehx3Pvq6hJSQ86k2qUyrPeRzAHK7SxONIWAACBA==
X-Received: by 2002:a05:6102:f85:b0:5df:c33d:6e54 with SMTP id ada2fe7eead31-5ecb1e6f41fmr2971651137.3.1767907046907;
        Thu, 08 Jan 2026 13:17:26 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:17:26 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:22 -0500
Subject: [PATCH 04/27] clk: actions: owl-composite: convert from
 owl_divider_helper_round_rate() to divider_determine_rate()
MIME-Version: 1.0
Message-Id: <20260108-clk-divider-round-rate-v1-4-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1444; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=oUlYy3bQgFH6fzS/3MtHKlbPpAXM91oV6I4JsmoLqZM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5LZNVbC3CrDOT217EXJqI9Ne4XMhQefWP1OYu2P7r
 MOLjcQqO0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjI5BuMDJObVXpuGXl57amS
 l2BSj1vwJku5kld2uajlBmXJAIXsSEaGqXyCzj4/7VU/RbYxez003Hx3jkx+V8L/Ls+Vc//tyCt
 nBwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FwVXZfZ6ZxK8UTZTUPFfVdZOI6FCG-oAjjGkV5t0T8Q_1767907047
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_131729_896375_4590DC33 
X-CRM114-Status: GOOD (  12.19  )
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

owl_divider_helper_round_rate() is just a wrapper for
divider_round_rate(), which is deprecated. Let's migrate to
divider_determine_rate() instead so that this deprecated API can be
removed.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: "Andreas Färber" <afaerber@suse.de>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-actions@lists.infradead.org
---
 drivers/clk/actions/owl-composite.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/actions/owl-composite.c b/drivers/clk/actions/owl-composite.c
index 00b74f8bc4375a8f42e9b54c7bf1affe91e1074a..9540444307d6c960af200ec13e7c60abd47ffc85 100644
--- a/drivers/clk/actions/owl-composite.c
+++ b/drivers/clk/actions/owl-composite.c
@@ -57,15 +57,10 @@ static int owl_comp_div_determine_rate(struct clk_hw *hw,
 				       struct clk_rate_request *req)
 {
 	struct owl_composite *comp = hw_to_owl_comp(hw);
-	long rate;
-
-	rate = owl_divider_helper_round_rate(&comp->common, &comp->rate.div_hw,
-					     req->rate, &req->best_parent_rate);
-	if (rate < 0)
-		return rate;
+	struct owl_divider_hw *div = &comp->rate.div_hw;
 
-	req->rate = rate;
-	return 0;
+	return divider_determine_rate(&comp->common.hw, req, div->table,
+				      div->width, div->div_flags);
 }
 
 static unsigned long owl_comp_div_recalc_rate(struct clk_hw *hw,

-- 
2.52.0


