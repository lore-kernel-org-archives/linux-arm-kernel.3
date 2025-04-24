Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359AAC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 09:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=InmVeShwvVjzvGgHpHUKVWXO3tEYZy+95XoB/RnU86Y=; b=CkotEnFUju347Iwbp1ah6OJKUi
	n2aHqzqrEAVIm0XVAkiKXF6bP26cMg6DsEDIv/63EC/WQX02XOptrf+9pkDPLNDRObb1r+GSLQEeS
	4JYB1M3YQ1Z1qaZXAzxaG946lBFcgashsqGPuF57+kv6CDdzKVVs1prXgK+pb9BP1wlaLAMsi6WaS
	OI92PO5B1bAXbQQ+9icv5uMPOkrx53PgaUspZ2pVUWtZBSKzCo7ezdsWiSu32Q9BKvZMnFhGa19oA
	kvMF467AoNkcioDD+z9iseNcv8gIRFv7VlQzZg0t/qMaPoaLTr6iRtszVilzkpW5J7z6i7OLT/6JS
	iZDxzdjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ssX-0000000DV86-0FK6;
	Thu, 24 Apr 2025 09:28:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sEb-0000000DOg1-0Wfw
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 08:47:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=InmVeShwvVjzvGgHpHUKVWXO3tEYZy+95XoB/RnU86Y=; b=a4NPLpp2KbtpqJ7koJiAGvMm3+
	7gPDwpi/PKEGhJ5Uvga/vu0brCM9Hxb38VCOMOiG+OniATyzxt/ydZw/AG9iYGOqD9vo4cstd7Sms
	xoOOiS2Jy58+KP9Jh435/d1VQ+JpWnxiy20DoNfyCBI2tAjXW8KLhogeBwCSu+pMcuV/FODvGmbsI
	3kSixgcjCiOxkIvD7scEN3aEPHOoOa2KAESvlwkiz/QODUHz3Ie0NmE5a/bP0QJCzYPCu+0NjUlSz
	DowqMWiIvCOBuaQBn7BsFZ+pcpE6Ipnf+zTmFkdm2ITF2Kw6ZrKUoCm2X2yVU5wUDCg1CR/flxH/J
	foB/Vjfg==;
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7sEY-0000000BdnV-0evv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 08:47:03 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ace358c4d35so8443266b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 01:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484419; x=1746089219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=InmVeShwvVjzvGgHpHUKVWXO3tEYZy+95XoB/RnU86Y=;
        b=TNdMHQtLBJIfv4r1TJyWdS3yP1sE22Ea0cfEbbPNPdf5FIGBE/nnKm9SrDIecOkwEM
         gtpwyfWDfrYx6e6cpydtRBwLHfYUjtaYCCcqmxsRMx2xmGSt2HCk2CyGlqn3i7YqyZYj
         hYM+riTcOXZUh59hM+ThadqsYSYbAdhAojcKwyeQYzW41qR+LaOWCf0JUXlRMkvS1+b5
         XxNOth3AGFYyWH96lE4Xa7sqmnNtnn1VDsYTdXDDO1nI/8dU75iEs5TnXcdKKQKxpNSq
         0oct20MwiJZ7g5eJwf1rQtRDXsFxKbkvL90OG5Eb2k+wbfPeJg6xRT/wkrTcNtPQurvc
         7I0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484419; x=1746089219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=InmVeShwvVjzvGgHpHUKVWXO3tEYZy+95XoB/RnU86Y=;
        b=vtFruh7biAz4aUb2Zy+VcM90djIqe4SLI1V9QQ9MiEFBAiytLcVRZXUZYY3Owd0LLw
         1kXeAHE3Q+iFVbWsh6rtwPSNWDNutKDtPYnyWDqhAplgpsbZNW5LfVoHIGD3NXc/hKDT
         JJ/XbBKuAWBXnfAmMlJgQ/bRyiTapcG+Nesx6Hs9X3HVzyeaMuLx/2smxYx72oV/owmC
         Of45RjHELoxr5wlljyoBJum2AR+YD5eoee9sXDDxtDEOyLelcT96tDMfst3Q8ubpnrbv
         kpGYePaNps9nU9yNjgWsTzj0QBOvJrGYNdBY9NBnctbEsF0bCmVFe9jtfC8pZNVVQ2UZ
         oZ3w==
X-Forwarded-Encrypted: i=1; AJvYcCW4caGSs+BuzE6fCyYWuzv/KLIzv4GeXDBSYkYO87s0KSUfBMizhKD8c29Y3xToOoupLMqT9HDM3eXYIGQfiBy7@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr8hrBNyNkpTktNXvp3aD2N1UqMDcpzsy1ViV2xE4Z5kR2mMXX
	F6WnlBxLHcI69kjRYyTuqGVz0pQjUQvvUPNaoG8uxuTY7l+p2zerE9jw7Xa1viQ=
X-Gm-Gg: ASbGncu1QsQKFMKRPvcsqTtLV/ml1LTdoF7IZlVn3XAsdVcG5v44al9/sVawP/oG/ox
	2OSf0Ixn3OTCPqG1jjqBkNW1+dxmkba4cYo9JmQ++RWMRlFtFBtcPeOyNOngRjbBs3quG+hdScH
	+aktuOjqz3eY4WfMUCS3WumrkYcZ/pWdq9cjCkLdIruIrkzS63yXZqha1bv/MqfixN7cY8yD2Vz
	eGWu7+wTxi8doRwkNX3PeAnjGvujDv/NJjm5fwloOnKb6U3nNIRzSidXt9WmjQ7I85MGNI6bES1
	vuCJtnPSev4pqh/TjuvHhtWv98BBOKRebVSw81mNoJJNRUd1FQ==
X-Google-Smtp-Source: AGHT+IE9+DPre4j2x6keFqgEO7PT+Wn5fGJGtZZ61C/F7fDAucCVLJyYO32bRzby6KLv1OyEu9lE/w==
X-Received: by 2002:a17:907:3f87:b0:ac2:6d40:1307 with SMTP id a640c23a62f3a-ace57429fe2mr61424966b.13.1745484419430;
        Thu, 24 Apr 2025 01:46:59 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace594b63ecsm73139266b.0.2025.04.24.01.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:46:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: samsung: sp5v210-aries: Align wifi node name with bindings
Date: Thu, 24 Apr 2025 10:46:55 +0200
Message-ID: <20250424084655.105011-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_094702_301388_415A3947 
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

Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
wireless-controller.yaml schema"), bindings expect 'wifi' as node name:

  s5pv210-fascinate4g.dtb: wlan@1: $nodename:0: 'wlan@1' does not match '^wifi(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/samsung/s5pv210-aries.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi b/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi
index f628d3660493..153514e80c9a 100644
--- a/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi
+++ b/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi
@@ -855,7 +855,7 @@ &sdhci1 {
 	assigned-clock-rates = <0>, <50000000>;
 	assigned-clock-parents = <&clocks MOUT_MPLL>;
 
-	wlan@1 {
+	wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 		interrupt-parent = <&gph2>;
-- 
2.45.2


