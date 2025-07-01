Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CBFC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 12:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2osz+FDlcrsw62TOPCgoVgngpNoshxMUDCHEG4J5fcg=; b=JDlem3z0wdz4tjoRfiBSrHf4J0
	y83NyhbrGM8xBbQL0mKSW3dJSjMlciMyc776c1syi9aaTNhCb+prQkRIxkir3Vzu/PsUP+nDsBAxZ
	0zIxhw4VReFLyard1dlW0qOYYMi/nczATdLDdSqg2lwerg+f+wT3yfeM6bo+pXINOwK3ga6cVLGQs
	Wri2tX7knd2rbiJFAGuan8VJnhAJLfUUPYoUHjFaqp+sQiqyp9AdV1DXXyXXAySmDZqvKCXXwMa5L
	P6JEZSyAgToy+/oBs7nMR6UG2qzblPsFFqgi0EgSmjfX42JbN5ikrcVy9cd8ZOkM7V3ArKseAq8Bu
	NR/gGLlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWaAm-00000005KoZ-0z4B;
	Tue, 01 Jul 2025 12:33:16 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZT7-00000004uoa-0lQk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:48:10 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-553c31542b1so3663736e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 04:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370487; x=1751975287; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2osz+FDlcrsw62TOPCgoVgngpNoshxMUDCHEG4J5fcg=;
        b=eDX11s3f5gM0huF0C6GGVtq6JE5cP0kJUd285t0wp+0lIIr+hk7sFJ6DgQXLBiUPwC
         Q+ltvcwR3jN1hM2xnbcvrynCQb120572ywol/aVdfbcwnIqNZhHPigjgF/20CSpPXfJX
         dhPpifuyfTaHxgJ4i5LLyMrYHqorAiYIW6M6HhuYrkSLANcqAVkxIetBEymb9wlMP6ey
         rE9k5iazq7IuTyu3UQ8Rv1FRfdf/b4m4fDM+E7ZTf5a/2eXP9KN2eYxd8PxeGOFfrzbk
         vIgGG1eWtEhaO3uyB/aAO3sdn2QXH+yN7bNNOWnY1BGe9Jhs/M0ol8ZZ7mib5j4iolkn
         KT6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370487; x=1751975287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2osz+FDlcrsw62TOPCgoVgngpNoshxMUDCHEG4J5fcg=;
        b=w2qR1zvwOlKgbLgKEbCdQ3HeOz1qM5slWXBhHShzOYcuIv/wRz3Db4ZUWATmD4+Yym
         tkh9nF9+EOYkSZ9YaJQ6uoPkOa1RwGtUKgUEr5N1Zfz4f222rfgz2kGT2kXINn1jhnkv
         1NnaeoJgogQLua0OJew+XRpqAnbS82j7XZjagfGsQNG4pr60B3qiHazK+GSawUIl0EuS
         DsLyr2+TINb7NbZk/6vSd+myVcWT+vpoRP56hY7W6xL7Ew/doowqBKQSlBgEJT7//ApG
         IBJanb8TTThM47oEAgVpYMsPRFR+BTSDQBAGMGg4lqkonDpWuGT0XmUfOTiNMPg3jGlm
         Es4w==
X-Forwarded-Encrypted: i=1; AJvYcCXGzsrT10cBIBqiKEjipd+gDeOpFsPom+sSdsHdC/c0Z7/FbJhGMbj/LxANYy6l/svtLG3ONl49Gy6x8XosF4hj@lists.infradead.org
X-Gm-Message-State: AOJu0YyzGy0E1/ZcIKK9Ve3lJKN/32w7251eDLDb5yChrfCqlDz8EUys
	VbXawwnuUgCj1+AT9cqXJt3KBMa06cQf7wzQ85MTdlq96MF6bKCx7GMOrkPdLQwPy80=
X-Gm-Gg: ASbGncuDnxHp05PyhkEl+01Eb9NhgW7gBbrAaXey6kPIdIVIv32HSjKvOpJ/zgpYe3X
	yGvKma6qpMZaGobWjWSDpL3+i0uNEQWoJyYD7y2FFj8vajlNz/fnXP3GCDwHrmkNTtLwv25y6eN
	WfpV97ShpKKzvClUOCksrwT+8kYZ3L+z0jOlkS4s/SkIhQgEYUw7ymc8nmoo3omQKsCked8iNvq
	7pSgl15tReG5E6vt4lm3l68KU5XOcWGNrwFM0jMkMpWzfk9K3wXWi2mZRx2LwomfhqppSLbnjWG
	p7oYqBIOWOCBwALmTNqhPCK1M+COPrKdH6SQ+xzmadNU2zFSRwnLKjPlUQA31fCIa4eWUWYI9dE
	DOWFufYt+R3eQez8M0HsNJO68uYbtmQO4KlaZ
X-Google-Smtp-Source: AGHT+IGlTarSt6qvH4lmgRN+oUq7xpGteKJYtvJDbrXapQ7Eb/KPRGsvT0Gsl8JnkqI6XMTfQaWnpg==
X-Received: by 2002:a05:6512:224b:b0:553:cf38:5ea1 with SMTP id 2adb3069b0e04-5550b87b62cmr5843364e87.15.1751370487436;
        Tue, 01 Jul 2025 04:48:07 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:48:07 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 17/24] driver core: Export get_dev_from_fwnode()
Date: Tue,  1 Jul 2025 13:47:19 +0200
Message-ID: <20250701114733.636510-18-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044809_218624_E4A5CF3E 
X-CRM114-Status: GOOD (  14.66  )
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

It has turned out get_dev_from_fwnode() is useful at a few other places
outside of the driver core, as in gpiolib.c for example. Therefore let's
make it available as a common helper function.

Suggested-by: Saravana Kannan <saravanak@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/base/core.c    | 8 ++++++--
 include/linux/device.h | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index cbc0099d8ef2..6f91ece7c06a 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1881,8 +1881,6 @@ static void fw_devlink_unblock_consumers(struct device *dev)
 	device_links_write_unlock();
 }
 
-#define get_dev_from_fwnode(fwnode)	get_device((fwnode)->dev)
-
 static bool fwnode_init_without_drv(struct fwnode_handle *fwnode)
 {
 	struct device *dev;
@@ -5281,6 +5279,12 @@ void device_set_node(struct device *dev, struct fwnode_handle *fwnode)
 }
 EXPORT_SYMBOL_GPL(device_set_node);
 
+struct device *get_dev_from_fwnode(struct fwnode_handle *fwnode)
+{
+	return get_device((fwnode)->dev);
+}
+EXPORT_SYMBOL_GPL(get_dev_from_fwnode);
+
 int device_match_name(struct device *dev, const void *name)
 {
 	return sysfs_streq(dev_name(dev), name);
diff --git a/include/linux/device.h b/include/linux/device.h
index 4940db137fff..315b00171335 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -1048,6 +1048,7 @@ void device_set_node(struct device *dev, struct fwnode_handle *fwnode);
 int device_add_of_node(struct device *dev, struct device_node *of_node);
 void device_remove_of_node(struct device *dev);
 void device_set_of_node_from_dev(struct device *dev, const struct device *dev2);
+struct device *get_dev_from_fwnode(struct fwnode_handle *fwnode);
 
 static inline struct device_node *dev_of_node(struct device *dev)
 {
-- 
2.43.0


