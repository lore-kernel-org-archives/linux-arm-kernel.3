Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E20F8D778
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 20:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSDzJLueNM5BDkJGvQ06iAymY05gESKPpDr8vISvvJs=; b=d9aaNrsxrl1lT0eA69vbMapBFe
	3sBD8G8yhRAYPEtkOKpW5/XzA2L7JmY0iyYTNfkqz7HNATjky+JhJGLOrD6vHWsejukE6nRNfeYhp
	RW2wtX43XbuZm2c//JmrwgKmh7b/YWMoqhfsBGhiP/8Muc0XOYT/UXjM8hl02Nev9BjCQP//351HT
	7LhtQhMClt8SMxm3DvSkLXKDLV/gRXVGh9TEvcwBDtfqk4Ny2AtVBiqAx6FvTQAo4AJiCEFi7pENI
	ih0J/JFw6xdRU4mblPE9TwWAgKDJPDZRuDSzyceuchVARHuZRewnwp8aZqwhfGQE+FstV+OSHw7tn
	un5I7txg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDTBf-00000002xyL-0eAf;
	Thu, 16 Apr 2026 20:19:43 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDTBc-00000002xwt-15Kl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 20:19:41 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43d7650202fso3964263f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 13:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776370778; x=1776975578; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DSDzJLueNM5BDkJGvQ06iAymY05gESKPpDr8vISvvJs=;
        b=ogY3urOzJJdDnn3A7uDP47cOyoWgNAtjPCUclyfZIplkEmLryqz2Ys2T40+wGgh0ac
         480lBqNrrJNf7J5mTjQqBwhwkQBMKYCLsHqioS/P5imNUjZEUF9OtkiT/Z7kKzZxbTh3
         hF6Ird2muVpOwQJ6E2rbZ8RPoV8gU/IRm0b0nvNx7+ZtG3hAdEx8aoI/IhJ+XS4cTLhH
         AS7C2UVXExUqHbIpce/qjePop/ObeTISANZTLXywfWZ0leYuTli2touNraTFoVQcvACG
         WQgEO4jn/BN+QR9Zl9n84LJFLkBkZEYlLflSStfI7nNuoayJuRtiY7gaqcIzn+CBlGPU
         8gNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776370778; x=1776975578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DSDzJLueNM5BDkJGvQ06iAymY05gESKPpDr8vISvvJs=;
        b=boPUwW+NglOSdBGCoRIvVXIrulJfXFV//SpRAOInfV1nGtPR2/fQKdpgzdycrQfYtH
         oiKMOu+sFL81AGZenDw1Y1qYHSRCs/oeyJGyJ9SUWy5q9YZ1a7NCZpC14G3T35HVEvMw
         gjYUS/N1d0DPj1XVVl87R2SU2g0sPvfQfSUDdRWMiW4bk4flFEw2r2h3g2Bvt02o7RB2
         NQ+q/VBrerB98JQ69QT8gwHaRanF/K6WuPBOXLgUpZI2jaLLsdnbhg69M0yCWQX3jqzy
         vrHEP2o4o+ouB88TiQunxTxceaj/nkONZN1vQa4/XTSUNcqWDrGjzR7QjSgJ72rR/oMA
         PhCA==
X-Forwarded-Encrypted: i=1; AFNElJ+9C+McZJjyMx9RZKDGVpk82tJ1CsPd7OAmBYezKTTxUWEW9agqfJ7qKsDnJheKMjDqwSD1lfYfveVV+rCphu6s@lists.infradead.org
X-Gm-Message-State: AOJu0YxytTUXtTv2wS3ooxxdD0imwNjV05d3Xi4K3lTgfRc35xZfi2Y1
	tKQ1GwDjqSbGSJ9dG1cj3dwvFYeSeJJF+53jZqZsp6UO4i7d7/i/uPj6
X-Gm-Gg: AeBDies5oR5BBh/6/zBkVMh/hO0LGs/Anarf7701Ve6V3BinyHSsa0UiXCvyR+hXEz+
	clCGEnGNqZ3jvPoxe3kGDL/xGoBUqCU51Eo5oyorOR/GW5FdneYCx7c3BaPkyNHVw0brsLn+aJJ
	ea/e3T2sIQrRTloXC/Dn09INNX93kt5zpXgjYz1iCSiZhDUMXrlVwcx9yHxsfneqdxUoMKXdL0Q
	WlkIXpn5bhndEp2+EvSsmRaE1uE+0hbIAChoUmy/0ZGQB3nGALPpkS+aJO2j7kE0ha5HGUyRfUI
	hw/+zD3TDVHp8Rjz+5TQV2j0mW0UV+epLofGcO6rlbb75cJgsydAHHGqoCBl46HOYiN3+q/tOEy
	P2SmKKlHtwY9pLinBj0Qcx+JjqO/VVyExKBUFB5nYEG7QOMJu19Pg1SRkARtBAoz1DsU5FxI3mH
	u7AcxAZWhf46klDwYSkcJB/GCvmBYLX3ZpOq4Hfpf7g/KBcQ==
X-Received: by 2002:a05:6000:144a:b0:43d:7854:32e7 with SMTP id ffacd0b85a97d-43fe1392aecmr1108057f8f.15.1776370778227;
        Thu, 16 Apr 2026 13:19:38 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead35c026sm16180624f8f.15.2026.04.16.13.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 13:19:37 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 16 Apr 2026 23:19:10 +0300
Subject: [PATCH v4 2/8] dt-bindings: arm: Add zx297520v3 board binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-send-v4-2-e19d02b944ec@gmail.com>
References: <20260416-send-v4-0-e19d02b944ec@gmail.com>
In-Reply-To: <20260416-send-v4-0-e19d02b944ec@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=46b0d4orT0aFf/zmndY3q3fyMYlikWkR7T7rELFj7TY=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp4URKNXItypZCu+0613kDJOV5XH377NxspoqvX
 ektAEKCaPqJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaeFEShsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJTsw/+OzuVq9TxsOikjXZ/JIJLrvVQWw4U3G4
 lFVXZwrJ96neS2IhLYGs5ckWpmoublfmEre09aaZ6mKnC5jENPA92KpELewz3m7NDdSf8PJvbfF
 fMWoLHL82F9gFJNMpqu5dOpRmpqrTcx8d/iXRl/cmiFyE0D49uPMWVZpjIrcky4fKIbjYSDGGs6
 Vm3r5QAtjq5nflrL/acVTVNWrPkTRkLFDxntlj2iAHJFeI3l3Qh885HR83Rq6UflGUB3QoyVQ/+
 5P4Z8FzAkJPS8kWxP1OjcexDP2dD5t/QniwflyHIBkFaPV83mjcsU9OZQ4f4m8KuhwUOtPbeVNX
 +7bFP7dBC7nKrl2x39Ab+Jc4QXhYNprHJUPGvYelRsGyDdcgSII2xojIKlJ/riLl6G049StRNB3
 0EtIqw7Sfl+oEbVV7vpNquivq/rNc+Mo7Lv7GSzPEXFYJOoxLD8XgyBE5A6HNmyVy074XADzU3H
 tEBhks0B7h2rIetyIxQ4GYzdLlSTYYt88zeB209x/Bi9m0E4QvGR0J7wUJEzpuqFazRexblTE4+
 LHts/uYe8HAs4GcQszFFyxZkTpQySVAvBteSAoma/TDumkjdBZGcq05/icfPJxAeJg62oGYzSwO
 S0QBR4ZrLatyv9ivQBdfS5kVWx7zTF6Q/1/BQq5Pd3M0+CzMiCmw=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_131940_315961_CC175884 
X-CRM114-Status: GOOD (  14.59  )
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

Add a compatible for boards based on the ZTE zx297520v3 SoC.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

The list of devices is the devices I have access to for testing. There
are many more devices based on this board and it is not always easy to
identify them. Often they are sold without any branding ("4G home
router") or with mobile carrier branding.
---
 Documentation/devicetree/bindings/arm/zte.yaml | 25 +++++++++++++++++++++++++
 MAINTAINERS                                    |  1 +
 2 files changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/zte.yaml b/Documentation/devicetree/bindings/arm/zte.yaml
new file mode 100644
index 000000000000..6eba09edd2c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/zte.yaml
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/zte.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx29
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+properties:
+  $nodename:
+    const: "/"
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+            - dlink,dwr932m
+            - hgsd,r310
+            - tecno,tr118
+            - zte,k10
+          - const: zte,zx297520v3
+
+additionalProperties: true
diff --git a/MAINTAINERS b/MAINTAINERS
index 974d7a98956a..bcade90ca14e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29202,6 +29202,7 @@ F:	tools/testing/selftests/cgroup/test_zswap.c
 
 ZX29
 M:	Stefan Dösinger <stefandoesinger@gmail.com>
+F:	Documentation/devicetree/bindings/arm/zte.yaml
 F:	arch/arm/mach-zte/
 
 SENARYTECH AUDIO CODEC DRIVER

-- 
2.52.0


