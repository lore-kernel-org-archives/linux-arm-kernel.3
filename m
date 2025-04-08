Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D63C369A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 15:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=; b=LM6nz6ehbHqxPyfvH3KQ4yU8Gp
	t2TwhRwOKCL08aNdW+QGYomRxeClUWcdBpvnRsBxEXi94ruxq+/h4MGiVhANM76NVYlZdRz4rB5bZ
	Fkb/jIJIQGAfpzf7J6p1OJXpjCO20TaCjdl6thEorvpH1hsPFyO/vAI7wcGOdHriZyWCBY5hDfNiG
	tFj5/njq+q+I/LzqEFUZO/CycdOO99fdLuIJnil2zUao54SJFUtgkupulnaf5/TDGDlaIvdRFev7v
	6HAT5TieVp97YMbksHyEGslSivLZGYdf+EZWQsTQ/NtI1e3MqshIuIanbbgl1FldCP2x2UUgbthD/
	03OAlcDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2BBU-00000004geF-0dzy;
	Tue, 08 Apr 2025 15:48:20 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2B6G-00000004fmo-2WLI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 15:42:59 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-39ac56756f6so4881630f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 08:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744126975; x=1744731775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=;
        b=kQPXyS7iRgFtvBcE8+VkxLJG1/X4ttyeGhDcGIkqQb0VdtFkfq3SEb80cLru/D7XMx
         e27wEQx9bfhCKZgtpB3soOYPUwWKLejoxKcAqBzjQ5yxisbpjf+LCJLjLtM+/qkjR9oI
         HD4j2jzyOU878Yj3a43gbvk18Yoi/GLgxzmlfULhoujZSPH/+Q8i02nNm87eWQELo76T
         BXPXZrZsErtSjmPWw52PLrnxpqpOTJiU9x7d4U/BuNfoSJANcoE0fiYlFXLAy1YHxtOB
         YXKF9cxMyBDcON9vmOEwbqMNsOtx+fv33GCX3pbwa8lt1+tnsZkZSsqWhMgQ7vi/xaX4
         VR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126975; x=1744731775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=;
        b=SNzln5QU+PDuUXzvRLS5c1M7ajPTcK+N9wBH4O858OvqrFZT0pgBM1RLxZZkIueN76
         kMg9Bs+mtI4oHW4aDiFaOQBC36XovyKu+9U9ZKGwJhyk72deV20GrGQEbLXWNJv22I91
         9pzTZuY8+kh4626hU1Yx2RJoxzcHTSMDJFEc9GInlOTj0hL6XMDpZu/ALjEnbOCZJpqz
         T3FFnzRTTGgUzSVgp05hHKqlrKMqXzT/CDPlNgY/gRaXaQeEfQLv8K6DlyHjwsE6iPTY
         k//XZZjyzMMdDlHQO7pmguV31MDVYcGUXfa4tJaUhbHo4Q2HA+ZnYB+0pvDHXRydwfnB
         mBQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoDxY+f+a/B+yvw4fLhnDC49fhuYZRnud4EXFaNFCWfG0w8JzNkSXvuRDiPYJRQDM7VjbTrABaW41aq3XwDh3I@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4TOvvMdK9VjAdUyuxIWDMI/YVZZiFs3ZghdvsZyy49vwZAEGs
	/Z2TkLTlnQcxkweDBNXztMXJRsQsEltjzkSikRNNbgtj12AUnLAz
X-Gm-Gg: ASbGncu/qk6UVJ0JmEVxK9vXSLu8ilFzSFDewrO9iQYng1asLiCa5QqsbWzisGbqUCw
	HLf9/LdPbkcdUmi4QKtfhcumHdlgsUnfR7oV+devJKBn6Q2sWLoVNaMM7jD5EYGlPexd7ZP+tdA
	WsAr5W3keEG+JUMkk7QOGTCz3CNQaDCEUUPwVfQnJtCCQC9939+QDErOi7rJ8e8z3zlNOAnxVdC
	jS3nep0H3uMEx49powv8LVlTruiKMugdg1bUOoQ2Fm6zlKiN013JVB/eoUDgjNXmIw76nhxgZKK
	bbsObCqKoadr6yzjcSbLLB3oPmriv3CiFBAIOCKpyJx/uvJ4n12NnnhaK3RMV24L70hqoB7R/7K
	Hzi5E4BQ=
X-Google-Smtp-Source: AGHT+IEYi6zlzoKa/yDqzOVKsn45DDMykY+WgG+Uz9FkgPjhijbvcZRMIAXjw/tOkhVFBEr3GkyMnA==
X-Received: by 2002:a5d:64e6:0:b0:39c:1efb:ec93 with SMTP id ffacd0b85a97d-39cba98b7edmr15444584f8f.48.1744126974756;
        Tue, 08 Apr 2025 08:42:54 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2e6sm164476675e9.18.2025.04.08.08.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:42:54 -0700 (PDT)
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
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/6] dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
Date: Tue,  8 Apr 2025 11:42:32 -0400
Message-Id: <20250408154236.49421-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
References: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_084256_640626_3084F7AD 
X-CRM114-Status: GOOD (  10.56  )
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


