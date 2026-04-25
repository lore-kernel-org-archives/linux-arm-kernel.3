Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B884FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 09:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xyL6eQDTOa83HsK8N08HXtdZVDzA0HoYcQ2NsR08O3Q=; b=xJAuQqgrwVo67Ern9deW8Y67Xd
	JvOO++grTYfB+Rgl0IxX+kegBqU3w5tp1yHxygBXrjBxqjpU9jRj5kxagAEAfNNvSIfybvDBFe+1h
	ck5UwvPBYNpGM6unlakN2M54zwTy2WTdwC6GVCYE1tpGkg/yCS0lexGW2oWOY4JPsOekPxwIpjl0u
	qamKhCepBzF92BiHx4jKYhSwd9yNbRG8FsxHQJ8PawnzYHtnhJxh+dTBGmRxGHVM/2jbdUZT6yhmX
	FbHMpMpZBkuBvEt0jFksjj43NFIz+Whe0kip1GwT+8zJJlzGG60Nbjq0VFl2p9xMehANfxEOmSC0j
	tizjZgBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGZLU-0000000EHpX-3u7B;
	Sat, 25 Apr 2026 09:30:40 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGZLJ-0000000EHea-3bSb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 09:30:30 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-43d70b3e159so4517346f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 02:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777109428; x=1777714228; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xyL6eQDTOa83HsK8N08HXtdZVDzA0HoYcQ2NsR08O3Q=;
        b=Kno0eFvdReru9qtd/X3DLtgj6auLVSnd+qfqCivmF+0v7+eZrwPVFRcwDlWohRGj2m
         llhd4dt6Ati/g7Z0BYHtGQKrJV6WY04neldeVQxiTCSh6iLaoAC4zqyawwIMeXC9zonq
         oYxiBkXEnSbXR00gdAKkZGrsiKBzG2XTf4KlXMMxykgVG+wdkXdaI2iQfrGKvMAK8U7v
         lyf1ajbbJXMx9mi10pXuY86qI9Pv2hmaexAMrYSVAsXEMzSMXSe+HofOvgVWwDuZDXpq
         ynG5kPMBP0JGUxQbEMgYZvyQHK2b/mffiEMdRvBkLND2AxBwaubi6NUe0LDuBVm8VeYR
         9eBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777109428; x=1777714228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xyL6eQDTOa83HsK8N08HXtdZVDzA0HoYcQ2NsR08O3Q=;
        b=nzcEhwAII/JaRlHDQsZlsoN897ONDaclawXM7pr/UL8iW23RTz38WqKFsQHaNrMltZ
         422mzcc4HzLQuEKoun5BbMp7Iw+fKi5nA2BRKayE1zEnITVdP3VcuB+XRvYu+FwYlWGn
         VXA/X1XdmUbTIMSfegTN6rUX6p7Ht/iAUKVnjIt88b/cWcCz2UwItSij8zIulaAso4q0
         kaYRnobCjpZMwyAigvpcNy74MnHTaBrhcKDW0hC9YABiOmtjRk4euA26w5k+eHZnRYB4
         +LhiHL9aTLVwY2JVvyyXsA4DIUcdrCBZMaHuORRaF9zKChW0W7sA1WFx0Kt1kE/TQ+5A
         i5Ow==
X-Forwarded-Encrypted: i=1; AFNElJ+T8kUABE/Jcxt7UemlKxkn4WS9J+q4mSloDbDfWqIQ+6pOZNIMr/9PxED2K47eLruAU6Ab/qxKhROQfjCq8LTP@lists.infradead.org
X-Gm-Message-State: AOJu0YyLwX1niSc90FOSrXQg7vKCZQFNZeh7vqspuH7QyFWbKcEZmaf3
	mAb+494FawzK/xmnGXR99V3U+16SMLikcSbUP34vsLVcrZSxlvEnFM2Z
X-Gm-Gg: AeBDies3hqfnWNVkVm5zZDDX55Ljf8JaT8F1c1+Tdou7s0VPdXwRbWsoJ1YBElowrMa
	hboM/bxKEDBEAL44z+YaCtJHR3GYf9ThMwUesKV5+ywh1FPeldBGPUuN4zRi4yRHODa471WDz8m
	ppk7Bi1Atlq4HDokxtt/jDotLfT7aq/dYMTMRyFLklih9fr9vAHJ9kk3oi/j20TnOiYbcaDB27I
	qQb4YMYgtc9j50q0MxrfamqC2UH3bm+YqgHoRjGBpBCI6bk3puJvNkoLyrk0i/FQtjPpLle2FZn
	8w0aqxNQ7VeETgquD9aMa+ZNw/WUSarK8HKw6qL5JDsWFS541ZvM2XfMRX1uX1LAsLm3Mi5lUXf
	LPe3ctHsJclMKdoe0kwRTF1/KSLcKYpVm7W1QXCAe9d8OHNKljY+Q+Fux9xBQeRpSuSroaMr2vh
	2IJJkjG3pwontlpdbNk/DPtDPs5zn/bSjMcN447Je/kXDkhXyXDg3zbE//CFgJKFWZWCCkaFwIK
	xHd
X-Received: by 2002:a05:600c:468f:b0:489:1cd2:610a with SMTP id 5b1f17b1804b1-4891cd2624fmr339312755e9.9.1777109427813;
        Sat, 25 Apr 2026 02:30:27 -0700 (PDT)
Received: from localhost.localdomain (ns31537009.ip-141-94-163.eu. [141.94.163.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7b2716sm204422615e9.30.2026.04.25.02.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 02:30:26 -0700 (PDT)
From: John Madieu <john.madieu@gmail.com>
To: broonie@kernel.org,
	heiko@sntech.de
Cc: jon.lin@rock-chips.com,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu@gmail.com>
Subject: [PATCH 3/3] spi: rockchip: Drop dead zero-check on fifo_len
Date: Sat, 25 Apr 2026 09:29:36 +0000
Message-Id: <20260425092936.2590132-4-john.madieu@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260425092936.2590132-1-john.madieu@gmail.com>
References: <20260425092936.2590132-1-john.madieu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_023029_909350_52B5DDDE 
X-CRM114-Status: GOOD (  11.25  )
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

rs->fifo_len is assigned from get_fifo_len(), which returns 64 for the
two known SPI controller versions and 32 for everything else - never 0.
The subsequent

	if (!rs->fifo_len)
		return dev_err_probe(...);

is therefore unreachable.

Drop the check. If unknown controller versions ever need to fail probe
explicitly, that should be expressed in get_fifo_len() itself, not
through an impossible post-condition.

Signed-off-by: John Madieu <john.madieu@gmail.com>
---
 drivers/spi/spi-rockchip.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spi-rockchip.c b/drivers/spi/spi-rockchip.c
index 231fbcf0e7aa..1bd48376498a 100644
--- a/drivers/spi/spi-rockchip.c
+++ b/drivers/spi/spi-rockchip.c
@@ -824,8 +824,6 @@ static int rockchip_spi_probe(struct platform_device *pdev)
 	}
 
 	rs->fifo_len = get_fifo_len(rs);
-	if (!rs->fifo_len)
-		return dev_err_probe(&pdev->dev, -EINVAL, "Failed to get fifo length\n");
 
 	pm_runtime_set_autosuspend_delay(&pdev->dev, ROCKCHIP_AUTOSUSPEND_TIMEOUT);
 	pm_runtime_use_autosuspend(&pdev->dev);
-- 
2.25.1


