Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693A3CD13DD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 16:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dAKdburdmTrd3xFQbH7tEy2HoAp3nACgzFyFbbo8g0k=; b=LRxaQUy/u4vRp2sie81Bfc+8Kv
	hEUf6KySEnB2XHff4S+0IcWxwJZlEbfAaBh1cz+hsWbn/IHbWdc58q43xht1zcYHHYliER3FCqFbN
	3gqahQVwsUJ5Vo44XVmqsjrMHeReqaxVDvD2+57dW1wfa1oXBM+MWbb2wEry+e+vfq/xE7OUx79Ch
	7bNMuG/XXu4vKkb2G7Om3BtRp/Jyjo9/p3HdZ1/I5kdD/mLNDOcy4YPDvElYS/NLBaP2kJu+x4EcE
	MkqXYlzNcU7e0k2nniaU1fGuT4MHCS6yBQGVDoAJx8w6SCb3NlpnfnuJS44Andyo7SGNXCBzsiAcP
	o44S20Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJDgm-00000009B5E-3fFi;
	Wed, 12 Nov 2025 16:27:20 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJDgj-00000009B2p-36Nr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 16:27:18 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4775ae77516so11065755e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 08:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762964836; x=1763569636; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dAKdburdmTrd3xFQbH7tEy2HoAp3nACgzFyFbbo8g0k=;
        b=yGm/08szW6P+PPWbMXdkl3/VW5wC0XVsUzi658GhVUQfsSUiSHzmu37SqBq/kSwl4t
         lqKSx7VzSHaFg1yxG7oogiLwFe1cdyRmjGgzctpkap8CuNqu2ANOn68L4pPCUcMAXIE/
         TNsr/fEFk74l2vkIlzmn0ItEKGcW7vRlNOr8l/kbeXv1phdmKStKY8T5zJxXo+IhnkOc
         dUhk98+HGEFe5Ob9S0yq83YezBXTtR8WqTiyHMbgKh7ikHoRwadusNiB50klHs9Z+PQl
         Pzhfb0cr3dvMbU2s0VueOehAyslAKNEXz0B9dARPd/DwIKTjwY7hMTmGj4oeZguwu7hr
         cJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762964836; x=1763569636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dAKdburdmTrd3xFQbH7tEy2HoAp3nACgzFyFbbo8g0k=;
        b=F5hqxAscqTFz19kZL+rV9ZqcO3uYDmS4OZYBZgxhh+LsWea4RRUOnRmXBJwZcRQboy
         tmsalrETYvJVgK3bWG7spEoONBYoZwhWmp4eFcFe27FgEU866D2TN/phe5VUQ0BEvoOO
         +Oi0e33RZIygKsw+PD1L9t+HEcxSchYQgwi9rK6MUVkVCSsocmRR5b22OZoulsH6LALa
         ZzGXgVo1K9q5uMckIBHZiORX+gGNK1ekWU3r35Y7+0Acbs3vxxrleoSx3/FcBp/Ia1Hr
         ghjllb8Idf+x+udPYJtlsGDzSyUPZmxcRTyEw1PkEa340nOZ7IkHffyaI9RfD+2qLja2
         eCrg==
X-Forwarded-Encrypted: i=1; AJvYcCXD5XJvsZ1FFFIN0h86Ywudah7RqdDd2dsFpsNyHeuol5knox151W972bOsIvVGQTgpx8MRThJgiwYmXNX22hM3@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5pCKb+VjKqcJvWjQiYOD4GNA/bnA5zkxO7kgKoq5sfx94GB6k
	cLRCK49kqTX9lOPrmtq1J72jjFqJY5bcu03ZFnW3R3bYxIgoARh4NqWBj7ItgReBUrs=
X-Gm-Gg: ASbGnctCSQCfABBD6XPbsgEokYqWPtNOZCDO32QaH12gJFscOIkBCcdInowynWVT3lu
	aNrmaZgIYZjutwfjMzq489nGARjDxbXYK/b8BOqff087TlL64L+oGoWEnN62R1jr3MlYvrCbrvI
	Q2MbFfOalNUMcGfVI8n9hZHLWkglhFtfR6h+DkeEUu4xhdv8Q31hqcSiLAF2+R+DhXIeF6IiJhP
	LE2a/sQXbESnRV6xUboG7+giTxGrLpoeLM2Em3+YXtc6phQxu2+6dPKSA8CtGLcaXJ/3Yms4/3e
	OHfpFzrEvw5oOHIXjmHh2CjgieaqhfvUAHLs6EeJLoWCXajUeRM7GHYkdhvc4AhsC7a2kKaQBE1
	CILhTGggZDloWKBzWbPZcMwVaqETnfI4aK96hrSowxKRUyL2cfS72ptiog1FDeV5t03Kx9/99Cp
	trl50BDTbL5y83c4hcidGiR7hGJQABZ5s=
X-Google-Smtp-Source: AGHT+IFqo3/svwWqD0iD1WGGUDvvT++y/w5W7U0XhvmlLgCSNPX5h0N4MUoKFDwPP5zIqH55u/pB7w==
X-Received: by 2002:a05:600c:1391:b0:477:5cc6:7e44 with SMTP id 5b1f17b1804b1-4778704d776mr29462015e9.11.1762964835730;
        Wed, 12 Nov 2025 08:27:15 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e36ca3sm48534815e9.5.2025.11.12.08.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 08:27:15 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 12 Nov 2025 16:27:06 +0000
Subject: [PATCH v5 1/2] phy: add new phy_notify_state() api
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-phy-notify-pmstate-v5-1-39df622d8fcb@linaro.org>
References: <20251112-phy-notify-pmstate-v5-0-39df622d8fcb@linaro.org>
In-Reply-To: <20251112-phy-notify-pmstate-v5-0-39df622d8fcb@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3708;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=DjGwOCNkvyUE4A7k0D/F77jFR+qtAXMy5dKibtq/0dY=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpFLVfIqxBioAhOzku1ZwQVC5Gs7ki7qKHySjkQ
 rgVwmlIR3GJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaRS1XwAKCRDO6LjWAjRy
 upF+D/9ff2Zl3hJeeYUtZ+jPkL6DLhM9xU1xU3Yp1gA/XZLtyDMog2pNBCXhej5Tdw+Q92o5GDR
 QMF5/gtbNkazmxrbh3LPUWnP6TjP8Om8E4upWlcRpqmPpYti7vOQlV/w3jwi0SQGEZpd8PHQcii
 PIRLrX3BSPZFxBn/5ahvGrnglnlH1+K5fzllWbM+ZGqI/+lLHBcckfhcwvvbavHWh/jG1Ah0660
 m7tkJYaDpoKvEiIlmveZySppTu+yzR0XtFiR9PiisvGyzjFCfqgCjlubSRtOFQOe8gsDGz5tARP
 0Q6AglGz+P3c+oAwKcYM50L7yvMHmNVZWg4Xmt1I/ISN8v/J4Ot/lPdjvLBdgoVNL4H8+DGxB/j
 QGfIlkkBfdsCW7rcFejNVKFgVwxPA+X+Sz7YazyTgiTmIzHH7J2SYGM3/U0F0yXY5LQRcoCM104
 NQkdY4DlxdVhMWuVi0mbFOk0qHWBQ5gBHc/DtWXBdJj8ks2jk+CW8euND0drJK66DHKDn/NW6ny
 VP2QzrLnb5FXc+T48yA6VjRR0PrH3AHZ6ulxWiFJ4IU36WX/sRCz+xBvyI4oo4zzG3lzJNXxzPO
 O+S88sBnSEcHxXSM01yqY0X3iZ0DRs7Byz0jWYMm7o848Sr+ftCxj51CiCVvfz7PrRyVWo9uEa3
 Tt60bKvKELq+hww==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_082717_818043_0E29B2A5 
X-CRM114-Status: GOOD (  16.33  )
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

This is intended to be used by phy drivers which need to do some runtime
configuration of parameters that can't be handled by phy_calibrate() or
phy_power_{on|off}().

The first usage of this API is in the Samsung UFS phy that needs to issue
some register writes when entering and exiting the hibernate link state.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v5
- Fix typo phy_notify_phystate to phy_notify_state (Russell)

Changes in v4
 - Add missing 'used' word (Vinod)
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
index 13add0c2c40721fe9ca3f0350d13c035cd25af45..2af0d01ebb39f27dfb34ccb5140771beef8288d5 100644
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
 
+static inline int phy_notify_state(struct phy *phy, union phy_notify state)
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
2.51.2.1041.gc1ab5b90ca-goog


