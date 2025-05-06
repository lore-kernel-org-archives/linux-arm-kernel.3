Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB431C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 17:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Ly7N+DC8UGuo0Brj257a3S2ZZi5dSNi5oLrFAULbBo=; b=ucl+LZwDPvgPID1ey0JUXO5M4y
	Z0zgWd+xtr/FO6LyjdwkGzMyfhHRihnTJE7j/OFMBB/iJB09n/Cn181Ui0jKv+3jDt0HxmytlFSY6
	RG8qSoznG4qnyCbd4mE4Fok6lhTrLEJOgcrTpcUzYqm+swukvhL/upFwn94mDy9t90m1kUmWjxVWt
	jeiQPPGe15EclkLYVK/OQxdmRf7QlNP71iBfTPYDb4hAGbHcRR9QHjqLfUX5HvRJvZdx4s1MDv8aV
	0iukQa0Mx3OCvGqtiMYnw6dQVeWBJwg3mmP1sKCRMfh2HyGHSaXli0iheIeEvP50OqW+UEYCQZfyS
	hB0r8Cgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLoL-0000000Co9d-1yT1;
	Tue, 06 May 2025 17:10:29 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIOV-0000000C8AS-2flI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 13:31:36 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so6742270f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 06:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746538294; x=1747143094; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Ly7N+DC8UGuo0Brj257a3S2ZZi5dSNi5oLrFAULbBo=;
        b=fPYnYYVsgPlFK8DYuEhnfY24ymR9IOku+sLcu6ftvE6Y0KgqoLH6VeNQ1VMJzrbvfO
         S2UwRGo9Z+B+ox0LPV60UnrkJNR4SlB4xjj7eb9r85ZsPpDlUsbeV0Wfsj1Br2xm78ml
         hDDoUOp53/w7/N3j68E2BFrkyhEonKTsYtDT9R3O1TEsh/WbxjVQZ6ukY5ir9rute1Nl
         eNoIuuLRgaV3QwWwKIjVCD0IQiX0GDLM5DNUr5adyKUZdRhWJ9QiNss3N+4JoX/j5wLT
         cIUtU+clWY4L5pz1pmL7ThqHUnq92Fh7VsBYeNvT61ZxcZoCcuTxmDEw89npSxUi+TF6
         TcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538294; x=1747143094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Ly7N+DC8UGuo0Brj257a3S2ZZi5dSNi5oLrFAULbBo=;
        b=VSHWgSu3vPFFXDCJMz6X4RPqYE+LnE9ewWyVKO1PHDfVL4qa+6WxubpVxLzGkKZan4
         81ONUy42tphSFWWpaZJWBcvOCMvjGHYJRxczcx08RIq7BrlEWP5gEBwzJvrvbDk/aP+Y
         9h8rrtPjhXdwi3bWuQtXrtySVM+qSPMMTutXRVj/+QvD5GMCf5N3RM8kQMwOnPwDsn5P
         Lm3PCZP/RN3/OWEnKj3V7l9gaSYyRujW8LsP/4dwFlhgREnHlLTG9Qd9hV0HaBhQP9Aq
         rjeJxQY3qgWVbkuPipOAhO6h5UuV8pEI6M8OZvkw0Vo2uTtmJ30JBpWnLidu7iVJa92c
         t6cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPB0aHymSnV+7HdhWe2qZXU5xrEjNb5h0YtT1Jde/7nmuz16wwI+iThnsR9Yi1Wl/IRSz68U3zT6se/uP9gUfk@lists.infradead.org
X-Gm-Message-State: AOJu0YxnDtXLts9K18j4a3HwDWjxQO9ECmfcRRqQejbHMnfv5s3wzML3
	WnkmRo199SviuRJipyzIwydO3bTGrK3AePC62dK6LDKg/fR1yI37
X-Gm-Gg: ASbGncsAF4IvQucUpTeixPbGHGczI/rrQDcUpmrvzBuJOThM6NYHPE0YzVmC770wnk7
	cwaYCxmIMO4K0JJ4QwV44QZYTxKYMwwzMFk/g0a04mziPi5vTmQvjdtFLAZHGtOeIpwy/LkBvDi
	ekm9PgTfyK88RNBTlsFvM7cUqzG2A/2SVWvGaDxZw07wULPjdieIXAw0d8aAG5I/C2KdJjlCGeN
	H1XeYVhcqj8SwUdfmnC/ZBRv8wfjOGpbl4hNYfYFIkDdVJjqdVsuLCtpjwPgasnRY80PXAJbAzV
	uBCKn9Xkz1kUPHE57byCBY+vFtdiliZ7gb6aYw7Z9uvE7HAV7lVsY9QUYcePicnu9OlNOtcgjTx
	VE/4+b2aujiVba4bAm8aAbHyGiPdqFY1+
X-Google-Smtp-Source: AGHT+IEeR1ExlmG1yo4fSKgBq3ylxxIF0pAxZcjTLkLUeaBJk6yosVMQT70HuL6uaTIrSbkavGIhGg==
X-Received: by 2002:a05:6000:184b:b0:3a0:77d0:ba3 with SMTP id ffacd0b85a97d-3a09fd79f8bmr9224541f8f.5.1746538293896;
        Tue, 06 May 2025 06:31:33 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099ae0d3csm13488923f8f.3.2025.05.06.06.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:31:32 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 04/11] dt-bindings: firmware: Document Tegra264 BPMP
Date: Tue,  6 May 2025 15:31:11 +0200
Message-ID: <20250506133118.1011777-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506133118.1011777-1-thierry.reding@gmail.com>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_063135_677259_4DF0671B 
X-CRM114-Status: GOOD (  11.53  )
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

From: Thierry Reding <treding@nvidia.com>

While the BPMP found on Tegra264 is similar to the versions found on
previous chips and should be backwards-compatible, some changes could
eventually be needed. Anticipate such changes and introduce a chip-
specific compatible string.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
index c43d17f6e96b..3c44fe607e12 100644
--- a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
+++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
@@ -70,6 +70,7 @@ properties:
           - enum:
               - nvidia,tegra194-bpmp
               - nvidia,tegra234-bpmp
+              - nvidia,tegra264-bpmp
           - const: nvidia,tegra186-bpmp
       - const: nvidia,tegra186-bpmp
 
-- 
2.49.0


