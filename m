Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B523CA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 13:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kU0EiRV6t65KITcFfTc2U3VqjgSJJWwOkUyPrJsR+2o=; b=lo4C23PqpoKdRRbddAu6jaEkWQ
	uUrBkCeDJllA+d/mynREaJZ/c5p2fsug4UnlJCef+iWTkmMgoYlosb8txbzLGg/MDmvIAgbv2btf7
	0YLweigzU+yuQOuh5WM5RtTAVdHc6dPqrQZHe18nbX7lhIPkmGov28+nB8ydba1UsCDBKBBC2j1xS
	IakVud5zg0O9IjftYfgct7sVf7b4/w7gjUjPLZVswelWwZ8Fo/kiJW66penJ5JPDdToKYgkh1wYDW
	RDIfubB+lKG5mzEqI1NNR7jU46jY1J3i1g6B84EgOA7GRLSn30xF/XgUC9G98kcaoAItmVYL8G3gl
	zMPPxzQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWh2-000000083Qn-2gwM;
	Sat, 10 Oct 2026 13:00:52 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWgr-000000083Fm-1FHV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 13:00:42 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso4059635e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 06:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637239; x=1792242039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kU0EiRV6t65KITcFfTc2U3VqjgSJJWwOkUyPrJsR+2o=;
        b=ES4CLya75vq927FuSwGQqcXxCIdAryDaQ2vKlufBJ0+OIZjdZPO6C1vIwsGtnZ78xj
         e8vMuINAj5wptYQMXDkk++wl13m9qX09jRqDtCEJsOvHxBcrP+sm9LfkxMKNiB8DeEG+
         QYmFZAYKGbUM0MkyQxA4rXzumuDQ0H9mUOqXPba5tA1/mh4Y87fV+NEhGvh8fb2teMH0
         Y+B1j/NB3xvzwfBV3F3HxLTCGkJvRUNNxlPvXfUi2UEGJNzMqH/bxAWt/685I3zhmc8r
         KXB95am86JBerBV2pDACeLRP+LVeo20TiLK6iZt10+hzJWLyOqa1A4hXtsXfGELDXC0y
         Dc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637239; x=1792242039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kU0EiRV6t65KITcFfTc2U3VqjgSJJWwOkUyPrJsR+2o=;
        b=ZbVieo6bsv7haFU04XPQyHo0kOwg6lPKvrcNhQzFHIMgK65Gt3/7vbOmyv5AoozTRF
         CHFf97ZvAGZ/H8B/vV8BwKnd5o+JKF9d7teaobQCH2XgKT7oY8wsH8xRKCA0cFFX4xq1
         DEt2W2V9yxwTmP1JEol1n9Bpsh9j6LbqEvKcRyvAr5Tn47tCcpaRu0IUFdOMFTgInwJZ
         cyA5hSUNhJgoW5v+RQ+IfO0+6cCdf8y50/xx19kHwmW5ulPnc7Di6eckfEQarCl1/GAW
         cs5KAWmVeKMcP5VuTfJZrX0jqxz2eMXMkApmtGGNormQ6UtJAwb8o93YMw2LX/TxiBkO
         uX2w==
X-Gm-Message-State: AFq9FYJp4XAlwAnDOiB49+D+fAsUlhx2BGlz9da5+hsHpQJZ8uqve1IY
	VLT6LHw3bRtIprdagHQSb/EItuZiELCshfDEf7ss9M3s4w7rxn8CoZ20NhtRUXZ+YJ1BFA==
X-Gm-Gg: AYBFou0C3YAKp+ziq2OzLs/ZlhD7gc5hWtxB7niF9wzBC6gYVK/jUwt+et8nfeJ4zb9
	4yOsvcwJ9fqj6i62WVrprZCY5h+PI7xABdlkphuzmzHuq6vb4s8+dMSyKD7ZLCfB/MaED9IbUpK
	bXZrivwxDR2nkXG+eU0ZPE4mn0xPbnSPvdVFPhhLXWu/ighQEyAvnB5o1f3HsdT8bxCyFvM4GUa
	pqY0E9qD5Gsz8t2t1+5S+Csauabca3+SHsFrwwvvclO62aj5+XqE+A4GOuyyMKCx3OdnmbY2paa
	VqBngkwur1Bm4MgyF2tgu1QLKECj0pq/q+D/TxqlOpMMcSYBZbff3Z1sHeorshk7ukk4WIa884F
	4pM4sAia6wslFanDr4orti6hjuMXW3L4tcqTwGvZQ4gbRIRSJgqfUz5BvE0NNJz3v8UITgl5oYk
	Xtgk4fJ6PTWw2SuD5IFmNv5rqI6jtlJefgyAgdmBSxXiQUSb3LLysmJ496A1VzdQkUvQ29OnWBp
	FdjQj27jKxzNxN8IBJ3wt9oPwq57CNcs9Ge9s6rwdy5W+7tF1l4ctqRdwHkPoIhRXm5GpYBmSPR
	940p5T2JNV+IDx/91t75eKWrajzKQp0Rthv5/T5StmxcVzRb2BjnhJGYDJSh6Q==
X-Received: by 2002:a05:600c:8117:b0:4a1:6d21:93c1 with SMTP id 5b1f17b1804b1-4a18e4b1613mr85591995e9.16.1791637239431;
        Sat, 10 Oct 2026 06:00:39 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:38 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 10/24] dt-bindings: pinctrl: pinctrl-single: Add ZTE ZX279128S pin mux
Date: Sat, 10 Oct 2026 13:59:48 +0100
Message-ID: <20261010130024.177503-11-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_060041_375033_DD7253E5 
X-CRM114-Status: UNSURE (   9.63  )
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

Use pinctrl-single for the verified PCIe and external-PHY bit selections
without guessing the unverified field layout.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
index afe7329a1d..bd57b41f1e 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
@@ -33,6 +33,7 @@ properties:
               - ti,omap4-padconf
               - ti,omap5-padconf
               - ti,j7200-padconf
+              - zte,zx279128s-pinmux
           - const: pinctrl-single
       - items:
           - enum:
-- 
2.55.0


