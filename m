Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09969CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 10:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J3Qc6M2FWp5fQpmardGXk9w7HUQgqdCLyizNZPwG574=; b=PY0TPJnbJ7cUsTZbDu9RocdtcC
	4pQ161NfJcMmh9AgRXHhlBFqwVhclhQrM5AJcIGWYFY9EDU/ft3PHuZhhvRBfaofV6J017kY2wdob
	m9j0XpCV85ZTYPJrm2xtJfFeTUg85Y4isjXEvWX/A8T5m0xjbmJbVZuHgjkIepX818B5vhgaLbTFv
	pcLW3JpDOreu6K6dfqeM6qGXQk8tTZ8lS05h+hLzbT1c7Ojq7oh4Qk07rYdwHeCBMi1egWzY9VkDq
	N+/f9CfInmPNXqCN0os12n8ghST83uJRjJ5f1sxRVJDliJekPDLxhrQK+0Iab9zSBgQ0ZZpntJd44
	0s6zyF/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCyd-0000000AAeo-22DQ;
	Mon, 12 Oct 2026 10:09:51 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCyZ-0000000AAbH-0HII
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 10:09:49 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so11110035e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 03:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799785; x=1792404585; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3Qc6M2FWp5fQpmardGXk9w7HUQgqdCLyizNZPwG574=;
        b=rddqgmRiwUhfLSXqbJnPoIaFcDQ8SC2Pj9xTmqi3tozt7njab7ihMI3rIdfp9Ohh0O
         5VRZgaCNS7PWmxWVxmUHYhCjgXWr/Yz6ZirMufuPjdu/m4BMV6bi/3Gd/7mTCLWQFwyy
         JxOuZ6QTr8Jnp3TB2CNHdoTbO8Mt8CqaDs+q8hhwycEeNPp21vtSGxjcGjW3Q3HnPhoE
         DpQMuAO1eDhh0+v24OR7EmuEbaSjtvFOX2m7pUIOuEFS14dlY2EtmP2adSHqn5/yFV6X
         JkPgKtjtXT1TLd95rk2+NT4QAvlbb5SD9rQjflxCurNjT+nFp7gKtsqhkqUXENXQGtfg
         d+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799785; x=1792404585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J3Qc6M2FWp5fQpmardGXk9w7HUQgqdCLyizNZPwG574=;
        b=kuRhF4LKMEG3CbuFc67AWqKL7CO4QVCAopWz4xNo4RhbDGPKvfHSFA0ExSjG2DOwCA
         v0EcECLTRJKE0QDY7OrVU514rnjti86Hasyx8hj/XqWXEIkiuon2SiIpo2guWiRSawsZ
         ggJXAxzCrWQCYpFYL+GLSiY2LKAtVcp/stUiNr4DLQry7Q3wONOEKdEAYfwWg//aQJQd
         RKfovJffak9TC/S7fZ6u4YkDRhvKd5Jlmed5OKnTEkwq0jzw/2z5O/5KVbzOFfXe1vho
         qSWtGA8STfQJB3Z9iMZuwpjuNza8aGrg8kPZNAJdbAuE1asw3g9sZRN8K+JkMoMkZghn
         8rNw==
X-Forwarded-Encrypted: i=1; AKwUvBzKNOMl0zmy7t8DyJjh2sf+W2BrboW5HRfhrfcwcJXKGvLq6KEGqO3J00UsB1zBx9DphqI/v0s0DdpYTIqn0/gI@lists.infradead.org
X-Gm-Message-State: AFq9FYIY3GqzY7a5+sJI3XI8Zumlumu7FcI0MVFHyJRzZu5hIdebw66+
	GCh4gU1mHbxl5aSg1P5lwvBISxxMApDkxFJKBY8jWnXriWbzagQC2PZA
X-Gm-Gg: AYBFou0UfUtPn9LMVRYjCG38Xai9g1vFucd4uGtAEuD754j6WTzmgn5aTd8z38ucmz1
	DmptRUKn8OnBQAPPI8Nva7D9zz7R+X0pyFTyp245KxKzTpPQLe+c66peyq37QkNQvP56qZ5ybRt
	x5o1JTncc4MeXpL+frcSV8dTckTvGkAqyVtm+1wQOBt4Dm0CGniAQaIQAfbqjGpudPt66o6IiKQ
	ciY4fTkYkhkCbXzlpfjcCqg7UFnmjfWbzu07p6cZTCzsgT3E+HW3G9PwwTr/RdDiqgAuhBmfKyw
	YAcg16wm1zSRqWVT9P+8OPJWIaxKGe8itvrZLM+lZUkM81iGd4qQNBVEn2EubfpaQbc0ql0U3JF
	q1QXFa0vq71NLGDQ1hkaQ95q2LQ6AxpjIFyM4RcLT4VpxVV9nQQ2SbCAOLZKvDI2ck4yJjoI0yV
	4LOvVitTdMRURspsb8TdDWWX1ODyWQa8dp6a4e9H8xwI8DNBAfsuVo8y43XOc8GUKRCQLvgvX2J
	BuhzRb0gXIXJ3bnIPsA491/uHvTpxMz
X-Received: by 2002:a05:600c:4fc1:b0:49d:2536:402e with SMTP id 5b1f17b1804b1-4a19a9cf1e6mr56555745e9.30.1791799785371;
        Mon, 12 Oct 2026 03:09:45 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:09:44 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 10/11] dt-bindings: arm: sunxi: add PocketBook Verse
Date: Mon, 12 Oct 2026 11:08:15 +0100
Message-ID: <20261012100816.331033-11-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_030948_470204_97547B24 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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

A 6" e-book reader built around the Allwinner B288.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 28437c47ac01..fa34786f0652 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -811,6 +811,11 @@ properties:
           - const: pocketbook,614-plus
           - const: allwinner,sun5i-a13
 
+      - description: PocketBook Verse (PB629)
+        items:
+          - const: pocketbook,verse
+          - const: allwinner,sun8i-b288
+
       - description: Point of View Protab2-IPS9
         items:
           - const: pov,protab2-ips9
-- 
2.52.0


