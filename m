Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8134D1D48A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 21:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5VJzg69xakfxW3VOCyLK7wumPwPeLQPf6YPBQqS8knU=; b=SSZ7upLmFkFEkpJ/1gwAgIxruz
	VXfk57yopzwKzhnhIDKU2ZYVYSNIunkmzC3uYPJrkQdCNjCz66KYvbq/b2uwjM0DrAONZe/cOi9r7
	0zD5HNlkfZqHSdwyIc+yoUQpXQDQF4j31iHzcNUKtVi1sRewJHPC3dNI9ysU2w/4rD8y3X5QKq5jZ
	VvbFzSAGAD0r+BVIfMiriyVJjP8D3dSsYCIT4YdKfxS64S1zF5r0M1KwY24RpwP6mXms5BzvwQOwo
	3wp2N77ltjvko/ZQ3Fm70ARIewL4E/5gF5dUS29HUiYgozUjqRHDFtBgB1Ry99Kh8zc7acwGI5jC5
	o5bi3WYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxPC-00000000tFz-10eP;
	Thu, 08 Jan 2026 21:18:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxP9-00000000tE6-2wFz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 21:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5VJzg69xakfxW3VOCyLK7wumPwPeLQPf6YPBQqS8knU=;
	b=GdghG0vA29eBSTmbLZqAG+tuhKc+aHR2Wko3I440SuzeFSzOajaGrdsKlg5SrV6/k0+ahf
	RIYtVQL+dqnDcfqM5GrP6yKs9CINzlV8e7QkT4fPstvoQln6ZzQ2YC4HGdSP5XiA4uz9Z6
	m6NjxlEHdVWiE2QGXgy+D6sN179nQbY=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-hHD6ijnMMNGI7pxuMzqrIg-1; Thu, 08 Jan 2026 16:18:49 -0500
X-MC-Unique: hHD6ijnMMNGI7pxuMzqrIg-1
X-Mimecast-MFC-AGG-ID: hHD6ijnMMNGI7pxuMzqrIg_1767907129
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-93f550cdb2dso4448848241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 13:18:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907129; x=1768511929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5VJzg69xakfxW3VOCyLK7wumPwPeLQPf6YPBQqS8knU=;
        b=a0YTUaRoYdkCy2zP2MxCPKxYWzewZlQnzM9WmNt3bheKX97KlaFa4F3ZOWziMk2jZ9
         +z6npSaxjAtbtMohVM2lLemWcBXeDNRFY5YNpJbMvQ6z1o1suj5NGmEB0/MRHfVYWajO
         1/ld5AFCWGRQys+3NLLDhpeSzJnOJvLuucXRT+dZfe0GvB14Ni80A8QlMN/dQKFlwn1c
         xN8nNXe+xMNDuO3OamXEV/mfx0yVTSkF/W8pnyue2rfAteBCS94TtKLzaj3b1Moi3+2Q
         ChX4PuDVlsORs+k51HFcIFI57tLQboxa6+LZ0/6IaVNnq/rnZWi7LQI6EWcrAlAMgu3f
         9Jdg==
X-Forwarded-Encrypted: i=1; AJvYcCX3TpCV/LK/OnbIyq3jKoDVtPmpzM7BVhKxpBoQaS+67X4atdGNltN4wkimeLj7M8n6eXY/VRVPhfB2QaYNHdWh@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3CuH3PNtp2X6j/+8+TF8cfhqe8fUkHZV4UAK6ZLqWO8L0mC5K
	0DfDvxr1Anwpm82yXKL4f8poG4E09hQ6JNjLgc6Nriurb9TV7+phhM6WPVYe2VN5nDMMZopZENi
	TQWcqHdrCN9vLWKCQ5jLFG6ghJVx9AnlILWFHo3G9r/R/T5borO2RbQsP9TMrQ6Ai4qexzMt/Wu
	Xl
X-Gm-Gg: AY/fxX6w1E6HsFqoU1etOl9d/H9umaBHP+zRZM/uQLpgLbYe7TAXXj1p+JDmgxn81le
	WA8zfzuvyzoSj+L0uwplFxvBn6ujhXZfmCG9qZk8Uhhp6xju7sp3k1MPG4BoljE6BlXmqsykyvZ
	L/u7UMNXpJ65crsLqIOWl+4MEXlhA4BtbMR2Lu+fj1AEnHM3S+gHoKg4SDZwLuqMu2vKTjMO0dj
	K2izanAkygbzbVEnnGZee+AA9dtyyGFSaldL+mYYiOqRYBrqYP2BzJnODYxGB83axR5RZoYwTPf
	76H0ouLnvlxAOjH+jUiKfm8avBQv7hjf316kghNHKQmcLwe4Jgx0e5ART57O9lPz30/oQpHxj4q
	TzNI1K9QXYM4MAt0=
X-Received: by 2002:a67:e105:0:b0:5ed:f26:5615 with SMTP id ada2fe7eead31-5ed0f265843mr1992111137.18.1767907128958;
        Thu, 08 Jan 2026 13:18:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLX2O0KlmxzrMSo3tby5b/YZN082iMeszi4qbktrWtgNvTKagIIyv7NxGpAo9E2TfU0DUiFg==
X-Received: by 2002:a67:e105:0:b0:5ed:f26:5615 with SMTP id ada2fe7eead31-5ed0f265843mr1992095137.18.1767907128511;
        Thu, 08 Jan 2026 13:18:48 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:18:48 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:37 -0500
Subject: [PATCH 19/27] clk: stm32: stm32-core: convert from
 divider_ro_round_rate() to divider_ro_determine_rate()
MIME-Version: 1.0
Message-Id: <20260108-clk-divider-round-rate-v1-19-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2367; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=HZjZ3HcnfJ6Gv1Fz5dnPy/7RL1U8mVqJINJWM79xQHk=;
 b=kA0DAAoWt9LdJ11+wIcByyZiAGlgHrmgM6LOwEM19Z0uuBjchVDfhpfoJgJDmN/xDONnYVJb0
 4h1BAAWCgAdFiEEpG0ycFhlqj3e3CkEt9LdJ11+wIcFAmlgHrkACgkQt9LdJ11+wIfnBwD/WXtd
 f9bkMoE+hr+2zc6UAhat71CaYeY1QhFMrePNhoUBAOsjGZioUPoLJfrsd/8VSuM/9DruUEUcARU
 bPxSu5FkJ
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k0ubQjmTlyVs3jKga4oznnkhg5P8l-ERRGvrWme22Sg_1767907129
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_131851_817628_D62E1319 
X-CRM114-Status: GOOD (  13.83  )
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

Fixes: cd1cb38836c0 ("clk: stm32: stm32-core: convert from round_rate() to determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/clk/stm32/clk-stm32-core.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
index 72825b9c36a4d3b8ba3f7615b9026c09ffaf88d1..b95b9c591fda7d900d523f50c8bd449398aba49f 100644
--- a/drivers/clk/stm32/clk-stm32-core.c
+++ b/drivers/clk/stm32/clk-stm32-core.c
@@ -369,13 +369,10 @@ static int clk_stm32_divider_determine_rate(struct clk_hw *hw,
 		val =  readl(div->base + divider->offset) >> divider->shift;
 		val &= clk_div_mask(divider->width);
 
-		req->rate = divider_ro_round_rate(hw, req->rate,
-						  &req->best_parent_rate,
-						  divider->table,
-						  divider->width,
-						  divider->flags, val);
-
-		return 0;
+		return divider_ro_determine_rate(hw, req,
+						 divider->table,
+						 divider->width,
+						 divider->flags, val);
 	}
 
 	req->rate = divider_round_rate_parent(hw, clk_hw_get_parent(hw),
@@ -455,14 +452,9 @@ static int clk_stm32_composite_determine_rate(struct clk_hw *hw,
 		val =  readl(composite->base + divider->offset) >> divider->shift;
 		val &= clk_div_mask(divider->width);
 
-		rate = divider_ro_round_rate(hw, req->rate, &req->best_parent_rate,
-					     divider->table, divider->width, divider->flags,
-					     val);
-		if (rate < 0)
-			return rate;
-
-		req->rate = rate;
-		return 0;
+		return divider_ro_determine_rate(hw, req, divider->table,
+						 divider->width, divider->flags,
+						 val);
 	}
 
 	rate = divider_round_rate_parent(hw, clk_hw_get_parent(hw),

-- 
2.52.0


