Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0403EF94CA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 20:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4tyq+WSIvSiZYRnXDISsoYSiwaAwPd9Py7g+QKilzzY=; b=jAuYkZywZYrDwhWMjFAaaQ5zpM
	qz9UT6ubyjVM5S53fhyJtdd+zccrri3zgKlXNtwIRInCRw81FWc3nHilALzQe5ars2BeYR4EcTRjo
	Eiwp1z1S85lei5nNFqoUJBpTwLHnKnZq9cMWtN6eWk+6Oh5hSscDeUYyP2EwUNkYZkoTdxATBLDCS
	PYRD9rG93h4yX90NeZCz33aw/rTdjEh3iVU2qTJEUhmvH62B2RDW/v7GhkvN2+qr1bnf00Ds8icrC
	4YaM/X26z4fDQ40UwnFU7zJC/s00jaNRIHPKRpcve8JXipm+7tJxY+N1kJH+KgPC5ZECAgEzkC4N6
	AIRk+F5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFHdj-000000097nO-2m7u;
	Tue, 21 Apr 2026 20:24:11 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFHdg-000000097lW-3xtw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 20:24:10 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so76196585e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 13:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776803047; x=1777407847; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4tyq+WSIvSiZYRnXDISsoYSiwaAwPd9Py7g+QKilzzY=;
        b=LYsW6cWf5unIF59laN7fspV/FvQSNrRA6gq5L+tZ82AWhhRgI9mOEcm8EbYzVUXndb
         f1B17I5Fhf5iOIM6fAuTDrzreZZkq+J49FuW2GCsWObzyieo9Wfr6DhIsaLcz2rQVj3I
         clVpfKF7WRuxIamcHyej+bw+vW/OUu7wLPeXoO0flvmaYVoCVzDg1y41VD/8lcV3aTaV
         m4tOuhShWxBe0uXm2Ckb4mghLEArf9Ut0WNENWJO6r6IkL9k4+GSyuV5NvDq2+K+DcFP
         udjuhT2FlFyi6wfyn35nd3w/5bs8P6VO3nUmgGrn2RagvaKdTv656cewCLyaY4bf18Xq
         ZTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776803047; x=1777407847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4tyq+WSIvSiZYRnXDISsoYSiwaAwPd9Py7g+QKilzzY=;
        b=rk3N7QoCkzoy2Dkr+sdT8wCC3sF9x4Ro0ABQR2P6stNoO6SIAKF30CAd+AZigmUlfl
         uRWAUxWVFQcw0shEZYXgawbSTbfSgrDkt+0hZ8kqHdkHH61U5vCrxgNEAczDLaAng6mf
         fTNOBpiU7Sm+XA81xG5PZ5uLZNnFsDYIrWmBwriM0vzOpoFhMVv9BG2Eqepy2pHiIqHp
         0cthWHDa+8CXsI77LAWV6gl21ksAhIyllXkaOcOzbudo4Vgw8bIcfCMPrwHYJHsp2mCk
         SVQGkx3bhDWSYXSb1arKeZ3I7AxdZbOlTGaZAuTEOeLOgh4tdQ9f+YuU9Amjn42DJxu0
         AeyA==
X-Forwarded-Encrypted: i=1; AFNElJ+8+38m8QFKk2jP0eM53wX2ImbLyuVL1mxtxcIsbvVJNi7bIc2fVf2xtVj+36JEg1SJyANyr7mpauDcAuQYfWcD@lists.infradead.org
X-Gm-Message-State: AOJu0YyzZgWoVK1TqtJx/0EXiNzkacePXRvY4QR4Et/3Qrw4KQnM78dg
	PcIahHK43IaYX0enW6aK55i3KrFKNBhPQFQ/1xzM7wVihk9YvCE5mYif
X-Gm-Gg: AeBDies+tpxKzuI7Etha/KIlfHXjHjVwc7fxBEzkoQXgbqWi7aw02vtXBkwAhF8ygU+
	BRg0zBplJ2prHRND3pgbGp0Rf++d/XaeK9vEdBMb8xm0IddxkBv6zhZKoQmu6LenhIPR0cxyzig
	1IyYp3J7UBEVAekVckghE7kXjptVxgi2UQ1ZZqxc37evD7aKVWaR3kCCD4X3P3fD5/yoadjH9qP
	53eojJ4rHBDQiG+iPWaFpCiKOR9ak9sOCs7BREE1+GdOGkaapkttpvGC8KVBwo+PDUwmXQxB1+0
	GzqdHUMBHs5SnCBDMB3T+sZu0xDCvj396G28tsEwS0Tj16KjTOoZZ6g0UZyD+O0ZxNkS8NQZJTB
	I0dkdPkAjaTVPoLv/aDsYcqYj0GsfdStOhiidKVOvkR6y0gACCzhYKh/KCmvY7meN+8VPejtwft
	kwOjcSHoi2ZJzoyCFHf3bjfjudscQAdEjBGR1ua37ps9Gx
X-Received: by 2002:a05:600c:c4a1:b0:488:c014:34da with SMTP id 5b1f17b1804b1-488fb77ed1bmr266248505e9.26.1776803046853;
        Tue, 21 Apr 2026 13:24:06 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f82bbsm655989805e9.3.2026.04.21.13.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 13:24:06 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Tue, 21 Apr 2026 23:23:10 +0300
Subject: [PATCH v5 2/8] dt-bindings: arm: Add zx297520v3 board binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260421-send-v5-2-ace038e63515@gmail.com>
References: <20260421-send-v5-0-ace038e63515@gmail.com>
In-Reply-To: <20260421-send-v5-0-ace038e63515@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1772;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=Jlye14C712QdplGoRodEKGWzEzg32X0cVK6hR6vA/kQ=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp59zXs1flcrAYTX8A8SSVmUw46VloONu4/yzoj
 DU2Ro3rJ+GJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaefc1xsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJ0fg//dan3zyJHker3j2oB+GnI8v2RR/pj3Bb
 M5nD3DtLV7EeicFtPfD1AybCXLNNTvgSpI3LWEA3VdqjVb0GXv04GNe1nLfIfH+3uo0BAxuvsHb
 IF7eVJXsZPdQN+0CcUJbcLqPJdvCTF64DtM/fIzMROPOal5Fd6/swYwhiZ6bzxgWg/cN40LXUV/
 CuX2z2626rg54WbMYq2bjPLaU4L8dOK8Ud+I2/9amJ7xYCzgshcgR1A3N31wdG8M1OQfrW+vStt
 5sdry84nsSzwAw4/EXryotOg0OwhZH2jLPhSTEfAiM6X8Uj16EGgaZg1k53ulcVQznOV1fK9ZkJ
 KUBnbuMTTcOwNSgg+q8Nk8H1i0nKktEKOIpDnuYYbUxVb4MVdzV06O+L1sVXPg6WcqtcUkVLLQf
 JJka3ti1qfZgxGYSZEyzleI13ZioREx6LM0eAzWPPfe2H8s07+TuCuAKxLnNKnN/ou59pxg1o6q
 bpTqL7KEpHPJHc94tHlwT/+Yn1/9sWJAH63fNcvm9Gn0NToAXNeYruFat/PLb0X2NNCHnN0j+QA
 4zDEio5Z6xql+gm7sBmCMDQCgs+QyAP9C13DA2Oc/NUmJwkZGoTTpq0jxa6B+kzOX6pk18QqiCm
 K6izx/bEVkn3dCRPz8nhBw5ONrHoB0z07pw09GX/yd0a/n8Etjcg=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_132409_003689_145A7CBA 
X-CRM114-Status: GOOD (  15.10  )
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
index 000000000000..4b0d6d53402b
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
+              - dlink,dwr932m
+              - hgsd,r310
+              - tecno,tr118
+              - zte,k10
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
2.53.0


