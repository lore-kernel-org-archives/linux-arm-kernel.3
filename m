Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC35C44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 11:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E742RWSqyUpjpy+ZFSeaNRHKuAVV+n7jX1SAgxgLen0=; b=mu3ofPnYRYwImcOAvp3Tr28nIj
	eZGRWKHcJChjJfU4Sw4VN0sKjK7IVEAh4ecaQReUJZC5c/VQcnJj7q02K2z3QYoYJtmjltNuzgOgt
	7rq4nHcy+3Zwg9Mu9+Hqk7A8ZkqZfTVfhfqNS3Fw699s6+Ar7umRARpXBfVeb4qaua8Fs2XyV1Btn
	CHP5YhCRwPgO7wF7NXLeAvzTj9IRJg+BbhZz2/Lp/znl6AQrrwL7a3my1tgZKCyItZ62dnSBDTVlE
	S2UqwJQ+kLWS/JZDlzZhbQ2+wSlNQc1aBdCZGPzpc8Qr0Tf+67H2EdgY5Ju8Z/em2vSqY8/ZBW7in
	6KBwHlBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbgP-00000006kxc-1tJj;
	Fri, 03 Jul 2026 11:03:45 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbgM-00000006kuf-3cGY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 11:03:43 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cab973140bso5196505ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 04:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076622; x=1783681422; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E742RWSqyUpjpy+ZFSeaNRHKuAVV+n7jX1SAgxgLen0=;
        b=IdFMwnsj8Z24A+vDn6inz5woTUpu9iW8iv/rBRYUhXZu/+nBa79+GHk3LEENTmcvn5
         XL9JGMIMOkMwWTGDUx5QyzC83cesdOJ31dDQVMzbNB5RMC2jwV0+pyIrOwcilYGSd65J
         VDIDAO4g7jD0fttPdMQURdSl/vLPP5TODd0xA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076622; x=1783681422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E742RWSqyUpjpy+ZFSeaNRHKuAVV+n7jX1SAgxgLen0=;
        b=CxQMQkUeNSZHV2FAooaS0jSoDiauJpRTlw2n/iEAq9YlVp+kBVc6v9N00AftnwHSAI
         5gkAFvXCApTxwkE4aGjzH3pCeWGiEjBfujv5bRP2z+GMjSqBbXAx6SUzRR3MSvHO+1z2
         AhWUOmXc9jdXlnH+tNFQcAwJi/GnsS3t68fE+o8NGteSx8EO0yxdYnmX6tlz/4kpuSYD
         vcad2oC1T6U5RYfW9QgvuY1Gw0j2PUClrXyc4qUp2fPMBd1h/zj6NIemN9635RvPiYZ6
         CiCYrLRe60VF+waE46uoVvf2GMjl3YmHn2bS3N5k0YQsD408E+vnzjAeZapwLvPQlrb+
         2TnQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFRaqWjnzKpPUXufbMFjNdnDGjCm44VDgoJ7Oj/guF0A5vX0OXiUCxuwkaQtzTKNqiC8JYrodoFXZhdkLUb6Nh@lists.infradead.org
X-Gm-Message-State: AOJu0YyWFpPpNuzgRvePp8JwkgaHffg/Eay7WZsemk3xui6xPsggKHYI
	NJALw8AfvkRkQiEATXGZIh93mjQhyLQt8qk4Cgy3qojaarCH2/cASm0vOufOq67f2Q==
X-Gm-Gg: AfdE7cmu69bEKXXOGWiAcrKx+soPn9ZgHntYK6Js4W33f3Auz7nxgQ0YrYPj3tKC7DL
	WlYzFRFwUnpDFVLOxcIcRnz0zcDUrTD516DV64WOVXB4BRbq3T5JVXq9zQyfLw6Q69508FZawTV
	6zZ/RuilL4DpAK2ldo3LXaJmTQZZ0QWrNh3yxMElYSdovZb+KzsMlVwz1PU/hdR/KqcBWq3dZj2
	1z8xjmKg0V9h/KiCq9Sd8yrhURr908riVnk+BRK6pqwPmYCRuSpXnx/Y44zrhc9xZH35YuPNHZi
	rDjKeCO9L4s3MNEIiq+9EhO4rEyAHQxnNH/f1HdUJU9Hg0DWltSF5bdcvaLzbWGmPBw7bXzeZ/V
	KdWy8S30ZzZ+qM3m9sBPrSAQkhN6Z2YHbsdpni5sXmr01fdfTYSHStcxfQGU6A/zkQQHoQ3MyYy
	Gxfam8Th/rPbh7yY5e3WGfVsZWbU0g3qiyXT3lCNtL9Mn2WgDDqXT+f9KFPXUEy/G5SzGeFQ==
X-Received: by 2002:a17:902:da2d:b0:2c9:c13f:910a with SMTP id d9443c01a7336-2ca7e8d033amr108379995ad.45.1783076621819;
        Fri, 03 Jul 2026 04:03:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:03:41 -0700 (PDT)
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
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 01/13] device property: Add fwnode_graph_get_port_by_id()
Date: Fri,  3 Jul 2026 19:03:02 +0800
Message-ID: <20260703110317.1283411-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_040342_912549_0807EB23 
X-CRM114-Status: GOOD (  15.29  )
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

In some cases the driver needs a reference to the port firmware node.
Once such case is the upcoming USB power sequencing integration. The
USB hub port is tied to the corresponding port firmware node if it
exists.

Provide a helper for this.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Moved "Return:" kernel-doc section to the end. (Andy)

Changes since v1:
- New patch
---
 drivers/base/property.c  | 22 ++++++++++++++++++++++
 include/linux/property.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 9387bb83eb54..3e3e19ef66a9 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1346,6 +1346,28 @@ int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL(fwnode_graph_parse_endpoint);
 
+/**
+ * fwnode_graph_get_port_by_id - get the port matching a given id
+ * @fwnode: parent fwnode_handle containing the graph
+ * @id: id of the port
+ *
+ * The caller is responsible for calling fwnode_handle_put() on the returned
+ * fwnode pointer.
+ *
+ * Return: A 'port' firmware node pointer with refcount incremented.
+ */
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id)
+{
+	struct fwnode_handle *ep;
+
+	ep = fwnode_graph_get_endpoint_by_id(fwnode, id, 0, FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep)
+		return NULL;
+
+	return fwnode_get_next_parent(ep);
+}
+EXPORT_SYMBOL_GPL(fwnode_graph_get_port_by_id);
+
 const void *device_get_match_data(const struct device *dev)
 {
 	return fwnode_call_ptr_op(dev_fwnode(dev), device_get_match_data, dev);
diff --git a/include/linux/property.h b/include/linux/property.h
index 14c304db4664..e04901c0bd8f 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -505,6 +505,7 @@ int fwnode_get_phy_mode(const struct fwnode_handle *fwnode);
 
 void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.55.0.rc0.799.gd6f94ed593-goog


