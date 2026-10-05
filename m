Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B75CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 20:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J3Qc6M2FWp5fQpmardGXk9w7HUQgqdCLyizNZPwG574=; b=Kwh+j6GbIczC6nMAUjKCLAq2Uc
	fF1I8Rg0SAFucXuWny7x2wvBqC95CZoo8fakOq81dPr+Y7fMS1EvCKtHyJgmUsgclgQbYmj0ZQ7Yb
	ikiQKFWLxSU6mw25pK928DZ6scwW4yvKqbuxqC+UQyFcRV+GHqVOQTLYvi5XaAIxq9T3Bq2rcoLB4
	N6KgYJke/Rs642Hcv0VR+Sp4kOpqymvsJ3abrH+j++4kuuccTNdRfI86TodISj9nejloXuDI5Eh/O
	0IyD5oJdKgOVH6B8djQU7VLlN1d+SLxaF6j4JVDSH32UjwDr0UW7KULLNuIGHZFgiw2xni/J53qh+
	JT3pJs8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDpIb-0000000H8Eg-36et;
	Mon, 05 Oct 2026 20:28:37 +0000
Received: from mail-ed2-x0c.google.com ([2a00:1450:4864:33::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDpIY-0000000H8BH-0vh2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 20:28:36 +0000
Received: by mail-ed2-x0c.google.com with SMTP id 4fb4d7f45d1cf-6acb6b726b5so3424634a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 13:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232112; x=1791836912; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3Qc6M2FWp5fQpmardGXk9w7HUQgqdCLyizNZPwG574=;
        b=URHRxaX2rTmTn6g7UTAcpMDiAcyHMtMAFMh5GAT72emUOc4VV77rD9Hr0tXGcqDJ2d
         m7+A6um/06ZoIszhpTAh73pwRsy6oDZuoFFGXXkMuDJaRHPmwGaXFG3abYocRKO7y+vP
         7/csLGxVYT2bE7U6CZoDuZSYGKJmA4C6ViYnW3rD3hBq9eBHSTcs5Zs+PKb4IWvXY8lv
         r43SuX0Pt/HM8wuJ3X+tDbkyo3aqIybn7X+JMydTBHT/3X3HT+DkppIW31HC1vD3AshZ
         URLNJM0PdbA2X2Wk6YxixopSs9F/bV7FKEOPhNdiJVsDAQ4kYyyaQ4Dav0OthV35g6IR
         sMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232112; x=1791836912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J3Qc6M2FWp5fQpmardGXk9w7HUQgqdCLyizNZPwG574=;
        b=dRDr0VcpkoUc/dt3JKQpBLJOjgebAMayRKYlECMJNE/Npt494cMa7Ts1GBtdhRfZgo
         /flrN7CENRFiFAYIhm4PAOILzsgemaS6ZUttmfjNxWY7kpyrbvDqt6gSByGKj3AKjILS
         3N9JRyWJ2IEPK/WSq0rwh+Hk1Rq0XQLVCQHtg4CL+SJ85sypeJXc96JlVpEYjx5tabKp
         9VfLeoVXcgVlmpRnyIu5bIisMAUPHheRXdxxygVMq6coUdJnG6piGH4fS3L5BEOYKRLd
         Bi2yx4ErENwlBfVYxsYLydmdJZ3NMNACgWovNH5/MaH2vOvZPWJnzXUUSO0gFuSrCMK3
         xXKA==
X-Forwarded-Encrypted: i=1; AKwUvBzA/gad/fKbLTe1S3WQutbZaS5BZSLE5lmhPape1HOU60IzSvIoZVrBqYCdIRo1bm1IMuU1CiqP3tghrmpelxCR@lists.infradead.org
X-Gm-Message-State: AFq9FYKx5EyUwRVGlMSE5J79yi39/emQVMi/8Oe7DPDZFJMJic1HMfQi
	hcstTkizietaslwiAbYEBig3c89iBj1YGDJICB3VpSBq5bsSydIxIQlX
X-Gm-Gg: AYBFou28lM/yYsB1kzjjFRvkOeTVRiSP+Sc+ai4k0A3ponZsbnNsWVdW11roWc6ubiX
	TzCejG96dWvRYSBs9NowQGAp2Sm0xJ2MzJmFicPzPN32E9loDAv559UwnnQ8JN8DOV4Q4cPhTF7
	avqghPk54cHXORq6iCwVZFsoVWnPmiDZ8DzVNwdSvcbH9sFuxT1Ce1WZNFErtXiINKHNzYDDMFY
	tOpgLKWKjES/KFz57yGR/meKkvVS3I2eumrMviGIX+FreJwCT58dhFJubRgxwoqCYSWLAHoBODf
	2Z8cxvr7d4sz8D2jZfzJmT4RaBu/qBqZu+GVe+UeKf4LFtXaWP6Zm10oVIZJ5M5pep9OuX715lo
	7zEr5Plpn3XemOpLM6wYBZvdD4BZqj0Ln1usR0dlOL65aq/j4bgFbnRgnNS/XOhFqGvzgiZPR6J
	z1osmRG18rtmKEbQLCG2x1LmA7bEVCWF3WwWkwn2JPIP7nEMWFp2iHT6ZAnJFEaj37/Jf71l+a1
	dxiQb++lXGlwcHtvfLBCDIRwt1yTC9zVm3fwzuOb0Y=
X-Received: by 2002:a05:6402:254b:b0:6aa:f11d:b64e with SMTP id 4fb4d7f45d1cf-6af9e34ccffmr10161152a12.32.1791232112351;
        Mon, 05 Oct 2026 13:28:32 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:28:31 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 10/11] dt-bindings: arm: sunxi: add PocketBook Verse
Date: Mon,  5 Oct 2026 21:27:30 +0100
Message-ID: <20261005202731.153971-11-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005202731.153971-1-pmazzini@gmail.com>
References: <20261005202731.153971-1-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_132834_983113_E4016140 
X-CRM114-Status: UNSURE (   9.86  )
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


