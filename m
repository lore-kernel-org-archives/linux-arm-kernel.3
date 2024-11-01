Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD01E6F06D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 15:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ke4bvOR1ARJKXE6dRhRI5chunW+2b5MmRjCBBzyOcvk=; b=nOOD3HqjBk4a8Yh0SEAdnHWgcz
	8x6lYKN0nwUf9wzEbxoMbxV+oJbrD7WkxcQmXKjwZpQDEEc20hgzD05MI4T1lKII+D5zsu6lHTHIY
	3XoVKJXEhYq6mFmgg83TdPoa/cows2ECDX3gtui8zRUmXeSCfEA/PTRbhlQ1xaBmpmFn0JS/VIz78
	B27gUV5ymedIh5yO2U0mk9IlQW3MwsmjxcAypkbdn8jHjMdLrpI1sS3VCx3AP+EyABRmTLBJSlFys
	x45a4YernBPcRde9GrnzWcKZFHImG3+WlFPd0fUqt0b6Ruc2zV7mORuRv1vSsYFipdV1xzk2rRLSM
	kkLpJguw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tum-00000007Z2R-0F7q;
	Fri, 01 Nov 2024 15:50:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6thl-00000007Wzm-45zV
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 Nov 2024 15:36:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Ke4bvOR1ARJKXE6dRhRI5chunW+2b5MmRjCBBzyOcvk=; b=cl3nGO85yqeFz6v1/V0efMuLxn
	FwkyYLGoyyYuGuQ6fpeKIL4aWF5U2C4shk8medILONrYSLDih4OztxsbdaoDr6rq8jYbwfNtRD/Aj
	oA3/85FWsnIP76z1cuDc0ypr/tGczpf73ybldt+mU2YeKKWnYWqT/nLj04G0Gk+fYfrBD8sU5Xl5h
	i05PeeNobZzuDR9mIO6zcRqi5jYl2pimGFyl/hM4ef/XovTLMH5FIOrC1iz4dpleK46mA4Oz3dzTs
	jHeSpnDdODd81NZFt7MboHSpwoPYSyhnAQAvkA8iBugbqbg17yvfZi3ePRPfgy0it7YjHHAoVf9TV
	SFUcvmtw==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6thj-0000000AlAv-02Xq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 15:36:52 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20c8c50fdd9so21955775ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 08:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730475408; x=1731080208; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ke4bvOR1ARJKXE6dRhRI5chunW+2b5MmRjCBBzyOcvk=;
        b=K1dsu1nnpXWk8GQVf1jOPe0pxJWCBNT+mNiP/WaiOGuH6Y1tkNqjsoUjzs0my+sykt
         TkiYj6kTof9tsGT5EKx07CP45pnr+7Ut92rSCMTAzXbiR5mQq3/xSrLXNUOg16HOpay0
         k2YD3Wite5O1IyKbc7eL/HSJvWNAk+nKL+twOPXjXhRLW9zRCCFSCOuBSS7V1YyBZbwM
         xst+PJX3sPIVS4Awu2IFl6gOVSWzTMd1kfcmCZxMQo2oKjHArFyztPNCcZzv64Z5oO9B
         gNI0QAIBAO6t/rmksKuJ0x3dCsWDPnxC2QSecHUHc9EyMUYWkeJWNKeCGpTtiaGrc7Dw
         KtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730475408; x=1731080208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ke4bvOR1ARJKXE6dRhRI5chunW+2b5MmRjCBBzyOcvk=;
        b=JpxyhQ4kwjKFNOdSsbZSSdQ8lTTlJN0DUcBUIAw/cExpmnOq2zZ/Dl0nANsNb+tiqQ
         pOI8XJLm5T4zRacTH+KltMdNkkKSoI/mok1wr6NmInW/dTFTNbKHIYIXJnbeVkZDvyOv
         n4v94VupUL6P8qsKDK1uZE0vB9VoSCrDY1SSnDsJ2bBItbHvfkzEFqKbbVpM7TIYlS/Z
         rcWLBCp0I+7Ae+irRH4O2KQDaMBvsUP2aLy+HKqNWezIzt/VrdGfIp+Xg1VXbzNROgB/
         i0zBn0HoD55NwWZdAUxzm8mBfddScJHb+qvdT0yQcmVcnoAW6aKfHPX7hFnG4dggEA12
         UJoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqwuvOIgzpGXSqKgn+AoJOpX1S72whwvn6tk7Aoeo2SgEE5IjpjuLsXj19VGWw9yUPC0URqsE8pFIYPBWNpFvq@lists.infradead.org
X-Gm-Message-State: AOJu0YwzhoVs6cjKtWUhDzfIFoTw8yrhC6CdHdHlAK2dy9Zea74M3Wod
	Z1Jhjh/RoxvzkACFZpYvLmBtNtG4zrI2tUs0/sTq86MaYoQCcj8OofQ8MZWHRGw=
X-Google-Smtp-Source: AGHT+IG/l+yDbRhZEjiD8rTuwk+Sm1zndokY3M0MeOuQu/ZKMTOJSdasBgYBgyc864NCeM2KcYX6rw==
X-Received: by 2002:a17:902:d481:b0:20c:b3ea:9006 with SMTP id d9443c01a7336-2111938d4f1mr60409805ad.6.1730475408251;
        Fri, 01 Nov 2024 08:36:48 -0700 (PDT)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057c1117sm22363545ad.224.2024.11.01.08.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 08:36:47 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
Date: Fri, 01 Nov 2024 08:36:22 -0700
Subject: [PATCH v5 3/3] pmdomain: ti_sci: handle wake IRQs for IO daisy
 chain wakeups
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-lpm-v6-10-constraints-pmdomain-v5-3-3011aa04622f@baylibre.com>
References: <20241101-lpm-v6-10-constraints-pmdomain-v5-0-3011aa04622f@baylibre.com>
In-Reply-To: <20241101-lpm-v6-10-constraints-pmdomain-v5-0-3011aa04622f@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org
Cc: Nishanth Menon <nm@ti.com>, Dhruva Gole <d-gole@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-cb14d
X-Developer-Signature: v=1; a=openpgp-sha256; l=1635; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=xhPvgmqbX1LH74jmdbMgtdutexJPgNxRb87XIYrFvw0=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBnJPWMXtH5x8ZpT2datlNjpCsnJlX4SCLuKATpJ
 3kgHjSOs9eJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCZyT1jAAKCRBZNxia0/vG
 ZUyPD/0SCDrZfCLPdsvedTVTqaRMR5mj5eDMnG6FkO1ciyUAcuO+putYwuhHhwRO1Aqs3/ZKdLf
 i6PBtuQOIC+eZO9emjOp8dYnBbxSLcuKLTRB0cZm+6oCb+eoMsjwaZjI35cD9VY49nZcU97x0kr
 +Go35m4aHJL/Hg9jhx1oJvth37B4kbl6SFJCtHNlGw3mnGBY25kU40H0bABOURDMeFYbpEXjc5Y
 kjMDsGE1H+r+s64wERgBNlE/cSYeNiLzNW5wNi+TQq49Ny6zMFxRk7j/8TvPee0rbR8HrUmzbgx
 8MVDt73UR+rLmWMPf+ysyvXfKlNv96D1tlzv85OlERbFBGekt4tUD23FwZ4W+5vYJ4+S0myyVFu
 6nbpBt2cBAMRLlMSohljYIKqiM9N62G+OLAlUvuEKSnKlZnFUkREq3d/RlO/7IPuw0m4DJqzCIT
 1ci7p8KFmFnse9mlljjaHIVe9BK98xiVJkXR6CUyzDDhtDu5AtU/pMGyx4USAoTxarSI8b/LxMz
 PAMxc0Hlq+dPh6QbV8ryKUcnp3IbP/S56sCnr20ONCuHpLMgYn4az8Yh3WXmMoB+MDEocJgV+J/
 JGLpJsTXbuHFsJC3gvV0g9gYmj2LiG+JOqwSwH1W4kLK811GMRoOJlOzz5HhkK3tKsNLStHsJyN
 82/t/LK+VRSl6ng==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_153651_221026_FC16795B 
X-CRM114-Status: GOOD (  13.76  )
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

When a device supports IO daisy-chain wakeups, it uses a dedicated
wake IRQ.  Devices with IO daisy-chain wakeups enabled should not set
wakeup constraints since these can happen even from deep power states,
so should not prevent the DM from picking deep power states.

Wake IRQs are set with dev_pm_set_wake_irq() or
dev_pm_set_dedicated_wake_irq().  The latter is used by the serial
driver used on K3 platforms (drivers/tty/serial/8250/8250_omap.c)
when the interrupts-extended property is used to describe the
dedicated wakeup interrupt.

Detect these wake IRQs in the suspend path, and if set, skip sending
constraint.

Tested-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/pmdomain/ti/ti_sci_pm_domains.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pmdomain/ti/ti_sci_pm_domains.c b/drivers/pmdomain/ti/ti_sci_pm_domains.c
index ff529fa2d6135cc2fb32ae8a3ca26ac055f66cf5..8c46ca428f60b3d42a5a43488538f16b7ffaa3ac 100644
--- a/drivers/pmdomain/ti/ti_sci_pm_domains.c
+++ b/drivers/pmdomain/ti/ti_sci_pm_domains.c
@@ -82,6 +82,15 @@ static inline void ti_sci_pd_set_wkup_constraint(struct device *dev)
 	int ret;
 
 	if (device_may_wakeup(dev)) {
+		/*
+		 * If device can wakeup using IO daisy chain wakeups,
+		 * we do not want to set a constraint.
+		 */
+		if (dev->power.wakeirq) {
+			dev_dbg(dev, "%s: has wake IRQ, not setting constraints\n", __func__);
+			return;
+		}
+
 		ret = ti_sci->ops.pm_ops.set_device_constraint(ti_sci, pd->idx,
 							       TISCI_MSG_CONSTRAINT_SET);
 		if (!ret)

-- 
2.46.2


