Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1507CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 21:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/7GraEMhRfGX80xNeYuFThBogqrpJru9RaOOCG7cpM=; b=HNJWtnHc+l4co5O5QK/EFByM/L
	/1ZZ1KaI//GYaMuZma/SzmckIGxoFC7iMRxN0E/yVz6ZU8/RtpQzx5QCk69eb+MfVHnfQwhZXKAGh
	E+iyzI9dcHLxiZ+HAYquD351hrz+o8fJ2Z8ODJrUXHoOmIws/0H8ayl9VhKXt3ZUFisNqEVn6riLi
	vMhdwUQcqeZjNRotaerHgxz6TXDolhf//tULDLHVBOZYIzgq0gF/km1TAn20KjBt6EWl5TGoAMeTR
	lEvPa7DfsYURUleers3jMmC1UX+JD04bdPRxPb6gzkbzXVhj6LtXtkm+gtsyelPCEeDru5DgosI/H
	qjEn7d6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHq6g-00000003Sji-2G0B;
	Sat, 08 Nov 2025 21:04:22 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHq6d-00000003Siv-2qvt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 21:04:21 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7af73974a4bso1185868b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Nov 2025 13:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762635859; x=1763240659; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/7GraEMhRfGX80xNeYuFThBogqrpJru9RaOOCG7cpM=;
        b=TeRLw1AQ7+mZRJ+PsJtkmXU7tu7GmvggQIuBA+koZh7JAZ3galwLJEJ8vHkqYvoM3X
         KNfFVgzjXuFEB2+WIl4YX6arifasAMuM1ZJlj9r5J2h/FgNVVT9yEJ0ETCyncT2iuOAN
         dXo7FDW3xwb2OtYvJqZIlxJfOqVf7wUDLxdNWbrb+Xygq7ER1xRSnQ2YDP7LC2wPwSPR
         xL8RubCjHkdjAi8RXXwQgoYn4npA6cagzjFWEA1PSA/+79zFituq8+TaPE4GT77y8hHR
         LvBuNZlml30AtdfnPILkkwvg6YDv84Y17vC2AdlJ+q47ddt3lSrBqg5PRojWDRSAhrDK
         vyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762635859; x=1763240659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A/7GraEMhRfGX80xNeYuFThBogqrpJru9RaOOCG7cpM=;
        b=m7azdwAXlzDhdxnOOWJg6F/UpjOiCdhDXZGPp4MU+1lu/Tyxi7xSB4kpZs3dXw3dAh
         YFPhLU6LA1GufE85dWl+WMAw2iTZj/XurcYZO2zqdadNZuo+73NEism4IkoKBvBdmRS8
         1UeFYKfM6FtxGpM2UfJOfduZotyh8oZvCBV31GKmZ088/XbOy88yiUKGIcghr9opd43s
         yvV+Dui8c34YoC0xfexxi5ivYrOmhTOzS85wrC2h0TgCntfwefS/o2LknaYrIfGAGsuH
         iNq/L3yVc/XntJ6yC9nBqXoAvJv1Lp3UlxhlTGjOxXivfAkBXh8YOV94ibtlXDsxsVlM
         3ixw==
X-Forwarded-Encrypted: i=1; AJvYcCUAqqiLRcw88CeSbTNVQDdCqGGaZFYZnUTkDKRZ5ngnvSwaI1OrmQZAGn6CK3duFbs0PbzvnNFXymyfwa4ygRjV@lists.infradead.org
X-Gm-Message-State: AOJu0YxAYP4iSbY6Ig5pYKCVDK/Bpg6JEYkknupZJ4nzHTBYqCJRcNca
	kZunDYIUuYIOzA1Mm7KgM55KsL0bXLUkxWNqFcQ2HgjbnyShW10S0QA3vFX/cbVi0OUBSPN8OVu
	7wj5dYjqCDOa4I8O7jDBbalKfIr1/ds8=
X-Gm-Gg: ASbGncu68r/C0rxI+t82y2jyKOQAPRr4Ew1BJfgvLQm/ytjH8AF9J2jRcHVdbEuF28b
	FSuTXAv6jMgsSLBAFxGxlJkMgxlmUVTmYpbxmnOLD2YaO5tD0ZwLKJoe900GAuQmx9bwFp5tyx4
	veo78gIIirUprRIfBXJutPqxhd/kiFDURyhMxEdXe+JBwpoyV8C2+tdOB/jmDIYsbHXMiakTihE
	CPVwxSq4IlQYD38sWzWLzTFYH22F2Aizcjq/gaNUTgLXBuIHBgmyh0ljJWdfhKUlU6w2zmCiTPa
	3LX+McroSLXEEiI5dyD6QRLJCQQ7
X-Google-Smtp-Source: AGHT+IHYseG28VeVAj+noWF9xeZjKVsK8sMaLAuq9kZaFRIKXzdbOlTmekGRfg/kBIVHWNLoWwy6INlqqqY7HWNBhaU=
X-Received: by 2002:a17:903:1a26:b0:25c:43f7:7e40 with SMTP id
 d9443c01a7336-297e1da7480mr46581775ad.10.1762635858817; Sat, 08 Nov 2025
 13:04:18 -0800 (PST)
MIME-Version: 1.0
References: <20251031-optimize_pll_driver-v3-0-92f3b2f36a83@amlogic.com>
In-Reply-To: <20251031-optimize_pll_driver-v3-0-92f3b2f36a83@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 8 Nov 2025 22:04:07 +0100
X-Gm-Features: AWmQ_bmagaCbCEB_Hmpf3J-UvtRMuC04_pkThYtgGIcc82yezqw-vegzX0N5NQA
Message-ID: <CAFBinCBSjKzHZ_k+c70B+YsJHiOS4qbjAgtnWaEeQy11xg94cA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] clk: amlogic: optimize the PLL driver
To: chuan.liu@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_130419_736916_C3BDFF8E 
X-CRM114-Status: GOOD (  15.49  )
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

On Fri, Oct 31, 2025 at 9:10=E2=80=AFAM Chuan Liu via B4 Relay
<devnull+chuan.liu.amlogic.com@kernel.org> wrote:
>
> This patch series consists of four topics involving the amlogic PLL
> driver:
> - Fix out-of-range PLL frequency setting.
> - Improve the issue of PLL lock failures.
> - Add handling for PLL lock failure.
> - Optimize PLL enable timing.
>
> For easier review and management, these are submitted as a single
> patch series.
>
> The PLL timing optimization changes were merged into our internal
> repository quite some time ago and have been verified on a large
> number of SoCs:
> - Already supported upstream: G12A, G12B, SM1, S4, A1, C3.
> - Planned for upstream support: T7, A5, A4, S7, S7D, S6, etc.
>
> Based on the upstream code base, I have performed functional testing
> on G12A, A1, A5, A4, T7, S7, S7D, and S6, all of which passed.
In the past I had most problems with Meson8/8b/8m2 CPU clock scaling
(via sys_pll).
So I tested this series locally using the following shell script on an
Odroid-C1 (Meson8b):
#!/bin/bash

CPUFREQ=3D"/sys/bus/cpu/devices/cpu0/cpufreq"

echo "userspace" > "${CPUFREQ}/scaling_governor"

while read -ra LINE
do
    for (( i=3D0; i<${#LINE[*]}; i++ ))
    do
        for (( j=3D0; j<${#LINE[*]}; j++ ))
        do
            if [ $i !=3D $j ]
            then
                echo "${LINE[i]} -> ${LINE[j]}"
                echo "${LINE[i]}" > "${CPUFREQ}/scaling_setspeed"
                sleep 1s
                echo "${LINE[j]}" > "${CPUFREQ}/scaling_setspeed"
                sleep 1s
            fi
        done
    done
done < "${CPUFREQ}/scaling_available_frequencies"

This has been running in a loop for two hours (at an ambient
temperature of ~13=C2=B0C) and I haven't observed any problem.
Since most patches are a no-op for my case I'll separately reply to
patch #2 with my Tested-by (as that's what I've been effectively
testing).


Best regards,
Martin

