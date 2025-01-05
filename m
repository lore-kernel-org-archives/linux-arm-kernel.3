Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44C9E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 23:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WCrt8tmPhl/PazcPZULV+mOJhKFlUUnTodJCBeRZ3LU=; b=zc7dfV6vWv0f4S
	wHVZfi0RuaMeC1vu6zJieBQlTt5EYIvO+c2FZgAxzLmDidY88BySm3ja2CQAjB6LrwWZqS3xOr87+
	P7Ee2aGq6V+rq7VJwuMnQh+E54okSzgW2ayNaGB05gD3sxdTlsK6ED1Ka85MYHzbTC1pm0AV+eBxc
	KQtm2ApcyLLI5XFPbQWTWno/25n0q03iBJdV9/r5N+vN0EkPaKOSO3o7FBShCVGeXBQeVUT3yzott
	bVy2xsR2rSXjaC4EF1VDkLD1ohA5fYSZeqtGBBNGp0tTmIM/PEy0GiEkIpFLVpMmJChu0KYSBP3Mu
	QLKb6R2MGJzeOv3kB0hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUZcm-0000000HUmo-2Vfn;
	Sun, 05 Jan 2025 23:01:36 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUZbZ-0000000HUbM-2jyp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 23:00:23 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5401be44b58so14772310e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 15:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736118019; x=1736722819; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WCrt8tmPhl/PazcPZULV+mOJhKFlUUnTodJCBeRZ3LU=;
        b=jhDV4SAMPybwBoQ6SwHaVMIVSMXBvcGnnMTJe5didymfCBXqtXQoJnk70TPO6MZA98
         xUCZ+VWlrrswumpny+LuGsK7ViTW6bdJvOPKNzRIExA4Lmjg259NtvtdwPaw8635Oa3y
         kUsafW70yfN/ixEa2KL+7Ek7jYGINKj/S9oq37YEf+VzLGubPwTiFm3aY34WIYb9ary3
         R5hEXqombba4Kz3RrdveuDBu/lMmhBuEXu9qa4+8M23geqo1Ok4zWWT65GFv74Gorj8A
         kP0HhRjVhgQ4gC2Y8L6SzHT6jwb7sZ2glLswQRfRrsZNvz2r2We31W7MuwWksEOvK1xy
         8KuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736118019; x=1736722819;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WCrt8tmPhl/PazcPZULV+mOJhKFlUUnTodJCBeRZ3LU=;
        b=gOZYXofTEoxUsSRdhPr5PLvEp0Dz5vR6Fx+BNyvvqvCiayYKwKarh/9DZS+M12vsF8
         dxHwFuFaInPxVyFgAcX/sLioiiDxzYrRYw7oDz6IWzP8Ox7pWWfJRtrM+v2xvXkRyYW2
         RADoLpEzreM1uZ62Uqth7t+LR3DLrkfPwNb9iNBEs3r7IcU6+rQxur+sExuOlxsVO/Kt
         vwY1FILH/xlndJq+dUViz+2MXwnWHtGbp/24FLqJ+K+k3cwok8Km3Pu+qwiMmtuE58RX
         UaIGXzcKU/TfVfoMV9AQbzldERA/+J4+thv12b7IsjYdfurSMHXl/500llr0Ybmk1K5T
         ICOw==
X-Forwarded-Encrypted: i=1; AJvYcCUaOgb5erYJbUnyS+HmiCOdAgeXRNoCfevxyC6u8TI7irgKnxT+48exM1em1v42hwWfUUavz2tcgMbhQZWBrDwW@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3JI7vU+osX7Pn2h8YNOYpYr7+dTbFx09uKw8h6/mrD/e8I/v+
	p8QJ/VkCyaES+yNXet81oJ8zk6L/fzARA4PuJi5gCFF/3/pUiecBfophU0Uu3Pg=
X-Gm-Gg: ASbGnctNFzGkHOw0JQIuDeIPVaxEEtQHKNTpuCKRJp61CgrzSiIrEUDdxJ2fYmBBRor
	PExouPNi5eCjsvm8of6q+CmKgQIGjFRKh6qKACJOqcaz8ZqoNFn4VpZ2NFoXyl77/ux1AuKQgfk
	ESr9ticAR/LHZxns1CPwR39idXxBKiM8jd8JnorbQrWu/iYouAxDIWT5+uhvfcTHHDbVJVPG1Fz
	AO49FjKvm7V2KeCVRnqJsZt9bn4P3VwhF+zl79esb2m8FRtpi7QRF/79FRVKfUm
X-Google-Smtp-Source: AGHT+IEa9s4RHPghxGMaSlBDMdhWj+kIQ+tWX+hXXbf8XL3JqgaWtSiYuSXqPjuyp6pc6VeEB8MVYg==
X-Received: by 2002:a05:6512:1316:b0:540:2fe6:6a3a with SMTP id 2adb3069b0e04-54229586bf8mr17486044e87.57.1736118019321;
        Sun, 05 Jan 2025 15:00:19 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223821583sm4614034e87.203.2025.01.05.15.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 15:00:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/2] drm/nouveau: remove drm_encoder_slave interface
Date: Mon, 06 Jan 2025 01:00:12 +0200
Message-Id: <20250106-nouveau-encoder-slave-v3-0-1d37d2f2c67f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPwOe2cC/4XNQQ6CMBCF4auQrq2hQ6XqynsYFyMdoAlpyVQaD
 eHuFla6MC7/l8w3s4jEjqI4F7NgSi664HNUu0I0PfqOpLO5BZSgFSgtfZgS4STJN8ESyzhgIom
 1tRqgRY0nkW9HptY9N/d6y927+Aj82t4kta7/xKRkKe9k0dRGG6DqMjiPHPaBO7GSCT6Zwy8GM
 kOtwZLqowENX8yyLG9bTawVAgEAAA==
X-Change-ID: 20241214-nouveau-encoder-slave-a6dd422fa4a9
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2854;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=aOcldVdbqjILyVtpyvco3ISK3lAxKklS6+rIV9e5yIM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnew8A6i1DrQa3drg11bpFI5xDxBHFm2GJFs6S8
 4LEOv7hVdWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ3sPAAAKCRCLPIo+Aiko
 1UIUB/9gJhRB28XgXdRmeE1FB7beSSIMy3GgOg2qDAkyBrtFcV8QtLJfFosMb5r3bk4zKMUcwWj
 NNpQVR+JzaOle1FJg+G5WrPzP/j0EYZdKmQ9aDkJnJjqaBnj3muYy33eNqeawoG1VlvsX0ucJrU
 SI9052sa64qB6yhuN8yF19vWRPmh7p0s+t/mN4yoWxwwm8bXg+iY3UKqR+L7Pl8Nu9Eq0IGVsck
 c6pGxP+2aOXgbojo3ZeE3lNQ3k6/06d0dJiRR4RkNhKR7b0aw4HsusGa1AU26bEGD/qWJoe2FkT
 O642Cc2V+xCLZ5nurz5Hn945TdhBkUfuIz5bpLqjta+4a5Qe
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_150022_564542_E9B20DF4 
X-CRM114-Status: GOOD (  13.49  )
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

The nouveau driver is the only user of the drm_encoder_slave interface.
Demote it from KMS helpers module to the nouveau driver itself, moving
corresponding I2C encoders to be handled by nouveau driver too.

Ideally those two drivers should be converted to the drm_bridge
interface, but it's unclear if it's worth spending time on that.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Moved includes to drivers/gpu/drm/nouveau/include/dispnv04/i2c/
  (Danilo)
- Trimmed Kconfig entries to remove mentions of "some nVidia cards"
  (Danilo)
- Fixed checkpatch issues related to alignment and code formatting
  (Danilo)
- Link to v2: https://lore.kernel.org/r/20241215-nouveau-encoder-slave-v2-0-ef7a0e687242@linaro.org

Changes in v2:
- Renamed symbols in defconfig (Laurent)
- Added missing Kbuild file (Laurent, LKP)
- Renamed guarding defines in include files.
- Dropped mentions of two removed functions.
- Link to v1: https://lore.kernel.org/r/20241214-nouveau-encoder-slave-v1-0-beda767472e3@linaro.org

---
Dmitry Baryshkov (2):
      drm/nouveau: incorporate I2C TV encoder drivers
      drm/nouveau: vendor in drm_encoder_slave API

 arch/arm/configs/multi_v7_defconfig                |   4 +-
 arch/parisc/configs/generic-32bit_defconfig        |   4 +-
 arch/parisc/configs/generic-64bit_defconfig        |   4 +-
 drivers/gpu/drm/Makefile                           |   1 -
 drivers/gpu/drm/i2c/Kconfig                        |  18 ---
 drivers/gpu/drm/i2c/Makefile                       |   6 -
 drivers/gpu/drm/nouveau/Kconfig                    |  18 +++
 drivers/gpu/drm/nouveau/dispnv04/Kbuild            |   3 +
 drivers/gpu/drm/nouveau/dispnv04/dfp.c             |  17 +--
 drivers/gpu/drm/nouveau/dispnv04/i2c/Kbuild        |   5 +
 .../drm/{ => nouveau/dispnv04}/i2c/ch7006_drv.c    |  30 ++---
 .../drm/{ => nouveau/dispnv04}/i2c/ch7006_mode.c   |   8 +-
 .../drm/{ => nouveau/dispnv04}/i2c/ch7006_priv.h   |  11 +-
 .../drm/{ => nouveau/dispnv04}/i2c/sil164_drv.c    |  33 +++---
 .../dispnv04/nouveau_i2c_encoder.c}                |  95 +++++-----------
 drivers/gpu/drm/nouveau/dispnv04/tvnv04.c          |  24 ++--
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c          |   4 +-
 .../gpu/drm/nouveau/include/dispnv04}/i2c/ch7006.h |   4 +-
 .../drm/nouveau/include/dispnv04/i2c/encoder_i2c.h | 121 +++++++++------------
 .../gpu/drm/nouveau/include/dispnv04}/i2c/sil164.h |   4 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c        |  10 +-
 drivers/gpu/drm/nouveau/nouveau_encoder.h          |  13 +--
 22 files changed, 190 insertions(+), 247 deletions(-)
---
base-commit: 938fbb16aba8f7b88e0fdcf56f315a5bbad41aad
change-id: 20241214-nouveau-encoder-slave-a6dd422fa4a9

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


