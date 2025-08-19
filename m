Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC19BCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 15:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gw/jOwKQuYtz365HYvInA17YdqiK5qLhDO82IeRsFBE=; b=0P9BhBYv7jH1rpRAIprR+td1Ep
	phSMLIrT4eP36qe8XcaBqAXIbGySKuL+7Hob1O3VhWD8JhVCkIPzr0yMC32YIATuoDBwnKqB8hUmi
	91TiBV8RFmFFxD1Wa+fLdn/DJK9WPmxXRiTKSm+Hs89j5B+8lXVa215lNh9GhxQ2NFlXkcJ3F8ZBx
	JDy/sOyErMfM5J1NceBSY8V5iZI08Cr59J7HN3mzwxAUhkq0P8fffRKHE7JrVpBBdK2+BeDOUfwaB
	56rgWwtwstj2AhNRMsuMbwNzPocYRLcwFxcUtcDzioVXGpwIK+cM/e0w6K9C6/tciUqJUGyLPZmhl
	7ZU0mOLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNzr-0000000ArHd-1ei8;
	Tue, 19 Aug 2025 15:11:35 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLMd-0000000AQ9H-31JX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 12:22:57 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-333f92d60ddso37079001fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 05:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755606174; x=1756210974; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gw/jOwKQuYtz365HYvInA17YdqiK5qLhDO82IeRsFBE=;
        b=kEmnn2lJSNOS1DQ+wsFV8wZ5cwQEGuvbzdIqyT058AGxgLVAFPhh6cD2jh43qgVep3
         vvcWmGD6EbCWm1GNmoUEP2ahVDVMwE+ULv+h1A3ijlU1sfJJ96RH/y6xjtNYn6P0C2Yg
         7qBBuJFgvLCfyMx8EGFb8G0x0mESiiEKM4ZIX5DXWDznW1WbWeObrW6DNFaNV6id6xgq
         gFd9HxBRawu6whRCPZsF3KP22GqFqWKR2OvkPglspso2XJHVNbFTH1Y5uftNYk7P/MkY
         UPSVenbFEa2+z9wFAn9ypSc4ng+qgpqHSVUU5I6oR4r3tL4o5RDWm6gJ71z3/mY03Del
         EgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755606174; x=1756210974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gw/jOwKQuYtz365HYvInA17YdqiK5qLhDO82IeRsFBE=;
        b=AJlrfXxR3d2szqvOkFUB9rhW47pd4L8UOPXS7Vj+9vXu5+vSTAOujeMl8j6bVaoy9Z
         6rH/Kz/zobR2oa9nQuSvQzfbQPC4u6qlk31t3XUnAkgBJEERi9x+oGZ1FFnR12B7EuAN
         I7mDhR1okk+tFY1Fl2f41kzshcTkeWiFWKuHvJc0X0WxV5ca8suIM75Sr9d5aEPngqUC
         0buKPUk5s3nu2iMmvCCb0BX6VdK7JsUJW4ZnTUFQHfpzcnHcQVbfk8Rm58d12LR5NiXe
         erGMMGi65cnIbmHkVNlW0Ep8im/OFHeZgeMBJtup7+IqHQAQDJnaE6tiP5NXk5bog5WG
         NEbw==
X-Forwarded-Encrypted: i=1; AJvYcCUnC+fvjs43sHko1RpX3ZWacckxYS9gx+NtQe4rrnWaK3oSLBAf6DFxjfLJxWL05zD+266OeQzrY/i8YLwAjUU5@lists.infradead.org
X-Gm-Message-State: AOJu0Yz220YfYVlfhDIUsDuztlKqXijcIVXLg8/y9DmM/OC2VlJ6Jpu8
	CKcgo44EB0ui/l55CWrig3UNxA+Kz+jpetwbxhnr+l3qeEmARw/iD32SKldl3Dauu1mte6EfQJx
	bQNEOBlAl1bn/tvEaOyDynHSJ3gv2lb4RXySPtMz1BQ==
X-Gm-Gg: ASbGncu/ra/+r0COXgPDz41hdh3fnZG+H3Nfk16nz5xAlRq1z8Cr+OS88NO6UkYDqhu
	n3mvWAequkwIeTCZ3+ulYjlUsXZycPVYOqbfnjjmLnsduAsIz0nE0aVIUiYKHjBOKBNtZAyKxop
	WToCEZJXc+un6n06CYqZJhYdMJjwivOcRGw13sbaE2KGpZn3+nQzIqOaipAgCcOGqyu5qjGkGuy
	4qK8Jg19G1L
X-Google-Smtp-Source: AGHT+IGNH/KGoaBSyDp4h02tKapeKQZmf3kymXUsGq0Isjr/TRxPuFwtsDzGDorqqxv6Gg/sQbzuFVjxKVKE2P9+7Vw=
X-Received: by 2002:a2e:a98f:0:b0:32b:59d1:7ef3 with SMTP id
 38308e7fff4ca-33530737cadmr7048501fa.35.1755606173912; Tue, 19 Aug 2025
 05:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250815082118.586422-1-rongqianfeng@vivo.com> <20250815082118.586422-4-rongqianfeng@vivo.com>
In-Reply-To: <20250815082118.586422-4-rongqianfeng@vivo.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 14:22:42 +0200
X-Gm-Features: Ac12FXwCXMFv3UHJtH3jQfAak79Kdy3rWEOtMWOBnQNnjLpEps8EvhN2w2SpjZ4
Message-ID: <CACRpkdbzQmhtpbYxnTtKBrxJk8d3-8U7rzkrncW-05-vKZTUaQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] spi: spl022: use min_t() to improve code
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Mark Brown <broonie@kernel.org>, 
	"moderated list:ARM PRIMECELL SSP PL022 SPI DRIVER" <linux-arm-kernel@lists.infradead.org>, 
	"open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_052255_763821_F414F984 
X-CRM114-Status: UNSURE (   8.91  )
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

On Fri, Aug 15, 2025 at 10:21=E2=80=AFAM Qianfeng Rong <rongqianfeng@vivo.c=
om> wrote:

> Use min_t() to reduce the code in setup_dma_scatter() and improve its
> readability.
>
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>

Clever!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

