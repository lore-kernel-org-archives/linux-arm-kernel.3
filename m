Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDAEE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 13:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AKFRdWgT/v4NOhdFzS4ffyMVT075WEVDQYQZtJx6dJQ=; b=pGCDmc1Udnc9yK8RLib3H0PItM
	aL6bFRFob3fsQLuAG/7gV6ZYz5zJwHdDAag4Z4biTfzUOz+XJO2C5TzKXo6YhTkJlZ//aCTX7pef6
	h3tbjsqU8mB7GWwXeTPLpCkIgyKKKS1bhvSjS/992lVp8zFvbr7c1Ksslx4XEDjULLZXy8htCfqIx
	tm6wB6RS5qVTaZC6ionC7htgNJ7wAwnQ/zvaV6pyDli+SL6WCdpOWafC71fdBPo2Kz4PYjB86KhOv
	t5Tm9L+Vaf7sZKjCZ8uuK/DLYOHeotEGcO+18lNJWh7iNJL2/3zlMv+2/wdBiF4kQJNfIrV5vaFiz
	mS0KdP5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLjLv-00000000Uzn-1mXr;
	Thu, 12 Dec 2024 13:35:39 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLjKq-00000000Ujq-1sJ8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 13:34:33 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21634338cfdso6399255ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 05:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734010471; x=1734615271; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AKFRdWgT/v4NOhdFzS4ffyMVT075WEVDQYQZtJx6dJQ=;
        b=Duq5LJE7UJzCnjCSYWKj38KCqqXnQPDf73PT6ud1I16fthA28dEIYla/pcDFjKNwLK
         l1Ik4QLzU6BQF5ImIjjtJ7SrIViGu7zkfHejKvjdHuFIMex/X748X6for/Ocj2xx+G4+
         xxWurjolsBc4vIWTYMRBNbH4BKYKZgpTZONHSD/hwv9PmBOsNyq8TNKEF4TdUUpu6q4N
         Pir30vd/xBWP4OjVB4xdxWu3vbhg8e8EQDu8R3rvxMhUHasmP0wpamrOtoHxVq4JHfrt
         vOh1jbzta4cg42IMAqadENiJOaCUnTdarg2AUOKllL4hrIHpgkbhXpnYcO0o1Hpm2OrB
         efdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734010471; x=1734615271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKFRdWgT/v4NOhdFzS4ffyMVT075WEVDQYQZtJx6dJQ=;
        b=Mv+h/nJmV1vuB3EqqwYkBlrI5uNkYOcjLMPxpPO7+/Wk2fi22D68n0cHYZ8fC28B6V
         cdsWSDV1+IyUdoXbY0o7KRWBwyVwPPNbN2zJFjkFf7FE0oyVZguc3B9Mmi/LGGkwdLF9
         HmZtImYiFtelx7kGLtMfm9oSQxUAKerUOZHRF3OEMrU/LASh/IYi4GYVxkNKnwaUEDNy
         eQWjdL99PW6jacvllA+KZGYjHuia7D9GtmxR+5QIji8mcpZuiFCZ74Yt3uiRLEQ1GVyS
         lgjU0yYFj9SWvUWX7KoXaFQBjHtCy7EMOx5IZqWzA7jiKdW2CWw6WiUAlo5uTO3I31iq
         Xqpg==
X-Forwarded-Encrypted: i=1; AJvYcCXRS1WnKKK57DkFJR7AzXT7I8N7g5DnSwE0S2oEMjjSW0P/kFzYIAa691ZFyP2nvkpLix6CIM1FG6CToAP3K50c@lists.infradead.org
X-Gm-Message-State: AOJu0Ywqk+svTPxGMW49O8vYjiBrhTxnDqxWBD/AHGidMHIdU/IUkI6R
	8ihaKLn9PHi8svHNCpbFg0V5SRKXTtQimMC/W0ULQl+b47+6GzaK
X-Gm-Gg: ASbGncsWbCheGWVNmQugnf+4GnxuarUERwtMcSob4Hpbz2UTrHbkzOT14MyWAFIqPSI
	bF3oKY1RPczdIW54lMax1zzeWIiA77Rc7shsTGVjXpXc6TOItOAJ3PWhDVGoQMIt3Eh/vp1OsDu
	o3kUZgB/AMPWZYU46N7uf/7IWVoOtsFQ/6uIMPK/KxB/JRD8j0bWFkFMeMaWmQl/zTeAvdb+CHJ
	Ikjz41YmQmX1ZW6kTIsx3PT8FvDp3LPiz+FTMPFySHxdFXq9cxStzb/z3/udrd+3XnctxnkqSph
	xRVj1GUa8UPzjXoJ8ICMVpMGvPb2/vIb/5rSxUc9yky8Dak1qV/UZGb30shccHyOjaGcjKHAgbO
	0WLz2
X-Google-Smtp-Source: AGHT+IFir8bmrbK56qwR6cJik9C730y6CMb6VE/C33OoWpwM9X30GYCxB9rlmJ+qw66LkELlDihuyA==
X-Received: by 2002:a17:902:ce92:b0:216:48dd:d15c with SMTP id d9443c01a7336-2177854b4f2mr84668205ad.27.1734010470917;
        Thu, 12 Dec 2024 05:34:30 -0800 (PST)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2163562a838sm83390165ad.29.2024.12.12.05.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 05:34:30 -0800 (PST)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	patrick@stwcx.xyz,
	amithash@meta.com
Cc: Jerry.Lin@quantatw.com,
	yang.chen@quantatw.com
Subject: [PATCH v1 0/4] Revise Meta (Facebook) Minerva BMC
Date: Thu, 12 Dec 2024 21:32:22 +0800
Message-Id: <20241212133226.342937-1-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_053432_491742_E4471CDE 
X-CRM114-Status: UNSURE (   6.58  )
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

Revise the linux device tree entry related to Meta (Facebook) Minerva
specific devices connected to BMC (AST2600) SoC.

Base on:
https://lore.kernel.org/all/172722509817.374662.7338401100529556748.b4-ty@codeconstruct.com.au/

Yang Chen (4):
  ARM: dts: aspeed: minerva: add i/o expanders on bus 0
  ARM: dts: aspeed: minerva: add i/o expanders on each FCB
  ARM: dts: aspeed: minerva: add bmc ready led setting
  ARM: dts: aspeed: minerva: add second source RTC

 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 523 ++++++++++++++++++
 1 file changed, 523 insertions(+)

-- 
2.34.1


