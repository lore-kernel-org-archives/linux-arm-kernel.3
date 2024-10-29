Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966BFD3A697
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 19:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Go75F5WGin7Ix/MZ1KEJuNCfk0dx2TFxpmOXy5zXdWs=; b=umZZzx2SYOxhCnbyExeK3q9agC
	G0gLty5l8XNMqJjEGQDIfjQ3Wj5yfhoO9cJwsB5fUHDVcTBbB68Qf+qp10EbXZlZUF0SpGQQSgRvz
	thWujJARMo/U/WvRVk1KLtxVgYQWJbxvT2tZdDtBsbKd9rPD6otWIBKftqQud/InRxyCRkdTD1dsc
	iaS3g65U39ALeGf+rZoYIpbh24zfuXbc95hkzddSOj+DO+tt0ZU+2nk0oLtXpaYlcMprQ9s5jJ4gq
	HIcqJfzYCap0yH4IEXLj93mHo3xg8DEW0Q12pNiK77EX/KUpzsJmXCN6q1ucae0fYBcxlkf+BtXJe
	53+xITew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rlC-0000000Fe6m-086y;
	Tue, 29 Oct 2024 19:20:10 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ri0-0000000FdeE-2qRl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 19:16:53 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7db54269325so4358476a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 12:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730229411; x=1730834211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Go75F5WGin7Ix/MZ1KEJuNCfk0dx2TFxpmOXy5zXdWs=;
        b=MfEB2lVcxxRhSJn7TiKx08lvhnheE11gKf/lQkyupOY7HI/PgZyJs0YZGV4ZgVB23m
         04dPCtyU045A8rZjNhgLGFmzsr+V9bOjxvUmAbS1rfE3CHiU0DvFn602PZ3ihJ3ovI9Z
         eGK2/1Tg8N4oZtVsr8nsnTT/HkEIjJuziRYLq97shlPiTaAkQPi5VIpggDnmJO/24TfX
         BF12EjZ1+ejF5ZReaUAZw4OBtpDgYjKyCaJw5oNPaE6tjUfrIjoSTLZwf/VS4zUOpUlm
         ZRFRHQm7u0oPjWyX4RXVGP+Kn4yfumuou1r0iTjc8vhmAxtzVAOXOTio6WCu3tvHyveb
         UFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730229411; x=1730834211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Go75F5WGin7Ix/MZ1KEJuNCfk0dx2TFxpmOXy5zXdWs=;
        b=lZrKqy7J9eHcxK3wuETIPvCSGhPlJZHs9HZn9VOnJYpobg4Dyx6fxN3oaX8N3AOVpu
         /09AfZIPc4RwjvAyy7Ny8ZyXvMahhSbOO5Twf66VFN5ZPzh+b/S6JmQbJy4jyFMa4IoY
         cRamYXJLIghamh0TmQhaKSFyEophG0muhDe8QxQJjzvliotoKULgfng/EA/aatSlV0B5
         uSbPNTeIvzcYCZkIL/bgGSXYKMMiCyviX+mcHeQxB5mz20EFADzO3JczA2q5yCkvgL8P
         +wGw9xZ6z/Te38PjhfrrBnuw+MWwLMINRjb7CZcYhteTxNMVtFhTYt4uxtblETLUdgm8
         ZLyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNe0Pzw72qQqVmusmzumwnYmvzhBohr0ve3ZZeFxfuoP+hbGweYXYE/cKdsD5dY3fzhbiw1SEqs/3WhFEdiV6Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc2hhgUyPokvjuN9JVdY9SPIGjFP9TzEOtf5518WvISBpCgmCE
	q+WZwVKq47bQBe6fSe+jTNf+sQM/8Em0CPeu5wXnuUFlR0ymVlHW
X-Google-Smtp-Source: AGHT+IFenngeaT6t8iIEBhKoMZoPByKBmWfPEehMYTOwuzAHWbQ1Z6ZF1XwcmALtKo2mLUrDVAj/Zw==
X-Received: by 2002:a05:6a21:3a41:b0:1d9:237a:2d56 with SMTP id adf61e73a8af0-1d9a8512cedmr15070567637.48.1730229411268;
        Tue, 29 Oct 2024 12:16:51 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:190a:1425:254d:1e7a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8661061sm7842346a12.17.2024.10.29.12.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:16:50 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: marex@denx.de,
	a.fatoum@pengutronix.de,
	andreas@kemnade.info,
	kernel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v3 2/3] dt-bindings: lcdif: Expand the imx6sl/imx6sll fallbacks
Date: Tue, 29 Oct 2024 16:16:39 -0300
Message-Id: <20241029191640.379315-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029191640.379315-1-festevam@gmail.com>
References: <20241029191640.379315-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_121652_746701_5BCC2D25 
X-CRM114-Status: GOOD (  10.88  )
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

From: Fabio Estevam <festevam@denx.de>

mx6sl.dtsi and imx6sll.dtsi have the following lcdif entries:

compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";

This causes dt-schema warnings as the current binding only
allow 'fsl,imx6sx-lcdif' as fallback.

['fsl,imx6sl-lcdif', 'fsl,imx28-lcdif'] is too long
['fsl,imx6sll-lcdif', 'fsl,imx28-lcdif'] is too long

The imx6sx-lcdif programming model has more advanced features, such
as overlay plane and the CRC32 support than the imx28-lcdif IP.

Expand the imx6sl/imx6sll lcdif fallbacks to accept a less specific
fsl,imx28-lcdif fallback:

compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";

This helps keeping DT compatibility as well as using the more advanced
lcdif features found on imx6sl and imx6sll.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v2:
- Make the three compatible entres the only valid combination
for imx6sl and imx6sll (Andreas).

 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index ad0cca562463..72e509bc975b 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -23,14 +23,18 @@ properties:
           - fsl,imx93-lcdif
       - items:
           - enum:
-              - fsl,imx6sl-lcdif
-              - fsl,imx6sll-lcdif
               - fsl,imx6ul-lcdif
               - fsl,imx7d-lcdif
               - fsl,imx8mm-lcdif
               - fsl,imx8mn-lcdif
               - fsl,imx8mq-lcdif
           - const: fsl,imx6sx-lcdif
+      - items:
+          - enum:
+              - fsl,imx6sl-lcdif
+              - fsl,imx6sll-lcdif
+          - const: fsl,imx6sx-lcdif
+          - const: fsl,imx28-lcdif
       - items:
           - enum:
               - fsl,imx6sx-lcdif
-- 
2.34.1


