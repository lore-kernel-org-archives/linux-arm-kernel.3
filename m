Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9919D7495E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 07:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fM5s6QQy70TfZfd9/oqmPb/4xjVNQ5k0swJ7RQS7j0U=; b=UNOPNjQH1AaLKt4qgB1DgJpXQY
	endsP4fIvkHDbSArngbMh0kCgQkPMVMIXAzKCtEVzRZn7QwvVqKC7CUU5zh5qzTffHSWw2lC3wffk
	Ga5jYi5ea+WMejiMu8Ud/wxE2Wyo1I4HWpp1w/Die+ajPCAYwbWqsVKESQsi+O6oQReWHfFUs6tkU
	lUe9kFhudTXOhbJIgtjkmd8/xWN8MZjE8XhyvCpdm52KbC8LCicXp4TMBpLeVxYzEmhe8mJ2Sk0OZ
	NAiDBQEgrhpnmNqJrdp3g1C7Cc9zkP7ycjqP4BTc4lTtF9EDKiN9Qp8DjLItHXO99QcaAJJImF5xE
	PwgQzxVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t635f-0000000H8WV-2mPU;
	Wed, 30 Oct 2024 07:26:03 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t632O-0000000H7k8-1Svj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 07:22:42 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20caccadbeeso69069255ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 00:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730272959; x=1730877759; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fM5s6QQy70TfZfd9/oqmPb/4xjVNQ5k0swJ7RQS7j0U=;
        b=miCWZaYjOLb22BCJk0t/ZBT+9TdL+bHlb0/rKY7+5YNLAamxjlqbEruUP/SZ9i2ijb
         rNl/hEsn1VbVz7rnZ5lLc8wD5alsvyuJb6H+AgN4TzynVo7N+PkGF08z2XjbkxhXZol2
         xlMa/+j1vAMvDMMQ/Q69VY0Qi0wok81ABHSQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730272959; x=1730877759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fM5s6QQy70TfZfd9/oqmPb/4xjVNQ5k0swJ7RQS7j0U=;
        b=JnH+xTPefX5ie50Kpeia/jMbvbOgmFOssqvfOY73ejOwzahYkRkuYr4FS0DvMKW/1z
         BtRngHlOhnQ98GxhzwHd7UpG3vA8fQNrQdF0lZ3vPEsRgEUlHPDLbOVPTUtdH4n9vf0b
         u52V3X14dE9f3x4gJl8nnTt3gOejbSvuINWosF6VmV4ktyenndElJFxMgfq87PPYOgq5
         O8qqfHtS55T5QUJsFn8pUuRXwiLIeK7tMos3QJrY+YYaIGcn1lWBGsX/mu08oxzM8PEx
         XjSQsmB2Gd+zr2rMZS1F1JZZC94k89XkbDaS3wT8dmZ2TvxkIQZCbEASBs2mqDkFVVB6
         DUdw==
X-Forwarded-Encrypted: i=1; AJvYcCVZOKJYwrK4z/3683bh2HWtCH55cdzioBAtCLHoEojijcgoCs+w4ZdCPcX3E/4jQpk+wKrLdBY2nPclM2s+Kw3P@lists.infradead.org
X-Gm-Message-State: AOJu0YyjW7VjTwkiuOTpU+9HGVeRDJ1jHPUJwq24sK8ioEagnC8f3wSf
	cL5EeEquP0ZVQ4ic74FJ12c5ukdrKo57adCPqcYuG/2RO+faIZ5so+yMSsvEqQ==
X-Google-Smtp-Source: AGHT+IEL/su+vsISUs9abpUuCumE5CbCLhz9veBdyK5LYmCDfHySC/SvqqxJuuhli8/bG+nFSB8S6A==
X-Received: by 2002:a17:902:e801:b0:20c:dd71:c94f with SMTP id d9443c01a7336-210c6cd3c45mr180749055ad.41.1730272959361;
        Wed, 30 Oct 2024 00:22:39 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:d1f3:aa64:657f:d8a8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02e67esm76641445ad.186.2024.10.30.00.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 00:22:38 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v10 1/7] of: dynamic: Add of_changeset_update_prop_string
Date: Wed, 30 Oct 2024 15:22:22 +0800
Message-ID: <20241030072229.1013235-2-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241030072229.1013235-1-wenst@chromium.org>
References: <20241030072229.1013235-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_002240_413328_E7AAF2CE 
X-CRM114-Status: GOOD (  17.16  )
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

Add a helper function to add string property updates to an OF changeset.
This is similar to of_changeset_add_prop_string(), but instead of adding
the property (and failing if it exists), it will update the property.

This shall be used later in the DT hardware prober.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes since v7:
none

Changes since v6:
none

Changes since v5:
- Collected Rob's tag

Changes since v4:
- Use modern designated initializer for |prop|

Changes since v3:
- Use new __of_prop_free() helper
- Add new line before header declaration

Changes since v2:
- New patch added in v3
---
 drivers/of/dynamic.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of.h   |  4 ++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index d45a8df61380..0aba760f7577 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -1072,3 +1072,47 @@ int of_changeset_add_prop_bool(struct of_changeset *ocs, struct device_node *np,
 	return of_changeset_add_prop_helper(ocs, np, &prop);
 }
 EXPORT_SYMBOL_GPL(of_changeset_add_prop_bool);
+
+static int of_changeset_update_prop_helper(struct of_changeset *ocs,
+					   struct device_node *np,
+					   const struct property *pp)
+{
+	struct property *new_pp;
+	int ret;
+
+	new_pp = __of_prop_dup(pp, GFP_KERNEL);
+	if (!new_pp)
+		return -ENOMEM;
+
+	ret = of_changeset_update_property(ocs, np, new_pp);
+	if (ret)
+		__of_prop_free(new_pp);
+
+	return ret;
+}
+
+/**
+ * of_changeset_update_prop_string - Add a string property update to a changeset
+ *
+ * @ocs:	changeset pointer
+ * @np:		device node pointer
+ * @prop_name:	name of the property to be updated
+ * @str:	pointer to null terminated string
+ *
+ * Create a string property to be updated and add it to a changeset.
+ *
+ * Return: 0 on success, a negative error value in case of an error.
+ */
+int of_changeset_update_prop_string(struct of_changeset *ocs,
+				    struct device_node *np,
+				    const char *prop_name, const char *str)
+{
+	struct property prop = {
+		.name = (char *)prop_name,
+		.length = strlen(str) + 1,
+		.value = (void *)str,
+	};
+
+	return of_changeset_update_prop_helper(ocs, np, &prop);
+}
+EXPORT_SYMBOL_GPL(of_changeset_update_prop_string);
diff --git a/include/linux/of.h b/include/linux/of.h
index 086a60f3b8a6..d0307e3b093d 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1651,6 +1651,10 @@ static inline int of_changeset_add_prop_u32(struct of_changeset *ocs,
 	return of_changeset_add_prop_u32_array(ocs, np, prop_name, &val, 1);
 }
 
+int of_changeset_update_prop_string(struct of_changeset *ocs,
+				    struct device_node *np,
+				    const char *prop_name, const char *str);
+
 int of_changeset_add_prop_bool(struct of_changeset *ocs, struct device_node *np,
 			       const char *prop_name);
 
-- 
2.47.0.163.g1226f6d8fa-goog


