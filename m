Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8710FC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 19:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jwyAwao4oPJjdf7FpSRPigfPtomo1g/hUFFqJP0uxSg=; b=SwZyfhFOvK2oOHEs+DtZKFjS7f
	yhdW7FZZi3R9LQ0XCEtju8CIpBohEiAekgdY/QvQkP/xmEULztif+eimjkGyccXIcsaojsMa+CSBc
	7zoiVzAW238y44gFBZGHxJUpDkiUZ1rXyDdaMd7nBKvwA3u93yoAeCO8oDx1yxp7bbxW49DgxcpKk
	ziRhsm4gNMCWIb+gB/7Acvksf2NHiUys8H+ha4NdUh4JCoEkrNEhYRqopmk0hOwNZr3gIGZKjCu55
	648bLeoehObM+TVqC5+Ymv0d0GkeZWGAupDy/iebJDkIwW2kLRJk2Rshh1iOhBDwsRb+QCn/i5CGb
	U/wBukog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueIrW-00000003Mma-1ORH;
	Tue, 22 Jul 2025 19:41:18 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueIp0-00000003MX2-0MkH;
	Tue, 22 Jul 2025 19:38:43 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-234b9dfb842so50102735ad.1;
        Tue, 22 Jul 2025 12:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1753213121; x=1753817921; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jwyAwao4oPJjdf7FpSRPigfPtomo1g/hUFFqJP0uxSg=;
        b=fwS6AkHE2Gu1T/mmaLTittFtSifXp02XfJYy6wjfsNSBmQk+YJtG8S060deeFajKa3
         iCBCyxH17+MBorvVPRbFgYGnnibwC89kUN8YnqpaUwyV/rNZ7PAjqh0qHygwN0q8aqa9
         /OwDVbXYB8PPl3wcR9LpnApYsL0/8jPxeqN4OttNdNHjAnMKvf5aZ/cdno4gMHxfdSZu
         RBUEiY+SmSxsU9TV3/iTyA5oqP2wUyGQjRwLHbZwG5XQYrqqzWe+aUtdsYN7tfY4vuXV
         bqg1uT9z+fX+GnGEFdLGZSL9332Rhy81W+PQ/fFWju71EDWYGT5zrirfupOsDgp9Mcrw
         s1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753213121; x=1753817921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jwyAwao4oPJjdf7FpSRPigfPtomo1g/hUFFqJP0uxSg=;
        b=ry5TF/tlxX6E9vJIlfJWMqKEJSxGjH1lebLllv4yM4tZ2nyCPzcZ07QeAl2DqGE0xl
         8EfYw6P7b78N9t4HmKE+rSW7tn3kiAGWU2TN995NtUhVxbz7bk3YVfEIXDcVaAM1VuRJ
         04kIlY9nC+22BF16D/y4AXOQub8QrxeD7oO5hINNUfwrYZykp0xCQ4Lux2MIU8wX7bDO
         W4Fx/XmUqQ8UWSKarrYvZ3r2V3Qb5r8V3SlEJmQChtgKJlC3ypOYu2Rn++pISkLwxWKy
         sUk8e/XNz2F/KH/uf+Y05d1aIoCgyuB8aR5ZwHDgYXOnM4x6mpRQ+x3pCf7UyjfTxEJS
         m8pw==
X-Forwarded-Encrypted: i=1; AJvYcCVJe1Z5avVEjZ3YwVxuRHFjRMKojsBxiNzm0Fa9BxXH4e6kmS3RO/Bru2bTpfbhTx+AAD+7SD1jheL4ljsLswK4gw==@lists.infradead.org, AJvYcCWQf/wJP2qa2IVkPnRexhmaTcf1GEk4rbNVz6GuXXX6kM3bLcm6kKLTpE8zSqzybjqoDFK5OwnqqhJPOL5s@lists.infradead.org
X-Gm-Message-State: AOJu0YwY4i1/CPwURDEGHWB2ReB5LhHHxX1x2FoKWV1xjEL3u5yhJK+E
	/0U5aVX4Y/B+dbT3Fr8Y+80GW8PhBLX0M1TjwCsUkYTIORauiTocKcQGXGzOoiHcLfx0ZjjhP6C
	6rWJQnOcZNlIGOUsC/LscinrPG7pxxvpXiBit
X-Gm-Gg: ASbGncteVPNjSkU6H5fmul9AypcazbEUFcDWPJ2S+psEpSHDtQnx1rcWfScEUgzG8TF
	VKYgkeyVxzEBimTMXR0uoel9k6xHDLu5mCmvzuf/g1b7ERXSZobE0gsxDYQvxVy5t1a1YqyAo4p
	H+V/dXJtEFHUVJJ6xjpMdjges8Y7DtpSSPkR/mWjAXrWf2VaYKrlPS4yHLW37XKwYjZwLxgDDGh
	InPUwoEs0/XnOx8T5iv2w==
X-Google-Smtp-Source: AGHT+IGsEsP2+Lauu71M+oW4n4HRG//Lxp5u7eb8uK45PKFMboS8RYf4aGCjOdXnbHCp/CGkWd7DOfhjjO/CU0YvNwA=
X-Received: by 2002:a17:902:cec4:b0:23d:fa76:5c3b with SMTP id
 d9443c01a7336-23f9814e9a7mr3452365ad.22.1753213121296; Tue, 22 Jul 2025
 12:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250722170513.5854-1-sanjaysuthar661996@gmail.com>
In-Reply-To: <20250722170513.5854-1-sanjaysuthar661996@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 22 Jul 2025 21:38:30 +0200
X-Gm-Features: Ac12FXwCtPAOsiQDY47hJ2_tvejllz9nr8xSmIyDW7TLGWTLqhLQAI8E9IianHU
Message-ID: <CAFBinCCmsw=XGPtrk1XbphOu=OwhxmAiZ+2h4x_M-_f64Vo-7A@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: cleanup: fix duplicated 'is is' in YAML docs
To: Sanjay Suthar <sanjaysuthar661996@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-iio@vger.kernel.org, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	ribalda@kernel.org, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_123842_130888_CD28C4B9 
X-CRM114-Status: UNSURE (   6.52  )
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

On Tue, Jul 22, 2025 at 7:06=E2=80=AFPM Sanjay Suthar
<sanjaysuthar661996@gmail.com> wrote:
>
> Fix minor grammatical issues by removing duplicated "is" in two devicetre=
e
> binding documents:
>
> - net/amlogic,meson-dwmac.yaml
> - iio/dac/ti,dac7612.yaml
>
> Signed-off-by: Sanjay Suthar <sanjaysuthar661996@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Thank you for spotting and fixing this!

To my knowledge nobody else is currently working on amlogic,meson-dwmac cha=
nges.
Meaning: with an ACK from the netdev or iio maintainers this patch can
go through any tree (iio, netdev, devicetree).


Best regards,
Martin

