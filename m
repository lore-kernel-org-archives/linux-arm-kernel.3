Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10C6C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpPxa3udA+AHKNsx/j88F2vdXh4ZBb+1f0MLnfhs2YU=; b=rGPdgJMyVb43Hr8eLz7H520mB2
	ZM8Sywu4l9lQET3F+tnDJD7a4kuqupMhB7EDgxOEIqwj3ihypuy+/KAxCLWJ5+ld6SL16FWCXw9nW
	i21mV+VgkO2B/x6fdnjuOfunqdP65NFEaOicMU17RCfyCbpb06TFOOAGGTMuGEQj5iL6SS3eHAk2+
	0Zi3J4e/jXM5ug79PNNXg1h5lJstQrcbB2i8HRdQAn/ENDyyJRJitHpYnU9fykg3kQ1bwS5YzPNRq
	zeaV/h44tssRQgISW2Keb2xkJOfv5BbrIAJ/8Bao4bDwuz7/9928vZaiDOn0lMOWNYQC1A0tmho+S
	6o87oyWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQs4-0000000Bz8z-1eln;
	Mon, 10 Aug 2026 14:20:56 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQs1-0000000Bz5T-3IZ1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:20:54 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso13347505e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786371652; x=1786976452; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpPxa3udA+AHKNsx/j88F2vdXh4ZBb+1f0MLnfhs2YU=;
        b=DzTlBoSNsknEyp6kijjfXaXr9k2j3uMp0JUY481wlypY70Cf4ZRi3tfBgrx1tvCfGy
         NLcg4HIj0CFLbMyK3m+Np+ifStv3uLRtZfANGQH14CU9QuSXTGdklQSJyso2tRk/opd4
         2zTyh12z23BY2TcQZ2wMdKukgp2AtFVPiSzFhxT7BYs6U9gZSYNUsr/sU09C+b7a0tRq
         nAH8woYXmWPSPqZfcmfxOMkpxufPwOSnTz2xHuAhYm6PBRxRBmmD8mgI3C0c6lC3MVsC
         EG9xUQg6/bayLbmkMAow6qpqApFJNrXqvq46eyx9mHr92B3YCuPcyDeVruf9oAk/vspi
         mpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371652; x=1786976452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qpPxa3udA+AHKNsx/j88F2vdXh4ZBb+1f0MLnfhs2YU=;
        b=MoxsWRXdGwLQXCQFm5jRj1F9LzaldC+ynfzbLBixpKZoZwKRjdpab3DOmkF3ECYTLf
         xLiNzk7sOxbwPM2TNJy7I30RftVqwat+HOtYKcYaORD87EsJEvAFBXO3foXfVzJ4yN2h
         b99LcBISfrOOD1VQfdwdmT0/DkJ6frFHv5Fe/WuN/nkLCMP8zkjA4/ktHZW6Dop5Jdyu
         ZcmwscPUWfltWKvtqWCX+e3IL5XfmIr6YOZcSa+4RRFvDh8o/hzcpA2GueQNsl7ux05p
         CLxfA/qHIb64VJTBXJsgkBhq45Ar6tIOj4cKStOc06s5OHTyp9XkhddoXR4ptNxVMM/o
         r//g==
X-Forwarded-Encrypted: i=1; AHgh+RroCUHegU3ig2Ocm3fPftQgt2PacHAmku7XNmlz6ZQJDO/6P2Jef663J8I5yjbVKNgInHpfSV4Uty+EefyNdgzM@lists.infradead.org
X-Gm-Message-State: AOJu0YzvMylHBXknJbJa4oEGx5Bv1SMfSXY8XHiKmw67/fB+CFMixzFT
	IYGmI2ZD8/nZTm6ydqHfFJOeLXb9ySSOKyrgyRghmtpHnswgTTx92WN3
X-Gm-Gg: AR+sD13g3r6Ta16fBSb04G2ec1UnndEBeY98u3m6G14RMKh5suxDyshLpd+12mj8aqa
	cJmnF4SwaWG+oK4FqRb6fScmmQWwIHcnhFv+YC8vYtpuyz6jVerx3+NVxKchtf4VfmlmVoU4dX6
	0bu7IeDJeUmtWLT2Rlb4Sl0P/632TWxrq8/38JoTW0w1s0pW8cA4FOm2SH7wkRBeR/A9aslpt9o
	Ox0vKgrr9yF+dCAYB1viAQ75kCs2Sm4ZCr7Go3t1OErMFiyB1V8mk7NqaZ2YZ90ui26SafA4W8Y
	Ne3D4seShWcwv/otJm/EsrwcbhjWh8O/ID6mRmNJBbRgrN+nliWZegBCtq8Z5Td1suLLLzaH7Xf
	MZgJS1faVnxFJj8KyhaoXPbpYkB2pCsbd8gQMDMsdewOm6UKqNRVJZjZ/jUKgP74WZg2cSzeph7
	vrcX+LYuxYySilgCY3rBwTpLCmIfRgC+YlRXx1vPiE5PvejLtKsJwrcTw9spBbopW/xAE=
X-Received: by 2002:a05:600c:a44:b0:497:fecd:5b00 with SMTP id 5b1f17b1804b1-4997279412bmr26841325e9.9.1786371651877;
        Mon, 10 Aug 2026 07:20:51 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995919df87sm354413055e9.6.2026.08.10.07.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:20:51 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] dt-bindings: arm: fsl: add the Colibri VF50 and VF61 on Iris
Date: Mon, 10 Aug 2026 16:20:46 +0200
Message-ID: <20260810142047.2811230-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810142047.2811230-1-mehmet.fide@gmail.com>
References: <20260810140053.2793495-1-mehmet.fide@gmail.com>
 <20260810142047.2811230-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_072053_845145_63D41819 
X-CRM114-Status: UNSURE (   9.94  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The Vybrid Colibri modules are documented on the evaluation board only.
Add the Iris carrier, as the i.MX Colibri modules already have it.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 8687631..d58343f 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1711,6 +1711,12 @@ properties:
           - const: toradex,vf500-colibri_vf50
           - const: fsl,vf500
 
+      - description: Toradex Colibri VF50 Module on Iris Carrier Board
+        items:
+          - const: toradex,vf500-colibri_vf50-on-iris
+          - const: toradex,vf500-colibri_vf50
+          - const: fsl,vf500
+
       - description: VF610 based Boards
         items:
           - enum:
@@ -1725,6 +1731,12 @@ properties:
           - const: toradex,vf610-colibri_vf61
           - const: fsl,vf610
 
+      - description: Toradex Colibri VF61 Module on Iris Carrier Board
+        items:
+          - const: toradex,vf610-colibri_vf61-on-iris
+          - const: toradex,vf610-colibri_vf61
+          - const: fsl,vf610
+
       - description: ZII's VF610 based Boards
         items:
           - enum:
-- 
2.54.0


