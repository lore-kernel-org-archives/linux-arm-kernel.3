Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A546C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 11:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mrmu7Ax8Tjv7DXY7cz3wQn6QU0gYid8cSWvbdHALi/M=; b=g8ClKpa4gGXwN16Z1Y8NSfzaLY
	h9z/E3/JaHifoLTooLsTrLpddHlA1134M4L2eDT4hYi/WeRKwxCZ2Uvgd8fXUGmIQWQBDpCBZ1L4h
	XbO9FFzh5pNEJGxCHgKNnoHidWQ83k1aNXozIg2ZwZRDzzIqTMKUgQsAZtAzWpGlJh6Egz6Nocv5r
	/6dRK8LNyC0M7GMKln82hqmhuj7qEutEUz8bi/D7WTDzqczdQ1x8O9QL9ORkmfIsLq0SdCrzmPukC
	yl5DHzP6w/pe6m1L38W+Ej4XHPq5AD4BlBfUWtvMbi7MSmtthzlQjDJNJ3iUktdLFigbSJDh1YYD4
	9j15o33A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wisoc-00000007QY3-1gHn;
	Sun, 12 Jul 2026 11:57:46 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wisoa-00000007QXh-2yKu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 11:57:45 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38101f85591so2409117a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 04:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783857463; x=1784462263; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mrmu7Ax8Tjv7DXY7cz3wQn6QU0gYid8cSWvbdHALi/M=;
        b=X5Tt+H9YUCSU1dTFCi5IgC0qCU0At+9UT7RFbxI9vI4Fs+hgHtZckK+zBQ9YrUFRuL
         2ouOTb2IbJ2C+Dms2qOE0y0aVnuReYegprerV+WW/Oaf/XZwhkcBBKBcmfgThC7Jyho2
         dC9IwMFOXaOW4Ut9EG+7SOL9zbqnpb+upcnCDrTZHelMmfPXqqXuH45PYPeZCwWuTpfc
         uX8rWkNee08K+LaBflNeSYGkYeoaxfVMf+tevaImTLkmIV5iBNhneHCDHw4Vw5YsNgSd
         s51LaH1x/pFclI07CGKzVLtAea1BIApGWKQYwWTQ+5wywr/mVqRL1miguWB97xjmW8ZS
         Mw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783857463; x=1784462263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mrmu7Ax8Tjv7DXY7cz3wQn6QU0gYid8cSWvbdHALi/M=;
        b=FhQao2qIIsJiSAPAptCJb3WB451ATAqfb4pISynjPbXHubN/0yIyBiWepEMXlUM1FC
         CX24ovlJ0BsRMwGk54avy80VihCRmjXw/3eyihIDJDTArbBOxLOW28HDH3ULHMrSYidi
         RQt2Y3UPWjfFMIKDnTBgquR2t87TnrMQPR2tB49Wki3HSoWWUbvSUAn9fi3dgpDJk0mM
         XqeO5k+78EIC36B1tP1FnItmGavohVCd8cfOPP8vHRV2mVFAsbpcwIBGXVdHxsZNzTex
         /7IGzuJNJhtT7yz40tOMy/1dX6XnNp17zttStFBKlHSfiVFsrx3dHpWomrRJ65u1Spfo
         pUBQ==
X-Gm-Message-State: AOJu0YwQ9ioMHbkNsPi8193o5mZgh2lYR6ajAVDqp+o64IyMGe+gcYDO
	Qj0E/vyN2PRcM8pIKY+GLCrfEIByCAsH4eCh8fXYFYtBAo651hbNHR9t
X-Gm-Gg: AfdE7ckzU1JGsWRtg3KBNXzUHCRnMcbw7v2zTLs+hD2IeRJQlu2HG+TJ+NhuRcqS0BA
	54gq5udMNaMPO2ZVp7SwVwEHjscwObLmmzSlg/jzQWDTmDm5X2vl8BxKYeTMU2tUf6Xz4YmZ7lN
	B7wAaDoI93yItl1rKfpFE/XeMQaIZB3i/6ZbC5u0s7IsB2zD4OCMcojXBmD4Fqlmp7WjolToL4E
	4Sg21gkb5vTGeFYibzjmNvvYnA7BeTkgfvFgMW0ZxlxcWbV9lAEn7e2KYKMe8/BShvkxXv8d2p6
	FzhucJYp3oo+u2bfy6Iaag0/dZ2qtERQucNcwIeVDnngVSGWwvrPs9MJvc688uXWuCtf7JawG7W
	k2Ue5CZkuYfzrI9NMIeShx9RPLtl/kfU/d9dA+OwfKaz/WCVKWQ4SxV74/2TFpGCnNlllfqKDb+
	UrsZsRvHwR5DOSudHYnZ3T25FtAlKn/Ex4+5x9he0BkA6fjzmY38CT+gSnaKN47w/S
X-Received: by 2002:a17:90b:4f81:b0:38d:e397:9053 with SMTP id 98e67ed59e1d1-38de39790c8mr1551196a91.19.1783857457791;
        Sun, 12 Jul 2026 04:57:37 -0700 (PDT)
Received: from nuvole ([2408:8456:3a01:5d1c:f8f6:b057:1d4c:1d59])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a57dc5820sm4833781a91.10.2026.07.12.04.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 04:57:37 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: mitltlatltl@gmail.com,
	Frank.Li@nxp.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	festevam@gmail.com,
	hverkuil@kernel.org,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	krzk+dt@kernel.org,
	martink@posteo.de,
	mchehab@kernel.org,
	robh@kernel.org,
	s.hauer@pengutronix.de,
	sakari.ailus@linux.intel.com,
	sebastian.krzyszkowiak@puri.sm
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v5 1/5] media: hi846: Fix hi846_write_reg_16 handling
Date: Sun, 12 Jul 2026 19:55:53 +0800
Message-ID: <20260712115553.92564-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260712115012.91600-1-mitltlatltl@gmail.com>
References: <20260712115012.91600-1-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_045744_779510_55C80E4B 
X-CRM114-Status: GOOD (  13.19  )
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

hi846_write_reg_16() does not clear a positive *err value on success.
pm_runtime_get_if_in_use() returns a positive value when the device
is already in use. When hi846_set_ctrl() passes &ret holding this
positive value) to hi846_write_reg_16(), the function returns with ret
as is, the positive value propagates back as a return code, which
callers interpret as an error.

Fix this by resetting *err to 0 only when it is positive.

Fixes: 04fc06f6dc15 ("media: hi846: fix usage of pm_runtime_get_if_in_use()")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/media/i2c/hi846.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index a3f77b8434ca..7f069aca0fce 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1271,6 +1271,8 @@ static void hi846_write_reg_16(struct hi846 *hi846, u16 reg, u16 val, int *err)
 	if (*err < 0)
 		return;
 
+	*err = 0;
+
 	put_unaligned_be16(reg, buf);
 	put_unaligned_be16(val, buf + 2);
 	ret = i2c_master_send(client, buf, sizeof(buf));
-- 
2.54.0


