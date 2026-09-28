Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7118DCA5FA6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 17:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lAKGigWSN+rmthZd67UvTxza7+7ujThB0c4R/68QCpQ=; b=XYWffmjLqIOpKoDqcVTlmLXcSp
	+jruMDpMtmQlddHFAHcdmnbJfAt9KC40hkVWyDnLqUxbaWTYkLNuFnjaKz8NfamVxIIqhsQqnlKZC
	ia9koar3sjfDf30NYgeM1wMcVVrpcIOr7zYen1tmnHDNSN1VxAiQbEiFzFhnp6I2QgCgrfhZy4eGn
	3TMfGziA1HKvdnELUcdIfGMyGEjl/aKa3cJ77ibjy+hniSYyrkyIhd6bFcS2Uko4JXniXMf/MVRsd
	ekNOpYK4cvo3I/VweAuGa0Fw4SPZQBzS4HrrBW8FT6xylmTRG5wbSw0VguPNgyI/lwHqHpYWeHqlU
	aNjdAN4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBF03-000000017qN-3zXh;
	Mon, 28 Sep 2026 17:18:47 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEzo-000000017fD-17Ii
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 17:18:33 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48884b926f0so2099354f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 10:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790615910; x=1791220710; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lAKGigWSN+rmthZd67UvTxza7+7ujThB0c4R/68QCpQ=;
        b=jvCu3yushiEqwGkKN3G4U2BnoIjY6/3nJUrxgQOd47fdT1emwgPEJEffH97nPdqtur
         HaVTFFgUZkFa4TEFSK5xZS4GeIggJI3RHSlIpMF8BQwR8hjFMEqb1vj0y3P+S2TjEeeV
         2KhwDyVAwSU1PKIDr8gBsAp7zn/ayo79CD4/p/vHaKAnF0gjps5g2pTn3rDXEi9dM/Sp
         gNGMdzQf5LuNBkLhPQAiy5GaB2p8gVMJXKab79VPBsq2CHhgla5Yq9mUV1q5jEnl1rwI
         iYtGcXN7op4EAPRHZX3I30QGpIos+oruN7ZAstNGLNJI+jpzMwYyH+BaXy4jtP5Rm6hn
         Qh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790615910; x=1791220710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lAKGigWSN+rmthZd67UvTxza7+7ujThB0c4R/68QCpQ=;
        b=hBhTNwq0FP/dlhD+eREna1Yp/hfLY2ow/Icm6c3ES1C+MSPCYUrC3tVZkY6aZXFbjX
         6Q3LGWbAY22q8hPF+0MKEk9Ichj+6E7F8GQp+pCvVUzxcA9O7ZsYhH5VBEkQLbYc178E
         L0ZV0oY26iFuCvXqDAlTNUiWdnISQcJyv2gB9utE7W8Ciwk8mQMY1fH2JHHO37pQWD97
         UvOjQcHHdr6JC6fDcTe/9tOqwBnYAPn+3uEh+lOM1xKJALHVu/7nVEW6Y5It+KNX41LP
         exZIy+/rWjz9BPsXxyLgqxTl2cghF5ePsm2SnrhpWBFiiihWC9MyIauUj3UY14F/vOEq
         061A==
X-Forwarded-Encrypted: i=1; AKwUvBxMkPvUhwNUBKfz+X6HNVLnGsakuhEhcJnV80pMBNZ/5uXbExtIyfJiPOOlPoaNryxgUibSkMZsKYtkvOrPohbJ@lists.infradead.org
X-Gm-Message-State: AFq9FYJvhsTcuItx3Qc1ooHz1vzY3Fk492FHeyUDr1WL/v72pqaoZqWl
	iU6wdDmjjs48CLlzf8hv2icb3O601B1JxBQmWhMT/orM5QoIrRCHihDZ+ELLmYhLjJo=
X-Gm-Gg: AYBFou1gCu2J9mk+Ou7Jdg9iMxmNEzaZLryDf8MCWIWnNxxYpk2nAOXziHOypU7oWPV
	j0T2kte7hbCPY4fOZMg/MSzOJnhxs83pn2iynKdYwVBWaaDZGM6Op2Ify59NJeXbVUsLG/RTLB8
	NXRZ9ZNB5yw2FVpjXX0/Pee/ZeRjS20e3BMBCajlWqPep5Sf8fhl0sLvUPEeI6t2XzeTzFk7Avo
	pEDfgtlBxn0Dta19a4Jl5OS7ucNs89Fk0bIotS60woRoG9APlAXD4AbDHIE8m/f1SFFZqHtKEVZ
	n0Zthf+ubDbFwS/y3QX5yVel7Fe0dCzd8q8lqF5xxvaUki377l7SmYASmyI0BlGBa28+6z0P7pa
	LgBJD0ywjZG+y81HJQWhii0gwYjsn6bWvjCbT0qScmTrLi0bssSaaaW20bpZs9cPtYSM7BwIGbs
	o/I9qurLBLFwm2kWcCcFGnjz6K96rhwFniikNO59elDkBWPBbnoljpZIOGQCNB4VqTx7Va842MB
	UH8B+iiIBqA9pUYKotpAgWHfPc=
X-Received: by 2002:a5d:5e83:0:b0:488:84bf:eedf with SMTP id ffacd0b85a97d-48884bff147mr13188564f8f.48.1790615910338;
        Mon, 28 Sep 2026 10:18:30 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a84221bsm29224973f8f.36.2026.09.28.10.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:18:30 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 28 Sep 2026 21:18:17 +0400
Subject: [PATCH 2/5] dt-bindings: power: reset: syscon-reboot-mode: allow
 supplies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-b4-rk3576-reboot-mode-v1-2-65486b03bd41@flipper.net>
References: <20260928-b4-rk3576-reboot-mode-v1-0-65486b03bd41@flipper.net>
In-Reply-To: <20260928-b4-rk3576-reboot-mode-v1-0-65486b03bd41@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1488; i=alchark@flipper.net;
 h=from:subject:message-id; bh=Qk5juJXyHQAA0FzltH0EG8o2EdUhAIQpUus6d2gQKFo=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtWhjXfaohRDvZ2oGd+Uf+xu0+NgEVbXrP2LMEDyzYf
 lr1rO2njoksDGJcDJZiiixzvy2xnWrEN2uXh8dXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKa6nZPhn7Ve/ve00199+Wc0bUvTCPwY+1/4mM2mrXznHkRFzJBZ/I6RYbvqtra
 ZZ5mnWmQxbU9nqIhql5C2M3tQtGISw1Peo/8EuAA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_101832_336728_C424534F 
X-CRM114-Status: GOOD (  13.04  )
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

Whatever program that acts on a reboot mode runs before a full OS, so it
may lack the capability to enable the regulators it depends on, and a
reset that preserves the mode register generally leaves the regulators as
the previously running system left them.

Allow a reboot mode node to name such supplies, so that they can be
turned on while the mode is being requested.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 .../devicetree/bindings/power/reset/syscon-reboot-mode.yaml       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml b/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml
index 79ffc78b23ea..5ed70c87269e 100644
--- a/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml
+++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml
@@ -36,6 +36,14 @@ patternProperties:
   "^mode-.*$":
     maxItems: 1
 
+  "^[a-z0-9]+(-[a-z0-9]+)*-supply$":
+    description:
+      Supply that has to be powered for whatever program acts on the mode.
+      That could be a boot ROM with no access to regulators, and a warm reset
+      leaves them as the previously running system left them and not necessarily
+      what their expected out-of-reboot state is. Any supply described here is
+      enabled when a mode is requested, and stays enabled.
+
 unevaluatedProperties: false
 
 required:

-- 
2.55.0


