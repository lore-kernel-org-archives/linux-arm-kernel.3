Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BD3C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 14:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dvelPXkUdIwCAdAldSQ4W7PyCYIe7eFMCwQTwWTrGcA=; b=3JbsdcGpv/VNZ9kaiDp0ODQ6hY
	EP5c5LFvwsZt4VpTcwPlOz0hNUgSvEWe5vCWzYy2IK43NS18eDSzMfLDTtoX7B0KcUcOIkYCmSm0H
	EH4tftarvWqhnP4nRGl+9D2kOXNt2Kg31uTHWTKxtW7gYYtGbdSjDG2zuzNhlAdq6YSPUPxeGbT+x
	lIMxjZ52CU2Vs+YYClpY6kaaryQhOBGC0nSVEuN+CrvxBW4K9Aj0Ele2SZE98AAmJAzy20luuZFDk
	rr7bYEsaL7VYHnrMlsY6347OFho6VDEn8T7//GhxIRnLtqRcFncgPOwPGIRnUaWl60JdNbtl7jDaa
	uTUpW6KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3ykt-0000000HHwQ-3AaL;
	Sun, 13 Apr 2025 14:56:19 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3yj2-0000000HHoG-34Cp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 14:54:25 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so697119566b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Apr 2025 07:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744556063; x=1745160863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dvelPXkUdIwCAdAldSQ4W7PyCYIe7eFMCwQTwWTrGcA=;
        b=RyEEYaUmDdK+Vb5zBojlBDOuqOsettyXLvGhcP2F+an7Q71tDi44z7Wc/15G82mo9k
         qcaopjOTsLAqzbSOf3pzt7r6pQ9lFPRBa156LcfsyutzoJRI+5eltogS4TWzrNV88xHR
         xFwCCUawYtBvLBvOST+8mW06c9HmEvF8HaaqXAZCOxueF/tOpHZu3lsG8S/bIB+R0L5W
         E70qVVVDoqtHLgq5nhsKltWGCVmzRIOQB7Sp5M+ddg20/7iNN1J8wMXIrFx8dJa5fxDn
         NkoM+hXwClGkW1z1AjMc5mMv4HaVWBoFrayh+wacQFNBGZJU6KX7e8VVD+Mxv5nu5o7f
         BBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744556063; x=1745160863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dvelPXkUdIwCAdAldSQ4W7PyCYIe7eFMCwQTwWTrGcA=;
        b=AEQoWr8lrCMAjH1qfawbKf7CakFnL8yq8wFhQQL83WC9cw4ncYt6MoXNqrRHI5ojWx
         eDN3MjxTon9ZXNzQjnVX7SqUz1O8swWkIeyuKuXc46FgxudbPTsvafiw6kz1mGzw5/gS
         vMARyb93sZoE9pUfVs0Y2OsA/8hObNRPbywZOXfc0hKed5mPkHi6zQrjtyg5dW+qs7BX
         nq7497LWWW4ge2aL4przeWH9gAdAEOe4FRLhjkhRpHdO+2Ec+7EX0dpECEChfpsy0jej
         qsVYxR2WCFU59HxY7qjAbebApTq9cO51mEEqWggcO8kkQcAtO22f3W3a4lUwR8rN/DMk
         iKpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwAw9Lrk4uT4lkKFvxf9sE47hFRNhhRxRwMWOVYMvPLhcSUv+Seui3C0j/T2ZP2u+NIVp9HiAHh0JPJt+tXpDQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwktmWtRjWm0F5Vu3I0qHEE8e2JtSmtBlNfYRa/2AOPerc07zRt
	TpyraWjmSi+yT3ISh4qg3XzsvmZE8ypWQQHKvGOwnu99ifSkCXXj
X-Gm-Gg: ASbGnctbcd58dbFulAwa6QnMZD6a7ITDqSBpAmH5DXar8Y2tsFSgErlsltq/kTGcWRi
	dhS7kii66rJYe3QKpSQ297RhP/32Wgl6HRw4r6yGkVda0p5O8sw1zV/baewFct70fhCquMm88Mb
	V4tmQ4P6jzmcQRfUpC0aZUW+T0DN8b9bOl6yoVlhXH7Lkr+D8Id45z/2bf0mj1IJ+rK6zdNA0tF
	/NtVq5saWVSDopal0EEVezKonJUzXFBv0xq5UGHaJ8WGpiiLFU48JfD6I/fQhxXvf88iQF8BSEt
	3xd/lPd+jKY7CquQC/2zCilnoE69LUHQmzEJElzP6ZQQUkyVz53bnrWrUE0=
X-Google-Smtp-Source: AGHT+IFgqGhavNUgVnAURGWH2ePtNWVyQ3zUa0nRZiYGvzy8qKrKzUY1RZR3SZ91BcXNuvYs1xz9TQ==
X-Received: by 2002:a17:907:1c07:b0:ac3:3f11:b49d with SMTP id a640c23a62f3a-acad31f535amr897088366b.0.1744556062628;
        Sun, 13 Apr 2025 07:54:22 -0700 (PDT)
Received: from jernej-laptop.localnet ([80.90.89.143])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1999d96sm741027466b.0.2025.04.13.07.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 07:54:22 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Mans Rullgard <mans@mansr.com>
Cc: Pan Nan <pannan@allwinnertech.com>, Maxime Ripard <mripard@kernel.org>,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: sun4i: add support for GPIO chip select lines
Date: Sun, 13 Apr 2025 16:54:18 +0200
Message-ID: <12643311.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <20250410115303.5150-1-mans@mansr.com>
References: <20250410115303.5150-1-mans@mansr.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_075424_786870_53DEAAE8 
X-CRM114-Status: UNSURE (   7.57  )
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

Dne =C4=8Detrtek, 10. april 2025 ob 13:53:03 Srednjeevropski poletni =C4=8D=
as je Mans Rullgard napisal(a):
> Set use_gpio_descriptors to true so that GPIOs can be used for chip
> select in accordance with the DT binding.
>=20
> Signed-off-by: Mans Rullgard <mans@mansr.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



