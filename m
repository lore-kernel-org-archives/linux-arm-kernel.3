Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16667C44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 10:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=reAbcqldKsv6m4zky3LvSNbWtVKFu22JGjwdfklQwuY=; b=WyXWzLeaUw1Ji8zFDdhby+sZKY
	8k+L6bAhZtxKCqpLtHxzuMj2ux8WQzJt7/dlyHiYOsa06bz9Ko640yACupYkSMDeVzaItrs/OaNSs
	qiGHMevl+JRULo8fd7e8YfOqDhrdtHzZM+4GKtiSj8GS96NoZLZE6W6ofb0kcAJMYpq06IFrij6C1
	zYp+b3/6sr0ZtCMqoQIKh/zMmPxZmiZ56Tmm16yqvsu5el9Jkkg4t1HKXq6ly8/gPo2S/3bz2HYdL
	TWjXVsnhjmss9pIF0nm0+nudwwNHIe7M+IW8Ar/c5EX8WHCoOzptGZ2Dw86GE3kGKB7vheZ/ueVDp
	Rmf5XClQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfpG-00000001yCz-28tc;
	Fri, 17 Jul 2026 10:29:50 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfpE-00000001yAX-1oUB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 10:29:49 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4759b4f0897so2397751f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 03:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784284187; x=1784888987; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=reAbcqldKsv6m4zky3LvSNbWtVKFu22JGjwdfklQwuY=;
        b=RoGqxvhD06Y6puBw7yEOdKrE1iUeJm8Zhn5FMI/1Hy8L6MW2dCxKMOXyF+BCsfprCL
         NqS9qo22pmtd19gIWHowm+Hv+u/Lmu9U4Crvi1nWEHBANUM/pX4If9ct8w6q1Ot56Oak
         bYZrx5ZYZxQfm9e+kKyvcVUtHxcj8rDnlWV8GInZnqCHHj9TeJJaqSWOXfxK9UCvtGHt
         k6iCIMncZLp7HQWyMNeNs53VWj35c3xccPwxZepLz46EEoGo7FmnBpvrnyYs5rVFGrga
         rbgSW8f7U8NIeuxWk0Ta7XaXb8a3UoaaS7wB+V/THR+fXUgedTFYPOZJYEEoHZOItXPZ
         bGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784284187; x=1784888987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=reAbcqldKsv6m4zky3LvSNbWtVKFu22JGjwdfklQwuY=;
        b=A1s2+SVR0rIQJi6mGTGCmLXMVrI6P/kuuyUizg7sLl9jtNfWmHKblvJJpVWkkzcqhO
         WYgh2H3TZcJqM8bNjk3TXwLAaSFgrXEiJQv9TEe0IzmCKtSHP19Jloe0+Dnvn5lMYGWJ
         tG+lrfNOpCfq5GnqtDhbrdnTcQPPeMvmoe7WH4vP7x4v64aFNbo5XsUzUrGX0cTewIt3
         wnMAFvMTKXoS5cqyk/0xJrjM+HQMYcFSSdyoas1q/J870EevEZDGdwTpQQGJL3E1rOs0
         PCc+sMRJ3a+wA2wLDvymYCSCxP0qRC++diJGeM/4TGdkU35yIW1JnWZKTI+/M8Q+Qtdz
         U/bg==
X-Forwarded-Encrypted: i=1; AHgh+Rq9jK7JDKoac2FYMqeBvIlQzYVbY3z8JGE46y9lurkqH31dgHiT53dK8U9nRNwuHWASHLSjArSOSyTYDgx4DgfU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9d91hKB/OSUEzjKh7IX0ZMDGIQr9nw6mfS9JamO+EAZcCwdi6
	fCo6FzYXOMnSet4L+DCJFwGkEMwkF0amDt5BZchQwKrspHQpZpfHSgpO
X-Gm-Gg: AfdE7clATLAuLQdAXLQINU2jlvay00kgF3f0gwdZPGiDhe7ZPGF5sqOMNiB6hKDadQd
	QcvSJA90wbD37H9vHkoiqyeoEJMRQYwAoTcw8vTAB+K844cfaNg7LjNGE9SoNpfKSpmMe23gXqr
	8OebKBCSj+n7bJ7vhWMUV8GuiNpZw1Nk1NMRZHcYxUMz6WOAG1D6BhTJQZdqtFtmwcUQGHSUt34
	ALjw0qNmXkHhQS4PXtCS3bftgRGbMweV3Jh1iM8b6u/5GWGcgmohau5MUckqXOWQVNVddMDNeGG
	PzmECIMGPei0gGohAzYmOd2KKXn4x5/areyXMjMrsj70TIfFOuln2/GTSgSxlKArYRTCFCHp1ge
	R34mNhTj+WdM7dUV7D7LYFWpNSNqoY2dtdLZaVW7RukbEcvo+XZ3nFTDoZE5O3vHK5gLaGA9Dwy
	x29bOimwXZSh6W54b8abZh7/wasGE3ZHgYfGbGpHRndqu4MS1y8cyUKCHL+44kYotm5CR9KQzsN
	L2faLm8sMyGs38=
X-Received: by 2002:a05:600c:6a8a:b0:493:e46a:ab with SMTP id 5b1f17b1804b1-4954c9a0684mr6578525e9.34.1784284186204;
        Fri, 17 Jul 2026 03:29:46 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3f07esm39931735e9.6.2026.07.17.03.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 03:29:45 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
Date: Fri, 17 Jul 2026 12:29:37 +0200
Message-ID: <488d2b31400d2814b8c7d61fafd02a7af5ffe443.1784284092.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784284092.git.stefano.r@variscite.com>
References: <cover.1784284092.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_032948_503795_60E8463A 
X-CRM114-Status: UNSURE (   8.12  )
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

Add DT compatible strings for Variscite VAR-SOM-MX8 QuadMax SoM and
Variscite Symphony development carrier Board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v5->v6:
 - 

v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 7b57a6ee1b50..52f08bc1f8ea 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1393,6 +1393,12 @@ properties:
               - fsl,imx8qm-mek-revd      # i.MX8QM MEK Rev D Board
           - const: fsl,imx8qm
 
+      - description: i.MX8QM Variscite VAR-SOM-MX8 based Boards
+        items:
+          - const: variscite,var-som-imx8qm-symphony
+          - const: variscite,var-som-imx8qm
+          - const: fsl,imx8qm
+
       - description: i.MX8QM Boards with Toradex Apalis iMX8 Modules
         items:
           - enum:
-- 
2.47.3


