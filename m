Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A954E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 15:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xrDI54RrtTH587z61yGqvhuIg5ioNpJ5JcTwNcL7S14=; b=K41xCObsJFkuFOsFjkIuMzb7ZS
	FqAmh4JSZUqnCZYEK3I5KZUUdYHVY8mXsEEoFoaeSa93owb5MFeuRUBAxh2ug/F1Zpyvpmtz0mHhh
	TgNT4huGzPDkZNT3nX9tshz78VLd7oqnInxiSET+cWF0V5938FgTLpaFjPYUjyZNLkhouPSbeXjXR
	UxrzvdEKPxh64sV0Lqbhuoi0tgIGaoLdBcrOIX+ZW/aFzYz/CoTEdLYuiAfidcAuBg3b+cELKzYeU
	BkfYDc+zuHFRa843R0lfSchsA0RXuIaYD6A0ckIp6Hh/Ltv/Pq9+SqjjXDx1I+EoEO63kp6Gm/Wpr
	kfFTYifg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCZn-0000000AKip-3VC9;
	Mon, 16 Dec 2024 15:00:03 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCU9-0000000AJeY-0iEa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 14:54:14 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7b6f95d2eafso291748685a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 06:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1734360851; x=1734965651; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xrDI54RrtTH587z61yGqvhuIg5ioNpJ5JcTwNcL7S14=;
        b=Xiz5Zz0b0t3moqjj4PqY89JvM/RQbMoDgDYpMjcLoJtgzi2/g9ILKyHK+bCubN3++i
         1sycNfUOXn/e0gzYavzfiM34zNRsLaCWzczL1lk5RK8z36IACDazmRPNefPPD+JzmUBf
         iM5eD8BJJLa8L4lmDE8pjHzimKHdzRm/Hju0LeaONWPrtkcU/Zpq7v8nAKCVyx+Tsh2I
         LHBrrWcuBljcYFb+zJ9h6He13C/q9Z9MYNc3i8//PsRx6UzBM6LRCaG0LQpL+llurWeR
         2NJGNtFuzMKSUR46fN/ZoZyksmvIJQAzrcPWTSCCmOVPQHNFrk9gChdgV4FAH5DlNrE3
         TlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734360851; x=1734965651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xrDI54RrtTH587z61yGqvhuIg5ioNpJ5JcTwNcL7S14=;
        b=AK4nN3VqRVn0M04wR56g/G6I6LW63UrYf19bARKW2rDfHCAuNV394HDyZzwLUguqrH
         Pe/1DR9y1QyHU6LosJ8S1zYdJ7T8bzKG45pCWrEYt/HBZoi3BN2dzH8mK6H9bB8X0QX5
         ugBXBlcQSS6/1RnoOeE5NT8tXXlkURw9rgOPZQiGqS6GWtVAbfecRYhOyNH8mToPwx8+
         zQ48ZUdmUNEKZH9vu+F/Lmx1tlMFkD8fsA7fH4PhsDtj+Dkg1AP9RoTXiIcFkzTUZpLS
         7tjh95CRzVo5LdQ01jKqjJhF9GCHxHKvXEPj+GY8jBWggXf4XttOeB2cycFUfz4t9UwL
         gQqQ==
X-Gm-Message-State: AOJu0YyEZ/ciQ+wjtcie7DKCif26Cn6ZYU/Q7R279qjqfuvKXEBCSSMv
	+zNZv2+GAIKz6tlkyPSRAAbPMtlejwi1NCJOY7ungbBAGqjH1wJkkZAGJrhO++Kmw79JsZZ+el6
	5WFY=
X-Gm-Gg: ASbGncsOPx2RegzI0dY/HCRe1TdgFidwIK3KEj0v6gCJMmQbMnwSfhszaH0V9FZ/ErW
	4LHxPWdyM4J/BqIUBNZFqRPe+MDp4xvO7CUJ7DUO2ckg4/58bzTzp3XJ6YlVlNyDvP37DVLeOwR
	2qrceujFQ6/qyyafPoKNunDtsUUM6DOQKtollTOYLnnkBzxCyzGlKC2mEWsWy/PzSrVoD5HDeME
	QMP0SwXtITFOBFgf1K2h6BhRJdaFnkSjqoT2UCPrdpBYr7otYLkPckU1abuA4ed2RCVpj/0nPoE
X-Google-Smtp-Source: AGHT+IEejh93L0FZI+AsvKAjo6R6QN8N65ppACXanwMRaMhjPpRdaO8GmKLrZ1p3hnkSIvCPYIc0vQ==
X-Received: by 2002:a05:620a:4889:b0:7b6:d939:f958 with SMTP id af79cd13be357-7b6fbee8df9mr2384495685a.25.1734360851084;
        Mon, 16 Dec 2024 06:54:11 -0800 (PST)
Received: from localhost.localdomain ([50.212.55.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b7047aa633sm230461085a.10.2024.12.16.06.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 06:54:10 -0800 (PST)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	Ben Wolsieffer <ben.wolsieffer@hefring.com>
Subject: [PATCH] serial: stm32: use port lock wrappers for break control
Date: Mon, 16 Dec 2024 09:53:23 -0500
Message-ID: <20241216145323.111612-1-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_065413_411050_B3E05A67 
X-CRM114-Status: GOOD (  14.09  )
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

Commit 30e945861f3b ("serial: stm32: add support for break control")
added another usage of the port lock, but was merged on the same day as
c5d06662551c ("serial: stm32: Use port lock wrappers"), therefore the
latter did not update this usage to use the port lock wrappers.

Fixes: c5d06662551c ("serial: stm32: Use port lock wrappers")
Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
 drivers/tty/serial/stm32-usart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 7dc254546075..1ec5d8c3aef8 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -1051,14 +1051,14 @@ static void stm32_usart_break_ctl(struct uart_port *port, int break_state)
 	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
 	unsigned long flags;
 
-	spin_lock_irqsave(&port->lock, flags);
+	uart_port_lock_irqsave(port, &flags);
 
 	if (break_state)
 		stm32_usart_set_bits(port, ofs->rqr, USART_RQR_SBKRQ);
 	else
 		stm32_usart_clr_bits(port, ofs->rqr, USART_RQR_SBKRQ);
 
-	spin_unlock_irqrestore(&port->lock, flags);
+	uart_port_unlock_irqrestore(port, flags);
 }
 
 static int stm32_usart_startup(struct uart_port *port)
-- 
2.46.1


