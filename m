Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A3ACA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 15:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e6lU5THDhGfH0NkCBr9PUmiRxUFviaMJiioV8NyaxaM=; b=b0tAxpLTNjzdqMJFlIiizV0DKQ
	RiVg8wkjyUGc20NAg8qzZEIhVrug/Vo2x9sND1MYoD5UBJKocBk1MNr+AsQU3KEN14b3A+fgvp3/U
	xL35/mq5JaaCCzjBBs+3YhAgOumTPHfRJmgMMFLZ+lGqsJuTb7UPd8eOXnNSUppNPBjKGUhpOW6g7
	okUSQ8HCNavTC5EFSh2ZLf/CXbSJVRgiJdwP17LOvk/fC+TkoZ0rdVUPsb2YhiLuIviyWQn5tRZYw
	DAyFm7Ac1DfTmLoYgPXMjEMflBNuLQobbcTQY41Y+pbiaxCgxWimeoyqhAh4UK/T9uqcPErloFdGy
	wSdXD/vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYYP-00000002p0b-4Ba4;
	Fri, 05 Sep 2025 15:40:46 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuV6i-00000001XHN-2fRO;
	Fri, 05 Sep 2025 11:59:57 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-772301f8a4cso2748970b3a.3;
        Fri, 05 Sep 2025 04:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757073596; x=1757678396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6lU5THDhGfH0NkCBr9PUmiRxUFviaMJiioV8NyaxaM=;
        b=Z6Igl9g7fLd8lhL2AmnFktTnvZWu9Hs5i43jDkCf/nWgQk2bSSsLAwLoNDhzxW6rnx
         H9VfnsF1sTt6wdK1yIsZbHIn2R1FeyE3ycPgbDuTqMNfz39SKaNdVi8KJ59erIYAu6hz
         3W1eNJBLz0v4B1dLyZwJtJ0l+QM435KVE9P2MM6Ed2Q5Z5YbcyRnXbpA+BfZ1x1hdAql
         l/d9TlZsWdpBhFQLNuhcaw6jtwxiDmo66eIKzf3V1Kv+9gOGntj8ctwpw5ariHUNVfNr
         5Wet5bDmEY/fMo0f9YzAOhcsDJBKvnKjRp3djEfT4Jzrj//4GtyY6uNmmZNGIXKB51BB
         cFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757073596; x=1757678396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e6lU5THDhGfH0NkCBr9PUmiRxUFviaMJiioV8NyaxaM=;
        b=Y+0dnCu/IpvbOuoKkl+qGpHsrKq7zhVd4y8Bywz9+Cb3uaAwTRulqOh+soBYTvpnr1
         hgIYfBjyM2+E0uKCzXpPhYBEFfDKwVXsTySi3FmkhRlT1sM52DqZ9hv4ejyFBf0nRKlo
         PB38R+aBuOJdQ0XRa+4dY6Sumngy0vMPRVqnMmRJFHfw33qlc1RwNJDbXfvIPknj8h9m
         +y/4XTgfmPz7tCoUmiUejdFBSd2WETgAYy9FbTR+jjrQYJBhw609/2zJquTKI/tUHuH3
         o9rURVRoKYmGb/iezGSMKne/wHBbbaxEZ/HBkMdSp9etaf3i94KuI/zLjZopcZk215dJ
         ng1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfclPzO9VG3Fr2uqCmuIh2HXsuhLsCNmgOfhGiD5Ga6rIboh4mKBDO9O0WoOK/Ost4/s7s7YxwRAJWAnI50PzmWA==@lists.infradead.org, AJvYcCWNIzfJjeL2qtm2mIDsxUKVyuh4hpk5BC606uQ4FDc/LcoDqcCP9wIfc8JjT0LU5PIzcuhyR8/Efh3BLfiJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwFEG4/yn9YUu3pztXpG32VSxBXErdMR5Nnv1/TZnFyc6HkqBEE
	vJHdjUourXTm8l3RiZSk7UXVbH1HkCZvnptjyzuq9r5ZKg81ig1NfNRT
X-Gm-Gg: ASbGncsfW2C413aWfMflBObPA/MNbWaBgOByjfVm7eOx5zkaKZna61RAr5VsaaJPWGG
	tRxsyZtUVJoM8pE2gvTjEgSdXxQ+Aq3Zixwlpha63zQpNX9KVKKU0c716Pb+dX3XxRg94HZU5eD
	emGPqcllzdyG4mZ/qliFdolo1mjpR+V3c/CHUgP6E9DKgtVmAuiECJLmhyOAemMMx3vC9ivIyZg
	5G5GEOGJd/M4Wt0Po1pz6rI+4Rvw2tfm/LfzHWP0vJRPxkGPOpuFDQKdfvfW5yVcRhj92b30MFM
	5oasQtxn0qrmu2+XR5BXN1fZ7Yj4rCUyqO4yKA8Ogh2gbCTRJV2prFLh51D8JnJup3ictxhQLF4
	f1Qulo8gh5RR9657JPrWV1bL3/bvd4Ws=
X-Google-Smtp-Source: AGHT+IGDRRzImt80hnKOwjC3oy3EHzVKBpOPyAHYFUXou++MQpCklyjW9Y8n+lPlMxc25VtzMQ+L+A==
X-Received: by 2002:a05:6a00:114b:b0:76b:42e5:fa84 with SMTP id d2e1a72fcca58-7723e21e9aamr25229563b3a.7.1757073595856;
        Fri, 05 Sep 2025 04:59:55 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772396d2b97sm19633049b3a.67.2025.09.05.04.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 04:59:55 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v3 09/11] arm64: dts: amlogic: Add cache information to the Amlogic S7 SoC
Date: Fri,  5 Sep 2025 17:27:40 +0530
Message-ID: <20250905115836.7549-10-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250905115836.7549-1-linux.amoon@gmail.com>
References: <20250905115836.7549-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_045956_673839_639833E3 
X-CRM114-Status: GOOD (  10.38  )
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

As per S7 datasheet add missing cache information to the Amlogic S7 SoC.

 ARM Cortex-A55 CPU uses unified L2 cache.

- Each Cortex-A55 core has 32KB of L1 instruction cache available and
	32KB of L1 data cache available.
- Along with 256KB Unified L2 cache.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 36 +++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index 260918b37b9ae..d262c0b66e4b5 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -18,6 +18,13 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2>;
 		};
 
 		cpu1: cpu@100 {
@@ -25,6 +32,13 @@ cpu1: cpu@100 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2>;
 		};
 
 		cpu2: cpu@200 {
@@ -32,6 +46,13 @@ cpu2: cpu@200 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2>;
 		};
 
 		cpu3: cpu@300 {
@@ -39,8 +60,23 @@ cpu3: cpu@300 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2>;
 		};
 
+		l2: l2-cache0 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x40000>; /* L2. 256 KB */
+			cache-line-size = <64>;
+			cache-sets = <512>;
+		};
 	};
 
 	timer {
-- 
2.50.1


