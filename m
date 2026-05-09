Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC4FCD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 19:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a5cMbOemj5qCKf6YMBNAikh7EtC1awKMtCwgmYlIPnw=; b=eRkgeY+YKbVMVeV9waKtWEmnnf
	TM1M1Kw11pMzhPMvWqQQBcU9JazYnPmkCqTL72vO6jirP7tJ59DPRbsTKlWk40VeBduV8w9P63KGz
	/4M46C2aqjUM1ZXxtYgftiU+G050GMzXwVQ4QCNyEP3zkjS20Nbq0j2lZWxINsf2NLLY32p3jPu1m
	K5PNFkhDN9KFfsK1tpnVBTcmvpvMp35tFQJrd86RBGaqCTeZJY0UVDqi7TPKKEWMsAVjLvJE/NVU6
	V7XLHbCXYC2sOvjHj7bfNbczwc2c6T9rR2dgydvvDGV8ZWju524P/vMeoYGnWEaZwUf0d0W+97sjx
	lfwrMAhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLnWY-00000009YNG-0U4e;
	Sat, 09 May 2026 19:39:42 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLnWW-00000009YMZ-0WjB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 19:39:41 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ba928852a5so20524745ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 12:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778355579; x=1778960379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a5cMbOemj5qCKf6YMBNAikh7EtC1awKMtCwgmYlIPnw=;
        b=X+pGATMcD7+Ng7r3wRp2BCfoIaWLrfhFFMLoLOi/5ggd8TehU0BC7zsArJgsZ+1vnC
         /QK8DJuQ0EzzU2GX2DIl4JXEPqwNx3nEcF1eepWa/pvk+U6feD5WTx8KNQaf+EJfjIX8
         NzxE5LtBmZFhtuI2ut3R/iqMFxNA7xB4gR/zA6cWRhDRTaPdglkgvnKl0UEzON7dAXhg
         Vyq6cbb0fMjs9c0ELQbtvEJLG0Cssy3BgsFensRggZ+lEAPOzX1NIYXy+e9t0aLkemsD
         +ycKXWuE2gun2CGrWzjPoZ3IhWM51AfZfCn0oRurxPTZbAmXarKke1S+rHljwiTAlZzo
         iI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778355579; x=1778960379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5cMbOemj5qCKf6YMBNAikh7EtC1awKMtCwgmYlIPnw=;
        b=Aur0Ddk9FXZPc9tGtpm8d47p+i/BOWB8yPCquRvH9IF93bszos1wUC34A3boQuqpfe
         h6/R5zW8sWuvhGfIcCUkGp0ewcdt+qszoMhiNax7+Wrb4CWAaDgpWA+9XgOtIHwPFbUC
         n8dYChisnYXUrLva+IhQP9hDixd1Q09Wj+6i8bEv8j7pBK4/bRNAGfTZdCae9EgXobZD
         XC59xRq4gKA1uAecCVX/0FIbdmwT4q8bKE2DyRJGwN7XlwfXsFB4/f+j7ZOq+saRlTjq
         FBPW69Kk8LebY5dJo/7FFlra19s+XIILcfPmW4SmqcWw21k3Lig2ZGloMjFqWNGl4uG4
         xEQA==
X-Forwarded-Encrypted: i=1; AFNElJ8l+L9gKgtQD9Kp19dJZSeYoqDpIjmtU7w01fUbhGNVj7FCx8mCq+q7f2XuHcBJB6QnGx+JfjA06GUQMO0Vjn15@lists.infradead.org
X-Gm-Message-State: AOJu0YxnTaSM507sDNO+qS4CaqGnUY3xmcOPPyjSsrxdESbhF1pWTuqQ
	eX5iFQJn7J6VoavdijDVce/itiYfMA0ejweG/E0ZVxKwBzvzTHWIzoZi
X-Gm-Gg: Acq92OG+iksEJyaEd95xa3KxYiQkiIu5wb23MKUUrUrePFsT09iAhVm85EHHNunFiro
	8rEXoj/d3iRg41PSf9XQ06iw7GjPVjqQFmw+VNqDKxqmzlVA5GsPl7aQwGbzV8IY6cmy6k+xKZW
	+Y5j6hORl+DfbWOP1MXursU+xO6mLSmYJw2lYrHEPHYqNztvysxo8wXBhnDzqwn33v4Q0PEvMRZ
	0pSKerPAIf1Q5hKXORDJ1wKPt2lJG0L8Bre0VcSmTPhoRJEDVi93xD0jyLKxNE9UwZ8k902GGCl
	dQB3cLi/gnc7i7uZxOrOs1buGKlQdEFjf3hRk8tj/0WeZHsFEZmBbA/tOqsFzpbY8C5YUkHveVm
	vno0KKwleokbACzEXa4Wl5JS3XNqbOc4X8NXRCrKt9YARIe70/hL12i1TqJPyT3XYoz2OpGh1xC
	tD8IQCvuFLgtioi1SmgFx5jBopAILQcvUQCh1+kC0WD4D5CHmJGS4VNkewMi1OBLRGmKIG/byP5
	/O9
X-Received: by 2002:a17:902:e750:b0:2b2:5258:a23d with SMTP id d9443c01a7336-2bc7a9ba9c0mr33335675ad.14.1778355578556;
        Sat, 09 May 2026 12:39:38 -0700 (PDT)
Received: from Ubuntu.. ([49.37.169.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3fed8sm59690265ad.27.2026.05.09.12.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:39:37 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: lee@kernel.org,
	ukleinek@kernel.org,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	manishbaing2789@gmail.com
Subject: [PATCH v3] dt-bindings: mfd: st,stmpe: fix PWM schema and drop legacy binding
Date: Sat,  9 May 2026 19:39:28 +0000
Message-ID: <20260509193928.19030-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_123940_165899_6D6F892E 
X-CRM114-Status: GOOD (  15.17  )
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

Fix the schema by adding the missing 'required' block and
remove the obsolete and redundant text binding file.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
Changes in v3:
- Added 'required' properties to the pwm subnode in st,stmpe.yaml
  to close a validation gap identified by the Sashiko.
- Updated commit message and description to reflect MFD subsystem changes.

Changes in v2:
 - Droppped the TXT file instead of converting to YAML, as the
   functionality is already covered by st,stmpe.yaml.
   
 .../devicetree/bindings/mfd/st,stmpe.yaml      |  4 ++++
 .../devicetree/bindings/pwm/st,stmpe-pwm.txt   | 18 ------------------
 2 files changed, 4 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt

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


