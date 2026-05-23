Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091ECCD5BB8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 17:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eCj8+oLwvPOIbmY+qV1+VohiIFMiRIVX9QeRtC1IOt0=; b=qtRYjh7kYhTjcb0yYqbI6eO/Ch
	FlB55Ut/FvMLkKwHScp4AvPkdfNjZ8cHdve5eMmpWV0Mcr+VUPnkSouUzMSMtnxq71fSyUT+RL3nx
	jcBUi9bM7sMQa979HE1uk0kFLqGD1VX9mIQWkJ6mAf0p7gSIGBWv1Qv6Ncq2KGSfgyy218oREixMj
	g8begT1cZD6wiJiGoXxjmG79meqGOmlWEGucuI4WGtTUJS69o6ZWB5n78pXwnieS2RDpWYiL4/Nxi
	0VBfPmVPowZT4HErlZHhlFG6+vZlIM6IYxwzZSDr95vI6JCUkQl4y4L+rmzd0OLXZcNmCF2aI+0du
	wMF0n2xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQqDr-0000000DeOx-20wU;
	Sat, 23 May 2026 17:33:15 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQqDp-0000000DeOJ-1PMC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 17:33:14 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c8025f1c227so6757087a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 10:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779557592; x=1780162392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eCj8+oLwvPOIbmY+qV1+VohiIFMiRIVX9QeRtC1IOt0=;
        b=QetiSL7NeKTqrc24DI3Az1nREPUMjZlaMz6zzlPCq3F24r75gyZDRYg7kjb0IKJAm0
         ojVifE1RacZS4v4e1P3SxiLi6IYBjJ/r/qf0UbgY9Iv/RTH7nMDsxQXEc4QanbdQNbHU
         UtavWeGjG4in0WQrPMRrgDNqoY1polP6Xhtanp7RzcXn02eK2qtruuihdF4iWYCMZF1O
         MFC5CUM6NavVhR01sd0YSCUJuARh7+h8LewkwWjCW6XuIFoxuRvCVjlBEbc8Z7VK8LSx
         RNZycyxpD2FWgDYlNgcQB39yVWBn8dRhgV4ev9eOObi3c1JreNG6svMptWWBzd4vEsTG
         0HkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779557592; x=1780162392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eCj8+oLwvPOIbmY+qV1+VohiIFMiRIVX9QeRtC1IOt0=;
        b=Saw+NndFMZEZXohFS7s7XMKSP8zyyi1eS1aTK1xlthnZY1ulWkUXbLZ6811iM0Xw+M
         wv1zNoDybrAMtJvZliABlDS/DBrrwFqXQ4/Z+k4HJKmP8NMjuyMqD9UJPekXLJY2wtPK
         w/4LjHiiyPYEXAvulLtMNdzA/Zz5bd8PjL6KnyFFt5ingP+VwIyd3k7XZygDY6XO2f3B
         tFb6Abqiigov4SYQjad79r6rujNa2zFYDfGcihj7PuURRRi13EAYafLztVgDqxzvje+a
         7D/LHp2eMi/1jrWDtQgTKLzGR5g5C45JRVnT7CxNsiHWjbSok8ddTHQLn6LRzEHwUkYl
         mVPw==
X-Forwarded-Encrypted: i=1; AFNElJ/ItIN3FpSXwQbrenq/XPQmF33RXQmFryQvdYic7Yhmqu1RqHnHFvkb7wgOOS3v1Ek31/0pv3Qy8gu5wyXkvpog@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv7IRrAbYQt3Hvu4xpi6h2ovEqC6rlMbGvJOyFv2qGIrp2VS9Z
	JMsQH+YZ1cpD5s1P+dfA8oGR9zsYdjVfl7liW6cLtpAUwXwM7pQ0v+oK
X-Gm-Gg: Acq92OEoAEaSfP83b/ZJltotB8QdijX6ccYQA3/sPMaqxBgHDuYWxlvnMM+YqR1sE8x
	wZ/L7hWtSqZj0hAFs46edrFw2v7WCf74uO5F2OfNtV7zX44TMH0g800bZ01St2xr/kNGVHwmdjT
	8qg5NQcC74f8CifIhxHiP9gscjXR3vqewHifzmLnPRJMz1BQSDtXTSUBK3hJVdUFq1XJn4RmUil
	ijfNqwvVhtQ1iF6n2gzVda8BzDPTyDxvQfsO+GZcHU7vf7qxrB/ABbdiEjDy2l9cQMHDrtNVpt5
	iKyVs6HUe0D/KiecMVuhr9njJC/v/pXpjcRNcPWDm9eBHqjSeaRdEow2nnrIFTkqtwkxwnJuY1W
	caRSd/r6SpeU6W/xvpOnijlzVXrLy4UYYh/nIzrRva0LGBNdDn/iXCeru8hxbFpuRg6JsEZuGNZ
	SVX90Kmr0tLWPb+6JYTkMa1ICOlg/rnLSu1+9ZTiJ99sD7++sRZ6eTXtxR+IXHanXqhQ==
X-Received: by 2002:a05:6a21:594:b0:3a7:1d55:b634 with SMTP id adf61e73a8af0-3b328f562bemr8292242637.38.1779557592547;
        Sat, 23 May 2026 10:33:12 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.12])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fc646bsm5162945b3a.46.2026.05.23.10.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 10:33:11 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: lee@kernel.org,
	ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linusw@kernel.org
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	manishbaing2789@gmail.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/2] dt-bindings: mfd: st,stmpe: Add missing properties for PWM subnode
Date: Sat, 23 May 2026 17:32:50 +0000
Message-ID: <20260523173251.72540-2-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523173251.72540-1-manishbaing2789@gmail.com>
References: <20260523173251.72540-1-manishbaing2789@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_103313_378522_B6AA0B11 
X-CRM114-Status: GOOD (  10.67  )
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

The st,stmpe-pwm binding is already covered by the MFD schema in
Documentation/devicetree/bindings/mfd/st,stmpe.yaml. However, the
PWM subnode was missing a 'required' properties block. This allowed
Device Tree nodes to pass validation even if the 'compatible'
string was omitted. This omission could lead to probe failures
at runtime.

Fix the schema by adding the missing 'required' block.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Uwe Kleine-König <ukleinek@kernel.org>
---
 Documentation/devicetree/bindings/mfd/st,stmpe.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/st,stmpe.yaml b/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
index df43878fbe18..4bb05d544901 100644
--- a/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
@@ -127,6 +127,10 @@ properties:
       "#pwm-cells":
         const: 2
 
+    required:
+      - compatible
+      - "#pwm-cells"
+
   touchscreen:
     type: object
     $ref: /schemas/input/touchscreen/touchscreen.yaml#
-- 
2.43.0


