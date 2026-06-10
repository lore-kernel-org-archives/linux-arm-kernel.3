Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58903CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dDEOB4zDGGA532YGopw6vfAouEtuG7p7cdbO9K1VfZ0=; b=QCDNP9dcQuv2X+7f4F8JqN0oeW
	+SQ2qq1nvO+VnQRsMm3/e5bLhq7o/9LW+eVrYTq1OokaS592BjaABFuANjeXz22HuDdftpFNRdCBe
	Tr/WQG4nOQsTgEknXaIsaeMA9eOWujrAeO1J+DYO+I0PGQwyMGWZSW+w48QLRnlG8MWivdtvPL5OT
	TBJDQl5GDqYNc+PbdB8KH/2bcnQ1FJYo+V3NhTcLEnXmJST+sFL0gUKH2gNSVvQBxFh/X2BYntQaY
	4vl9UXYkkg4DsOcnNZqFUM8Fu4eVPfg7kTCfcIX3BCD02Rtkuf2k5sfLDqxWJjgyQjHmK9MhS4FeA
	BlfxyzJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVD-000000075Xm-2vO7;
	Wed, 10 Jun 2026 08:41:35 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVB-000000075Uo-0qzX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:41:34 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2bf36a6905cso46294655ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 01:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080892; x=1781685692; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDEOB4zDGGA532YGopw6vfAouEtuG7p7cdbO9K1VfZ0=;
        b=LUCph/g8hfSt2vrXy7gQ5ZG0jFJHwdsLDrwmRw98euoTAKgi7kwLre3noZZ8iQogC8
         p36soucduNYAXsCiqjDtXfa0kvLL0p5EZscO8xgJlHQyxmMVGdwhK6Tw0WGNZG7V5dxC
         PQY9i0GNDuLAZ9wINeaieVkvF1w5f+FCab0zM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080892; x=1781685692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dDEOB4zDGGA532YGopw6vfAouEtuG7p7cdbO9K1VfZ0=;
        b=EcdSXCUdHayNgElum+ZNYAJQPqzzOtZ7Hu+Vi8CeXLGMWIGrc8wZIykkN8e1T9UeML
         MS6r5mOFfZ/GMmdrHQpIQWit2yijKQeuBhMowSJn0xVGI9xtjmXhwFJMYqpp6/1kaMXC
         TIUYi1aDvmo+e0o/iR5WeZXjm+PUIiWGRtOcOMP+8tg2L0LtBkVD1gQRx91FLXZ+XDoA
         KHN7/OLRvpGumZ0lmNtKf2kJBNGynFtXS0FS+DO8l0rIMz4z5MMbzSCWNw+KAes2dEcP
         yoqQA5KO9k4J3XOUJY//juI/3JhXIdyHtfGAxYK3/yqO9vGU5moHOk5qVfegW3TUtjTJ
         V1HQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7ZexiRwzTwzsRbUwnZM/3FKXkzd1xHa1Va9pdg7cKKqzD8LVK5K99CPGrGAqQvQ2oHmjdsf2tJ/YElSmf7A1K@lists.infradead.org
X-Gm-Message-State: AOJu0YxiUOqaYAjXA9liog5TS1BUZ9VnSR4KXe2xEfuswvy6TvSZpjAW
	WPErO6d2dkk9rlLADo3H3LNhtiWPm08Wf3PUl6RzR+PlwE/h5NXLE8KNGSRunKQplg==
X-Gm-Gg: Acq92OGheQQugN4bBjboVc+oX9WTLqlFqtokxqHqbo+de7iQY23LnsdBdhjmhn3wK5e
	GDM5Z5eZmq/i3lvD3JuirM/TV0+m2lxJyPgSX7TSEMLovSbTrNsVuAY7VeO2iLQ1AlFwRIvLKX4
	Y2viFbj9ztQDncluHvm4EWeATcrp/QAhuaxJeyk/jeXCmk0QfhYxeIp4TqPUSQAKadFETdUl2IF
	eQTWZklNe1PFSAJ2niEmMwPc4AJ10RWB1MPWOvyRf8Qr/a5HJ2f00Cx39eFW3lvikYVD/e7QB23
	odLbSx5sw8tJQlAgQ6oHqeI9HTe7rer+kEpoRbgPxn5YAoY+EJ7h9jU1vwRvjW78hUqSVo4oWc0
	v/uHrLfK5qgGwoWXKdJJB0q4RQvddi/ZrP2hutCC4nXZ5vFZ33OrvNeL2dUHOsYmSGtyseYfwrz
	oqa8s2q3YGgFwjgcR/xZ6DxQp+5/ocGnTuTo8iE7okf8gOpK1LsFJAZUOI1cUsnnFYmRAJYGA0E
	xcKA36I22Rkomn1EA==
X-Received: by 2002:a17:902:e74a:b0:2c1:8fea:4dbf with SMTP id d9443c01a7336-2c2a1bafeb4mr79293415ad.8.1781080892355;
        Wed, 10 Jun 2026 01:41:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:41:31 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v2 03/16] power: sequencing: Change CONFIG_POWER_SEQUENCING to bool
Date: Wed, 10 Jun 2026 16:40:37 +0800
Message-ID: <20260610084053.2059858-4-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_014133_241768_A2AF588E 
X-CRM114-Status: GOOD (  13.25  )
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

USB support, including the core and hub driver, is bool, no modules. To
be able to use the power sequencing API in the USB core, the former must
also be bool to avoid the latter being built as a module.

Change CONFIG_POWER_SEQUENCING to bool.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/power/sequencing/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/sequencing/Kconfig b/drivers/power/sequencing/Kconfig
index 1c5f5820f5b7..27448fba9dc5 100644
--- a/drivers/power/sequencing/Kconfig
+++ b/drivers/power/sequencing/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 menuconfig POWER_SEQUENCING
-	tristate "Power Sequencing support"
+	bool "Power Sequencing support"
 	help
 	  Say Y here to enable the Power Sequencing subsystem.
 
-- 
2.54.0.1099.g489fc7bff1-goog


