Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49354C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 18:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSOud79Vzi0uiSwrFzUVnpNiszCNIWd+xmMcmCt0CGY=; b=NDX1QIi/WAec2tVZljIy0eE+q5
	DnTOgiG/AKni//TT7FpWZHy7HVJ+CcjEjSSKMq2KlMoDP5+gukPw1pZB0mVLtKRLK3rgvDUsDMIlF
	aggvmItsW7oh8tbhzYVBX5EZbPt+ZaAyvq0qN/sEFaNOXu8t19PtIkkaZay7NEtb3xqWri0Vi0AoY
	q1DoIuIrKDxobw4c+iiAMbVJQX3WkQ55QqUwiNHXsiimn9HsWvcxJfObH/gOzrb3SHUeZF6c1rSgl
	hXyFPAXEuQus4vtSVpX2pf5YtGQwq3/Y7W39Tjs0Q4dGhHd/9+jVnvJ2CTMYZJddV6VlSSYlkEClB
	3Fp+VRRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdOY-0000000ErKG-0EHs;
	Mon, 24 Feb 2025 18:41:34 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdGO-0000000EpAQ-288k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 18:33:11 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-548409cd2a8so2969541e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 10:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740421986; x=1741026786; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SSOud79Vzi0uiSwrFzUVnpNiszCNIWd+xmMcmCt0CGY=;
        b=c6UiacIiZImq//YTaSu9RGTCxB6XQ/E5gEq3NR7Z7mF2nsmH6Ay0olxKiBn6ri6sqX
         U5fKIRq9XNaTZVgcuQYabYp+LvyQpVwXGrP4cMgNSnFPCfPfkL3Lxdg0DT2ynBZ1j65t
         /JGVdbS+kNtDF5nZeCGsiDOCQyXJzoN29sv13dSnBbKljCBSpmqAv+86yBQ6gAEFbeNy
         CoyHI/DcYGpfdR/cpnwvT6abUoDjF+R25/mH94M31zd4rjqLqQL33LW5P3azOcNM/qdT
         LIrMG3MgTy94UXkGNNg4eBjlTN+J+QyKZb9YzmWJi8fVwi1e2cVSO5U4Sd/k/Ne7au/Q
         zFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740421986; x=1741026786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SSOud79Vzi0uiSwrFzUVnpNiszCNIWd+xmMcmCt0CGY=;
        b=Y6FPDDiwYkI/f226lpI6j5HrO8W4rUEEh2luVoH5vAPTT3CnDFUbl9WTp4sYY3P6AE
         QvDCjwcH8sxOfG3+yRNPVFAwhP3rmx7uJ9zurzYfW0n3Vh+KVibDmTEw9BILL5fwGHk9
         DAFuhsKXoG8tB4Yk+QFliKe37Ya4TxwLS5F1X5IalaIfFNmirmcrM0gcSV7RyxC9mJNW
         IqU8bpgzgZRvr5U8YjmxfNbbuNbbqMgIM8rKACLwuQF/YDhMWt2efa5t14t+NLXlc1sU
         FsQ7VEw19KVnEAFvxjcOKYr1hA2jYw6NlUZ5wzQRUm5TAp4VKqifQEVWLfiYwDrsW+5p
         gncQ==
X-Forwarded-Encrypted: i=1; AJvYcCUz9ig8iItd5b3laAF4ZUBbTbLVdX619zytuFdwkRPsZmtIdE5TD3gz9aMlwEooOv8lU+NR30ucXQ6IOdwGj8kv@lists.infradead.org
X-Gm-Message-State: AOJu0YwN9WKNXByB1xRhdlAc93R4sCigBTAgWW2MLk9Cbc6dFuC/Wygi
	9tDwSpxr696AFD1uDHLqM0qGMRLPvA4hMXE5Vr/i+XQTx1A7P1VH
X-Gm-Gg: ASbGnctplcEcgl+MNvMxUSkeahWTjFY5PQOMps9r/+PVyrf5cJiMHRGEMf4IlHhvz6D
	R9UoD4kFuBWM/+xB2eDNqBdX9QeZDA5/X6yqTVgHQ9ifH98Oxbppf+sYZ3RDRhuABjvgVlgXx2u
	avnChQKBta0TwMda8sRW1WqymWB8iMPvNbR3JdmeLtTvELely+EPq1aLUaAGZ+OobcM2gRkDHbm
	PG5Q/XcX0eh2pIzqc3lPAogkvtSJaAA7P8psk/2rSKf58yrTya63V5ruj2k5+1+4ouVjLGeGzBT
	heiBoNJHgGHGEwgk2HCW3NE4S8cAG62G
X-Google-Smtp-Source: AGHT+IEb7m6b4nDvSqYxkQoqLJkKID/UW05aywoBDG1L44MOe5fbAylNbYH/ooMs67cDj3WL7N982Q==
X-Received: by 2002:a05:6512:2814:b0:545:60b:f38c with SMTP id 2adb3069b0e04-548510ed080mr34279e87.41.1740421986219;
        Mon, 24 Feb 2025 10:33:06 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5461e731f02sm2539348e87.192.2025.02.24.10.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 10:33:05 -0800 (PST)
Date: Mon, 24 Feb 2025 20:32:59 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Guillaume Stols <gstols@baylibre.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Dumitru Ceclan <mitrutzceclan@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Alisa-Dariana Roman <alisadariana@gmail.com>,
	Ramona Alexandra Nechita <ramona.nechita@analog.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [PATCH v4 02/10] property: Add device_get_child_node_count_named()
Message-ID: <29ec24f1498392cafbecc0e0c0e23e1ce3289565.1740421248.git.mazziesaccount@gmail.com>
References: <cover.1740421248.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7y8fnmahBQr1cajK"
Content-Disposition: inline
In-Reply-To: <cover.1740421248.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_103308_596006_8154327D 
X-CRM114-Status: GOOD (  17.56  )
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


--7y8fnmahBQr1cajK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

There are some use-cases where child nodes with a specific name need to
be parsed. In a few cases the data from the found nodes is added to an
array which is allocated based on the number of found nodes. One example
of such use is the IIO subsystem's ADC channel nodes, where the relevant
nodes are named as channel[@N].

Add a helper for counting device's sub-nodes with certain name instead
of open-coding this in every user.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
Revision history:
v3 =3D> v4:
 - New patch as suggested by Jonathan, see discussion in:
https://lore.kernel.org/lkml/20250223161338.5c896280@jic23-huawei/
---
 drivers/base/property.c  | 28 ++++++++++++++++++++++++++++
 include/linux/property.h |  2 ++
 2 files changed, 30 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index c1392743df9c..3f85818183cd 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -945,6 +945,34 @@ unsigned int device_get_child_node_count(const struct =
device *dev)
 }
 EXPORT_SYMBOL_GPL(device_get_child_node_count);
=20
+/**
+ * device_get_child_node_count_named - number of child nodes with given na=
me
+ *
+ * Scan device's child nodes and find all the nodes with a specific name a=
nd
+ * return the number of found nodes. Potential '@number' -ending for scann=
ed
+ * names is ignored. Eg,
+ * device_get_child_node_count(dev, "channel");
+ * would match all the nodes:
+ * channel { }, channel@0 {}, channel@0xabba {}...
+ *
+ * @dev: Device to count the child nodes for
+ *
+ * Return: the number of child nodes with a matching name for a given devi=
ce.
+ */
+unsigned int device_get_child_node_count_named(const struct device *dev,
+					       const char *name)
+{
+	struct fwnode_handle *child;
+	unsigned int count =3D 0;
+
+	device_for_each_child_node(dev, child)
+		if (fwnode_name_eq(child, "channel"))
+			count++;
+
+	return count;
+}
+EXPORT_SYMBOL_GPL(device_get_child_node_count_named);
+
 bool device_dma_supported(const struct device *dev)
 {
 	return fwnode_call_bool_op(dev_fwnode(dev), device_dma_supported);
diff --git a/include/linux/property.h b/include/linux/property.h
index e214ecd241eb..a2770197f76b 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -209,6 +209,8 @@ int fwnode_irq_get(const struct fwnode_handle *fwnode, =
unsigned int index);
 int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *=
name);
=20
 unsigned int device_get_child_node_count(const struct device *dev);
+unsigned int device_get_child_node_count_named(const struct device *dev,
+					       const char *name);
=20
 static inline int device_property_read_u8(const struct device *dev,
 					  const char *propname, u8 *val)
--=20
2.48.1


--7y8fnmahBQr1cajK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme8u1sACgkQeFA3/03a
ocXtLggAgT5j/TSPxFsS/2C4xsWLs0/6SO9w6j9Ijy5MvfzcRBrH3Oc7aaWUzbrp
PPBZZzZYFn8NKT2exitsIOYpDFgQCSbwyf/+CQvoDcTfNw8NoEQwVYLV/oA3C/RZ
hBb0Rp5giodlJeN6mtzVfLQLTws+HRlrwogLb50yRxNWROlPMTDcAm3Mew6/MxqT
ULoEVgMmOIAOWFjvOw/HvD1qZnqrmMeIMk+5xyImS0JfN8S6AA8TJecvMLoXtq5y
e7jQrOztxk58RGrz6XQOmth61X7dQbAFu7SwuqTHeA8MtW4DQkhguM7B5eTOZqXN
YLmBzoJxbFu5Hh1nAFnl00fE/COr1Q==
=b5lW
-----END PGP SIGNATURE-----

--7y8fnmahBQr1cajK--

