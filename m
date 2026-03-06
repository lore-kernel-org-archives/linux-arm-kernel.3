Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3FAF513ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 02:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ycJdScU7VQZBgNX8C+iWhq//vtAo4EZ9U6PbAPueQDA=; b=CCHuuqxMqhrNkJiNEHdIIXMzog
	FoeKUbcCi1S9sLicR68nhPslfWOeNhkI9MmxkTYGABGlWRBThOPJlh4ANEP3i1yZANO2FEO2OFytw
	SYie4Pva8ZA7eoDvGf1lI9UTS6j34Hyc4NG8KCJi8mpXK1ohEvzDszv/J3Zhv2nWOIXh0kD5fEfoL
	hfml30Rsd8Iod+fw6k3l2c1CGGptEJkU2btqTlNKmTRLsPL0x4xPSYniPiq7M14uNdgaKpaQ+mJ+x
	12F0YAXMwlGx+0Ew9VLFqRZRamrJqF6/zgEXinvO8HgVboDOGT/6FyfdCVhw2MfHRU5JsSAUwpywr
	CVnqA+1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyL5p-00000002tZR-2eNc;
	Fri, 06 Mar 2026 02:39:09 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyL5n-00000002tZ6-0gNe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 02:39:08 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-38a2cc31e20so33893011fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 18:39:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772764744; cv=none;
        d=google.com; s=arc-20240605;
        b=dIHqHQ2hwsc56EHwclQgj8Oq/FpE5p1fQuq7+3RFLpVNZtYsVKj7Uo67h/NuBVtnmI
         aepdR/lduEBpKMOJ1OzPL5BQtSFupJDnAm44UOJu7cPsvc9zXjkzIJKNyegXyEo4vMrv
         Eek/5wE6z6ewurOuq7AhFdw0wlmquelbIDnViatFKclCrVtJ5ih9vY8H1Y9pddUFeTN4
         v/pgjBpSlHilyT1jPFPREoMceIAX455ELkBJY66MCQKETWg004LJqTv7t5/FddV+tkYU
         QwaYsa/nj6a0/Qpnz084/EBoGuNzEIdcdOUuEtcKPeIEym/I3Zd5+0Sb3uOznlO4d1cS
         nAHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ycJdScU7VQZBgNX8C+iWhq//vtAo4EZ9U6PbAPueQDA=;
        fh=qBZGSEjZ0Pd0C8mqbXfiJICukz1oWcUXGW5n6BaW33U=;
        b=fm3MTQ99VcrDMxzRF8QBewrtjAl6OUwu8xObMXpuhVDdnTU3Lh9jV0cIRpig/46yos
         ZicXbkvI1JeOs/JXE0R86abm1/hcbdQq+qFl60uqAgWV71+xCHCeKWk1JUM4wGEMD4NX
         PWWB71i0qNDaOe01qOO/TXg9bNF8M/x0xqE0fJIOSEL2+XFzdIlvJF+j08UTzJqaku/p
         msxTo+aC4lXlfRaWnCVRz0I9c6SFobz8BiGmqWE/uLKNY/KvL5PqkcaJNtJuvF5oJnRH
         mSzEflxu3IJh5U5pR6yP76QHvtTx2xSt/WXQ9IotFli7nJT9UfVK0OtX6g2TOH0uRZW+
         OUAQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772764744; x=1773369544; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ycJdScU7VQZBgNX8C+iWhq//vtAo4EZ9U6PbAPueQDA=;
        b=ItYgvqcCSr6UaUCOY9LwuzpQrg1CRTR8MRD6g5jJcFQVWyQTOW/vHjUiep8LUkaeD6
         K01EEFQxqiG9unvde0kYQKqTbR2WGVrmGgy8t8ah40RVTsQHxzLte4rr8/lZ+9Mfgn+W
         5amw+SmVOfZSc5QUQTvGaCur+5SKcdl6roav5SR83zKZrsK0Kc4ZvQoxFIC9WYeqxMEH
         6F0IyhndSA4zqOsxJMuPH5kqPP2tOw704DrlO6U+izFAtEiwUtMFeIfe+RfPi2x5I/tQ
         gKqcPH1fhDaj1+8VbRP2GWdY4fR+B6WSMlYWbxXYXJBoDydde2MwRfcBIfn6BSF85430
         yqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772764744; x=1773369544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ycJdScU7VQZBgNX8C+iWhq//vtAo4EZ9U6PbAPueQDA=;
        b=XNHuwLjxhOpPmfRQhLpSjcquzyqhGek6mhbCr048rmGCtQLflj3gNkYXRv2rxoTcvs
         zbkwP/cOhV/sYls8unxEsIKlw5myjIvy967hbpkh/Ao0PzjYggYDfAn4ykuBJk+JSrzO
         o6SRsW+8xTwHZe5oD8UkYjYhPN47fjGyoUIso5wCGyk+arW+eXSnBVe7ve+KvzzQPt1J
         uJfuMzAXta2LUIAvM+8i6vYU2oP43l8Sg1yxSvPWWYLnaYJzuh7G8xkIjBQ/bGIlDLP+
         qfviLyQA5JGQMjN3SJzpwrJtPkXny/+iQV8gEzMa0WrUetgC9EbLTDMciwhr9+/eyDBo
         9KwQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5OX92RRIQzZU/LlmfCegJkxGJ6ny4SmiJ5KwuYZYCPAsAe+V9uEeRG8sg8ZcplWVkimHlgOboY20POI7fIMmg@lists.infradead.org
X-Gm-Message-State: AOJu0YxwiT2/teZ+hsoJvVkPpAYMxFpwMGreVcK4BCqz7tVmgHJBhTfa
	NeomWREqvNGg1/IXibUdzZz6lMSkuoaYNYWLXwbMtz1hHZnaKVQS1KsXHpN8c6ELu8Bz7Ntnqdy
	0CQ6SSSrrpobXjN/EbXhIttkuAjD91+g=
X-Gm-Gg: ATEYQzwkAHdTpz/UbLsV14mtpyr3IQQ0HggViemJsDbpRj0PE8/qk3q0cgEmrDNG3dj
	0Mjb/SnB4jx5yK7xJTkkXCdBMzaPm8J3RGYAybS2eB3tQHYBWr98auLUitEGgq7N7+hWuMGK0IF
	uRXI5+5MEj6rZU6476dqmJhfeHl9wMvqlyvfagOCNP1cUQoSZL+vTs4fzjJlgnKEstDuJqmCYn7
	hK9ECPBKSm9E/ZXo6we8AAbzWVHo0PXh8KkHDmfs3ooaCb/BuZPz5Fp+enn3q+Rcc8qCYE9d40W
	w+8PTIt81NYb9Zmm/VJfJrWhI71PM4HyA1N8p4JfsHKZjeqGm3WsB2pgmdAFFQWMj9MNlXzW
X-Received: by 2002:a2e:be23:0:b0:385:c13b:5584 with SMTP id
 38308e7fff4ca-38a40d6e2a7mr1475161fa.36.1772764743976; Thu, 05 Mar 2026
 18:39:03 -0800 (PST)
MIME-Version: 1.0
References: <20260306022406.760-1-ming.qian@oss.nxp.com>
In-Reply-To: <20260306022406.760-1-ming.qian@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 5 Mar 2026 23:38:52 -0300
X-Gm-Features: AaiRm52GfF-aVTbn8TmD62YiOKnhcu-hzGhY6Qwg2C8seTj5WNPRzZ_mAb4wZdE
Message-ID: <CAOMZO5BP2aLD+a1r7hVd3F4Qvfovxb8PgQfzcVRKknBHWYBmtg@mail.gmail.com>
Subject: Re: [PATCH v3] media: verisilicon: Fix kernel panic due to
 __initconst misuse
To: ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	nicolas@ndufresne.ca, benjamin.gaignard@collabora.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org, ulf.hansson@linaro.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, m.felsch@pengutronix.de, 
	fra.schnyder@gmail.com, linux-imx@nxp.com, l.stach@pengutronix.de, 
	Frank.li@nxp.com, peng.fan@nxp.com, eagle.zhou@nxp.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_183907_246304_8AD8269A 
X-CRM114-Status: UNSURE (   7.02  )
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

On Thu, Mar 5, 2026 at 11:26=E2=80=AFPM <ming.qian@oss.nxp.com> wrote:

> -       { /* sentinel */ }
> +       { /* sentinel */ },

Drop this change. It is unrelated.

