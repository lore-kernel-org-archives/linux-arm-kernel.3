Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD06E8B363
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 21:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oOaC7ZgINNg0twPrRky8t1EuRrSsqF9vkFHbkRc80e0=; b=ueJZbbbFAAlSxJDnm/wpdNwdIA
	pY23pdvKwGSVUbG6QD6LwxfZkIXPOK0H+djvzbqjSrlt7RSUCgmMLaMOp2JK6CVgSK90Tpd1NqarW
	j4yMQeRGNIjDNjGtrjLiIBB1fpwbg6dFhJNCykkFEcvwaHCJeUcZ68lPJQdcR4P7UsnDLPYBziD4n
	VZw0yRxz+e0ixeTKZu5FkU3Uh0bKj7BBkf5AIYQM+/KgzZaQ5n2Q21B9S5oA+oIJVLsUSet9ip5QU
	IYERSgjradRLx1FFMHiq3YQ37wi37VkiOs9gF/uZ2k/qGHQZzbCu+6PIkyaExsIzVDg3qkcwG2bn/
	FHi4JFZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnNdn-00000007MNo-3DNC;
	Tue, 03 Feb 2026 21:08:55 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnNdl-00000007MNS-2Pb6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 21:08:54 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-48068ed1eccso56095455e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 13:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770152931; x=1770757731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oOaC7ZgINNg0twPrRky8t1EuRrSsqF9vkFHbkRc80e0=;
        b=L4ZawwVvxSYB3kV3FtN9Vm+i02NObYawF327WHScpCpRJ9klVdQITkteVRBO/DR1QT
         dN7EzGcGhE5qAmeNxxi25FazV9gF+g8+mBt+AG394/AZI7sjnYXiqBrexElnkf+8Zkdd
         YXbEitgRwvH1o2lXR95Cs3dONUNEW9d3v3YqhnLihSJ4JpPX8QvaRe/kca1ibL507gLX
         lkOBdBrbAzaUQ/fjQmkUJEqIHpAWiPIZOzJlHm5EgSB/zNtB0I1XMQ8wc8Kjid3XbzTZ
         2GQFuJxLiQQFzzf9xoybPbnplg77Gvuw4gC3/JwhnXpE/WkOO851M/t+2MKexVgTADrg
         WcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770152931; x=1770757731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOaC7ZgINNg0twPrRky8t1EuRrSsqF9vkFHbkRc80e0=;
        b=CuTjudSNpdsos90nphz2sgE6ZxV1e/CXW6wnnPA0ourfYsovqBgshAny4PjwzIMG5q
         bszV787evp/944175LzYnsG8Vx4/hGb3u62VPCYgLULOdkLHNY39/cqSv24lwFLX6Lzz
         +cSW4dvIbIMrWIXQoJT8LBrbCj+FtyXqpwF4Zj19w1n0mrlXaYC70PchYiK7J4THaKdf
         24KT0mLKbSXzFLBQmfL1FNTtPfK0toNL1Xa/qyqAwuKuneFlBbO2pcPI4zf2DImCNhab
         Yj2IyJppp+66P6C4pGqJ70yDij6JpiGqKrSbKzMPOmIHYzmKc1nGaXok2BWM94ogJBiV
         UKGg==
X-Forwarded-Encrypted: i=1; AJvYcCVzomYTERVxeWBaJZIFUCF64O90Z37I5sjIEuW2pe67+QTOLGCGkeavjNzjvgea+6zJWV2H1Qekb4AsDcYiU3v+@lists.infradead.org
X-Gm-Message-State: AOJu0YyksSqcOm/GQTq0awi1EZJjxh0nikSQUvbqUDmBNO+KXFKaL6+6
	juFJLC2VMnIlDjYeNs/TMzFsMfPP7EV2b9gLLpSAqg1HjGXLeWnI2nC7
X-Gm-Gg: AZuq6aIusQZlBWoZefmqEKQmeH6APrQr4uCps6QXWN3XNNNTUzoUXbF9qz5Vb13EiNV
	kgK8rccNTuhBy0hUMRfr/03NmQ8XyH2zWqnhSUlM9tLVavT1UqiWxJQKuiKsn2kcNfM8vup+aE6
	XsgdH1+NQVeFthxVbblMtHQieqsRWMlvyW3b7j4H9wL+FiLPKcKhtMkvGb6T5gjte4p2YMkACmE
	w+GOpGeosRGx2Mwg5KeOuUA8dLWOsGr9T+TSURkGmSks7riex7Jrtj5hh88AiJrnXDsrhvKAdEQ
	d6On27YUd5QyWsLilmHJB8hHwo2as+GB6bjpvI6QxYfQlYPDW1G3UfQaQxfy2C0ZYO/pv7YjS4b
	fhnTmaZLgmVPKCn3nf/xwT9eCWpul5hfcYluakME4vB8ldlduIf3P3fCF7dHxAxf9K15pVc7FsP
	ejBKle24xQvA==
X-Received: by 2002:a05:600c:35c8:b0:477:9ce2:a0d8 with SMTP id 5b1f17b1804b1-4830e8d1e59mr15873095e9.0.1770152930823;
        Tue, 03 Feb 2026 13:08:50 -0800 (PST)
Received: from localhost ([87.254.0.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483051292bcsm125902805e9.5.2026.02.03.13.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 13:08:50 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] irqchip/gic-v5: Fix spelling mistake "ouside" -> "outside"
Date: Tue,  3 Feb 2026 21:07:35 +0000
Message-ID: <20260203210735.5036-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_130853_636847_5ADC54DD 
X-CRM114-Status: GOOD (  12.56  )
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

There is a spelling mistake in a pr_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/irqchip/irq-gic-v5-its.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index e24ce3d9fb62..8c4cf8430871 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -902,7 +902,7 @@ static int gicv5_its_alloc_eventid(struct gicv5_its_dev *its_dev, msi_alloc_info
 		event_id_base = info->hwirq;
 
 		if (event_id_base >= its_dev->num_events) {
-			pr_err("EventID ouside of ITT range; cannot allocate an ITT entry!\n");
+			pr_err("EventID outside of ITT range; cannot allocate an ITT entry!\n");
 
 			return -EINVAL;
 		}
-- 
2.51.0


