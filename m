Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBE0CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 15:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fx9XFYSygafEf4R96ceqLm11HUcCM+e6rJw7J3OQnS8=; b=qBFJKxDpic8i5T1NR3QQC7IBUM
	lKyEDFloU1c/E+S31gOhoPVki0LcpXDgdZDqM1ZtOkIXIkynz92t4mcw9Pjeq7Fy7rys2hfPDrEJN
	Xd/J/590oVVLoWKB/RLv3uytX3IqekJDcw8QC6avuFPGebN7siXRT29kcgbu9qKPze9N/hC27toeQ
	ajEKAukzmAofgyBCK07HSkXnkzIV419+d2VmP/o6YONNDUPlfIB+rohpUmaNxONI1OIP/q2uq46pj
	dmwGTiLCSZhJqWhANsbiYYrR3B24ROuuIcFoch6wlzZTxAa/ZfC1sxn0Z1CBvnEiUjeVdDqBdCK3M
	iUtw2wVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDbK-0000000EDpH-3ap1;
	Wed, 13 Aug 2025 15:41:18 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCz3-0000000E74F-2jfS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 15:01:47 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3b913a76ba9so1764213f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 08:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755097304; x=1755702104; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fx9XFYSygafEf4R96ceqLm11HUcCM+e6rJw7J3OQnS8=;
        b=c1N/RXiB/1WtBE5wDbDhz4bcr+W2lpYsUonWzDLDiG/nUERocmQlVFra5ZNt+FyhD1
         MEl+bqaflfJyhY/heGcbPTkjdxjnjnkFWlS6PSTisv0xw/vFTP3uhpFsw3oeyTq/8Er1
         HcewP2KGxpnq/4uhJuW4ltmg/8AKRyBL/39pLtJRrsVCXvq9TK/J8ypvQ1NhXjFuzSIx
         B1eRkbUCRK5sxJV2/FfxdTO0AdIr0ct0IafuvX34QGmLbQNElGWejp6wxPJVzZn8AmNM
         qbwXcOBSKwvY63wyra44tXHp+a0g4ZGx18TorWuuWgpTZZ9uDaaOX4wCXkthUyMJ+HPe
         RfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755097304; x=1755702104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fx9XFYSygafEf4R96ceqLm11HUcCM+e6rJw7J3OQnS8=;
        b=paGc7qDHhboB8nXdc64DGvhyn7MBjbU8LjAoOEQdijamLqCUB+nHEVRM8ACzcOOoaX
         PqYcD4tdwR0wfm46oEervhyy4o3XIqt+sMoMVl88PgYOvTdUt6a3xkLb1kxecByqffCt
         gY0t/CbI5GPZ/x6LoS74/rHsSdbn3FS3On/x8MR7mSBZrNkegISpQ/5aPE/WTDXo/+g8
         +c4ITGKWRQSQWiwdDUCIbHdtXvfHkzb2pC6d9FH15ITbo5e4uqi4XkJuY/mFLbMPqn7k
         b9jkaer3rmx31CgA4iRmp2rh25w2GJZQbbSD5k4WnBcDrZf8aEGrt0e3fBaxztkspokN
         o6Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWA5TdmtpLkb5Em/cCB2ENt45ghH+zQrYXtTI5wmq9RAYFtkStffidP0akmo1KKSBOt/KYLvqMVGGUUgQzw+pUf@lists.infradead.org
X-Gm-Message-State: AOJu0YwC7zgICMyF2Rry4To12Hg0F7zYTjZZXoqQrz7luBNNcMJWIxVC
	f1nxiyXCR5ZIpIlyYpNoLpo16eVZF4r2o+kn21u3FIFlaozL64IdmJE68UikaUkkdZY=
X-Gm-Gg: ASbGncv3zDnzHXxm8qrOje1n/efdyyu8LqDet0zPrfr4xP4RMirFlGKSZw2QVJX/WXi
	5EGlLF0kkEq0vb+GITAJJ42av5n702ipIUxLxFPLufVO5y2Vyt6SnrsVbR/bvRU93KeHxFDCICg
	f404H91Od9x4l8LCR1aCw6kcQXI4wfDzbx53c720nYZ5SHVWZJwkpjzMAthvpjt15pH7Q1PYAkI
	Lyi8dvbE5DfT2jFi49MF+rL1iW2kSeIyQE3lhnJ2K6wWZpMHpJ7KV3R6VA+tXFnJ3I0jJ4SrbxX
	mxMEBFaN/+Dq9DjrBZgmTuHuoTBaWI0LhtTU2Iu4+uejBqvv3knRE/8T8pxg28eJca6Pt5K4SzH
	xjaFbviWjB8hMkeoV89JBruSg9n26UAT4QqcmwUfqRibWYAIYJ1bG
X-Google-Smtp-Source: AGHT+IHHEppE5c1msSWpvPNGDeJ0L2gbES2G8NQv75tbQblsBVY/pnBdDlsIUFyhes455RLdzsw2Ag==
X-Received: by 2002:a05:6000:430a:b0:3b8:d8cc:dcf3 with SMTP id ffacd0b85a97d-3b917ea1891mr2665904f8f.29.1755097303966;
        Wed, 13 Aug 2025 08:01:43 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4533f1sm48402964f8f.42.2025.08.13.08.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 08:01:43 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 13 Aug 2025 16:00:46 +0100
Subject: [PATCH v3 1/2] phy: add new phy_notify_state() api
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-phy-notify-pmstate-v3-1-3bda59055dd3@linaro.org>
References: <20250813-phy-notify-pmstate-v3-0-3bda59055dd3@linaro.org>
In-Reply-To: <20250813-phy-notify-pmstate-v3-0-3bda59055dd3@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 kernel-team@android.com, William Mcvicker <willmcvicker@google.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, neil.armstrong@linaro.org, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3574;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=ou1YbcmDAQuFZIQSBFO3cs4ywO/Xw4Ff3K2ot6JDrmM=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBonKjTcQVvzkl99cRpsmbJthiLrWXqqpZ2pxhxv
 E6xgE2WypqJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaJyo0wAKCRDO6LjWAjRy
 umEtD/9UveN/e7FZ+RSrEZJd+b8j0lGAUqmY+jZ9y05oOB8e3q2cqotrhoIU+LbL6x4ZHG5z5bD
 3JJ2SauGDAapti/Q+7EysYF8Vmhu0+HJqPJRWkAz6dzz9WMZbJ2aSqfUjRFaDpHcbZIJ1apcK+Y
 g/NCg6OwtMMbX5H1lbDCS8MWSukPZktcPe1XQdoeZDD3qFaKFByXjxEpRij+8XPkcvhxe7fKNke
 AKbJ+srnQJ+7gnW/cV01WfCBBo67RbG4TqS+XYEfzGViWHNtdaC9Z8PvTsFBO3IWKYu1XO5jzPG
 yPY1PUwdpSqyozBLT5s/VoHgPtLMBXar106HEAMUsKJ7ca8EPfFsHdCzteIqVmDr5vtY7nidFXQ
 sbK7GeP9izVmlpAJLRrNTsyEdo5qtmCK6bwqkqag2Fjvp30SwdVgEZfGyrUs1TaFIVgWbya+Hn7
 XERWhT+iw3P9oSOnCOnwwOObe/y1m+VswfWshErI/NJAVaZflBcmBVZnOlhdxS7jxTa84VStNOd
 fSnkO0Mpa+/lrw+kmjIffhHmJAd2TRocp7abCIXuHEj6RpoBX+D0OXJXDrGUEWbMu62kSdX4TW9
 DVpEfqNaoFHVjomg2QOWFi2Rc+5uo5NKu+ymiO0FHkkJEST19SRYq9LuKkgmFl9TpK5K/Ybxr3/
 Lb48nF9k7EhW+8A==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_080145_702288_D8B99F38 
X-CRM114-Status: GOOD (  16.35  )
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

Add a new phy_notify_state() api that notifies and configures a phy for a
given state transition.

This is intended to be by phy drivers which need to do some runtime
configuration of parameters that can't be handled by phy_calibrate() or
phy_power_{on|off}().

The first usage of this API is in the Samsung UFS phy that needs to issue
some register writes when entering and exiting the hibernate link state.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/phy/phy-core.c  | 25 +++++++++++++++++++++++++
 include/linux/phy/phy.h | 19 +++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 04a5a34e7a950ae94fae915673c25d476fc071c1..60be8af984bf06649ef00e695d0ed4ced597cdb9 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -520,6 +520,31 @@ int phy_notify_disconnect(struct phy *phy, int port)
 }
 EXPORT_SYMBOL_GPL(phy_notify_disconnect);
 
+/**
+ * phy_notify_state() - phy state notification
+ * @phy: the PHY returned by phy_get()
+ * @state: the PHY state
+ *
+ * Notify the PHY of a state transition. Used to notify and
+ * configure the PHY accordingly.
+ *
+ * Returns: %0 if successful, a negative error code otherwise
+ */
+int phy_notify_state(struct phy *phy, union phy_notify state)
+{
+	int ret;
+
+	if (!phy || !phy->ops->notify_phystate)
+		return 0;
+
+	mutex_lock(&phy->mutex);
+	ret = phy->ops->notify_phystate(phy, state);
+	mutex_unlock(&phy->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(phy_notify_state);
+
 /**
  * phy_configure() - Changes the phy parameters
  * @phy: the phy returned by phy_get()
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 13add0c2c40721fe9ca3f0350d13c035cd25af45..664d0864c3a5042949cb121e982368fe0a97827f 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -53,6 +53,15 @@ enum phy_media {
 	PHY_MEDIA_DAC,
 };
 
+enum phy_ufs_state {
+	PHY_UFS_HIBERN8_ENTER,
+	PHY_UFS_HIBERN8_EXIT,
+};
+
+union phy_notify {
+	enum phy_ufs_state ufs_state;
+};
+
 /**
  * union phy_configure_opts - Opaque generic phy configuration
  *
@@ -83,6 +92,7 @@ union phy_configure_opts {
  * @set_speed: set the speed of the phy (optional)
  * @reset: resetting the phy
  * @calibrate: calibrate the phy
+ * @notify_phystate: notify and configure the phy for a particular state
  * @release: ops to be performed while the consumer relinquishes the PHY
  * @owner: the module owner containing the ops
  */
@@ -132,6 +142,7 @@ struct phy_ops {
 	int	(*connect)(struct phy *phy, int port);
 	int	(*disconnect)(struct phy *phy, int port);
 
+	int	(*notify_phystate)(struct phy *phy, union phy_notify state);
 	void	(*release)(struct phy *phy);
 	struct module *owner;
 };
@@ -255,6 +266,7 @@ int phy_reset(struct phy *phy);
 int phy_calibrate(struct phy *phy);
 int phy_notify_connect(struct phy *phy, int port);
 int phy_notify_disconnect(struct phy *phy, int port);
+int phy_notify_state(struct phy *phy, union phy_notify state);
 static inline int phy_get_bus_width(struct phy *phy)
 {
 	return phy->attrs.bus_width;
@@ -412,6 +424,13 @@ static inline int phy_notify_disconnect(struct phy *phy, int index)
 	return -ENOSYS;
 }
 
+static inline int phy_notify_phystate(struct phy *phy, union phy_notify state)
+{
+	if (!phy)
+		return 0;
+	return -ENOSYS;
+}
+
 static inline int phy_configure(struct phy *phy,
 				union phy_configure_opts *opts)
 {

-- 
2.51.0.rc0.205.g4a044479a3-goog


