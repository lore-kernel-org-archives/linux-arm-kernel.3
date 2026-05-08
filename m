Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6C4CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 18:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y8T4V1KOUS/zQQGD3wOEYFO7WBlAjbkL/PMKx62SumA=; b=dXTRcHkPM2SzI0h48fFMkibsf7
	Xuu9XRMujkbxWA0qyxrAD3qAKogqHzSiMf3bK27Qohm6t48Xf6Xmv4nNRj+NqOPi+u309Jwf0XeoQ
	PP4vIalVE7QT8IuP9/5vNt3pki4vCWC1c+5PAYnyhewy8YbZa3ae46P+uXlhW065oOf8OS5FlNXSk
	l/tfBwxNxpRJWsPpCotWxky3wUNwc90s+qybXzmhfecr0I14m41BQ/wktifIx4+OZKlDxrrmxvbk1
	fgE5GMlC7Jf64Wyvay3VGlmuj2wGJHJfNTW8kKDQs9A7AmReUC/ZBSaK8j/jzPAon5aijpy35DiE1
	NNt6hXrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLQDn-00000007I5t-2Vf9;
	Fri, 08 May 2026 18:46:47 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLQDk-00000007I5G-49rP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 18:46:46 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ad21f437eeso16230615ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 11:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778266003; x=1778870803; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8T4V1KOUS/zQQGD3wOEYFO7WBlAjbkL/PMKx62SumA=;
        b=i2viaQS8ump7tns0Q3LiJc85WZM762v/PQeDWboeaSd741PiuDx22u4cgC6tBX0N81
         bJHIw0mSdRWc1S6ySZUFXpRAoReXlbhqmbo+4sZSI5pAy5AtF7qkWWEZ5lVptWTxxv8r
         vcCZyD4UpQRx7djYFbIWgcHc6KlBlIY5+mPoHNERiR9KnwxYEbFud7o0Jmb/7LraTsnc
         FVsbkhDWT2uljAf4KarxG2sK2eHSdrKGb6vJxBMnuA3SSwuGO8ebF4wllFNVgba7Elnm
         OAbPwxmjR+rv3iVzNAropAEJHTvHmPhHU8EjJ2zFTA4zM/c8lE3/EvY/dJ+9GnP96joO
         DCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778266003; x=1778870803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8T4V1KOUS/zQQGD3wOEYFO7WBlAjbkL/PMKx62SumA=;
        b=PxKI/N0bmcifiaKYImW/znFgg6m0jhCahDwCk94kfV0LN7iwQUUyfFo3/mVZL4hfKp
         Bmr/F8CqxvGLQUOevGjdu7z1bvPrsZVadYAn01hoC1QBiH65RRzDkD2ESgxg2VKLDvHu
         7+K8ZKlrLRcq7wQDQMdCvGgcqCSH5R8HhPloG8tcoMqxEtPt4d4Y72wlGn6ELPmexR71
         hQSb6RAVPviAUG4nXUiROrTzavpmJFzCyxXsFul1Q//3Kv8Dsa+N1rD5x5sveVTHLPmM
         YBEJ9w4NpRkYHRG8GwPcvAo0QsqK8M/iWSPua2O8mAC0/k4h/L4wt6Uor+xnZzlzijr4
         yFMg==
X-Forwarded-Encrypted: i=1; AFNElJ8fjouWkkvN+Fd62uOm1A5fYSzGvdH2yAoBhgvLwQjJrwSMpGuIZUkn0VnSrcVXN40nb6Xm1kifp6bvCSeMDrP1@lists.infradead.org
X-Gm-Message-State: AOJu0YwXhXU48aUEvSzCbc9ZwEREPFrzvCugV5PG/Wh4FaP1lgcWzK5k
	iktcqFh+1Aeor0S0yIwAtpkuj1nEtcZUoHoekxKX3ohlYZO19V1WMHwWB+Rs6GcB
X-Gm-Gg: Acq92OH5XRGURoLoK7K74Gfh0W2dWKGH1o/aEDU2Sdn2s+UwJuuf2QoYc6yrdvyhemh
	mpRJAt6OKtoeumXqI47GYRSce1KVSI7+1xGz2zU7EMk1CzU/jSjrJ6TApI6Enk8FUoKfnZbJz/y
	Zc3vpdAwa9Ou09D3bJccxb9prpgw4Bp+xhPXIoOdd6qqK74RzcXibioQMm2LsgPrBrdLXYzrKSV
	x6QjJTW0VfBQcKrnKnMMHsYrQiEXcqdIxvcOh5egJhO36wFZpYZn/MD77zSNwzFE8P/jDsq+Crz
	V/qTtaKZdJvoJQWFssDaPMtXCRAQR706xJj0gG3L6dZvToH7b2CLPZgiI2g1b1xda5fJwcDA8dA
	mPL/8uzYfWnw05V7vB28Opdb87zFd++sEOVaObdCguOb8XesVlbeCEiVNyVCBG/qtePULbAfo5s
	sE9J85bxqIsYUaxIxOUZpaG2Guf99fiMlxv/nFqC3NX445w2JtPLG++Sk3iDcZzo3Lrwo=
X-Received: by 2002:a17:903:2f46:b0:2b9:6cde:c345 with SMTP id d9443c01a7336-2babd4a4742mr76227935ad.18.1778266003085;
        Fri, 08 May 2026 11:46:43 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e89d43sm30926035ad.63.2026.05.08.11.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 11:46:42 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: ukleinek@kernel.org,
	thierry.reding@gmail.com,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	manishbaing2789@gmail.com
Subject: [PATCH v2] dt-bindings: pwm: stmpe: drop legacy binding
Date: Fri,  8 May 2026 18:46:26 +0000
Message-ID: <20260508184626.15938-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_114645_031939_46A52ECA 
X-CRM114-Status: GOOD (  11.75  )
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
---
Changes in v2:
- Drop the TXT file instead of converting to YAML, as the
  functionality is already covered by st,stmpe.yaml.
- Update the commit subject and description to reflect the drop.

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


