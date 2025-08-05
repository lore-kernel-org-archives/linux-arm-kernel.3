Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F44C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 00:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2xhiUEc9Kw/V714a7yfCWYYu6l+qIkZaBDMyW3CyOmw=; b=RAQE6nMCnYD0T8U6jcQbReD618
	9Rcz2UgLORNWJ+iel098sA0HNL4yL1RiC97zjjnuwUbv6vU1uag/U2T6VrR/Ll1TqEAmGcHr5Y8Wb
	i/cD5JMwcMDYUiPLTurf8PD16Y+txqyj3/6YKkkwDAV/3+5T49OqF4HH0Y86OdmH0II/rkM6QlSkZ
	tfL0YoAM2iAWsJ4jxN7FOWBNXZFAhIh1kdk/ZS0uBy96odmCuw4p0C/uIod/71cdxiIRKUh3YIePN
	phDYMoyfVm6vhbjz6mOOyFRZv+ue1KJi/pW8udJHtRj1sbW+CuagLsCl5XLeThgUEcXaY9qPd3X1m
	A92iIoBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujRfF-0000000E2Qm-0zhJ;
	Wed, 06 Aug 2025 00:05:53 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujRZM-0000000E1xk-1PTk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 23:59:49 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-459e3926cbbso6005905e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 16:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754438386; x=1755043186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2xhiUEc9Kw/V714a7yfCWYYu6l+qIkZaBDMyW3CyOmw=;
        b=lZEIT+mZ5zLbDkdkYeAh672pCphEbNbHpDPIWoFnGEXnma38bLrcXqUBDuFzBOQy45
         KQPLiWF8LVYzTEGh+wtFK/FxlMfTOnnIzpcg1cOJBI9VZnpMYhrMf1LOS1Dcwq+DeTUK
         8X5wLzVLe1LHo1oBKmfswWSdV1vpoBpsgBKRTDph/RpLA/1knp72Wu/eO7EBKn3qz8we
         RB/LoRQvqJCbcmfsiVVeCixw+c5+Id/RDePN1cDzPmC3sbbU1FT7MnW0ZQUuJ10C1Ld/
         E96H4zyNWnEVvSEyDhro73zkQLEqmbb7FD8GOh8YHUFl6/vyXG+S1DMCZkLYTKx+zOZo
         pIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754438386; x=1755043186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2xhiUEc9Kw/V714a7yfCWYYu6l+qIkZaBDMyW3CyOmw=;
        b=r8RJ2hzA3X2QZUDJJC9gabCfX9ziLsSu3smGgunurZXlRijlkce2ZcL8+eh+SUwjk6
         wdivFgnFNs4ud0qcTkXavPMtt6oqCUpcF/Q889dK/0u6JUok5FRf0S6aFhSIp1Wrhf19
         buVXqS/UYA99BAfyQsvM28zC+a9ISLRrIKp4cv/+5YhvAMwtudWGrSm/uP2ruXmqBK5B
         OI0tGRZjqoBNtstjZMXUnzxLgCOtslDQ4TQYw+ArFPlGt9wEIMG0uckiOHKL6G9SolV8
         eu3dfZp5g4cSywA/2SqpfvYaaXZEYtdDd8UdPpn0M7XOQ7bO4DaPbuQ+7n6zPDF3go+0
         k7zg==
X-Forwarded-Encrypted: i=1; AJvYcCVsYtMu3mJF24vBqroM0RK8bozxZ+Hb5iBNDSEnG9evE1MAcwF6pWmrcM4yVr6gf0uab6deLLTF56XHpUoiKicw@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ8nVbauxq7dWJ1lpXcGJRLos4czVO3dyGxi9rqpZEZX7o/8zM
	22T8tbGLryNJjhmRfvVtbN8IoW63npWn6aSAjVDO7IrPeL+GvJrR9IPa
X-Gm-Gg: ASbGncuagTRwEK3t5ybBy2lILvZqqHplGYBeMmqH9c7Rgws70Va0oqJy/hf7D5KEC2/
	1YxK1jpNjFU8DEEfJowwyqhKHwAMgZ9K/ZvvXrzJRmnkN2Qij947Wd0j8FyM5cEdPHqc1YBcf0/
	Kz5rMXed2LNIHh4QD7tFFXxmb3lWuckdWZKSJM4S4RuijY/I2Re9xXcaDibVOsK+Ecg7ElByTa4
	Y9TgXiokjKeCZtve6gHJoI2EpO1gt1uLqOSmEd+zwHhO4QBH6eRnAg8aR2wK55QHwBdkA0l4kSM
	7I/Rz0tOvBrYn0qIpLL6eESKim+ju3kL363vPtCAbuwCjEqUd3plwD/nFlsVIAe0qYGSigAc0VE
	Yy7xJXxVyLuwN4I91hFmSuClz7bZ9W6UppU+MxtA1Ng0QM9e1kAtUfg/m9mOmODy75BUIclV8Wt
	4=
X-Google-Smtp-Source: AGHT+IFsHdG6C+dK0jpCSAVCpiWRzLZUbTx+mxWcmzk1Qn9/oqFLMmf+47R0EY18CG9DIppdXP0Hkw==
X-Received: by 2002:a05:600c:3ba2:b0:456:1ac8:cace with SMTP id 5b1f17b1804b1-459e7090ffbmr5512585e9.12.1754438386168;
        Tue, 05 Aug 2025 16:59:46 -0700 (PDT)
Received: from ekhafagy-ROG-Zephyrus-M16-GU603HR-GU603HR.. ([156.204.172.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458bd5a0f9bsm90322215e9.0.2025.08.05.16.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 16:59:45 -0700 (PDT)
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
To: 
Cc: skhan@linuxfoundation.com,
	Eslam Khafagy <eslam.medhat1993@gmail.com>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	Dharma Balasubiramani <dharma.b@microchip.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] drm: atmel-hlcdc: replace dev_* print funtions with drm_*
Date: Wed,  6 Aug 2025 02:56:50 +0300
Message-ID: <20250805235928.236248-1-eslam.medhat1993@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_165948_407888_7FC15A20 
X-CRM114-Status: UNSURE (   9.66  )
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

Hi, this patch is to replace dev_* print function for the atmel_hlcdc
driver with more prefered drm_* variant [1].

It's eventualy up to you the mainterner to chose to apply this patch.
but since i am a starter to the kernel i'd appreciate it if you do.

[1] https://docs.kernel.org/gpu/todo.html#convert-logging-to-drm-functions-with-drm-device-parameter


Eslam Khafagy (1):
  drm: atmel-hlcdc: replace dev_* print funtions with drm_* variants

 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 20 +++++++++----------
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  | 14 ++++++-------
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c  |  2 +-
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   |  2 +-
 4 files changed, 19 insertions(+), 19 deletions(-)

-- 
2.43.0


