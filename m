Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FC8D5E368
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 12:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yMBRjHQI74d5Z99eEqTTVCC+GvOlvQ6t8L8FeqMEQRI=; b=y2IDuQYtVAW78y2WlUVbnDWuiY
	pGt1+9BnfmKkUDkRNbpvD2dpEadSm2/Ijq/A1kVM/vKyPnGZ+v0nM7CQt8GfBQXzPam2ey2lsbSKb
	2fbiuRxNr9TdwrJhSnX67ESLmf9Sqtc6gMxwntZ5S2FpKDHi2y48QOoAzBEzzmIetpo1wz6lil4wF
	jo8V3CtAAVUYS9xZlGRFpngkubG5Wn+yJk4MFq+PPQs4kmUPzxkHgSQV+LFVTnF7R/4mbNkQNckdS
	suBeaaNRlxrhM6vkFCMCJZPfQuEPEgk7Vd4ZdpHlVsH0GXeDl+MAnDgbgZqqf7R0Mcg0JLcWnimrU
	iuoxWG2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9ky0-0000000DLpb-19qC;
	Sat, 09 Nov 2024 12:53:28 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9kpZ-0000000DKSx-07rm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 12:44:46 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5ceb03aadb1so3583140a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 Nov 2024 04:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731156283; x=1731761083; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMBRjHQI74d5Z99eEqTTVCC+GvOlvQ6t8L8FeqMEQRI=;
        b=Sh065hwkBVK8B47XjjqsSlCbKMvwZdvRTfMd13pozmllAe/S9hvuHcAk3UeNJVNqcf
         ZO+N70nuwH/JumnH6QHVczRRe/CyVXLe8RrjWxawtioUzphmxXQ+Koe2tVy4BSTaFbrB
         XIykmD6tji4rcGU9AK/jUrxs+1SVB7RLXDUMiTaLi6sBa7TgNW+KA5Yw4dLBhX3mnosA
         neQgQ7B5fESWodEQSLRzCADWSRzH49CNJk0UBIRn5/56pdFCau+35mHEd8z9IbPIMgRm
         wxt1THw/dQEQUGWUhXvmvcNpXTUAIi+iiolxbXj1qs0iQRKVcFWmMeGQ1W0mQ4+WYRup
         kN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731156283; x=1731761083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMBRjHQI74d5Z99eEqTTVCC+GvOlvQ6t8L8FeqMEQRI=;
        b=Jgfs8fALkShnP1VGYiZ4uKnWm/Ew7nJhu0qpmHmleuLMJSF36UKIZwZMVKbKefMmH6
         MyIXfdP2qKTI0gdDDBonyfw4T+22U0uOqm29hnGh64xCbIqKnwl5c0u4wumkkgDWOcPF
         nc1JRB/k2wd1uw8oOi7RZZi222hddZoAOJAe1Vh0TKn1gGGmFRn5W9aUiy7sNhsPozMw
         ZK4XWawamhvE2s6/YArvUYaNK5yPRyNRynuxdnFmmDGksDMmszVqVRAoKMHdnaq13vTM
         VlLCwvsbe8tQtMLQJ/1KSMyLketD/UWdFgn+T4cuJg4RVmllMZt6j3093suwPE7p3LMT
         WUnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUXEvsrFRcGBMXXicV7qGLkslxLt6C0/MoviqB/eCkquWCZh9iIe3DlA3U4xXcfhtCGaSSVGkLcuwiaRVDtiAB@lists.infradead.org
X-Gm-Message-State: AOJu0YwKB/Um52N4l9qjJjejw8SoGkGJbP2xxk+fZC7JV7h6ISv8OYBx
	JfzH0jocC0Zc9byQQcfAB6WR4u0WcQeF1Dbrt7RgzmdSqwIukxdy
X-Google-Smtp-Source: AGHT+IGHmXkaxvNLQkweBLdDmIhicVaPliDsIzJWNuOAzUgBi/pEgCPcvtCC2kM/nBeKCrbNxy/bFw==
X-Received: by 2002:a05:6402:4405:b0:5ca:da2:b2ca with SMTP id 4fb4d7f45d1cf-5cf0a32477cmr4494536a12.19.1731156283115;
        Sat, 09 Nov 2024 04:44:43 -0800 (PST)
Received: from [127.0.1.1] (leased-line-46-53-189-50.telecom.by. [46.53.189.50])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03b5d793sm2940166a12.17.2024.11.09.04.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 04:44:42 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Sat, 09 Nov 2024 15:44:33 +0300
Subject: [PATCH 1/4] dt-bindings: power: supply: max17042: add share-irq
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-b4-max17042-v1-1-9e2b07e54e76@gmail.com>
References: <20241109-b4-max17042-v1-0-9e2b07e54e76@gmail.com>
In-Reply-To: <20241109-b4-max17042-v1-0-9e2b07e54e76@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Purism Kernel Team <kernel@puri.sm>, Sebastian Reichel <sre@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731156277; l=1112;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=XDi/izkEsxpjIBfFcCl4FataBQfKvJR8pQmYDtefj8s=;
 b=S2oWIinV5ResTYdNod6KQGakhY3n2n115RbBezpr5fVJmGmnKyaCmXd8jZrZ+MQSaky4qbucC
 JOnSGVPtY/GD5N10XFrNG4mOf2wnORx+aMouPtcZM9TebziThuOZ1ge
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_044445_106635_BC95EEF6 
X-CRM114-Status: UNSURE (   9.85  )
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

If specified, driver should request irq as shared.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml
index 085e2504d0dc..e98ffdad1ec3 100644
--- a/Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml
+++ b/Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml
@@ -59,6 +59,11 @@ properties:
       Voltage threshold to report battery as over voltage (in mV).
       Default is not to report over-voltage events.
 
+  shared-irq:
+    description: |
+      Request interrupt as shared.
+      Set in case of other devices using same interrupt pin.
+
   power-supplies: true
 
 required:
@@ -79,5 +84,6 @@ examples:
         maxim,rsns-microohm = <10000>;
         maxim,over-heat-temp = <600>;
         maxim,over-volt = <4300>;
+        shared-irq;
       };
     };

-- 
2.39.2


