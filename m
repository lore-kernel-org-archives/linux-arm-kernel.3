Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108F8C55162
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 06:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KppttdmRA/osqRgYgVIKOVyovbhKli4YO+D+/pf5Fl4=; b=nY5MEniBw71C+vobqqrTWMGj/V
	LEsU07NPLp6RmfDN1uCxUsM8FtiSCvKB+U5ZwrR6nhJykGKoZRTC4SnQz68cX1K7ga8iQOHt6HcCe
	040pB/wMh48fcxO6mZMdoRNW65lQDbbWVjL9szEr+y9WR6mj8uEclqNuIIgS+b0svgkmCT52bqNMI
	YZ6sLX94YFQlx7wJYKVazd0eZLJVlOm5fKaiOGvX50DR17mTmDqZSu4fl738zvRJgSM+5e34B+IuN
	U3idQsyzl2ix5OOqh2ku46uqqdQG3vDEe6dFswWt8GPI/+pJ1VxB58yjhXirrCqJxgILLpZXwxfgb
	d/qejnSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqmCx-0000000GRrV-3wZL;
	Mon, 03 Aug 2026 06:31:31 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqmCv-0000000GRqb-1uHy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 06:31:30 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cbb85186d43so1354131a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 23:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785738688; x=1786343488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KppttdmRA/osqRgYgVIKOVyovbhKli4YO+D+/pf5Fl4=;
        b=tFtHoEyciM8p7a6/Ut4273WQ4gG57nWTv5DfZT8LT8e+FLOArY3Xc1R1QS4kpMabZK
         M54e6xWZGSUekEJ2lv6LgJ/VJJrYHFxdbheEh7Zx3j+mt9oi4daF7XHRUxSuHsoU3UK9
         U8BlaJySElhC42/hoXfNCjH498YoeJBJuQb+8gvJTXbHlK4K0ti4RjJKF+Z+riN+ln6a
         VYfqX8UwonS5WjgEmSC3OeQpDCFJUYHcZg1OONhihGww2Xl5IZp4i5VhQSFy1JwDlzeK
         QwTOY5tFPJ66b65K+h/pt3/7tO4bxYA0Gl00fJTFWYJ35phGznRgYDJ+PRbtzZtr0xEt
         lVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785738688; x=1786343488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KppttdmRA/osqRgYgVIKOVyovbhKli4YO+D+/pf5Fl4=;
        b=hWMojhUA7lmWXUo6Lyt/MKskmLcjWV+q5u5zciZly48J2WpiZEeu5w6v940qLtVfB9
         GbrUx104EllKwK58ZujFyNtKWMLjMgRunA7tL/rW8FcdO86nIudKTkfixxb3A0q0QLjD
         C62PYQTmofPCHblgaSO//BDjmCVum43di/WUL4A9NI1qxTaG/sGOc6r83V60mtfDoRUO
         1gaoJh8EeraNR5jWUjXz21uf/GEgv0CBBrcmPL4S7e24OB+jxCV1Bl2tuKpmbYPsFb0h
         Jc1JzjFmV0+dTNDG0DZptck049XC6CSOUVui6576ceeKpx+QjoUzVJgJLdKnAQd9StD8
         97uw==
X-Forwarded-Encrypted: i=1; AHgh+RoahvTpuXpJsWrOIBD2+5USsCTZFKGmCKGkF6xiYTuqRObHz20t6r2EhJUyEUmwPySsOq0efcw+Jn5GrKodV054@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj5F0pGRpylxfzNAziPZWpx2nEDr3c4843lZUeY73q1ut9eubf
	KHbFSde6sTWGY+VFp4u2RkdodFzzodnszSqn4iTQuQUv0pOLac8+98at
X-Gm-Gg: AR+sD13fMfNEk5g/FPpiQ8CkcjRdgLKFVT1l2lDl+yYUfPXMPRWbp/GpP2fMuBucsPE
	0/st0127RB39kZ0rqSRp+Mhad0GESkOSb6b9Sh/EjPfdqTlOWar0oy6kWHn84VuF7vctmGi1Fdx
	dGER613QNFeUz12RCcMgC/jOWq+ZN2zawvsvDhLvSfUo7W9QNaqNAWKDmyQLTPMRd9WC80+5RUi
	EZTpeMH01yytH5s5HoZjsm2Q0erUM0rEZMipYBOn0BCbW0gn6x2CXWnxiBFJsV+q2JTTLrRa/Nq
	lYVVbTQe/GTs+1qprD8fFUuPvGp7vW1DenRWjP9dBma7tpMszud5G8xqNCdA9UQF58Rx9xcZ1vF
	HTAhdfEGQ+xJtUbxVWVlaphjGe0BLsmjpI8u2C6XGh4hipbIUbzUMKLillvZSjuaqqQmdyCXCL9
	WOUKlhtOu1VMm0n2QxHfaonKeYffIX989yxD+sUOuMtaHmUolBU/KaE6zc6+bclx/0Udmj3Ks=
X-Received: by 2002:a05:6a21:648f:b0:3c9:e7d:b170 with SMTP id adf61e73a8af0-3c92a8f3f7dmr8746275637.58.1785738688068;
        Sun, 02 Aug 2026 23:31:28 -0700 (PDT)
Received: from kdev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe3963ddc3sm3173682a12.7.2026.08.02.23.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 23:31:27 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH v2] clk: zynq: pll: Fix kernel-doc after determine_rate() conversion
Date: Mon,  3 Aug 2026 06:31:26 +0000
Message-ID: <20260803063126.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_233129_496259_DF5F1F69 
X-CRM114-Status: GOOD (  13.57  )
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

Commit 1547747b55d5 ("clk: zynq: pll: convert from round_rate() to
determine_rate()") replaced zynq_pll_round_rate() with
zynq_pll_determine_rate() but left its kernel-doc block behind, so the
block still names the old function and documents the removed @rate and
@prate parameters instead of @req.

Retitle the block and describe @req. The Return: line described a
frequency and referenced the removed @rate; the function returns 0
unconditionally and the rounded rate comes back in @req.

No functional changes.

Assisted-by: Claude:claude-opus-5 [kernel-doc]
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
Changes in v2:
- Say "Return: 0 always" instead of "Return: 0 on success". The function
  has no failure path, so there is no success case to distinguish
  (Michal Simek).
- Rebased on v7.2-rc6; the file is unchanged, so the diff is the same
  apart from that line.

v1: https://lore.kernel.org/all/20260802013252.7-1-bbnpreetsingh@gmail.com/

 drivers/clk/zynq/pll.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/zynq/pll.c b/drivers/clk/zynq/pll.c
index 44c6093783641..fe90b50e1545d 100644
--- a/drivers/clk/zynq/pll.c
+++ b/drivers/clk/zynq/pll.c
@@ -42,11 +42,11 @@ struct zynq_pll {
 #define PLL_FBDIV_MAX	66
 
 /**
- * zynq_pll_round_rate() - Round a clock frequency
+ * zynq_pll_determine_rate() - Round a clock frequency
  * @hw:		Handle between common and hardware-specific interfaces
- * @rate:	Desired clock frequency
- * @prate:	Clock frequency of parent clock
- * Return:	frequency closest to @rate the hardware can generate.
+ * @req:	Clock rate request, updated with the frequency closest to the
+ *		requested one that the hardware can generate
+ * Return:	0 always
  */
 static int zynq_pll_determine_rate(struct clk_hw *hw,
 				   struct clk_rate_request *req)
-- 
2.43.0


