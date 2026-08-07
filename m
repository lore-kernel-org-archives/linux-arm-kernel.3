Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2F3C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhHhQhUh884edb2pkrtgwkkFMcH6OBy0eevlqyMXflE=; b=FDgGOFnZarFlloE4JPTo8bowMz
	+cVG5jzG3V+FnpnbtgI0f++H352hNhMht1BeA5FdjghYG7fcRXTMqzlq3CCjx0f9+75TskKc+xeKX
	8+Fxro64WsVODPl86DG052LrZW6obUpK2BOfK94zKtruF7w0MKFFm0CtYFCqsuuv4Ehra13UDGJ1o
	Wd0AlBfgr2/K2VtWB+64kaI0ZrWhPvtJ/5t3VmvfGW079C9yF7QBBW3b4IMTjaGmbgB9D6KRjVImx
	f+tNnT9CrZ3wTBW2m1izPKeHpxPXa+VOoQY5JAp9txAT+SKHIWpHjKMlN46Dp4RERp2NPt0O0sB6f
	cVxylVYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFlg-00000007OhQ-0BIF;
	Fri, 07 Aug 2026 08:17:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFlf-00000007Ogi-0oTn
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:17:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xhHhQhUh884edb2pkrtgwkkFMcH6OBy0eevlqyMXflE=; b=SRW4sR6iCbNXRPRmKqlWQtnLIv
	rY1yR9aGd8FZILUqadqQhM0cSwP2dAARxlWAeSGdwoidO0vGEBRi3BGKD3CjHw8PnJz01DDFTL/lC
	c3nhClJ4jaRruMuamcktFS3XW7UZSmfCO8kKitcPTDvx8SI7Yv5RgfoK8fJ1UfV370Oehq+75kbbm
	5UF8EYURvl13vWYSGQqnArnRMRVD8bgBp58nwfE51e5OguPff+QJDNotR7rocEQu78l0f1jYUMFu8
	CicptaXaBiwoqiYduw59zqTbQGB24zFmqHF0k+InOwf0uQv8zcGNuuJKm3Oi1C5hwnocENa84wm0I
	tSX2ALhw==;
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFlc-0000000CBdd-1aDV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 08:17:26 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so3041940a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 01:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786090642; x=1786695442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xhHhQhUh884edb2pkrtgwkkFMcH6OBy0eevlqyMXflE=;
        b=Nm9WSL2paNU/WA65NpsV78iYUSypss0prfrv2lkZhYyqMfM1x63lB1KEnLHLGU28nP
         jBze16WMNv/ne1R9II41BZbx3aXjuu5Lco3MQAld1QPApjvEg7OqXsRqxtqxkYasJjGC
         MQ/WRgz2aEPUkYZk7zS+UdEkRZuhQd+zhs1mpf9kpiyIbWMLYiEIU7CrxKdMDhVHZXnO
         o8ajDQ9EKlYF576NHfkAT2aBg+x32NyQoAVA0UUMr/eFl9wQYEX08Y/4Gjc6QB57QhTS
         2uVnm9bWNJGdGVVF3ybxfnH22moJRKTyyYaBUSIa1NfqfAYCAWwXFSDVJqOmtRc3wm5F
         Q78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786090642; x=1786695442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xhHhQhUh884edb2pkrtgwkkFMcH6OBy0eevlqyMXflE=;
        b=mQfCgv+8mdBBw+Khs6mydRmGKLsDKQ20Jyb52pDRu9mNjoKuZEV91lN0GFjZxQzROW
         73XL7wVhf0qBgQBnbcndrCy/cAjc+mmIruzsqGfSSqENd9Pi4ffIvvGLxqIoIZMHwIoy
         24E7xhvz2JlL5oEJsyLEYRGcgkwr/05Vo6vxkeWMnjwAbhqBJwX5ohv2x/ejkl5bWChY
         PwV0mzBgJINurt1bXBY/GSfj5xP2k6KNpW/XlzJjC9PPtsFKDYGZxuR3QViWRTfNyCei
         LHlMS6u8PTueCly4ryE4oKygNeE+lmio7knUaXmBA/48xLcR30fye0sa5z8XHd27y8M+
         UcjA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9qd7oGaGWylLgDfttuJaF2B9053JQYmffnhd4wcnmCX61734gYmwYdJDtcQY9J4etv9wqhqGnZWwslguE1tCQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6BJ4UwzndHvIHZ+vUaYXcrzxk9zpSnRnCWaHMnt14zcfaPsG4
	9yS+nLNOMGK4zVo8HwqVBUCOXGr4Q/gosammNiu5IrkAA0NPD3YegMFF/H3tRg==
X-Gm-Gg: AR+sD12gCYudePRmc/rYwadM3x3bYaXHKZPnfEOrRNwB4VkhqjV+Hi3YIiFQon309Pj
	1G4ZcFM+V1qk16kg7UwBUre+in4V/zqQFZidFR4yJuNxeEWzb0LvHWLLC0S0Sk6nL4izfmKo9+7
	cRCdfmVLFyeMvuDThVHx4EUGvJajsMRMBDjV/lLSwu6qGSmZz8dTAPd+Yuk4w6XAV/TDON+wpIC
	07jqTHXQTcehahvHmx7gPlzQrqDAuMpE6cnDBw5w5eh/m/NjRS3k7VaF6y/t5RWqutBvmYpc3kG
	uj0Iy+npfLxftSiUL6sCL1Mz+YX+NUiRO8M92wZJJsfxkwp5EAcNf42ZII/RlciBuNWGDLaZ/wD
	Y5R7zu0or9SxXXV6vDCy15ruRPZNZqxAF02NSX5kfvzdZZj/KSXSUOJIzmiw8FJV2H9bcCXCy1w
	Cq/6IGBLVMIuuPCZQDBvRxFfH+NF9ZWuUNqLld+przmxhFnzcb2j+wtNv7CEW8CqU8irePYoOH0
	SRB+SxVJNX0HjOoZS9mR6xEmFXsPgoQYnSNxjSrjydpza4UMeqzaGVyV/ImQWmsSTRuSPb3iTQq
	q29l
X-Received: by 2002:a17:90b:4e8d:b0:38d:ec31:4840 with SMTP id 98e67ed59e1d1-3903c5932femr22557442a91.13.1786090642107;
        Fri, 07 Aug 2026 01:17:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085de8ddcsm3913377a91.6.2026.08.07.01.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:17:21 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 4/4] watchdog: aspeed: Propagate errors from optional IRQ lookup
Date: Fri,  7 Aug 2026 15:16:52 +0700
Message-ID: <20260807081652.38692-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807081652.38692-1-phucduc.bui@gmail.com>
References: <20260807081652.38692-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_091724_576713_C270B901 
X-CRM114-Status: GOOD (  12.12  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
probe without the IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/watchdog/aspeed_wdt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index c9e79851504c..48454ac86074 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -429,6 +429,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	if (wdt->cfg->irq_mask) {
 		int irq = platform_get_irq_optional(pdev, 0);
 
+		if (irq < 0 && irq != -ENXIO)
+			return irq;
 		if (irq > 0) {
 			ret = devm_request_irq(dev, irq, aspeed_wdt_irq,
 					       IRQF_SHARED, dev_name(dev),
-- 
2.43.0


