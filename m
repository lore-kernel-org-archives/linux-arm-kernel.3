Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CA3CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 09:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+hb+If9DDOuBqGG4gKbfaGWqC3O5Z3rJt8yF28vSsQ=; b=y4zmD3Vvec+5bCIi5sQw505dtw
	r6XEVKKyg2qoWRojDHy/A7qnd3B3gcbtrVIVAghG7r8gvXqbMybFuA7MQY9M6d9sCRVcLFZZWlNsd
	R2IA6HtoSFeGjmpbL7ZIWrzuZf97AChWYjX6Zi+TKCWoLdWKJjIUs+NRcqJYQn9MQIjiC/u/nA/VM
	5sBZt4dYq1LjCZ50jVtYE5sUnoiw5JvCzX7UZ4+OTVnUWxFz30YSLxSENG7UPfENIBy+pdl3HCWnN
	Vkf8AylOJ1I92wWntgZirLeBjpqsrIWVjww6ITsQ29wYUTcZ9vX9Ef4sq37FqK3McJrCtpL1+/hrO
	AWwhB1WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5gB-00000001ryi-2439;
	Wed, 13 May 2026 09:14:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5g9-00000001ru9-07Bl
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 May 2026 09:14:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=J+hb+If9DDOuBqGG4gKbfaGWqC3O5Z3rJt8yF28vSsQ=; b=CxHIu21g+a6pgIi6UBbtp/3aTd
	gcgUqZP2H116hVVDUWzcTjFIfkVXkMCIxdyKIN1HlxnuJfFlYoCZVPbt4mfTKAL0RdrQXVu3D5P9i
	jNNl9FC+LHymtzLbFg8Ak2o0NmQXM2mwZ+WMwuXW7IrzMqBjQBDNBIc85wEg3ArW49I/xOrjyCm7Y
	nXUfeI62cTuOfdn0nTTO3tPTza8Yywdk69H9/ODo7y40O8EKEoTg0/H7FPIStMKH7h+X6mGuhLpdo
	VlqJq/LG7RMMN4YmXSo/lY+aPRdD73dFkDowhI0CuqtwnxmuaBniJtrzj1vDIvlN6PJwYSGILHnnc
	lVID52lQ==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5g3-0000000GxLU-3S1T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 09:14:54 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so4810004f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 02:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778663690; x=1779268490; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J+hb+If9DDOuBqGG4gKbfaGWqC3O5Z3rJt8yF28vSsQ=;
        b=ibBLiOPyT4R2DI4rARRcGheIUR2cUF/xM6VC7WsglU0kQxtv6HulZKVWqX1R49RUdC
         Y807wdXKI0NpDNShDkCXK2XbavLP5TrMCm3+30rKrDCgRAXo8wJe3FBf1GaLgLbXeKXe
         8lTovHXW55JyQ9/IvJdgoZRmfZtWa4/NdcDcJEw9VONuHT6Rl9WwfAKjnnORBXO5dnOW
         hM03H2WnXQomxBgX2QEc0E8gQjfXn2PLt7X8e2JyddL9eU5P9r7uSCrgQsV3MKOR2Tk4
         8WSmifjwnTleN1P4h+WED1WolnbTGjuQ9nk0fFPl/A3WCzEik7x2m8LuPX1UbH8lTm/k
         Fo0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663690; x=1779268490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J+hb+If9DDOuBqGG4gKbfaGWqC3O5Z3rJt8yF28vSsQ=;
        b=J1sdb9pyOfTmb2zRAxlYwIvx5GEpmlMZHISNIKTMaGorqGafwoHU5C7S1zAx7GVqc3
         Q6nvCtf/mSeyTXdQIgbhgMarktp775bWi/3yRbN0/hTkyWyUaPiECVefm0WNauXAUf2Y
         75HAyK6n+kk+NVD5OUIgXjL02aF5jgtsbsloOolkNBiEjYZMeC/l7MLclDvgPBW8n759
         Z5U/c62AUSSMl1K0pZj54/SK8UNmaVfxPQkHoqpnVGbx8hSrRrlvq/pjsZbEXbQR7OkA
         jImQszxhtmCuzADCuvbrSxOYuAy89WjQg3f87vaoEqbrSmQxAMFgz3D1jA9x1C/8LUNB
         lw6A==
X-Forwarded-Encrypted: i=1; AFNElJ9ArdTPKLqPg8eg1/o0yXbMrSnaV8bqb6qQbocwenZ5A06YB8WoQKbyC92o1WvYYoD+4S0E6KpdBUBgglsmj8QN@lists.infradead.org
X-Gm-Message-State: AOJu0YwPXWWWl3ZUmBQdHxyO0WO70kRJUK8+xvGc/TX6RlU0um+I+30G
	5i05LY+1KbiaGY0yZTq/f2OroONk34yfDJ2FZ9v05b3crBhqsklnZWXOmxU+8rkugGA=
X-Gm-Gg: Acq92OHmDDXXK/0475dHNWckGnRs2NOOdqTsBarWEMOEdEvJ2IN2Hs57JPjjy7eyzoi
	cIw35LGIisvZ6mUHX7R9P+VW/y6z+5BKkG4/mTfcmzIfGM8gjunM5gz36EUboqfXJlbmdfDwjbI
	9toMJfT0oAUZY9zdEQ6jwLklpsOiXNWPdLfbvt3uKbn9Zv61nOhikquegTM1OhGZDNG7eyUJTzW
	wMNKfbK0P5J2Xr95KFyY+wDsFyrLFJ0TBIgFhmBnEHQDDDOl3uUNakI+xn5opQJFMGLaobnMrEe
	NAwQ5MGttURKinxMIjGjV+fy6CF2w0goi4BTrOGkWaWZ8Yh8/ctS7OEH6UM7mRWKm3jamDD4mMI
	2AxU7/c9sl5KSbTZohWsAC/iEyey7KYRBRU9icHKEpU7oVyG7SqQv+mBB5/zYkX9ipDWG7sxxDk
	7JQXaETmxbWk6tztpUNZpSWzIy2B2Fsr0=
X-Received: by 2002:a05:6000:26cf:b0:451:259d:83fc with SMTP id ffacd0b85a97d-45c4683b616mr4191754f8f.17.1778663690514;
        Wed, 13 May 2026 02:14:50 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a66bfsm34590821f8f.4.2026.05.13.02.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:14:50 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 13 May 2026 11:14:34 +0200
Subject: [PATCH v2 10/11] m68k: stmark2: enable DACs outputs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-wip-stmark2-dac-v2-10-fcdae50cf51a@baylibre.com>
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
In-Reply-To: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_101453_101353_6CDE2992 
X-CRM114-Status: GOOD (  11.06  )
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

From: Angelo Dureghello <adureghello@baylibre.com>

Enabled DAC0 and DAC1 outpus disabling shared ADC inputs on ADC3 and ADC7.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- using mcf_read16/mcf_write16
- remove unuseful comment
---
 arch/m68k/coldfire/stmark2.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
index a5b36af8e70a..a82e1b286770 100644
--- a/arch/m68k/coldfire/stmark2.c
+++ b/arch/m68k/coldfire/stmark2.c
@@ -117,6 +117,8 @@ static struct platform_device *stmark2_devices[] __initdata = {
  */
 static int __init init_stmark2(void)
 {
+	u16 val;
+
 	/* DSPI0, all pins as DSPI, and using CS1 */
 	mcf_write8(0x80, MCFGPIO_PAR_DSPIOWL);
 	mcf_write8(0xfc, MCFGPIO_PAR_DSPIOWH);
@@ -129,6 +131,11 @@ static int __init init_stmark2(void)
 	/* CAN pads */
 	mcf_write8(0x50, MCFGPIO_PAR_CANI2C);
 
+	val = mcf_read16(MCF_CCM_MISCCR2);
+	val &= ~(MCF_CCM_MISCCR2_ADC3_EN | MCF_CCM_MISCCR2_ADC7_EN);
+	val |= MCF_CCM_MISCCR2_DAC0_SEL | MCF_CCM_MISCCR2_DAC1_SEL;
+	mcf_write16(val, MCF_CCM_MISCCR2);
+
 	platform_add_devices(stmark2_devices, ARRAY_SIZE(stmark2_devices));
 
 	spi_register_board_info(stmark2_board_info,

-- 
2.54.0


