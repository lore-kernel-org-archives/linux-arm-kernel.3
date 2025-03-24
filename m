Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25AEC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 16:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=; b=f/gqPLuGGkxNSmLtWABlTUjuQd
	dF5FytllAqZznM36wKTfEhY8xmyaR5jWE0BTORsLT8BXmPA49MJR0nw7ajL7PDRp0hhI+OVoN0UED
	HY9MK5GnsiM1jUQjCDT89XjQpJUkCvrufuQ/Fu7W/5lT8rBTSXfbWDsmH8zTCZX7b0u6ikdcOvrYV
	o91xV6XU9CaqBb2znunT5rafV3UMAgO24nQiMWqedx7Q1EUPlJlo8x5YHe6N1Xzf0HxpVhDP4LAKO
	AWzZEWeUxOflV99mnVwL4zQWrxJpmQlFbVPdLwsMT+MvvhcXWrGxrqVOuMgnLeMJf6igXq2Piu61d
	SW58l/Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twkoA-00000003fvL-0oiP;
	Mon, 24 Mar 2025 16:37:50 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twkgo-00000003eSY-21ho
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 16:30:15 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso29977195e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 09:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742833813; x=1743438613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=;
        b=HaMQcClTrcJv9OvX4hV2iD0oMpW24Uyf8FfVPMXpCJDPZsPpJjMYi09R1daxryAxjj
         3D0iPyatKmX8+EUkxlDM2s1/mqh7RUvm1rvMrWztQ0ibZN2cXt8zebZ+pPHtQGCqW3kh
         zyDk74EL+yEXNm0DHwZ37iSW+4agHgquUr9hnJ1i9vGKd+IOIkNVML33STZXLnHAWn2N
         JokoVECX4alrq0lydAdQSHqkvST5U2LeEwyn9q9efcjsNtlqH7BhAJz1dRPshBobnUgm
         n/ZgRcnNXl49EgS3moGcIUPTH+zMMumW8+vy4ippYyb6Cp3USgu2KoXuF706tTiHoOgo
         oZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742833813; x=1743438613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=;
        b=hKVjYwIbJu7oXMGhuuuJ91Oil37QyCFxsgA5eR6Wtwh6xE64xIvKOCkS86QHqd804R
         CetRQxTl2+KQSYSlALxKG2bQJSYz4R8WipyiKDPnlAwS1sdYj2qXt8cB0s4yLWeNRuee
         JPdtFbLoxvLopXIylhCgYqnzr2Krj4oVJ/DemWJJZeJCXXe3f6iPweWpX298Gy/YWDJx
         dBa0ntpyil/C7K96M+cBSvFtBZW7sVy0t/Sqxq9KQCgqC+bAFU8v4aNiYh2KFRy6Oq1e
         2l4qVEBhT3tMoFsHQN95gTO70ldqtJQW9XzWEwBUbWDu2L9nCop272v4EqNmTPZBIp0h
         bziQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFHjF5KO8n+8fdEgEcvfQJP1iQC92Wi1zaVujOKF7LLIk3RBy8R2tIxji2bPJQgSkCqTij1bryfzWOp3Tz6Xnw@lists.infradead.org
X-Gm-Message-State: AOJu0YwTXiN/4WMD5zwsp/QwHGLA3dOKbisKfdl7K6bWrwzhrLLYZNjR
	Z8Zqr88QMxZ0u57Wp1STAsv5l5nvs35OCBxpgwanvl/VGcZkpbuE
X-Gm-Gg: ASbGncsDVZ+WENNBllz8tnhqr+xlTBOxXg5xUGpAEPdNd3bC5lcgJfedqZ02+5rnHJn
	AjwKFGi+R5fPRyEPEDQ51W77+bZVb5mQK4knujVDMxpo9t/NqAqMBp+wg20J2DIl9waIzUyUeIe
	SHXFcdIHcO01jA5ajlSS5mH7YZM/mzTqxxrCoDsxZz8M7W/vOsbsr7wglOGayUm/7VOurp3z3Gx
	cGN+Om2fbwWRLWPVRn6cu5L9cuTG8fJkk4sG+eEA/Yz6FwYo53hjSTwjKIQOU4ZICxJ17D9eDXk
	lYzcqqPPHGQwZH2WVaL0ybWl3ytIrjbxFkYarhaVtLtvEa+9qM05HALRof151Zmo4IT5UMzqSHd
	WolqMin8=
X-Google-Smtp-Source: AGHT+IGu6fTgDwofVoKRjp4DA1DLbpppRHEZaZIgwdT9HARin3pVTWNzJxo96bidLrG+Ulb5IFSLDw==
X-Received: by 2002:a05:600c:3b9c:b0:439:86fb:7340 with SMTP id 5b1f17b1804b1-43d50a4ca6bmr119432205e9.30.1742833812679;
        Mon, 24 Mar 2025 09:30:12 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdb0669sm124106765e9.34.2025.03.24.09.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:30:12 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
Date: Mon, 24 Mar 2025 12:25:53 -0400
Message-Id: <20250324162556.30972-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250324162556.30972-1-laurentiumihalcea111@gmail.com>
References: <20250324162556.30972-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_093014_521070_F8705B40 
X-CRM114-Status: GOOD (  10.64  )
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
index b8693e4b4b0d..e610b7636a08 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -91,6 +91,9 @@ properties:
       - const: runstall
       - const: softreset
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.34.1


