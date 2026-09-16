Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C17C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 09:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gM03x/VUgDVaA/mIuaecDaV1OsFU+CmKDOqe3ZKytIg=; b=PlQ5AUHuKHPlsg0b3XdUeMId+i
	tLGgT/3vom/zZHQbgHcQb94WlfJAZ+zhOcSZRZ710BLKgTKgZVi6T38GysziHNZERsb2Ga9CK0DvF
	l6Z9loxyo9Gxb66szAv4qZExriqhJuBysFQi2OHeLYVV30Tj35pHywVOyzFBk9NxYNzBOJb9LCQtQ
	/qGKIQeB5XAZYqebF673Wr+vfKK222D4JCYtoKQseCeThqM1/wUT6UT5pu5PmxioBbwo/IxLGKWGP
	8ZVp0bG8CtVrc3k3MnCnIPQ1irrUq9umtaYvxKYv9wZrQvXam6acLxwU1mkUETIKFU6mvovHPtMu4
	FhfDNzeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mMl-00000008uhC-2sXu;
	Wed, 16 Sep 2026 09:55:47 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mMj-00000008ugg-3wiB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 09:55:47 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2dd4b43b20bso4748065ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 02:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789552544; x=1790157344; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gM03x/VUgDVaA/mIuaecDaV1OsFU+CmKDOqe3ZKytIg=;
        b=aLNoDxoYRXrM0ceACm0hYfy4ueV77ZCQRhNQ5frgk6YpjzZ1RMFYA6dgLEPdMX0ZPl
         JuiCQRy4Jh1+Coj8MPAHU1otmzyNkI0BPZDFwX2metdX3J3ZmfFlNSFoWAR511H/bTAw
         WlPnJKYYJ9J7QTyarJvkd4Cy9LfgTVBQZGdH6RahBJQa8ipVx7SOWdHO87UnG7TJvVPM
         dDhhD5jXHOaE7MeBPRHGEFZVHRF03vrw81CzuSRMPl8c+BS6k54WAuY5ycaTqjJKdod3
         7OZHOHWBPCHsE+q/k/BrOtZWB2XIdOeCm/D9W0vMCj+2IHj2Fk+59BgrohtEcea9PLL3
         gsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789552544; x=1790157344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gM03x/VUgDVaA/mIuaecDaV1OsFU+CmKDOqe3ZKytIg=;
        b=WgB5nq8sLpDdJjyYT0Z7ZeYH5XjrJPWLBQN9TZHCwmD2ezE9zZIh9gx/mwIOVlqq9v
         N60n5ml7FlqnGb5yJD/eB4TBNTlT2lAZ33H/+yGrk3siql/N51u/cwnVkkbb/NOShpZ6
         ZVmozM4ojPqAZoWBfRGmti7+0ZQO6qaAKsQoUu7M33BheFlIJUId8Zb4uXdS15ejwPEs
         sfCPQ7YG83JWSfCQJd7gvhv0FmHp2MxNZAAJSc3EvTXMedMnOvMEzPT6xrIrwshiHwGX
         DP562latMfhvqDQYTAEmZhdgpSNCyITzZ8t4Zz/QFno8Rb8J2tlITKhUaT8UmH/EOVzn
         4Viw==
X-Forwarded-Encrypted: i=1; AKwUvBzYVCZdb8SdAcD2yIH6oC4oAzhLxSjw+gTiLcDPkjmpB7lTVRyVVRWKknx/KEBmEVUfepTLe/l5I7ohWV5fLFsF@lists.infradead.org
X-Gm-Message-State: AFuF++mICSEiyblGKHq/fN7IiAnFoqIWHXq4NKEOq0YJeHaj6GqJIN2c
	sVcCHDU/BdnAnOTS0YwTcrOtpPOzpYYLE8MDvYsYAsYtolXemuCsCSf41/U+4JJ4v/s=
X-Gm-Gg: AYBFou04v+hnyA7dJl14FUMaEbyZ10Fsg2uwnYqpsAijyyyqlvD81RtuFrVOlH8+FkH
	bSwdCmKwhjpm3OjtxQv3RZN7k3V0PlDjUkMhUiyro69Khtsnkv9QDZjWfqrQXMRXh0auXEKnWWQ
	0IOqbhtDPOdbpOt3f70qChSfsLigw0RLgkyjAOnjRQPGXCx2M4qL35XygvQ0ywtt9XEyUxlGOxT
	xSCt0NhDF/ULavdowxkKXXsOFi0Yvc8H+V9Wlmt21jfsqqzmazMkRVwgMom7BxHwvIPWVYz7D8A
	lUE6MCJv1At2hN5JPU1z6VLa6y3HcugnXQYiE2E1nRuJuosAhpaw/XlOWVtlmsedeTrlqbQbLYD
	fswkrgerWJ/KHia5FrPD1x3s+Q3Lq3KLhvPWXliuE9/81UNYjYavG0QxUj6EPHmS4NbaW26kLB7
	cZnkN9PxP2UbGERAlF/Pvy5ljGfb5AP8k/wWzOms5musauKo3vNKKGPrT5NdBi8946YtdC7k8fT
	xPREhYm2dvaNvBfxK1HkqiUVpxSb9nZ2gZK9A==
X-Received: by 2002:a17:902:c40c:b0:2cf:b68a:340 with SMTP id d9443c01a7336-2dd8e404f4cmr40489695ad.10.1789552544078;
        Wed, 16 Sep 2026 02:55:44 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5e40494sm6617087eec.15.2026.09.16.02.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:55:43 -0700 (PDT)
From: Malathi A <malathi.a2000@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Malathi A <malathi.a2000@gmail.com>
Subject: [PATCH] serial: 8250_uniphier: Disable clock on probe error path
Date: Wed, 16 Sep 2026 09:54:36 +0000
Message-ID: <20260916095438.20837-1-malathi.a2000@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_025545_986915_5D6A690D 
X-CRM114-Status: GOOD (  14.28  )
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

uniphier_uart_probe() calls clk_prepare_enable() on priv->clk before it
reads the port properties, but returns directly when
uart_read_port_properties() fails, leaving the clock prepared and
enabled.

The intent is clear from the surrounding code: the next error path, when
serial8250_register_8250_port() fails, calls clk_disable_unprepare(), as
does uniphier_uart_remove(). Add the missing call so the early failure
behaves the same way.

Found by smatch:

  drivers/tty/serial/8250/8250_uniphier.c:232 uniphier_uart_probe() warn: 'priv->clk' from clk_prepare_enable() not released on lines: 205.

Fixes: 26e8349c0d76 ("serial: 8250_uniphier: Switch to use uart_read_port_properties()")
Signed-off-by: Malathi A <malathi.a2000@gmail.com>
---
 drivers/tty/serial/8250/8250_uniphier.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_uniphier.c b/drivers/tty/serial/8250/8250_uniphier.c
index e3db60bf50c9..52667c1891bb 100644
--- a/drivers/tty/serial/8250/8250_uniphier.c
+++ b/drivers/tty/serial/8250/8250_uniphier.c
@@ -201,8 +201,10 @@ static int uniphier_uart_probe(struct platform_device *pdev)
 	up.port.membase = membase;
 
 	ret = uart_read_port_properties(&up.port);
-	if (ret)
+	if (ret) {
+		clk_disable_unprepare(priv->clk);
 		return ret;
+	}
 
 	up.port.type = PORT_16550A;
 	up.port.iotype = UPIO_MEM32;
-- 
2.43.0


