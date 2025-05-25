Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5050C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 May 2025 07:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n6woNA1KAB7A7cPpCh7C05v8CU7LoOLG7R9vYiUjRdA=; b=IZGhDhX9OYsiSlS56TtQLiPw/r
	uJ7iJcflkVFfkWGdFQSagtpD8EycIRbMVUPs/qyT1UgYfhb3PW7y3SSicqdlaXC9c5dXPxQAX1Tby
	NLkCIlN52c3NixKetZzXiwmrWqmBWwzAQ3CsjfutfhtCdp2lR+xpZpe3t+YD0KmX4DP6B/o/yWaZE
	pFGKWogL6dd5l8V+SNgk0Ra2sQJ/PwruSfG7LL3PW0mfU/ODYuCR9mEz6hpXFQjXuG/ldJs9qPNF5
	bMU21kvhJhl6e+VRwswxNbfYzpoq9P8yguEp0D7Kkc52vz/46ud/k+bDZAM8h+B6rqszNWpjsKNCv
	89lXByIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ5Mw-00000006ePx-2GO8;
	Sun, 25 May 2025 07:02:02 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ5Kr-00000006eEw-0Mzp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 May 2025 06:59:54 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-604f0d27c24so535555eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 May 2025 23:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748156392; x=1748761192; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6woNA1KAB7A7cPpCh7C05v8CU7LoOLG7R9vYiUjRdA=;
        b=uSWhFn+oti6LasmiDIpnyrsG0B9QLygqVCsaLcQCvhwwtoE/K26MUQG5En5ulm7IDu
         PKxW8sxRqQ9y8EL+7YA5JQHe+3Y2M4aY6L6QCO7uZr43fZcU2xIlWJXfp8drkdIXO2e+
         /X5hXEn/6dwouD8KqnJIcAd/+9jOg92tyMjKUBTsJWVBuVZO444ETG4dqmxRGBZyWS88
         h9y4KzXMo3dAopUzkeBe+yHxsKxz+7FVc5ikx4XBK7jLJfA8mjL5gQ4+wnRXvk+h8X6e
         mprqG3ULKQZAslG3MbMyghyIC0zmcYnYW7dqImUPMTQygCPHFSXcfL5VLpdZI4EQiBCU
         8QcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748156392; x=1748761192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6woNA1KAB7A7cPpCh7C05v8CU7LoOLG7R9vYiUjRdA=;
        b=VKntVRiNddyF62rprIx9Ax1FThlki6M0c0S/a3Zfmqlqi9m1ciEYpv42RCnL9+zS00
         jHKX7WEmeSCIERYk5pO7xBgsFgIQmdcdHFCgvjr3vAGSEUs4/PgtWPqxNLedgC8xgBo0
         KtvF72xYS2pTI8HvywpZ2d7lWzNoJ6DmkQFV0ZxGRVchax2j8Iw7jgZcWAYo/2xfG0yE
         RTaniyo1/sg/cZM2q7yCWpFy9TwThxkdDxukelQj+De1E0MO8mWJauQaCUu8rMMRVcCb
         sl/AYSpTBmAEhknqsKNrXjecRuoz9s9eEk9k5Io0dI3Xi8D67nuHuf2k4i7nu7JxPX6e
         4UPg==
X-Forwarded-Encrypted: i=1; AJvYcCVX9XRYlQApdW5CoyLW6jb00Ii+BjnEDY4PSSw0VRyEapi5npxQSNN8DYDkl555eSmYZt/wGaRQTUo13IJjtisr@lists.infradead.org
X-Gm-Message-State: AOJu0YxziJdyRNLL77obQQ4XOPQyl1tKvn6lCEvJ2XaC3Ay802+lC95f
	a9LQV7CWFDUPcQdrIYV+wjS1frSb9L57NCkzQVXNPG9HZq2ErDLYhzOiiM2VIJ3rNFwzYub7iOp
	FhgRAhcmFUlGfsOCK6EuSQDYeoGt9YVMojg3Ern9JSg==
X-Gm-Gg: ASbGncvtDwoCuqaL7ftaOM9Brr7Iutt0hToCQOtC9is2N/Zp9MnMe6FNRoPWgK22Bxe
	O6C3vzzfjbjup1IXyJOcmDFIJ/XQGvcQFteaYeRHwgKyqoeJVtRIxhAogQVDmlB10AHu2dkh1fT
	uaG+s3r77Rdh1thsEgOKKDdfOZGV8tnalpJqsFbsLYFQUu3jDQ+CH9M6lcYbxbhiL+Yw==
X-Google-Smtp-Source: AGHT+IFgDLGOtCqohcdRalUhWXVpC+KpngWsK/Rw8iIAXMgLPGD2nNaWQvQPUiC4kmvZXurqEyjrTqM9NmLsfftktkQ=
X-Received: by 2002:a05:6820:450a:b0:60a:bee:497a with SMTP id
 006d021491bc7-60b9fa62424mr2365200eaf.2.1748156391776; Sat, 24 May 2025
 23:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org> <20250524-b4-max77759-mfd-dts-v2-1-b479542eb97d@linaro.org>
In-Reply-To: <20250524-b4-max77759-mfd-dts-v2-1-b479542eb97d@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sun, 25 May 2025 07:59:40 +0100
X-Gm-Features: AX0GCFtzlZ4NN5rM8kQ4Ddqkxfr236WnLwsk7oYUXbS3dPkq764kPsxxis5Ykos
Message-ID: <CADrjBPr2ie+6vNZK0oUH75whXDqX-oXdOODcrM75gMc0LmxoYg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: defconfig: enable Maxim max77759 driver
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_235953_141006_3022A244 
X-CRM114-Status: UNSURE (   8.89  )
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

On Sat, 24 May 2025 at 06:21, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Enable the Maxim max77759 as this is used by the gs101-oriole and
> gs101-raven (Google Pixel 6 and Pixel 6 Pro) boards,
>
> The child devices' defaults are based on this MFD driver's state, so
> this commit enables those implicitly as well.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

