Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B16FCC076
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 21:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y14EKX3r2NZEaQlK0jcqQywAmjLktS244ugWnhJ7Cns=; b=w/4sB0OO5yw6N9WMaveyYlKHym
	tfzx6Y7BVDFk6nukGrFSISsnXLJYvwsRZLIwqafImRLUaFm78PEeasb3EP1rUAaTkE9YDuGtsv9NP
	vbkW55Sd86wogMQTrijIqzQZeXaf2OnQFPsuVQMc45+8KouppmL4hNYbwUv7oa1gB71ab2oMBVvPE
	Ylu0MyiIcC1skCPHBCp17dyDTbmnqlJYPWRlQw6uZNI/xeuTPKoOjBYRSIhkFGY0kwGclM0jCnIM5
	AT/ffdTC/2M0O1sZ1vA7Hl71PZm/KELRVS2++Au3dHZDVzI3u2UcNkIVdnMd8E4uIZVRikK0etuag
	Co53ZzzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vycY4-00000004W4S-0DQn;
	Fri, 06 Mar 2026 21:17:28 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vycY1-00000004W46-45sL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 21:17:27 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6610bd5f322so5542117a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 13:17:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772831844; cv=none;
        d=google.com; s=arc-20240605;
        b=jue1b4vI65wv0IB63KzqGOEgq+xozq0dVhaWNpBik5Z7yNKPURNXfGS5UX9YtWxka1
         3q+RUeEWLmuhlF/iMq3QMcSckTaPL44hp7N+r1rNy8r0Mswm4gz0FyEjpXKLNa6wAVVS
         5/K6klkMbWckxlT/Fq1Bv4S6+lsw1E1V1TTy0YXr4Dgvz7FYEbJGdwNnNKVIBK0fowko
         fo58hLRLkxu6xPkpLrHvRlcG2vGITa7yP2E9Bf8hMrDU4Kjy6AyuI7kAu3IFCz2Ffhn6
         dPmoJQ7CBYEWTsHpK2pulrmAXsEe4IlpvwoE44BC9LsaIg9V3UkOszuVgi+r8L0U0qdq
         XElw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Y14EKX3r2NZEaQlK0jcqQywAmjLktS244ugWnhJ7Cns=;
        fh=2o7PSL4o3V+1kLGaa333DMIeSkBAcMzG2KZUrNG9Npg=;
        b=EARRmB9vWqcHleNJ6p9Rwu4PwoBLWe4uNOOl6pvguOD7Ljc2x/9d0psw1VuVfHmA+a
         MiGc5wp6JYOI/xOUd+GGx97dZMPDuU1tQy7fAbIzYTNmXDLHce9+UeYTSWmmiXqQk/+X
         LzC+7FMr9FvIv1q8UwVoTePTfIfEQvfERNa3LMJsc1QB528AqJtaRF3pWMij1HkZHczn
         QML8Ou+spWAdThYt21Qdae+tyGhx6ZNWMcs1lACBlPAuZ/R7SETjy8JZRTaAOa0uyCiX
         Kpm879pbm62jA/sDjoaGb1KS0hkCgVDjJcOhuDeADb+/9bg1z+3gYmlcsAjgI1oruHHn
         l2fQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772831844; x=1773436644; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y14EKX3r2NZEaQlK0jcqQywAmjLktS244ugWnhJ7Cns=;
        b=UkyL9gXtDfcT1vFLBqy8mYwj2DaK4XkitQ2zZ0MYIkG4/xJkPsnfaqlJ3cqxIe4hg1
         ApKPkejrdc/wkPl4qy70BoZPB0Evg+B2JHlcUvOC+RO5z0PRpS0EcbgEvd0p7ejkpr1I
         vZAB7lVNTz2a7vPcS2eiuuYjv7+4NUH/pWisk9QdhnsP20wjHV01yJyp+DU6VgCRt6nq
         KyUChq1mqpu7IJAGtvyPobDPZzLmR6Xl2g+fFloNB00wijULy1b3wS2VN/muW61A0Hqb
         8F7dKSlpiwBhIcwSgipPaJMA23wkDRiG7KU8z5eclXdhcU5PsxUdrlxZ6Rg5zINjFldN
         ilSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772831844; x=1773436644;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y14EKX3r2NZEaQlK0jcqQywAmjLktS244ugWnhJ7Cns=;
        b=buACOSX8ZTWLPrDHuMgUqPtzhrFbp3QmOs8TtiqNwtAZaXM1PvVBEfE2f2VuC/EUFj
         dR2byn4m08ePRsw07YOr6o3T6Umpv0AHyUJcYoEm9dtX7OjTELbgX+y9HsRpCjdZG4KE
         hPO1r2daAznppz5TZwxGYVrFa6flKwWSj1GHCiUFyUfVlmQhxI7rRer6Kd/xdfQ5b7nY
         /MhQ7LUxx9GBJqRRD+aZeAhNSe2U6x47gJo3H4uf1An5J2k8+NaR65enIHLU0pjHy71y
         fUxW9O8AYmF/za9qhFF9FIQfdfvTNLarMvkYL5qBKxUQ/zPKAxh141FebOEOuXUgbPQX
         nTdA==
X-Forwarded-Encrypted: i=1; AJvYcCUkMWIuAUa3l07hToUBW2UwrhoD93LcC43rx1vnLgl8ihG+WsYA4R3ogY5JF5i4LTOYpGJWZghJRZ0GKDGjO8Lx@lists.infradead.org
X-Gm-Message-State: AOJu0YzfdQmh76FjoijaSe50j8REaOkMSUgMpAU1cz1phrEwPkmzlPmQ
	6PqDKQh/NqX5YJFyTs3fM+XNj+Ktt7Vh5+CxiOwZbyu1TTNj/AtlXHFH8OUjBDowOBrh5ZcUdS5
	ncWfeb5CwkRbOGkYyRcU00g+dWOLfLB8mgNCSftUiFg==
X-Gm-Gg: ATEYQzyWQ093LM7YT848aRqZbyOdYAWvP3msARt5zBD33AIBY/dxVM+k1atIdrAspeu
	0T0e0r6VpkzNizBUtvrO0VgCc9dMwRFBTEjDjOWtSEtmjvJDBpGM48JOKRDFln/rSoYh6Dgus2b
	xJlux1F3wNOWTjeMcqfzuYeCkmAWXT2NYvffF0UyeHdkSwbU/yPuuIPSVJ82AdWCioDiQX215zg
	ITZU4FIy2yo1Uf43qj/0qUo+PzgF9/eoWQjWQeIr2cy+XrY+gaZxSIdVrmxJJsoshsfwZ6wZnaM
	z0LwvMpGGd7DdPgQMjLuePC6Hek3GoGS3P8N6Mj5ug==
X-Received: by 2002:a05:6402:5212:b0:658:3972:3a3d with SMTP id
 4fb4d7f45d1cf-6619d4e398bmr1927227a12.15.1772831843780; Fri, 06 Mar 2026
 13:17:23 -0800 (PST)
MIME-Version: 1.0
References: <CGME20251202093027epcas2p24adbd3226dd50b2780baceee6588f3ba@epcas2p2.samsung.com>
 <20251202093613.852109-1-youngmin.nam@samsung.com> <20251202093613.852109-3-youngmin.nam@samsung.com>
In-Reply-To: <20251202093613.852109-3-youngmin.nam@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Mar 2026 21:17:11 +0000
X-Gm-Features: AaiRm53SUdPof_w4nrcD9oxrYObtPjzHD4ttJpdhJJCx0aq8VDLK-ZgvyeHdAs8
Message-ID: <CADrjBPqYT9h_UJKSxBJ_KMQ4yQv4yyTuHaPYjC+K1-6TZj+PXg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] pinctrl: samsung: fix incorrect pin-bank entries
 on Exynos2200/7885/8890/8895
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com, 
	linus.walleij@linaro.org, semen.protsenko@linaro.org, 
	ivo.ivanov.ivanov1@gmail.com, ryu.real@samsung.com, d7271.choe@samsung.com, 
	shin.son@samsung.com, jaewon02.kim@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_131726_057658_523B8F0E 
X-CRM114-Status: GOOD (  14.70  )
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

Hi Youngmin,

On Tue, 2 Dec 2025 at 09:30, Youngmin Nam <youngmin.nam@samsung.com> wrote:
>
> This patch corrects wrong pin bank table definitions for 4 SoCs based on
> their TRMs.
>
> Exynos2200
> - gpq0/1/2 were using EXYNOS_PIN_BANK_EINTN(), which implies a
>   'bank_type_off' layout (.fld_width = {4,1,2,2,2,2}).
> - Per the SoC TRM these banks must use the 'alive' layout
>   (.fld_width = {4,1,4,4}).
> - Switch them to EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, ...).
>
> Exynos7885
> - etc0, etc1: update bank type to match the SoC TRM.
> - gpq0 is a non-wakeup interrupt bank; change EINTW -> EINTN accordingly.
>
> Exynos8890
> - Per the SoC TRM, rename bank ect0 to gpb3 and mark it as
>   a non-external interrupt bank.
> - gpi1, gpi2: update bank type to match the SoC TRM.
>   exynos8895_bank_type_off (.fld_width = {4,1,2,3,2,2}) ->
>   exynos5433_bank_type_off (.fld_width = {4,1,2,4,2,2})
> - Per the SoC TRM, mark etc1 as a non-external interrupt bank.
> - apply lower case style for hex numbers.
>
> Exynos8895
> - gpa4 is a non-wakeup interrupt bank per the SoC TRM.
>   change EINTW -> EINTN. (The bank_type itself was correct and is kept
>   unchanged.)
> - apply lower case style for hex numbers.
>
> This aligns the pin-bank tables with the documented bitfield layouts and
> wakeup domains. No DT/ABI change.
>
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---

This patch contains some worthwhile fixes for multiple Exynos SoCs. Do
you plan to re-send it? I think it would be good to get this merged
(even if there isn't broad agreement around renaming the pinctrl
macros to EXYNOS9_)

Thanks,

Peter

