Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD919EB2706
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 19:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6oQpYXC+oOVLX3B1mt394dx6/WutKhxIvgHdxTMSixY=; b=YpKjOAaYsLFl4HfwaYdunIeIlf
	zeI0/t+3QkduiSzx7/k+8q6NPRw0fOz5sc5CpeK30In16KiDPYFDEhXV+jByXtVK48Hd1gKWnsvYG
	toFB3nzCekpDN/xUo30e/HOcBnYUMLOYZSa6AN4yNL3xfhUWS39xTCu0/Y3bzaFiOllmWO8WyRHy9
	WpHxJTIRvHH+UMjOX542vKVREd1jjhUVEnrAXZ5SI5hoBW8Gxe6aXsYwM3f10cV+eCormyejdf6NX
	/3I/pk/BrNYC4DRqqU0brNbCJ22S89rM80oIyd85oU72x4yDv1tNCPHgujJrcPaQpQ5LrUGOQ3Ymd
	0ZworqMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vptUP-0000000HRCd-3BmX;
	Tue, 10 Feb 2026 19:33:37 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vptUL-0000000HRB4-1iWF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 19:33:34 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4833115090dso11256875e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 11:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770752011; x=1771356811; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6oQpYXC+oOVLX3B1mt394dx6/WutKhxIvgHdxTMSixY=;
        b=gaeLA+ouRiiRHbYYcS5PTSKHUMeslPS0vN25tmNhqSDcgouBncB8HUKaaPVj0Ib/bJ
         eJJCXse14Q80nbPfEP7Yflpoh9hDc8lThIMK5u9f4Ua6PFkQKDH/CCjdXQTkJtbCyvDu
         RVHZ6ZENHAoH1UibQBQfn7VUbs3xivwrsHWYMLzpfoPLoK6hmFZWn3pwq8VW26Sfe1a3
         P+Lq0SN0KFymsgCb1czlpUH1SWRUVFFMNypehNjycATi8LNRclmeDA8IcXa5cL+XB3nR
         6U7X8Yqy9ln7W0kRHNgA8UsprHqtrtkrUR5WFi5dqjmIj5oKEGbogeel0ZJ8xoa8J/OO
         dQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770752011; x=1771356811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6oQpYXC+oOVLX3B1mt394dx6/WutKhxIvgHdxTMSixY=;
        b=M+UwPfcMRd0+KOcumymARL1j2bDuooIkqZEdw/b3KrLRzXSbNKnFo0FA+30CxIf0fF
         f7R/Qn9p0odLiQZ0TFBGB8mzhUZ3mJP+qUStK/Y0BUnVLJk3pkF6LspkCn+D8PuzHhwm
         IveKPE4elnLWkDQp8RFT8FCHoDE3qGn9dRwFHC6G1SICgxtuuq3COLKUXnX1UnKElvYg
         jeXNBJgovW7mdqdKCwWYbQtuKcAhYOZtWVezpv87Mo4cBawSr5IgZm/JuJeXmV0MqNOZ
         3H2Hph8MswznTdImIDq9pi9ghimTBW878NTy+wi+1kGULA2rmwU94VNrIUxiPsvkP41a
         ixZw==
X-Forwarded-Encrypted: i=1; AJvYcCWTgp7TnfGwdGGBuPgchPUe+dd5m/cJWmUnziqqnPES57qPQ3391UFEp4lIXGQpYcyQNNsqtOuwgVml0KuSRgz4@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8meAYDBQfxODVem8MUCFg2QZWjr3I7IHhzpjUD7Wqej3OcMck
	rhh5sIHaoBGVemcBXWd2rfiE9/7CebPiqETWBQuGzCOTbJ1osFGl4fGC
X-Gm-Gg: AZuq6aIgzc02wHmZnWVrL2GHdt5w173SgHrROCrcDg50oWDcAW4e82RcxLzgsRXJ0GZ
	VCk4kqdVcMt/R4+cvOsSf/0ROyQo+/6gzFyvhMDLT4IQP+YBGNvYX+abwVs82UZ9WrHdf2myBQK
	JA7oo7O1SAI2kjLpcWy1SirlhqgaPUb0dnfReSWdV865D7rCci/IG3g2ZQDZWQHTTVGmhBZSQd6
	BKHQKn9kFcsDW+00fgwV5FkksIy3euJJGkqt8wlawP8jfKg4hpQWRDqp5po6y+OyZnMl85yZ6CD
	Tkakp0xw2ogBUjpKqcFHGedX+qS8D/gbW+yLc9UT3HrLHaBaU4IVuTRha/xrguelXkHFgU8jehj
	hqK7jnGhTABH16Cri65SRFVrZ351dD3A240aaFxhuwyoQ99nxgCIya7DDnpQQN1BGIB/RbrhVr6
	TKzvy1cmkqzfHfBk9aTAUyo3G+J5SXHQLt0VnktkxjvdS8DdCoguuiImPwDQk=
X-Received: by 2002:a05:600c:6290:b0:483:a21:774a with SMTP id 5b1f17b1804b1-48320225afemr247617395e9.26.1770752011383;
        Tue, 10 Feb 2026 11:33:31 -0800 (PST)
Received: from localhost (39.31.66.37.rev.sfr.net. [37.66.31.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d82a4c4sm143519295e9.10.2026.02.10.11.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 11:33:31 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 10 Feb 2026 20:32:52 +0100
Subject: [PATCH v9 1/3] dt-bindings: stm32: stm32mp25: add
 `#access-controller-cells` property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260210-b4-rcc-upstream-v9-1-17ca1db7613f@gmail.com>
References: <20260210-b4-rcc-upstream-v9-0-17ca1db7613f@gmail.com>
In-Reply-To: <20260210-b4-rcc-upstream-v9-0-17ca1db7613f@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-47773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_113333_484423_D7B037F0 
X-CRM114-Status: UNSURE (   9.97  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

RCC is able to check the availability of a clock.
Allow to query the RCC with a firewall ID.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
index 1e3b5d218bb0..882de8608200 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
@@ -31,6 +31,11 @@ properties:
   '#reset-cells':
     const: 1
 
+  '#access-controller-cells':
+    const: 1
+    description:
+      Contains the firewall ID associated to the peripheral.
+
   clocks:
     items:
       - description: CK_SCMI_HSE High Speed External oscillator (8 to 48 MHz)
@@ -122,6 +127,7 @@ required:
   - reg
   - '#clock-cells'
   - '#reset-cells'
+  - '#access-controller-cells'
   - clocks
 
 additionalProperties: false
@@ -135,6 +141,7 @@ examples:
         reg = <0x44200000 0x10000>;
         #clock-cells = <1>;
         #reset-cells = <1>;
+        #access-controller-cells = <1>;
         clocks =  <&scmi_clk CK_SCMI_HSE>,
                   <&scmi_clk CK_SCMI_HSI>,
                   <&scmi_clk CK_SCMI_MSI>,

-- 
2.53.0


