Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD39FC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 07:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A3xu5JQ9R+GVM+6e/1gwTysU0V3zfLiiV7TRnfZI3FY=; b=fAbpxGes8b2k9yf9bgYllcnJEK
	GyNnmUAYp77ONtBMZnFrXrfpemP9AaUN2whEWmS0HIlijp4WtW8UATYDI3SoE8I8MGLuDSSkC5/QS
	CtFFhA7Cc0it3++1aaOWlyORr92CYWfmpwxP+4AhfhdLBMQaiowshyxVtRiq85cqn1MtR27CPpB1h
	6QCIwvbr91pw0KnvprQe6KH6q/z6WX2gMqUmSl8vTyccyl1rCctUB54TNVwTHOn3OhRtkFBKIVQz2
	sfRcKK59eJi7guE6gEcQS77v6NfThdgHMgbbH5rFZbM2qQR48Nb8LfLphAbRox1wP2tjMdf+7PJV6
	wGTbiEsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta8fR-000000078Qj-24Bt;
	Tue, 21 Jan 2025 07:27:21 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta8D7-0000000730E-2CgO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 06:58:06 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2ee74291415so7040753a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 22:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737442684; x=1738047484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A3xu5JQ9R+GVM+6e/1gwTysU0V3zfLiiV7TRnfZI3FY=;
        b=gXYz21WxFG8NfE9TEAtgbsPV0Me/cTIAag7ZbgxHNjl62NONNkttzFci3ycmml5LLu
         WgQseM+rdFH7BjyMpQX9g/nUXWua7ulDeKUypC1TOZXBBKEu3L7xEJ1ZN3kC3I4yWoTg
         V8y2xjIBlZK8EGnjYUYZS9I9bfKXYQ8METIf7Z5Xz+mSzsyRHtZFSZEQXqvevaUlkvFf
         78uxhDalqDD1AUsVUbIs7qZZgdRgemo+8XacvQncV2XYhIF6rKkuVOwANygUTAXEmCDy
         o4Pt3O4LDnoPWKeV3ABGDMWnya1QBgkaIH/4wddT8eVGTC8bTVBu2k73ZESZbrKuayhT
         bQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737442684; x=1738047484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3xu5JQ9R+GVM+6e/1gwTysU0V3zfLiiV7TRnfZI3FY=;
        b=RBveK6vcUpIO9beDH0a2Mu+P4YtOPwaAv8OE9uCudvreDvBG+Sm7Mw4kp5a0cB2puI
         +eFgF790uPhHhu3y/7cIhE7P9bA8tNUENXk93BV6sEIm8KQLJqxX6b0F3CaNjiTkbmOI
         SC5Swu40aH7COOaXgfG+y1WZcHA43YbW0/HtzGQ8tnCdfJd5vtNKD6gImnzdUif5/CQQ
         4RJ3NWX2QiHc0d2cv0J/IiL1ko6GWd2fDS3XeJENaSeYUkZQ77MkhnDu/W6Cjn8OY/XZ
         7lepFUnaULCtG9CBVxNQW7T72EFCwbG+/Uj9dBopcJOULdYw1Xqij0dnFDWhE9EMLlWu
         j37w==
X-Forwarded-Encrypted: i=1; AJvYcCWZOdfZtd/ttn12tfY1I2aMthPf5ZLawtm6f/ur5DSYEzfqfd7bqDkZ9paUSrmt0zoEPa9kaZQD8tJP3Q91JrOP@lists.infradead.org
X-Gm-Message-State: AOJu0YyboaVbQVYftFwq8I/gxvlbf+lqHUzphF1I5svOLbQH+nxY814+
	VsdTF09brrmPity9gwsTPnhBmos1eI4FfYCxeaIzML5uHefADpyYCYV9+YkGd1s=
X-Gm-Gg: ASbGnct/BBosu3uaBpuW2/DRZ3GI8Kxo2wexXhs6UfVQvbomsu9qeBgnh2wdMdVUVjt
	p4QyDAYRbApAdzIX0ZanH2KlKHQ5SV/V9TlOHrJNiT/cFABzYmsI5HkTdh5zpepJbh9Qpm2suGX
	7Lgji+odGRzsPrpu7bcfdO+40ifLGwSdLQLegSGeXTdQpJjH+0djnmeYgPfa1qN+otdw3fcfEKF
	dvsnFKxTJE24FEHBSZqAaAO51+I5YRcBUJyvEpFIGFzQW5DWmrabKmDclDpOu6+ek9gmZGv
X-Google-Smtp-Source: AGHT+IHggIXrfshWR86eyattkP09dp08RiCOAso0M5+A/4htforQpyD/gbYn+xSh26G2OCtDARqWaQ==
X-Received: by 2002:a05:6a00:3487:b0:725:456e:76e with SMTP id d2e1a72fcca58-72daf94f68dmr21517724b3a.6.1737442684318;
        Mon, 20 Jan 2025 22:58:04 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab9c8d8esm8172390b3a.117.2025.01.20.22.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 22:58:03 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bill Mills <bill.mills@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] firmware: arm_ffa: Add DT support
Date: Tue, 21 Jan 2025 12:26:37 +0530
Message-Id: <cover.1737441631.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_225805_564574_B705BCC5 
X-CRM114-Status: UNSURE (   8.93  )
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

Hello,

This series proposes basic DT bindings for FFA devices, and sets up the of_node
and dma_configure() callback for the devices.

Viresh Kumar (3):
  dt-bindings: firmware: Add bindings for ARM FFA
  firmware: arm_ffa: Setup of_node for ffa devices
  firmware: arm_ffa: Provide .dma_configure()

 .../devicetree/bindings/firmware/arm,ffa.yaml | 75 +++++++++++++++++++
 drivers/firmware/arm_ffa/bus.c                | 39 ++++++++++
 2 files changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/arm,ffa.yaml

-- 
2.31.1.272.g89b43f80a514


