Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10494D1D48A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 21:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5QDz5yJgmx0439uD0ntmtxod09pLPWy27GZMDx1s30w=; b=orn2+JvKqkJhevyWNY2K7WPwdk
	kaiSMC82QaFChRhLfT8eKUhcDW0qZHOB+ufSFW4oZcUWOhqunHvK/pNeSykmp5wYijtS20ASj8u1U
	MWI3IgDRGiv//RYqE4SMXiTcRkV/LSV4EnCeYCovpoEKvmd+iaDz6izGQwT7+5yGOT6l7YmUOWMAt
	VNhxrdOyY7Rf5hj2nz1kTkONRJlrYfmFTHgGUj3/Ivv4jUgFIgzQSn9Q/Keli4tuspboxblt05Sid
	Nb2+8mzsRa9par/Uy9u58KKwMp7STKKVCSlUwfEvEijRDf0jsseJFyFnGghhRu1K/+ls2wVdn1Nts
	38PZszYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxPJ-00000000tLc-0HFF;
	Thu, 08 Jan 2026 21:19:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxPF-00000000tIk-41Cw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 21:18:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5QDz5yJgmx0439uD0ntmtxod09pLPWy27GZMDx1s30w=;
	b=BsaKeO/fPuxKFrU0HG/h38eFXzTzyue14DhNE9+ivU4OeNx9D+6HHGjqIVLfh6mwIyJdqf
	Yf9d9R6q2+XEKBj5XYYqyCv2+Dh5csbH6rObjQbyteqjo+7UlQVLC9VSASZR+FY4hfqVtw
	M+aYkcshd6MEa5YcCVvLiKX6tGdZ26w=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-5LxDt_I2Mweg8DXW7DlcCw-1; Thu, 08 Jan 2026 16:18:55 -0500
X-MC-Unique: 5LxDt_I2Mweg8DXW7DlcCw-1
X-Mimecast-MFC-AGG-ID: 5LxDt_I2Mweg8DXW7DlcCw_1767907135
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ec8781f59cso1852700137.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 13:18:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907135; x=1768511935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5QDz5yJgmx0439uD0ntmtxod09pLPWy27GZMDx1s30w=;
        b=CgKNxTxeykli5Odp+dhsmqnuqSAzWGNgalpCjhudXeKlG0ldr9MLUn7uwEVi1rqrHO
         wuJhAlYjgeavQIqu/eHwEv/QPQ6JUh1uZCG2/Ghzz5aKpDIikJeAmpw2fJxTaaNP8cQ0
         9lDb+d5O4r5e06SOO6j1RRQJbxlyNZGZdziUHGqSmnw8Sbd7D2FZBnZhu5AER10UZWie
         7FfWmr4wddv9KmfIGL29ITRbfLbs2yqRsIe1ABqtML+eMvn/BheP1FCHc72Wwm3n+6/G
         cZE2ovZ86fYkJGVlO0Y7CsOqC42jhSPFfJdzl0qqkTDQRYBuqp2fmq3FUxEJahHQqsT7
         /9ZA==
X-Forwarded-Encrypted: i=1; AJvYcCWll8+zRJrKp9a6mpV6llO6DfWqeyQAQLOdn+TscxR3GUhQ6LcCaoP0JiUDDKGUJA1Yw/08/ML9EYrLkcR4hB7x@lists.infradead.org
X-Gm-Message-State: AOJu0YyfSwy85fHCWyYY+9q1cGqbnItgCaEJltihmZfURUpiuB2EyW42
	yxIAy3DIDWW2nBt18cmwmOwg+fF4E1fMSQ4A9aC+NfEnWYA8GGgAyHqQqmLNkebbZFRBo9i8QPr
	WvmT7rFubwZ/B0VY18p+3D2xrhukQXtatBbp/WzY02ZtdTQahf1H7cZb24cwSZlZw94zfHotw+D
	Xs
X-Gm-Gg: AY/fxX6y4p2Kjc7bbYj309L6jMhMj95OpgY8fgB6wTyxxYzsuMZtf2lq/Lw0i8siByG
	b3NmO0PcaQCQCUy7/C5mPClhXgSyFkzhXTmqzv/iszyIaO0GccNEWuaGwq7eBNMDIs4i1S6nCwG
	S7QVSTnKHk7O7fSHn+VcRttNVj4rFAc/3e4Pp6r7ozZNFWOY/UFiP3NkbRHd6VlRFY7vnUhg6Oc
	PVYbGRV92H/AqUc6K2zbSdseVowRyebTtXCJmf1Wp+aKBV288cccFyZ2IO+Ee3YHtSQs5oM2E40
	ntCVXVOlwMDw4yKAuQGq0TZgP2Gwwsyr2dimLXnB1aFhvPU6FAvWL8qFATOtUekAnnB+RanmI42
	TqX5v8e77aQFx4bM=
X-Received: by 2002:a05:6102:2b8c:b0:5ec:848d:2eb3 with SMTP id ada2fe7eead31-5ecb560294amr3157841137.19.1767907135140;
        Thu, 08 Jan 2026 13:18:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+wVo31RtnFWHlhbf1gwVuy01FPzefAIXV8pM4OiwoVNvycs5UB0kClvVq2bdd3YZxuh0SVQ==
X-Received: by 2002:a05:6102:2b8c:b0:5ec:848d:2eb3 with SMTP id ada2fe7eead31-5ecb560294amr3157824137.19.1767907134612;
        Thu, 08 Jan 2026 13:18:54 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:18:54 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:38 -0500
Subject: [PATCH 20/27] clk: stm32: stm32-core: convert from
 divider_round_rate_parent() to divider_determine_rate()
MIME-Version: 1.0
Message-Id: <20260108-clk-divider-round-rate-v1-20-535a3ed73bf3@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2480; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=1zGr1VEhUSEgUAAiV8B/qL6RDaMkiVVGUfjryyBP0yI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5HZ+rVz4cq5P358Ldj9m7J33rWhF42pTTu5vx/bOq
 vD+uDptd0cpC4MYF4OsmCLLklyjgojUVbb37miywMxhZQIZwsDFKQATCT/H8Fc20NW1ctEMhvb1
 eUtmWJ9753w9LOauSY9OqHpK5FGLq08Y/jvaJGQWz50Y9HLBob45cZedTKY73G51alpxMHDtvcU
 MsWwA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k5E22L0HZ-0xfQRc3gMvTa2jXgh3wSObYpDvuf23uPE_1767907135
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_131858_410135_C842D23C 
X-CRM114-Status: GOOD (  14.17  )
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

The divider_round_rate_parent() function is now deprecated, so let's
migrate to divider_determine_rate() instead so that this deprecated API
can be removed.

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
 drivers/clk/stm32/clk-stm32-core.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
index b95b9c591fda7d900d523f50c8bd449398aba49f..e921c25a929c303a2e189bf876667178a123eae1 100644
--- a/drivers/clk/stm32/clk-stm32-core.c
+++ b/drivers/clk/stm32/clk-stm32-core.c
@@ -375,13 +375,8 @@ static int clk_stm32_divider_determine_rate(struct clk_hw *hw,
 						 divider->flags, val);
 	}
 
-	req->rate = divider_round_rate_parent(hw, clk_hw_get_parent(hw),
-					      req->rate,
-					      &req->best_parent_rate,
-					      divider->table,
-					      divider->width, divider->flags);
-
-	return 0;
+	return divider_determine_rate(hw, req, divider->table, divider->width,
+				      divider->flags);
 }
 
 static unsigned long clk_stm32_divider_recalc_rate(struct clk_hw *hw,
@@ -438,7 +433,6 @@ static int clk_stm32_composite_determine_rate(struct clk_hw *hw,
 {
 	struct clk_stm32_composite *composite = to_clk_stm32_composite(hw);
 	const struct stm32_div_cfg *divider;
-	long rate;
 
 	if (composite->div_id == NO_STM32_DIV)
 		return 0;
@@ -457,14 +451,8 @@ static int clk_stm32_composite_determine_rate(struct clk_hw *hw,
 						 val);
 	}
 
-	rate = divider_round_rate_parent(hw, clk_hw_get_parent(hw),
-					 req->rate, &req->best_parent_rate,
-					 divider->table, divider->width, divider->flags);
-	if (rate < 0)
-		return rate;
-
-	req->rate = rate;
-	return 0;
+	return divider_determine_rate(hw, req, divider->table, divider->width,
+				      divider->flags);
 }
 
 static u8 clk_stm32_composite_get_parent(struct clk_hw *hw)

-- 
2.52.0


