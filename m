Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB12FCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 17:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YoxGcLe85XsNfpKh6H9xgfEXuYoK1H+GNjoDAQ/eXZg=; b=iH+uiQnAJXrvGP
	cUPQi9CQqCfz+M/Bj2s3EJQV+W6vCPxnsd0ujK1BH/rqUL3vJ26n439n8FgR3wq3qV9qhhdrrvAgL
	P7HxUF1Fa3fhVFAr4kNaNjjOAnbtbzXBEAbU8eAJvDEZEFWMJSr8fI8x1yN265biwa8lZnbw+/nHp
	hPscg48SYDXasG0HcC69aBTzXxfUxTQ4HadWkGoRHEkLUQA15OLkC3SXM3RgtTTLQhGRu3L0A44/h
	r/1B1DU6GQCDpNS4aoKz/tEqFVjP/CDF/+wrSxjUUVw0ak92bMG3Nmv2J5ERqbEaVkkWGTZpsaEAN
	bFIhklOt2pdtu/F9XVxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNwDN-00000008yHi-2561;
	Fri, 15 May 2026 17:20:45 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNwDK-00000008yGb-2jy7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 17:20:43 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ba1e9d3687so694075ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 10:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778865641; x=1779470441; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YoxGcLe85XsNfpKh6H9xgfEXuYoK1H+GNjoDAQ/eXZg=;
        b=XX/wgILVWwyQdCAflWwmnmBPnPcGllnwBTbiU8hTb8RwlG0nTyyibRj/xRyk9wABbG
         R/IOYq3BOqhw41pmLmmnYsqk4gUTCw9hMNPjMcLPdrmHTGLC//VmMUMIcWtUwO3TG+1n
         wHn2yxxTyP9uVjd1OnH2o2N2xFfiVYy6kY6q+yPEtlfXykQiC6TnINkrPwBYsofXjjVn
         vP+X8ktxFuadumUFlpfWiboUDVqS4b9qQHSi1gEs3C9yPvSehh4pZ/R08C75/+GDIi8c
         xI9XI6/Py9IT0uxZ6B9hSJRw4cb5DXj9cRvv+2WpDyi3D4f92gT5vuCmbPm3b5C7IqyQ
         zxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778865641; x=1779470441;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YoxGcLe85XsNfpKh6H9xgfEXuYoK1H+GNjoDAQ/eXZg=;
        b=eNPYymatIJuMcsXv9STr/xs4m0yQIOlHAg7I6ko2rLRXAGBzztaLQV74CG9zbqJg4b
         kPl/qNMASBcYguUcJQB+nJRUUg+2i90OWNgktBDuxgwkTU5+fHNvIQGOBsAjmKTUs4nr
         l5+BYvCrjJTItIH+d5WJsh7c2FGMI/0rX/ADYKp/IiyfzZvyALFN4445T2S9riZ1vZXE
         TM51VuXyXQEwV5MwwOqZYCpCgWlQQ3HTYqiPPHG8Aq9pLBtNhfo6jd8PnidraKHphvKk
         3ADi0YpNjbCUxYUaWpDGFOyXwjAx/pshMu+S/2xL//rzUVyG/1txwxQsqiyKaH8TdZ+E
         LSLg==
X-Forwarded-Encrypted: i=1; AFNElJ/EWPq47oeourJKNsbHVWbHDUtLhN6mzsoBP8c1+msnCTbeBabXzl15sLdkWpFexCDfrgeTOkCCK2jI/atQHhhj@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr8H6jDbffeJPGNBjPZwoTLOQF+ZJEXtBpNPrX3mHQUyOme0JR
	ZWkoQz+n8e4cQPW+YY7E0zJLGUSmGkQWgVjxeyXMwpAw8fsIljrpiZ9W
X-Gm-Gg: Acq92OHmVKfFILhpApfQarRa6Wn3Ts2HkQ1MOeMcqHR1e0FhRR2LQTtxEAaLK9X1BkN
	+TIsUF6X0yXPCN2LPKdNYTeCNwcMzCay2whehUagGjIXa8ay/BO7N8b8b5QJnaD0XeMw/H+XF4C
	1Va9b9u0VHK+2JnnT3cO0qasvRf47JdHoxDVYcao9lX0EfbHX5/B2jybVLVXfP1TZHfThJnUPyf
	NIG7LKhn2uLWVuir6bC8+YunLyreygvKrmMpB5cDbUahiFkI5Z/8vETSANqEvuJ44ZyMdlgTi/K
	SBt0a5GKgfA4GydlvEXGM80L7z8LDWn0BcDURXv07WMxfsdYQjBv+gGPamSZeRZ2ExRuAKJAnF8
	4Pyl2dlf1/+bg5/1Ovw1q9Rgs9T9/OzCQhxpauWfXP6W9SJEKc6QUhk9MBAaOROIC5gF7SC6FZp
	UwCJoSz5PS6SsPO9PbiLr3PQsRCssdmRVIoUjzNW4vu9zrUlVuAXGr3LPfhd13VdqTIW/GVZ+VW
	YH9o0fAr1u76gbhXLI=
X-Received: by 2002:a17:902:7887:b0:2b2:eaec:c810 with SMTP id d9443c01a7336-2bd7e7e38fcmr39332825ad.8.1778865641072;
        Fri, 15 May 2026 10:20:41 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c0600c3sm63151085ad.29.2026.05.15.10.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 10:20:40 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Subject: [PATCH 0/2] spi: atmel: two fixes
Date: Sat, 16 May 2026 01:20:33 +0800
Message-Id: <20260516-atmel-v1-0-674fb4707af6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOBVB2oC/yXM0QpAMBjF8VfRd221KVNeRS7MDj4x2pCSdzdc/
 up/zkUBnhGoTC7yODjw4iJUmlA7NK6HYBtNmcy0zJUWzTZjEtpqI1UuYQpQbFePjs/vp6p/h92
 MaLd3TPf9AP2zi9NpAAAA
X-Change-ID: 20260516-atmel-6d6b0150eb7e
To: Ryan Wanner <ryan.wanner@microchip.com>, 
 Mark Brown <broonie@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Radu Pirea <radu.pirea@microchip.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Wenyou Yang <wenyou.yang@atmel.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@opensource.wolfsonmicro.com>, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778865636; l=485;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=yyFqC5fjhtxJHgvm3Qd9hub47GraUTHFaKnluUyATxg=;
 b=/+Xe6ab4myY19CHxfPm2ezkPuWNFZ0n8NbsjPFDkm5IlFrV58WdjcYRtTaKWaXl2L/IOHAFPd
 p63hSnr+S9rAklbg6I5z2jhxR8lzCsVqjWgkFkG5n6jEAQBJYMyPT1C
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_102042_695769_0BE5AD05 
X-CRM114-Status: UNSURE (   6.92  )
X-CRM114-Notice: Please train this message.
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

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Felix Gu (2):
      spi: atmel: fix resource leak on DMA buffer allocation failure
      spi: atmel: fix DMA resource leak on probe error paths

 drivers/spi/spi-atmel.c | 129 ++++++++++++++++++++++++------------------------
 1 file changed, 65 insertions(+), 64 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260516-atmel-6d6b0150eb7e

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>


