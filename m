Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505F5C021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 10:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4ZmBE3k4+dA0yLJE7EIrqUujBLBu3hVMfqxrFcWbfY=; b=vQ39zadMQzBMwJ2GWrYDrpRy34
	0aSMCGCbtFIj3PG41biWYGz6mzcd8GWMMF53m+cOP4p9sRx7v5WTgFCm7NesAFgYKukMMNN+AKYeP
	FrI6uK3Kk8b9rKpkuGRHxhV/ssRGXf1/XFKcq3OSiJDybIZbTNqtY1bTquCDq2gYexGeiuSzdZvS+
	jqRgiraTlaY2TqCwORpg3IRiJy/40vXxlrnjlb2g/IydKvYXH/OVNCqpbkYgCTvV56gvu4JnR+eQF
	Hpb+hiEJY3Fq0eOYvWiuxa+aqVbyDdlM2OjxqQKe8nFvLjSUeV71GmAvegz5Eh8S6PE4bWk6ktBlr
	QeJHNK3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkhZY-0000000CCgd-2ANE;
	Wed, 19 Feb 2025 10:44:56 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgrP-0000000C1HZ-1uXU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 09:59:20 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-5fcd50841f4so1509987eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 01:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739959157; x=1740563957; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D4ZmBE3k4+dA0yLJE7EIrqUujBLBu3hVMfqxrFcWbfY=;
        b=lO3oUq5weHlByLF08hGSUBgJ94g3Av1km5MNfVX8KXfXM4nSI6uS+iq7Z7vrffGrDi
         9SJ81WqlN6eW/ML4GvXk2p05/fB/o/nphW0apw5BdbuiqCvfxwc+1i7JcKh2vkqBAoFI
         iZ+cPzGchKffsTL79fUCkipqdTJqijFHNgntASmhY8wCiHf3cgBx0uD4OyHmc9QgJy3s
         OnXENys5a78o5cJtwmDcwenn+ubmr086aellqdOV4ejrXby+YHHEh511/ePJs7LE3x7Y
         s63okBq6KW2l07Bn8RKJsR3AvL3gBXIu0ewewNdTroCg0LUbM2xeWOiNBE/R/ur5ZMYG
         smgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739959157; x=1740563957;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4ZmBE3k4+dA0yLJE7EIrqUujBLBu3hVMfqxrFcWbfY=;
        b=i5scnDKCGfxRaiMSoHPs7vIvHbTvdciekAHA4KSJj67wpSHeJrtJ45hCSNVCkZJrD1
         EM9SF8X1+hAgx1YcnK2+4QvMDRABskHq56kfAZ3gTb+qZIbhQJQCx/a5oL6puUwqHC6h
         mlSXLNkhs8nljT80a24YxC2grxCYcWygIQfVqPFZC2evJ/QDpgqWvyyYSNlmacF2KCQD
         vxx3WdoVVKl/S9xtBMDh/iuDYzN5+MCUrDLhv/ruqhkfyMJv3/U+Sin5B/yzf06thuKD
         B1lmEgmCoQn9EfIrS2SAOPxkkBXZ4qCIzHZYgZ4O6QCGtg0MGjdOWBvdhByVdrzAlY5j
         qDFg==
X-Forwarded-Encrypted: i=1; AJvYcCWB9AkMgH/0qRJMD0+CwPzZ7Va9eHeogXN3pSGongU7N07+EIpc89GOv/sloIARnn0Xm60ht2BqDdicVlRZU8m0@lists.infradead.org
X-Gm-Message-State: AOJu0YwG8ECNcXvSfco19G6ntm+RdbTpWQCrR/VXze30kE5YzocFqktt
	OLvok6AFVjqpzWN9lo+LvPjEExK92K75fEvvXN/UYYY/ba3G3swOYPyXNnj1oGHV3EB0Z3ekUdP
	5nJT4V8QIMZYi4s0TlyeLX+KP9oLrWGLQZlCNbQ==
X-Gm-Gg: ASbGncvg3PXbTvP3XFJXcyVlkuwjkYHU3CP4vRdNb/cQ7yd5Pyu3XR4aFBMXBE4CKOK
	n3txI//I3A19cnhOMSyQDl+uZEirteD5S0LFYPS9qatkvZ/yHy8y4F88j1rIcIrme6U4lj57rCw
	8=
X-Google-Smtp-Source: AGHT+IFxGDj5iXV1hVx+bDjQHTZUVRM73dPTifEk8a7TEg/x0Tcm1arIcMDlwwFyHGQfiRO96zZV23RSVt9oTTe+p/Y=
X-Received: by 2002:a4a:ee1a:0:b0:5fc:dd26:a087 with SMTP id
 006d021491bc7-5fcdd26a30cmr8214839eaf.5.1739959154922; Wed, 19 Feb 2025
 01:59:14 -0800 (PST)
MIME-Version: 1.0
References: <20250219085726.70824-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250219085726.70824-1-krzysztof.kozlowski@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 19 Feb 2025 09:59:02 +0000
X-Gm-Features: AWEUYZny13PhyIgLlHGS6LqU655W9VTKBSuguA9ge6dMXGv73qgyazJplG-xt5w
Message-ID: <CADrjBPrg4eV+fT9XsuMTwG3WprPq5Qqre9+XTwYURCp_==6diw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: exynos: gs101: Change labels to lower-case
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_015919_499934_E5BD8770 
X-CRM114-Status: UNSURE (   7.80  )
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

On Wed, 19 Feb 2025 at 08:57, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> DTS coding style expects labels to be lowercase.  No functional impact.
> Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

