Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FEDD5B846
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 22:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9wXo63O32Tj8mL4S2l9hFvzU6LzT7SmxiJkM8pmk0Yk=; b=fIEg+x2t5acnoi
	pMGOOOkaBTmussvBElGMXU/fK8RZpzWmZRhCHkO4Zy2yO42ktcshKBN1aDoma75gBGeU+k47DwAqH
	ar+EgEEVO+YIyJ85qe46pEkGN7P1N01wzDDUXQX5+2/3f/jNGy7y8BRWIzqQXzNE5s+pkiQOo+6uy
	Z3j+lV70aL6x8k+7Vvxj6jsvDXE7LIlQljn6crSUArnRP4173KufBO4XB0SJWMUO79s+JGHvDWE59
	Ky7TERXm4pWvf+jqaezjR/cE4cMkiJLLkqZVfcF3pWA0jBVePb9MEWiABr2R0/PK/gZudrzli9xCu
	fgUeLOvjBSg6p7csYJdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5YSJ-0000000CYKM-1ilF;
	Mon, 28 Oct 2024 22:43:23 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5YP3-0000000CXq5-424f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 22:40:04 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2fb561f273eso43321021fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 15:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730155199; x=1730759999; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9wXo63O32Tj8mL4S2l9hFvzU6LzT7SmxiJkM8pmk0Yk=;
        b=e5M7DRYniXbAXXm0Uqzm9SynAMsaT4zGqlwQd61xLfrO4xn8RX3buifT3oBc2Yz763
         kt6mJGSfnYX9w/4V2X4AFkn1Ggi4w0o1jvfo0ATJUSEBVt/uDF8TUPOUVG5hQO+MMGwr
         oa2fQN1w31XZveERN05B+cKk51H4eEX0RyEAuHuWAWP+bD7UgD9R60PA5aMLvB1QC6co
         w0eSrRwK6JcMe+cM9twcRb4sqbiE64N3z/BsA7GbFuKL81H7JKvEkiIsEWUdFXvE8PSP
         Gfv6kmdKRJLI8u/UlWkZIE+/M7Jk5Fa+guGq+RPHdw8PDZ+uvi/VDRuztbH3XLcLPy1P
         79lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730155199; x=1730759999;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wXo63O32Tj8mL4S2l9hFvzU6LzT7SmxiJkM8pmk0Yk=;
        b=p6rVZaIbZzYuxyMpcJgzC8XXQSGYmVE5VCqD1WZ4pI4epAACfPy929KSiL0X4Uhr6S
         qtzrLLOBbq6Jgnuqr3Zi4wn5k7kuhZrPJ6gOIsWC0fbXDO5288+AEDbO/bVlvbJz7B4t
         kz58+cLWTD4zrLe53kkZgKY2lSGLUUlmbVK7HNVAVcVVuOAPQTKFzFyldMR94hqOnXtd
         Np0lQdG7drgapKvoLHq50uL0WaF+92paNFRw8kfPtlr/7JLuKpOPrfqBiu2MxakUF7ch
         bavAacdufSc0QPOCUgn/KDXOxPCPs9Qld4L2Wx4d+cvUFiPFDxU0iZ+GItMCgrllzGsL
         95Cw==
X-Gm-Message-State: AOJu0YxeQznkSVHgNJAmjpNe4h8hqSg1qJBzr/TOCqhS6MWOM2ZRMyJa
	M7mpiqP8AFWtnj5LKsunItvKDl6qSh18FC9kQeTIukS7tiu/OOJL2pKGk4Zbz2E=
X-Google-Smtp-Source: AGHT+IFw8S9GXzhKxxjCAvfQuZXm713onz2offOHHcQy90zHeXKFAxWbIRDYgwZ/jZYdTjDeJs6JGw==
X-Received: by 2002:a2e:a9a0:0:b0:2fb:6465:3183 with SMTP id 38308e7fff4ca-2fcbdf5eab0mr42659151fa.3.1730155199410;
        Mon, 28 Oct 2024 15:39:59 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb451caa2sm12648561fa.36.2024.10.28.15.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 15:39:59 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/2] Expand comment
Date: Mon, 28 Oct 2024 23:39:57 +0100
Message-Id: <20241028-comments-in-switch-to-v1-0-7280d09671a8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL0SIGcC/x3MQQqAIBBA0avErBtQMbCuEi3CppqFGo5UEN09a
 fkW/z8glJkEhuaBTCcLp1ih2wb8PseNkJdqMMpYrYxDn0KgWAQ5olxc/I4loSJjrVPkbN9BbY9
 MK9//d5ze9wNfxHZaZwAAAA==
To: Russell King <linux@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>, stable@vger.kernel.org, 
 Clement LE GOFFIC <clement.legoffic@foss.st.com>, 
 Mark Rutland <mark.rutland@arm.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_154002_705916_6797C3FE 
X-CRM114-Status: UNSURE (   7.81  )
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

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (2):
      ARM: entry: Do a dummy read from VMAP shadow
      ARM: entry: expand comment in __switch_to

 arch/arm/kernel/entry-armv.S | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)
---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20241028-comments-in-switch-to-0e24480e8495

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


