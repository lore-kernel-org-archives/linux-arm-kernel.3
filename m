Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32B8CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 19:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mo0tgPjjIrtp22I9NnAlALdg4YC4GfmdCEjPNCJguJk=; b=fM9RBiJmXpyuexcY6+/Wb/yPJG
	DH5VxbSzJ3y1m1tfUxs/UwxesiNBDHbsLDZAfN6uGvDmKXTxPPEqM0MHMqCar2+V/JHnsEeuRcJWr
	W6nMYutFci1IK1jG/KpfhKr7FvtwvMmy3wTB17ywYGiy4C7NI0MioLvHRqCr9RNv5tF/ScA6IhY6r
	DBh6mfVzvXdXg4kiBJPstOkTEvhN0S5xZR7XvTTocyd3Xk03ceZQIG9u55JNGkivFPOc8kyV/iKZa
	dOV0BIhcR+Ue0N+1Sq0VsZAz5VF4WqmZIg4dN8W0rQwODv0YUbdw0aigzlpKhbbPP68pPYMzWXp4x
	zGklKv1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOgmn-0000000DI4X-0mV2;
	Sun, 17 May 2026 19:04:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOgmi-0000000DI21-06de
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 19:04:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 77A07429ED;
	Sun, 17 May 2026 19:04:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD48C2BCC6;
	Sun, 17 May 2026 19:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779044659;
	bh=N9O3vxXoMdpQ51OeP/FlfrEMA19XNtmgtu0oCSZdBQU=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=DLin+HbAOAg6iPlqj/EwGZ9xsdpoJ/nw+U0izai/MpZ6uk5QjD1J2AYNh+jipuFzd
	 7ImuJ/cVUIctcnDNQjNhF04GMT8TT+lFgLr8K6QaA0eh3FCnkRSzl2kUtE1yncnEVM
	 1yio9ogHUscUtiHJ6OUXcWYFBbSgA8VwaS3sGwR056OkQgg7QO6Nfxa1XULUhtb7U8
	 Iq7tXc4zhjeKfp+Usc6c6chg9EVfbEB+n8NTarhuH0AhTYZa5jh5SqfIXwMtF8hsbx
	 bQqydvg7wxQpsF/3T8hK+3fxofYQQLaRrZ3GSdq9yV86z3RV589lOd00GAjUGlX9Mf
	 Tog8LR6XkA3Dg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Sun, 17 May 2026 20:02:40 +0100
Subject: [PATCH 1/4] firmware: arm_scmi: Read sensor config as 32-bit value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-scmi_fixes-v1-1-d86daec4defd@kernel.org>
References: <20260517-scmi_fixes-v1-0-d86daec4defd@kernel.org>
In-Reply-To: <20260517-scmi_fixes-v1-0-d86daec4defd@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_120420_094405_F3A00708 
X-CRM114-Status: GOOD (  10.61  )
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

The SENSOR_CONFIG_GET response contains a 32-bit sensor_config field,
and the xfer is initialized with a 4-byte RX buffer. Reading it with
get_unaligned_le64() can consume bytes past the returned payload.

Use get_unaligned_le32() to match the protocol layout and the allocated
response size.

Fixes: 7b83c5f41088 ("firmware: arm_scmi: Add SCMI v3.0 sensor configuration support")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/sensors.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/sensors.c b/drivers/firmware/arm_scmi/sensors.c
index 882d55f987d2..836c294a9f42 100644
--- a/drivers/firmware/arm_scmi/sensors.c
+++ b/drivers/firmware/arm_scmi/sensors.c
@@ -793,7 +793,7 @@ static int scmi_sensor_config_get(const struct scmi_protocol_handle *ph,
 	if (!ret) {
 		struct scmi_sensor_info *s = si->sensors + sensor_id;
 
-		*sensor_config = get_unaligned_le64(t->rx.buf);
+		*sensor_config = get_unaligned_le32(t->rx.buf);
 		s->sensor_config = *sensor_config;
 	}
 

-- 
2.43.0


