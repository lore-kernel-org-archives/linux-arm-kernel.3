Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC79DFCC07D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 21:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhG9hJVGCwxvhBOCI8BEdtl9CEQQcCjqSQegYbtplPY=; b=vY2Hp6u3GJXfzkvCBGuVmXR0+j
	x/STjIWSo7OVXYQM63Sho3XupgOJFtcKh8ajBnpzpOK3Z3T8ICVnsCeoi7C/zyE5p+dssmRu9ZSpL
	uWszHmFnAZQj5ZPNm4YBu5qcKaW1+y5+X48rwNT2D2SXbcXuG0G0YbgFzQlITPt9LHb0dLdpKY48F
	1D5O8lfQaSgeMb7g2jhX/UWucuzqM3/jPCACHn4Th8/Vgw51AaZsBUxwJcBAEOE/HyCduFbr45zNz
	QJxC2UNxx4T9l/jfMtYJYxwd1akvCDSDwKpi9rhQqZh/51XYc8w9BXZVYZbwEnbWYU5O0i3WX4qBQ
	RB0awuzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyd9B-00000004YU2-3VOT;
	Fri, 06 Mar 2026 21:55:50 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyd98-00000004YSW-1A4A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 21:55:48 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6616cb8c80cso3024365a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 13:55:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772834144; cv=none;
        d=google.com; s=arc-20240605;
        b=kCg3RwnMcGq0D1esiDzOyCg5f7TygM8aDDYBvB4yqRMlX/DgJgS0sOPa/ICCNzfzge
         O8cLu6s53rquQaPitK807W+YWGxgNZlKj348O23keBUnwzKFs2/2OvFHZ+wb7n8ayEdf
         z/ot15ACt5O2+pmf7U57dmLVKYE45rLIZfSH/50PpsGFVWzLnhguay23ihofs3AMvwG8
         //c6uHXEh98/mNcfDtY8FwXEth8ABodZv14l5SnP4YiQR6CXlXSCgu0IsUm/2OVqZN/O
         NUT1dCYssE54Hg4FPhDG7GNIjMap7YBcDJHLAYOLi68MGB+ptzl9opZW67CF43+8PfMl
         8Lxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xhG9hJVGCwxvhBOCI8BEdtl9CEQQcCjqSQegYbtplPY=;
        fh=IqQJVMiZA2SSk0GzS84O1gtFF9+OL+9JE+NonnMPOxQ=;
        b=ecrujAQ5Qn/9sPO4dF6897qZhEF9x1o0rK7uWboPqrCrWkeYnOp5o4rHKqW7tZqDOR
         XSRxO4sXkeeh2VECM0nXrbXxyEFKUe+mKYU67wbfpxVEvirrVIO+MsJgbrp0IsXK1mQy
         +VWzvKksyAEhXrTnAf0coGap1VKsEOXXGWHOJN8mjTHXr02ev784UM2sQ2OjAhkvrI/1
         j1faTwhVdswjkBc2ypn3Ua9qXFVQpwthtuytOrLd1jEGj3dKd5HygjXdjyl5BMW6IZFA
         UI4qCXcR/iHWMs/IcdTHHrWjgjjgm7q+FoVAB2uH1YQNemzJT83wNlHOIXvtBRPeLRwc
         hoig==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772834144; x=1773438944; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xhG9hJVGCwxvhBOCI8BEdtl9CEQQcCjqSQegYbtplPY=;
        b=as/riYvRnHQ4W1dyxJUEnQmsITV+20RwtZTlXQRMSSFTkPI/IBECdPSsh/+fCZhRNE
         NgH6UBBpsFvfxEEyM2NDtdkKuS8jsD/IvxvUt176jIC13kfRyJkbCMxBJb/sUWmsR5YH
         m4ku16yGioJ87t+y/A0snxg7E6VIQgV9A+LQHEFf7wf25plaK+/Hkc7y5zADgFgNHkKY
         dg5wx0lZz/KYCzL8Z6c4I2gTsqY7F96ZjhzLLrpBb9DUgB5VIxj8vvfsPR1Lk9oNxyru
         jNfYt/T0LPMaXlqfIySYih3TJ8zl2DNmumgs3gvRsyUIqFsS5V5Nn1gLXsPWd0D7+MY5
         l/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772834144; x=1773438944;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhG9hJVGCwxvhBOCI8BEdtl9CEQQcCjqSQegYbtplPY=;
        b=WvW9+yhixWxPSbEZXg9EQK8AbawGJMbYp0psLMSz+oxyY2wVEHlz/fFZeV/XbQS56O
         e69sliRafGrSLe7p2Q9RUwBRdyleamt7UGjow24w+Zws16TPuAyTeG5fKUc6q50DeiSR
         RVL2UkEYLA647xI3pmeQ6BBKp9R+J1FNiLvtXj1Y6T8k0KlMKW72eode7Coem8c1pt6f
         KDFzZrujgJS4vh+vsB+SwX7e5EbKC+KRCADdE1cx8qL/np9nQhr1FZBwwYmKf5vjzJd2
         Mm/hQ0DWHnSpFyxZAnDXgbiWC4xDfOxvy1W+j++HzhjvY+2jMjyaIjMJLAQ77xnStGDG
         NYJw==
X-Forwarded-Encrypted: i=1; AJvYcCV2I6jft1Qt8jUv4QSJTTkhV/C/kwAb9B+F8Slvkmh2UFdLmWgYnhd54Pjt8b424QiunVDHQaZlpjSP1rcqvhUN@lists.infradead.org
X-Gm-Message-State: AOJu0YysNegVfYwmB1YYe3ViXgJzyb38ndos6IMa8B83Ppfjuw6cyG+p
	vRsHdpdMQybqACqZhyad5xKic71pYqYTDs5OJEor/K7HMkJ5gFaJcIVnJNzF4ZQfVIzbAGBacEn
	QcadoN/k8dGrLmqqo8DCSPsLrdCP4j3UEOitgKb7R+nAMYP/ilL2mndI=
X-Gm-Gg: ATEYQzzo30WlX6ZlTzXkzCrgEjn7576fcqF0ooLDQXbeFS8eeV02WG55w8EuD0nAw/d
	1We0xcXXbs8E97fT3nSPqVdqys2vHTHbjAkJ4mQIZmdKbQgQKKIfGdwb87h0yFABJN3ni/S3Vpf
	2ZPwa2eLpSbAl0MBQpBti62akuY8+NWOKkQ60TzU7SC9FczrRP/CaqGfnsdXPsvVG17EhkMwx9r
	yCITxBC8GNWoLToSXzfBRzdoq3m+rSbk8V9LywcabI9RGRdZWA3FUL7Ex/Oeo8X70ykD3DuM+bG
	T6zZ9uZSAR/qEaP4XCYnqXQaZtt6g2khxxMlu8cvPQ==
X-Received: by 2002:a05:6402:270a:b0:658:b837:7953 with SMTP id
 4fb4d7f45d1cf-6619d4d3cccmr1959565a12.12.1772834144140; Fri, 06 Mar 2026
 13:55:44 -0800 (PST)
MIME-Version: 1.0
References: <20251202093613.852109-1-youngmin.nam@samsung.com>
 <CGME20251202093028epcas2p456b6a2bfebfc76384f706a9962266fcf@epcas2p4.samsung.com>
 <20251202093613.852109-4-youngmin.nam@samsung.com> <39a6dce9-ea6e-4a43-9bbc-54d822118db4@kernel.org>
In-Reply-To: <39a6dce9-ea6e-4a43-9bbc-54d822118db4@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Mar 2026 21:55:33 +0000
X-Gm-Features: AaiRm50JsSJm1gZbJFNlFIJjOXEWjxFKWFy2GaNbHIFXw94f1BU7JG5q4xDsnDI
Message-ID: <CADrjBPrLYx=Se8bLrmm+3UEhvsr9Wm0tUi7SLyQnUYa5yPV_YA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] pinctrl: samsung: add per-bank FLTCON offset to
 EXYNOS9_PIN_BANK_* and fix tables
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Youngmin Nam <youngmin.nam@samsung.com>, s.nawrocki@samsung.com, 
	alim.akhtar@samsung.com, linus.walleij@linaro.org, semen.protsenko@linaro.org, 
	ivo.ivanov.ivanov1@gmail.com, ryu.real@samsung.com, d7271.choe@samsung.com, 
	shin.son@samsung.com, jaewon02.kim@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_135546_347001_A672380F 
X-CRM114-Status: GOOD (  15.62  )
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

Hi Youngmin & Krzysztof,

On Sun, 28 Dec 2025 at 11:41, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 02/12/2025 10:36, Youngmin Nam wrote:
> > Several Exynos9-era pin-bank tables were implicitly assuming that the
> > filter control (FLTCON) registers are laid out contiguously from the
> > EINT base offset. Per the TRMs this is not always true. FLTCON can live
> > at a separate per-bank offset, and the current tables cause the driver
> > to program the wrong FLTCON addresses for some banks.
>
> "Can live" or "Does live"? Adding unused offset is not improving the
> code. The implicit offset is fine, if it is correct.

I saw the same issue Youngmin outlines here on gs101 SoC. The current
implicit offset calculation sometimes results in programming an
incorrect register (if you're lucky). I also saw Serror if it turns
out to be a nonexistent register (which kills the system).

As Youngmin mentioned "Exynos9-era" in the commit description, I
suspect (but can't say for sure) that all the SoCs mentioned in this
patch are the same as gs101, and the implicit offset calculation is
incorrect. IIRC this code path is only triggered on suspend/resume
paths which likely explains why nobody noticed the bug previously.

IMO, resending this patch would be good, as it should bring these SoCs
one small step closer to functional suspend/resume. It's probably also
worthwhile splitting this into separate commits, and adding Fixes
tags.

Thanks,

Peter.

