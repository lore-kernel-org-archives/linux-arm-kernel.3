Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F118C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 23:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPQUrHxbPl4glK9O9eU6ywBBPx1I7T/6JYnYhIuuFKk=; b=HJqL7sMRfSBq/Swn5YieAxsUGW
	nHItcHUgCDwJHsXPaZ2zmY9+t4w6b2cnpjAURcK/y5z+QNyMS4U0FXVSXzIwlyVddlFj03SjBjqLg
	1PLBTIX+n+c39eb6/gea5u/mqW+5o0/G6lCkvDq2BWEdYOblbCrBrenNeg5vQRkHpfNGUqEuLQLU6
	YllMl3prn/XC3CIJOkehX8ZIiFDbY9jUNkC+ZvKnzb5LTYSWAWWkDUCFEaHnSNoUyb4DO2p9RPERq
	7HWdOJPFeEfet3EgzYBMbmGnPNOCJrF3GyuM1he24nZz+t76kGV3BZeUr/2N+uzlKD9oP9rPNMQK5
	HQWouaiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thzHO-00000005XUI-2MrK;
	Tue, 11 Feb 2025 23:02:58 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thzDM-00000005Wt7-243N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 22:58:49 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ab7430e27b2so1166672366b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 14:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739314727; x=1739919527; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPQUrHxbPl4glK9O9eU6ywBBPx1I7T/6JYnYhIuuFKk=;
        b=YFiA6r1KarScPxdQVN/VO8pZdhYrYydfS3CEO6qQvZp8XdSoe83/Wlpu5k7s+pE9V2
         r1GgBdlfGCg/37PW20E9xe5AhGkHDafN2EGuyW8Xu1iCKzW44xWRy/HogDY9oAUglcv1
         m7zGl/PJ6bK3ajhMJ4kMir+LgSFlQDeD6HF3/m9fIgjD/MR1NSy6NKkMY6kWtgluRoqs
         tbYwaCIv8aMmYC7GC/zSWsK5r0O9JwwJgBEDctiE9CRUJC28ctZOLc5MeBJugXgmpS+8
         RwUk8KCbXc1vLAFTaLPdcIs9N+IzG0vOPlphAPqLmtCnNpOeIB88EQmGbuHvqKUQoImg
         FTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739314727; x=1739919527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FPQUrHxbPl4glK9O9eU6ywBBPx1I7T/6JYnYhIuuFKk=;
        b=uy26zFPJ6dj5sBlDgvEH+YHlsJ6KbGvkR53PafQb486oBFW6BhCI3UWdNleBQ5eSL9
         JBiQzycOhSFUcW6bkZTvfulz2f7fMN3Uf/qVATf2qCJzXKILHZ8Prymmzbblex7CnoSp
         aKnrmdozLzIsItIFC662z4JUyt+jvgm+IVvxg9XnaRwIyqGFd6iJgQ6Xj2bHcRveYFqh
         vLXUBR1aXYYSwOl+MbOsMBLOjbTykxrE7LL9DRMwkwxsESQO0Xo/eE+YG+8nNraR0KVl
         fVtp1EeI3nqASRdFLG3xYVJuzyUze8Xyw/FNy/dhHTOrSEhqs2pNtp6yUU6B0PWWaVrQ
         sXaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFfwuFL/VyaeAKFQ4O7/iaDADKL35M7O9rBg5QyUWXd2vrDuMtyVyRM688rt468DyhVFUemAJaWkcAlvsHO7vc@lists.infradead.org
X-Gm-Message-State: AOJu0YyDizB2uKGvc9CUtwquLCPRx3xpoCDTbFmcpXoDvSuocN4zK5nl
	o8a1cCQJRJlz+ztZwXghXWWUTT+bgdNSUiVd2r2oMBySmnX80DTc
X-Gm-Gg: ASbGnctnUwaDEDuNknWTwQMXzWbde8GCmX9npB3LLW4HMQBtiOcppvHw1Y7jal6Alzb
	tOPQ1pF4NacJeozC/HacLQ+e7emryQXxxAx+eX7heCUkQ+kndaIjUgMXf8dk3sQ2lhUQLHMMozY
	AH5TB+c8mMG7vpyi0wIw2zOoFxrsYhmJNu8b1kgfOHWFHDzVNf4h3ksLcp71PF5U16xR4gfQrwe
	/2eW23BQ5C2d4swJmMqUGlCSq69/309t1FZgFSh5HoE7HAukyDOvtuSFgPu/QnDZD6xoxO0cRM3
	0yCz3JTsLFIK2Q+WFbtq5ZPW9NSwBYkUhpuieXSv26yPtZltflWxXQ==
X-Google-Smtp-Source: AGHT+IEmqE1LOzAGu3QEL/UkzAXihfpx2bG/CuCWu32huCvYMcpoSHU615QU9ED9pRm7TjRqIRBWjA==
X-Received: by 2002:a17:907:7d92:b0:ab7:dec1:b357 with SMTP id a640c23a62f3a-ab7f34a0d2amr68277466b.39.1739314726948;
        Tue, 11 Feb 2025 14:58:46 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7e9fcd99csm131525166b.89.2025.02.11.14.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 14:58:46 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 2/3] ASoC: dt-bindings: audio-graph-card2: add widgets and hp-det-gpios support
Date: Tue, 11 Feb 2025 17:58:07 -0500
Message-Id: <20250211225808.3050-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211225808.3050-1-laurentiumihalcea111@gmail.com>
References: <20250211225808.3050-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_145848_533564_56F27753 
X-CRM114-Status: GOOD (  10.42  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Introduce the 'widgets' property, allowing the creation of widgets from
4 template widgets: Microphone, Line, Headphone, and Speaker. Also
introduce the 'hp-det-gpios' property, which allows using headphone
detection using the specified GPIO.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/audio-graph-card2.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
index f943f90d8b15..94588353f852 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
@@ -37,6 +37,10 @@ properties:
   codec2codec:
     type: object
     description: Codec to Codec node
+  hp-det-gpios:
+    $ref: audio-graph.yaml#/properties/hp-det-gpios
+  widgets:
+    $ref: audio-graph.yaml#/properties/widgets
 
 required:
   - compatible
-- 
2.34.1


