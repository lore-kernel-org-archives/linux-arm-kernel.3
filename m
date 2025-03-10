Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA902C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 18:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W0aLyV7rWhUdcMx0FNuTiibWXXFzUmAjLAmCDZEblCE=; b=LBCyRNEw0fBElNGRzPnAqRQII9
	PfFy0keNdl8cCOsRyrWMDVeDOZJbQZ1JHDmDORveHIECxH/xnSeMbJyCMfDAQln/S2SMtxaHu7M3h
	5ikWFBMaCCA+CZkl1k98f4dYsSoG5GTvxmbDSno/acQiLTPL42DWPzyrBo0Qfg3wQJIgEc7QEyN0P
	y5x6rQn59qoK3Jhvg4IgFvC25dfYJ3UuahOKWCCmSHdhg2T0fqdk1AKu6IOkUmooA90i14tHlboc+
	SrOQHugB5tdkrW33StKhS4JX5g8tmKsdasaM2NceIpFvyuIb+HmmNXskh7wDcBSXFkHP7telgw5ol
	lUKL+lVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trhQ6-00000003YKE-0dey;
	Mon, 10 Mar 2025 18:00:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trhOG-00000003Y79-1UHd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 17:58:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCD851516;
	Mon, 10 Mar 2025 10:58:20 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3DA83F673;
	Mon, 10 Mar 2025 10:58:07 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	dan.carpenter@linaro.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Huangjie <huangjie1663@phytium.com.cn>,
	stable@vger.kernel.org
Subject: [PATCH] firmware: arm_scmi: Fix timeout checks on polling path
Date: Mon, 10 Mar 2025 17:58:00 +0000
Message-ID: <20250310175800.1444293-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_105812_434934_CECACE1B 
X-CRM114-Status: GOOD (  12.46  )
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

Polling mode transactions wait for a reply busy-looping without holding a
spinlock, but currently the timeout checks are based only on elapsed time:
as a result we could hit a false positive whenever our busy-looping thread
is pre-empted and scheduled out for a time greater than the polling
timeout.

Change the checks at the end of the busy-loop to make sure that the polling
wasn't indeed successful or an out-of-order reply caused the polling to be
forcibly terminated.

Fixes: 31d2f803c19c ("firmware: arm_scmi: Add sync_cmds_completed_on_ret transport flag")
Reported-by: Huangjie <huangjie1663@phytium.com.cn>
Closes: https://lore.kernel.org/arm-scmi/20250123083323.2363749-1-jackhuang021@gmail.com/
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Cc: <stable@vger.kernel.org> # 5.18.x
---
This fix got to be backported to 5.4/5.10./5.15 due to small changes in the
context
---
 drivers/firmware/arm_scmi/driver.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 60050da54bf2..e6cf83950875 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1248,7 +1248,8 @@ static void xfer_put(const struct scmi_protocol_handle *ph,
 }
 
 static bool scmi_xfer_done_no_timeout(struct scmi_chan_info *cinfo,
-				      struct scmi_xfer *xfer, ktime_t stop)
+				      struct scmi_xfer *xfer, ktime_t stop,
+				      bool *ooo)
 {
 	struct scmi_info *info = handle_to_scmi_info(cinfo->handle);
 
@@ -1257,7 +1258,7 @@ static bool scmi_xfer_done_no_timeout(struct scmi_chan_info *cinfo,
 	 * in case of out-of-order receptions of delayed responses
 	 */
 	return info->desc->ops->poll_done(cinfo, xfer) ||
-	       try_wait_for_completion(&xfer->done) ||
+	       (*ooo = try_wait_for_completion(&xfer->done)) ||
 	       ktime_after(ktime_get(), stop);
 }
 
@@ -1274,15 +1275,17 @@ static int scmi_wait_for_reply(struct device *dev, const struct scmi_desc *desc,
 		 * itself to support synchronous commands replies.
 		 */
 		if (!desc->sync_cmds_completed_on_ret) {
+			bool ooo = false;
+
 			/*
 			 * Poll on xfer using transport provided .poll_done();
 			 * assumes no completion interrupt was available.
 			 */
 			ktime_t stop = ktime_add_ms(ktime_get(), timeout_ms);
 
-			spin_until_cond(scmi_xfer_done_no_timeout(cinfo,
-								  xfer, stop));
-			if (ktime_after(ktime_get(), stop)) {
+			spin_until_cond(scmi_xfer_done_no_timeout(cinfo, xfer,
+								  stop, &ooo));
+			if (!ooo && !info->desc->ops->poll_done(cinfo, xfer)) {
 				dev_err(dev,
 					"timed out in resp(caller: %pS) - polling\n",
 					(void *)_RET_IP_);
-- 
2.47.0


