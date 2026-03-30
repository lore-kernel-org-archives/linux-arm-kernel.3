Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3063B1061B04
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Message-Id:MIME-Version:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ewVCMiY2A8SH+vVFiby43Oli8Pss41RewLglHBz7dlw=; b=ktKwQtdRFvkyUz1w3aQWRaCbvy
	6B7f5q727hfe+KN7tKhGAVkAqRcYKl+OynuheUWsWgIinbIhgJ6xb8DYeCaeCMW/BM6BSR7gs/uia
	BMQOr19SLYYKkq6m8UpqavpY1TlvMnkIgxUHKofV5lqmYs+TM8l22DT1/xpoejaP8sVAG2pCB8Pqo
	Tt/O6/4eusj12bGeYaOAtaQwbZjiNvCMEJmAhC64uttiksGNngO0kN+HYX3WZfN1d4IRnntuMoxPa
	L+JcPbr3vjZr5YqUy2+Lvu+Faw0wIldB99llxI5ro1JRc1XfoGlHYbKXcJLABjd6hA4cemDmN3JTE
	cfCUwrig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dfv-0000000BQh7-3Rvn;
	Mon, 30 Mar 2026 14:33:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dfs-0000000BQgl-0tDQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:33:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774881182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ewVCMiY2A8SH+vVFiby43Oli8Pss41RewLglHBz7dlw=;
	b=IZdVnhKC07fLODFn1YpDzZ8a33knFdcjPjJ4EvisqgI8qUrscDUxRMUWsbn536feSldrx9
	GzRDIsislhIaxLyf9gtQEnX/Fzk5Gb2WHUSt4dq7/8OAoP0ve/5REfVcdIeTV50pXewRC3
	Uw/HKZsIKfzrAC15OHC6WdTvH6/biqg=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-eoCgwbPFOZy2pGpC-_RP9g-1; Mon, 30 Mar 2026 10:32:59 -0400
X-MC-Unique: eoCgwbPFOZy2pGpC-_RP9g-1
X-Mimecast-MFC-AGG-ID: eoCgwbPFOZy2pGpC-_RP9g_1774881179
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50937cf66b5so234435131cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 07:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774881179; x=1775485979;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ewVCMiY2A8SH+vVFiby43Oli8Pss41RewLglHBz7dlw=;
        b=fVtQpblYFM/ihp70bEVQU0zn3bI8FUSFcTl/uwmVtKffONfC5aOjkk7HMjQLluW6Ty
         QwIs5b8un8F2xt2FCw659EM9kaOLkhd2Sk4eLyl0Rkl9XC5At+unTQhDnKmI4E7DCFQY
         D1CIl5oBaS6aXHtn2U82rmHn8OLGuBwBNdWSfOy63ODx/aRF8zgwrms0KnC2opoGF9Dw
         Bo2j2szoTJgt4p9wo/+//So4NKtqXXpSBLFunuzXts9EK10230Ne0wVbiQLt4tBeO0PI
         k2zRzbsmZPIcC6M3S9ybYYPgHENtevrzitVW82xZPt7RWYlzfofehcwULCubaXRZPCF1
         TO8w==
X-Forwarded-Encrypted: i=1; AJvYcCViXASczj2YxIMkA+JoF8QIjpKY7EP+ip5RyawEPBFVQg9lzLpkgatQrJV39Aj55JH4IYomghNo/hv+eHhJ1uKx@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx2me2/ydvxdNyWO0v5cDpO8+Kb1q+pQw3eAEFBmFLH97EimKE
	PR9+xh+6Z3xTF/GnSVOKv/0R9hvC89Xo/jjMWThNEKiJpnEP3MXJRblJae/8rCWThiZRCWu6Fl1
	lzYjCadVH7Ryv9qsaLDII25OfkNDdqCuFrvmukBGAeGJ/qSX8FUOspABxC3QKZdBQBQBwqMSVFg
	8c
X-Gm-Gg: ATEYQzzWrOyPTPfq4tPaKwpFd+eMa1pU15eCgGOV/bORbj/ybC/Lxm/afNDw69JIiO+
	gtGMnXxZk8ljBp6u086kzg+RxguMYox/vqXx9g7+WF2AF1bKxqJ8H6rqi0RFDz2WblxcUdmA/ma
	FyAAUOu3Kx32EnjIEjQw81UrL1WQl/1C4BKNiTfCUwfqu2SKlBNrvEQqpeu0kU/U3VGv4PzmJEh
	IbBACuEgvmKok0TFfaI8N9dqSFbcVjiYnEHvSMwwUgrSnqxMic3xdEH+kt8Dt/sWdTORSJi99aA
	ZNTkrKZ1CwakAHNvwJQbYOSrfMwAJmCCQ/Lh8jEbioEGLjlRKLgVtd9O01stmITfmdwVchU7P+N
	5SAsFck487cUhLEClrsGQm8ymyF9erUaAryrxTWi3iY/pc3erA1lUUFlJ8DSv
X-Received: by 2002:a05:622a:514c:b0:509:a9b:8a6f with SMTP id d75a77b69052e-50ba391e18amr186074461cf.56.1774881178531;
        Mon, 30 Mar 2026 07:32:58 -0700 (PDT)
X-Received: by 2002:a05:622a:514c:b0:509:a9b:8a6f with SMTP id d75a77b69052e-50ba391e18amr186073831cf.56.1774881177981;
        Mon, 30 Mar 2026 07:32:57 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bbcbb3babsm52494131cf.25.2026.03.30.07.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 07:32:57 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 30 Mar 2026 10:32:37 -0400
Subject: [PATCH] clk: visconti: pll: initialize clk_init_data to zero
MIME-Version: 1.0
Message-Id: <20260330-clk-visconti-init-v1-1-ac3e825e54b5@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MWwqAIBAAryL73YIW2eMq0YfYWkuhoRGBdPekz
 4GZyZAoMiUYRYZINycOvoCqBNjN+JWQl8JQy1rLppFojx2LZoO/GNnzhW3vDA2mI20UlO6M5Pj
 5n9P8vh/E/7fCYwAAAA==
X-Change-ID: 20260330-clk-visconti-init-58fae9a7e6a1
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1700; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=aExlSSaLla1nCjUvgyoARQzBD88LhnGckG7GUkW3GbE=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJPdU7dYna2I6bszrPXbBPlgqZnHgneIfFJ/71uQoJu9
 ZayR9fYO0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZgIhwjD//SgFqGa+ybWqjvl
 U8+EOqpHJecZ/WJqf5LYfVXZyvjEfob/aUKVHZV8+y7cW/HZRPJi+5+C7T8/X5yoVZdj3LJXafI
 8dgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hEaSFxRGnAXIk7K1sZwfYzG_TBG3wRU4NCVOa_lAq9U_1774881179
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_073304_328355_3666F543 
X-CRM114-Status: GOOD (  15.76  )
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

Sashiko reported the following:

> The struct clk_init_data init is declared on the stack without being
> fully zero-initialized. While fields like name, flags, parent_names,
> num_parents, and ops are explicitly assigned, the parent_data and
> parent_hws fields are left containing stack garbage.

clk_core_populate_parent_map() currently prefers the parent names over
the parent data and hws, so this isn't a problem at the moment. If that
ordering ever changed in the future, then this could lead to some
unexpected crashes. Let's just go ahead and make sure that the struct
clk_init_data is initialized to zero as a good practice.

Fixes: b4cbe606dc367 ("clk: visconti: Add support common clock driver and reset driver")
Link: https://sashiko.dev/#/patchset/20260326042317.122536-1-rosenp%40gmail.com
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/visconti/pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/visconti/pll.c b/drivers/clk/visconti/pll.c
index 6fd02c4b641ed58f1943e55dd60ae80aba30b902..805b95481281761ad7ea4f59ddac07e4cdfb9d42 100644
--- a/drivers/clk/visconti/pll.c
+++ b/drivers/clk/visconti/pll.c
@@ -249,7 +249,7 @@ static struct clk_hw *visconti_register_pll(struct visconti_pll_provider *ctx,
 					    const struct visconti_pll_rate_table *rate_table,
 					    spinlock_t *lock)
 {
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct visconti_pll *pll;
 	struct clk_hw *pll_hw_clk;
 	size_t len;

---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260330-clk-visconti-init-58fae9a7e6a1

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


