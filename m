Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA87C98311
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 16:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7BzNuazOcXSzuWsG/mzzOpckUomlPcZX4HNgS2NA/iA=; b=LeKSDKk2mKjxigE/TTr6MSTj+d
	+cYs7SPl/AJDcRApgMVSkywJDkBX7HOd+AqPdpvTegCGHb4bNxPU1ybBPjuViz4Xo245p9BjB1xIE
	5zlO20zVyoeIFIX9rfhTXH7fsQtEtWbqt5Gu+XztkcH+sjD8YC91UtkKzGx3UcfSiUMkaaodlDvZj
	z3c3SaC89b82P+Yzz3MFbqpeqfEC0+iGEBqE6b4asdPhzviZDgTmIl2Pt7AAVYrhAS+MEULOTDpj+
	Wmpt1zCsoXa/3M8wqsm0IHcnobcPyaU9kO36iujwhXf8F0pnixlEeEkousI3lYbmB/r27KvIa2zUU
	ikI6FpWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Q2P-00000008u1z-31iA;
	Wed, 23 Sep 2026 16:41:43 +0000
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Q2B-00000008twi-06lv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 16:41:29 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-91219376dd6so9688396d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 09:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790181686; x=1790786486; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7BzNuazOcXSzuWsG/mzzOpckUomlPcZX4HNgS2NA/iA=;
        b=D+lfAyc/rA8MW0Agz9zM52ZxngOKrgnVoWQbyHTFcgovagRFk7/l1Bu6HPZM3ZZiEg
         TynOdHJf0N1OUxZb8CbhuVQAD6X0MkA6edM6Axeu/qGyYgGtSBdpngvH8rLwLrLoWG5r
         kpUYYVD2OKm0ZXCw7QXgA3rkARunxrCPyKe+fsNykPWR+qbRvhYRqZ7dbkM5sm84BU9n
         YnjAeAiPNJYqdi7KX88bny9RO4Q+93ZSohMhfa/cwjCMEBrj2cjHf0cDEmrRSzzvk0uS
         oeL354QgzgQ1X8nbZu/c32vLl6G+dn9oP5HDUc2bKNZpWEgTNsk4r/rK9deh9SDgg1OG
         cJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181686; x=1790786486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7BzNuazOcXSzuWsG/mzzOpckUomlPcZX4HNgS2NA/iA=;
        b=N34gAcP6Tk3RlEy13dnqot316iTjKNIkYXBrVwnaxiASU0eD1ptFPMIe4yJhHhgiJT
         Z4kSIGplVGSMu9LhmVtaXw3/zN4NdEd4z4A/qjCwx0JGdZ3j8CAk2vFqPTvxrgMQW+Bb
         K6wYyef19XVQix0q5Vhy0LFgYmPTlimephMPSHlaX2LV49eDblLiPa+7AKgNjjRo6yDr
         RqPMGY7yEdUE43ModPzOGWwxVmF731R5vmPhytLPIkWGBVg9l4DdkPiUr0EsOS9WMqKX
         ip+WMeR7MBs03OIFLz8D5Lg4WUOX7x+YUk8wHRCIgDI1tqPDT/C1SQ8l5Bdsl32zm7YQ
         HfIw==
X-Forwarded-Encrypted: i=1; AKwUvBwNF/GDVeCjvXREYcYPlspWf+J/sLvdVZDmhkeS1Jgvf+5w8zYASolNTP2xz9KZb0YCOykvm2wKDFYaA7MEn86N@lists.infradead.org
X-Gm-Message-State: AFuF++kJIggZopm3XCJGU6jYW0qTs3ftbjZtQx7xN3EqC9NW9ahPJo2k
	1D/r2cMxPzxzd+x+cx9u5zjNKAflfMjfcjgPafbnZ0fu0h6IPiuoPO5Z
X-Gm-Gg: AYBFou2TdkxlX6N6dIwpEFLkwL4kXagYEyfKXmuMfzsv94NeXhAzBZUVE5V7RbwQLol
	YTari8qO4yg2C75E6OcxlOVippm6iUd6XF6MvL0zsooeDU/IEOCtCYWP+x4NdplBT95vsMbmALY
	UQ/SH9MtndCKTTOrwReFfcw7J0SB8HaGP55RibNIKDTIqJ9LyAxe3HlefW8vlGhnzWrVsTSFVT8
	GuQX/TuzPrBUhFRJ7TXCQW8awNsOvOkWYSzs4LC2wQ2DYWRyxh0cu+7NKWFfhvRZVg7D0HmudYo
	ScH/do2j+73KTBWGPH1068pKoxummravuNptzIyO0ZinQry7S3va17K/NOrIr5z7YYEJRj3QWGy
	5G3I5bl7fp1pU2jH6PLGlZXGZddv7m8+PB4+vLasWV6BeNocjDwitLrrg+ru1XAxiIgMr7lysTM
	SSaHmhqh8Rwp+N5PtlvPw79JDSr6eSOKjNGz5UzkK13vq3+wSF+0PNaEz6UkL1yeyNwVMbyHSMZ
	cV6ylS7GUzQrG0LIEYfyV+SzkSrlXkh
X-Received: by 2002:a05:620a:1994:b0:937:27fb:96f8 with SMTP id af79cd13be357-93c251e0964mr496039185a.41.1790181685674;
        Wed, 23 Sep 2026 09:41:25 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c248e22f7sm258625685a.47.2026.09.23.09.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:41:25 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Nicolas Pitre <nico@fluxnic.net>,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] bus: arm-cci: Drop cci-control-port node reference in __cci_ace_get_port()
Date: Wed, 23 Sep 2026 12:40:55 -0400
Message-ID: <20260923164122.596910-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_094127_254718_61DFEF57 
X-CRM114-Status: GOOD (  13.64  )
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

__cci_ace_get_port() looks up the device's "cci-control-port" node with
of_parse_phandle(), which returns the node with its reference count
raised, and only compares the pointer against the probed ports.  Neither
the match nor the no-match return releases it.

Drop the reference on both paths once the comparison is done.

Fixes: ed69bdd8fd9b ("drivers: bus: add ARM CCI support")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Found by code review; compile-tested only (multi_v7_defconfig, W=1).

 drivers/bus/arm-cci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
index 7f2baf0571286..223b1fe19ba06 100644
--- a/drivers/bus/arm-cci.c
+++ b/drivers/bus/arm-cci.c
@@ -167,9 +167,12 @@ static int __cci_ace_get_port(struct device_node *dn, int type)
 	cci_portn = of_parse_phandle(dn, "cci-control-port", 0);
 	for (i = 0; i < nb_cci_ports; i++) {
 		ace_match = ports[i].type == type;
-		if (ace_match && cci_portn == ports[i].dn)
+		if (ace_match && cci_portn == ports[i].dn) {
+			of_node_put(cci_portn);
 			return i;
+		}
 	}
+	of_node_put(cci_portn);
 	return -ENODEV;
 }
 

base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
-- 
2.43.0


