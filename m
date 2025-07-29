Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02C8C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 19:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Se0uhC0vl0Ybn7EgV4hvrXEBF1PwoqDdzFk0COuheJc=; b=rP1bHtUQT7x67+6pgdn/cEeT53
	IUEwp97cjE8rzfn1+9rHXjiJZgxnWRDtmWWW7IBsCm5KgSR73pARrKulB+dMT+9IWByTOsvDmZTWs
	ColxQjSimfdDiBNnLpTa6BzvAYKu7XK54jrP8E/rSozPCf2OsAWbcZlQkTOepKvsXSCI5OB8AjdHN
	23ex15sCL3c/omid6D/F2hf5kv6egb9D+aiB3xtpwfg6SDlD4JOxRqSeRd6atlyyitT77nD79PBn7
	ZzbEAO5R88c5bLbRrZwTp6u4KxGzUUfkmIVcJuz7tgIXxzaksaSJBUF8xqDPY/qLt0ajYPZeqsvJd
	wji50ujQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugpu3-0000000HYAW-3ePh;
	Tue, 29 Jul 2025 19:22:23 +0000
Received: from smtp-82.smtpout.orange.fr ([80.12.242.82] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugpnM-0000000HXgB-0htQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 19:15:31 +0000
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id gpnEuKAvXhl7agpnLuFsIM; Tue, 29 Jul 2025 21:15:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1753816527;
	bh=Se0uhC0vl0Ybn7EgV4hvrXEBF1PwoqDdzFk0COuheJc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=PYuldCYNiaOM9Hi4emoxBXE83nGB2cZRq4w4ZH1B+7L27Rq9fK+C8lgQKB+ZiNwC3
	 12YX6uttYz/Ng07xUTD0oViMvL4lI0tDe64v42MCU2rtQpNedaAhDsWNX3Xt3hZeB/
	 Il6OCags9ImD52owIA2p/H2C3mAi3e7OLKn+TCpptePIVCmbuz3YW1fJx0hoBy/hA7
	 R+jKo7smI3ujcBaJHQbuVYxCeCbyvkZkcOikPnbGv1t2efBCdMxwnzEochzpaN/LAV
	 WPYbtwfFjkUBxuo/zrVHEIdLyk9/GM+jauDgd07BTVrPuBPPSl7gH0QQMjWLiGqCfx
	 ptuPQVw6nbstw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 29 Jul 2025 21:15:27 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] firmware: arm_scmi: Constify struct scmi_transport_ops
Date: Tue, 29 Jul 2025 21:15:04 +0200
Message-ID: <881be6ad61037ed95d5e750a2565fd9840120a08.1753816459.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <2091660c072dd2d5599897243a5d69e89d46ed4d.1753816459.git.christophe.jaillet@wanadoo.fr>
References: <2091660c072dd2d5599897243a5d69e89d46ed4d.1753816459.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_121528_341358_8B1B2F68 
X-CRM114-Status: GOOD (  11.75  )
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

'struct scmi_transport_ops' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increases overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
   6907	    680	     48	   7635	   1dd3	drivers/firmware/arm_scmi/transports/optee.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
   6987	    576	     48	   7611	   1dbb	drivers/firmware/arm_scmi/transports/optee.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/firmware/arm_scmi/transports/optee.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/transports/optee.c b/drivers/firmware/arm_scmi/transports/optee.c
index 3949a877e17d..dc0f46340153 100644
--- a/drivers/firmware/arm_scmi/transports/optee.c
+++ b/drivers/firmware/arm_scmi/transports/optee.c
@@ -498,7 +498,7 @@ static void scmi_optee_mark_txdone(struct scmi_chan_info *cinfo, int ret,
 	mutex_unlock(&channel->mu);
 }
 
-static struct scmi_transport_ops scmi_optee_ops = {
+static const struct scmi_transport_ops scmi_optee_ops = {
 	.chan_available = scmi_optee_chan_available,
 	.chan_setup = scmi_optee_chan_setup,
 	.chan_free = scmi_optee_chan_free,
-- 
2.50.1


