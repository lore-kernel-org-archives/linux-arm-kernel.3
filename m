Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9EFC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 10:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F1iQ+DzVo9DQ7ELRKT5wsmUCmjLHRUNTNjWFoL4XTeQ=; b=cJQhr1OjthyyE0KQjCc5fActfy
	UvGztieq8a/oqh3nLmuhng1FeLVxUrYXyPCBXy/1190Y0HBrV6YlNUYZvN1S+7w/SXyGL7mVpLw7X
	4gwPbntOZxUaHY8UrVhLIqF1yXdKt5s0T3jAj38fxCsyux/k1XFzgyVzmlVQiCNdgEd1DCX1qR67c
	kDPOroHVNw4yBZLRqsdqikVvmXHN2lvopBre9hrMk67Jg3nVVVL6V3ptcB4oYaj3q2Xhto/yAQSW6
	EqbBD/Mg3+mrAZportB6EmIYoCE2NdSxa9rcx9seQ6jmV8XHzGDPDJbGcSBBeq4m8gYdSwEmODoSl
	uXRJSTSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueAXN-00000002Bur-1kQU;
	Tue, 22 Jul 2025 10:47:57 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueAN1-00000002Anl-3gSr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 10:37:17 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6129ff08877so8404592a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 03:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1753180634; x=1753785434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F1iQ+DzVo9DQ7ELRKT5wsmUCmjLHRUNTNjWFoL4XTeQ=;
        b=Lb0YBWUSMZYDsRZZqoRP4jpyQeCMcULtco9o2yxWIwNCPpkEdW3McVOH8iAI0/ekOn
         0TDOFSqRuyI+H1zHIilgxljHvjhZUWeX57lxkJ32igGQCcJ5fpxvLSmQaAsXBx6oTdFF
         kf0jIMdpnujgv8iJfiMTkL/q9dtldOa7cWl3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753180634; x=1753785434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1iQ+DzVo9DQ7ELRKT5wsmUCmjLHRUNTNjWFoL4XTeQ=;
        b=ZtP2bnBDLMenJfdpn5FCaiRHiFgYU3k/igZ6fZtVDqEmbYAyFaesLoEzL7TgpqFq14
         gnQYjs19BjdrQojaWU6z6Di/I7z0bZRTK2jqNnI51DbDV2jAM9+HbD/vv4J2tKnojvwF
         wQhs/MWYm9F8pku32WBl80RdxOOGuucN2xuiWsHcMnMSq4tA2Ee3zJYrA6he1XxK3KxI
         f4xayIDJDMZGza5CNjmaF0RvTAn0+I7leePVH+9YLXFLEJ3vkfE4ewjfRKNqgJq6K8Bq
         5p9OLsAICF+c3FYXCXzhRFGMUhsPxfzeeo9UEoS460fwmk8t5JRYITVdycy9dajpUm+/
         mHCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhZrMY0V8v6PIEBc2poqeOY2unyB18+WoSQjRzn1mkIlc3z7Qropp1r/3E+sBzXJG8tKcjGOqieySvqoGynj8+@lists.infradead.org
X-Gm-Message-State: AOJu0YyXjeLAHsxC4jD1rDWUFz0Srhegv0ZKEQvBg7YD4ydRU8lrH4M/
	1idhXR881fHp0jeutr42KSmdDiwP4Hz/Soi8kA7UPZhOciijeI4uagamILjJ3zf34gM=
X-Gm-Gg: ASbGncvN3rOq9MBDZ781OM5JsUxKm4WdFGakNZ6Q/q5t1WXDgDgLb+5yOSZYKX+BOHE
	MhYs0Pbhbv6VXtXpuHSfcu9zBQJECWF4L8GerzwcLwtzkl/gqF8bTSvUmReP3gKcp8g5fGg2q9u
	1MootAHerjnjOJtjhmiiHycy1y/ReUiRy5KppNGNe9ZUyxm98zw3T4wO85n//wO1f8yMrW5SiBl
	yN69M4Qrp17w6TmOc/XZstgKpJCxwUADytcuwSY1BXvKSrZa2e0Ob6YPxzTvtYtz+2E/N/HKTRU
	8rOf2kEOOKCndLnZ4V1WbNThZxxkbF/6JssoR+sqTwMgbK2Hu+1QtadeUrJHV27dypfuv3uPEqF
	807/8HvanHmT2+7kxa6VIyMbUS0sGskxUR1nI4S1lL2DeOi9264vi9JKLHtQ=
X-Google-Smtp-Source: AGHT+IHSThhFTO10wKsOhlI2B+/WINETFfgihIq5+JjYua7ZAoLLp3FbG8jE6ltycXzk2pFdKzcM2w==
X-Received: by 2002:a17:907:3f15:b0:ae0:5137:6d6 with SMTP id a640c23a62f3a-af152bf63cfmr214633166b.9.1753180633782;
        Tue, 22 Jul 2025 03:37:13 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:2bba:d7b0:8e79:c982])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca310e2sm844568766b.79.2025.07.22.03.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 03:37:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH 0/4] Input: imx6ul_tsc - set glitch threshold by dts property
Date: Tue, 22 Jul 2025 12:36:14 +0200
Message-ID: <20250722103706.3440777-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_033715_948009_218A050C 
X-CRM114-Status: UNSURE (   9.38  )
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

The series allows setting the glitch threshold for the detected signal
from a DTS property instead of a hardcoded value.
In addition, I applied a patch that replaces opencoded masking and
shifting, with BIT(), GENMASK(), FIELD_GET() and FIELD_PREP() macros.


Dario Binacchi (3):
  dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add
    fsl,glitch-threshold
  Input: imx6ul_tsc - set glitch threshold by DTS property
  Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros

Michael Trimarchi (1):
  Input: imx6ul_tsc - fix typo in register name

 .../input/touchscreen/fsl,imx6ul-tsc.yaml     |  18 +++
 drivers/input/touchscreen/imx6ul_tsc.c        | 112 +++++++++++-------
 2 files changed, 86 insertions(+), 44 deletions(-)

-- 
2.43.0

base-commit: 89be9a83ccf1f88522317ce02f854f30d6115c41
branch: tsc_de_glitch

