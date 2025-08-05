Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E423C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 23:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4IsXbm5yo+rC2+4joemdslWqYWGOkTnUCtwDueJfKEA=; b=FJ+ARAQYW5QG1rF+AglGXeoE8k
	2T83DuxfHnkrFHr44W4CY8EoMS2ZYftbpuGjIitIdbX0ctVa4L3PW9tQ/AL/O4xNGz4sfOjsrs47J
	VVMj9zU3iDWKCCLMtyLBlMheqB0mAmrcbNYMc6I8Od+DG9EeLyTJQfJbWgIav6YWwNJsQy5Ixrwtq
	VikKOxr4aWti8JBwv/WqQnWGdz3DcWAWyfkR6Mw1RIsuGzRpgMF+cotQ0R1VNdHvgQLuSzRNH1xJV
	odmyQzY7QEuZ16Jkybzke2vCoSDGsXnfROnbhHPzO1noF7oo0S7Omt7PB3hR0E7MgGdfRSFttfYkD
	mXQgv6UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujQjD-0000000DxMW-00fv;
	Tue, 05 Aug 2025 23:05:55 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujQgc-0000000DxBV-2qOM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 23:03:15 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-55b87e13a85so6166882e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 16:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754434992; x=1755039792; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4IsXbm5yo+rC2+4joemdslWqYWGOkTnUCtwDueJfKEA=;
        b=XIokM70uIkSDe9wSJ4L/XsQvfxKIGt1gJM0GOtOs0RMMrIn4v0BLFFNqFlikS9XrsT
         fxS9LmNHNzr9RYGJWQqHdLCDG58+ZXIqh4b35pHpsVx6NIYjTMhbMm6OJsf90bTFmzj6
         rzPMgiNcQZc6I20MZiScufAi7A9kqXXNPq3+2UZg918Ou8srXPP/RU3K/8ie7RGWNmUD
         HIqq6BcGqOQ2yXeclTuSMpvPbivelgnljgwmfp/vkX6reuN7vgfnpH4IDQ+53ZdZdt1S
         bch0ESsfs0uZ5bggGxABjlxZAImR9TxJ0d8YS01rsDMwY8QcpW7vEvie6LfRMuiGkrK+
         ng5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754434992; x=1755039792;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4IsXbm5yo+rC2+4joemdslWqYWGOkTnUCtwDueJfKEA=;
        b=NOCr7/kAxwQp5b7LhHUDd4TCqaWr+vltETzRKKVuUY8gOSnXQQlTKl5OyfQ1iXQPJV
         uwxtulSghz2v7SYgkY1rcyxx0Xe3S3RHI87Z45e6q613bw0bY0FDRfgtPdQrkseDa9a8
         RwgTXDYBXGusAlP0GNjQrTgN7fJap80RcGbzYtI6GH8Exm1Du3ZBoBR7uVTthKFqC1zc
         O6dA71H7kpEDVlqWPkMs0axf/pC7Q3HSU7db42ybzYx8ove7/A1GtfHr8HrTdyUE3HND
         LWXjv2VJXX0gwfxY7w69iwqtzyNNmR935pI9b5NrpSLKYUoad07TcgU9p+hpc760c4Mo
         qUdA==
X-Gm-Message-State: AOJu0YxicON4dUmkHlhoDYgqX7TG6h0YtRCC5JBWtLJ+9BbLLzxhHfaS
	5J2/x2x15BZ8hAbxLf5eawgWJtqYJ2Ebqd70K0Q06ZlZlcMuOh33T96pWV0Zf1Bh6lE=
X-Gm-Gg: ASbGncuRh/RLsbh6nnTgR5O427ASFf4AAHWKKzeYnFaVLbGqfZ/n7V0lwPqflFGZZbk
	gd4jdAPZbQWOIgPutipNeDWWP7KwbkTWhOQbkUweC8KB1hxFtQIeTqT04ybvH7okFlPIHV5g3mH
	3SrzY8ICyoPD4oZZ2i9x4KKzifc5Xy4zpQj2Sp6KLBHpHiLaOV15CWlZEk/t2JVd3auW5+CC/gl
	TgaWMTy+Y0M1hrBjNIcCSUdxOJytx6ubl5o/S4jyv1LIGuZtOF5pzNf8mDx3AbAisKyZm0HZdDC
	OSGYmeVkEYs+6hAqXsmuXb22IVmgQ7y/a4VGVsll3PSHGJi1WRsdoe3BCLhvAZMusqxnkpDN7k5
	GIqKIQo/um1TmOxJSW9y49dDg8pQooxdr
X-Google-Smtp-Source: AGHT+IGfn42ydA85a+Jfe5rnq0i6T7H9uPV82V7YxakQ0JK3kzkY8Uloi4eXTZz4QmUtme0YZNeb/A==
X-Received: by 2002:a05:6512:3b20:b0:553:2e42:fffb with SMTP id 2adb3069b0e04-55caf5d7f5dmr124807e87.33.1754434992168;
        Tue, 05 Aug 2025 16:03:12 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898bc69sm2140683e87.29.2025.08.05.16.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 16:03:11 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 06 Aug 2025 01:03:08 +0200
Subject: [PATCH] dt-bindings: arm: Spell out acronym
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250806-aem-dt-bind-v1-1-d14676dfb027@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKuNkmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCwMz3cTUXN2UEt2kzLwU3TSj5FQzS9MUc0ujJCWgjoKi1LTMCrBp0bG
 1tQANKqemXQAAAA==
X-Change-ID: 20250806-aem-dt-bind-f2ce695d792b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_160314_732610_CA5AE5ED 
X-CRM114-Status: GOOD (  12.06  )
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

When I authored these bindings I had no idea what "AEM" stood
for. Now I know: it means "Architecture Envelope Model".
Detail this in the bindings.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Maybe this can be applied directly to the bindings tree, I don't
changed this document much.
---
 Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
index 8dd6b64463943d5610ee1618a494110ee09d322f..89298b39903fd8f0b85004bbee64df44e365b5d4 100644
--- a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
@@ -103,8 +103,9 @@ properties:
           - const: arm,juno-r2
           - const: arm,juno
           - const: arm,vexpress
-      - description: Arm AEMv8a Versatile Express Real-Time System Model
-          (VE RTSM) is a programmers view of the Versatile Express with Arm
+      - description: Arm AEMv8a (Architecture Envelope Model)
+          Versatile Express Real-Time System Model (VE RTSM)
+          is a programmers view of the Versatile Express with Arm
           v8A hardware. See ARM DUI 0575D.
         items:
           - const: arm,rtsm_ve,aemv8a

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250806-aem-dt-bind-f2ce695d792b

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


