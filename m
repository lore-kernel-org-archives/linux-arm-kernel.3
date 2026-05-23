Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B767BCD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 17:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3F79MqG9jAX2CXiKWut0k15rC5yK9KJ27umq50B/zo=; b=nn1qit20ESkZkWxKZBpeFf5dED
	z/zE9Vsc1ld1ZbCk5IICtHc7Q3DV+4CBa+auu3uMCDUxbd30T8nWJ2qoiP/B+QZ6gzsYW+fmu38WD
	4a1tbBxSIRZY00aslVbJ3n/iqleM/9jLwhdvy9J+Tpj/UPZoaRjNhKU1iOczggtRhDN39wfjVa5bJ
	LcYOrIYzlwb36H7hboFnj+MzkbqWN4NTGXYpzBTy1VPVWRRnHpabF6csdZw+Dd+UQ5YZm/lpLVGZe
	jDBUZLycGArBunpkOnOcgmTS4fLKix9egKavgCXkifjcgTQmcLHc0TM+u0DZUgLVoZyuYGltx20Vk
	zMrz6AXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQqDz-0000000DeRE-2Q6q;
	Sat, 23 May 2026 17:33:23 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQqDw-0000000DeQI-3tO4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 17:33:22 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8383fb7143aso3752204b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 10:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779557600; x=1780162400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3F79MqG9jAX2CXiKWut0k15rC5yK9KJ27umq50B/zo=;
        b=XRprf4lcPHNFVB4eEnaBHcTQ4AqlybspZyLuswesd5UOrly4tkNF3NBjtT8RZhsoqF
         T+VU9xCuK9GDxzqFzZaEWgkXJX0ESWt576QXyK2quiFwSp30RlhShiuNXrnMBXK5FaOB
         aGez+4FCUm4TziRPhQ6vMEXlp4uxYOUMxYDHbtek/0b4llNsncbUkAqNTDbqLMZ6A/yp
         JnvMVUVJRkpmqHaOHb+LhChDOjz2tBIKo2haQyd0LNzMNcycBA1zokfT/B+AsWXTYaB2
         kWZg3PSm/hnniPA722tDar1yRwo4u3viqp4/opOUduVpDAhF+4LvrdhkZzHGavX5ipGH
         rfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779557600; x=1780162400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t3F79MqG9jAX2CXiKWut0k15rC5yK9KJ27umq50B/zo=;
        b=fABwv7Pkm+hivwrOPbt/dTGTbg118lHwFQoylFyzPNy1XVqnLiDDgETp80uVWMCYSc
         w0wUSsjAUkxhQqFROJ23GBRxJwogdWGmG39waczGtQb/weh3+DyTECq32rWplb8GchzG
         ifyt0XWLISllR9MQV9kPnpuUOs5TZE2m+YDPYy1Hwp7h6hDvKM7VSjz4+AEIo+hABQIQ
         6KU5Om0xIp2DDE2ZRhT8BGSkXLDWurxU4mZngSdsvuzXHmpxPSI/Un3j08yGQKmBtgDk
         fyzKqrG3gIBFQScOka9ZtrqRueM/SMTIzYrkI0OrgaO12rLI4x8Mfcoq9JKvlZqaJhQD
         kQMw==
X-Forwarded-Encrypted: i=1; AFNElJ8WWRMFnRnn1IA6jbJGDyPE2O94MBdHfUa5Aa1yRlHEclPOoQNvKGfn/Ywh9iL9BASPgo29DoP8xvZdj+nLjGiK@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0WBHuk2J4GiCfIBRRcpe4QvWw43+gScGBqZtoTE09624x5TmU
	8GvPyzp7lh8RsIzOj1MUL122THysVN810Maj+XRLJwc5tGA7UDs0Q5yaICM1nvzw
X-Gm-Gg: Acq92OHoeAkgaqT7C/K7dzgoUN0i225DnimweuBS+9/9voCaesqaYMJ4FPwVtUG4bkv
	p3yEEHBPS8sb0xDdhMnCuHjdmuYZsdOaEuT3I0AYc9khpR7sn2tsxJzQrT7sWGusoWXblYne120
	h97K2MAgMXOWN1fmsEkZISfj0tQEVu+lMZ+Ditbw63hOFcuqF6GrIK81KX+1vNpFeNSHMfav0OW
	YAbVDSeuU0OkDOIpMQWMLbJ2gO4AZzoIqF9MrevgShqvICzoQTE6ApRP9YE30mYh0ek60bHWMW5
	+DuuzjT4wgYJiDD1AWTUR3B6kJbSWJ8h/O4TfxzlxbsHh/fJZGnR22f/4tChBmY0H+3MOTmDdtZ
	ASRM/fSoB7uKWGOvYdB9sQdHlqR15P2SRtmc0BawkhN8fLan1xPNqAuTqHML5wqsRVOsO0+tJbt
	6yBNAGP5AWkfk6kFWmxKwoaes6MZrJYhtI0/KXfxGeFGdO8McnZSPebUztwfXyFK/Tjw==
X-Received: by 2002:a05:6a00:4483:b0:82a:780f:a187 with SMTP id d2e1a72fcca58-8415f5e6690mr8305636b3a.36.1779557600057;
        Sat, 23 May 2026 10:33:20 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.12])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fc646bsm5162945b3a.46.2026.05.23.10.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 10:33:19 -0700 (PDT)
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
Subject: [PATCH v4 2/2] dt-bindings: pwm: stmpe: drop legacy binding
Date: Sat, 23 May 2026 17:32:51 +0000
Message-ID: <20260523173251.72540-3-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523173251.72540-1-manishbaing2789@gmail.com>
References: <20260523173251.72540-1-manishbaing2789@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_103320_970901_4AC56F5C 
X-CRM114-Status: GOOD (  10.97  )
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

The st,stmpe-pwm binding is already covered by the MFD schema
Documentation/devicetree/bindings/mfd/st,stmpe.yaml. Remove the
obsolete and redundant text binding file.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Uwe Kleine-König <ukleinek@kernel.org>
---
 .../devicetree/bindings/pwm/st,stmpe-pwm.txt   | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt

diff --git a/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt b/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt
deleted file mode 100644
index f401316e0248..000000000000
--- a/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-== ST STMPE PWM controller ==
-
-This is a PWM block embedded in the ST Microelectronics STMPE
-(ST Multi-Purpose Expander) chips. The PWM is registered as a
-subdevices of the STMPE MFD device.
-
-Required properties:
-- compatible: should be:
-  - "st,stmpe-pwm"
-- #pwm-cells: should be 2. See pwm.yaml in this directory for a description of
-  the cells format.
-
-Example:
-
-pwm0: pwm {
-	compatible = "st,stmpe-pwm";
-	#pwm-cells = <2>;
-};
-- 
2.43.0


