Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E56CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 22:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mk6CMIMtIPdATtZ5umlYg1fI23JT3IVr09wXtRVUQbs=; b=F8KnVxxWz59bEJDfEK4lnKXkOD
	cQIBzPqo66WJ/4GU4aEYiCUOqRuwxLGdB+ysbQ2edQAhJ/Zl69wjm/KqNfjNaI5LUnRS+IEZ+gm9g
	ooKlDMbnheJai7VWHig3XsZiakl7LecH9a6yQpgQE/ZptsYB/Z9k9rZEY9V84rsq+ff8wshrxTPd3
	zvYrL0XkR45cDMfZoQfCqpj5zLB7n+/NyYF+J/HIvNJEI+N2NY02CEPyq9H5B9IBHaHfv4JT0jrTc
	MicYuGtNfKxUgGpNAr8TIW8HIwtkfoNoU/htWv4wsXCk7WmPsIjKWmV6Ny3z7WhSboNL6P4qAoWaw
	xuJG0JUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVbM-0000000Er7u-28WJ;
	Mon, 27 Oct 2025 22:22:08 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVbK-0000000Er7X-1KPI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 22:22:07 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-378d246f0f1so56360231fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 15:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761603724; x=1762208524; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mk6CMIMtIPdATtZ5umlYg1fI23JT3IVr09wXtRVUQbs=;
        b=pXssfa8L4fEKRP1nYFvusrx5VWEkdGgXu1BNKcqWpfccxBRfKDw90sKoOMVG7Gfz5f
         ghF4RRY+YfdvwTlyTGBxVSExTtzdQBJueKTnhY9xNbVarXLCF2xqGBqrSkN8u1SMyZ8D
         BgTnbVmMiwAkREdJxmq/38Pk3K9qQjRKI6bgtxVkRNGniHO5HRh7miU2QcDlMUR4/7tr
         VPYFVrgie6E8iMaPwzo4Wazuk9VsURge4kb9Byb/FXqk4srFeHII3f0jfyMhKfD9C7fg
         HJKc8rCGB4lmeE7RuGl3UIHxR6MwEtFwktcyhTAEA4kicpZckJSGRo1vYzVnu8IezzSx
         FVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761603724; x=1762208524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mk6CMIMtIPdATtZ5umlYg1fI23JT3IVr09wXtRVUQbs=;
        b=MERts1wxAx7lxcUKCbfJeu9UWGMLl+QYQYhU7OYsG0MtfMZG1/a1zkPwh23V1yMF4f
         2P0KD+rOjCm79Mj2OH7diR52QFq3AIu5MUi+3Si/e++FSOSs//o8SyKknszdXy4GEJy4
         m4B3dtF28cwqR2no7n4Et7UjGjEck9qgtB4shiLoq9aMs5Msvnc2P8M1YbAiAcJx3imE
         H7qrEx26XWHpihdfNXyYWrFPjT/Q/8OYD+Y5gijfHbsqsWxst3fyugrvWjyaE5Cr4Mxl
         MCZIRk8evjJyEsTPyZU0DjTDgOalZZsjQa1I/fKVnd/zrUGRy56tbVEk3cP1ahus7aKU
         iiag==
X-Forwarded-Encrypted: i=1; AJvYcCWaezEXvOeOEvtCCuugkpeOxSUh6J4/EoMT5EZ1L2fLXL+Rn4un0l5SUJRRd0/MDx5kZGRMUYtEKKvgRKIH66G/@lists.infradead.org
X-Gm-Message-State: AOJu0YxUdmlCggmD3pGu+n7/dr3IUEkj8XpZV85L9kH9kg9HQxs0WOxY
	HeQ3BFW8YFrw/WjbESNvdjyA/+F2e80YXzncIxS2A6H8ngVuO9bNdWPFQbjFIT3BNOuCmxrtFGZ
	lFwExdS5HKZ7dkNp1IjkHfp4keOHWWNMXciatI2AF5Q==
X-Gm-Gg: ASbGncuMmnqZRVge9I2hrsaxOfA1plfw4lt9aeJ7Nmx0oIAJwRGof3I9+eYpzG4rGPi
	2wA/VZ4X+WsmNOL5oA0ADphZvKJHX4xtH+y9VdngAwegw5uGAd5muQjZns9JMIBHYDnBaqFp4gt
	EVBCnKGx87Kwz39mS501jyBYrS5TE3/K3ewOsSrMKzLxWAZ+KRBDM/BtdcwQRIUjf5iCA+JVBB/
	o3IxH9aJtW307j2Vhc1WkHAn1bOqkPUlsUJPOGqsChh567BJNvTmIGIXyZDOAWKYVjXsxQ=
X-Google-Smtp-Source: AGHT+IGqZ8GiKsDXabPDIT7bgFYq/ZQGGvVGH/EZuTGyr2JhwzJhwciN+FMdAj7bErLSx2i0RsqhXtjVHaI7A0Vxzr8=
X-Received: by 2002:a05:651c:23d3:20b0:365:e848:b7a2 with SMTP id
 38308e7fff4ca-3790774b8e9mr2942961fa.33.1761603724165; Mon, 27 Oct 2025
 15:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20251025162858.305236-1-yury.norov@gmail.com> <20251025163305.306787-1-yury.norov@gmail.com>
In-Reply-To: <20251025163305.306787-1-yury.norov@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:21:52 +0100
X-Gm-Features: AWmQ_blu3pKz5p6Y6BNpnAz7Uh8TYZgX9iuMKAedvYHIEM1RmEe5NceEsDx_Lp4
Message-ID: <CACRpkdYFqjrOb1nySjvQH7xFFqp7=w_gAz+kxpkT8GRMWU5Xkw@mail.gmail.com>
Subject: Re: [PATCH 08/21] mfd: drop local BITS() macro
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Cc: Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_152206_367633_D5813512 
X-CRM114-Status: UNSURE (   7.77  )
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

On Sat, Oct 25, 2025 at 6:33=E2=80=AFPM Yury Norov (NVIDIA)
<yury.norov@gmail.com> wrote:

> Now that generic BITS() is introduced, drop the local one.
>
> Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>

Nice work Yury!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

