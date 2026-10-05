Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853C8CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 13:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rl1OZheCBCPMjKUjI2TjxKZoMfCFhn7MxZPI1BYjjA4=; b=NwOxuqT/68klqGpp3m/1sceXoq
	71gUSfpplrMd0S+H/2DtlewSQkpN2GbyCD5K1MyRFuKGSvx44bKN0i1L6JEFznM2M8R/6RnxjISLi
	KhzT+CfV0sn18BtpXxMxtvuTwj5169GyozOt5xn58viC3mA6S9FfcBXTvNXn5dt3qkT+vjCFbFtSW
	uui4jgIpDchP6p6t+kSfkx0vv6+mOgfzwd1LTDTlhizYiQkegjv6Tr+z1HwQocrTj1Y0rdjKrQI1o
	5m6deVu03qTUbWLUxopF4TACSwsaIBU0EycuY+44DseDG5oldOwew0nQogyZvTOtHLo6OaO8P9T3f
	cJFRbsjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDiKT-0000000GRYi-0iaa;
	Mon, 05 Oct 2026 13:02:05 +0000
Received: from mail-wm2-x09.google.com ([2a00:1450:4864:31::9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDiKN-0000000GRXj-2bwz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 13:02:01 +0000
Received: by mail-wm2-x09.google.com with SMTP id 5b1f17b1804b1-49e7361175bso1166645e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 06:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791205316; x=1791810116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rl1OZheCBCPMjKUjI2TjxKZoMfCFhn7MxZPI1BYjjA4=;
        b=UtHzVdRcZRhkKhcKhYMZg9SGm1+U/jVuGG+bh6EqtqQsrMqMudZTJbARSPrd8YJ1yY
         KLiltdjFodB/cTGeH36cAcGBF+smuKE5DALaVRkTLH8ujE0u2FKRAwyFJ/5nZRf/hUCV
         64TDT3tSI5xfMyJDmkw+QteQYGLLGcggmEUkkeIAA/oIW4d+3Bc2RswY3LyZ8KHRc+SH
         VZrUaSLxPP4N4wasUdMjZI2o+8Xvdoy5904hQHRfgBwXKUBy+lhwKdak/bSuKhoe+S3m
         wOGHtkti9jzoQrWXO4sCnmpFRqXt0WPMhhbzsBIztVLMutPLoMayCKCF+hZOlaFyd0xH
         LpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791205316; x=1791810116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rl1OZheCBCPMjKUjI2TjxKZoMfCFhn7MxZPI1BYjjA4=;
        b=2JQ4OHM9qGw4tI/RnVCTAYTfAghWVe1r6dvBFkx5KbEbf5IEe7fz65DBwKc0p/Ga/V
         2H5j+tpVhPQdBb55TwpkevoGckfpEAn7d5+ZHzWE8mADJmhtx7ukUE7K/NuE2Ee5DgHs
         5iBTSpDGLfFJ43xttW638NtRN12zEzE/HQDvl1MMJ6cuvO5YIJdAwpQblq0IzbTSWvYo
         Z/lTYyWQ9UapcZzUp79UJlCGVETas8GlB3b8Au+j0FxzrBSO2UUOntzuVpqzI0q+kGO8
         64jBCkby+z+tButnHnWphUifFLEkrRM4E2JtP2rKlFBIW/OkzFaAaraKP4NIu5tvvHrJ
         z/Tg==
X-Forwarded-Encrypted: i=1; AKwUvByElOvAR2OB8cQ06RaExGt09In6M2VnfCnJuXU9Ly0BrMot4HSUwreqUTBHRCGOwwai4ncIt1N4y0j56zuthvYi@lists.infradead.org
X-Gm-Message-State: AFuF++mymL/5tMmsqfvReCAZpIzcTEoWcAuYj1fyx261bf4UrhV/0KQi
	c9yzJHUk952lepG3TrIZDrDsgGxe6yoD07SZeAfqD0O1Edsz+wyxRJUA
X-Gm-Gg: AYBFou3DUldeikb+/VFp5LI4zbtGmEIK3DL2tYU1wTO153WubtQM7Bq0P9J8wjjR6S2
	BZ9xZFGUc9M8niVbFHFxv7iLRQoUBYNcwKO9asyC1HNYGLCOCK2SFak2KgdApb3IxzrNEp9Qa8/
	rqYfJijFfI20NqLuUE5m77mK0+by+l7SgLxwdJzk4d2ekPux+QSs8FXlaOX+mdHAwFfBBNShPWs
	K15p7L0qzON1Uk9nsSDls5mZdl/9tCt/y7ehggVMKDUMv2fzikovmx4xrfBK7+sxm+Z6Eq6KUZp
	GfLc3m5p9vh5p5YP6TkdGVqBUCERb7T6IV26MY71K05g+a6SfyNfVJe7K57ZghcPT+OWlbOR4rK
	rUZMhoNzgabE8kgL5Ud9xM3UV7GHEYqulp4Pn7TnFX5r5DY8vdxYtMCLfgNBkecJL9Y6KuMGd1B
	Fyryg6Da5Cgr7wiwWe2ANO44ZQYiyXO+qlTFfQZZ5s/2Dy0oRLOTTWq88hrws7eT1G04R2OKYyt
	VjGibH1+DLAiqLU
X-Received: by 2002:a05:600c:870f:b0:49f:fc4f:9efb with SMTP id 5b1f17b1804b1-4a02753fd01mr186622465e9.7.1791205316083;
        Mon, 05 Oct 2026 06:01:56 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03950375dsm137485215e9.1.2026.10.05.06.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 06:01:55 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.10] staging: vchiq_arm: Avoid NULL ptr deref in vchiq_dump_platform_instances
Date: Mon,  5 Oct 2026 16:01:41 +0300
Message-ID: <20261005130143.138638-1-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_060159_678080_DC201029 
X-CRM114-Status: GOOD (  10.22  )
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

From: Stefan Wahren <stefan.wahren@i2se.com>

commit aa899e686d442c63d50f4d369cc02dbbf0941cb0 upstream.

vchiq_get_state() can return a NULL pointer. So handle this cases and
avoid a NULL pointer derefence in vchiq_dump_platform_instances.

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Link: https://lore.kernel.org/r/1642968143-19281-17-git-send-email-stefan.wahren@i2se.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
Backport fix for CVE-2022-49106

 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 178cf90fb3e5..adde80b56073 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -2063,6 +2063,9 @@ int vchiq_dump_platform_instances(void *dump_context)
 	int len;
 	int i;
 
+	if (!state)
+		return -ENOTCONN;
+
 	/* There is no list of instances, so instead scan all services,
 		marking those that have been dumped. */
 
-- 
2.53.0


