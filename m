Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D623D5C0C0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 12:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DnSKG3TH+X58AcZRDigmrjfJlOAFQ9HXiZWebugh1IM=; b=NvPMd0r0vwTINcbtiXF+B0DDsk
	FDL0wnB+60p6kFx4YNz9SESQLscgucMA23XkYEhSAfQGIETM6i1kpR1q+/vKgbZgIA8HDcs5ans3S
	iaHdrstiRa1uUrgkxROynGZXykJOHoXYmAx/z2V8RpA4Jj7G/nkJJ5J61h4AoLLFtoCLAozygx5EV
	ldqYIKraa+aO0POBp74CTZveuP8VuFzZgRKw1A8wdheMW3LA4+cQm61CahGWD2n5O+BsDqhz2rK+u
	myOZSoVUUmhrf+wlpDlwdeXLrfv37Hy2u6wnOtovtl5W8/m4AQ0EiC5+qaSYqDk8KNO8tCBil3ebb
	HYrzXkdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Nll-0000000ASNY-3Z5G;
	Fri, 08 Nov 2024 12:07:17 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9N5v-0000000AKko-0pPb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 11:24:06 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso18456825e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 03:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1731065041; x=1731669841; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DnSKG3TH+X58AcZRDigmrjfJlOAFQ9HXiZWebugh1IM=;
        b=o1Llg4RVcLunnifrmIBVbMejV0tgw8Wnvg0IuHy7CVArcNtQLtFdqgClW8Kkk2oCWz
         4KMCT/UHmXEdJs8HFtGbbTtzWFGq0bmRdswL9xuBrel1RXYcBhjFkj1UQlVwTCXaEqRx
         1VXBMLB0UYygnaDju75Bu8roMHs3Fr0l9ObwV96L+JTZSRcMiOv9EqpDohPlDwd5SdgU
         ymPY0Ueqz5kfaiZsc7KsbOJOGGwxL6QQybeb4rDuyfAE9Y3JjQcnKCIxgd7T5hGRFLj4
         hGHx+Sbutfhbr97568Rwt2278NrTt2srGHmRc5Ebqvy24wHQo8kbuGJqxKBTN6pv4JLu
         vpow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731065041; x=1731669841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DnSKG3TH+X58AcZRDigmrjfJlOAFQ9HXiZWebugh1IM=;
        b=bOvgG90itsxG2lqdxV0X5f2/CnDKsY1XoYi1iKCjHQdT937M8mGHgFSXfc8o0ppytz
         95IQLEEUb6Nrgr94PYQUw9aZceTcn8rOr+ZXJOK9ArgHXEHPXRCPJ1PwsL8pz2Z9nnRt
         zkQnBkblBLNUZ+A5vRDUxHLAD9oaAwe/413ZSZfhF8NhW4WPQUk3OEAUQKRRhzndHf7h
         /LIBWUNagohXYMjZJqbcDZPzLDGvngUeEo4QhPZeaEioSRs9zgDSFYy1ID4zYBwy2lzs
         jpOFDc/2feN5+EbMaMqbCJ3asfvfof/tPocjtNbTkIRQM+o54BjzFjdXgNQQ02gwhjiq
         xj0w==
X-Forwarded-Encrypted: i=1; AJvYcCVzaxfxIfC8OwNCdSw4jCjSgOODbXKrBvtSlyvXSJJ6/L58luztk18zehDsCEJadUhIQ1r0+wJ57D24WdCBeslD@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz9STCn0Nk02wXS1xQuxlO9TBjc5dlDjsOl+I1If6sRAWqK0nr
	dQo7UAxGeUL+TBn7K/W6xlArZHNT4No8TF+Keobif18xTAw3XDMpcVNNoojx30w=
X-Google-Smtp-Source: AGHT+IFhDdWJ9/nrt/S8un2QtY9kM8UUNO7BtPJoNvy1L5IL1cpiKGJx6XnADmahjiBUVox1mtdnAA==
X-Received: by 2002:a5d:5f81:0:b0:37d:5232:a963 with SMTP id ffacd0b85a97d-381f1866f10mr1897932f8f.14.1731065041488;
        Fri, 08 Nov 2024 03:24:01 -0800 (PST)
Received: from fedora.. (cpe-188-129-46-99.dynamic.amis.hr. [188.129.46.99])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-381ed970e18sm4281443f8f.10.2024.11.08.03.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 03:24:00 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	lee@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 3/3] tty: serial: atmel: make it selectable for ARCH_LAN969X
Date: Fri,  8 Nov 2024 12:22:36 +0100
Message-ID: <20241108112355.20251-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108112355.20251-1-robert.marko@sartura.hr>
References: <20241108112355.20251-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_032403_259438_020A9A04 
X-CRM114-Status: GOOD (  11.78  )
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

LAN969x uses the Atmel serial, so make it selectable for ARCH_LAN969X.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/tty/serial/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 45f0f779fbf9..e6cf20b845f1 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -128,7 +128,7 @@ config SERIAL_SB1250_DUART_CONSOLE
 config SERIAL_ATMEL
 	bool "AT91 on-chip serial port support"
 	depends on COMMON_CLK
-	depends on ARCH_AT91 || COMPILE_TEST
+	depends on ARCH_AT91 || ARCH_LAN969X ||COMPILE_TEST
 	select SERIAL_CORE
 	select SERIAL_MCTRL_GPIO if GPIOLIB
 	select MFD_AT91_USART
-- 
2.47.0


