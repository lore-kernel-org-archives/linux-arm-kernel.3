Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7890DCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 17:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bhmIzPSCl7MXgY5jjxYLB5dvFRZk9gQqMkOqKtkFebA=; b=HrsN4ZcWkjKKhDctFY5VTW4kQ1
	ka7FseOkFiNwh+UCkU5mOIAn9qBC4zPHq9uzEdDEsP1OsZQ5qfh2bsuk5mRUrF+cS0C3+HQnS/0zo
	r3oDLl9JiuHyHK+JkdISY+upDR8vgby73zBaVUhT9dcxUkxovFwHK6s7HkHH7LL/dI0K763z88jRi
	jXds4n6smyCKOAKTWBHa8W/EnswIAqyf8itVB4F+SToH771DsYwjS6L6uoHkDJVUI1i9qns65uA3R
	8XchKe1YVYASLHJjIbWaiZJ4E7SnU9Be2U/Lyai034Lps7zpSjQN5KQU9k/CxC5KoXaG55gFDdVrJ
	L1jvm5Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEswR-00000006Vbl-2yW5;
	Fri, 31 Oct 2025 17:29:35 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvc-00000006UZi-0Nuf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 17:28:47 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33F853A2;
	Fri, 31 Oct 2025 18:26:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761931611;
	bh=Dukl/WKTNn0wwgbhbk8IkuZav/VzD6UEX4T6MaTL8AI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JErt/xIluRppHac6UmQLtNHQ8xbdP7NMebnfJobJMrO/5beQL2n18ETgdXfBKSpco
	 EWn77E+2ByJvQrUgVIkNXGX0CpMOMDMyXSFPcRNrNHa/kSyQFpORX8g9WWz6I6Hfud
	 lTHcD+Q3zi755s+0J9L8LphMtHh1eKsmRROT2L9w=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 31 Oct 2025 22:57:27 +0530
Subject: [PATCH 07/13] platform/raspberrypi: vchiq-mmal: Free the event
 context for control ports
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-b4-vc-sm-cma-v1-7-0dd5c0ec3f5c@ideasonboard.com>
References: <20251031-b4-vc-sm-cma-v1-0-0dd5c0ec3f5c@ideasonboard.com>
In-Reply-To: <20251031-b4-vc-sm-cma-v1-0-0dd5c0ec3f5c@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Phil Elwell <phil@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1053;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=fPg0a6AIcLpabOkEcm9pZiFTJR0XeNxvSGleuAQ11J8=;
 b=kA0DAAoBQ96R+SSacUUByyZiAGkE8ZqgehNmv8v3XSihPC2d1bJhKHNTCrIaLVCwkdJm2qI9e
 okCMwQAAQoAHRYhBE3g2Bjl1XXo1FqvxUPekfkkmnFFBQJpBPGaAAoJEEPekfkkmnFFM/0P/Rq7
 34LlQMjVNWBWKTieL7tV5W5qqp0AtCNAaXhGrIbeczi/hRveSe6jo9KEPhaHbVFVwGsezputZBp
 h7gsry5T+tZRT4Vr5VzBrIh4zbxs9qwmIluDU8mGlx6DyT2eTS4C9tSN9Jp+2dokoeffT3B2qXd
 /ztToWAspYbDFGYtQzPzGxa/kR/HBq9G/7GfcQt4v+kf/x/j3CfX0XPppooHmwZGISts6/1AsOo
 xde1q4GxMDsqSwOgU/WTeVY+n/Ntax41+HA5O8XLpKe1wh4aFrGzfYWzmlgQY5HoAnAw0ZtVKO/
 o51ZD90HlrLrNJ+GcNudDjpS2kW8/hGyf+9Y8olKSACykq63GQW7g+p2w/yVrYPkCeF/9sDx43J
 sSJqqxQnzGqqtVeSkAqw4cxyhFvMiSGV8LE2V7Wq/rbn0i8KgQ8E2+RmZp8lF8UsEVU84lVW04B
 dfLNf5pgo/Hw7JH9BJmkZrmcOZxNqVfQvTE3Jdr6Fi0yezUvd2FF29x/TS4Jrzk/65TMK8v/RD5
 xnfysoE7UZNSaDzRXDjIxJjuqPdJtcJFXLhuu7LSHOwtgp1wItDO2ICwhEIjdV75g9lAkTVzv0B
 n+VAbnHixBd4QucxeRyllZ/LDOFnIvx8KMIN3riWx3kn3gLXuF9aPfuKXvlaFwzX8WTmCy612mN
 Mr+A4
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_102844_365018_31D86172 
X-CRM114-Status: UNSURE (   8.47  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

vchiq_mmal_component_init calls init_event_context for the
control port, but vchiq_mmal_component_finalise didn't free
it, causing a memory leak..

Add the free call.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
index 6381495fc3867013f74bd3754ed64e0a1ce01574..36f3b068c825e6a26508aefe544f7061c9559510 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
@@ -1902,6 +1902,8 @@ int vchiq_mmal_component_finalise(struct vchiq_mmal_instance *instance,
 	for (idx = 0; idx < component->clocks; idx++)
 		free_event_context(&component->clock[idx]);
 
+	free_event_context(&component->control);
+
 	mutex_unlock(&instance->vchiq_mutex);
 
 	return ret;

-- 
2.51.0


