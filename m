Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAF1EA3F0B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 05:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X3yduzGv3F/417GuJBj4DmelW0B8eKJjBniawn3DCPw=; b=GNioivHH62wgmvET88f+l2Nd8p
	7lnGa8YfmKedvSCzf2UnqkmErhiAAZ5A36LV7xB5M1QV4+nXpkKb02Zm2ocFP++CqmNPHRrz9vJlK
	GwShER6wZgx/H+x5oZznZ710lnEBn193kDd+HMuHg8sze0GmU9r3UOH6yZiz8h+MPQ5ovcVNPWJxi
	8lutOSJPpp/nmu/FzN6mxkUUa5LvSYsFSytB/IqcHITXoMdswE5mumlIVhbG02zyAVh0hVlQzkfx0
	x2XP/XU7YvwHoUlg1M+ek7biDz09hHSPEwo/qS5UgyaKJkHKyBAqwf0LvAdaVIi1Y8gK1txoDKEkO
	HNGPwnbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgUl-0000000GU90-0zKj;
	Tue, 10 Feb 2026 05:41:07 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgUZ-0000000GU0t-2Izg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 05:41:02 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-8c6a822068eso487960885a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 21:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770702054; x=1771306854; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3yduzGv3F/417GuJBj4DmelW0B8eKJjBniawn3DCPw=;
        b=ZBtKpiSMPJn0TYWSk8oS/1IDrisw5LyygIm29rto0i0CkC/4TQKAEp5HyXsqdyYI81
         tRhtOMsI/9iFXThQYgsoBB2zI6ziKHej5rYViViy0cuMSqv+rMchTYfKzdiv0ZOhdoMm
         sn0+/roq9LgZfcNvQJ3IXfabuLIktMHzM0FOgQnkBXBKQyaBVyxdjjP6YyWHIzEE0Wdc
         g+wK50Cgd7mSmXfHrVFsalV33Fxcg4b8y0XEiX9euLztfqQnXSdA/VNVZDkGDSOyT8Ti
         BeCmcGO29JfIhDgI4mgcMbvW4u2vXxihkoeDNNFMm2fTO8D6AwDNLty1XRDIsTZ2R9rH
         8d8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770702054; x=1771306854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X3yduzGv3F/417GuJBj4DmelW0B8eKJjBniawn3DCPw=;
        b=O5kCYjotuCsOWARO5XMpIdbSJB3rAu3l4KF51AjduZ5Qzt4eReuAJWF4lX4YwqJj3M
         OvHL/Bm/nyrADslMBSqePMO5j3Q8hbJt2tDSa8ylY6bE+pBD2o2HD/T2eAqZMglnnzJR
         kDIwpR99bV3RA/2AjJJn71Ddm8htKxduahL+Q1NocNj5r9lCAhC5EYb+sBYW3K9jOZAw
         uW6qKX4Nejbxi7nje2BBTjtAKqvldTP83/1IpI1+L0GSkv1s/AQSAZFPyZkMQMk+fpWe
         3me8QxGLD0qTLU5dr5NCLPSORgLynj8sUVgiHrIp16ENvyqyRq8Zw0xEt/FNkULAV7Is
         ej7A==
X-Forwarded-Encrypted: i=1; AJvYcCVP63Xoxf/Hw1wZ4TshAWKNicQoKcxBPkFVrCdpxzmBlxNTCVKA7KncZNJEp/H9+dnHyF1O3IkDqtcC/obAh15j@lists.infradead.org
X-Gm-Message-State: AOJu0YxU3j/74Jb1IVmM6DPW1CbfQtlnddjVvLcsIgfj43ojZVuO95Rz
	vDLfow4k5fBizUA088uhk5R9eHHn3V5hSfMjUJuc+4a2dDv20V4A9ssx
X-Gm-Gg: AZuq6aJ+IM5Y1L/GwHp2abhT7exg9j2q5Q0qSmrA0bVF0n4iEb+UjSJzEAlNI6rxn/t
	xSvYv+ck4nVexYCCn9HRbNpMaSYNH+q8UM11IK6HRKyr//hU/dfe8X71SloLSnyTYbn26o/oPO8
	xWBAu7I8txvQRaqJLU4+0rbpxGyezCha2ZQhkZKJGQ6rXHi/2ng/dVpJHIncHWZ0C2Moa8X2yY5
	kX8TdZHnGjzK7QtI3YcdFXQUfbghID8w3pPErvwsAd41vNm5VUTp2zjawFAvAhc2Y25GCQA9Z/z
	jXrTZBtSk94FpWNuooaDUf0Z187Bdi8z8XWCBmQSy67fethkPkt8ZezjyBfvOie78xGRBy/0zXQ
	87kLbHa7jZNHF7ld6NMHAXbo6XP3RShMmaQRrSZdTdX/xrMIF2niuF6RhQCWjgxAogT3o7pDegT
	iTJHmpr8Itw5gy3b4QQwbDRpKSBOMfpRB36N2HAF1eL0fyuzJb8LO8ACXk4yNv7Lzdc+fgVTLhA
	g==
X-Received: by 2002:a05:620a:404f:b0:8c7:16fb:ed49 with SMTP id af79cd13be357-8caf15f3e50mr1692101885a.63.1770702054094;
        Mon, 09 Feb 2026 21:40:54 -0800 (PST)
Received: from aford-System-Version.lan (c-68-46-10-116.hsd1.mn.comcast.net. [68.46.10.116])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9ee9fbasm978632285a.39.2026.02.09.21.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:40:53 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: angelogioacchino.delregno@collabora.com,
	Adam Ford <aford173@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Laura Nao <laura.nao@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 2/5] clk: mediatek: Fix MT8196 topckgen2 orphan clocks
Date: Mon,  9 Feb 2026 23:37:02 -0600
Message-ID: <20260210053708.17239-2-aford173@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260210053708.17239-1-aford173@gmail.com>
References: <20260210053708.17239-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_214100_564958_6A441026 
X-CRM114-Status: GOOD (  11.94  )
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

There are a few clocks with names spelled incorrecly, so when a child tries
to associate itself to a parent, there isn't a parent.  Fixing the names
restores the proper parent-child relations of these clocks and eliminates
the orphaned clocks.

Fixes: b093e0f17099 ("clk: mediatek: Add MT8196 topckgen2 clock support")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
 drivers/clk/mediatek/clk-mt8196-topckgen2.c | 92 ++++++++++-----------
 1 file changed, 46 insertions(+), 46 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8196-topckgen2.c b/drivers/clk/mediatek/clk-mt8196-topckgen2.c
index 6df93d7fbf91..a260366ae9f9 100644
--- a/drivers/clk/mediatek/clk-mt8196-topckgen2.c
+++ b/drivers/clk/mediatek/clk-mt8196-topckgen2.c
@@ -147,13 +147,13 @@ static const struct mtk_fixed_factor top_divs[] = {
 
 static const char * const seninf_parents[] = {
 	"clk26m",
-	"ck_osc_d10",
-	"ck_osc_d8",
-	"ck_osc_d5",
-	"ck_osc_d4",
+	"osc_d10",
+	"osc_d8",
+	"osc_d5",
+	"osc_d4",
 	"univpll2_d6_d2",
 	"mainpll2_d9",
-	"ck_osc_d2",
+	"osc_d2",
 	"mainpll2_d4_d2",
 	"univpll2_d4_d2",
 	"mmpll2_d4_d2",
@@ -166,10 +166,10 @@ static const char * const seninf_parents[] = {
 
 static const char * const img1_parents[] = {
 	"clk26m",
-	"ck_osc_d4",
-	"ck_osc_d3",
+	"osc_d4",
+	"osc_d3",
 	"mmpll2_d6_d2",
-	"ck_osc_d2",
+	"osc_d2",
 	"imgpll_d5_d2",
 	"mmpll2_d5_d2",
 	"univpll2_d4_d2",
@@ -185,24 +185,24 @@ static const char * const img1_parents[] = {
 
 static const char * const ipe_parents[] = {
 	"clk26m",
-	"ck_osc_d4",
-	"ck_osc_d3",
-	"ck_osc_d2",
+	"osc_d4",
+	"osc_d3",
+	"osc_d2",
 	"univpll2_d6",
 	"mmpll2_d6",
 	"univpll2_d5",
 	"imgpll_d5",
-	"ck_mainpll_d4",
+	"mainpll_d4",
 	"mmpll2_d5",
 	"imgpll_d4"
 };
 
 static const char * const cam_parents[] = {
 	"clk26m",
-	"ck_osc_d10",
-	"ck_osc_d4",
-	"ck_osc_d3",
-	"ck_osc_d2",
+	"osc_d10",
+	"osc_d4",
+	"osc_d3",
+	"osc_d2",
 	"mmpll2_d5_d2",
 	"univpll2_d4_d2",
 	"univpll2_d7",
@@ -219,8 +219,8 @@ static const char * const cam_parents[] = {
 static const char * const camtm_parents[] = {
 	"clk26m",
 	"univpll2_d6_d4",
-	"ck_osc_d4",
-	"ck_osc_d3",
+	"osc_d4",
+	"osc_d3",
 	"univpll2_d6_d2"
 };
 
@@ -239,7 +239,7 @@ static const char * const dpe_parents[] = {
 
 static const char * const vdec_parents[] = {
 	"clk26m",
-	"ck_mainpll_d5_d2",
+	"mainpll_d5_d2",
 	"mainpll2_d4_d4",
 	"mainpll2_d7_d2",
 	"mainpll2_d6_d2",
@@ -256,9 +256,9 @@ static const char * const vdec_parents[] = {
 
 static const char * const ccusys_parents[] = {
 	"clk26m",
-	"ck_osc_d4",
-	"ck_osc_d3",
-	"ck_osc_d2",
+	"osc_d4",
+	"osc_d3",
+	"osc_d2",
 	"mmpll2_d5_d2",
 	"univpll2_d4_d2",
 	"mmpll2_d7",
@@ -273,8 +273,8 @@ static const char * const ccusys_parents[] = {
 static const char * const ccutm_parents[] = {
 	"clk26m",
 	"univpll2_d6_d4",
-	"ck_osc_d4",
-	"ck_osc_d3",
+	"osc_d4",
+	"osc_d3",
 	"univpll2_d6_d2"
 };
 
@@ -309,14 +309,14 @@ static const char * const dp0_parents[] = {
 	"tvdpll1_d16",
 	"tvdpll1_d8",
 	"tvdpll1_d4",
-	"ck_tvdpll1_d2"
+	"tvdpll1_d2"
 };
 
 static const char * const disp_parents[] = {
 	"clk26m",
-	"ck_mainpll_d5_d2",
-	"ck_mainpll_d4_d2",
-	"ck_mainpll_d6",
+	"mainpll_d5_d2",
+	"mainpll_d4_d2",
+	"mainpll_d6",
 	"mainpll2_d5",
 	"mmpll2_d6",
 	"mainpll2_d4",
@@ -326,7 +326,7 @@ static const char * const disp_parents[] = {
 
 static const char * const mdp_parents[] = {
 	"clk26m",
-	"ck_mainpll_d5_d2",
+	"mainpll_d5_d2",
 	"mainpll2_d5_d2",
 	"mmpll2_d6_d2",
 	"mainpll2_d9",
@@ -342,13 +342,13 @@ static const char * const mdp_parents[] = {
 
 static const char * const mminfra_parents[] = {
 	"clk26m",
-	"ck_osc_d4",
-	"ck_mainpll_d7_d2",
-	"ck_mainpll_d5_d2",
-	"ck_mainpll_d9",
+	"osc_d4",
+	"mainpll_d7_d2",
+	"mainpll_d5_d2",
+	"mainpll_d9",
 	"mmpll2_d6_d2",
 	"mainpll2_d4_d2",
-	"ck_mainpll_d6",
+	"mainpll_d6",
 	"univpll2_d6",
 	"mainpll2_d5",
 	"mmpll2_d6",
@@ -361,14 +361,14 @@ static const char * const mminfra_parents[] = {
 
 static const char * const mminfra_snoc_parents[] = {
 	"clk26m",
-	"ck_osc_d4",
-	"ck_mainpll_d7_d2",
-	"ck_mainpll_d9",
-	"ck_mainpll_d7",
-	"ck_mainpll_d6",
+	"osc_d4",
+	"mainpll_d7_d2",
+	"mainpll_d9",
+	"mainpll_d7",
+	"mainpll_d6",
 	"mmpll2_d4_d2",
-	"ck_mainpll_d5",
-	"ck_mainpll_d4",
+	"mainpll_d5",
+	"mainpll_d4",
 	"univpll2_d4",
 	"mmpll2_d4",
 	"mainpll2_d3",
@@ -381,17 +381,17 @@ static const char * const mmup_parents[] = {
 	"clk26m",
 	"mainpll2_d6",
 	"mainpll2_d5",
-	"ck_osc_d2",
-	"ck_osc",
-	"ck_mainpll_d4",
+	"osc_d2",
+	"ulposc",
+	"mainpll_d4",
 	"univpll2_d4",
 	"mainpll2_d3"
 };
 
 static const char * const mminfra_ao_parents[] = {
 	"clk26m",
-	"ck_osc_d4",
-	"ck_mainpll_d3"
+	"osc_d4",
+	"mainpll_d3"
 };
 
 static const char * const dvo_parents[] = {
-- 
2.51.0


