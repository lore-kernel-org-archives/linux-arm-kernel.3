Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4E2CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 06:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bqjUL/F3PkV7mQ5AZkxkB+XxR2b2VNgyAxYreLVSeSA=; b=O68uFtAsxWLCcQXgUnLTX8Ni83
	riEA5rNzGtfn4rTsbQZDVzpdml0l7Uftz5JmTLmR4SCo6LMN9XINOJOjad0G/p54kNADLhnIgHQLH
	LoLki+glWAn77UMvLL1dqCzKAPusab82g+RVwwPSQfKI/O8tjOTb0ocpzTlAJEUU6jVxNUTGU5s4F
	cf9NZ1twsYxP5xjsDAsmG77W2Et4p7NzU6g8woc47wbGKSbL0utdW+aJQ6K4O95LE4kXDaoxIPScE
	Dnk1jMHsOElFMcmkBcAgKTk1p/EZND+4d3rtz4mQ/tGrfiT2aUMUDMr06d68HFfljP2vivenKBKpk
	RtvZlRXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDi2-00000000I1v-1K4I;
	Tue, 19 May 2026 06:13:42 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDi0-00000000I1H-029D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 06:13:41 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso38116575e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 23:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779171218; x=1779776018; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bqjUL/F3PkV7mQ5AZkxkB+XxR2b2VNgyAxYreLVSeSA=;
        b=skOLHh3fDJgW+uAkMSKjEOQAheex1exxllmW1HbS5rZx43Ym1gjF/jtX/JcnItqIHu
         q/SQq1emGs+N1i5RXaEA4TkDC1/vS61Bxb/MnWRtTv0iVxuCU+TCZURyTNlineu9mWfJ
         J5WCRyyKU9VkvpyZX8u6vQ+YTM+TwyYXg+yb4XkGxn1GyJE5mVarX9hqPMtGMxjWIuT4
         nrdEzC3pWqLCjqmz+sL0f7LC96amk9gen+XMFra0uiUseeJ95ztvcVmGn7cfoHDN25MI
         NiULEqYqDf7jQEpbE51L/C6SNahlZ9yJgKUBWRlPIB8STDA5OfCtQMmf/6astPFnqbbA
         ex6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779171218; x=1779776018;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bqjUL/F3PkV7mQ5AZkxkB+XxR2b2VNgyAxYreLVSeSA=;
        b=geNr25/P4ybEmi1G2a5vpHIfAKEdwPjM/YPpoGun49DHxpuu48Aw7bPGUCjhiVZixa
         yeXKOKJ+Ew8iZfIaXJH1i8PsLhEnGJNpkF92+GrE99WY8TUz+GCHoI24rnvhRCWbGwTt
         Puu+GWuY9Oq5S3IG2dVPs0hgmQkbPw4Sc+Pt7MW+OYh2aT+uxykv53pi9I4XSn04FIkp
         bs+flFk/3UyF6Vug5oQLwaapYZ+OW8T/ngdbwzythtkerAzLaN8J0qrvEfoJc+9D2xFZ
         1x4+oLrMYsLSsjFTzJ+i5bR+uRNkj0GxyhJFpH61XQandMIXX6jenabzYmZcpTAN2y0e
         AuVw==
X-Forwarded-Encrypted: i=1; AFNElJ9N44baCd6I1Nu/RMVEZEW16hCLmPrSmVujdVIwpI6scVUwIXk8Wg6FFbad8E31mjBdNK2iv3W3MRTK93Lam99v@lists.infradead.org
X-Gm-Message-State: AOJu0YzjuWIrCYzQtBxT8xRFlZlGkZKpF6MIoh20a8mjrq2jPVBZAqjk
	TRzqFIlMlHlQ6yZoY5z3FVHpKsVO1Nf0i7QPPVZZpDGK2PDpp/c1q14F
X-Gm-Gg: Acq92OH/nXStG1nqWfuAwPK8Ngp1b55cxlMASB5gp6atjAowuKVSzhd7W+E/P2pmJR6
	p6nakgmWQMD7T3B9pAn4PLQmwppaizPnd8wrpJoWBPJnqWgTVMscc9KECSk1i0B2wvFDv3W0rWU
	NNlIZ2Ir/2Fja3RWdrPlpKnwmA5TdVaHyaHxXlWQ+madb/afJ6XncXmik5lAv9phwPezXoRHuoy
	KxV7ywDukMIrxu2hz9Uw5F+CEmvNYkyUX4qvs83D/C2/yCTuLOLWet0TLpy5fwLEMZ4tKRxtjUv
	r03gs3ln4z/JsoE5AHV15v8+FbzE3muZJd4HpqfiCP5EzHPJi3wSjZmhTqWDsLPofzvOcB14oga
	bRmYzNvnGku3M37fJ/Gl9nGJOpprxaj5Aoa8OHdolb3PW/eCebLbWVFYYdrtHeNLnzC7sGtWv63
	Z3vdoKkHCslxpbY4BCCnc=
X-Received: by 2002:a05:6000:4021:b0:453:e3a1:6580 with SMTP id ffacd0b85a97d-45e5c5fd95dmr30269534f8f.25.1779171217859;
        Mon, 18 May 2026 23:13:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768acesm45974707f8f.7.2026.05.18.23.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 23:13:37 -0700 (PDT)
Date: Tue, 19 May 2026 09:13:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] firmware: imx: fix use after free in
 init_device_context()
Message-ID: <agv_jhP-2CNTfQXk@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_231340_055697_6994A328 
X-CRM114-Status: GOOD (  12.48  )
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

Add a missing return statement on the error path.  Otherwise we have a
use after free when it dereferences "dev_ctx" on the next line.

Fixes: 63536a73a3bb ("firmware: drivers: imx: adds miscdev")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
This was in the original fix but I guess there was a merge problem.
https://lore.kernel.org/all/20260514090457.2186933-1-pankaj.gupta@nxp.com/

 drivers/firmware/imx/se_ctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 9327d47e4312..010af8221dfe 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -486,6 +486,7 @@ static int init_device_context(struct se_if_priv *priv, int ch_id,
 		kfree(dev_ctx->devname);
 		kfree(dev_ctx);
 		*new_dev_ctx = NULL;
+		return ret;
 	}
 
 	list_add_tail(&dev_ctx->link, &priv->dev_ctx_list);
-- 
2.53.0


