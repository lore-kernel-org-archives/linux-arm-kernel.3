Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB9DCAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 08:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zz313f5+9XsH5+Eb3Bh9XStxpTdiNn9ua8EWNmWWJg0=; b=MY9fz7Qu736W1Fvgd/rxmH5Uyu
	goDFBkw1gGs2DA3vebg+AQj9QxGQDrjWmsFgjDAevkAceJg/FXkYQWYicATcGFGiWbFdC3aDXNj+u
	0q1SgEsdkoXivTCQ6i4AtvW0VKsCtKW4+FOL5G7buXCJdOY72WShtkTcM6sN36u6jT5neWCGJnBJp
	Fysa1mW12rj2XC48LKN+3mqOiq2gOSUNkMyXu/aqb+odbbgYKcs5+nQE6tPUvCw3vL7pLsT+P29ew
	+Wj2FhUg8qR11bsEKf/51bM7leqZUyYdMkEc5T9myGdOjqbfp78uVP8PuO7SZm1rhuxuJkaS08rOH
	jhGNL6TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3W0v-00000004gyc-14Ou;
	Tue, 30 Sep 2025 08:47:13 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3W0h-00000004gnw-3QyG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 08:47:01 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-46e42fa08e4so32335735e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 01:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759222018; x=1759826818; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zz313f5+9XsH5+Eb3Bh9XStxpTdiNn9ua8EWNmWWJg0=;
        b=C7if0bsjKTVX+YbHX34uS0CuHHRxuj7oe8032rS4bzPJaevPvTi9Lw2XBZkGNhdR+s
         qlJYo5gZy6FYMqOChTmEulrYE23ftuwrErgW+f+vMLEcQhaxo5c4uFWJbmibAk+LHEdm
         rk92yeBHvvLHCpedyHo+oAfPA0w45HpcbLULVZq7HR7pfn0EHqhyWimC4fwTdJK9iCy9
         d3eMC0VttrDK1TOznha50qTn431DMeJHiCXgm1zh3jx44C9DRnHhkvZIIIw630q7egTe
         xBaaj9unncCCAiHLiBcQtSBrq184caDYS9mguItqbVdRNwYZcHEQQzoNStJgU4ePOZfc
         hhaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759222018; x=1759826818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zz313f5+9XsH5+Eb3Bh9XStxpTdiNn9ua8EWNmWWJg0=;
        b=uwAKLEiQLb8g4BGdiqetyTy3FF+gNxI92NaH37yD3UygcIS5RmUKxZddjQHvdViVoP
         ZFlke+ikBEkRXUcqTVgMAAsQwP45tQSB65izhP4WM3yg8BeUqXr7Uc/jsdVVhBrdlGpc
         nIQtRoJIu0aEIaLzVe2iWR6O3duANP5rveDOE9Uil6TnYydW0uT3fPW/6A/qEfnT+mi9
         I6fkDbh9q42tw1I8OWY9oxrklew/YrseDxHT12xJ8OfS2FOPqFYMdXx898bMUgHg1fBM
         DUUDT6FL6udpKOx4xFxy96Zz7nmKUtflq/Ik5Dall5M/lXhbjENrtxbzzFHAVDG4QQOg
         F9EA==
X-Forwarded-Encrypted: i=1; AJvYcCX4TTTWySOaEUQIMPJaZmbRA1GcQ2AwTsdGOLovrFsScxfZOQiTPJosCmj3ZweASAdmoQ/SWL1txyERPcHHQG5z@lists.infradead.org
X-Gm-Message-State: AOJu0YxOL3thKCtljtL2eaw8S+5vgafWzBJ6aWelVkyNBl53nlEH9vFE
	2vEBYBaWheG4fDWQK9DwQ4SnPrmidP2HD2w6zXkQ30fP5AS9Os41UFnE
X-Gm-Gg: ASbGncuzx89tlmF+GZMIUcDfwQyGNbHc24jcFa/2dYnISLWPsNWUOgPnVRHoYeWTZFD
	smE3+fmcblLmr5vyXE9KuBq/SO/XkKifCYmT00j+YjpSc4e52KHAz0Gsf2/TTZKVuNd09KdPsG0
	uO61SRNM/UAolNJfPAwqmJ0KMi85VAClr57gr7jO7fJ528iiv4YMg8UD2OgwyNCebjy23VcgWnc
	RZpeRDXS9YF94Pxm+e8g/odSII0zJHqBYdZyuIJaNonUyYKeCgr/QrcXkK7qW076Ig3VMsTYTs6
	4++8cw4h0KpxcF2vZLn+L/icJLLB+PQS4LcPdHN7IU9jEbW4K8UyhI/ahNJ7J+xXzQ6x8oW44i6
	qld7bwCEYNDWTPwiY0EjxJKg28bzU/45yDNwFYjsuVj+2VeKDERG6LnXn8/6+J7thq/v1Tc3wJW
	RVGIHleRrcMw9Kfdq8q7j64kkmjurE5O0DeMpWHCzh
X-Google-Smtp-Source: AGHT+IE5U4JjqYd6xwd8FJayS/jcOVFVp9zMugNYrK4b09ZbxPm2ncnyK5wWqHK+ARGFcMuJfSBjSw==
X-Received: by 2002:a05:600c:1986:b0:45d:d8d6:7fcc with SMTP id 5b1f17b1804b1-46e32a057c2mr162105605e9.27.1759222017757;
        Tue, 30 Sep 2025 01:46:57 -0700 (PDT)
Received: from localhost (2a02-8440-7149-a758-f461-9bc4-1c75-ebc1.rev.sfr.net. [2a02:8440:7149:a758:f461:9bc4:1c75:ebc1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2ab31f1dsm258242245e9.13.2025.09.30.01.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 01:46:57 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 30 Sep 2025 10:46:48 +0200
Subject: [PATCH v8 5/7] dt-bindings: memory: SDRAM channel: standardise
 node name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-b4-ddr-bindings-v8-5-fe4d8c015a50@gmail.com>
References: <20250930-b4-ddr-bindings-v8-0-fe4d8c015a50@gmail.com>
In-Reply-To: <20250930-b4-ddr-bindings-v8-0-fe4d8c015a50@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_014659_890052_379F4680 
X-CRM114-Status: GOOD (  10.42  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

Add a pattern for sdram channel node name.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 .../bindings/memory-controllers/ddr/jedec,sdram-channel.yaml       | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
index 866af40b654d..5cdd8ef45100 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
@@ -17,6 +17,9 @@ maintainers:
   - Julius Werner <jwerner@chromium.org>
 
 properties:
+  $nodename:
+    pattern: "sdram-channel-[0-9]+$"
+
   compatible:
     enum:
       - jedec,ddr4-channel
@@ -118,7 +121,7 @@ additionalProperties: false
 
 examples:
   - |
-    lpddr-channel0 {
+    sdram-channel-0 {
       #address-cells = <1>;
       #size-cells = <0>;
       compatible = "jedec,lpddr3-channel";
@@ -133,7 +136,7 @@ examples:
       };
     };
 
-    lpddr-channel1 {
+    sdram-channel-1 {
       #address-cells = <1>;
       #size-cells = <0>;
       compatible = "jedec,lpddr4-channel";

-- 
2.43.0


