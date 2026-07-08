Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7137DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 21:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p484GJHOgK3H42utBnZR7l0t297MFCifBS+3//lXji4=; b=XnT29XL+a+4/pA67L+tw54O/UK
	TW08Jdx9QIXPkcpnhaFGvl3x7llPQU0P4S4e53kjT0TCDda5JNuIexWLPvUPDiMQjrdWbNOuLJDsY
	/eYfnjfmIGVCwQbpPaIU0aeTZa7ltkTukYik3JJN4X2qmRYzeuzrKvVuA/nFEg1d5ierU8EHc4F5n
	A6pKldTVbO2cDdJi3FizgZSEQM+3B6X7KCcGHvy0SA7YQAoGY+hyJOwSp1OKNp9PylW7bhVADYm5r
	l3vtsgN/yX/RtNkzAt4BKB/E//hh9l/jAdecyb7WV6Xid0xPBNNf94CxHyST3ssfb8Hbv2QqCBSJ2
	B8wSqHxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whZfH-00000000Qgq-3VFI;
	Wed, 08 Jul 2026 21:18:43 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whZfC-00000000Qdj-2g3a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 21:18:39 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so9205435e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 14:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783545517; x=1784150317; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p484GJHOgK3H42utBnZR7l0t297MFCifBS+3//lXji4=;
        b=ZwNsjXFUCB0jIgbMhDnJ/DhZaiW8zh1I5g2Kp68fmbRJSBYxYzZ56glVPyiDSWexhe
         G6Uwsfg8pIu4eKGzCkhq7BTipZ/e96KZy5Ei4xSGp4aS+8AZ/pukkfA1fB0J5nVjS93I
         WTy/MRIpq8EUoXgRD5deEFuAZMVNjY+m4ZGfACpCenZU/aR9VEqQG1EvjyTeA8p4C4l0
         aEK1mZZ7qZZ6CGxdVWfJ1+hvzD28SZQctZOYh1X3V55glbNbST3YnLxCTup0Buzk0JXE
         OvOnbmzQZlnnmvs05kKWkmnpgYvr9qLLIeEoxgn94SnrurenPqzgXqnjr6pjCNI1Y22g
         DmUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783545517; x=1784150317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p484GJHOgK3H42utBnZR7l0t297MFCifBS+3//lXji4=;
        b=gUHYB05UWjCArijhXBNQYviJWuXQsI+6paERgqGQZ5+XjuIkv4UeRRuLbDDvWQ0XXX
         zWbMkUhejOGOdJx5xyG/fXNxI5Y+0DSGSepU1WUyqk93Xx2jDanLfkH2TmHCDXiAX0nW
         04KUf0E3HewEqjisiINnSip70qmcPjAi+DkJX5xeLmco/sM6J7af8BvHqg3DfaCTIMwc
         vwELLG123w/j8unBr4LXCIG0gaKtrIhETu2bwTfq7jHCFUW6pd4ml2ndCkUxK/agjH6T
         E97mL26b5/wcDzppYAtVnFfo0OpRz0TYYV7fTj4QnMk8k3e5ZWVrpFcoEB5SghCIaCl8
         SeWw==
X-Forwarded-Encrypted: i=1; AHgh+RqTmzhyihMTLYSbyNC3js9KWnT5/H5YXQVvchtxde6ixBROVSIKAjbCKSIVOrF5SI9YTHY4BM/zKgb9V3hCA2Ci@lists.infradead.org
X-Gm-Message-State: AOJu0YzywjX5TCGSMCRg0ohh1E2Tb56MitP4AXybvVDkgiEguiYmnJDU
	0VmUGX+LZiTz0Tr86wwesgdMgCzPgA0y2H/gettH5660Z/tyoN8HPxQy
X-Gm-Gg: AfdE7cmOn86ee4R/R8pMS01YfWgYhyH8V9RmQaVyoAjR63HBnEaWHlfKdd5NL7kBsfm
	jH304iQbFipn0zWp7nCGZxXHdzoWWyTisGeDQ4++oPLAFoXQ++lVul+9vFQxW+QNet0CeJLHH6c
	AEpjBZmE6X1WD5pUByLNXXWT8oRpX2KYpdkrDr3DSpTtS6mSs4zCvVGCnWF19bEBKiArnaA9AZX
	CM1Ig9duFZHYCNG5j6YDlodzOJCS1/LNXcQTGup+VqiL0t5rzgEoVm9kCVHDdt5JCwTUNAF7kGe
	Ib5lbMikNwpmySMvcEdR/8+0zFLAMhJE8Yl4yOSQu+5FvVLjT/SwB9SSvHEMhfZJ/s23rEUgzPl
	bmUgrkjnGW0ab3zG7QSPf2S0vAy/CkUUiNZUSYFNM53HcHN95AdHgPvEVYDz4aT1rAODCuFVYii
	B2iYldXYzsSLN+zYta3mi3NoxLQ0tcGxyj9tlgKJnnCW/k/+EEePPPeu8P2FQ4Q+IWea4NOKmNu
	NwTbliDHo/XNbKvozE0yP/SgcbVZlB2VqM6Mw==
X-Received: by 2002:a05:600c:4743:b0:493:bba7:e9f4 with SMTP id 5b1f17b1804b1-493e68c483fmr41955935e9.18.1783545516611;
        Wed, 08 Jul 2026 14:18:36 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.vodafonedsl.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a58853sm68494175e9.1.2026.07.08.14.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 14:18:36 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH v1 1/3] dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62
Date: Wed,  8 Jul 2026 23:18:25 +0200
Message-ID: <10775b12b801255546c9cdefdb153e421aedf910.1783545241.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783545241.git.stefano.r@variscite.com>
References: <cover.1783545241.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_141838_953101_82F5B8F4 
X-CRM114-Status: UNSURE (   9.81  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add devicetree bindings for Variscite VAR-SOM-AM62 System on Module
and its carrier boards.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 69b5441cbf1a..b9da6e62ab79 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -104,6 +104,12 @@ properties:
           - const: tq,am625-tqma6254
           - const: ti,am625
 
+      - description: K3 AM625 SoC Variscite SOM and Carrier Boards
+        items:
+          - const: variscite,var-som-am62-symphony
+          - const: variscite,var-som-am62
+          - const: ti,am625
+
       - description: K3 AM62P5 SoC Toradex Verdin Modules and Carrier Boards
         items:
           - enum:
-- 
2.47.3


