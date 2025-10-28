Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783C0CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 15:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YIWLk8it8FdUh5OPoc3YMgGMjFwqnKcGsN70DXgD85k=; b=U19+IyBKTx/uraAiGr+JyYxixj
	65z8d/hbAsX3gMSEvwYO2+Xc8SuRA6bQHNjzH+DG7DWV+ec8A9Z+mLN6dP1BemDXx9dpZH/NMBLDk
	f4SZlmleB00Ey4BwAaFD1Mlb5GS1ZYa8N+24hOdPg+7tXAj3im9uS8XICvAFwx0xiWSqCONsGzEsx
	zYmybBgSTZacdMu2ty17fbvIHLGqQEL8jw+5ugiA5l6FkdwFczzZCkmefEjS/pSf9mzKYhu/9V01u
	OgZaPJ5475f+9FX59A0JrEcZhu3pzkapbfPglMnrgfZSxmsCF2n62s4OF1GEvoWpptIc0VcWYx07R
	qm0T7N1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlV8-0000000GA9e-3OLm;
	Tue, 28 Oct 2025 15:20:46 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlV5-0000000GA8k-47M3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 15:20:45 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b6d731278e2so547948366b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 08:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761664841; x=1762269641; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YIWLk8it8FdUh5OPoc3YMgGMjFwqnKcGsN70DXgD85k=;
        b=wTK4/HhrU3p5PhOVdLfD2QN3dIq44fBzFtsty0Y75D3ra4JWa2jFYF+PsKk4n92YRx
         gtnA8W+1xNNBu3w/Zx3d2zOvpq1sF76p1R39SuyRxVCFwg0TwqFz1P6CNc+MRao2TBO3
         HywqZZfmlsN5fyUVvQYCRP7m72w22is5Egpxbtf5yXNFelvbUbK5vdUt/ow0fJHSLirf
         PxgryQd7CI8o3yuee24bHzuV8HA2Y2+X5/cnYs5F52G0ba6ZXrkIJgHGp4D/9tRuVo3L
         WTtXRSITd3G9f6Ve6lxwBr1zLcT/baMqxzTvZz9rAGVt62oyr5YI8CHWf8LuX4J5/25K
         LCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761664841; x=1762269641;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YIWLk8it8FdUh5OPoc3YMgGMjFwqnKcGsN70DXgD85k=;
        b=gwfoHi2Zf7x9+kvNNAf4N1l0U6l3PP6B6tI2LQWTsScl3n6pQJMGnCnDPc7ROUQQvy
         iD0ZaGkZNecGBzouzR0HubQALS7R8qbhQBy78LlsOPLmTKZu8OtGVcL16WIlXnu5GQ48
         DtDSbHx77f/Ct54ObuA6EUbdO47J50UXBwNdOBe7BTNTnLmX/OuaHn4hhGbZTzPyqo+9
         1LCRZeV4JeWbBpuA055sw8lDOlUK/M8/ul+XRuvpvTb8aR4mpcE/bkXTWZBMcE1A3gSG
         I21bHD14q12xw+ksRv/o85+HZYr/+jgcJCueoesevvik8OVlOOTkSsKNk3rC/sVCXXT2
         zo/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVKWUIhm9kqBo6ZJLBbKbHoDj4kqqaQoMNW+tvnokyTuFvfvdvKsA0g4oUkpuJoMiu3c1kTCmqmyUPW4DawNcRj@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq7YDIi02qRHPhaok+SD1LRYt5FIKmzoSQfK04d3JXaSaSECki
	7Hg0OIWjI4VUqIj0cvM30+tSqmtrZpIuTR8294Jgsj7uw/8tJlmWcxZbyEeXfclppwbLHbTc57f
	zTL8dpddN3Q==
X-Google-Smtp-Source: AGHT+IHRlIi7iumEViisCh02GxfRIyDe0dn87sMKGGtppytiH5B8AxwzXZp4+VsLTJGi7NohMhbpMoyrXtUf
X-Received: from ejcyr4.prod.google.com ([2002:a17:907:db04:b0:b37:d295:d0b8])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:7f0b:b0:b42:f820:b7c
 with SMTP id a640c23a62f3a-b6dba56fe4amr441451666b.41.1761664839110; Tue, 28
 Oct 2025 08:20:39 -0700 (PDT)
Date: Tue, 28 Oct 2025 15:20:11 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.1.851.g4ebd6896fd-goog
Message-ID: <20251028152013.1697585-1-abarnas@google.com>
Subject: [PATCH] clk: actions: Fix discarding const qualifier by
 'container_of' macro
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	"=?UTF-8?q?Andreas=20F=C3=A4rber?=" <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_082044_028556_37142966 
X-CRM114-Status: GOOD (  11.76  )
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

Remove const qualifier from functions parameter because it was discarded
when container_of was called. Received pointer had mutable access to
it through received container.

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 drivers/clk/actions/owl-common.h    | 2 +-
 drivers/clk/actions/owl-composite.h | 2 +-
 drivers/clk/actions/owl-divider.h   | 2 +-
 drivers/clk/actions/owl-factor.h    | 2 +-
 drivers/clk/actions/owl-gate.h      | 2 +-
 drivers/clk/actions/owl-mux.h       | 2 +-
 drivers/clk/actions/owl-pll.h       | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/actions/owl-common.h b/drivers/clk/actions/owl-com=
mon.h
index 8fb65f3e82d7..5768a2e0f6a0 100644
--- a/drivers/clk/actions/owl-common.h
+++ b/drivers/clk/actions/owl-common.h
@@ -32,7 +32,7 @@ struct owl_clk_desc {
 };
=20
 static inline struct owl_clk_common *
-	hw_to_owl_clk_common(const struct clk_hw *hw)
+	hw_to_owl_clk_common(struct clk_hw *hw)
 {
 	return container_of(hw, struct owl_clk_common, hw);
 }
diff --git a/drivers/clk/actions/owl-composite.h b/drivers/clk/actions/owl-=
composite.h
index bca38bf8f218..6d7c6f0c47c8 100644
--- a/drivers/clk/actions/owl-composite.h
+++ b/drivers/clk/actions/owl-composite.h
@@ -108,7 +108,7 @@ struct owl_composite {
 		},							\
 	}
=20
-static inline struct owl_composite *hw_to_owl_comp(const struct clk_hw *hw=
)
+static inline struct owl_composite *hw_to_owl_comp(struct clk_hw *hw)
 {
 	struct owl_clk_common *common =3D hw_to_owl_clk_common(hw);
=20
diff --git a/drivers/clk/actions/owl-divider.h b/drivers/clk/actions/owl-di=
vider.h
index 083be6d80954..d76f58782c52 100644
--- a/drivers/clk/actions/owl-divider.h
+++ b/drivers/clk/actions/owl-divider.h
@@ -49,7 +49,7 @@ struct owl_divider {
 		},							\
 	}
=20
-static inline struct owl_divider *hw_to_owl_divider(const struct clk_hw *h=
w)
+static inline struct owl_divider *hw_to_owl_divider(struct clk_hw *hw)
 {
 	struct owl_clk_common *common =3D hw_to_owl_clk_common(hw);
=20
diff --git a/drivers/clk/actions/owl-factor.h b/drivers/clk/actions/owl-fac=
tor.h
index 04b89cbfdccb..24c704d40925 100644
--- a/drivers/clk/actions/owl-factor.h
+++ b/drivers/clk/actions/owl-factor.h
@@ -57,7 +57,7 @@ struct owl_factor {
=20
 #define div_mask(d) ((1 << ((d)->width)) - 1)
=20
-static inline struct owl_factor *hw_to_owl_factor(const struct clk_hw *hw)
+static inline struct owl_factor *hw_to_owl_factor(struct clk_hw *hw)
 {
 	struct owl_clk_common *common =3D hw_to_owl_clk_common(hw);
=20
diff --git a/drivers/clk/actions/owl-gate.h b/drivers/clk/actions/owl-gate.=
h
index c2f161c93fda..ac458d4385ee 100644
--- a/drivers/clk/actions/owl-gate.h
+++ b/drivers/clk/actions/owl-gate.h
@@ -56,7 +56,7 @@ struct owl_gate {
 		},							\
 	}								\
=20
-static inline struct owl_gate *hw_to_owl_gate(const struct clk_hw *hw)
+static inline struct owl_gate *hw_to_owl_gate(struct clk_hw *hw)
 {
 	struct owl_clk_common *common =3D hw_to_owl_clk_common(hw);
=20
diff --git a/drivers/clk/actions/owl-mux.h b/drivers/clk/actions/owl-mux.h
index 53b9ab665294..dc0ecc2d5e10 100644
--- a/drivers/clk/actions/owl-mux.h
+++ b/drivers/clk/actions/owl-mux.h
@@ -44,7 +44,7 @@ struct owl_mux {
 		},							\
 	}
=20
-static inline struct owl_mux *hw_to_owl_mux(const struct clk_hw *hw)
+static inline struct owl_mux *hw_to_owl_mux(struct clk_hw *hw)
 {
 	struct owl_clk_common *common =3D hw_to_owl_clk_common(hw);
=20
diff --git a/drivers/clk/actions/owl-pll.h b/drivers/clk/actions/owl-pll.h
index 78e5fc360b03..58e19f1ade43 100644
--- a/drivers/clk/actions/owl-pll.h
+++ b/drivers/clk/actions/owl-pll.h
@@ -98,7 +98,7 @@ struct owl_pll {
=20
 #define mul_mask(m)		((1 << ((m)->width)) - 1)
=20
-static inline struct owl_pll *hw_to_owl_pll(const struct clk_hw *hw)
+static inline struct owl_pll *hw_to_owl_pll(struct clk_hw *hw)
 {
 	struct owl_clk_common *common =3D hw_to_owl_clk_common(hw);
=20
--=20
2.51.1.821.gb6fe4d2222-goog


