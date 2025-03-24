Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41CEC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 07:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cb6ZekWLkVePTuMzLCdqRm3yrgquLep1rTqCU69e+sA=; b=Rx8io3q+calHE1HVhrCHxsF441
	wHPzvYNTf9GJTGVRStMUcxqPj+e3HMd8g7Fm3w/JxuBw+H2Qk473EHiTStbLwLyEZIchbVbouHaL6
	tpdRnvFwIwOxpcP4fSXH31U5XcEHVHH99kXnwTHVpSj0Xu35bRrwXYll+NfPGFpCH/LM0FwBj6o13
	jgLM5WFdDR0ZVzqtnZVcFRPJPRjJteJ/b0U0gsO0LT26l0PYUihk1RLPVehnPTf8CXnd9L+VNE/yi
	RQ1zxgHdOXMAS+LdiZ+o6VEIszDEFBa0IYd3sv43d2uK1H5ncLV1etMARZP5y56ocDy8vchgn110w
	revUVobg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twc9r-00000002RPC-0FTA;
	Mon, 24 Mar 2025 07:23:39 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twbzX-00000002Prk-1Scn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 07:13:00 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5499c8fa0f3so4805817e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 00:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742800377; x=1743405177; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cb6ZekWLkVePTuMzLCdqRm3yrgquLep1rTqCU69e+sA=;
        b=IE3cOH4jYv5zYjBOi/bFsVEbRBche5EE5Dr16p7PvIcvqIvN7TL1HS+OIUbzPQI3jU
         oI29wUrufSWxuchiXWEkWB572y4a3E614nNp6N6qnzeHFvEH5momyycHXqyD7MqdlxMy
         F/mN+ncczFGrh/sz8EMMqRD1Kl2jj4EwCGUbE8q90E1HiaBXxg2Ci6Wu4mb2NiY1ScZG
         m+u2z3mA32Zvi7FHPqV09uYsEJJknRxEqXqxZtRFJYoaWDtKqgz4tkONfQIC+OEJ3Kmm
         B27jefR0ACBwn+Jap94xRiLYjrMDSOsxkaQgU9J3RU0bSLrkQIts+POI9G3J177cThJ7
         YeCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742800377; x=1743405177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cb6ZekWLkVePTuMzLCdqRm3yrgquLep1rTqCU69e+sA=;
        b=qd5KH7qAUSbX/U9m9UFjwNpdeW9UAeOn9Y7BKjoG8ZQBE/rJD7uGjChXsM11+5btZk
         5+QMn1i0p2QpWTNCMVlJYxQxvK2myi23xVCwC8bc1QzJtGQoffAjLW4wgXRP91QuGIi4
         NOrxIyuKoEs1VJosC9nc2JwRroo/wd4xZhRhjqctZtYDNgW872vHZUbQU1t3jcJi1Oca
         nJyZitwkoSCe0MhvvvRWfRJZYdetsd3XdE3KezNpXbgDpFLN0EbgWEPBQmGm9lNzWezn
         YwkRy0cdPeZLKrgASoSk768ri7CbRVhpSlnrBVyHCHS866z/d6PHiCIDKNX557pb6Zwe
         mSrA==
X-Forwarded-Encrypted: i=1; AJvYcCUNFaZ55kWUmkXiJXHFOA65znpUrK1Yfgyi3YRRXYmjFsBA3P5vESFIpnEbD5Z7rf6PL3agD9H+aP0CSG3J7baK@lists.infradead.org
X-Gm-Message-State: AOJu0YzfT/ArCWxHCa9XFzjc6NQVBSib5japTYNzlhEz360veNomShGT
	2rf3LSWN56DuBQ3JtGp88ISywST7KoRI9i6BR/vWghJkEQJemKyN
X-Gm-Gg: ASbGnctrcFtN6YTOHtED4Y5JPYuGHm/u4MmdBbbN0RTuMEXNNWyFGbz9fT2VmJb6nZi
	71Qg/8xPtSGMxKhXnjkpP4TxfEzPNRCweftPYtp5iND2EQS9vsUEDAs/bOqjWG7sk0dt0dleqt8
	364pXIPRmX5fU4hztvdfJRw0IPz63S1CJHXegWzV5Ell2q6byBZA6/P6kSSA2Oj8OC2AFiFAd9B
	UIE6TXfysefFp3H8cGMVIZoc7MKbRIW3a7MEnchvuOZF2kJG2luhaQm5b014UdpnB4LHHtev5oN
	PHuTDafxRcNWt1ERRV5fdnNXpMMqEuhpi97woUMy+dWBIo+kquE=
X-Google-Smtp-Source: AGHT+IHmmYJxZaoxJegOFs7H2qFgMQysAz3M56PHCG4I22aUs9ljmNowu7LQ3Ype2zutd04sqwhXUw==
X-Received: by 2002:a05:6512:10d4:b0:545:1082:91a1 with SMTP id 2adb3069b0e04-54ad64807e9mr3497478e87.7.1742800377109;
        Mon, 24 Mar 2025 00:12:57 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad647b468sm1032949e87.59.2025.03.24.00.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 00:12:55 -0700 (PDT)
Date: Mon, 24 Mar 2025 09:12:50 +0200
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
Subject: [PATCH v10 2/8] property: Add functions to iterate named child
Message-ID: <2767173b7b18e974c0bac244688214bd3863ff06.1742560649.git.mazziesaccount@gmail.com>
References: <cover.1742560649.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yXCZzpyh11Z9uerG"
Content-Disposition: inline
In-Reply-To: <cover.1742560649.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_001259_390413_C3B77949 
X-CRM114-Status: GOOD (  20.36  )
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


--yXCZzpyh11Z9uerG
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
v9 =3D>
 - No changes
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
2.49.0


--yXCZzpyh11Z9uerG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfhBfEACgkQeFA3/03a
ocX+JggArPYht/Qa6R3JMf4CRb/NWWgTzx+yo4jvq9K/Jc4BfsFbsvPLxxfS5Q9m
UwTQurDIsM+hU8DuDJ14n5rg/ecWT1awuyOt9eZtFkt90YOvHOU1sqje74X0OL7E
DWYsDY6fnnd1jPBmd7IyZthy+1O4SHplT9UxeA73NQEfQKh2WS6a1+GCtthk61lB
UVK6eL/h2afMZceOkuLQSUNH6fwUhoa44l/h5eQCgGQCJdNwd2706YW0puwEZ2+x
c5OxG8xaV9LTMuFSl0HLqikIQ+kQn/5D6HQ35JcV3M0EwawikElpZqGsYD7R/9uk
lLpTvR8H5TNoebYOlUnHl+K+foVmQA==
=SkMp
-----END PGP SIGNATURE-----

--yXCZzpyh11Z9uerG--

