Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B137CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 19:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LkcOvOZZBBJ6rw+XBoAkJNNzNDgTfzBSBc4KLO3hr2I=; b=ybAIxQeTAF6Ux9ci+qCgwBIHwG
	/RWaTr7pEAZY2MlFOUegjCOV0C4Hydysmv/mu3yQe/6Q4mbE2obmlvS0N8oawP7mkrp+1mAIurbWf
	CXiljWIHgStdxBZj+z6yv93WX58lv9YoFnN5A8s3w2q6M78CoJoswsaoTwwIVVwZExbdB+csmE+e0
	MoPg4oCaclEu9q1DA5LijTnoDJ4VGEZCrrMwXxDuWw3cACNmdKB94mCC5S0PyAjI2I4Sp3MbgfLL3
	TqJka0pF1XPnYy/vhlwuUgh49RrHSyN8swQp/BOvV8Jzi+KD8QVK4FDQShxj0YKXE7NUwF/USfirP
	X7RuO1EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIAMh-00000004846-356x;
	Wed, 29 Apr 2026 19:14:31 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIAMf-00000004823-0I6S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 19:14:30 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso1192795e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 12:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777490067; x=1778094867; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LkcOvOZZBBJ6rw+XBoAkJNNzNDgTfzBSBc4KLO3hr2I=;
        b=kPKu08oD0BrYj2I9/kWVY6IqscxrCb91RGERk1tmX1ZnBivgVXP893ms5nAv+94uGV
         XIz8FlDTVyBad7vZKSAmZDDyeeTqpnuhzzZBJ1I+0mP4RGY6uH+8LbRyx16Q//ZRUdsi
         ZIcMJlFcq9UODRVm7qVwl4qi6hsOsZge3SkEt9IEqwFERzDVAvfwLEuntpVUTwAyzEeV
         ciScT7AknIDNCO3Wzt4cPwFnPQkZ5BBREeRFIMsgHRRFRCM3V68cV0lWawnUU8PPgDAs
         rMqhwHnB2eAxYLoaG6rI0mB1MYL7KuEGZUF9YPiwyYHEKE5XRqxan8cLKqz037+a62r5
         v2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777490067; x=1778094867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LkcOvOZZBBJ6rw+XBoAkJNNzNDgTfzBSBc4KLO3hr2I=;
        b=FGPm5qsfY0E+OWRMXYMhQVvNTnRaKg1qG5xe0dc47UoNAI0oDZ6TItteJfeoP5PIdc
         CB91cJOXrY4XKLOYtN1hUYroN0SjevTEMINxakDcnYnbbhUnJ9sL02Bcc2yX2CqC6MJj
         f9Sb8zN83TD3lxvMPTuwZBUV8iEYVE3GwUxoKt/ssCFcYtCgnsFTAeF+ZMYJ5g9fDvx/
         PxwZ0cm60R2DNBeKAOJyq37rhhqtnkRIPbB2vHLCCUb1iFtDb6t3cPQ39PecxXDbsBJQ
         BCQIGxY3lv6KIMiUlAwQnvipILU7twPu0EvFh63khmKIMPpb2aeWWLQnerbbkkpCMEud
         pMnw==
X-Forwarded-Encrypted: i=1; AFNElJ/FZw1FZ9fQMZzsTzxqBmQ3eVm2h3kXW3eTVTD+nAA6J5yfpjRSbBswtWTAbzn/5NK/uNHQZLnnZLcpHaToKENP@lists.infradead.org
X-Gm-Message-State: AOJu0YzFHELclgmUda1kO/fUXI7mwXWMhOJoVnDAByIi6HUC6dLhyZVo
	nSJliadoXS/LyQZ2fLriNXnbL6iOpAShWi/B/Ui9vA0IwtEaB9oUDwY8
X-Gm-Gg: AeBDiesBsA2XliABj4mkiW0cnxaJia8NE5xFDljMWGGayUADn6nxQSHdKYt/v9vnH/n
	nWVeqLH9+Eyls+kO00HuV5R970drej4mMCccTf56igTodXsMQjD+yV3lnH4alsjQtKyBvpuMC8a
	J5MaKtIH+pYxhz16okPK+QUNN20mASNToDu3+Ws53iey+UUQaphGJJ94GXTFJPn/sPUhT1kBVMX
	ud8GuDJkG4PrAAQKe7jD9ttgJrocb7aN+wBVpU+4b4JrcWbNuYJwQkjBZJALmaAbefcSLZkOXJt
	Q/HdlZZwA58tVoVhNojwwVJEItKZdf3SHqgp4fmPwc20gYCDH/v0LaFSkIR89lBucUJVopq5wJm
	ZQ2ZS7v7j99dkIGUxYihqFbtC+w7k5x9cp7AAEKCMDc1qm+4ETuNcKElX+KzCZSNKGgpip3k4hp
	+sIDP2kSt2OGq9O83B3+wy1/fy/a9c3Lg+eu+ZZROvwaQ=
X-Received: by 2002:a05:600c:c4ac:b0:48a:72ab:f88c with SMTP id 5b1f17b1804b1-48a7b531966mr84488605e9.17.1777490066947;
        Wed, 29 Apr 2026 12:14:26 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c316d7esm23315005e9.24.2026.04.29.12.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 12:14:26 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 29 Apr 2026 22:13:15 +0300
Subject: [PATCH v7 4/6] amba/serial: amba-pl011: Bring back zx29 UART
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260429-send-v7-4-b432e00d2db8@gmail.com>
References: <20260429-send-v7-0-b432e00d2db8@gmail.com>
In-Reply-To: <20260429-send-v7-0-b432e00d2db8@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2247;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=OFELZprfvGMngJiiwTNQcz/opzneDKzuYgSzdRQRbGE=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp8lh1w5z33TZAF5+1T30Qwz8S7JO6ytEAYV3FR
 q8rCJM03hqJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCafJYdRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiK9qA/8DlDCl2L85oAjJdHuvdMuhm2cJ1nBxA2
 avmcsgKIetHjmqNpP2zk44VFNS0dvdbyQb6XCWZlJSB57i/DMG7Nrsa7S64wEgA8Y+6D5Qghn2+
 5t5t45tmsS9zRNhQ5D2L65vq+NlrBjMsLJkgTM7LqY/pa0eu4en+6m1yHzsCR4bSsNUNvUGRqUS
 cilD+V8lYukNNOVNqI+N4hLap2VQ7Imy2OiCfb2pYMMKrHCQWTI0ddPGoK96O3iS3lhPpapDw8e
 IfSUgNKcut7khIXfSbo9XjinyTCVA/c+1YtZGccPu1QaBY/BJUVCmtXQkrMUkdJbZbLSrZZqLTV
 WwYoEqc4ncyISaPD0WKxhMReXZgOPltignhMr+V1pFTgAifaBDcjkUX9ntUWkzhVHFikhfxXHSf
 MiAyq2OacP6I6AnNKaoZ7D+7qRZzrNaMIsha2atpd+e+ZfyzyFQWIdGNinY1g3XxrI4OmkCXf9d
 3kGa4F+MPE6ixR4HZTp+D0Uxk2UM5tE5CKOnZjBgU8ujQ/3yRIIRT3vgOs5Xp1HFMDkHmnTKeW+
 QnQ2JAVva/sKSGsFSLkndoiiTS8H/gfPrPP+XFjTXkEX6rrfeRhdqWW82AJNEvKloPoUWF40y3s
 cquVgQ4HLe54W/tgOpl04w/5zr4hv6CyqdSxxvBnxer7zeoY+O5U=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_121429_130673_06268962 
X-CRM114-Status: GOOD (  14.14  )
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

This is based on code removed in commit 89d4f98ae90d ("ARM: remove zte
zx platform"). I did not bring back the zx29-uart .compatible as the
arm,primecell-periphid does the job.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

Changes since v4:
Use ZTE's JEDEC ID instead of 0xfe for the DT-Provided AMBA ID.
---
 drivers/tty/serial/amba-pl011.c | 42 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index 7f17d288c807..f24cc403d9e0 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -216,6 +216,38 @@ static struct vendor_data vendor_st = {
 	.get_fifosize		= get_fifosize_st,
 };
 
+static const u16 pl011_zte_offsets[REG_ARRAY_SIZE] = {
+	[REG_DR] = ZX_UART011_DR,
+	[REG_FR] = ZX_UART011_FR,
+	[REG_LCRH_RX] = ZX_UART011_LCRH,
+	[REG_LCRH_TX] = ZX_UART011_LCRH,
+	[REG_IBRD] = ZX_UART011_IBRD,
+	[REG_FBRD] = ZX_UART011_FBRD,
+	[REG_CR] = ZX_UART011_CR,
+	[REG_IFLS] = ZX_UART011_IFLS,
+	[REG_IMSC] = ZX_UART011_IMSC,
+	[REG_RIS] = ZX_UART011_RIS,
+	[REG_MIS] = ZX_UART011_MIS,
+	[REG_ICR] = ZX_UART011_ICR,
+	[REG_DMACR] = ZX_UART011_DMACR,
+};
+
+static unsigned int get_fifosize_zte(struct amba_device *dev)
+{
+	return 16;
+}
+
+static struct vendor_data vendor_zte = {
+	.reg_offset		= pl011_zte_offsets,
+	.access_32b		= true,
+	.ifls			= UART011_IFLS_RX4_8 | UART011_IFLS_TX4_8,
+	.fr_busy		= ZX_UART01x_FR_BUSY,
+	.fr_dsr			= ZX_UART01x_FR_DSR,
+	.fr_cts			= ZX_UART01x_FR_CTS,
+	.fr_ri			= ZX_UART011_FR_RI,
+	.get_fifosize		= get_fifosize_zte,
+};
+
 /* Deals with DMA transactions */
 
 struct pl011_dmabuf {
@@ -3081,6 +3113,16 @@ static const struct amba_id pl011_ids[] = {
 		.mask	= 0x00ffffff,
 		.data	= &vendor_st,
 	},
+	{
+		/* This is an invented ID. The actual hardware that contains
+		 * these ZTE UARTs (zx29 boards) has no AMBA PIDs stored. ZTE
+		 * JEDEC ID (ignoring banks) and the "011" part number as used
+		 * by ARM.
+		 */
+		.id	= 0x0008c011,
+		.mask	= 0x000fffff,
+		.data	= &vendor_zte,
+	},
 	{ 0, 0 },
 };
 

-- 
2.53.0


