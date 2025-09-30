Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00259CCA46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 05:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8OhPkz1QMasSzFJcM2SsPKD0i5kQ3GIw9/NmjM3cWc=; b=dtZHyrzl155falfr/GHJpW8fT0
	Tjepib7r0eR4iPyfX+A5XycsnYG1p63K8V5xiB/WZZ7nCMXcRmrGkDdJuhpOnOOxBMezrBh+9/vfm
	Vr/s9M2C5K05xUnBGh7I4/oSXfGT4akoxrTpaq7KbYRElMtnvZ8jrtXREL2/DgasSge4mRL+X5U62
	URfIRQg2Oyq8infQLBjglXXlhQ5BPhlEt7z8qy85d1B3dX/otGEdSW9RERXNON7VOR3pmUbGg0PX4
	csUWkaDmZuLrNHFIfo6FJ+xnEyOpvN6viD/MRzpX9D2aVgZ047BT05RR5VLC5TiabS7tYz03+mqK6
	0XCo6SHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3TG9-00000004Hih-2FiQ;
	Tue, 30 Sep 2025 05:50:45 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3TG2-00000004Hal-0bQJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 05:50:41 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-8275237837fso627066885a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 22:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759211437; x=1759816237; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8OhPkz1QMasSzFJcM2SsPKD0i5kQ3GIw9/NmjM3cWc=;
        b=bIo5yV545DslP9ZFcyM8XKfJ9/dgHU5EuM/wSTlwjZxfr/bnsDchPWijrHffuWDDYZ
         4T185BqIAnrAIRN8EeQ6E5uRL6iSQ8Tqtd/Z6OXS4Lo36Sw8sdWE8Bn0dHsK5T5/Rw0T
         BvnsQN3L4RofhbSM6QZ9IXc7lDjZLDHCzhbbPfn9zIfeSX5rGYB8/Ebwg2t/KDyGGqU3
         Y3p37eKIAFZZrHa7ovid1vm8DxF2qyPii22DycxyuJl/ov243+zsBvK1G9wRT8xZhQYS
         amqMfGI4LWR+0q3ZtP6B9KBZjL/kqc9GnKrO/DJm22ThRK74DVd3MIVzzoNfp8cpcdIY
         yyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759211437; x=1759816237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8OhPkz1QMasSzFJcM2SsPKD0i5kQ3GIw9/NmjM3cWc=;
        b=XFcAA/3v4rlga6PmaUoW+eRw8F84b9/Wj82BjilCwBn7+cXaAGvTh2748SKIQSPczR
         fAl4o9Qll2BWPeTOJCJme1jDwuPpc032oAnrslbuuM8+KQGR2iQtNuJ73rR9L8UeOOsm
         yz7qTmvMp22101yHi3/R8wt3VTnM9sjyYgCsi72MQeAnhfPSsArLHipZxelXUzM+8WRB
         oeFDCg3H1wERIpFBUkFOOjL+MCweNzmur3yJylWUECEx/2W2zdIt9oz8jC1U6b8IiqUp
         4eygv1eoZXqD6HF2uivHLXIkSso0HRY01zWmWRsKinmL6ALrKNfzYkVBbFxF7vaHKs4w
         TN8g==
X-Forwarded-Encrypted: i=1; AJvYcCWaUxpIi53NMT/Ftg0JwMQS4RfX8fM5qVpax3YjUYuuhNLqNyDbYwLZa9Ddiv3RTdr/Y7CvidBpuqbiAXihqVdu@lists.infradead.org
X-Gm-Message-State: AOJu0YxcZ+Tstg9QksawFBVQ3bKralLIivsAOyCDc72o/CUfIei8pngO
	t7LrmAzmzvAL8caD9VI8DajY5yE1xhztYNswRz5xaxb/j8pv0TQCbUDH
X-Gm-Gg: ASbGncsFXloXFLIuxgqKkFFcHxHZK0MsOLZGaG5BF7hWn6p4MvMbAFBjkQQ9W/eZtI8
	aKULMYkyRHIYXlgTQDECsZAl4/W7sOOsk/k9Uhv9iXz6Cqh0L0m/bRSOSApthuCfTSh/0jAwVIc
	ABYaPf8JHT4WZ5pb22vHarfV4/AhQdRVU+e7tAVkay8S599SngxXqxX32SRRYDVjNmMe4M11NnD
	xUVB3YGZNDvNtyJDN2c0Da/qynXTrmEehKMZ5WATV3WHqSht+6bdTXOFCgTsLMMU5SaqRpYZNxw
	QxPkcOdqWAMME6RLg7hhH6B1DhheCBSFANqq5uSEBHOu3FCvBv609dYDy9qO9XFxHYBAe8eGvB7
	isRFEiJvGv++duRVvhsIoc4gUY5ulcNQ4l2jsNBY3axn6ThwTbTSE/dc=
X-Google-Smtp-Source: AGHT+IF1NCZYHFGJtQBXZPM7yoZ9n80a/zNf/Zh6Vz1P6UZxNFVTcoi8V03+lauZsiqM2BR9Y4W8fw==
X-Received: by 2002:a05:620a:2904:b0:86e:8d29:4629 with SMTP id af79cd13be357-86e8d294680mr492575185a.80.1759211436821;
        Mon, 29 Sep 2025 22:50:36 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:3981:263c::3cf:53])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c306b5f64sm971990985a.32.2025.09.29.22.50.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 29 Sep 2025 22:50:36 -0700 (PDT)
From: Liangbin Lian <jjm2473@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	quentin.schulz@cherry.de,
	kever.yang@rock-chips.com,
	naoki@radxa.com,
	honyuenkwun@gmail.com,
	inindev@gmail.com,
	ivan8215145640@gmail.com,
	neil.armstrong@linaro.org,
	mani@kernel.org,
	dsimic@manjaro.org,
	pbrobinson@gmail.com,
	alchark@gmail.com,
	didi.debian@cknow.org,
	jjm2473@gmail.com,
	jbx6244@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: Document LinkEase
Date: Tue, 30 Sep 2025 13:50:15 +0800
Message-ID: <20250930055017.67610-2-jjm2473@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930055017.67610-1-jjm2473@gmail.com>
References: <20250930055017.67610-1-jjm2473@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_225038_289008_EB6EFDC4 
X-CRM114-Status: UNSURE (   9.79  )
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

LinkEase is a company focusing on the research and development of
network equipment and related software and hardware from Shenzhen.

Add vendor prefix for it.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Liangbin Lian <jjm2473@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9ec8947dfcad..db496416b250 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -873,6 +873,8 @@ patternProperties:
     description: Lincoln Technology Solutions
   "^lineartechnology,.*":
     description: Linear Technology
+  "^linkease,.*":
+    description: Shenzhen LinkEase Network Technology Co., Ltd.
   "^linksprite,.*":
     description: LinkSprite Technologies, Inc.
   "^linksys,.*":
-- 
2.51.0


