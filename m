Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C7DC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 12:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYGTfM8APe75/Y5PRGWDLVx1kvx8Ac5mDcbwdwxZe50=; b=4JNzQFOK6l3v41TaXyt3xupCZR
	NyCLqeAGcGoPaMVAv4rxQSHrOJmGMIx716DzdUi6vRtzCmmE+kgkqWN6Fey/CjXNF2PLN/h2zLz9a
	19dcX5IW3Kkwz4ZM1mggJPbs0s/QheFMpT128HMmKtl/0HR5ttHDGAPMmqYyYr2o0TMFpqCOTrPxh
	q0HxW+d5ZQDI9n3osTPwYCLGV5muBcEKJbYJA0oPBepgZLHOgREwz5U+Dc9qeHQOXhkemvf1Tr1FB
	WOfu2h8uerYzJy+cQXifq3a+RdYGPXiQKmaEM8YpHYYyL0pcTf6BM0P01wedhbT5y14qQeBzREb+2
	vHRYefZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wypzn-00000000jYH-0g7t;
	Tue, 25 Aug 2026 12:11:15 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wypzk-00000000jWt-0QLr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 12:11:13 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so6535162a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 05:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787659870; x=1788264670; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sYGTfM8APe75/Y5PRGWDLVx1kvx8Ac5mDcbwdwxZe50=;
        b=HWGp37DzZeWGHHzhzRGR/2TpO15PWoq4PdwdWUo6rAuIUHoP+/EjnepUyhGMMN/0yo
         oEI7SVYlqYnPVQILIXAeeZjkQtJ6bFjZ+NxYgd8JIMMcuvk0TGwm/9i3D2odPDzjcIKe
         brKOA3qlJ0SUV49rB7q6LLAxSQpsK5LdHTEhCoBkq5vriN/WnbbQ2xMzMyUdYzDX2fyt
         mz7nMThwWXaryuDWn9lNQ3IFuSAwLd1cu1u/oGSoAspSC5WPRelfmGLsnXFFEabiDLVC
         5Ae4emC9jiunRb+va4uUlzpWjZvp7oFydkCcp/bDkALdZ/55e4b6B8ALGU4tRI/rCMqs
         MbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787659870; x=1788264670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sYGTfM8APe75/Y5PRGWDLVx1kvx8Ac5mDcbwdwxZe50=;
        b=V8LUf1VRIgv/+l4bQOdNEcxIJVDzi2oSJkQUatWv5zlkz94RHCLZAwljeWmaq+Q23t
         9U90raIaUvtixq57ikBDabC3wGMtxNUu7z++Y7IBhqrUWv9ThM7e3nlhEEkxrUHDj1gB
         jiBr3JWd+Wq+mJ28BzKQ6fE8FTnTKpZi/HlC85qDLxEF4EuLba3tTGd1ytgP3C+NeGbs
         iwFfZE0HNlYl/r8KebzwEAL+WR45/wX1/ZnF5AgpoyOI0mxnJCZSOnln3HuzhzVYupWw
         1ZUhv4IDpQourxnjxtf8GTh9NerAfZ3Z9oE/DQK9U8vwwJIFmYtqxzTPQzHZb2ETj3RQ
         9r5Q==
X-Forwarded-Encrypted: i=1; AHgh+RoJQrMfCRSivdDk7PnUJyO4Zio4VS3u92H0FybrkRMEOKc5erR1pGi6z+LYjcaCPJRUqQ9BHeGCnZsGf0AtK7Xz@lists.infradead.org
X-Gm-Message-State: AFuF++nCnOoOXBF9lo9oy0n9iHjWh75t/yymzBSeGCbuuNnDuxMByO5h
	41YbTyAnPsTVbuMdqgYf1IWcZe5VAEQ81wQCyOkYJBxYr/pZ2OAa07Ox
X-Gm-Gg: AR+sD13exVqeT/CRVeIMABqUuf/DE4UalwdolfNeQ15Hk+vtCGL0OgUVqEEp+Whc6Xe
	TJBKakxYRDSsyDMD84PwBKheJDiJdF+Nxp0yyLhbg8xg1xyRsjbREdDKPbg61gO2YwFoQXmlho5
	qbQ55jWFGDPAEFb3Bty7C+FPnCVjZBAD5SucI2KJsOSwLFifwFtH6oH6bNtU7FSNQInvlFxRLxn
	MgByJXs/Ou6OG0QEXkce03nlw7Fyl3Gjdrln0oq/P4o91Sy1bLaXDElj4WSzYDx3ahin5mocp/x
	8/mQvguEqVf7k3tRcU0CyiHh0zWQMdpeC9QCZ6aE2CtD9tDKDY1vem4V9xPQwMh9iwXUHQA2Aqf
	E8HLI/s/Q3L8+6cu1O6yVywtB4/EQUPsdZw5UW3+tnxMIzViIVmPMpB6LDeUFgN3MTmqGhyNpgj
	a4V7f4ZsuKogzQuf3OXo3X79GfwUb2UuSGg0enfklgr5Xw4UzLMKNDKmbLVNz9HjKKkpOzJCOta
	rZk0FZgj0DLLTE=
X-Received: by 2002:a05:6402:5d2:b0:69a:b38d:403c with SMTP id 4fb4d7f45d1cf-6a42f18f10amr41660140a12.7.1787659869893;
        Tue, 25 Aug 2026 05:11:09 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e199767sm13841351a12.15.2026.08.25.05.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 05:11:08 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: arm: fsl: add MR-NAVQ95 board
Date: Tue, 25 Aug 2026 05:08:11 -0700
Message-ID: <20260825120812.2152-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825120812.2152-1-laurentiumihalcea111@gmail.com>
References: <20260825120812.2152-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_051112_148492_2AEBCFFA 
X-CRM114-Status: GOOD (  10.26  )
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

Add DT compatible string for the MR-NAVQ95 board.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..5d9da745b715 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1535,6 +1535,7 @@ properties:
               - fsl,imx95-15x15-frdm      # i.MX95 15x15 FRDM Board
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
               - fsl,imx95-19x19-frdm-pro  # i.MX95 19x19 FRDM PRO Board
+              - fsl,imx95-navq            # MR-NAVQ95 board
               - toradex,verdin-imx95-19x19-evk  # i.MX95 Verdin Evaluation Kit (EVK)
           - const: fsl,imx95
 
-- 
2.53.0


