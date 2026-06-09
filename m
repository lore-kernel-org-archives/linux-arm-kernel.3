Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987FDCD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 22:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kO2t5PyjdfFMvsUWeszR7GAdmLCj2iCqR/ekO1AQQMc=; b=1uG+5mqZXh6FJDU1+V8EsDKugL
	G3/FWIZDS8a2gUxpQNEysyvSjaGjeUVkGbItg3ZxlAIe1BtMPH0pEjq0NZ709lbW4AmxAU1d8cq/v
	cnhF94Z7UxcZY/iGu/WMO8UU1y1tWVbohy6tpHxSJr8JBxtdihpjTzw3UEKYmdZaP2mr9KdkFluoV
	7GHKch816aNl+iu7ILt3Lq0K6EZ8ThUBtxy0We0uROk0wqyQ0X1cwIAyTgclxJN0BUD/39W2aYB6H
	ZoNa0ZHMmJEnxUfYKR2IXzFve0FUyogkdDnrNM8ebc6aEAaPXQjYh4mamtXcnAU1ku7U/s3TA1tYX
	ctCoPE2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX54j-00000006Sjn-3QdB;
	Tue, 09 Jun 2026 22:37:37 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX54h-00000006Sj1-24KO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 22:37:36 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2bf22d29dabso40856235ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 15:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781044655; x=1781649455; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kO2t5PyjdfFMvsUWeszR7GAdmLCj2iCqR/ekO1AQQMc=;
        b=plnGJDWNJfI+Ry03SvqN5/gooleTEVVvKqS6ZU5KolZtNUlxVj8qcnw5j+R+EgUAIg
         Vm3Z5MyOi/HdQk2XNK64GkREqCGQMkpLdKiWd2xdDURCwuZu6UGj1tGezJruJqVxAj0F
         ImcUJqprRY3dt8Ofm9JPYIr/U3I3IeU8MD8lBKRB7LHKxpMyDYM2ITHJZULyLxnloBrQ
         +rF1XEFMoq2WRlWvWnqffaR0hy94wOeteRLJkxhmVsrewbmiPv3DCukPtHHNR/ZiSxXe
         UQNw94DizkqrusPZPmcWHyX5vdCJhwLlN9cK6ubfzpMQ7V9uHq+mQtyrG0IR9Vx/GjnV
         z9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781044655; x=1781649455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kO2t5PyjdfFMvsUWeszR7GAdmLCj2iCqR/ekO1AQQMc=;
        b=Ur4AlK6FUkgo0peNO/NIfKvXyIw3sC2WtdDHyWbDrmCxsIFezzW+AxdMncB47VB858
         YLfHwFB6js20UrMhLTacUaxHpETTlwhL1Mdr+ElDGx0WJAQpiWLq8cWkStHwSVNrQ/3O
         NjeEf4X42HacMkTIPmjLBRuUEcJjmJWL0olH2i5B7UrCn+3DngpjsI30isit9KpnnQ/a
         QPeuTdJ3yajjGiSB6OZEHLkw9T68Qrk+93SzewQZEylh2qdFu1WREvNBlh6iPF7MCH7Z
         yZc4jtZo0gGhMXvaYAVQwLcoUv3mJj1waYvFuLsBwLga7wfKnxtyQ2TL+W/reuRUB7Q/
         wYBw==
X-Forwarded-Encrypted: i=1; AFNElJ/1K1dert9KsMp5N8m/9V7TbrK9R5Mjs4zNzC/ZXrjewa7fjW8I5MfEhkXXJaGP+LAX4g/Bmh+OMRbwTtAN528h@lists.infradead.org
X-Gm-Message-State: AOJu0YwbLZQ0xN/3KnJOiJ7N4FUtJo6FEgSPL7vyx4inH95V4J9XJ6JE
	7l6XRhzVtQ8oi7E/CFCINa9TKDrJtXEyh/64oN4XWcThSATrQV1YSorJ
X-Gm-Gg: Acq92OHGvMCSdRh5CSiuvMufpSk+ztuFJJWmdZ89IQNecC0+ih3lFGZ3T8FTxabYfP8
	PkRNebfdRX+oyekHNJtlZtPCcVKXgEHuR9OrMG7v1XlAtDb4PYPNOQNbziTRkC2bXFrlf0HBJzi
	Z3LI0skl+CN88b27HvGdkZtao8vo+gITm1AVNyplucf+4z+k+wNm9Q0lP7KEN3YTqkB4UKtKf3V
	McQVi8hmj/OauE4xyTD6uy1dS2tJ8MlMKauZre0qZhKcJCcuAaTnFrNrPtthE+BxYzZxY2SII3i
	WmC4A225ZTA3zcUp5GPXELE/2D3uoTBXCDLAA3A/bRhU8LYJz19IIHmAvnX+3acNvP1JsSiozy1
	fjXZbNaCF6MuEsRU2ul4JkAWyvpv7dZlcYwv+3twRrjyQpvxu02L+4ctq5U7m6BbyAsXQNE2YdS
	q7f2daSs0Ft/84R+mrcw8GoEco/0eQTjEDZi0ejXEgzZx5YPZKZS6qPTz0Bur0UCdbtugB1ZCgE
	W1uquWeX7iaDJbaW8E/ikksq2hINd8ChXek5s2R2B4olw==
X-Received: by 2002:a17:902:cecc:b0:2c2:9254:4c22 with SMTP id d9443c01a7336-2c2a1c66cbcmr59800935ad.17.1781044654694;
        Tue, 09 Jun 2026 15:37:34 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm293750655ad.9.2026.06.09.15.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:37:34 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-kernel@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
Subject: [PATCHv2 0/4] serial: mxs-auart: devm conversion, clock rework, and IRQ ordering fixes
Date: Tue,  9 Jun 2026 15:37:13 -0700
Message-ID: <20260609223717.41670-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_153735_561032_38FE0144 
X-CRM114-Status: UNSURE (   8.52  )
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

This series cleans up the mxs-auart driver by converting to devm-managed
resources, fixing clock prepare/enable ordering, and addressing IRQ
registration races.

Patch 1 fixes compilation on 64-bit build with W=1

Patch 2 reworks the clock handling to use devm_clk_get_enabled and
reorders clk_prepare_enable after clk_set_rate to avoid
CLK_SET_RATE_GATE failures.

Patch 3 converts iomem mapping and GPIO IRQ requests to devm,
removing the manual cleanup paths.

Patch 4 moves the main UART IRQ registration after uart_add_one_port
so the port state is initialized before the handler can run, and
manages the module clock for console vs non-console ports correctly.

v2: split off of_device_get_match_data change.

Rosen Penev (4):
  serial: mxs-auart: fix cast type for of_device_get_match_data
  serial: mxs-auart: rework clock handling in mxs_get_clks and probe
  serial: mxs-auart: use devm resources for iomem and GPIO IRQs
  serial: mxs-auart: fix IRQ registration ordering and manage console
    clock

 drivers/tty/serial/mxs-auart.c | 141 +++++++++++++++------------------
 1 file changed, 63 insertions(+), 78 deletions(-)

--
2.54.0


