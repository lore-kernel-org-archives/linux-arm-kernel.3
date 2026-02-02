Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD79E7DEEE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 15:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSDNEyCwakS1Ym6Pza3YQfvhZWkeeNtC0qOGvxZYQyQ=; b=4Sl/HPUP02rtLbwRezjTDr5Z+R
	u7bszz+gJ+2CqDj2EY90FHZPQCc3VCSlXlfCskSGGCpT79XbF+H45NrrNpuPDaeAPqI1cf8TnRan8
	lFjUTunxmAcUC6fDO1oQ2uWMM38RcsY6YB/7asuFz3r1aT/xUS0HKGQY3JrCTEKqSreIkgpo86Qy8
	CviKOFHM82Vw8klz2KnalX5WwA8c97yjR8tANqAULgrFo0ZBYeUhl7narwbWG6fDXxqG1eIPJKV+M
	dIVKKbuz7D+9YYcRy3YwipadMw13kNqANYoWIE3qd5r8u4xy8/IfobKxjnoJnNhRGuxh3E3KTV8e2
	Jror/1Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvTw-000000059ar-2Cj9;
	Mon, 02 Feb 2026 15:04:52 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvTu-000000059Yp-22pt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 15:04:51 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-81f47610542so2511732b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 07:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770044689; x=1770649489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSDNEyCwakS1Ym6Pza3YQfvhZWkeeNtC0qOGvxZYQyQ=;
        b=dN1is0HqptNh3/3XGD4h5TmNnuqEwGuFyhxD8b1bn4O5od6ljlTG7CvhC7y8//SojR
         CRvZQaoU+RsZPGW5E5/qRC55t3dO8kSbyaR7EvsZi7qdUh0t1DjSPCy8qM0xE8hVBza5
         hGRABLZ0WifRWj2aFOjc5qdB4swscM0ykm26D1FFfDp+Z8Stc4eRxTZB3jhIPK+RFRLP
         Ojkk12btpOw1EZgz9g4Mj1Q+PyyP35oY5Hfm/WcIAlxAhvqoSjjy22wEVITALJ+wxZqW
         Scg4gvvuE498F2IZYmgVqwzZfO1J/rtxObehV8kVGEDCGw05dipKnV5KVL1wdKHLeN5/
         JU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770044689; x=1770649489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iSDNEyCwakS1Ym6Pza3YQfvhZWkeeNtC0qOGvxZYQyQ=;
        b=ARLEi+O9Q9pWFnvv8eRElDdclBunHNC3vI6R6rYb6XME9EDLh3zCUxMP2CyMyJlfYy
         S31+BtD+WsUTSmt7+YLsOkyKdlZPMlJm+aV9IxRP/jeLF/WWWOFeeyOgH6Bv8KhXnQwV
         /0QHnkxcWUsu/fy0qYbkmWa8omNPPfpFQzPTDzlNtzCR47oJUd3zFLA81e5t3fIUqCI1
         LdNDX/nt2olAwCJ+UvU3LdUdIL4D02PMO/fkulx0ZR1jxAXTT8Yk8VdVnoDtUiPDVK3b
         c1Ow6Y4xIQbu4yPg5H4IyQaPPifblh/CCl95ydVdL3yhyetM0U3HA9LBUuk+1196xbly
         uQgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMxXP3MVWnBzIyWfu0CJC/3i+ssFQIvBVB7ITkZJUOmFP6r3x2Odh44z1J9EgcHE95X8v5jCCDbU3WhvGcZ7wz@lists.infradead.org
X-Gm-Message-State: AOJu0YwJficcoAtB6VoM1NZunr1/C+wlyTPAtghPUfk/d50ehan7N8WI
	RAFMpbJCQzOSdF1nbRHIv3+Eu/+pWxx0LklVJmpdsrF64KHA8BGQBHC4
X-Gm-Gg: AZuq6aJocdoQS1m4Yu2GF3T8ZxAks75zFoGkQ0n/gyGn5EQirj8bwgFPrwXOWDttjr7
	LsGz4rfxJx5RSRNh9MWpaVtnsgQoNwBz2DWtv4EKrrSGTX5ffCdAZbT7fuuLCzy25Ae54MvDVQK
	FxP/xli+oreUAbtqd7Z3ARYN3TN5c10PBxbZh1UqhX40VV1PhmcXpXcF/DwjoykioQOsNUokTW0
	EDbLn0klBC3roWhPVckEfpH/DxJgVI/65UUU+TqdoTuSuaTSrIcq3WNfLt0OOCUeFdUPcj5x/4k
	Qps5roRzhqlX7Waw0K9/4se9RFNPRiHF2hDzx8aDh8HlINOSP0xAD5Tkyss4NxHeAKhHVWQw8Qw
	nWKmvV4B85DvHFfNtfEq/pcQr/3/D9Z9+20EjLJNgBZe+Boaf2N5WBOHaKjLwJMZHRmW9REYh0z
	b/Z1CgSeRy
X-Received: by 2002:a05:6a00:1c90:b0:81f:9907:e503 with SMTP id d2e1a72fcca58-823ab67e71cmr10570020b3a.16.1770044689452;
        Mon, 02 Feb 2026 07:04:49 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a52:d2b1::1004])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c21112sm15948480b3a.54.2026.02.02.07.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 07:04:49 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	alchark@gmail.com,
	dsimic@manjaro.org,
	andyshrk@163.com,
	Jun Yan <jerrysteve1101@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add Shenzhen OneThing Technologies Co., Ltd.
Date: Mon,  2 Feb 2026 23:04:01 +0800
Message-ID: <20260202150437.270567-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202150437.270567-1-jerrysteve1101@gmail.com>
References: <20260202150437.270567-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_070450_542130_F1FB8EC9 
X-CRM114-Status: UNSURE (   9.57  )
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

OneThing is a company engaged in edge computing.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..49607cf2941e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1199,6 +1199,8 @@ patternProperties:
     description: One Laptop Per Child
   "^oneplus,.*":
     description: OnePlus Technology (Shenzhen) Co., Ltd.
+  "^onething,.*":
+    description: Shenzhen OneThing Technologies Co., Ltd.
   "^onie,.*":
     description: Open Network Install Environment group
   "^onion,.*":
-- 
2.52.0


