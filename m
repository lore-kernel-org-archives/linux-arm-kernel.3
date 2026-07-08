Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846D3C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 09:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v3I1DWLH7zeKVOM/hYjiYR73bFir5/f89XictzBGoEY=; b=fWijqZOM0bAV21/ImngoERiBlg
	oW6f5BiQI8duCXY+Pg+TIpAkF2gqF0wHAhzgfY8f7FSJ4+Qj+6Gxylg5r3KQXUjaEFtapbovcxvXT
	Orf7IMqRQ8hII3nHoJpTeijTCqPoz6HzeAD9YQDFSpSEW9zI/YWLOjqYD/huyJTnz697q0fBNCd3B
	ImnwgayZpDa81MjJ1Kvm0UQbcTi2xMIPfVMwXhK/iObc4pxl92cRa2USmhp7lK+AYGkLwXe1NMD6I
	6DhGMPTe8AkY6v8tqNug0vwku7EC/ESzA1q6oJ+3VyTsYACbYj/yhYGRSTKIj995Gw3Ap3WUbZAz9
	avGLN+qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whO8w-0000000GfxY-1J9R;
	Wed, 08 Jul 2026 09:00:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whO8q-0000000Gfuu-1FcY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 09:00:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1411543BC6;
	Wed,  8 Jul 2026 09:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660831F000E9;
	Wed,  8 Jul 2026 09:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783501228;
	bh=v3I1DWLH7zeKVOM/hYjiYR73bFir5/f89XictzBGoEY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Utkvgm4Sgc8y0FGkI3Koyu6NHDyzxage+Yy3Jhxd1U87YOtYBVv6R1azbym/4rSNg
	 XraHlxq1cXFXtMFvCSvjHs2MLlj/ejAuW7yJ/UKGIUUR+ZAexhx+gy9Fn1lttVtvvs
	 SyA12nG+wTbTLsJwdpwRxs6ewwKyzZ/6EJGrm5vHYHhkxEmkh+llB2ydGyEcW/Xpsd
	 Yezvnz+jWwX3AaD4ooDQBX/9SynPuyewv0Jjai0gF442D/EtJyKz0eNv9ABprZMo73
	 yBw06P1lAELqXFciH0qceT4H73jXn6U9b17TQwcQbGCBTr9ZJ4yBOK6OxoUcnNFrn1
	 CQ5YeYcyWjzTQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 08 Jul 2026 09:59:59 +0100
Subject: [PATCH v4 03/16] firmware: arm_scmi: Clean up channels on setup
 failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-scmi_core_fixes-v4-3-53142cd60b63@kernel.org>
References: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
In-Reply-To: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2
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

scmi_channels_setup() can fail after the common BASE channel or earlier
protocol channels have already been registered in the TX/RX IDRs.

Route this failure through the existing channel cleanup label so the
transport channels, transport devices and IDR state created before the
failure are released before the probe error path frees the SCMI instance
ID.

Fixes: 05a2801d8b90 ("firmware: arm_scmi: Use dedicated devices to initialize channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 6f588840bf11..0a8a1d9de008 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3263,7 +3263,7 @@ static int scmi_probe(struct platform_device *pdev)
 	ret = scmi_channels_setup(info);
 	if (ret) {
 		err_str = "failed to setup channels\n";
-		goto clear_ida;
+		goto clear_txrx_setup;
 	}
 
 	ret = bus_register_notifier(&scmi_bus_type, &info->bus_nb);

-- 
2.43.0


