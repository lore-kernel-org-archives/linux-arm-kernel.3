Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FF2CD1292
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 21:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfBxOPKy7fDifZhi6nSzMhp9yBd8dZHhu1E69GOcGH8=; b=FbUYx6AaSDiKRxG/tv5fmGT8EB
	BhjfZu81aY0hBTC7r9ICs1T5dBe5vjfWAE2M3xvLe5lr7qCvL4VqXGF6tbBctfxJ8SW2V2bPapY+E
	cYByicqAqmJSWHObRsUicKxFcty3hGChPkftoD3WTrLDj+cjmqyiLUbLdS42OJwjjT+Zk95dSuGwR
	o4qx9YTz0myY7x4WqtZLAZpVyNEQKIFYm9QSAlvSvClciA6ZlahSfNlKyMOk63xbZ9ZcetDWv9D2U
	IeFUFGDLUTZm6kHRMz4KEuw+RuYBsaN+kC5W5qSPrmLInbPvlRWuAprJsec2hzTvfFhWLZzwARGLv
	/In3hDCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHq6s-00000003Sm8-0aOW;
	Sat, 08 Nov 2025 21:04:34 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHq6p-00000003Sku-1xrN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 21:04:32 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7afd7789ccdso1739016b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Nov 2025 13:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762635871; x=1763240671; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfBxOPKy7fDifZhi6nSzMhp9yBd8dZHhu1E69GOcGH8=;
        b=RETtWwxx1mMS/E5l7xqeaA2qUYbtSMhf6OvLlhs1uabqs4rdXdsgLEu5iS852sJ9wp
         /ttYlBR4KQclnFYudkLKhhNxuhAMZQ2tpruQoQwODiDCLW1mmEn9pIK3jMSryvng3deF
         8/2zswzH8WsPKufd7583U8u0VASRmZUKuwapa6Z+dx8RmNe/4hOc4VFKgP8nVMxwXiOU
         FAMNBwmblCHaxdtdpmDK5o6GdYlLUVWOOMwP1hCsA21vf4076c9YyaOU00fNaAA3CN0Q
         SJvSoTHWGqKDgfqmFSiOXXuOTjvHzb8CzmS24bPsxmbioCkuQT/qRgvy7Vl6Kekgn2gu
         jhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762635871; x=1763240671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QfBxOPKy7fDifZhi6nSzMhp9yBd8dZHhu1E69GOcGH8=;
        b=KfthWDKKWxB6jGGjfynORbE2T8IM6xQCNJ51++wL9TbIQMkGeQ+9OcNdrpaIAITbb4
         /mQBIy12kMejDwYbVWMDbLlLyOURQiC166Ssp9wT+HXiV1O5LgKfX2bmWyZnO9/wOSgB
         HTVo6LedZT/vqc2WfjpSzvLQaudjFcczNvAMgCjiEOvJQV2G9VnxKEAtLmbmCanW7Vh3
         88EwDix3fiRZBe/1OGCSHHNXRymLOy6SS/crAcuU+HmjLQRle+Bvazj9vj+3aQHpqfML
         yviGnWisU3CRXQUYOrd+YA6Td+v51b4ABl8p2RP+uIWdyjeOR+6EF6azgor5i2/QUF94
         yc+g==
X-Forwarded-Encrypted: i=1; AJvYcCXTj7DXjxZA4IxKBG+b0IpfMfb8n8WmYWR0sdh21YajITkkf8xXyJKP/G5PSyuVDW+WXn86D+SQaVcLkfb9p9ln@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6DFDkqsbEGQ7PtEzOzl3+sxatAWVeCKai0gydkvIuuj0x0plG
	ACbgQA8ZhRgEmf6m/XDpAnZm6nwKi5dfcVIh1eYcINyeJKFuZ2MUIS/mhNwT1RV+GK5fEXFZ+8a
	8jSRUVA/5eSLjkITp+DFKVF4AO0xlvDk=
X-Gm-Gg: ASbGncvKFyBLoBkF+/1MSIVEyWD/iff+65xeAuVoo3CV2AstqKr+oQthMadb5vzBNND
	LPsAU46tXTz1DhgvszrfEk2W/kOZARlXy4TJSqbN1sJMFBlORNTPY9jJ7HgiW4ywc1mMOFp/obK
	q636LFxgs1d289eNfTRyRUnwHu75YotakMm7Rv1ys1S7BFzF1iTojvRWaD2iXw18dYz30gVB7Rl
	M2HRR1hxbTN4ktZk6J6hkPw07LabGM5hJfp7UQNIbQmt0W/mAcnlF+ddl2weYQ29Ubtq9yzoZ1N
	nc0Q7ut+vR8He1I2s3lvm82A68IG
X-Google-Smtp-Source: AGHT+IH7CCB9+sHT4Gkgb/MZHAPPjHtlGiNAPQ/L76vDJz380AHMHqeGOPDuOGCkaP2NZNwlmUNoZ72lWfi2Lh0v9Ds=
X-Received: by 2002:a17:903:1109:b0:24c:965a:f94d with SMTP id
 d9443c01a7336-297e56df7b3mr51858835ad.46.1762635870574; Sat, 08 Nov 2025
 13:04:30 -0800 (PST)
MIME-Version: 1.0
References: <20251031-optimize_pll_driver-v3-0-92f3b2f36a83@amlogic.com> <20251031-optimize_pll_driver-v3-2-92f3b2f36a83@amlogic.com>
In-Reply-To: <20251031-optimize_pll_driver-v3-2-92f3b2f36a83@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 8 Nov 2025 22:04:19 +0100
X-Gm-Features: AWmQ_blQKnrslPLjhIDEU0j0xcOWcQJDgXAAfDygmB-XCYvmXNGV_pkvKxIws4c
Message-ID: <CAFBinCDbx96byeCvLY-Cq2d7r4+RipUVuER57mz1zZ4fgqRd4A@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] clk: amlogic: Improve the issue of PLL lock failures
To: chuan.liu@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_130431_503426_926CE511 
X-CRM114-Status: UNSURE (   9.75  )
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

On Fri, Oct 31, 2025 at 9:10=E2=80=AFAM Chuan Liu via B4 Relay
<devnull+chuan.liu.amlogic.com@kernel.org> wrote:
>
> From: Chuan Liu <chuan.liu@amlogic.com>
>
> Due to factors such as temperature and process variations, the
> internal circuits of the PLL may require a longer time to reach a
> steady state, which can result in occasional lock failures on some
> SoCs under low-temperature conditions.
>
> After enabling the PLL and releasing its reset, a 20 us delay is
> added at each step to provide enough time for the internal PLL
> circuit to stabilize, thus reducing the probability of PLL lock
> failure.
>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com> # Odroi=
d-C1

