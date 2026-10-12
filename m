Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2F6CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 10:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSIEEiVdbd5GTxTHiyeMgIrG8fJXeKWJLeUgPGtIm2c=; b=CUKYchbZvtOxwKhMcWANdRwEl2
	RTysGdjGO9JGkGiUxVhFL3DoeuYkFagqpXno48Yv8iNU4b9CuJoHadLWfC62OsoOk6qSmEABCuJGB
	kC13gU5Vq3+/ghhI+cuaX/iKWfQo6Gbcs+8HmoOkLycvgwQryRWpYJ5GbaGxLEKfFBM3/m9h0cr3z
	4TaVYUkh1mj2znzT6tEHpPqUwJswoFugSryNyCm2eBaAlp5/d2XYmYhAr3It9LEMa+IFZ/7bR8eJU
	BUiayYnM9cNJZQCoGdNgJQx7HU1YimvlGlsWqZyW6S4ehhm/wnqXT+6TutK8hGvBGjs5NQlrTG5Pz
	tUi6vAeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCyU-0000000AAY0-1MeL;
	Mon, 12 Oct 2026 10:09:42 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCyR-0000000AAVd-1GwT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 10:09:40 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so11108835e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 03:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799777; x=1792404577; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bSIEEiVdbd5GTxTHiyeMgIrG8fJXeKWJLeUgPGtIm2c=;
        b=EKD/zfebm7GBmbANP5NOiJya1qcYQjDcWl9BPi0EWt2fMAhyRsbe50E9hpyHlJEL3p
         s4Yt4duilKVSYf9H/pqImnqGgCvnTufnFsf9KhVvsZIovyXNDlcQcSdYVPB0o2xekl2Y
         av6v7ztc8hWeH/ytJYpksd9smtN7VaJ1iPlvMOSxlBWSxVLnKY31+ELApYfi4V/Q+nAK
         sfAwU7rAqiCHHHLhGPeJcponWC2XzcJa91lb5JaCZT7SaLHorKv85pb6vnGBnekJyQpP
         23wEi2Rt7hXcvIRoQG9HAdFXTlDBjeVnhLRWik1s/Fh1T2VXuqHFOWhoI5i/NHqMG/Nq
         HwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799777; x=1792404577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bSIEEiVdbd5GTxTHiyeMgIrG8fJXeKWJLeUgPGtIm2c=;
        b=h4mrh0Y57u5tWeocS/nV6V7W5I+fYE3rgcGjNld09XKdXJ58jnKT+qdkCKhTeUG0k4
         F+XZn53k5eO71jBVMLAGDCXci0JYqhUWYrABrPxv41dSILGDesTy1T3DTzf+/+FLdAtR
         6DnmVwhiHALX6oDLOhTtoU8QbmwILXeLLQP/h7nFUC3/JKBgZW3LMkqrcj34D95AzXGB
         tQviLUUId/v6HE4iQ+M3QiRjZRjCehtwMRRdaZNgfUyWYwBfXbeGkypjKwr76wNW4B+J
         gQG1cCM4EPEbaVrEQUSopCFtZZE2S9L9haLhM+tJW0lXSiVJ0CJNsB+UQQaepyi8iL0N
         mdTg==
X-Forwarded-Encrypted: i=1; AKwUvBykeqlmJEL+ixNgw3Q2vltU8jdci2uhWs1xIPQ30raniLpk5AwlAwthGEsNRVn6e7Tp/K7W65i7iAR/BlBnw6qz@lists.infradead.org
X-Gm-Message-State: AFq9FYJF7KWjvBvl/KtAwR6NBwAC/As+B8Jt2q5ylzUsHmYlHixSONP+
	Wh33Ii/HPom9J5OFIKRFOnHXkQdYP1eaeAFBgt6b1bOr9zstMAvwGk4u
X-Gm-Gg: AYBFou0oteplwUObXEP9mSaRzU4LUGEbBXqj2N5ZNHUPLlGzNbmJfs57/6kTm+rdA4R
	AW+ACq7KDm85ecwMQ1FlZOEm83S83UycfYfdPIQCDXoJtYIqsNEGb7+2WvAAE3HdmpxMLjLI/Zw
	2NyJfS06uqF6qOw47VehDC6kVf5JXZemkNWPNQlCp+gPH3An7Plu2XsFjAwMSEcvW9ZT3WRmg2C
	vTTBOeOfimHms2dgjpZbN8wm5yNZskd5bSlPBz6SZ65AA1zfLTlXUZhiyM+zN/3Tp2ATR5C7NFw
	ZdPtJt/6E87kmHiJiNclEidq2UJq1Fja9QoinGangAp152zXmQisyGI5Kg4LzUZ4bXEk+9x70W5
	l6rJqcNm3WttgdL8pWUaj8Ix2cyNMIL5tkPr07pZPQMh4U53cP66wUAZGTD4lXMzEbzikC752Xv
	MOtptUFDEqymWowFZ8jU/bl1oA59+Y4ROR7/pe6D25vYB6YUkgwgn2lBCgdNjgGMXlptqkSk6ew
	FQP6GX4VAQEBzVVV2k0PV5DGI8h2fYa
X-Received: by 2002:a05:600c:6290:b0:4a1:813f:2a61 with SMTP id 5b1f17b1804b1-4a18e4ad518mr163049805e9.15.1791799777253;
        Mon, 12 Oct 2026 03:09:37 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:09:36 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 05/11] dt-bindings: rtc: sun6i-a31: add Allwinner B288
Date: Mon, 12 Oct 2026 11:08:10 +0100
Message-ID: <20261012100816.331033-6-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_030939_358173_5CC3F2F0 
X-CRM114-Status: UNSURE (   9.60  )
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

The B288 RTC wires one alarm interrupt, not two.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index f2b91186ed37..ebe35f893f8c 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - allwinner,sun6i-a31-rtc
           - allwinner,sun8i-a23-rtc
+          - allwinner,sun8i-b288-rtc
           - allwinner,sun8i-h3-rtc
           - allwinner,sun8i-r40-rtc
           - allwinner,sun8i-v3-rtc
@@ -82,6 +83,7 @@ allOf:
           contains:
             enum:
               - allwinner,sun8i-a23-rtc
+              - allwinner,sun8i-b288-rtc
               - allwinner,sun8i-r40-rtc
               - allwinner,sun8i-v3-rtc
 
@@ -162,6 +164,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - allwinner,sun8i-b288-rtc
               - allwinner,sun8i-r40-rtc
               - allwinner,sun50i-h616-rtc
               - allwinner,sun50i-r329-rtc
-- 
2.52.0


