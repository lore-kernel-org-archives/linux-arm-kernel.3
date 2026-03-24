Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAFAF532C0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 01:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gpfpIFEo/UM2Vlf5EBuE34iIvnj7ck9nMpb5/Ds9cg=; b=N32piAuIwZPmF9zVVqps72VynO
	gXEzy74595rEOcbiXIW+9ng85tkNWlmu8aA10jm28ZP5gV1PxAkC5UD6TYBdXs7vaYFvnluRuNEaA
	Td4EkmvDxdmE5Ik8n/mW576AJYs/A5yZR387pxT+g0yc9AD3IC2SggyItt6alxsz9qSocIy7QqU0u
	7vVEGLG2sa6r0TP2HP/sYJcBrc0h+aFprUVERmDUNfxF6wk7Z8iI2OZpvvEkTLcPG86SZeSDsKNsg
	COkuH1YY8KoBCC1hok+mQVMnhrhhLsAwX9h2CFSXwGZ+vhq4vTJwUh8h6kCVgkhvpWOEtiZuemQnS
	yHIodTug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4q9f-00000000HMS-1u4s;
	Tue, 24 Mar 2026 01:01:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4q9e-00000000HMI-25yt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 01:01:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E26DB6012B;
	Tue, 24 Mar 2026 01:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C0E8C4CEF7;
	Tue, 24 Mar 2026 01:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774314087;
	bh=KpxTlQdpK2jKnd62P5I8EEqT3CEkSotjkNoM+lvw6Dc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rLAmVR6groUQSZRplygjMn68KJDDiLrGR9Vctd6Afc3mLDKzHEaYGbMFZ3KXs4fK4
	 MUoXCr/h6SfvTEE4yAlc7KGjraQ8CFJXtGn8f5BkmJWMm1J/pjXgfy9qXciydDWGLj
	 XNYlWwVjufJG5KD0z7v9ARc0FuEyAjjiYRe15HPbrYCuuNFi4/b/eyHrklVGEVsCSm
	 lE5k5muPCMjo/9hKdfl5T5LohS8mNpZoGcTFibqf76OQzdeH43NHUrx9bEVbSisncq
	 g/N4LXJNuBtUlzaGXa8b6D8KnPgXir5STaz/+AS+2urYkPCvbB6vpDfKREYcWyPp9d
	 47Lib8DntPlsA==
From: Danilo Krummrich <dakr@kernel.org>
To: Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Holger Dengler <dengler@linux.ibm.com>,
	Mark Brown <broonie@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Alex Williamson <alex@shazbot.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-hyperv@vger.kernel.org,
	linux-pci@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-spi@vger.kernel.org,
	virtualization@lists.linux.dev,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-arm-kernel@lists.infradead.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 12/12] driver core: remove driver_set_override()
Date: Tue, 24 Mar 2026 01:59:16 +0100
Message-ID: <20260324005919.2408620-13-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324005919.2408620-1-dakr@kernel.org>
References: <20260324005919.2408620-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

All buses have been converted from driver_set_override() to the generic
driver_override infrastructure introduced in commit cb3d1049f4ea
("driver core: generalize driver_override in struct device").

Buses now either opt into the generic sysfs callbacks via the
bus_type::driver_override flag, or use device_set_driver_override() /
__device_set_driver_override() directly.

Thus, remove the now-unused driver_set_override() helper.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220789
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/base/driver.c         | 75 -----------------------------------
 include/linux/device/driver.h |  2 -
 2 files changed, 77 deletions(-)

diff --git a/drivers/base/driver.c b/drivers/base/driver.c
index 8ab010ddf709..7ed834f7199c 100644
--- a/drivers/base/driver.c
+++ b/drivers/base/driver.c
@@ -30,81 +30,6 @@ static struct device *next_device(struct klist_iter *i)
 	return dev;
 }
 
-/**
- * driver_set_override() - Helper to set or clear driver override.
- * @dev: Device to change
- * @override: Address of string to change (e.g. &device->driver_override);
- *            The contents will be freed and hold newly allocated override.
- * @s: NUL-terminated string, new driver name to force a match, pass empty
- *     string to clear it ("" or "\n", where the latter is only for sysfs
- *     interface).
- * @len: length of @s
- *
- * Helper to set or clear driver override in a device, intended for the cases
- * when the driver_override field is allocated by driver/bus code.
- *
- * Returns: 0 on success or a negative error code on failure.
- */
-int driver_set_override(struct device *dev, const char **override,
-			const char *s, size_t len)
-{
-	const char *new, *old;
-	char *cp;
-
-	if (!override || !s)
-		return -EINVAL;
-
-	/*
-	 * The stored value will be used in sysfs show callback (sysfs_emit()),
-	 * which has a length limit of PAGE_SIZE and adds a trailing newline.
-	 * Thus we can store one character less to avoid truncation during sysfs
-	 * show.
-	 */
-	if (len >= (PAGE_SIZE - 1))
-		return -EINVAL;
-
-	/*
-	 * Compute the real length of the string in case userspace sends us a
-	 * bunch of \0 characters like python likes to do.
-	 */
-	len = strlen(s);
-
-	if (!len) {
-		/* Empty string passed - clear override */
-		device_lock(dev);
-		old = *override;
-		*override = NULL;
-		device_unlock(dev);
-		kfree(old);
-
-		return 0;
-	}
-
-	cp = strnchr(s, len, '\n');
-	if (cp)
-		len = cp - s;
-
-	new = kstrndup(s, len, GFP_KERNEL);
-	if (!new)
-		return -ENOMEM;
-
-	device_lock(dev);
-	old = *override;
-	if (cp != s) {
-		*override = new;
-	} else {
-		/* "\n" passed - clear override */
-		kfree(new);
-		*override = NULL;
-	}
-	device_unlock(dev);
-
-	kfree(old);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(driver_set_override);
-
 /**
  * driver_for_each_device - Iterator for devices bound to a driver.
  * @drv: Driver we're iterating.
diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
index bbc67ec513ed..aa3465a369f0 100644
--- a/include/linux/device/driver.h
+++ b/include/linux/device/driver.h
@@ -160,8 +160,6 @@ int __must_check driver_create_file(const struct device_driver *driver,
 void driver_remove_file(const struct device_driver *driver,
 			const struct driver_attribute *attr);
 
-int driver_set_override(struct device *dev, const char **override,
-			const char *s, size_t len);
 int __must_check driver_for_each_device(struct device_driver *drv, struct device *start,
 					void *data, device_iter_t fn);
 struct device *driver_find_device(const struct device_driver *drv,
-- 
2.53.0


