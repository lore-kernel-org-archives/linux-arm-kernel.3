Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E09C531CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 18:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wDObpA7RQnlY6KsOhvuFRPLttcc0bMB5PHs3ILqM3SU=; b=TWMSpkttHx3Kq4lPIHIfmSCUyB
	O+UZZmI2z8af7kBjVOquYtLGg/wayKlwflTq9jTBWjNF67fe3d6FFthEWUZzmOdIj1TPnLKdq8G59
	zrrV4o+qdRbsoCExQa9NdCd5fRnARBAnEdAhgl3RzyBU7QtqXhcFCtqbY3j3YWVyNeACKjRZeV3bP
	RL98CbJIspFlQCejUSN8wiY/om7y4QcWIOOkcG3Q3Ht+J9DDw2VO+eqGf0p7lo2p2Sxq14ASz6b85
	t1+jDCPm7bslW+Q1A0su8c2FiDK5sKrk/FKj0ZPhdJyYMCc7PyPt+gHkCVQ7lHxIwSNvv5B8MF1tF
	6c+FPyOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmyRf-0000000EufJ-3mmW;
	Thu, 23 Jul 2026 18:46:59 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmyRX-0000000Eud5-3AyW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 18:46:52 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-38dcbade417so1041739a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 11:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784832411; x=1785437211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wDObpA7RQnlY6KsOhvuFRPLttcc0bMB5PHs3ILqM3SU=;
        b=Y+iQr+uo8va2Okanp4DDtuPnvmC8fuiUKjF/W5xUioG7FWvdbtT5K00C/zCt+dezp7
         j/9ip3Yh557B52fdBKhedN/fyPleM00gE0aj+1IuxGeLcnyp3qCWVk+DJtRDGkDW6wMI
         OtWoxSUfnBOqXk95jR9Nd9rMCN3L/WfXBEAOgsl2+ByB5UzEwMj67Cl7YlrZEeEa5Jq2
         KzLa7th+bvB0tjOEK6e1932RhvNsIkz/qrfnGk8Vqg0h9moro7k6I363c25TP1WM5XoU
         ru3o32pe7dp9UHgQnTa3jRxePUs6YjeINUBDO2SopFTVAJ/hP0ksA5ys76sntfDd5kDA
         +UfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784832411; x=1785437211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wDObpA7RQnlY6KsOhvuFRPLttcc0bMB5PHs3ILqM3SU=;
        b=C5U8lmwsCGnY/F7QoOhuz0LDtG+SyroRQM3RQOAyeSBU8uezJD/jt35cOrclIrtMSz
         exIlFPyb7YxQ3/V/bSAC/kQG6py8eNe8WJBAML0RN0decsH/e5VHw/13jYpuuQlW0V/o
         AV80Wz1PxJd82Umo7lcvy2VdS16PudRMTs/F55Nmn9DjtuTZAAq9a/jP1FJArGAsli06
         x8UvsJg2bp2Jn3Z4+vOfRTId6YrQyqlC66Obgt9k/L2FVG54lCpTQX9nVu25QqwQp7rm
         MDS44gj73XY3yh6OZjepqCkNmS0vNmtVsmLn425qnTHvmKoJ4BDeyqBfcwHlxdkXnkIX
         6G/g==
X-Forwarded-Encrypted: i=1; AHgh+RrxJKw2ELuQypUHmDuZDoLXP8jEsGWcgIq6sQrn2eSiiCxOkalv/ijrubHB9DYD3VMFnd2g2jcZ2VpUm/jn+VeY@lists.infradead.org
X-Gm-Message-State: AOJu0YynbWh1li7LAbpcSn6Bc63zg1idAYTYlTrjUoY7sQW+kYPGkTuA
	e3mPJV8fJWe/WStkntxA1I27yABo5hZB6+MbaC+mA/YnmoF8BZL21nBY
X-Gm-Gg: AR+sD121UsIj+/wLaWNiaZ+IcQxu6DGJ7PQncPE3y3lblHw+CoasbgoRmH3ubPYEGgp
	ZHuJYiXw4QPgIwedCFeJNWXaM7mla92p03LBtPJ3OFoY7TU8Nmo3ALeRsysqAfFwJyy9pjgQFV7
	JG8InNkvGVJCPVJvnb1qdwS0I8EknzfMnv+f+OvwEtEod1asZ7GT3kMF0zeeEDDrddeQL4wgxGs
	X9lxde/RSu1ZYg9oRMWaqKH3mayjqp7LWVQyCwGL0TgQ+/EEBJoLu5pISmXpzjCV80HTJ85oTi/
	+ZKoVsmcF3vfi0b1OlDnR6Z7iJEkAfGPZdyHljYwJiaQBc3hJVRXmpBetHD6Kqm4OyuFEYekckD
	BOp5aKER9Iw7bp4TR0UwRGS5MrGlDcEF58p8GwuLQsaVIh0ohBkpMOzMtSfTqA0oJ6hr7c/UVzW
	apZNuw4iY=
X-Received: by 2002:a17:90b:1cc7:b0:381:f7a:2e0d with SMTP id 98e67ed59e1d1-38ec66379c9mr3820244a91.33.1784832410845;
        Thu, 23 Jul 2026 11:46:50 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03af8a45sm308155a91.10.2026.07.23.11.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:46:50 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Julia.Lawall@inria.fr,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: cocci@inria.fr,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 20/36] stm class: remove conditional return with no effect
Date: Fri, 24 Jul 2026 03:45:22 +0900
Message-ID: <20260723184538.3888637-21-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723184538.3888637-1-ekffu200098@gmail.com>
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_114651_863104_867B34CF 
X-CRM114-Status: GOOD (  12.29  )
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

Both branches of the check return the same value, so the check has
no effect. Remove it and return the value directly.

This is the result of running the Coccinelle script from
scripts/coccinelle/misc/cond_return_no_effect.cocci.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/hwtracing/stm/core.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
index f48c6a8a0654..edf3d69a84a9 100644
--- a/drivers/hwtracing/stm/core.c
+++ b/drivers/hwtracing/stm/core.c
@@ -602,17 +602,11 @@ static ssize_t notrace
 stm_write(struct stm_device *stm, struct stm_output *output,
 	  unsigned int chan, const char *buf, size_t count, struct stm_source_data *source)
 {
-	int err;
-
 	/* stm->pdrv is serialized against policy_mutex */
 	if (!stm->pdrv)
 		return -ENODEV;
 
-	err = stm->pdrv->write(stm->data, output, chan, buf, count, source);
-	if (err < 0)
-		return err;
-
-	return err;
+	return stm->pdrv->write(stm->data, output, chan, buf, count, source);
 }
 
 static ssize_t stm_char_write(struct file *file, const char __user *buf,
-- 
2.43.0


