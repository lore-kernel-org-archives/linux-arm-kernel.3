Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF23CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 14:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QVmu3f7j9ByFGe5OedcL6Pz7umApHSUq7F28TFt4Y78=; b=pHd8rv52+R40TeMuZ28ZFiVbNM
	CRARJvj5/kEfRBCfSntSIyKn7bhBxQDqTnRHj3m6nJZkL/qn8W+5gvygh3JKW0tMVyDslBR2gv/lo
	S+i1f59HTbYAVv31bjkNhXWwcOMOmyN44gEaWJcPTAhSpIpZac8vYRKP9cnbd7vg6nVp6iD62F5HN
	klpGPsYV2MaPUR1oMRS16v6h1y61ISRnvJf7lJGUoVYhs97FcK/lMPyhr7qWNKF1FczZdKUkqJyev
	qSkrjsqiU4JsPG/JyM6qbRJ/Iyn+iOn+TmOil6vq85LeWxqIhfBSaU1fAm5Aqe9RzmEqnBdJ25lHp
	h2gexlRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc28m-00000006RdJ-3Nv7;
	Tue, 23 Jun 2026 14:30:16 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc28L-00000006RRD-0LPq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 14:29:51 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so45184385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 07:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1782224987; x=1782829787; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVmu3f7j9ByFGe5OedcL6Pz7umApHSUq7F28TFt4Y78=;
        b=XbLwM2TC5prkeZDhTvoziETuzX98RweAMbiEUcPRtu4qJv708zSVCZR75C8+lYF5Wy
         xNrbuQDep58CRlqmF3R+I1LkC0KnrYnFBgjD+Mm63+GN2yh+cfm2Wu0pqcH1b05wgaI1
         RNtr809oHZ0VVxC1ymeDv2C7km3Bro6VPALtMNFlWz3SNFfySyncRtp3EggxfdahLCYj
         0LPqXFVWPzNIoGYcTs3CIKksLLHo0wc1OTwMm/LdUFtJly2kI1nYKwiJhwKnT3LvZQYw
         AVQj6O2ljkpL+t4M8fiBQinsUGVTOn2Fz2Cmn5H52IeAbaWAiO9dwIIvIXTWz0RD3sQ4
         bVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782224987; x=1782829787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QVmu3f7j9ByFGe5OedcL6Pz7umApHSUq7F28TFt4Y78=;
        b=Iy7OIXc73w22/DO9cWK8hHOf/STPaQN0ukQEXXKOH+jhBsaARjzsn/LTVPqpZPd9+4
         SMOjGHq5k61A/vEmjfTVM7wpU2YvTAQNkZaPXl5hOKtVsm+5pCW3uA6Wg2fUf+Nsl1K6
         pjBbU78y3il5x3TkiKSoJFexLTtmWMvtw2JQPzXWdmboApeOxCirsmLHgTtsWc6ZotmY
         pWNl8y1QZN4uXh8b6DJBgyj8qHl7wpSOI0UCoEBH4GBCNMDn4R6v6cfN8mtoIuNTjwdG
         Ie6qG4uUbEThGUCLmg7wamSbx8we4f+x6aXLSsXJd8LjYx2WDnPXsBtOHP8ZwgtrQez6
         KFjQ==
X-Forwarded-Encrypted: i=1; AFNElJ8AIuNfxuyNIp6uo06IsGmSPNtgxuXRuBEQqOmYbqBZP8zKAW80qLYwLASjxY4tRGX0470cA5G59O0DcD6B3imo@lists.infradead.org
X-Gm-Message-State: AOJu0YzJW6UqsUM3PSXzWKyDEbaxrE+rkCtYv74yrIufGCBLy71v+WM4
	Yurv9+dioLrALkMILd73aXq4XkP+MSV2PazJrUjZK0/bDbAQ4OysDMPLGhG+SIjvUjQ=
X-Gm-Gg: AfdE7clF5CRW9PAxEVT0ufU1vzQyVuboct+PGvD6h2Vloy1mZT01gr8KNWgRdVkAlA6
	IwA92JuRT8ZwsVj/iqQQgnI4E+047xcG473aZLJw4+5YBw5u5mm566ZqzCsuMCvJR3Yk7aQtc2D
	hcoxG/uPUNyZqg0tvIwkgzAZTLVlBD17hL6ZKi9a22qEGKz32xn/kWgLc2MpLY9LS8gT9IJw+WA
	TJGR04VuDG2VWi/cpnszLEVuR0ynbU1tyOhUvHfv1G+Na9olZy9BgyvdUWSmRBZq+kBck4EvXJ8
	aFmc2ZlUsEyad+wBTbLS6LRKQDTjXbVmZy0axUovRo16ppUGG/BWQYdT2j+sWP3/L3O+jzGcyIf
	7Q3Mbjc63M6Sema+C+bKDTq3oARjMTClCmkCy9L02C1XGgfnXGR7mKpJSrb/5gqU6BVwIJni0QG
	2MXyYgjI9QfDX2ElgvuBoyImRfBOaBTP2NVXl1bqKoLgGZfgMwuClKXAAhF+e6KiAhuC2kOQ/lu
	EaoEuxu3i58e3Gp/Af4/3VXE33w
X-Received: by 2002:a05:600c:8b18:b0:492:46c2:f5b9 with SMTP id 5b1f17b1804b1-4925b389c2dmr48178725e9.3.1782224987165;
        Tue, 23 Jun 2026 07:29:47 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49240efc160sm362507805e9.2.2026.06.23.07.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:29:46 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	linux-serial@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v3 3/7] serial: 8250_aspeed_vuart: add aspeed,ast2600-vuart compatible string
Date: Tue, 23 Jun 2026 14:25:41 +0000
Message-ID: <56c378923566ea0be831f58fd7c2f186ab3f5cba.1782224059.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782224059.git.gregoire.layet@9elements.com>
References: <cover.1782224059.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_072950_737225_CA641BCF 
X-CRM114-Status: GOOD (  11.54  )
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

Makes the driver compatible with the ast2600-vuart.
This enables specific configuration for the AST2600.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 drivers/tty/serial/8250/8250_aspeed_vuart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 26fc0464f1cc..6afa2f4057e1 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -560,6 +560,7 @@ static void aspeed_vuart_remove(struct platform_device *pdev)
 static const struct of_device_id aspeed_vuart_table[] = {
 	{ .compatible = "aspeed,ast2400-vuart" },
 	{ .compatible = "aspeed,ast2500-vuart" },
+	{ .compatible = "aspeed,ast2600-vuart" },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, aspeed_vuart_table);
-- 
2.54.0


