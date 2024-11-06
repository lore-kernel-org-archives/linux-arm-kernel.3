Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106E9D44D40
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 10:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=llYngkqgiFGTwpRX3D7wCxxqCsKOgB9wOxApc/ic0J8=; b=aC+DvNPygk5BRA6W8vTrpTb9Wj
	kvQ2tbgjWwkagvTzzEyknTnDtLKGNffLzKWvcIIOMEQMdw0H5RxpnZKd3HpjCPv3sc3tZcSh/Sjbs
	0TLmZnpEMHAq6ksSdPC8NmopegRQsTnwbMAOL7ZUHXC5KbDVZ2eFtrIYfGHsR7ZD91QEyBJdYsH+J
	//1IOq+aScqLqZPUjZwtEVs4wu9Vas/6KP3O1ad5LL3FGPfXb9gDPtLa1d1kPzTH3bsK3yz8MRvqE
	dKGKakRJEBLEtZk27HaHHU3HDkU1pS/0i4G6yJR6t1p7xE0SIoOp7wx2q39uCZBBTecGVLfkWMzZn
	ukVILoRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cv5-00000002fys-0LTw;
	Wed, 06 Nov 2024 10:05:47 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cQT-00000002YTV-4Bg9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:34:11 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20c77459558so54640105ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 01:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730885649; x=1731490449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llYngkqgiFGTwpRX3D7wCxxqCsKOgB9wOxApc/ic0J8=;
        b=C73wAv+FB4pDXNeUYdvtreCqhqJfpyKjUCwk2f0HhjcPseDfoBEHQRqpDiD2bmYhaE
         m9eFScJ0blOqD/Ac51spxFRIQtSrhukemmWx3njME4Fryex3RFaVPwYxOWr8PoAcbFv9
         hT9EQAe0OCD0sGu8Jwm0yQHVKS88IToSyk+2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730885649; x=1731490449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=llYngkqgiFGTwpRX3D7wCxxqCsKOgB9wOxApc/ic0J8=;
        b=MHbRe8FvYqqhXsu6+X0KHAhpldRHz99ogRqxJWYpPzfeKIy5ulmuHhnrQCcbAQbQVx
         3rvwh3Cono50qEG4wj1mBDIYKG9WswhwORGTo8mLLkUsPEBB3jP9O1rmHCxd3cOiqDN+
         v12qEFa/csLcImcSoWWMXZ0xWbqBPgC9GPlP6D8BYhVsx14GNEmZ1piVIcIpBinZHm0H
         /GEYQ6+YFbumq8Tcu2vM2dCt5MCXkiVIh8uOz3spbgDYiOTfoOfoFJRaxUIPuGOaS2M3
         rEOnZKPA9LuZKLwRmaeZv+uI+Df+XSaEIiNiEzHiMyN9QA2xl3uro9Li3Kan09xA8Z0w
         40nw==
X-Forwarded-Encrypted: i=1; AJvYcCXXfiKtHur9ssSNyIRbePa83HzQotktsdFvVaIAlpQqgzxxP8F2h0fAp9m04A6/HjHXM4FEzWgIcihmZzXQ1VYD@lists.infradead.org
X-Gm-Message-State: AOJu0YxdLOVR9GUqzWoOSp4dPKgJhCIH+0fZXEVIlv4hOw2owln+bc5C
	xok0Eryz45Ln8PBcffs+b0mdZ+tSs3Gg+10lNM2FzwLWAadBhOrgSTsedq7t1FrIw1yOshsY8Eg
	=
X-Google-Smtp-Source: AGHT+IHKOHXdDAUgO9QjYpvJtulYfjKvmKS2PsJrrTevb2UOA/ICT/NZEufa/1uemsVqPCJNroTu4g==
X-Received: by 2002:a17:903:230d:b0:20b:7731:e3df with SMTP id d9443c01a7336-210f76d6780mr400638435ad.43.1730885649028;
        Wed, 06 Nov 2024 01:34:09 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:93fe:1d68:b50:3213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057062b8sm91478665ad.63.2024.11.06.01.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:34:08 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
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
	linux-i2c@vger.kernel.org,
	Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: [PATCH v11 1/7] of: dynamic: Add of_changeset_update_prop_string
Date: Wed,  6 Nov 2024 17:33:28 +0800
Message-ID: <20241106093335.1582205-2-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
In-Reply-To: <20241106093335.1582205-1-wenst@chromium.org>
References: <20241106093335.1582205-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_013410_074947_E6D1E2ED 
X-CRM114-Status: GOOD (  17.38  )
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
2.47.0.199.ga7371fff76-goog


