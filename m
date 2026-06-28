Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC46C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 23:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HBzVoiVEKC6YZTZ3TI4LBB+zvfVWnbKnaW6nuLVCnqQ=; b=Yvop1knCOcFgecVe0rPLYNccV1
	7pA8PvClW4tRs3D1WUkvp2+d1wz4o4XQiddfP5A6Adf1ut4pXMh1zTv2vsNdJGPQ09enP7m27Mex9
	w8qn24mozgC8gjCGryKprNSha7OMGgXm58GmsUhoWFYX+SEnPRnUYsj6Rgxty/E9FpIlDDEAdBoqS
	k/y+QlTttVbn1xEXecFhePq6Vv0v1YtkJomI7iEba8icplfJ31wUF92CchNGrn1GoPeirrqCxUiD0
	Npu3V4MkTs9XNw8c1oA4ckZUrdsQdW15E04e+rpB8hNmTNRvporTVwwHsW9mQhjlCJSW/ziL6BDH4
	kUloWwOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdyfS-0000000DUSY-2pm2;
	Sun, 28 Jun 2026 23:12:02 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdyfQ-0000000DUSC-0xkE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 23:12:01 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8478a25f268so52990b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 16:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782688319; x=1783293119; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HBzVoiVEKC6YZTZ3TI4LBB+zvfVWnbKnaW6nuLVCnqQ=;
        b=aoRkEVl5g6qyRCs3h1pEYfWbyasMVqBlZ7zGAemIQya7LR+sgBuQkaN2/+Iuo8TU3o
         CnJ4TSsPbRthKjynxsO65e6KQDdQydQLrm8eFhJ2uEm/6fsEcmZ0fEvfOa++zCKYMtht
         kjJMCFR9Mrcpo6R6l2erMXxvGBm//zmKyN1gZ44+1QUvY0Rvm3JUDd1uTT1R17525Bxg
         Ctemvu9YXGUb0gkcXnxnwHkjHWs3aKNrihIoQQ25wmBy62BwamVn/TVukNIIJ99hlD2w
         U6b+VA6sHRFyu4N79GL4c6kqmABqI/cp0FPG4EStzbv3b+e0ID2XUsIs/mK7uPiQbuBY
         3f8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782688319; x=1783293119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBzVoiVEKC6YZTZ3TI4LBB+zvfVWnbKnaW6nuLVCnqQ=;
        b=s0SYEPQjuRa7iSCe3CrAjjzenc8cSQvwNozQe295sHISS2j6tEbi0UpDB/M43CEozT
         y08z5a9x+I/acHTMOisTqUzo3SKjZXGQerJ5+v3aA+8Q3GkUXpLVq39eutWuspbSmvWA
         Bs6cvnqS278ZMrfF71u/f7kAJa7WU2a6EkU1A/AUa97euDhef9wn/6splrg3F9Rmdjsh
         fjo4c3HywHvAObWVYaSdRIpj/iH3FrikqA6YvY6p26arG6ZEPeJUujQ5UVZ69HDtsCqq
         6+b5vaYXCijE1olLOezQfAHvahsXTI20DVNWJz8GYmkEZPYke/uzmPercryGPuZMJTB3
         3zqQ==
X-Forwarded-Encrypted: i=1; AHgh+RpH0vcXnIV1o3xKxE767obiCE4Kv6qVL1ICzmL9FbBH9GCYPPVUFZjusMNAXltiixadZDLfTXeSOb/uFXgCuXim@lists.infradead.org
X-Gm-Message-State: AOJu0YyonN+1iFhalKKW2vZmElRjaQregqQMMnU2CKBvBzAny7n3b9ye
	odrmxKJ/gSXixr6QqJezSGbuKt1dmtWb1+q2Qoazl2g8776JtMNE/V16
X-Gm-Gg: AfdE7cmYkJbDsc0nTjaUtxSTGx2Rnew1Mu0LIVmoVn7PBBA44cBYHAffq1X8UHYh55R
	D681MYS4Bx5Wxa4pFnBHsDRTa2yYdC+K+llWOYIPauq/gRkb9iCZNOi7GIiC9oiG8v4k2tKBj28
	Szj9hl+1Y012QJJuaes1RN+hGa28Pg2hISeIhgJFbAKRjNEMDdft+cmm028wX48c7TGV3YP1Nog
	JmPPwo4N+YQ2YGOTe8811uGSgimQDKncCUyD1AE13GElRo98YDhct6P03yJrALE/vKz99E5U1KO
	D3CIgZT/IsVncIuyI5bXaHUH3NTtXJO95GMdMKe1Mpb216odTMVr9Z3kywNA3o5BGU3sZa660IE
	HAhtEw4AEZ+In7Txm5dF40CBT2HVlmn9w/dmNtCV5coih3mbDzfL4o4Ww92RdspUf8l4OrqFYzi
	LHAnIxm4CdjRKL2pR4lOcGM0ltwYYVkyyp5g3vCirzFCqV/WA1baGtplZpIda1vtpvw8BvC9I+F
	fsyYyB3Yg==
X-Received: by 2002:a05:6a00:b90:b0:846:f517:ba5a with SMTP id d2e1a72fcca58-846f517fca4mr2671001b3a.28.1782688318921;
        Sun, 28 Jun 2026 16:11:58 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fec0f7sm10450263b3a.22.2026.06.28.16.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 16:11:57 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: drop extra AXI bus ranges that break PCIe
Date: Sun, 28 Jun 2026 16:11:56 -0700
Message-ID: <20260628231156.1254012-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_161200_266055_6F956660 
X-CRM114-Status: GOOD (  10.44  )
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

These addresses overlap with DRAM on BCM5301X/BCM470X SoCs, causing the OF
address translation code to route PCIe MMIO accesses through the AXI bus
space instead of directly to memory, breaking PCIe. Remove the extra
ranges to restore the original single-entry mapping that only covers the
AXI peripheral register space.

Assisted-by: opencode:big-pickle
Fixes: 767012397976 ("ARM: dts: BCM5301X: Describe PCIe controllers fully")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm-ns.dtsi | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
index bd52de0faa3e..27a97c8122de 100644
--- a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
@@ -95,10 +95,7 @@ L2: cache-controller@22000 {
 	axi@18000000 {
 		compatible = "brcm,bus-axi";
 		reg = <0x18000000 0x1000>;
-		ranges = <0x00000000 0x18000000 0x00100000>,
-			 <0x08000000 0x08000000 0x08000000>,
-			 <0x20000000 0x20000000 0x08000000>,
-			 <0x28000000 0x28000000 0x08000000>;
+		ranges = <0x00000000 0x18000000 0x00100000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-- 
2.54.0


