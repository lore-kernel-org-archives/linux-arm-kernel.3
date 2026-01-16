Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FBDD47CDE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 11:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jR1d80OffUV7uTQEpev81sOA3UFu+1WzvTqmM8RGtaQ=; b=QUqRJ02kGKa3/EQDFObASetgJ8
	FV3KY/e9n4IL5ZBB8yTu/zvU5GKyK90epjqS2JKq9wGk1qOJOSNoy3yOBnbdcBYRB3WuKPT94c5Ea
	x2owKfH3yJtWKTm2Ql45v7+ZQWiQbLU5/hmfTVwy0zGFYjr1kWcJEl/uBMLWkj4aj1BKeMt/Cl7gm
	2U848iL08+MYpRLRUmf7nirUT+0a7WRVNgVNCKfZTjF+0rdHMXNv/+CpbA4A7bzTOZNvFv4HYoiDj
	D+89OiHIH0ax/GnwVt6oMMRjiJpaT/+lb0B5PUVnfj30Rq2gYt998VYhhHqh83t1BfGwAoYW3onlE
	DATKHpCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgi62-0000000E3NP-1VTI;
	Fri, 16 Jan 2026 11:34:30 +0000
Received: from send58.i.mail.ru ([89.221.237.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgi5z-0000000E3Mg-1YZo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 11:34:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
	To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=jR1d80OffUV7uTQEpev81sOA3UFu+1WzvTqmM8RGtaQ=; t=1768563267; x=1768653267; 
	b=pqZbC5kZ6QVG9F4zaRA96ZjLKoeCJw+TCGE5oVH6eekTCEsX4EXM62IlRvW17k2ce2JcMm4uHjZ
	/ojR1gaprjqLPjKUoyjoeHdpLKaeFYNNZk1s//Oxur0lCrI9VlvqxCL43I8haw6u2jfy+et5fiM3o
	Q6G9RCOZqKJoKn6ZUWkiIOxfhtDm+jLq3EL0ZmqMfCvxoNC/80yBZKwTi6mLgdyd68qyyZ8tWsfXG
	NfPai1W6fAvkXliH5Mc5iplwrElu4a/rcAqt9pS7vteHSecLjWWh+KluPhjmNrWmpuZUNrtj+yMey
	oNctjS6w1ZwfkpnvTMFnGuI4K0GQKhbQDjSA==;
Received: by exim-smtp-7b4fb89df9-67b2p with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1vgi5Q-00000000BD3-2rha; Fri, 16 Jan 2026 14:33:53 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: arm-scmi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonathan.Cameron@huawei.com,
	cristian.marussi@arm.com,
	sudeep.holla@arm.com,
	Maxim Kochetkov <fido_max@inbox.ru>
Subject: [PATCH 1/1] firmware: arm_scmi: move scmi_channels_setup() after SCMI stack init
Date: Fri, 16 Jan 2026 14:33:22 +0300
Message-ID: <20260116113322.29427-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: exim-smtp-7b4fb89df9-67b2p; auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD915CCE24728BE1C659288DDFB45DD09173BC4D529DAC28AFF182A05F5380850404C228DA9ACA6FE27703FF7A2CA780D5C3DE06ABAFEAF6705FDB245181E5689CA1445013257ED8507EA49DAD9745199E0
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F157A19638F32F60EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB5533756680939BF45BBEA696D66F1F908B0E0CD669C74E262E6C083C3F5BFD04E3EAC4E88EEF46B7454FC60B9742502CCDD46D0DEDCF5861DED71B2F389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C0AD76BF5943A59ECC8941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B66EFF71F1B3C06F72CC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB86D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE75A9E79F66F1C28F3731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A507FC153A179462395002B1117B3ED69695DD9DF6417A798A250A03108B67251B277AA237ED671D4372AF3B35EA4094CC8ED1AC82D843A2BB9C5DF10A05D560A9D2B5782620B851B7C8C84E951CD0BE2F58C12E6D310A6D53566404C906FA8ADEA71A35648BE338CEED902CAAD3CD6B00BA7CCD254A1CF5E8EBBD898635E49373638A446BE3E5C627BF0CFE790FC11A7261332C5CB50AE517BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34CA0CBE312C330D7D583CD26C36C883521FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D65956BCBECC2AB312DD7BF48E4D43E3283106E5567CD68261AC52A66745F672F67FB5A0969D806867DBB8341EE9D5BE9A0A0F93AFFF416A809940775ABDFBE9C0522475EF7FB0E9BB86DABE3362BFED2FD64C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVVt0N+pdRHOZuqP9fAipHsk=
X-Mailru-Sender: 689FA8AB762F7393DDD5FD59B456EAD27B0D6E5CCDD2C5C297605EEF9BC9CED6EA71D86CE574F84B90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_033427_952256_9C4B50DB 
X-CRM114-Status: GOOD (  14.58  )
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

scmi_channels_setup() makes channels enabled and ready to receive
messages immediately. In some cases channel may receive message from
firmware here (i.e. notification). This message will be passed to
SCMI RX path scmi_rx_callback(). Then in scmi_handle_notification()
scmi_xfer_get() is called to get message buffer to unpack.
scmi_xfer_get() uses xfer_lock spinlock. But xfer_lock init is
located in scmi_xfer_info_init() which is called after
scmi_channels_setup() in scmi_probe().
So here we have trying to access to uninitialized spinlok:

[    9.978360] BUG: spinlock bad magic on CPU#0, irq/16-1e200000/123
[    9.979236]  lock: 0xffffffd6035500c8, .magic: 00000000, .owner: <none>/-1, .owner_cpu: 0
[    9.980633] CPU: 0 UID: 0 PID: 123 Comm: irq/16-1e200000 Not tainted 6.12.0-01250-g7fb379e5f78e-dirty #2
[    9.983157] Call Trace:
[    9.983422] [<ffffffff80007ab4>] dump_backtrace+0x1c/0x24
[    9.983972] [<ffffffff80b5d380>] show_stack+0x2e/0x38
[    9.984523] [<ffffffff80b6e58e>] dump_stack_lvl+0x52/0x74
[    9.985336] [<ffffffff80b6e5c4>] dump_stack+0x14/0x1c
[    9.985556] [<ffffffff80b5dfa8>] spin_dump+0x62/0x6e
[    9.985942] [<ffffffff8007df7a>] do_raw_spin_lock+0xd2/0x12c
[    9.986213] [<ffffffff80b78f16>] _raw_spin_lock_irqsave+0x22/0x2e
[    9.986585] [<ffffffff80823442>] scmi_rx_callback+0x158/0x7ca

So move scmi_channels_setup() after full SCMI stack init to make
sure we are ready to receive messages before enabling channels.

Fixes: 4ebd8f6dea81 ("firmware: arm_scmi: Add receive buffer support for notifications")
Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 drivers/firmware/arm_scmi/driver.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 3e76a3204ba4..0c46a9dfaf80 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3225,17 +3225,10 @@ static int scmi_probe(struct platform_device *pdev)
 	handle->devm_protocol_put = scmi_devm_protocol_put;
 	handle->is_transport_atomic = scmi_is_transport_atomic;
 
-	/* Setup all channels described in the DT at first */
-	ret = scmi_channels_setup(info);
-	if (ret) {
-		err_str = "failed to setup channels\n";
-		goto clear_ida;
-	}
-
 	ret = bus_register_notifier(&scmi_bus_type, &info->bus_nb);
 	if (ret) {
 		err_str = "failed to register bus notifier\n";
-		goto clear_txrx_setup;
+		goto clear_ida;
 	}
 
 	ret = blocking_notifier_chain_register(&scmi_requested_devices_nh,
@@ -3279,6 +3272,12 @@ static int scmi_probe(struct platform_device *pdev)
 		dev_err(dev,
 			"Transport is not polling capable. Atomic mode not supported.\n");
 
+	ret = scmi_channels_setup(info);
+	if (ret) {
+		err_str = "failed to setup channels\n";
+		goto notification_exit;
+	}
+
 	/*
 	 * Trigger SCMI Base protocol initialization.
 	 * It's mandatory and won't be ever released/deinit until the
@@ -3291,7 +3290,7 @@ static int scmi_probe(struct platform_device *pdev)
 			dev_err(dev, "%s", err_str);
 			return 0;
 		}
-		goto notification_exit;
+		goto clear_txrx_setup;
 	}
 
 	mutex_lock(&scmi_list_mutex);
@@ -3333,6 +3332,8 @@ static int scmi_probe(struct platform_device *pdev)
 
 	return 0;
 
+clear_txrx_setup:
+	scmi_cleanup_txrx_channels(info);
 notification_exit:
 	if (IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT))
 		scmi_raw_mode_cleanup(info->raw);
@@ -3342,8 +3343,6 @@ static int scmi_probe(struct platform_device *pdev)
 					   &info->dev_req_nb);
 clear_bus_notifier:
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
-clear_txrx_setup:
-	scmi_cleanup_txrx_channels(info);
 clear_ida:
 	ida_free(&scmi_id, info->id);
 
@@ -3367,6 +3366,9 @@ static void scmi_remove(struct platform_device *pdev)
 	list_del(&info->node);
 	mutex_unlock(&scmi_list_mutex);
 
+	/* Safe to free channels since no more users */
+	scmi_cleanup_txrx_channels(info);
+
 	scmi_notification_exit(&info->handle);
 
 	mutex_lock(&info->protocols_mtx);
@@ -3381,9 +3383,6 @@ static void scmi_remove(struct platform_device *pdev)
 					   &info->dev_req_nb);
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
 
-	/* Safe to free channels since no more users */
-	scmi_cleanup_txrx_channels(info);
-
 	ida_free(&scmi_id, info->id);
 }
 
-- 
2.51.0


