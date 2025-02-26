Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53724C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 17:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YtGcm5ZWKNh3uJM/zqclGCkk9N3iqiYtET6+2Cl2Q+U=; b=2RIC0sGU26e2kGYY4XdD1rbXRJ
	eUua+NwA/J3FwJ2/wnhfLiCDE9STd1tMmr80jHnM7enQqZElFUCY2bSy0EDvzsrxLyJulus+BfzE6
	BpMDbOu3z7PZQoDeeiogs0PDHwyAt+OFiVFUKWeBITJ6go7QYLJreq+5gwdmqYVlSRdDHzUCABjB7
	NuYwzzUNFl4dVQkCCS7xgLPsI+szQKkOgYd+v1jFKKgWIF51Ul9ijfw9Fj+Ec5wN//XEeTbrvgRC1
	+YoUrML3Avx03gOXuD0gtOipYVokkcr/1/FI79u7XHl+qihuFQLapA5fMR2LweOq+mWLlNwNfpkV2
	q7vqMGNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKqa-00000004dUB-1lM9;
	Wed, 26 Feb 2025 17:05:24 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKfy-00000004bID-1nBy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 16:54:27 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4394a823036so549875e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 08:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740588865; x=1741193665; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YtGcm5ZWKNh3uJM/zqclGCkk9N3iqiYtET6+2Cl2Q+U=;
        b=feUdypmlGLPCyBCDtqxRCUlsepleFBZ2KGImD3/dUyVNCorYgoxMtv/maNltI+Fbth
         pzlLcrpKSZ98etyUJzN9wCECQ4kz9TmqmOsma2hGSJ2y4Q2GE9EEB8dsSvdfCN89Wk01
         pUCQtjpBtiWo3ZWMizikfFuf6Ia0cTtlN8Kpbz0Xc5w8zLw5Z7tzg4CYqFldpjT5HYAr
         DMWaRnke1ndE83tGAU+1K/0+1rkCc58SVUMGRGElIEBh1hNRieiWua4NpBltwugH7+t4
         7tXNxOcRg3D3jKpBM+peNvFk6T0GVj/30HJko+NC0IBA4KM0OnY5LcYMM0rwrXo/9V/G
         Tpow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740588865; x=1741193665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YtGcm5ZWKNh3uJM/zqclGCkk9N3iqiYtET6+2Cl2Q+U=;
        b=BU/IobNZDSJ84asLy03PnyfoA9b63LAzb/7B/Pc0XlgvwD2UlUmVx80MKsyEQ150bi
         MRTHYMN8qUlPtwhc6uH/jFVfwIE0xxV2aFkzvq6cBmS9m6CL6multwoCOG/mi/APRPqL
         Aiewm2I5ws9UQoVske1EASOijpJudM3vjUwKPGD+HYnkDSf1Ha0kNE5h7AT99cRdVx0N
         rShZjDMw+BxJQ3Laf5I0dh9IYeBbFQeJsyyHB4fCo3ZkKqbPCK03bgKIuZaMt4oF37LA
         XtbUjkyCH8HWmVjkWRQAkFgDHOGdz0AYQ/8hFGjI5+goGQV7wpSOJrXrcuYBv1FzIj5p
         1pmg==
X-Forwarded-Encrypted: i=1; AJvYcCWYyEq4X/u7xID8PBQse5+l6RhOAooz/mgRvx5+Ufv3AUDZspwLZfZ80bedERwnD4ETstllDxBztrocBq1dqEy+@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1gO9K6fRzXg/aQw93pKoLqcEiw/7diBLVufICm1fnDmkdKGEF
	HoWFOX6mIwX8v9L2RMc+qxHw+AYjXnwsXTfKRji9c+DFq1RDXYcU
X-Gm-Gg: ASbGnct72eTkB13IIDS8HSB6mbrMLbFDYSBtAnHXE3snjdjwaRHI//C5NYQ8d3pfsI6
	Zi2As5sa5fu8H1MCV7FFCQ35lEAobVLV2Rx+Or89BIU5TudSPmKz67+PpkyYhhP5Og5WxE3WZFv
	qForxUoQXi4+k6JwogotuH5LxZxYvUk++TEJDaC7w3cg0cpJLEuIwjoQLWM/8PTDXlOM6/wjcbX
	pPFyIpvNqax33053F6/epg52/+43EbsyR/+dkZ/4nKKpvGSsqMzmiefIB6Ynxwae0W8rEQrUH3f
	ZIkESVEtr7h4akRCYLAJovZK5HbtI3zm2EjJgamGmw2aLoSR5mz30xum2JEFosw2
X-Google-Smtp-Source: AGHT+IEr7k3hpbUucx2jKL4FfCjfgt288+HwWr+usBZ9kHZQ7fGw05QKWSeEYQ0zCCodSQZ6AYFIxA==
X-Received: by 2002:a05:600c:458d:b0:439:99e6:2ab with SMTP id 5b1f17b1804b1-439aebcfd58mr175600195e9.28.1740588864704;
        Wed, 26 Feb 2025 08:54:24 -0800 (PST)
Received: from playground.localdomain ([188.25.208.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba587163sm27672515e9.36.2025.02.26.08.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:54:24 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
Date: Wed, 26 Feb 2025 11:53:11 -0500
Message-Id: <20250226165314.34205-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226165314.34205-1-laurentiumihalcea111@gmail.com>
References: <20250226165314.34205-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_085426_463475_DDBDB868 
X-CRM114-Status: GOOD (  10.44  )
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

Some DSP instances may have their access to certain peripherals
conditioned by a bus access controller such as the one from the
AIPSTZ bridge.

Add the optional 'access-controllers' property, which may be used
in such cases.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
index ab93ffd3d2e5..869df7fcece0 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -82,6 +82,9 @@ properties:
     description:
       Phandle to syscon block which provide access for processor enablement
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.34.1


