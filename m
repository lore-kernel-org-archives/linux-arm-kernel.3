Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8752AC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 21:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v4ALv4PlUkkEzw8n/20WsOuPBd75uA1YbabHxHjcL1k=; b=qChycS2TjF+pKQmE5aOzbtpVNm
	4lRq8kY0WveMDhkAqetndYzkRfPA1XfSeg5d0Js0xenjMOUOUoIwNwlhvUO9L7PIEb8vvHmaF7ZTx
	C2C+t8lvMH/DhNHM6fwzh23FJxJbIlWTEnZ0lpyf8drwP1B7Uio9t/N1Gig+7KSoK8P65rrkgZO2X
	IsFNmfKo/HuXHTt160XrV5k7ew3nqCQMO5Rto37POI2VkWAjx2XMB3RhTHLCw9yBbVboCjvp6Fe7z
	RaWAT1LzmPwnUIVJO3d9Tqxhz4ogf8HuTIA2lTc/26LL3wBp8Ri0/MLIcVD1tagl7/nhEPfnPRGJr
	3PgGGMGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JQS-0000000CXcI-12Ff;
	Thu, 17 Sep 2026 21:13:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JQQ-0000000CXc2-3N44
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 21:13:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 61B814031B;
	Thu, 17 Sep 2026 21:13:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43DA51F000FF;
	Thu, 17 Sep 2026 21:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789679626;
	bh=v4ALv4PlUkkEzw8n/20WsOuPBd75uA1YbabHxHjcL1k=;
	h=From:To:Cc:Subject:Date;
	b=nKtBz2XwUR4kkvAOpRK51OeI2Vqak5cDuxLjb4y1t/5LokQAyFcXRRhirId6zMdeR
	 Fpc6hX7la/BPYfFxd4SaRUD50d8rxEUza3grU5WXb+A1Bbxpelm2pyIPiuMonfZDtM
	 Z5AyBMpTkmFSrLC9dy+VP5TsZxzxV3Wqhn4VDttL15N7u+3KKugCLICUKd8pKd+Tu5
	 27qs4dud3pTo/QMsTiHEKrKYkL3qgKawQxuUPzgmeHgGDyBb9XQJIb3zvbZO6lFte9
	 c4sYe1TCnzWsl/0oFWtFSDhFg+CLaCJ6di1KIvIb4VopVnvqzix59MnC9m8dkVSY63
	 bqNqGqkb66KGg==
From: Kees Cook <kees@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Guenter Roeck <linux@roeck-us.net>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] hwmon: scmi: Fix info[] allocation type
Date: Thu, 17 Sep 2026 14:13:45 -0700
Message-Id: <20260917211344.i.911-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1723; i=kees@kernel.org; h=from:subject:message-id; bh=rFYSh2hqNBw2ENmrdsxu+Uyvi5RqE7u5dNsIMBJsNcQ=; b=owGbwMvMwCVmps19z/KJym7G02pJDFlrIjh2i7cvmKH4o+iA+daEQx5+e68J5PHs/i9z5ynnd 76jJ53FOkpZGMS4GGTFFFmC7NzjXDzetoe7z1WEmcPKBDKEgYtTACaS6sbIsEVq0ZzC3NWN0WFH HJtePwt3X7XiCFPCKpPgZzNYZzKxFDD8FYiZfadF9kWJ1NWlKVKxxXvvy913qNvT5GEslXN97Y0 mVgA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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

From: Kees Cook <kees+treewide@kernel.org>

In preparation for making the devm_kmalloc family of allocators type
aware, we need to make sure that the returned type from the allocation
matches the type of the variable being assigned. (Before, the allocator
would always return "void *", which can be implicitly cast to any
pointer type.)

The assigned type of "scmi_sensors->info[type]" is
"const struct scmi_sensor_info **", but the converted allocation type
would be "const struct scmi_sensor_info ***", as the size was taken from
"*scmi_sensors->info", which is one level of indirection too many.
Luckily both element types are pointers of the same size. Take the size
from the element type of the assignment target.

Build tested ARCH=x86_64 allmodconfig with GCC 16.2.0:
drivers/hwmon/scmi-hwmon.o

Assisted-by: LLM coccinelle
Signed-off-by: Kees Cook <kees+treewide@kernel.org>
---
Cc: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: <arm-scmi@vger.kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>
Cc: <linux-hwmon@vger.kernel.org>
---
 drivers/hwmon/scmi-hwmon.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/scmi-hwmon.c b/drivers/hwmon/scmi-hwmon.c
index eec223d174c0..9ae8f774297e 100644
--- a/drivers/hwmon/scmi-hwmon.c
+++ b/drivers/hwmon/scmi-hwmon.c
@@ -305,7 +305,8 @@ static int scmi_hwmon_probe(struct scmi_device *sdev)
 
 		scmi_sensors->info[type] =
 			devm_kcalloc(dev, nr_count[type],
-				     sizeof(*scmi_sensors->info), GFP_KERNEL);
+				     sizeof(*scmi_sensors->info[type]),
+				     GFP_KERNEL);
 		if (!scmi_sensors->info[type])
 			return -ENOMEM;
 	}
-- 
2.34.1


