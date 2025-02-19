Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07A9C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 09:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bnXcNHwkW6X9U4jS6BaBVAavk+9DXCgFqxwyfpT0+Y0=; b=a/YFFSdi41E7XPRmmi3Y5YeUtz
	WDoZqtI7miYXvJA3ndqp2JVHWPoC3NGuzNqoMhygIIQQ1mWefzCu+1LlY9eGFBvziA+RnkNslU3RJ
	VUBojl/VbAzYYUYOKWtY/HoxgMO7A5pC1HGeLrcdBe8sb2C1vFlSHcwW2JqBx9BSwyhk4+jua9Ts3
	cYOGLJQ+FtYFGfh/z1NlCt9H1dJAsZq+6hZUqEoqglFgy+cX/F+dkKK2YhqahBgUkj+98KUw4jIxg
	tUt60USb/PQdrlAXmb4w4XJgcUo4eSsauZfWTj2dX+FnMV3l4ZGFQpnA/Cc4FC5ZlGrKEDgRG38ZI
	WyDSpPgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgjC-0000000ByxK-3V4O;
	Wed, 19 Feb 2025 09:50:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgHI-0000000BosB-0aTn;
	Wed, 19 Feb 2025 09:22:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9ACBFA41FF3;
	Wed, 19 Feb 2025 09:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5516C4CED1;
	Wed, 19 Feb 2025 09:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739956919;
	bh=XLFseLySva84RkMFdyMGkSuLizl3GQr59DgJw1I0Qck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RhBToIy3n18eifjQ8iTc7aAq6XW/YJYnEMbp3QI0AdWfLk6QjVxTbkj07QxS4sGty
	 sBPzAkQyK9fPFkRpSfRT8BQm4gmcMgNiR4fwYNm01v6IFpjYV9iuC9JT4znWM3YLSj
	 vgPNH/6yEPfJo2PdnZ/Ti6kfsVbm8q3+HyPaTDYY=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Guenter Roeck <groeck@chromium.org>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 6.1 344/578] drm/rockchip: cdn-dp: Use drm_connector_helper_hpd_irq_event()
Date: Wed, 19 Feb 2025 09:25:48 +0100
Message-ID: <20250219082706.550790662@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250219082652.891560343@linuxfoundation.org>
References: <20250219082652.891560343@linuxfoundation.org>
User-Agent: quilt/0.68
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_012200_311274_F464DD77 
X-CRM114-Status: GOOD (  15.00  )
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

6.1-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 666e1960464140cc4bc9203c203097e70b54c95a upstream.

The code for detecting and updating the connector status in
cdn_dp_pd_event_work() has a number of problems.

- It does not aquire the locks to call the detect helper and update
the connector status. These are struct drm_mode_config.connection_mutex
and struct drm_mode_config.mutex.

- It does not use drm_helper_probe_detect(), which helps with the
details of locking and detection.

- It uses the connector's status field to determine a change to
the connector status. The epoch_counter field is the correct one. The
field signals a change even if the connector status' value did not
change.

Replace the code with a call to drm_connector_helper_hpd_irq_event(),
which fixes all these problems.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 81632df69772 ("drm/rockchip: cdn-dp: do not use drm_helper_hpd_irq_event")
Cc: Chris Zhong <zyw@rock-chips.com>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: <stable@vger.kernel.org> # v4.11+
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20241105133848.480407-1-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c |    9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -948,9 +948,6 @@ static void cdn_dp_pd_event_work(struct
 {
 	struct cdn_dp_device *dp = container_of(work, struct cdn_dp_device,
 						event_work);
-	struct drm_connector *connector = &dp->connector;
-	enum drm_connector_status old_status;
-
 	int ret;
 
 	mutex_lock(&dp->lock);
@@ -1012,11 +1009,7 @@ static void cdn_dp_pd_event_work(struct
 
 out:
 	mutex_unlock(&dp->lock);
-
-	old_status = connector->status;
-	connector->status = connector->funcs->detect(connector, false);
-	if (old_status != connector->status)
-		drm_kms_helper_hotplug_event(dp->drm_dev);
+	drm_connector_helper_hpd_irq_event(&dp->connector);
 }
 
 static int cdn_dp_pd_event(struct notifier_block *nb,



