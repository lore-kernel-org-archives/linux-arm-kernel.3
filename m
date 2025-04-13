Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533F0C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 07:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6PgAG3a6aJYKMvrW8AKuzg5k+f0sv19sOJ6k+7WMtVc=; b=VcY6mWeQ6LsAJstj4JWuuHdTvz
	9urTImN9NfGZGJOXmOCx4usF42VQm1MijsDmDpjoMvBOCXNIN8faykyGHsHzHdf1bHnWce+DKo+s9
	tltiwWmZb5MZg9epaDRkqzLxTJubQ5Ae0ru+/QgcX/q6MzTE+9BtR/HAWwQeQFHLK18sEqh7tONoM
	wQmk/6T+LM6dYn52tTMJOOrGNz3s9RuVrCgJC2oeV2HcyxckPptZRHHU3ScwashqxkM+BZaFkbuHh
	gsAaEYy0Yb6RqoDZwZupiAluESHNQJiWFhvMU0gFCJ5ZmOk+adXnT44PojHex9QcD2f/nvUrLfQkQ
	5jzBheaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3s35-0000000GumX-2EGN;
	Sun, 13 Apr 2025 07:46:39 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3s1G-0000000GueR-3Vkm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 07:44:48 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-6fed0620395so32594767b3.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Apr 2025 00:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744530285; x=1745135085; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PgAG3a6aJYKMvrW8AKuzg5k+f0sv19sOJ6k+7WMtVc=;
        b=jCHMTv6wRPSL6RLMPgle2WartUCPgJ1R2iwIWcBhTCHE1y9GtsD7UcZS0Xkc3nrlEv
         pOw/c6aa9j2nKuPBFyf3kcFWSfqIsm+fV1o3t1nKKTUwzViaRMKNsOqcx4qg4AFK43dN
         zdPk+c/VF31eU1ToqTtOVgF6O/zwvqwSh/jQocuJxz3UI/NjmRvXuFlD+QKt4KFhL+DX
         azbeqWME3ED9TrO/YjvvN+8CkPgNzptV6tYz6dyl2p1WpbtdKmuBqmOOA0nyyeMUf8d9
         vD8lLyC16+Qau1GZcxIoklvDlPDM8fkEzcNm5I1dqBP+45IAQiStBc0lI2R7d+NYsoWQ
         LugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744530285; x=1745135085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6PgAG3a6aJYKMvrW8AKuzg5k+f0sv19sOJ6k+7WMtVc=;
        b=Y5uzpR75j8SiJkTnvt8vshj88ErRDeo+jBd0D++k9egdBYQMPhNdQh2DOpiiLdGjRk
         Vir87LwFrOonnxEMminPvBKvaZTaBA1givL6T2lP+CldHN3tANw28fQ9RH8QNZvf525R
         YJYSByqPBJF7J1YcqUUNaC7QiGr5nn3Tq0jVZq2CPHG9KUrs7L6OkbbSXoB9fdT1WTMf
         DQbHUQN4Ebl9R1GBUIrHvJnm5AyPVVlbsXzu1irYJMETC1qF8nHmrW+WT8MA5ziIJpSx
         uSvpA+r/E+oYnozSGY6xij1eIqzgxIA0nFyg/QYMjgRGn9eJvsD2DT0GcnHCmPNwV1yw
         lM0A==
X-Forwarded-Encrypted: i=1; AJvYcCUpfPfW0EpXP+G1SsqDe4jBYXwJDeeIjlBpGF3kFZ43sXvw1FkABRd1ap0wXIGSmC949L/ryqsQb87xiVRJkL6S@lists.infradead.org
X-Gm-Message-State: AOJu0YzRpaIqC9GlqNwc/nOFFRQvTh274H4xif+/T/d+yn73ZnW+QDC3
	YKs75iwES0Qu4sYxQ9uhldMQtDiqRrupj3jkWACMWNbCYk0JwfocvMRSq+ov4R0/fpAOBadME6v
	QDayt7et3R9IaNbhWTXgoSXs8rjG+xw+YsQfl8Q==
X-Gm-Gg: ASbGncv8flAXxgPeYyCRBlSY/f5qn+knm2Jt3w5xq2WLnL1Iy3Ab87UqPKShZNwMR8m
	WZKxmrxua0RFCE8ZpDv9XRNtH4RqrXbn1yUcTJ5dEuvfV9lGpjS46FAQMJS9sJNDGUTOpH2GEqW
	HGZ4Es/p5wgXR1O34mOdZV+06BDCX60uNb
X-Google-Smtp-Source: AGHT+IGnz9t1bpI6ER7ZFzI5vSm/FhKtXl++YREat3fVWg6oOd6RaVuGuUfbNcQOUCtjxGSO5ORRRfip1HP9h8qn3R4=
X-Received: by 2002:a05:690c:4d06:b0:6f9:ac35:4483 with SMTP id
 00721157ae682-70559a76bc0mr139648767b3.25.1744530284725; Sun, 13 Apr 2025
 00:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250412193153.49138-1-chenyuan0y@gmail.com>
In-Reply-To: <20250412193153.49138-1-chenyuan0y@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 13 Apr 2025 09:44:27 +0200
X-Gm-Features: ATxdqUFpVa63-e840A-rdLE61fA7hjoSmDEuD2aPKLnud3g4T1J-jN0eIIKeXSg
Message-ID: <CACRpkdaai3M0LXx6RO6-E5QFnXtH7s90Qi+HsudSW6W6tk9vUA@mail.gmail.com>
Subject: Re: [PATCH] gpio: nomadik: Add check for clk_enable()
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: brgl@bgdev.pl, theo.lebrun@bootlin.com, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_004446_894058_F25E5867 
X-CRM114-Status: GOOD (  10.53  )
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

On Sat, Apr 12, 2025 at 9:31=E2=80=AFPM Chenyuan Yang <chenyuan0y@gmail.com=
> wrote:

> Add check for the return value of clk_enable() to catch
> the potential error.
>
> This is similar to the commit 8332e6670997
> ("spi: zynq-qspi: Add check for clk_enable()").
>
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> Fixes: 966942ae4936 ("gpio: nomadik: extract GPIO platform driver from dr=
ivers/pinctrl/nomadik/")

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

