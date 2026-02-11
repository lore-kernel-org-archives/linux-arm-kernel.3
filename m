Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87557ECD6E5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 19:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=92SAHgAplCp4yQb9ApiGrHWDXrzlV3xmhRggcLV+hYY=; b=koabR+HgRNj0MbsEYMrCuqfhY/
	JblfO/KLOr1Ed075kYg6YknDtrBwOBxO4pIxLuj+XtaVNJty8UVb0PZgjfnXkoLBdJBW4dnJvH8ST
	t7DbIh6mJkcMkplgYLlZ8rBhcqX4Gp6DCNcvHLVglghQVBBrbmVnPTY6cMZdoY4fxXNXd4b2hG9Bc
	QayY3IY5W2xwnGOwT9PcWyyhixngkqZsHhq78x+YsuwS3+6Hg71YzzC8C7YpkWo3+7mnBUsoZ4q6M
	UIE8qG5v8Hi8MLvzmOQJuNE0XSSsLsQsdweCSdfcWAGvw85KucRVwKUCPML1897owKD+fWKGrBdxT
	56xvmCzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFXn-00000000xZd-4BSH;
	Wed, 11 Feb 2026 19:06:40 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFXj-00000000xTw-0goZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 19:06:34 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48068ed1eccso73291665e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 11:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770836789; x=1771441589; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92SAHgAplCp4yQb9ApiGrHWDXrzlV3xmhRggcLV+hYY=;
        b=bVbKX8IJXX0RF4mYOG2ZR2GP8pgeRPmKRNY+lij7TpORoOazEG0+lbYpuFJ+dUT2qq
         uhwJso/lXEvjLqJqgh7tdH/5optOY94DgIif9yT5wjYSb29HB6Lo3A8hB6m+x9T447x2
         Mhn19WjAuoFUyqASh/ieSttPquTjnCvPRRs2EpeWtqGnkCd1BKble8u/pxS9ilHarGKa
         HC8hTZcUCN/5kYNzPeMwuiIRd1VylddcvlaaxehysxYgUWRI4NHo1Ih/2uqn3ZCh6mBP
         6jV0wKIikOjz4wW0NNoVPlNuEBCYak35VP3dg8wHXbtyVz4IqYtMiZuZ4FO1pqMm0oA/
         zf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770836789; x=1771441589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=92SAHgAplCp4yQb9ApiGrHWDXrzlV3xmhRggcLV+hYY=;
        b=BwS0uXJHQGQow1KtYIdg2fOZfkmxVnMFGF4aA9Yf+F+UI7EG3Pfe3fGDQInbE9MFdG
         77WKgy7W3UIarWKcnX41f8VumdI7vC6udZ8DKixZrKrVIztxVXg3hY2nVzkX5q9lEC6U
         TOlQO7Rfe4PfK1THgBgjAGf31zP28dw+0QP04CWeBmgKKKfVfI7iR9gfHlobZRgKmBy1
         ckaRCAoHYHg8WFWvlasJFJd/bRCSDyhjVRzRHtugXSJuCBHLNm80GEw6S5p7bUDGBYFW
         8UU7kP6LIy7Jv6oL2AJF/j3DLR2u7X9vS+pBn3GsicLn2bZDGGUSpAgomr1Sbps09Pyz
         4vDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXNrpdLLBnh9X3OunXzVurrA2GZsu+1xLcpAI/srfd0kffeUD99QaW4SBqMhqT/KiSs8CKkSDDlS2SGPXpc2Cj@lists.infradead.org
X-Gm-Message-State: AOJu0Yzln4Qy4HqkrvB6gyqj3qhYJBNp7eeKlQGaJke8XFfrNJaXQ9VH
	OHG7bgG1+XVE/MQHwFcWAcK13uxM23i3FZxMvvIm1DWvBAacIYjVe4X9
X-Gm-Gg: AZuq6aKT9TUUipyH4KHDFC8pe4URN6f4TmWo6UrCvQ3N8M/UiTSE+iJvr4/yGx89Z7X
	ORO0eZY0TIUqrEpo+247ycxQKo3k57H8kkHyesKT3iwRyGq6rDHYhpUTJ99Y+u2XrskLX2yl0z4
	x95dW1FoNRQvXLBKaa49yvxMoXjihGgFjz1lARlFb0fP88YWze+aQUfh0MkoJdcRFOGKZM2lA1M
	XOL4H/4ibXzOWp7k07vfDd93Ag1lPtsrrnwcld3nDHRQf8WW71mEF7k8WPTVUFDMm+gnubclIN1
	0iJtxhQnYRwoZr5HCASNlEsfAebi3/wV1YswhE/oHNkfY4hC9Kp+vkMDlAxc+XAAiowMidub8Tw
	oRbDwwZSzg8fw4tszAZH9CWUVD5pi0+xT9eYQ8Fs3DhOarg5V04ZdaG1vGI4RHKVKWVvsd9UYYW
	fnuKnwa5oNpzdHwy8LD1k=
X-Received: by 2002:a05:600c:1d86:b0:477:7bca:8b2b with SMTP id 5b1f17b1804b1-483656c1151mr3219115e9.15.1770836789098;
        Wed, 11 Feb 2026 11:06:29 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4378e122df9sm211223f8f.15.2026.02.11.11.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 11:06:28 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/7] dt-bindings: watchdog: Support MediaTek MT8167 wdt
Date: Wed, 11 Feb 2026 19:03:25 +0000
Message-ID: <560b1985c911ce25950c9caedc42677ae01fa8bb.1770836190.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770836189.git.l.scorcia@gmail.com>
References: <cover.1770836189.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_110632_618234_92677670 
X-CRM114-Status: GOOD (  10.13  )
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

Modify dt-binding to add support for mt8167 dts node of wdt

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 953629cb9558..f514be8a5851 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -26,6 +26,7 @@ properties:
           - mediatek,mt6795-wdt
           - mediatek,mt7986-wdt
           - mediatek,mt7988-wdt
+          - mediatek,mt8167-wdt
           - mediatek,mt8183-wdt
           - mediatek,mt8186-wdt
           - mediatek,mt8188-wdt
-- 
2.43.0


