Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1ECC9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 15:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gSdVTPRqn06pkAsO84XJHQb2v3v0xthABnxiNhSpNuo=; b=wL5HPb9xcQbGTL8yHyN0AjasLF
	2tYgN2kIgXqGE19tZV9JMIk5wBmBSmhsLb4/ubCgJiv5A0OfZymetjksfonGUDNQhoVlUp89PKkAQ
	JlTt1hZ24trsCC9cV28/HETyxpTwQck5HLSIPsl0EqACFNNVf4B+AHAdqLgbYMM+G0nJIz/+iFbIr
	dVVP83YfZkow8rz1EkpFXYjUbRx81+C7Z2GIXbazVgGyYi7NrsAddbPWY6a5sYMEINHgsrTNWffou
	u3zUG7JhKgV7tnfhG+nqAakseNnFj0GWlwsUOGqGw0Fzmi0Bbp+3jnHeIkKdBz6bueoJEnYwCLrRy
	pNmMLP0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqYV-0000000GV0u-0OBG;
	Sun, 27 Sep 2026 15:12:43 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqYO-0000000GUw5-1ISP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 15:12:38 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-488780459e2so2273447f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 08:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521954; x=1791126754; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSdVTPRqn06pkAsO84XJHQb2v3v0xthABnxiNhSpNuo=;
        b=TRxNrhXupiAgzOUqkw7r1BGZDjesbi3s5qTm9YHuqILU2pHEaonJu+akekhOvBpaIK
         5ntXy9nNmXHXjOyAZQ1XZzobs1YI9Xy7MsKzDqO3lZvJtllZTFWEHQ0hx4Ho6tlF4XIa
         lX5ETIR4svBF5OklZ+HOsAhBUJ78gUuZ7XxKY0EDV/7mazH8Kqm+WOoM/iC8zb1vK79C
         z3XSWF5B7N/udrR7sBTmbmwduYZpj0HRmXZIaIbTmd5J78jB0KFRiz0zzbx7blchBEMb
         kG+nsqRV5/B7RXc1F4daS0PSNTFb0BgGgj9MUd/qbGueqeLKxn52C5v7y4u9q0p4QZZC
         l/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521954; x=1791126754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gSdVTPRqn06pkAsO84XJHQb2v3v0xthABnxiNhSpNuo=;
        b=ZNd6bTQp9XvQDzKbO4DB+LjUkyYTdiXV/A+Sjm2BmO7k29o+NyzT9J9WR50dfPf6oP
         yk4tyz5b65vjEi88WimjDxXgDuq4jvPak6v++yFf2bnSTzkC//WEnmmw6Kqm/5NTm7Hr
         x2/O1wprSg/HAU4mfhOZUryX9bgK83NQ9aPPaAkB2jqRBySrfGJKSZjlLrpCKXlqtraY
         b7XHcg6+hr1F9vefBU1EW/tVobSvWBCq+DIks9WsHFgZw/ch/MVfBXOOBAe+GCbZjCeT
         7OfY9yvP5CbugichK9clozFDDFpLdZXWBfBjof+rqowavCOmuXISyC6VrtvVNAx2i4Cm
         sV/w==
X-Forwarded-Encrypted: i=1; AKwUvBxQklKzpScrpidhi1ntSXVjKeXwuNfv58ninaVuaygrkgEH5UTgyhBFJj0EDuyx5n4Afnx44pHSwAVqV5Wdewny@lists.infradead.org
X-Gm-Message-State: AFq9FYLYRHmdH302kcV+DARML5wsr4RDVxzyrBadnX++SwDyPjYfd5ZW
	v5ORIRUZSo77m4ollrJ2AikuRtEDoQlZuYRt0DpafzLJb07nFzi2NPIU
X-Gm-Gg: AYBFou1lSlNT500Zwb18MfzPubJUFQvp4K1j5ulUbY1yUKDVqYGcy5YXcfEh08HoIeT
	LloI6xJqlw37GZuoznzezKNnCBNtbSyiMM3NT85PmtooPFhznVNZO+LvtXgXu2N+E6i9T3RWB8a
	JFqa9RCaepgjGHde+S/OCE5Vgl1a8wY971yymBPRjFh98eKJe+GqUrhAK6aDxx/2vipokDrlhGS
	cp2pV988+0wjejJe7+RteQUSeOa3mmVb162hIVvts3jp9vPcpJWRebnc/ycquBV4lcyI1jGeVMk
	E3gQTCAN89vsWAK5RN+89oK7RvSdKyBaaFnH15sii1ZM8ccCL2/6OX+jN8GwQVzO9kcqeCjhu5g
	eZ4xJi1JRapBUZuwvC0N3R3yTjQouGIfOgHSzRdMJg2ol0jfsGxo7iWpwnvee1Bfr0yXkyoYwG0
	BxHy4rfZRJPYj0iaEcijlbloKH9RUvPcXWCSDx+C0UtxDW6R4IUVm8OZnk0m99PZVzLTP57/pFS
	kJG4/5GIErrAgvqIGCwXEGkwTK4gxYh
X-Received: by 2002:a05:6000:1a8a:b0:485:8cc8:1f5f with SMTP id ffacd0b85a97d-4887187595emr20616765f8f.42.1790521954539;
        Sun, 27 Sep 2026 08:12:34 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:12:33 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 09/11] dt-bindings: interrupt-controller: add Allwinner B288 NMI
Date: Sun, 27 Sep 2026 16:10:14 +0100
Message-ID: <20260927151016.186493-10-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927151016.186493-1-pmazzini@gmail.com>
References: <20260927151016.186493-1-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_081236_401119_67DAFC43 
X-CRM114-Status: GOOD (  10.24  )
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

Same register layout as the sun9i-a80 NMI, like the V3s.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
index bb9273ec2457..179e7842bf46 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
@@ -29,6 +29,7 @@ properties:
       - const: allwinner,sun55i-a523-nmi
       - items:
           - enum:
+              - allwinner,sun8i-b288-nmi
               - allwinner,sun8i-v3s-nmi
               - allwinner,sun50i-a100-nmi
               - allwinner,sun50i-h616-nmi
-- 
2.53.0


