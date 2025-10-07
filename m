Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD26BCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 16:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7Cm5Dko9olaR4ZjBSYSeJvT1TaV6qKnd54YvU1t3L9I=; b=rBr79NAULxLy/SAP+yPMm4uysH
	Kfz+CacEgzfeI9eoN6q4YTSaVWE+aHZvR1pMTWI2hNvA0auC3wQYYzM//jf/Vu6R5c7oG+VyGVU39
	ysHBIlU8iM11N9hZvV+vDqizxK5xYeNNEizuu0ALZ7XwiXcNsTLgy/8R+Ig7i2JVQyVaeT6qXXudg
	neGjKA5yWECdJdWQulVqnq80tbXouKleRRTFWfu63gQ7031wrD0ExHm06eedGWv54pbN1zUF9FKfX
	Soocf0z/8XaheiS2gLZXLWOb4yJ7McG/diAwYPUK3Y5za+qG3oL0ON+lKAXGNk7edfmX5EeM05aZt
	KDmaRUZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6A9j-00000002Lfw-2JeR;
	Tue, 07 Oct 2025 16:03:15 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6A9h-00000002Lf6-2KPF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 16:03:14 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b3e44f22f15so960246266b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 09:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759852992; x=1760457792; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Cm5Dko9olaR4ZjBSYSeJvT1TaV6qKnd54YvU1t3L9I=;
        b=EHT5xwSSHs8OUdLQUzVpw9qw4H+9JFvovtbaZZTkSxHw7ub7Wihna5k8ZvTVPpLVhz
         ATdhtiS304xVSOzVAb3uK36ydM8qp+NTyG/OkO0Vt08/VcFgJox1CFIJ4ONHiIoTyiec
         mVHNsQTNVCKJXLgQZKsy6sFEgErhnAuVhjMV/fLs9/ifR9m/Xi6hk7RwMjPjwBPxNXRF
         HHLK6FYIgzK0pqw+WjmSTgs5yTxZc26J4noFu1XxGGl8vtWy6xvnnBpAYh0lWrH/n+OU
         C+yep5xVYCVXWZDpH4oQJxCHzxq+gGU1sThjiE2wTrOCQpXEx9BZZmJMQ+a0x4Qyyyvi
         HGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759852992; x=1760457792;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Cm5Dko9olaR4ZjBSYSeJvT1TaV6qKnd54YvU1t3L9I=;
        b=NkkA3zhpkiilNwZXfzpeLGOzilnA9rJtoqZqEx+9HrmwW29BYZ3vVdelRWVYYwUmP4
         3va6CK9WYsjWqTXrwPYnRgTyet62lghkRKQp6G+NGnzwUTXvbh+NbNyGbFllA9jpQxjO
         kM4L6Yq7Ow0KiJ81V7HYlty9tfnHv+JfF2HpiIp36hNc6AcOIGG4AikNCi/RKikzkAJW
         HupCGgsxmA8INRELfAvx0SKvtdEPpMW1Ttu2MZimvEt2LsgrUDUk+QltXf6TNJFGvbhp
         Lxa0y+5o7uFS8mkA2fyrUmKpsW5mZ2PTqcBr9IJJ+f698Q7zJuSMPggi4dK4wj+DeVHT
         gpVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUhHzi3vbOx3zVo0WhG9j901DxUEkaBILXNZuXlBarf5xAbKlo885ZfNGyhD/QFT/Zm4F7s0vPAGhRb6XU3nt/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8QCFcuRLUk5Eo6kEgIQEd6WBDc4GQLTQlvw4b3pafmKDzp5oc
	B5BJ+vF4cczc3nST1oi5GjFlXk+kVs9jZTbhY6tcAbIqqiinE5Vpo+/8H5TlqILQw+c=
X-Gm-Gg: ASbGnctdKEAkGgnxtf1zJO3h1Zah4NOGHD2hgS+1x3gR+xK4p4KG8Q4SSnC9dBtZaye
	vCGiuC8sg9YdDspOjrpR7UR4F0hHQ17zWi+QRzAUWbuIUAg1eoq/9b+Uebe/TCi5aHkro+oSKjv
	SuQjBsuXjHwg4wQsFVFlQyvmdhiolCzbulGMUU2JlxGzCPd6pSuq1dL1Pi9s/ul47MzzwV9wrHw
	OjjoQ6Y/VeZC0wMFzjmGIqXVpMX+8VG1o/t86A7YaArCr99AYewZI7CHBduOa75uGQXlgfN63mF
	6901/V9R6j8xgjxqCT6zKePmhQrzzbJrr8vDiqN0Gr0W0yY8PlM/FSkWhWsc/BpMvErCTesT0ki
	jAjV2OJzoLksW6wSO86So7a2DBFGI509c5MdooNH4zKLW9P5U3kzCuayOYJ+NuhOwZ5IzdeODs2
	YwiV3xiLT1oHenS5nCQEyyNTpKMKSyo4SO0Rtv94Hk
X-Google-Smtp-Source: AGHT+IGcHy/Jl0g2LAmEkVEntCtICg9hZqb+cVzIJexCEPogdkyReymHfPrFtWwic4ednSokiuHGag==
X-Received: by 2002:a17:907:807:b0:b41:f729:77b0 with SMTP id a640c23a62f3a-b50aa1869bfmr22271266b.21.1759852991654;
        Tue, 07 Oct 2025 09:03:11 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa637sm1399772566b.12.2025.10.07.09.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 09:03:11 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 07 Oct 2025 17:03:10 +0100
Subject: [PATCH] dt-bindings: clock: google,gs101-clock: add power-domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251007-power-domains-clock-google-gs101-clock-v1-1-1ee73c453ba8@linaro.org>
X-B4-Tracking: v=1; b=H4sIAL055WgC/y2NQQrCQAwAv1JyNpCsqK1fkR7qblyDdVM2oELp3
 13E48xhZgWXquJw7lao8lJXKw1410G8TyULamoMgcKBiU642FsqJntOWhzjbPGB2SzPgtmZ+K/
 2gforD0dKQw8ttlS56ec3uozb9gU0JNMieAAAAA==
X-Change-ID: 20251007-power-domains-clock-google-gs101-clock-3208b1960d98
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_090313_612964_4831BD0A 
X-CRM114-Status: UNSURE (   9.22  )
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

The CMU can be part of a power domain, so we need to allow the relevant
property 'power-domains'.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/clock/google,gs101-clock.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
index caf442ead24bda57e531420d8a7d8de8713032ae..31e106ef913dead9a038b3b6d8b43b950587f6aa 100644
--- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
@@ -46,6 +46,9 @@ properties:
   "#clock-cells":
     const: 1
 
+  power-domains:
+    maxItems: 1
+
   reg:
     maxItems: 1
 

---
base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
change-id: 20251007-power-domains-clock-google-gs101-clock-3208b1960d98

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


