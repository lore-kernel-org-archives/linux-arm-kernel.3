Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45063EA4FD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 15:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fcZmfOTsRVzoKMwrguAXKLgAnp8RLRAocL6EFdh37Pg=; b=xIOEM9wFgS6ZmvLBIu2/gpf6Da
	/SOOy2G/MV6TDuir7omo8+FC+Yl42uEPbFRug4tAAj4BT21KMaDzepQgv8fsURvqW+YCaZ7PzSjQs
	O0fRXESxvRGdQhPsj7mF0SElSh46xrEBx2OKELhMocqEgGw4/j/V5jau2zF7k9gvaNWPdbI2d1q9w
	DLgTnUWOZ2dETK5huuc1NW6INgpWji+IqbnPAgpyo5+UoJGrAsMPH8TRgRs6Sw9FN3bbTOPtI2Hek
	m0EO+TSXNn6QExIX8bzjngGVIK8p3eg1K2hVaS83nzMGnX0Wlvf/MmTxQhfTdhuT45aKMbR5FKpvt
	e2igY0iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYLJ-00000000cKK-0ler;
	Mon, 23 Feb 2026 15:59:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYLC-00000000cGs-1wEb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 15:59:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E6634453E;
	Mon, 23 Feb 2026 15:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19893C116C6;
	Mon, 23 Feb 2026 15:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771862360;
	bh=aS/ZRjoiK2LzRii4KCSPVSdnQuMx4YxvC8udAKmML9g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=W5U9TMfZ8C4iTzgII0YR77aGQJuM2HtuY435Wtadkk9e54++orTtoYC2nuKyOiWVm
	 T/TzbWmn0dSA+tZjdZ3BzmbDO2ZQS0zNYUpTontpQJ3IAiN9VkGLsFTzX8vskfPYiy
	 kwh3QmK0PwqlBcU1/CVjZGrZbGs7xESbxxV0NJf+WRm8MZGOE+MWs8uN7sIJZfLboX
	 xnDjj8tYAkBODhm17NLSIIi6dW7DnNdk/JOoxhILc1S8oTNs26xL7p9c4h08qcvnWx
	 NBJ2jPVhyBWQ6WmVr2WQRJoqN4YdKn1TLvPfS35N/cvSBe5GCXRxVlrnkhrQoJnze3
	 fkUkE8/oOFB+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 120CEEA4FD8;
	Mon, 23 Feb 2026 15:59:20 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Mon, 23 Feb 2026 15:59:21 +0000
Subject: [PATCH v12 6/7] i2c: xiic: use numbered adapter registration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-xiic-v12-6-b6c9ce4e4f3c@nexthop.ai>
References: <20260223-i2c-xiic-v12-0-b6c9ce4e4f3c@nexthop.ai>
In-Reply-To: <20260223-i2c-xiic-v12-0-b6c9ce4e4f3c@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771862359; l=1439;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=eIOcBblyySq1mWQBgk0IUkRMweSQ1d65J0ODZqXKZI4=;
 b=8vXZvuulE0Ks2TJqBEbHU1I2pgJzSoKrG5A9J4ziNYQpK8nUXdD/nDJb++lwHJPY4QS14WxP6
 xrf+lRysHq4Czbe7iFhHw55RRUixYkxmiA+Q7LmrknD47zXdjw/f4KK
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_075922_666851_12EC53BB 
X-CRM114-Status: GOOD (  10.75  )
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
Reply-To: abdurrahman@nexthop.ai
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Switch from i2c_add_adapter() to i2c_add_numbered_adapter() to enable
platforms to specify fixed I2C bus numbers via the platform device ID.

This allows systems to maintain consistent bus numbering across reboots.
On platforms where the device ID is PLATFORM_DEVID_NONE (the default),
the adapter falls back to dynamic allocation, preserving backward
compatibility.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 80e183b6e4f1..6eb0c6a2618a 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1451,6 +1451,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	/* hook up driver to tree */
 	platform_set_drvdata(pdev, i2c);
 	i2c->adap = xiic_adapter;
+	i2c->adap.nr = pdev->id;
 	i2c_set_adapdata(&i2c->adap, i2c);
 	i2c->adap.dev.parent = &pdev->dev;
 	device_set_node(&i2c->adap.dev, fwnode);
@@ -1507,7 +1508,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret, "Cannot xiic_reinit\n");
 
 	/* add i2c adapter to i2c tree */
-	ret = i2c_add_adapter(&i2c->adap);
+	ret = i2c_add_numbered_adapter(&i2c->adap);
 	if (ret) {
 		xiic_deinit(i2c);
 		return ret;

-- 
2.52.0



