Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E08DCD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 11:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IyEzb+3XRdRyr37ys5CCQqDn980bHp2Leeui4PMQv/0=; b=K3ei7UUKmsWCv7Vs/Q9fXdKhbJ
	+jqS52ZN0uKqf5HIftDlDlBBbaS3fRj6Kn/ucziRl0nmfhQWWyNVfP25m7XY/627R78//gY7uTDOI
	snJXDpJ9Vg0yh6pzpwbmwbGNqDSeu7m0jsDvkBYTtdUufICJmX83OMklQRZgOqGnvdq+Kv3Vy62GU
	Rwwfnen2HF99UXRBlJ8FAMSbfR2IWJaqKKOUhNv182T76sEIiRaZIeJVQ2Xw3z0WEPr5b9o7pWrD1
	775Odiv66gmfInYEXQV72n0vGC7YjjlKYmDfP1svumBlF3JOGiYujMLywgOzUN8a5uzD28KwOEbD2
	8LvEH0ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV6hT-0000000GgO2-0IP6;
	Thu, 04 Jun 2026 11:57:27 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV6hQ-0000000GgNa-0zhM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 11:57:25 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-beb8a08a6c8so82159366b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 04:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780574242; cv=none;
        d=google.com; s=arc-20240605;
        b=KLqxmiKLNoJtE+O0JS/4aWNm/SL6EV+npb4tMRbTs4IS9GwLMqN1GOL7I0Lm4CB7lE
         CtTMEHWw3ElIt56o6ww1Q+mQGUe2QmnbfJ09JoaaAk8N1hwQGFyfM7gEuOWpxXD1wX2D
         HqWKzHbZyovNk3dGdOHhhYZnQs8RIu67CjdFZZMFhX5bRVvOnwmdsmhNeh65oSg187oi
         FRoFE7H4MdLDMrWkPAYOFMQ3iPUXHWJ7+LIs6oN7yRbei/wTfArdtvI0aOLEe6d1hMgz
         GM3WCVswbfK3OsbVI3mzJHILTTeVXnXWW6es8kda/6h7XgFFYWGcV9eAvpTGR9lalxfq
         SRSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IyEzb+3XRdRyr37ys5CCQqDn980bHp2Leeui4PMQv/0=;
        fh=hSPufcYsS2m6TOOtqjKwxFzZvDQ7L2+VRQesJRJGPDE=;
        b=SC7s9Qjl9DE3FmIL4U6ZCOcobmZCJ7+nGH7DPSGPY7nJaCpRGAH/XxvQWbzTMsw3+8
         e7d7CKZ9+Vca7YZxSX+emeQ722LsdRaClu6FKW0m/ZB/G+pnrkmgnaf4Kk+g+k7sTdDX
         8Xk3vNccwopkNMkWFxUpNW5og/jEudrdiODYOnJLL++I37MXdFqH2OkVfZKa18/oraVO
         Pg5rFSTvg7hQHsWFI7TyqSMYpeWEDxKPLPR3iTS3hsY9eLYpMdoLkdAI4z+DuudBUJ85
         f1dEnBPkbcEEQ2oNm77bUwP2eg0iLlLqMx+A3EIiMLEUneUIY/YEkq23FJ0Te+6EKHFr
         ZxiA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780574242; x=1781179042; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IyEzb+3XRdRyr37ys5CCQqDn980bHp2Leeui4PMQv/0=;
        b=hul8ZqsbTcn002TpJGG0x/2sSj3I88NIHvh3tysIMrdVwo0Aca5g92VkpdRmEy/zsb
         4UTM5+d7CKluCjg4CXhJeArbUTq3u3vG02F+tDqWrA27jY3vOaY6Cnm7ohAbv2ViScBG
         7uVQQS/yFUmEYiA7PPlNnv6BKk1FOJK66YZsXHlJk1UUHgJyC/UB+0C5dLhmxKwEsK8H
         TGq1HEDgyMCIYUXKazg05GMIIOPt5ZhbGfrKhXNtzHePWfJZdc1hU8OtiTQncs2qGXfR
         1dHNMsMpHV4YC0ijgxfRmsPnGokIJrqxEhiu/mXzsYfwoim4JvT0CGnyFDWtcr4hd+gf
         ZPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780574242; x=1781179042;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IyEzb+3XRdRyr37ys5CCQqDn980bHp2Leeui4PMQv/0=;
        b=dgY/xqMKNP5mK+tL2T5TEk/ZunNyDAq3mEeorAS04FNjxNX1ozrSOlciqzCSXDpmSU
         yEdmnevPwMcbkjI/USo9z5Gcub0wio3kdguYymY8/7oPljMC0GVGrME0G7hQi8wX6VVr
         cRFZJ8YgTjH2MnOiKFCxee9rkAizjYhjxC65YuMZjiB5VjyuCnUWcsxjHGaz5mzQFjs2
         exRItW+vEkVsy7f96RVJ8Jdoe6ZFPeJB09oh3pKqifi7PB8oaBREDaBDx1JmSHjWe1Mm
         Cdb1sQFOr1mI8epjReY3l0rXunlL4DLDruDSNEDoGrwDg+0PBiBx/kTdVcrZpsB0b+kD
         fe+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+Bt319+G+U/wCuYp0n3Rz9VFSb8EzjW+Yb2IxEGLoKHNdW74sMyeGK1GRWLcLfpbGsirODnW+LPO2kgfqXPE1l@lists.infradead.org
X-Gm-Message-State: AOJu0YyJMEYJHnANwhBtmY1v8dCHJc8UO7OEL+lW1HpkAyeBcSYgDcDS
	RvYtnbG9EqoQJjXVR0h4OhZ9ROWjGw1MTeyE0G3S5NKsAGQkB6GSX+dntG8/QVDCIO5q1AQOxxo
	kgEC2YdgDPRkijfYyk/qcou8wZdFCGVgSXGJdcfrDz0YI5Cmv+yvJME8=
X-Gm-Gg: Acq92OEOrpLXkNWNufL5LDph95qQprusBtu/NJAcM0vY+x8+1UJqKqvIcTtF0jH5oKs
	ak6Ow0hbavSlzSLBRhF/IVLKZFQ3TwwOsk5C8W48SwrHQxvjpXwUtVT5Qq4QxwTx4S3T/wYErt4
	0KFU/M02JpkH4s4IxzU+suzMxQSSlFbCe1gt5NtVCcjJl/9P3yzCLQiNqDlPjMdZR0zNr7b4AKq
	vF4fQRt3Chzkn4XkyFhAGQ1C57dwic/E3lpKsanHHMCncMXDwfnxpuiqq2FuUwYxAFJGyIkTZZm
	30muwkqRBWrzth53DIqqN96RDXa05prZlB8OJ0a4fwtE4lEq
X-Received: by 2002:a17:907:cb89:b0:bec:fa92:d370 with SMTP id
 a640c23a62f3a-bf0b32b528bmr439481266b.33.1780574242197; Thu, 04 Jun 2026
 04:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org> <20260603-acpm-tmu-v8-3-0f1810a356e6@linaro.org>
In-Reply-To: <20260603-acpm-tmu-v8-3-0f1810a356e6@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 4 Jun 2026 12:57:10 +0100
X-Gm-Features: AVHnY4KWKy6Zaqr6HchCfbtUy4GGigvt_YXk_Yu2tFv0GUwKJqXP0QbORP7VN80
Message-ID: <CADrjBPrb+3pFPFRnufY+wYvu_d4NH5a0ZXLXEju9HB1=Tc3rVQ@mail.gmail.com>
Subject: Re: [PATCH v8 3/5] MAINTAINERS: Add entry for Samsung Exynos ACPM
 thermal driver
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, jyescas@google.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_045724_297463_D31D4056 
X-CRM114-Status: GOOD (  14.61  )
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

On Wed, 3 Jun 2026 at 14:00, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Add a MAINTAINERS entry for the Samsung Exynos ACPM thermal driver.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e8218c2749b7..6a8521270daf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23661,6 +23661,14 @@ F:     drivers/clk/samsung/clk-acpm.c
>  F:     drivers/firmware/samsung/exynos-acpm*
>  F:     include/linux/firmware/samsung/exynos-acpm-protocol.h
>
> +SAMSUNG EXYNOS ACPM THERMAL DRIVER
> +M:     Tudor Ambarus <tudor.ambarus@linaro.org>
> +L:     linux-kernel@vger.kernel.org
> +L:     linux-samsung-soc@vger.kernel.org
> +S:     Supported
> +F:     Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
> +F:     drivers/thermal/samsung/acpm-tmu.c
> +
>  SAMSUNG EXYNOS MAILBOX DRIVER
>  M:     Tudor Ambarus <tudor.ambarus@linaro.org>
>  L:     linux-kernel@vger.kernel.org
>
> --
> 2.54.0.1013.g208068f2d8-goog
>

