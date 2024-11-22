Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355B9D75E22
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 10:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4VCCZYEFyPvvi9pJLrfTrBaqaVLRyI5f0XR9dqSok6s=; b=1Xczq7zY8M+p8s1ivjNkAorFlT
	uM906PW5B6f7mlwOsoT1csfT7kg+0PbkuK+GqpnUJQMaENUM2jdShhiyP7zlJ8z9bQFmU6mPzqF1l
	h0E39EWqWMhlm1iTmw76XTD0F4C0N/2GVeYWb9Yh/b0rsSSWdjqhyHJhi1fFBzELN8QV5nPsiArDr
	S/hmllvhJfBln7dD/jFYJlNTbMQ7d/JwTwzWZ57IjixlanoHiYmRw3J2Q+c9zwaBVInSkfnKZwXQ0
	2qIyBbzlsK09o0KfYroBBBVrwjeO+Eq0QigklC0Q3YxL3yP3o3Y5MYc9LTc+i4DRPN1nE0pXGRhrw
	SmkjzJLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tERFQ-00000002HLA-1Ro4;
	Fri, 22 Nov 2024 10:50:48 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tERET-00000002HAQ-2trV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 10:49:50 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5cf9ef18ae9so5842315a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 02:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732272588; x=1732877388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4VCCZYEFyPvvi9pJLrfTrBaqaVLRyI5f0XR9dqSok6s=;
        b=ZBeUrwg/9LU7jtZtzXN4ewUQeVrB1cLrCPxv+8d3Ejuw1k5zl7MIpHrlCIDzS5IGDe
         bswR/Vm7COa3tIkNzbJF4ymE+cQe5Iwry3JeVnSrJDueXeKQtkx7qXmvIUjQwjMKxaQx
         edFRfal2jIlNTBecNixQa7ZxLLBTd4bATlRnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732272588; x=1732877388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4VCCZYEFyPvvi9pJLrfTrBaqaVLRyI5f0XR9dqSok6s=;
        b=SOU39A8gDIDV4yc5DHiJ8IgJAY5E2ZgxbCEu8OpyuAPQhXRFcEGbnDDmIu5ZZbLK+B
         /XbwAjufBvtMEo6WmDH4V62gdeaAgNvJly0QKU0rv5kSMXf/ZuSeJjwmSdbHTEgnw1V0
         0zQYWc7aA+WMoMJQkE/bT/dxAKbe6WQFlzHLUbO7RtwKCtuAfZSaZSWfaRBRo4mVMcbL
         xXW0BmQVkuVRteWaKbKDQPX8yCzPMjk0+IWEaboJfavIwVrEIZab1s7PF7vQ0y6gkdfX
         cwR1Ro+1y4J+7Mt1jJts7lqwwhe3dD324Gw69w1g9zzPC6GU7rHscYQRjzQRJ0Eszgar
         4k1g==
X-Forwarded-Encrypted: i=1; AJvYcCXIH6uB7E75e3xRiwAA6Q0DNP4nG7QxOAtN56IKcAyOFjrmW9bb8R3V5J/Hx/h08BtZEiDwl/bTeMc4SI9j4LXg@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn8mqXeywG3hXfOTaj1adWyRRqPpVGAQl/trKXytmA2U4aOzD1
	ZjUk5V+1Eh/R5vhr5amCJP0F/cr7PdMVIFlFPvKOz3zp3ZA6RchS6BBgpxPSJA==
X-Gm-Gg: ASbGncs/meI9TlYGbjceQg9qCgiBVTQuf02tV1XFdHIW46DXg/+Iy4mYY1epNd8jaVx
	jc/ECsZs5j+6phA+1qCpiLr57PHhkvPeg6P8Qta9AMgIs6e3m1gv1yOJ0PF5W8trV/6ZbvVFdHl
	lcJKPuZOE6AnjGgmd7QNmZNpzb86nqc0JgAO6lraSlCYmi5xAcADnBJUWuY7rFgXiZ8STKMw1BP
	8BgBe1ao/XKbNQyQzJAwCqdWccam0tv9pgdHce9k9wS2mBiIFnaaDW/+87ljq4nWmPolvVyWnsX
	ELzOQ8Jk
X-Google-Smtp-Source: AGHT+IEtqFLgN4QldlEpfUVybXqSI/MRA5+30+n/3WXfgfU0sDT9bCvRjWg4moxr2vE/+F91ZGikZQ==
X-Received: by 2002:a17:907:762f:b0:aa4:de84:3a23 with SMTP id a640c23a62f3a-aa509d09bb8mr253938966b.26.1732272587279;
        Fri, 22 Nov 2024 02:49:47 -0800 (PST)
Received: from localhost (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-aa5175972f5sm55606966b.63.2024.11.22.02.49.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 02:49:46 -0800 (PST)
From: Wojciech Macek <wmacek@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Rafal Milecki <rafal@milecki.pl>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Wojciech Macek <wmacek@chromium.org>
Subject: [PATCH v1 0/2] Add Starmie Chromebooks 
Date: Fri, 22 Nov 2024 10:49:36 +0000
Message-ID: <20241122104938.1437925-1-wmacek@chromium.org>
X-Mailer: git-send-email 2.47.0.371.ga323438b13-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_024949_758656_6849EF41 
X-CRM114-Status: UNSURE (   9.33  )
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

Add an entry for the MT8186 based Starmie Chromebooks, also
known as the ASUS Chromebook Enterprise CM30 Detachable (CM3001).
The device is a tablet style chromebook.

Wojciech Macek (2):
  dt-bindings: arm: mediatek: Add MT8186 Starmie Chromebooks
  arm64: dts: mediatek: mt8186: Add Starmie device

 .../devicetree/bindings/arm/mediatek.yaml     |   8 +
 arch/arm64/boot/dts/mediatek/Makefile         |   2 +
 .../mediatek/mt8186-corsola-starmie-sku0.dts  |  29 ++
 .../mediatek/mt8186-corsola-starmie-sku1.dts  |  46 ++
 .../dts/mediatek/mt8186-corsola-starmie.dtsi  | 480 ++++++++++++++++++
 5 files changed, 565 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/
     mt8186-corsola-starmie-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/
     mt8186-corsola-starmie-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/
     mt8186-corsola-starmie.dtsi

-- 
2.47.0.371.ga323438b13-goog


