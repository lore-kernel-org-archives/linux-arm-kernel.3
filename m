Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C81C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 13:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZF7014zSu+AQoCx4OYhTEIFB9N+lwuTshRQiSyO3Fs=; b=K9iUmgBQ52BkZjmikZINBk66aU
	sZ6IiECUntEVFJyGpFyxNOdCSnVu794FG6LMCQXZuzK8TK5haLM2qqfg62Rpzlxb2f7XFKit1qc2S
	dDOm2SusT3j1I1rUqMrZXcFPKBgtSrATlX7Imb6CgPzKLVA8zWc8FJpKZwckehtr5XPYt32Jqx3Nl
	LouUoqURQGgt04TuNKBiZE2IH6ZfYV6gX5fV4E6M5CPgB6d2IDWOE9bXfYcqznYU9EgEYIZrCERTg
	b9LXRoGzN5cprboEH6al8oaBVkgy9byEQMgQX1Q5Li+oKQ/i6XvzsUdeJhPXF/piNXpSgSC+7SFTu
	5qrKjdeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Znh-0000000AY08-28Zl;
	Wed, 23 Apr 2025 13:06:05 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Yc3-0000000AOTb-1hBB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 11:50:00 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6e8ec399427so53508406d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 04:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745408998; x=1746013798; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZF7014zSu+AQoCx4OYhTEIFB9N+lwuTshRQiSyO3Fs=;
        b=lseG9Z7T+CpnUSw8WnOei9lXW66I1b92HsLAjioGIvP3gu96qCAdlS96LwL+IdDbkf
         GMbI5m+mBNrsUBQNGaucusQiuT8bdpYd6ZAAMavhtfvmX1X4pZyduushmu+TP40plg/v
         WDdTDU7l7EhyClEu3aDHOkxHt7Jt+zpJgU3GVBtOt/i1WLMzZUs2UTH2wIM5WYWWvm3j
         F0pM8G70rHSONlw+0ig/rRHsgDRo2S+rW63s1ra+WGqvNMRWzPrGliX41984zyL7ofkn
         knZjNi/k/uxUs7EbFAgqYNS17KXdqYhRNkOHRlQjRN8oMZJuqbXFoiGNlAcY5GGJo9cp
         8aRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745408998; x=1746013798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AZF7014zSu+AQoCx4OYhTEIFB9N+lwuTshRQiSyO3Fs=;
        b=eOqyjh7dE1KtHtsu6p666ok+rkUtXjjcBNVesdV9i4J510bBvpIKn1YM/GjWFkkRtL
         sEn0Xhf7t4+lGgVNmHa2JpPSk9faPLD3oNVEXNNpwjR13wU4U8jXP205w7CD85ZUvWBg
         QG3DAn/8+/IvkgxIQmJUa+6FYQgogHQjcnnE3e4aPR/ojPg7fT1kn1jj/fr8UgQ6jUAX
         Z5Ehvr8tqYdhyEhWJ8/oy7RLPTV65VQSMbvP2rAn1tTfX7/Pb6/RgDSiKlu4A+z/hKHH
         YDOHt4x9IOHm7s7mmec3WqcTBCgS7YIMSFrGBqRdUbb2bpSx5KLT8EJMiJC+joK9+yX1
         fKoQ==
X-Gm-Message-State: AOJu0YxyutsKXOixZNFax8r2WddLe0JZW76hTAggOuR0n73LwPCLcCAs
	sttVcQfrc7iDL3p/bmp4aJJ0XvZ+5IO6Wf6SlZ5TfIS2BIwD5dErAMQXFSipxlquaNGMim9jKal
	s/fIWDnaEsPf268/MKoStnAxraVU=
X-Gm-Gg: ASbGncsWHG07KIReZeOGzdmnBdK+VZMyPqRVMNYEErvsZWQvXasmtTGAghKHt1wYHVd
	VKNp3aHBxJtopeliazbDN01QosyiWlLfbgDrWNMuf7WGXHLEgLci7HC4NJlwrsq7GJAQVl/Wlbr
	6/+c+V5BygOzauvCkMfBKgUiyZNcOG3ORPui2KnOVXsGtOSQ7qZgKKN2ssNKoTjg==
X-Google-Smtp-Source: AGHT+IGnMl8xXOK57/ZzKZYIgnwfRVgrXn3A0a1Kwuu9Q7lTjYjkK1vli/T0yMUFe8XoUL1LZwGpy5M3nTp+v4hQJ48=
X-Received: by 2002:a05:6214:20a3:b0:6e8:9021:9095 with SMTP id
 6a1803df08f44-6f2c4667292mr342752806d6.32.1745408997579; Wed, 23 Apr 2025
 04:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com> <20250416-wmt-updates-v1-1-f9af689cdfc2@gmail.com>
In-Reply-To: <20250416-wmt-updates-v1-1-f9af689cdfc2@gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 23 Apr 2025 15:50:04 +0400
X-Gm-Features: ATxdqUGjK8I-AihCu7CqCFzV8k_TmaGK6QTvYnTbCFcWqCiveCrx5icRlgOhR1E
Message-ID: <CABjd4YyBKcrnnPLjtckq-9DJ1ozW9cpEkUn_hu2ExcO-W8CDMQ@mail.gmail.com>
Subject: Re: [PATCH 01/13] dt-bindings: i2c: i2c-wmt: Convert to YAML
To: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, netdev@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_044959_447725_1543681D 
X-CRM114-Status: GOOD (  14.00  )
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

On Wed, Apr 16, 2025 at 12:21=E2=80=AFPM Alexey Charkov <alchark@gmail.com>=
 wrote:
>
> Rewrite the textual description for the WonderMedia I2C controller
> as YAML schema, and switch the filename to follow the compatible
> string.
>
> The controller only supports two bus speeds (100kHz and 400kHz)
> so restrict clock-frequency values accordingly.
>
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-wmt.txt  | 24 -----------
>  .../devicetree/bindings/i2c/wm,wm8505-i2c.yaml     | 47 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  2 +-
>  3 files changed, 48 insertions(+), 25 deletions(-)

Dear all,

There haven't been any review comments on this one. Shall I resubmit
this patch separately from the big series for easier merging (perhaps
also dropping the MAINTAINERS update until later, so as to minimize
conflicts in linux-next)? It doesn't have any external dependencies,
and the binding itself is rather boring/trivial.

Best regards,
Alexey

