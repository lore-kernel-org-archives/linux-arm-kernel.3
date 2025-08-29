Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAA0CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0wxY1cewY1ZvhfXpTsBk4/4b0JZP8Tsxj1w3A5Y71M4=; b=Podom62gniqlApLqK2Hyvz/Hu7
	EGIYpUD9MWfJoZjaNIvdd2349HKbY/Efq7DbA4yVKfkZnZ5AU4lk3Q8a2M7XyrmzN1mVgqLZ6uBfJ
	py0rq5EQjpo18oved+W/TrtoNhVbrFD9p5xEsR4Bxqt6waXCKPJIhF6uKk7MTFa5THbxeJK0FBEia
	lF0ymXVLfomwCuU301KqQCJyKZ87na+0+65Hur4OlGPxFXzfQYeaC1RisSwHOIyzj6aiEzNdbnc8g
	0Dq66XyWS1shKC1iMITCOTV0Z6tHqkChZ6uxhl9SiXonifOMNT4exLQS+O5x25t/jEwOQnz4yKxQr
	2m3u5WAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9pF-00000007DRz-2AT8;
	Sat, 30 Aug 2025 00:52:13 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us7en-00000006x59-0sDs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 22:33:18 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-55f69cf4b77so1031232e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 15:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756506795; x=1757111595; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wxY1cewY1ZvhfXpTsBk4/4b0JZP8Tsxj1w3A5Y71M4=;
        b=lvCE1lM1lwbxK5PyEMvnqUfLfSRer4dHOFOd1iPFe8NqI+gH2dPaWT2yRQPldE8GTK
         uSoofWpnsymCniLElz83Rgvhj8lmgRfuBW3ZEZDfGDCEsRmml37yF+QG70SYtzvvPbn6
         QnG0b4JZddemxLgcB5wrkA79fNoMuiRn3GzdFr3D3uEZDk1kiX0pqGBspRfCMJSla1GU
         lfXzKtRBqG4Yb7bdmqS1z0Wnp3j1IICduB/XxaLhs1BvwFu5DZp8AKn92bQ5+jaFrQ4K
         nZiVfyadwe5Pqx3wECT/B79ZASqTgQs2+b3ESGtuP6s+ax4tEjud0H4q05NlMHxh/f3Y
         4rsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756506795; x=1757111595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0wxY1cewY1ZvhfXpTsBk4/4b0JZP8Tsxj1w3A5Y71M4=;
        b=AK3Ibw5/ZxD+TgR0WkH1We/MUX9zaFk0qGKqBeDCDIVhrkEms0mq5qTY+Z+Ji+eqk+
         NUcI2Jo4Z8QF+P9asxVMcZ91aLEVGbKua+53AGVu28iOvDVbeQobs8PKkixJloVrtKZh
         lhc0pgzSjhdH7udpUq5tsD64JnmzgG8HnrEd3BS9GLxnc6yC9k2hQsoMi870SMVk01kU
         fR45hJ8n59E67UMioaU2oDnX+gbZpejq6/MteVwmlw3MeaAqUIU7eLRW9IVpF36oL2QY
         ay+7ACdLaA1LubTjgLHQiCVbiyhSCDFukjKV8ro631Togt/yBlcDOtez97/K2dh/zWlW
         6S3A==
X-Forwarded-Encrypted: i=1; AJvYcCWv8roLv99oJcfrHHQQkN+hE6yGwR2QuQ1+6vyygHwY8XuNvd9Kecz3GawuNuvf+goTkI6jHX2Ru4VWDzE8goDF@lists.infradead.org
X-Gm-Message-State: AOJu0YyZOgBKRJB4E51JZnme4Mr3ieZQKzbZvLxHQsdEKOrDgF2WXXeI
	n3xqSJcJa4hVLxnYdH+/Hz5huuETud0PSPj3/k4LrBDoPl2iYmxKo+CMnL169AiLaaR8/ReA/qM
	7oNukB1e9lPFCVWLMzFUCdNEb5rqKmwIa2jZ84/RrzA==
X-Gm-Gg: ASbGncuAxgzRq7bAhbuZ8iDjLLY4J2ppmM6Wbp3E5lafACnWf2Z6Q+UCz66W7a28vk9
	LjtyOpHnEWYkGLk8qqASUP9LvBVoeM0UfoduLrTlPZRmMeSthQlPOjVmBNsT+/h6aygfsv7xGdy
	pJowZ9uPrtpdkS1P2YT+HDgxbpbXdMopEtcCv8JjOrdY1OHsOqn2Gl6UuWnWx416r9K7qdabIl0
	NPUdYOZdd3h2NSAqw==
X-Google-Smtp-Source: AGHT+IENJM3W17UfBxfWGD1X5J/SIfSe06hqmxkOMnpEu6fQZ9gf/LIwxzd5H/mcgzry4Ih0SpbYIZZoLdjS+5OjaVc=
X-Received: by 2002:ac2:4e0a:0:b0:55b:8aa7:4c1e with SMTP id
 2adb3069b0e04-55f709889famr48796e87.53.1756506795467; Fri, 29 Aug 2025
 15:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250812203348.733749-1-robh@kernel.org>
In-Reply-To: <20250812203348.733749-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 30 Aug 2025 00:33:04 +0200
X-Gm-Features: Ac12FXzWrFcRGoOx38Qv15P8o1KozyPxEQDiElCEqh5pWjzn0dOAl2Zk_kHqKx0
Message-ID: <CACRpkdb4TFRReKSNadeJKy29XC1qGGOO=H0G8WLZjB9D9FjTbQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Convert brcm,iproc-gpio to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_153317_248728_FF309344 
X-CRM114-Status: GOOD (  14.59  )
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

On Tue, Aug 12, 2025 at 10:33=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org=
> wrote:

> Convert the Broadcom iProc/Cygnus GPIO/Pinconf binding to DT schema
> format.
>
> The child node structure is based on the example as there's not any
> actual .dts files with child nodes.
>
> The binding wasn't clear that "reg" can be 1 or 2 entries. The number of
> "reg" entries doesn't appear to be based on compatible, so no per
> compatible constraints for it
>
> The "brcm,iproc-stingray-gpio" could possibly be dropped. There are no
> .dts files using it, but the driver uses it.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Patch applied.

Yours,
Linus Walleij

