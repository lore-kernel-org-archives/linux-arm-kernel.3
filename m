Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F20CCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 09:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxQHIUxFiDeJFOm/Va8E2Uq1rUAx9+BBWG6CQEcxEpY=; b=GRH3xjjlVDMHHtaRENH9sg3vGz
	zVNaKpKDb8LkhhmYOi93PZ96vB/hLJMCAIYn8gK/Bi07FC20hEcc3iwfjVfTlb5Tc3Hiy/qlB8eox
	CgeLytUKyT1qwLkHhfFgTu90WGzmop+WlXUFGT883hNQtLeOx+g8I+YSPt+HakntlkzTahKEM/78B
	BVDc3nLWIzNGffTDjoah3pgR020VmQsLstQVIUruw3D3WVqaBo5SSZl658SqAHdwrzzW/dE765JTL
	CIUxiqs93R0HrrI+Tvt5uatmXXZFdShSx1aTiDV/Q289qit7SemfSp3kxmvTAPPF66iqg3Hh/yN71
	P/W//6mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6QCR-00000003Xup-2tDB;
	Wed, 08 Oct 2025 09:11:07 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6QCM-00000003XuS-1tBm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 09:11:06 +0000
Received: by mail-lf1-x142.google.com with SMTP id 2adb3069b0e04-5906665139cso1920776e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 02:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759914660; x=1760519460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxQHIUxFiDeJFOm/Va8E2Uq1rUAx9+BBWG6CQEcxEpY=;
        b=jrdwbinGD3HC87oYtoVVrxxNaoSJ5LtsZVp9gRK53mKt66Q3VeLY+zXI8nkXCX35eQ
         dOZmjLXISDXTOHXZERl9EIWPYo5fWCnKPYzXoOR6TKDXzOGu63ZUnWt7A8cBX9hXudE0
         i8TgIDIzXZVNustD9to4x8PRgRIDi1TgZn1Vgr1HNrRvciVKma/KMo+IpecJBMkHo+l0
         PrTGvCQeyBVfrzqKsrcd/LHNJIfkoKsiFk/CUMR8GhCiLCI56j+4WWXBLe45d592nVi/
         QzxVY89IzUMPU00lsKPfxB8bB7gNhUwzRmfaXug3mwJ01ZRR7kXa3mA87VrT2Cc0/esU
         c6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759914660; x=1760519460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxQHIUxFiDeJFOm/Va8E2Uq1rUAx9+BBWG6CQEcxEpY=;
        b=gD3Ff5QYEUdHdM+Ev8JfTpQTi5tN/iqGNIdM7upZiX7QMV6MMDe+aMWorK5tAPlzt9
         Ozzn97aEhkLb+00A3dVi6fj5hzItEhPBwTeeDIRxMXL21seRfqwqeQohoYHm/cRHjaGe
         km6JzsJcllM0cZZ9Sk9ej1en/YlxO8A4S7ZpsvLo4F/jBj8IuwcmFt13qpjHMxzN25gt
         pofKrPzKMCZEw4+oD+o0HQMnfaYRjsNbbyvMwN5Iv+r4Z3JSugSFP+GKlYLn14798zxQ
         7dF7JgYy8pxTJ8mrCtwecD+Mt8dh++rr0DU2lDGWRTDE3aQxTwfBH6qynv+yJcipnSWU
         VtcA==
X-Forwarded-Encrypted: i=1; AJvYcCVjtETJ/3drv58MVgdCBmZHJJnjT8NHLomyPS0iEhigtc8oAy/FOrDA6GGVfF2Rhdj/YXD+ibjkg+1EiDs+/Dow@lists.infradead.org
X-Gm-Message-State: AOJu0YyHkagKJRp2g88alNBTDd7R4FShil5llupw0JtA9nunuQrvJg5Z
	QonZg7LfnK8Sgykfl2pSn/y9qYcgL9BqUy1cHhnzzx96qjJabnlnrt9Q
X-Gm-Gg: ASbGncsMK2gZ70x/GqP4svKMJk/NZC8XNyEGMfbHnlyZGjqabqDbutGENMgGYe9dVl7
	8gqQhVjPNdSVILZ6XkCteiynJynL7acYfuVq15pVWCiTOFTBQhcg4/RC67had5yUgwGzo0303Ko
	woCe4sKUNm9HguN4+jrN1szkR5mODaHtjUFm40E+QQNXU5+wkfsH0sxu+XZYdc4Ddl0APKYnUg1
	xVRbMdG/0ZcYFgCsqkm6iWsGhVRl7Ou8lEP8LCmrB5DKahqDn0aKdXu28isCb/00meiA11KVbuR
	v3TaTWsSipQqETMLM06+CVQuuz/B9GsCPopdQiaPEdBvICJbFj0Z/XMqeSSARbfGvxFnypDacUL
	qmMVUpSC58h43kDJ0BRmpH6ZhjwojswsUIyBpV12l3ZpLP+3h2k45WvtNGlT/CLvRZy4=
X-Google-Smtp-Source: AGHT+IFFnp5zRiaOqdrWP4/IFuKc5CdpR8oVCCXw/bdrr5L7yHo5ECrtVOBZMd4Ro1bmRiDUe/2GBw==
X-Received: by 2002:a05:6512:3e1d:b0:55f:4bf6:efed with SMTP id 2adb3069b0e04-5906db03742mr681406e87.1.1759914659624;
        Wed, 08 Oct 2025 02:10:59 -0700 (PDT)
Received: from NB-6746.. ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0112462esm7045115e87.3.2025.10.08.02.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 02:10:59 -0700 (PDT)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: cristian.marussi@arm.com
Cc: a.shimko.dev@gmail.com,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sudeep.holla@arm.com
Subject: [PATCH v3] firmware: arm_scmi: Fix premature SCMI_XFER_FLAG_IS_RAW clearing in raw mode
Date: Wed,  8 Oct 2025 12:10:57 +0300
Message-ID: <20251008091057.1969260-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aOVGGaY9NmKqUwPG@pluto>
References: <aOVGGaY9NmKqUwPG@pluto>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_021102_526447_82F9FB12 
X-CRM114-Status: GOOD (  11.56  )
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

The SCMI_XFER_FLAG_IS_RAW flag was being cleared prematurely in
scmi_xfer_raw_put() before transfer completion was properly acknowledged
by the raw message handlers.

Move the SCMI_XFER_FLAG_IS_RAW and SCMI_XFER_FLAG_CHAN_SET flag clearing
from scmi_xfer_raw_put() to __scmi_xfer_put() to ensure flags remain set
throughout the entire raw message processing pipeline until the transfer
returns to the free pool.

Fixes: 3095a3e25d8f ("firmware: arm_scmi: Add xfer helpers to provide raw access")
Suggested-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
Hi Cristian,

Oh, sorry, sure.

Could you please have a look to a new version of commit.

Thank you!

Best regards,
Artem

ChangeLog:
  v1:
    * https://lore.kernel.org/arm-scmi/20250929142856.540590-1-a.shimko.dev@gmail.com/
  v2:
    * Use simpler approach suggested by Cristian Marussi
    * Clear all xfer flags in __scmi_xfer_put() under spinlock protection  
    * Add Fixes tag as requested
    * Drop completion timeout mechanism from v1
  v3:
    * Updated commit description as suggested by Cristian Marussi

 drivers/firmware/arm_scmi/driver.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index bd56a877fdfc..0976bfdbb44b 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -821,6 +821,7 @@ __scmi_xfer_put(struct scmi_xfers_info *minfo, struct scmi_xfer *xfer)
 
 			scmi_dec_count(info->dbg->counters, XFERS_INFLIGHT);
 		}
+		xfer->flags = 0;
 		hlist_add_head(&xfer->node, &minfo->free_xfers);
 	}
 	spin_unlock_irqrestore(&minfo->xfer_lock, flags);
@@ -839,8 +840,6 @@ void scmi_xfer_raw_put(const struct scmi_handle *handle, struct scmi_xfer *xfer)
 {
 	struct scmi_info *info = handle_to_scmi_info(handle);
 
-	xfer->flags &= ~SCMI_XFER_FLAG_IS_RAW;
-	xfer->flags &= ~SCMI_XFER_FLAG_CHAN_SET;
 	return __scmi_xfer_put(&info->tx_minfo, xfer);
 }
 
-- 
2.43.0


