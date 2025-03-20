Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1E4C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 08:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8YCQKSCMbcpjqvqGVAud+bsNcc/Isbjy4a8q5O0R/8=; b=PkVeoGVw3NhQx9mifnTcShITtu
	wciy4OO6rEreYH6c1jcGDANOdFwBOCmC9mUaZSwUDHEPkEcMvdDwrXPUhlWTKAueE1OfHd1CB8hqL
	amRCtIzyqbojhD1PKaDZ2WXt/w8dLvj1RZMhI+2njbQ7yNHRg3zhLc7JU6AMLpgW8GWR9xHOFhFZK
	pb68gXAPz6sbm2zulUy0hFrOq3r6jx3Bu6KwBN2FHVrrB/Y3AYbUiEpyZmWUeXnivF3PSxA/PSEid
	wAX2sMQD/kVTmSe3sROYWQMaHzPyuXTZ4zlIjuUuq6yiLHI2qcmN2sMEaeAhVPt4aolaEiL/RiHg6
	+wcVHreA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvBCH-0000000BWFk-3PxB;
	Thu, 20 Mar 2025 08:24:13 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvB9L-0000000BVcC-3Rym
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 08:21:13 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-543d8badc30so652220e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 01:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742458870; x=1743063670; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o8YCQKSCMbcpjqvqGVAud+bsNcc/Isbjy4a8q5O0R/8=;
        b=L7jWF3rMX8e686lYbJ+iRPTHiZOVaTarzQ3veNiu4ibUltlVsCZIZpUWE5YN4/H5qf
         HShvpwjhLlyQKhFnYqWz2c7jB97jUiOlwpIIJxF7nwd9iwelNTnCJ+IXICBCyYMzeuRv
         brzKchZyWtxaPPYYRWI0ncq67JRGcjLAPWVmGGF2hj1zqJqWN6Ae3ZXs4RhuDte0GAni
         lIXcGtwhdvbEE3GP9xHj3J6WWAyXoGj78q5tLBX8j3DRai00iM4wrQWn79+10XivYL0h
         wwvjY8odM7fco5SiqGzk2cfX/giZCSyJO7OlZNvpkqlZYXKDr7S95Fd04KXQODhDzxha
         7ZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742458870; x=1743063670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8YCQKSCMbcpjqvqGVAud+bsNcc/Isbjy4a8q5O0R/8=;
        b=avyjXF1yrRfDfuUjZuOPKL4CEQXXufWawIilJjmb6/FICu95f78YsUl9q09SxIqBG5
         HAc7esBnz0DHZLTxBMoNO4J/yNUSt5iexGiUNaW5vGBs+Cx0dPYVKj10I2h9neVcFv5z
         mdJbKs9pfs36yrlsIrQBAc0Kwozd1J498RObIEvOY66MiqJQBTkCYk3MJGZ/PWJfWw7U
         yaDrc7YHV5WbhbYzMc3X8Qi2bFYOfXEDARtmGb9O2yHnWQOiaswGJ8R5UxDd4P58pZjl
         oEW40oZvUFn2hCoy6GYgDUMATz4JzPrT/bC3nOCKK4pP0zmvUOjcYjsr3PCtTdf6TJ3Q
         0ErQ==
X-Forwarded-Encrypted: i=1; AJvYcCWi0VoZL3o1yXISbwuKDQS/7OCzDL8YkAkvoNjhM/CfhJ9V3NXxDIrBgpCj973tcQzQZ2VSzyumZ6ufkN1SDXiU@lists.infradead.org
X-Gm-Message-State: AOJu0YyHICsgB/akVkpYHoXC5LQolbPTBeb7/cSdifQfsGFZLS4gBpno
	tfej9TfpRSg/s52uRoXJCH1YxGtvL87P9r8Q2QmQBneshowidbAe
X-Gm-Gg: ASbGncumMfocQhPv8NgkYgpX1ltfrQRLKe++R+ISshx6PoVY/zvQwiimjIAZfsIbWfN
	fNcIRgFJ3DKcGDDHf9fX9T64bojApcD7A5nXFY4Mj0aFxMNfDgcIMqRSZMScmefHlsxIW3hKrFo
	do0P29KoVH5FAWkhgJ0slR06wrkWeK0PydH9dcB5tV95ThLYMvs9SbAFn3EhXcby+tajslzm9Dr
	6umh93mMZ1m2sZ3nWQ33sOYx3tH/nVjtjbXrEWwl8NwSGwbf8ewWU2PwxTd7M30LclJEQB4hzyr
	9XMSKOGgi8abUnclICHNk9Jp/OSvufGIP8wsJ+XkHtofMkKZd6U=
X-Google-Smtp-Source: AGHT+IEtQcDT1hKcr/hyPc4GQAHaaV6Ce4tKlVEIYYQ9CJsshWPNPgEWDxvASx6328HXCmwcR69h0Q==
X-Received: by 2002:a05:6512:ea5:b0:549:8d16:7267 with SMTP id 2adb3069b0e04-54acb1a3327mr1879960e87.10.1742458869558;
        Thu, 20 Mar 2025 01:21:09 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba88536csm2134374e87.177.2025.03.20.01.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 01:21:07 -0700 (PDT)
Date: Thu, 20 Mar 2025 10:21:02 +0200
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
	Samuel Holland <samuel@sholland.org>, Nuno Sa <nuno.sa@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Guillaume Stols <gstols@baylibre.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Dumitru Ceclan <mitrutzceclan@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Alisa-Dariana Roman <alisadariana@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>,
	Ramona Alexandra Nechita <ramona.nechita@analog.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [PATCH v9 2/8] property: Add functions to iterate named child
Message-ID: <fd959b10904a401d3f6fb855933be1a4750ef670.1742457420.git.mazziesaccount@gmail.com>
References: <cover.1742457420.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YRU/gfTfRaKrfWT3"
Content-Disposition: inline
In-Reply-To: <cover.1742457420.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_012111_905614_E81C276F 
X-CRM114-Status: GOOD (  20.33  )
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


--YRU/gfTfRaKrfWT3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

There are a few use-cases where child nodes with a specific name need to
be parsed. Code like:

fwnode_for_each_child_node()
	if (fwnode_name_eq())
		...

can be found from a various drivers/subsystems. Adding a macro for this
can simplify things a bit.

In a few cases the data from the found nodes is later added to an array,
which is allocated based on the number of found nodes. One example of
such use is the IIO subsystem's ADC channel nodes, where the relevant
nodes are named as channel[@N].

Add helpers for iterating and counting device's sub-nodes with certain
name instead of open-coding this in every user.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
---
Revision history:
v8 =3D> v9:
 - Drop the fwnode_for_each_available_named_child_node() as suggested
   by Sakari during v8 review:
   https://lore.kernel.org/all/Z9mQPJwnKAkPHriT@kekkonen.localdomain/
v7 =3D> v8:
 - Fix the example in fwnode_get_named_child_node_count() documentation
   to use the fwnode_get_named_child_node_count() and not the
   device_get_named_child_node_count()
 - Fix the rest of the new macro's indentiations
v6 =3D> v7:
 - Improve kerneldoc
 - Inline device_get_named_child_node_count() and change it to call
   fwnode_get_named_child_node_count() inside
 - Fix indentiation of the new macros
v5 =3D> v6:
 - Add helpers to also iterate through the nodes.
v4 =3D> v5:
 - Use given name instead of string 'channel' when counting the nodes
 - Add also fwnode_get_child_node_count_named() as suggested by Rob.
v3 =3D> v4:
 - New patch as suggested by Jonathan, see discussion in:
https://lore.kernel.org/lkml/20250223161338.5c896280@jic23-huawei/
---
 drivers/base/property.c  | 27 +++++++++++++++++++++++++++
 include/linux/property.h | 20 ++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index c1392743df9c..f42f32ff45fc 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -945,6 +945,33 @@ unsigned int device_get_child_node_count(const struct =
device *dev)
 }
 EXPORT_SYMBOL_GPL(device_get_child_node_count);
=20
+/**
+ * fwnode_get_named_child_node_count - number of child nodes with given na=
me
+ * @fwnode: Node which child nodes are counted.
+ * @name: String to match child node name against.
+ *
+ * Scan child nodes and count all the nodes with a specific name. Potential
+ * 'number' -ending after the 'at sign' for scanned names is ignored.
+ * E.g.::
+ *   fwnode_get_named_child_node_count(fwnode, "channel");
+ * would match all the nodes::
+ *   channel { }, channel@0 {}, channel@0xabba {}...
+ *
+ * Return: the number of child nodes with a matching name for a given devi=
ce.
+ */
+unsigned int fwnode_get_named_child_node_count(const struct fwnode_handle =
*fwnode,
+					       const char *name)
+{
+	struct fwnode_handle *child;
+	unsigned int count =3D 0;
+
+	fwnode_for_each_named_child_node(fwnode, child, name)
+		count++;
+
+	return count;
+}
+EXPORT_SYMBOL_GPL(fwnode_get_named_child_node_count);
+
 bool device_dma_supported(const struct device *dev)
 {
 	return fwnode_call_bool_op(dev_fwnode(dev), device_dma_supported);
diff --git a/include/linux/property.h b/include/linux/property.h
index e214ecd241eb..3e83babac0b0 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -167,6 +167,10 @@ struct fwnode_handle *fwnode_get_next_available_child_=
node(
 	for (child =3D fwnode_get_next_child_node(fwnode, NULL); child;	\
 	     child =3D fwnode_get_next_child_node(fwnode, child))
=20
+#define fwnode_for_each_named_child_node(fwnode, child, name)		\
+	fwnode_for_each_child_node(fwnode, child)			\
+		if (!fwnode_name_eq(child, name)) { } else
+
 #define fwnode_for_each_available_child_node(fwnode, child)		       \
 	for (child =3D fwnode_get_next_available_child_node(fwnode, NULL); child;\
 	     child =3D fwnode_get_next_available_child_node(fwnode, child))
@@ -178,11 +182,19 @@ struct fwnode_handle *device_get_next_child_node(cons=
t struct device *dev,
 	for (child =3D device_get_next_child_node(dev, NULL); child;	\
 	     child =3D device_get_next_child_node(dev, child))
=20
+#define device_for_each_named_child_node(dev, child, name)		\
+	device_for_each_child_node(dev, child)				\
+		if (!fwnode_name_eq(child, name)) { } else
+
 #define device_for_each_child_node_scoped(dev, child)			\
 	for (struct fwnode_handle *child __free(fwnode_handle) =3D	\
 		device_get_next_child_node(dev, NULL);			\
 	     child; child =3D device_get_next_child_node(dev, child))
=20
+#define device_for_each_named_child_node_scoped(dev, child, name)	\
+	device_for_each_child_node_scoped(dev, child)			\
+		if (!fwnode_name_eq(child, name)) { } else
+
 struct fwnode_handle *fwnode_get_named_child_node(const struct fwnode_hand=
le *fwnode,
 						  const char *childname);
 struct fwnode_handle *device_get_named_child_node(const struct device *dev,
@@ -210,6 +222,14 @@ int fwnode_irq_get_byname(const struct fwnode_handle *=
fwnode, const char *name);
=20
 unsigned int device_get_child_node_count(const struct device *dev);
=20
+unsigned int fwnode_get_named_child_node_count(const struct fwnode_handle =
*fwnode,
+					       const char *name);
+static inline unsigned int device_get_named_child_node_count(const struct =
device *dev,
+							     const char *name)
+{
+	return fwnode_get_named_child_node_count(dev_fwnode(dev), name);
+}
+
 static inline int device_property_read_u8(const struct device *dev,
 					  const char *propname, u8 *val)
 {
--=20
2.48.1


--YRU/gfTfRaKrfWT3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfbz+4ACgkQeFA3/03a
ocV5kwgAqP6S8zt8MaFdvTnQ26ACvVcKar6Gy2oM/5KkY544czu7VyYtNPYp0dHi
PIrWhfxOMHKsPcqMHe4nHxSVVjFKdBBMq/6/kNS5AEqSiMSnP7XgPo25MtyEwwSI
bECHybECCeTuPpaYlNSY6mKDaefr0IyZEiJbG6vlAnUd3nZ1LhGMzNAkllSsPI4f
nQrXBfIldS49i5cjLFfkybaia7iKsOheKcafo3TniFyUFIm55dG5v5yv6Eh2Ofwf
RfvHs6Do3ThWkOOtVY/AlxWqkSD63Hq//vXaZJ7T4GAiJNHGFI+GJ8JcKy6gfI+o
ZUBbkH6QfVjUCMha/CCymXxh4aIvrw==
=xACW
-----END PGP SIGNATURE-----

--YRU/gfTfRaKrfWT3--

