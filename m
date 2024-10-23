Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AC9CDDE70
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 11:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JgV2bop4E+Lefe1b02SOkU11Tjy474hcAgvkx+xv0NY=; b=aYib4AYEZbhKmSoKNhVPCVCky5
	VyW7t8VHd3uF2pU4C3AnvL901IjKz5NNEWRureDP4VcC8M5d361UVnronjAqldLYsXtgEElOLzglK
	nI+qqBnmwWOEQQRmz8qkR7VpoIV4FTa9P8JrK9JJJNjfwWqQ7uxoid8EaG0ljAYwV0cUCMS4/65nv
	7y1FKBnKiDT6bWl3qN/LdXjCyOUByO5R6Ev+eOxmZJH3ETNL+FigDfI39ks5BBEBvLl3odva8OM5/
	MIbbpBdQBFeGV0VCzFGG+HuvFrlQSAoeFpuAZoKF8j+hkJKszrsUwHn0MDfGrv51yu+wlbYkHtecd
	Tp5MbL5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ZqW-0000000ED95-2D8g;
	Wed, 23 Oct 2024 11:48:12 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ZOe-0000000E79m-4A1t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 11:19:26 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2e3fca72a41so4596560a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 04:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729682363; x=1730287163; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JgV2bop4E+Lefe1b02SOkU11Tjy474hcAgvkx+xv0NY=;
        b=eUee4qsjlsdJ+68fhiZ6dftHtmvpe0JfNW82aYOoxDLsU/M4dC3I4j5wE4dFPSY9lB
         qDmb58R8bnQSQ0REYYKfN21kScj7diDMHwvKQPFGGTxzg3iLIWY/pZbY4ZM+/h6ihXyq
         DKDu98Yo3na42YLK1PWLpP0S1Rb0DQLbPg+wiGakaBO+xbzijVxubCWKcHbVTQtrreZj
         soWgdSbEvce/npnSjn6dl+EyPEEVp16rzYD1eNQ1jjtnAKsbzyVg1VYdfsazbmdPlu5E
         wsbwlDFwmLM5ckdOcAd8DsNapT62XITVUA5bT0PsBSWP/b3EV0hcSaOv8F6IE4NPQmZ1
         hFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729682363; x=1730287163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JgV2bop4E+Lefe1b02SOkU11Tjy474hcAgvkx+xv0NY=;
        b=WK2tJC0At9WKl9ED5MMdXghq7z+b/Tp8E+z2nCgplUdj4uEw/KA7yFiRNSGcEwGv8v
         ypD/CUHEnHMjB2wjyJlkePciqEZY1T9MwA0TF/hTIau1XdABrbIgnyr2vNSSt6SXrHZN
         /XaMbT9/uzgbJ0eoEQN5W2A8zp2ix7cefr3IqJ15IgJY+B0mUlabaljVheC1mK5AsvE0
         Jaok2ovVUhvYsRIFTOtcA1gjicSOwezaCz7n4AFJ0oK8knkX1ITAt9fSdQYZX7eP8M0M
         bE8VFYcPfyvi1534d406LPHoK1JCBPQPxcoefJbLj/469mSurywtVsACvKZsvHSxi0+J
         OxBQ==
X-Gm-Message-State: AOJu0YxfT7qNy3VOU7Z6oen22y2x0Ez+Fnj6Ak+6Sa7vVypWs0uSFJxC
	5cSzz9FpR3V2SNMU4AeXAR0IFS79gi9NPCiN2qOIVPvMBsZhy665
X-Google-Smtp-Source: AGHT+IFhAZ88Ov+m4B72gMAynIVK0mE7UZ0VxI7wuNoZF7LTUb4m149scJ3ktLFsatlgiKyvvGr2vA==
X-Received: by 2002:a17:90a:6f83:b0:2e2:e8a9:a1d with SMTP id 98e67ed59e1d1-2e76b5b67b5mr2016364a91.6.1729682363178;
        Wed, 23 Oct 2024 04:19:23 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e76dfbeca4sm1123022a91.32.2024.10.23.04.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 04:19:22 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	cwweng@nuvoton.com,
	Chi-Wen Weng <cwweng.linux@gmail.com>
Subject: [PATCH v2 0/2] Add support for nuvoton ma35d1 pwm controller
Date: Wed, 23 Oct 2024 19:18:39 +0800
Message-Id: <20241023111841.158049-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_041925_081870_0226D2D2 
X-CRM114-Status: GOOD (  12.64  )
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

This patch series adds pwm driver for the nuvoton ma35d1 ARMv8 SoC.
It includes DT binding documentation and the ma35d1 pwm driver.

v2:
  - Update nuvoton,ma35d1-pwm.yaml
    - Fix 'maxItems' of 'reg' to 1.
    - Remove unused label
  - Update ma35d1 pwm driver
    - Remove MODULE_ALIAS()
    - Add chip->atomic = true



Chi-Wen Weng (2):
  dt-bindings: pwm: nuvoton: Add MA35D1 pwm
  pwm: Add Nuvoton MA35D1 PWM controller support

 .../bindings/pwm/nuvoton,ma35d1-pwm.yaml      |  45 +++++
 drivers/pwm/Kconfig                           |   9 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-ma35d1.c                      | 169 ++++++++++++++++++
 4 files changed, 224 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-ma35d1.c

-- 
2.25.1


