Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6686E64A83
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mWpaKqqVYEb45LFrVAOE9nPtLWbHCab8i1TbI6jQ3+I=; b=bIXUpAmoV3ANrsFwwnTYDhv25Q
	2gZjQreUbn/OkXrlgN2oVF3K+pqlox2DwYDgM/fdUKB4++GnJkV90+w5usymQBFADBC+c9J1f/FxE
	+zEytRBQSi8e/R+/DJVyDh0vnPozTm5Mj/XaKAqF2YblvO5J4gXQrMp6QVBjksdqblnVDXmjGOpFe
	7NENe00dPzIDwnLc6ItXAiv52jkndcqsQ5NHMhtZ3gwqPhF4li6usXl952lgDoK8FEHRqbeNFr9pB
	7GCmdS/BPJOx94idScpox+LKXuhsLJy0PppsUF3bLK1/pSnFxVUXjFHT9fg9AH0kWp/RivCL+cyF4
	kyLKw0kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRpp-00000009OQr-0JUY;
	Tue, 03 Dec 2024 12:16:57 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRmr-00000009Ndq-3ZVP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:13:55 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aa5b0d8bd41so679993766b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 04:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733228032; x=1733832832; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mWpaKqqVYEb45LFrVAOE9nPtLWbHCab8i1TbI6jQ3+I=;
        b=SLGj/sjfsfHHDWHLd0GtXzsNkAcoR8XeuVHppQHuUaugujPsbVqx5XXmXfVya4+PnR
         AzuXbxRqwkrp3BNmp5NNES7xuioE6HC2uyqnxJjgYg+XSJY2PUexZtbukLANKAXF8aWG
         Jq9RS1jUiDn4+3K8xdrM5CpFLczE3zroHDbmktgMNcDWsyJjYMlcwpM/DTNgOJodv4PM
         4h5J3jxRbQfbsN1y4bIbT0dwvHhklg6oVJCS+Of89ztLAug3DDhsnGuf1lJwvjvdPrxX
         /b8rnG0RszKSSy1lGC+w46Ve5kdcN/K3hTeF8ktNmMigf5/PrgGjdhO8umrOYAhUjGcW
         P9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733228032; x=1733832832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mWpaKqqVYEb45LFrVAOE9nPtLWbHCab8i1TbI6jQ3+I=;
        b=p/5UssVcmR+yLErF0QkX7YNZVbyZzZVpJIQaEkTiUd6hrx3KHr+dr1O4Aa3cXBqgCq
         PcPM+Fgkj1w4M9GUe6nKBX6Al2s6rAuw2BkWggfvQATBAnSR+69icb8zeg7OAWRmZLDF
         NtT2AmiDHek92jS0/PDeMUfrbY38MhPMrIvt6+ZSiiPdBbGvF9b6EB8m/AZQ6jg1itYc
         0dvp9LJ/Iir3koQgM/9wW2RiaPZBfzRezcGII3WEfXeWV5wI08jP/p+XbnbZghiqeYAe
         sI87ro1h87s2kWzq61LJ5HgmWEQ1EidfkS53MJKs7yjMdeSmCNs/rPy1K2nwIQVwQMfm
         d4uA==
X-Forwarded-Encrypted: i=1; AJvYcCX68TF5sBVnhrZ7LMGMGbTI1crlSPBvfDgvJ8xjz3lHjbAPmbwpnj22vWpgrnz+uYqRhWnr+ce7CrP67ouL5U6I@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0VXxo3B8lhFcEXd/KmpzntYIi50rq87ta1TygAMC4MGEvi18h
	9i3F0NWuPvKdLxNtWLaz7KDnI3rWTtTxYBFwKf4xer6N2FIogrez86eiS01zB1g=
X-Gm-Gg: ASbGncsuY0hXJSTG1Bt7HcXkLDgHR38LXiGZaRn1b9/5CPXs/AdEZuVomt/OlqZTr14
	ynZ0q4fSijPpCbAEzih7cbj5h4rC9XAQ6RIXDHbOWrDOfzGmgwuP5Vf2BL8cebIxYlM0bVvFB8r
	yv9jV9rGNZk5w8cdQZfWSgXLacJOStoCrBVZROqcCR9w30hSRgC0HpUb+cgypyUGHBAkvDaUEy+
	Ou32IA20/FQXsPCC64/UG9KEGRUWnx+FwplqaIvkiEtEsCq/W2RFOfXJTpfiaRJjpV+9wVfyPnn
	laFvnK8LWqCaPChhfR7ghRyHYYXBjxbOPg==
X-Google-Smtp-Source: AGHT+IGn4eg/NfZJAVu0hqE9cK2q2j0R5oIme9rHukh+yJlN3vdSnhKD++AzSGAOtBHFlLtbaiKfNw==
X-Received: by 2002:a17:907:7632:b0:a9e:df65:3a81 with SMTP id a640c23a62f3a-aa5f7f4f3bfmr155819366b.59.1733228031882;
        Tue, 03 Dec 2024 04:13:51 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c245bsm607603766b.8.2024.12.03.04.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:13:51 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Dec 2024 12:13:50 +0000
Subject: [PATCH v2 2/8] dt-bindings: phy: samsung,usb3-drd-phy: gs101:
 require Type-C properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-gs101-phy-lanes-orientation-phy-v2-2-40dcf1b7670d@linaro.org>
References: <20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org>
In-Reply-To: <20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_041353_888716_F47764C8 
X-CRM114-Status: GOOD (  12.53  )
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

orientation-switch is the standard declaration to inform the Type-C mux
layer that a remote-endpoint is capable of processing orientation
change messages.

The USB PHY on gs101 needs to be configured based on the orientation of
the connector. For that the DTS needs a link between the phy's port and
a TCPCi, and we'll need to inform the phy driver that it should handle
the orientation (register a handler).

Update the schema to enforce that by requiring the orientation-switch
and port properties on gs101 (only). We disallow orientation-switch on
all other supported platforms, since other versions of this phy (or its
system integration) don't currently support or even need it.

Even though this new required gs101 property is an ABI break, the
intention for the driver is to behave as before if it's missing
(meaning for gs101 it will work in SS mode in one orientation only).
Other platforms are not affected.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* squash original patches #2 and #3
* actually disallow orientation-switch on !gs101 (not just optional) (Conor)
* update commit message to clarify that the intention for the driver is
  to work with old and new DTS (Conor)
* collect tags
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 1f8b35917b11..c1d16254aeec 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -51,6 +51,9 @@ properties:
   "#phy-cells":
     const: 1
 
+  orientation-switch:
+    $ref: /schemas/usb/usb-switch.yaml#/properties/orientation-switch
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description:
@@ -139,6 +142,8 @@ allOf:
 
       required:
         - reg-names
+        - orientation-switch
+        - port
         - pll-supply
         - dvdd-usb20-supply
         - vddh-usb20-supply
@@ -146,6 +151,10 @@ allOf:
         - vdda-usbdp-supply
         - vddh-usbdp-supply
 
+    else:
+      properties:
+        orientation-switch: false
+
   - if:
       properties:
         compatible:

-- 
2.47.0.338.g60cca15819-goog


