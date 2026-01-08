Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A8BD1D494
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 21:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=isTuYgACeBQ4FzUudAdIXG1/HC4FrJOsqYZ+hDA0p/A=; b=nJNa/V/dtqgs0lW4jt9XIyJEDb
	ztSqKuLIsectOWw9/Qe+g0LezoRhFDluZWffgxlGsu/QubsM8569KeBh5XJbUdl7p/c9XIZXmxRAS
	RbVoyLyebHHjORJWxY9u+sx6MQOsRK2qjomxB+V0zSSUUV1loQR64jNK+lB/ZDFVnp1EJBO7xOgp+
	+LmbbQ2jIYopHH90igBEvzOSCa4k2yi9iR7SFjSmwJq3SK4cjms2hP1Ttlv0a9iRMxPMDAywmeSkl
	2S7UewsTlfSlIRI7LD2JzIlqh/TJjcVlQ4TONvSua9utuY+7WOjxd6mGsxdNJriB3+PJqCbmiL3/q
	SshQNTew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxO0-00000000sVV-0gR2;
	Thu, 08 Jan 2026 21:17:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxNx-00000000sT8-1zT0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 21:17:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=isTuYgACeBQ4FzUudAdIXG1/HC4FrJOsqYZ+hDA0p/A=;
	b=MjejmpfvGaBdVxYFD0AP1Bcj2NW8rTxDpeB5qP6kL1syzrEkynSb4y3LlPE5Y3IwPUdKCk
	w4Np/wTgddIpq96oep6PagKfE9YJ7R4VjQNYHaOktNLELmCGdT5zbN4ICoKs7chGuKCtE0
	oV7bQA6cfIMMYv3GEAne5A2BUhR2W+Q=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-VEuqkTLnOI-rLIi-i0PUfQ-1; Thu, 08 Jan 2026 16:17:35 -0500
X-MC-Unique: VEuqkTLnOI-rLIi-i0PUfQ-1
X-Mimecast-MFC-AGG-ID: VEuqkTLnOI-rLIi-i0PUfQ_1767907055
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5ed079ef8dfso4071837137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 13:17:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907054; x=1768511854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=isTuYgACeBQ4FzUudAdIXG1/HC4FrJOsqYZ+hDA0p/A=;
        b=MGUSZT2yu66gCsEAy9nNGTBbn2BjCsSkEpLpxTanniyMLHifx9U0WcMWZRNu8Htv7G
         Fab0tdCjRPAhEzsFmVqQXQGutEuWlKHZmEPORf3eXoe/sIzQh51sKMzPPmXV7qRN+hPA
         uA7w6FUl8UcxXgCj8S46pgv88tyPDRNbNTVSVhkbrC6HMxMhPKV+Of8vc9Knc/ea12Ra
         aejKmt+QM5mfs1U6A347geKz6vgYy3qErgXNJjduGLti2mSHs2WhYj0ZrhkBQ66mTZKW
         rfH6+TRX93zTMQCvchwBZcoiZX4su9r9ENrcwJiCFcFoyj0xtfQsbx6wuaKazhzoNDbR
         V7Iw==
X-Forwarded-Encrypted: i=1; AJvYcCWZu4oJ9NG/4Ol/cQEWTKue5E2F2h1pKDUEE8q6TeMV2tjVbzjh44ticnFKwPK8W2Chf6QnKWvso400zEfLUtQ0@lists.infradead.org
X-Gm-Message-State: AOJu0YwodbXeIztK7uDGFGloM6U5TxMXJWU1xEcvdB0uqTO6ryg1MFOT
	pWWXVPYxpm2tmm+RnDYO1IE71Ygol8ne1z/TyTgr49fdv9agULFM9tFOrKD/58TVsaksTZ+j887
	FeIsmnLWcx+tOBB/0MKcuw5iW6aJMLLRWTTMt+S+Jr266KRxQbuDW+nIt37HxIexERfniIraHsP
	t0
X-Gm-Gg: AY/fxX5usmAip8hkCU21bP08LuT4RzaLcsYj3G+uwwU71RGcoTu2OKGfdJIVGT6WFNd
	yf5OXBj7AU4ivV2FDDVjND5tVVvpHgUdTa9ZEtoz+j78kSDt03s7aPQzW4NX27i0k3+4nRtyurU
	SpDpC17Fqqicib1RQtGl4RiJ9GKhz31kL4++1OQCWdR0jvYivUAVpQSxynNrYGII8gcBpp3WB5L
	kwkAZ8O/YdFozW4/3URmV/HQaJYPYHTYe8eyLT1wMuQTZbq7HKqZQ5cVQQhdL864ClIN1Tg9RCR
	2hve99GLhoWLUjsNxu3pJOa06b4al0zNafFRj4VksuZsDadsY/BvVhb7jD1Xe49ZN9iwrcIykFb
	MnSWYy1zplwA8lCU=
X-Received: by 2002:a05:6102:604a:b0:5ee:9f71:a17c with SMTP id ada2fe7eead31-5ee9f71a37bmr1208256137.14.1767907053810;
        Thu, 08 Jan 2026 13:17:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4oKtCzCZndKrddm3vS5yqzMlQVx1nyfHkPTEyP4m4LPypluHrmg5ASUY2ZnBplJ4DMuaw1A==
X-Received: by 2002:a05:6102:604a:b0:5ee:9f71:a17c with SMTP id ada2fe7eead31-5ee9f71a37bmr1208245137.14.1767907053507;
        Thu, 08 Jan 2026 13:17:33 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:17:32 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:23 -0500
Subject: [PATCH 05/27] clk: actions: owl-divider: convert from
 divider_round_rate() to divider_determine_rate()
MIME-Version: 1.0
Message-Id: <20260108-clk-divider-round-rate-v1-5-535a3ed73bf3@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2917; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=nzjUX2UpZ2i1eeMykuusgP1Jrs5n5Ls+16scH6BzdF0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5LapmYZvChNsD23gXmzdcGBl0oKn5atL5O7JN19sP
 HJYIeVARykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABM5sYfhr8DqkoLHH7hmVTYV
 e5QlzFNaMi+pt4z/9w2ekzceXr6YYMnwz3zzo7IbEk4KAQ95bE4KXOZLct3+0a6Nj2v1C6ccoQ4
 7NgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tk_dXTmut5nQl58LAQhVQSGqcLh3LTgmpDXPjl82Uts_1767907055
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_131737_620859_0DD80AE6 
X-CRM114-Status: GOOD (  14.12  )
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

The divider_round_rate() function is now deprecated, so let's migrate
to divider_determine_rate() instead so that this deprecated API can be
removed. Additionally, owl_divider_helper_round_rate() is no longer used,
so let's drop that from the header file as well.

Note that when the main function itself was migrated to use
determine_rate, this was mistakenly converted to:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value.

Fixes: 1b04e12a8bcc ("clk: actions: owl-divider: convert from round_rate() to determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: "Andreas Färber" <afaerber@suse.de>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-actions@lists.infradead.org
---
 drivers/clk/actions/owl-divider.c | 17 ++---------------
 drivers/clk/actions/owl-divider.h |  5 -----
 2 files changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/actions/owl-divider.c b/drivers/clk/actions/owl-divider.c
index 118f1393c6780f287d26736b2547a8b43751655a..316ace80e87e3b1c22a4011e725644cf37668e5e 100644
--- a/drivers/clk/actions/owl-divider.c
+++ b/drivers/clk/actions/owl-divider.c
@@ -13,26 +13,13 @@
 
 #include "owl-divider.h"
 
-long owl_divider_helper_round_rate(struct owl_clk_common *common,
-				const struct owl_divider_hw *div_hw,
-				unsigned long rate,
-				unsigned long *parent_rate)
-{
-	return divider_round_rate(&common->hw, rate, parent_rate,
-				  div_hw->table, div_hw->width,
-				  div_hw->div_flags);
-}
-
 static int owl_divider_determine_rate(struct clk_hw *hw,
 				      struct clk_rate_request *req)
 {
 	struct owl_divider *div = hw_to_owl_divider(hw);
 
-	req->rate = owl_divider_helper_round_rate(&div->common, &div->div_hw,
-						  req->rate,
-						  &req->best_parent_rate);
-
-	return 0;
+	return divider_determine_rate(hw, req, div->div_hw.table,
+				      div->div_hw.width, div->div_hw.div_flags);
 }
 
 unsigned long owl_divider_helper_recalc_rate(struct owl_clk_common *common,
diff --git a/drivers/clk/actions/owl-divider.h b/drivers/clk/actions/owl-divider.h
index d76f58782c52885a66c96e8bf13b0dea3ba51efd..1d3bb4e5898a3ccf729894533ae194ac4c34b6e3 100644
--- a/drivers/clk/actions/owl-divider.h
+++ b/drivers/clk/actions/owl-divider.h
@@ -56,11 +56,6 @@ static inline struct owl_divider *hw_to_owl_divider(struct clk_hw *hw)
 	return container_of(common, struct owl_divider, common);
 }
 
-long owl_divider_helper_round_rate(struct owl_clk_common *common,
-				const struct owl_divider_hw *div_hw,
-				unsigned long rate,
-				unsigned long *parent_rate);
-
 unsigned long owl_divider_helper_recalc_rate(struct owl_clk_common *common,
 					 const struct owl_divider_hw *div_hw,
 					 unsigned long parent_rate);

-- 
2.52.0


