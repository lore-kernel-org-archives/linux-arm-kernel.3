Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0662DC9831E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 05:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X/jLk3hOfvplWvnh8rdzJHMk4Xuu5RA6BKKGh8ixgRc=; b=L4b+HnN3tjjwQ2ql9O+19CLHTA
	H4ieNP90YgsMS5VHvoS1nV0yx4DiIGK5Wb6c0XQkoagkQgYj1T709oF+Fnsn8dCnequ7mH2ESMLvK
	djIEyeL1lPE9fl18BdcvXKvT4Qa7GRP0pd4Qx597PL2FQ3Mfh6pvN6wsoJtjac8LjEzhFeJPMnKXZ
	V4Xgy2vTStNFcbXY99NQWXmFgyHgSBo1GI1oPGZTJ9IXfd/aMIAnK7GSzdtkNQw4VaRjNyKqTZ49f
	zktkrLHmelt9UMtGEMaiSl6W9WXfqKqpsClhnEgIvxT82Q2eyLHqmaij88tbivVFkLLCzwqfhPYT2
	DuRPuUgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xALNL-0000000F3QR-0IVN;
	Sat, 26 Sep 2026 05:55:07 +0000
Received: from mail-pz2-x2b.google.com ([2607:f8b0:4864:3b::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xALNJ-0000000F3Q4-0aFp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 05:55:06 +0000
Received: by mail-pz2-x2b.google.com with SMTP id d2e1a72fcca58-880adb5d043so465620b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 22:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790402104; x=1791006904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X/jLk3hOfvplWvnh8rdzJHMk4Xuu5RA6BKKGh8ixgRc=;
        b=QN7PKBzTYLGM8XtppuNahxvToPo9Z9Ow2MkjE9uOpO386+6OHyndzbdUW/jQqrWQMT
         z5Hu54I8HugypoAV82CXo57uXAheDaBVlcdPhVK/zvvopPNcMfF5oLuVuy4xyirwvtlw
         JurAde3dRlgh92k7JL9i1onS6PeMiknPsMLJj0NhNQ2iaYDeZ/Q9OM1YsJQPECOFrk1T
         lvwU9UG2QuopMeBMd5jvMmHpvyvG57HiCsjuhxTgjKqJs8j7f+qeLKwkv+RHc6ExZpPj
         pDxyILR5LucVtuYvXaMgeZzb1n3ijtIZaJ3CzheHObW+jFyJzGnY0vZlj5VZYKG9YdGv
         hQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790402104; x=1791006904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X/jLk3hOfvplWvnh8rdzJHMk4Xuu5RA6BKKGh8ixgRc=;
        b=h04QbdJcwKmjZ90evhyuVzURjiMAdfAhTiJVy3jm0Xi0ix5TEJJI/OhoM2fqjFkZMg
         LftHWdRd2t+QCI5o8oEzIS/EqqEkrOpPAm5ZJoCurMLDt+p+yysRAk2OHNiS5vehuYrv
         MKZI4OhdH6mIldY99SIzTG91c5q/lHqQcE0v5bLN+FFIH9rhypr1IUGPF0aLGPN8YpV+
         zkoGNUkUQOYlfsQlbZlaKPe0RRa5URIMNBFYipnfDs+KngeFbFQzCE3VbTy2kQLK9tzk
         Us7SYEHjupMBeYEJRI/kMSa/tXT0dvYzwaPnB05lH8inM7gSd97hB0aVt7am6h/pPVCe
         5ElA==
X-Forwarded-Encrypted: i=1; AKwUvBwFafosqojo0se94roYvl6sTy4q3V1ZEXig6Zrio4pfAArMOtbCfRpF6aZHskU58qAPuY18vHAHYpBHlUs4XFjI@lists.infradead.org
X-Gm-Message-State: AFuF++l5KCBdSsn6Zd1g4y5WOsM7iPAuQ/tzhNGozDSHVB2m38e5nJiA
	/5pRogxcUArKRCn9sWf98LuAv5VPGQSrDTxxD0xXhckY9XQdF0SDb952
X-Gm-Gg: AYBFou2klz3S9z7MQdvTR7RGkqmyoWWrqWFIBqegB9pjfqgs9Cdh5dJesT0JsoaHMd1
	YZ7MnXZ6SPV3gzg/MHtA3kYRcBn0XUTDsYzUy+eG0i4AYzrqkC1d92jk8L4y6byFqPvjdQxNMHm
	FiFlhAaz+FqwhaC7mh0r4PSFYKzHcYm6qUYbPRAKvZs/BkPr2y7zQI6IoodladbtCwfNqUNpgn9
	MS747f99ycRVMXJFxNapr0nyRpwrDzIES4LdhudipxWZD4apb99ud2jVMhaaMFYK8iT/jPoaEMh
	aLgSdzVCLRqxwXGQnxlPEJ9SaiBT0EIs6Wsc6M3mPajfgnwvKBIHVeRSEGdAQBF06KgOlWk7X51
	iv4gc+GMv0dPc0i+eYMBuOkdij9rXsx3R230I2t1MLML/ufWuWalZp4pMhE8lcyNEeZ4EW8+zwB
	fgh4vSoEO3cAXT+mnw6vTyuM0/rn7GuT7Q/i8eRDG6WwDZIdpwszkewdK2cQA3FcgX+PmSVP74G
	LTTtfOe2KU+oQoTbgQwjEU49TYfVDvir32wMJNuQ8gZ/ln+3lBqrl1jDKGTxBSFKr1lHhZnL5W9
	ma9RbiRO8sCO3pMq00u5tH9MXyDi4KKRs1mc9mCAAF2U2NUb
X-Received: by 2002:a05:6a00:a203:b0:878:3538:8f7e with SMTP id d2e1a72fcca58-87e9f82210amr5561877b3a.44.1790402104209;
        Fri, 25 Sep 2026 22:55:04 -0700 (PDT)
Received: from dell-pro-max-tower-t2.cse.unsw.EDU.AU (pag-t2-pc.cse.unsw.EDU.AU. [129.94.173.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feac93380sm1964103b3a.33.2026.09.25.22.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 22:55:03 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] iio: adc: xilinx-ams: fix out-of-bounds accesses when parsing channels
Date: Sat, 26 Sep 2026 15:54:56 +1000
Message-ID: <20260926055456.3289189-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_225505_190258_9D6B0501 
X-CRM114-Status: GOOD (  17.57  )
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

ams_parse_firmware() allocates room for ARRAY_SIZE(ams_ps_channels) +
ARRAY_SIZE(ams_pl_channels) + ARRAY_SIZE(ams_ctrl_channels) = 51
channel specs and lets ams_init_module() fill them for the AMS node and
each of its children, without telling it how much room is left.

For the PL-SYSMON node, ams_get_ext_chan() appends one channel per
"channel@N" child after the 10 fixed PL channels. The binding allows
reg values 20..50, so a PL node can have up to 31 such children, i.e.
up to 41 PL channels, while only 31 are budgeted for it. Together with
the 13 PS and 7 AMS control channels, this writes past the end of the
buffer. Since the modules are filled in device tree order, the fixed
channel blocks copied after the PL node can overflow as well.

ams_get_ext_chan() also only checks the upper bound of reg. ext_chan is
unsigned, so a reg below 20 makes it wrap and ams_pl_channels[] is read
far out of bounds.

Pass the remaining capacity down to ams_init_module() and
ams_get_ext_chan() and fail with -EINVAL when a module does not fit,
instead of writing past the buffer. Also reject reg values below 20, as
the binding requires.

Found by static analysis tool CodeQL.

Fixes: d5c70627a794 ("iio: adc: Add Xilinx AMS driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM codeql
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---

Notes:
    Compile-tested only (ARCH=arm64 allmodconfig, W=1). Not tested on
    hardware, and there is no reproducer.
    
    The CodeQL query behind this report was synthesized with LLM assistance,
    and the fix and changelog were drafted with LLM assistance; I have
    reviewed them.

 drivers/iio/adc/xilinx-ams.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/xilinx-ams.c b/drivers/iio/adc/xilinx-ams.c
index 158e6133abf50..373a9e799ee63 100644
--- a/drivers/iio/adc/xilinx-ams.c
+++ b/drivers/iio/adc/xilinx-ams.c
@@ -1142,7 +1142,8 @@ static const struct iio_chan_spec ams_ctrl_channels[] = {
 };
 
 static int ams_get_ext_chan(struct fwnode_handle *chan_node,
-			    struct iio_chan_spec *channels, int num_channels)
+			    struct iio_chan_spec *channels, int num_channels,
+			    int max_channels)
 {
 	struct iio_chan_spec *chan;
 	struct fwnode_handle *child;
@@ -1151,9 +1152,15 @@ static int ams_get_ext_chan(struct fwnode_handle *chan_node,
 
 	fwnode_for_each_child_node(chan_node, child) {
 		ret = fwnode_property_read_u32(child, "reg", &reg);
-		if (ret || reg > AMS_PL_MAX_EXT_CHANNEL + 30)
+		if (ret || reg < 30 - AMS_PL_MAX_FIXED_CHANNEL ||
+		    reg > AMS_PL_MAX_EXT_CHANNEL + 30)
 			continue;
 
+		if (num_channels >= max_channels) {
+			fwnode_handle_put(child);
+			return -EINVAL;
+		}
+
 		chan = &channels[num_channels];
 		ext_chan = reg + AMS_PL_MAX_FIXED_CHANNEL - 30;
 		memcpy(chan, &ams_pl_channels[ext_chan], sizeof(*channels));
@@ -1183,7 +1190,7 @@ static void ams_iounmap_pl(void *data)
 
 static int ams_init_module(struct iio_dev *indio_dev,
 			   struct fwnode_handle *fwnode,
-			   struct iio_chan_spec *channels)
+			   struct iio_chan_spec *channels, int max_channels)
 {
 	struct device *dev = indio_dev->dev.parent;
 	struct ams *ams = iio_priv(indio_dev);
@@ -1191,6 +1198,9 @@ static int ams_init_module(struct iio_dev *indio_dev,
 	int ret;
 
 	if (fwnode_device_is_compatible(fwnode, "xlnx,zynqmp-ams-ps")) {
+		if (max_channels < ARRAY_SIZE(ams_ps_channels))
+			return -EINVAL;
+
 		ams->ps_base = fwnode_iomap(fwnode, 0);
 		if (!ams->ps_base)
 			return -ENXIO;
@@ -1202,6 +1212,9 @@ static int ams_init_module(struct iio_dev *indio_dev,
 		memcpy(channels, ams_ps_channels, sizeof(ams_ps_channels));
 		num_channels = ARRAY_SIZE(ams_ps_channels);
 	} else if (fwnode_device_is_compatible(fwnode, "xlnx,zynqmp-ams-pl")) {
+		if (max_channels < AMS_PL_MAX_FIXED_CHANNEL)
+			return -EINVAL;
+
 		ams->pl_base = fwnode_iomap(fwnode, 0);
 		if (!ams->pl_base)
 			return -ENXIO;
@@ -1214,8 +1227,11 @@ static int ams_init_module(struct iio_dev *indio_dev,
 		memcpy(channels, ams_pl_channels, AMS_PL_MAX_FIXED_CHANNEL * sizeof(*channels));
 		num_channels += AMS_PL_MAX_FIXED_CHANNEL;
 		num_channels = ams_get_ext_chan(fwnode, channels,
-						num_channels);
+						num_channels, max_channels);
 	} else if (fwnode_device_is_compatible(fwnode, "xlnx,zynqmp-ams")) {
+		if (max_channels < ARRAY_SIZE(ams_ctrl_channels))
+			return -EINVAL;
+
 		/* add AMS channels to iio device channels */
 		memcpy(channels, ams_ctrl_channels, sizeof(ams_ctrl_channels));
 		num_channels += ARRAY_SIZE(ams_ctrl_channels);
@@ -1245,7 +1261,7 @@ static int ams_parse_firmware(struct iio_dev *indio_dev)
 		return -ENOMEM;
 
 	if (fwnode_device_is_available(fwnode)) {
-		ret = ams_init_module(indio_dev, fwnode, ams_channels);
+		ret = ams_init_module(indio_dev, fwnode, ams_channels, ams_size);
 		if (ret < 0)
 			return ret;
 
@@ -1253,7 +1269,8 @@ static int ams_parse_firmware(struct iio_dev *indio_dev)
 	}
 
 	device_for_each_child_node_scoped(dev, child) {
-		ret = ams_init_module(indio_dev, child, ams_channels + num_channels);
+		ret = ams_init_module(indio_dev, child, ams_channels + num_channels,
+				      ams_size - num_channels);
 		if (ret < 0)
 			return ret;
 

base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
-- 
2.43.0


