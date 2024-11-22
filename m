Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFB6E65D34
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 08:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rEi9zewFPs0DWCsnyF4sCjmoP2vBLTY2BvhGWxJf1X8=; b=vgj86eEeKialUYdNjdeeVmbyar
	ZfSv7ZrRaCTcCjYc89/hEi2KOs/A2hADFBJe7jgZS5Z5I+0X4+m+sOSs43/kplone28eY97Cbbql2
	EqasmjatMcIZd9T7rOTtpCwFg3lxNF+Ks3d/KQGGD+SvsdnRmQnjDQFSijCEd8DMLSFR4pK+8WhC/
	mNnrgSD4iXl93H4k3Vnaq1CQthy6TMdxKBoZGkB9m09FxGCkkj2NMV1CcaXnQ07yd9cMGx+YxwNQO
	c6bVkDZLXBdoKEdpuXlWO4+nnbbpLGvCtpb3QTizAPEoqy8/a1rh7UeJfMRAbjC6N0ybPIs1+DYIv
	c+i3lVnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPGO-00000001xVd-1sEl;
	Fri, 22 Nov 2024 08:43:40 +0000
Received: from mail-wm1-x364.google.com ([2a00:1450:4864:20::364])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPEr-00000001x2t-3FDC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 08:42:07 +0000
Received: by mail-wm1-x364.google.com with SMTP id 5b1f17b1804b1-4315f24a6bbso14941925e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 00:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732264924; x=1732869724; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rEi9zewFPs0DWCsnyF4sCjmoP2vBLTY2BvhGWxJf1X8=;
        b=GGDhCXLJkYZvezekfQGE34CMl78uGNsYS990LMRd+FTpbuBdL4oEcMDue8iwTq1Vk9
         aNQ0lA8rzkort7orfyM/JC1Bm0/hFIt29dPvy+DYPPRWqYif5tieLqza7MNo8AbhlHzY
         kfHg6qfYO/WP6q8hcp3z5IN9/F6/7FX62MCT7NQw2NzoxJT1KwrN32fE1wIFF588njd7
         /rr1oza/nxAQt+3HBwFRKcqcMxAR8L3W+r9xsC42yyLmUQQmnJ7YMECPI+EjbqBpj8KF
         3UQFzmgLDHI0F8WpBaRVU/T/+aHtqXTDnLhr2GL4yeu56KgdDrOBgWBxmiZL31a1o1LX
         yH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732264924; x=1732869724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rEi9zewFPs0DWCsnyF4sCjmoP2vBLTY2BvhGWxJf1X8=;
        b=iB5Cv+5bZfyHPff3GRN94KpVRCMG0zjFqTacNDosAAjVKMgjTSvSqVCgoq9V255M0V
         cYS9KBYGMlFSAscS30OOdjvLQ6SyKye+dEONxney7xd1kjPuVJb5DZuOHlJLtDZTuvMn
         +MCEsZg4zm68BXk3q57B+/8ZAXtZMNwc0fjLBihHOqEK6AU7SHbzB2BhInq/SXbYGMbj
         AO7X+FvVf96F7Gef/8obcM01szBuL0dFry/Al0IT1x1jBURmiCvLYp8WFVUW6mqKPEtd
         hmDYg/QfCBtyBZPUnAaCpwgxVITlDONs5sMslzQDhqApHFMbxRHnrKPXW6MvCWra+2y9
         h9PQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2GxbPKKiUnQWHsYL9UkQ6bu+P/uV1KCWt/bw1m3dGYuBPPiHpZJ7lwulU/ZACs9Sq94CEFxmZwf6a0JraTvkT@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9c+rxepHrLfqkjlFDLKRtAmeKXCZbERBCm7kBs2tWSjW/FMhR
	ddks55y3XkBHuPozupMyMJCPct2WsW5ontST/lsUgq/mLvWSa9jsWSDSFXUXSqo5AtoeHuScchz
	XXzlWS9Ne6IHT71nx9N5hv9+2iXx+xwv/
X-Gm-Gg: ASbGncvx7HWnD0IopckMOBdYh8JfXazYKAaP6RaSA9fwaWDKTCbaiBl8y5TRxW2tLRx
	eap/iykX14kIEbxzWpI1Pz9kuDpvSH7vzkSCKPiAUhslGg3+YBXbZoM0Qgc2o5afSuW71vvBOjR
	I/SP5m82UKOO1OUAyjJ0qd1cfynzN/n/CcIPW1OQ72LU1n7U0JkPIt17eCMIqR5RQz/+7p+7EWQ
	vX/71gE2xk1DDW0QGgOmGJqM+wUMCLyzupn4WjEV7O8Rl4vmuDpYDdRDeznfBNXrA==
X-Google-Smtp-Source: AGHT+IHt2eHtin+KC/mW/m8nqn+k/IAFYJnYIBAS+qecAInjN1Uz6Zv5ysJMIl9yTRvi3sUILxl9g73+D7Yd
X-Received: by 2002:a05:600c:3547:b0:431:6052:48c3 with SMTP id 5b1f17b1804b1-433ce434edbmr17674015e9.16.1732264923575;
        Fri, 22 Nov 2024 00:42:03 -0800 (PST)
Received: from raspberrypi.com ([93.93.133.154])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-433b464119csm3900725e9.47.2024.11.22.00.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 00:42:03 -0800 (PST)
X-Relaying-Domain: raspberrypi.com
From: Naushir Patuck <naush@raspberrypi.com>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jacopo.mondi@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>
Subject: [PATCH v1 0/5] media: bcm2835-unicam: Upstreaming various improvements
Date: Fri, 22 Nov 2024 08:41:47 +0000
Message-Id: <20241122084152.1841419-1-naush@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_004205_999537_9D5F7E5E 
X-CRM114-Status: UNSURE (   9.02  )
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

Hi,

This patch series contain backports of several fixes/improvements taken from the
donwstream Raspberry Pi kernel tree:

Patch 1/5 improves the handling of frame sequence numbering.
Patch 2/5 allows userland clients to return CSI-2 unpacked formats from Unicam.
Patch 3/5 fixes an intermitent HW bug where the first frame shows corruption.
Patch 4/5 fixes a possibly HW overflow when using the dummy buffer.
Patch 5/5 improves the robustness of the interrupt handling, particulary during
fast framerate operation.

All these patches have been present in the downstream RPi tree for some time now
and have been validated by our users.

Thanks,
Naush

Naushir Patuck (5):
  drivers: media: bcm2835-unicam: Improve frame sequence count handling
  drivers: media: bcm2835-unicam: Allow setting of unpacked formats
  drivers: media: bcm2835-unicam: Disable trigger mode operation
  drivers: media: bcm2835-unicam: Fix for possible dummy buffer overrun
  drivers: media: bcm2835-unicam: Correctly handle FS + FE ISR condition

 .../media/platform/broadcom/bcm2835-unicam.c  | 81 +++++++++++++++----
 1 file changed, 66 insertions(+), 15 deletions(-)

-- 
2.34.1


