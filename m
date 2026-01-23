Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350EFD77883
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 16:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2USkGu16CwkqU2bwSbxVhm63fIixoX2k8JXuJXnq8hA=; b=K9fQQbLhXYt/cvMd0LeX1RASZG
	ZI1XjVCXmkU+nskzdb/IkP1RQb70Zh2YUPWTorto1AsZMSc0HnBjhZrKkz/h8iuZyHqGdQ00Ej5K3
	uhtgk3aybIySkBJYs0a/YrTLj5XImiJTvROW1Sa+rZNmfJ/UgcWnT9ToOWH7lbg77NppblxdJKpMj
	flYUqRJODXdlQmAxmLsgbWOCXP3G6eYuNWzKqW+IceoiiQSk0VqJngiGAtbz9qc852oRLXji8F8Xo
	7iyfhnu1VrgAzyMXz0E5I299g3X2oplWJRVLM8YSo+Na1ZWFo/0EixFFyzXj6e9CUoiRRUY0sK0cl
	BuNHAyiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjK7E-00000009CyM-0tOB;
	Fri, 23 Jan 2026 16:34:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjK70-00000009Cra-1Yxv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 16:34:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C6E343D1B;
	Fri, 23 Jan 2026 16:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04DB9C2BC9E;
	Fri, 23 Jan 2026 16:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769186057;
	bh=Uwth4qQHTqLwY75OKA44FVxHDgLRiSU4SpL+uWLAnHQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=phg4aZ3L6uad6Zyl19V4tpu029pg4BalZYOeH4yb/P1e8qu6m5tKRdx7qERNh+TgL
	 g6/tg8mhIytDyJFtWDikAdA+75BUE9XyONFXzZ/Rb/9sZ7wbdWusZ0n6JsJbCOZG3F
	 5ehBlMau0UoU2i3IvW6SnqZIA1TyHrRDJX4BPLcJ1lz2j5q0kQVWpFht225h+53Jv2
	 WGv5/IEnT3hjfvel4kd0VhssX623UPqVItZ5I8WsGw11alRRFC44zFDvThL6QaxxLI
	 a3XUH9eXsLZ7LERNKI5GnaR7DlO8RQWX/QOjIuZxcsxe/LHrPSDaaU7ZmR0UElV2vo
	 X6bdZvDlWs0pw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE73ED6CFA7;
	Fri, 23 Jan 2026 16:34:16 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Fri, 23 Jan 2026 16:34:17 +0000
Subject: [PATCH v4 4/5] i2c: xiic: remove duplicate error message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-i2c-xiic-v4-4-4a3eba3510ce@nexthop.ai>
References: <20260123-i2c-xiic-v4-0-4a3eba3510ce@nexthop.ai>
In-Reply-To: <20260123-i2c-xiic-v4-0-4a3eba3510ce@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769186056; l=832;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=BSG/SlNQJILNTQbChjjZzK6BX9LQhT0R0SiLAYGmwP0=;
 b=t0BNbvH3/YpRUwikr6asJyBLXrzq6x9Q0JfwDHrCRBlEXFsYW4E2uVF2n7yiAIgM599aax/1O
 FVC8s6Uy88lDmkb899+kUDIqiIDSZBIXbpqxwOhNkM58eUdSwizZ3Or
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_083418_470935_022A65D0 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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

The devm_request_threaded_irq() already prints an error message. Remove
the duplicate.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 6d47c9972719..800a27413978 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1491,10 +1491,8 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	ret = devm_request_threaded_irq(dev, irq, NULL, xiic_process,
 					IRQF_ONESHOT, pdev->name, i2c);
 
-	if (ret < 0) {
-		dev_err_probe(dev, ret, "Cannot claim IRQ\n");
+	if (ret < 0)
 		return ret;
-	}
 
 	i2c->singlemaster =
 		of_property_read_bool(dev->of_node, "single-master");

-- 
2.52.0



