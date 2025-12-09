Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA61D1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 06:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LrpXhu7xOFIDAiCO1bWkupxvjMEzxIC/867vkdzs4XE=; b=XYZPlLDHg7NvAj8pEJcrphGSKs
	X+5sTeTryRsLbjVCl2Z6OtGnp+HOUdB5OXFh+QfpNI4WC+R0VZa6yBxAOnFhI4ykmeIu4f5laJteG
	2WPooHEaW4yz8/ezNfz/dmosNeDtCwGAXdO2vhWOopuPcmJuqJ9WWrgbprBt3M98HLqHeKibZBi7h
	Th/wglE0vKbhZtTZXox8kByIO26aldwG90/tD25G9KrODX5C93r/npRdt0yPoRSq4fyxluaw3hNzQ
	BZ7NfBTUeeQBOijcOG0uyEzt6G+tykEbS6LdHhsVb6CXZXf2CSZLEDzNMf2Ainmlh/RS0O8pLL1Xa
	DdDonBAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSrc9-0000000DukP-0yU0;
	Tue, 09 Dec 2025 06:54:25 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSrc6-0000000Dujr-2pW5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 06:54:23 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-477a1c28778so66876835e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 22:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765263261; x=1765868061; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LrpXhu7xOFIDAiCO1bWkupxvjMEzxIC/867vkdzs4XE=;
        b=VQwF8m4E5c1pSryXYJR8wjSs20p1sh9/wtuAGHe8QkaxbiUpFlOC0EBvKNW4daZgqK
         +vfqTRlGImcSL5ixXsKV+F1Zu2YRjYqk+hd2Q8BNHBGJbZ6yPf/NMr+mdyB56PCc4Plf
         fGbbGxmECQBBjh3gFos/mlZB2UwYrJUYTJHtVsGis+t/a3DnKQXECj/cmt1pdVglGh8H
         nn8GUOwtaTYSdOk5J9BOjVioYZ4i5hgVrpRf0c9TbsJEtX6zxVnNIOy8gXaUAzGsl4sE
         5CaFTPnYBvvaEglKsw+7QP9w0mVlVSUhVPcFBXnFCupYh+kU0PBs2yKpKlq5bIhvMAoH
         2sOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765263261; x=1765868061;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LrpXhu7xOFIDAiCO1bWkupxvjMEzxIC/867vkdzs4XE=;
        b=TsvAEVAuWeqiXsaqMaimmHr2C+XYBo/kD5DmtBxZYuwSLtPS110xqlUJ/x+h504eQu
         fyvj7f1tuul9NRhOXddLT0/ddTppwelJzYPoNR6wj+IDizpCRkV+NDkWIyDcgZAMLKZ7
         d9xzQF4LwE48cq0go2xlWoPxGAiqMjh7jT1Uw0/qNbo4wItcqD5pygBJnrFzyqNAr5gL
         CRxfrMkEbyEHJEO7oHehCcSOTqa2Y/Wb2LQEE0aN1Y+YgnbrIWm2vIZaTe1l1XGgQmSa
         WTPLoKtPIQEDL33dxj9dm0+oyeRNL1J05AoVIrzih6YsDPFzQevlc7eIIGs79RbiTiwV
         xZRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw0ezR5HAA25H3AiqO+HYn2m3bQHv8w0ZbkzZRem8P+oGTAGJ+ycH1vq/5n4lauvpjBoLVjWC9J+Wp5DkzNUxZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzum/kPwj/skmkwFw1g57lrDz9sYkmR7fqpu0nqeRwZOc1j9TpM
	cluv4Ax74t/cCVnIoRT4ku7BG42+BkmnhxFpuz2MNc6zzLIRje5Qs1QKT9X3umbj94Y=
X-Gm-Gg: ASbGncvzrw7hG04fLGS0MkCLzCvf+yGHwXkLild7/urUw9Zm7EcbmW+L/Wr2FUyR8vQ
	2BSoigwCSJPMXAhg+zuwejpfapDJNiiHito6yzWT6WKDvdtKjjpj3kdG1MB++4v2Kq7g44vYdWc
	vlWdJigNC12PHHVnggUnY+Lk2LEcp3J5cWyk4vqWD01gbf8APcAy6orL+EDfktEeWu4K3OgZBrr
	wKridWybqVz756Pl26YAvG7eyd7Q2a8yp84zEjk8j5+epsjfcGDxFD1U49j3pSGwDcZvITh+MPV
	tX7/eYCJhNbtMM8KCMdS82yZp3BBSRpklMtxSt0a3k5uJeKfDH5/+Sd+E17uz5uaGknkvPn8y4n
	wDvwHlg1gO5G9fqYMN2R/ItdDdNfJpshDXakCjBmIE+yifZMtT3vDTYzENqO+1NWd+cobS9whKd
	PD9xAT0YtYksrEvxCUYTocr3x7v4w=
X-Google-Smtp-Source: AGHT+IFBOp5hL9jg9TvJQOI4BfDjItpdTFn6DjQubuLwhWGI1xvay3ngK24RTkv5+aMtVyoGM7FLpw==
X-Received: by 2002:a05:600c:a00f:b0:471:14b1:da13 with SMTP id 5b1f17b1804b1-47939dfdfe8mr111271245e9.14.1765263260606;
        Mon, 08 Dec 2025 22:54:20 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d6969d3sm23265865e9.12.2025.12.08.22.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 22:54:20 -0800 (PST)
Date: Tue, 9 Dec 2025 09:54:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] irqchip/mchp-eic: Fix error code in mchp_eic_domain_alloc()
Message-ID: <aTfHmOz6IBpTIPU5@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_225422_715523_D280A049 
X-CRM114-Status: GOOD (  14.47  )
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

If the irq_domain_translate_twocell() function sets "hwirq" to >=
MCHP_EIC_NIRQ (2) then it would result in an out of bounds access.
The code here checks for invalid values, but doesn't set the error
code.  Return -EINVAL in that case, instead of returning success.

Fixes: 00fa3461c86d ("irqchip/mchp-eic: Add support for the Microchip EIC")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/irqchip/irq-mchp-eic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-mchp-eic.c b/drivers/irqchip/irq-mchp-eic.c
index 2474fa467a05..31093a8ab67c 100644
--- a/drivers/irqchip/irq-mchp-eic.c
+++ b/drivers/irqchip/irq-mchp-eic.c
@@ -170,7 +170,7 @@ static int mchp_eic_domain_alloc(struct irq_domain *domain, unsigned int virq,
 
 	ret = irq_domain_translate_twocell(domain, fwspec, &hwirq, &type);
 	if (ret || hwirq >= MCHP_EIC_NIRQ)
-		return ret;
+		return ret ?: -EINVAL;
 
 	switch (type) {
 	case IRQ_TYPE_EDGE_RISING:
-- 
2.51.0


