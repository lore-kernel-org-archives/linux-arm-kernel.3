Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341BCCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 20:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Em+DHux8TygVduIPIQfg6MjS0noelHiEnVwLPezX/Nk=; b=R7P5U/3Vb/7yBmLulHiEMofert
	XDixg9OCtzbXGDuCjN3tt3mIhfLqGkf+ImPoAmcgvJIkRRsedH/fdVoArOWYYqJq1/0gt6XNddnWN
	/78HlBxT0m+k7BsASn7UqbOx4BIH8VNTe3vG9/f6tvGTgDeVpqJDd4DOTclKSB8R4+VWde+DE+AKF
	qwkMiX2RiELrXR2dqXHA8xfO6RiIUW5oR8tDIvNwJB+wXk2wJFlhWEJsEIfz93Eq8NfiTQxlRWFED
	3A17c/7Sl3cTMv2D3cua0WDiSq5o7JzWLpzGlohMuJOUZLHU+iyPLpib0wedMkZB56WK9MTxvBi2+
	N1k0yjkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDpIT-0000000H885-2GZ5;
	Mon, 05 Oct 2026 20:28:29 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDpIR-0000000H85L-1knX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 20:28:28 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6acb57c2b88so3064611a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 13:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232105; x=1791836905; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Em+DHux8TygVduIPIQfg6MjS0noelHiEnVwLPezX/Nk=;
        b=Sab8L9PfEsj6oSDfr89gfCOziLsx6yEvJ5qSWwDkayVdYkKozftTJXdizp9CwrJ+vN
         jXewQDxoyeGBI9JO042hp4Tf91W38TJAjAVWukPdMtWfB+jthfjWa79HFxVzCqZ9l+yV
         FXi18sx04K2XotW8fjfmElnGM1IrsFKdfbAmhurfRbtWRM6C1dRzvdilbSofRUPT+Tjx
         iws18p1nuj5fBug6MAm69ruJnjJLUyZBcRklNTakk1n3GB23wL1xeVPUkAssjGZGeiTh
         JxgZjGJv0lRhYXUQOPTE531ni0HhTfKGbNzsO2p2/IsVKVtJZs1Ib3W2UCG5jCZ1xdGb
         LNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232105; x=1791836905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Em+DHux8TygVduIPIQfg6MjS0noelHiEnVwLPezX/Nk=;
        b=QzTMCFQ5kf00S5IY1lFgWcU5pi95W+f9l0iTR+P6Rn6WiZIpGckjldXRVvHlvJjD/x
         eFE2xIYL40AUEHsijcK/Lbk44zyXQuip3mZ4bPrwcoFQR9XW+fnZU27HwVPflhPaYMVG
         0jMSWGpCUHdtxmjTVibvEvN+rMouixn6SmR6AZp5FGxgcV68fPUAn5CqAUDmxG3/T7w3
         KF4sOyjMLjyqBFwD8nc9ZlCh5B1BlRdxuzyB9ZlxmiyTUvcrNt66g21dQmFr1F+9GVMp
         1vc56hx14sVdzaqOWMWcWpY5wqkYlxMrdSYsOqvjei7Cv8bCJbI3RJXBaxm3yxFJ8EMP
         G23A==
X-Forwarded-Encrypted: i=1; AKwUvBxHIuaRdE2SXcW1yUFs2lIbEAvYnvlgcwpDR/ieHFLLwpDO+9eHC8YSqaT09Bt4snBw4k+UFhXnQF5asjD1BumX@lists.infradead.org
X-Gm-Message-State: AFq9FYIacZK5QROyaqZw+TCSlUkiCNuCWpl+CjsM2VcTCtMZ4e1J5o4m
	n0B1jpq9JV4lutkOS21/Uod6Oe/YkCOszeEVnRLbHrmLSVF0uAD4WWVQ
X-Gm-Gg: AYBFou21KpbqeYepK6dz2exAQVApzO6Tqpq36drQ7eZu6hHyMgseJSr370q/VamzuGS
	k/9dZFC/7NOh+A3AGDbQYnxvMb4UTIQl7JA+dbButy6tzjxAh7oS0d+X+t+3Kp1deoA5PtLlkZS
	Fz3MzlY6myllfsQJvsnjhNzD6w+iOlkPT+vvIJl3UEgprby2YQeTpHh5FpfRWCH960u2GLFDGQj
	j4LVK0EugT4TjW7iwFTr7OrqJhVpk7g+MmBnsukc3c31nWYdJ4WNkNUadotUgYxJbbNxVNT7DgP
	91bpD/SvObbZKl+1u3eZ/HgqBZeunZ44gN3wFOQL8ifoWWwn0gz+28pxhBLynXEbXleYJOTFNET
	C27f1PDXqWVpUd4dOMp4k+46PTNhJd00SEF/L1ldXeuxgghrYyLJPINFbdiK2P7d2kIsxdfQfHL
	nw0vZ1AJw2eCoeg+421MlmXPmW2KALLH8p9t4gFLTfwt+mN6EufAgrh5wQIL1wQo0emLMhXN7c/
	IaW33MIFP+EkLNscISw/7axb3RDct6z
X-Received: by 2002:a05:6402:4021:b0:6ac:aec6:a3b9 with SMTP id 4fb4d7f45d1cf-6afad90627bmr7128320a12.24.1791232105212;
        Mon, 05 Oct 2026 13:28:25 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:28:23 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 08/11] dt-bindings: interrupt-controller: add Allwinner B288 NMI
Date: Mon,  5 Oct 2026 21:27:28 +0100
Message-ID: <20261005202731.153971-9-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005202731.153971-1-pmazzini@gmail.com>
References: <20261005202731.153971-1-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_132827_500284_96E9706F 
X-CRM114-Status: UNSURE (   9.98  )
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

Same register layout as the sun9i-a80 NMI, like the V3s.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
2.52.0


