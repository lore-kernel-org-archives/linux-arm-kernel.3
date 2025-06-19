Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C12CC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 20:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F92lwo5VOd1tq612WPpWLZKza4VCHqS8IRTHLKoOjew=; b=vHEIKm7q4XufXaJ6G0QNo4GNQk
	hATnMUJydYVHmtKpHL9w9F/pQaBEY4sFHNZ+f2tieJqNXOo/mTb1ufVlmjmInWBRrUKL8QsP+U/uP
	gWKskxbte/khnqDKKhgbyKMDNpPe+xwpr7W23RDvM+ullNyNuluHPnAPkok8/th4DBHevKK11jllX
	GC9K5O5xVB6puySp5VJaSsIIa8Ws8fKRMOvqdOVKxzTgJaArgqyAQnyWboxBEaaffC04xOEmLl3xB
	xfMZytVTR/d5tUYIGuhHswAifgq1mpf1rEFLcDj2IBJV8XG4lTemlcAhzQ+S0wbvt5LzBfVNIKZZk
	KvzxMOEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSM3H-0000000EEcg-0PpP;
	Thu, 19 Jun 2025 20:40:03 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLWH-0000000EAzB-2NcN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 20:05:58 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750363555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F92lwo5VOd1tq612WPpWLZKza4VCHqS8IRTHLKoOjew=;
	b=U3ZaH+OzZC4XyFuiMwkaaxWeHokAzLwigVj+qnaoY7KwKzsbhxDlPd9M8QE9zWVgL4B7W6
	VDb90LbN9ao6Bcooq/qxZv7OXqed103e2WAOvU/aODvZ6Ud6hWDD2BRTRlwyxS5LnWfxtl
	ZCcQxoxHJdj0HISri8DPdBgTf3rrDv8=
From: Sean Anderson <sean.anderson@linux.dev>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michal Simek <michal.simek@amd.com>,
	Saravana Kannan <saravanak@google.com>,
	Leon Romanovsky <leon@kernel.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	linux-kernel@vger.kernel.org,
	Ira Weiny <ira.weiny@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Sean Anderson <sean.anderson@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH net 1/4] auxiliary: Allow empty id
Date: Thu, 19 Jun 2025 16:05:34 -0400
Message-Id: <20250619200537.260017-2-sean.anderson@linux.dev>
In-Reply-To: <20250619200537.260017-1-sean.anderson@linux.dev>
References: <20250619200537.260017-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_130557_754279_9D769377 
X-CRM114-Status: GOOD (  11.32  )
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

Support creating auxiliary devices with the id included as part of the
name. This allows for non-decimal ids, which may be more appropriate for
auxiliary devices created as children of memory-mapped devices. For
example, a name like "xilinx_emac.mac.802c0000" could be achieved by
setting .name to "mac.802c0000" and .id to AUXILIARY_DEVID_NONE.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/base/auxiliary.c      | 6 +++++-
 include/linux/auxiliary_bus.h | 4 +++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
index dba7c8e13a53..64a0d5e2eb83 100644
--- a/drivers/base/auxiliary.c
+++ b/drivers/base/auxiliary.c
@@ -331,7 +331,11 @@ int __auxiliary_device_add(struct auxiliary_device *auxdev, const char *modname)
 		return -EINVAL;
 	}
 
-	ret = dev_set_name(dev, "%s.%s.%d", modname, auxdev->name, auxdev->id);
+	if (auxdev->id == AUXILIARY_DEVID_NONE)
+		ret = dev_set_name(dev, "%s.%s", modname, auxdev->name);
+	else
+		ret = dev_set_name(dev, "%s.%s.%d", modname, auxdev->name,
+				   auxdev->id);
 	if (ret) {
 		dev_err(dev, "auxiliary device dev_set_name failed: %d\n", ret);
 		return ret;
diff --git a/include/linux/auxiliary_bus.h b/include/linux/auxiliary_bus.h
index 4086afd0cc6b..76904cf2c3dd 100644
--- a/include/linux/auxiliary_bus.h
+++ b/include/linux/auxiliary_bus.h
@@ -51,6 +51,8 @@
  * unregisters the auxiliary device.
  */
 
+#define AUXILIARY_DEVID_NONE	(-1)
+
 /**
  * struct auxiliary_device - auxiliary device object.
  * @dev: Device,
@@ -269,7 +271,7 @@ struct auxiliary_device *__devm_auxiliary_device_create(struct device *dev,
 
 #define devm_auxiliary_device_create(dev, devname, platform_data)     \
 	__devm_auxiliary_device_create(dev, KBUILD_MODNAME, devname,  \
-				       platform_data, 0)
+				       platform_data, AUXILIARY_DEVID_NONE)
 
 /**
  * module_auxiliary_driver() - Helper macro for registering an auxiliary driver
-- 
2.35.1.1320.gc452695387.dirty


