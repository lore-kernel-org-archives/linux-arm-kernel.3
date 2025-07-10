Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B8DC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 09:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fK8V0E4Xdcf1fTBLfVQvRq2RbYuBxS2NIoLWeiVRMmk=; b=O1djrE/YfUTLJF6xqVEqumIAqB
	DtmbpCRO6jHy9rgoDS/qfzLCwvljAhWI06G7zmTtpk8HUXb8FxmHwH3T2sNv5pYEbdr55mV0WSp9z
	kQXY6vt2d9HDa4MyoTVXlshrhuQD8Nf5vFCpgWNDS9D4FC8+t+aEsRE+T8vy5TUR4nfQuPYgAbEuC
	MIgKd3i4uffQIBaWd6D3b0Zt1Exh2DiSVmtk5trFiTn4074qIqooEkuYU4otxsKWUO3X2nrEUE7kZ
	qpv2kZVwBQV0QEVlQzXSHksGNEE1/txcX8a1P9B4IXY240X3zbrxBa/AxPb9A/KcHbP0F6Om0yRnC
	R1t9qx7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnIc-0000000BIsk-0ljr;
	Thu, 10 Jul 2025 09:10:38 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZmEe-0000000B6RP-4ALD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 08:02:30 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-613a21f23cbso390758eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 01:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752134546; x=1752739346; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fK8V0E4Xdcf1fTBLfVQvRq2RbYuBxS2NIoLWeiVRMmk=;
        b=IGIqNIG+MVZIrThp+nmbbB3m71u0+rqVPYCz/PrBXlqVrMBRfeVbqHDLsc/17KH1tv
         VdaIoNxALXIkrXDWkAn90Sv5B91UwBY0SkO5Rz90IJS7pR9BMXxJEccCK2ltZ0Q9TWjK
         bhIoJGEPB6H4BcrIl5IlliSIyzwyaQ7+iXIusAmr0apN/HBtTmQyt3fDThicU0vH6AYs
         k7lA0sYOxOhTXmkfWeeJJUXeC8ZWnYNs/FVGfLVtvSpZx+j/dgShgG0/hiXUmeHm5sPe
         5cD9LZeAVbnZbrI+DcH7pPHDYcR7cvlX2DcWhLv7NRg0bD/zCFR+0IPOaw6X+CFRLjCr
         hY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752134546; x=1752739346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fK8V0E4Xdcf1fTBLfVQvRq2RbYuBxS2NIoLWeiVRMmk=;
        b=FlFOaEBgNa96/Ml+UQslZSPdjvVOJ5+LsuCzHBHPlEHOG7VLJnXSMwffcArXjnt34r
         5/oQF0jFbuYdbtYIQ0A9Z4sy/3958YxpbgGWliGTHpS0DUDtLEAfYT7aZe9y0fHnlF0v
         13PCIaC2cr0ogmNZpB1QbeMAkrEFRk6tSAC10qB4Fcsw+1hcm4JufwX4hc3l42mxFNDd
         iIkK/vrOXGnze57h1n8jBAHjxe3KV1kuV8W3veFGIRf9G2aEdN2ZRpucIMI0NX2icJ43
         PtY7g74LEc850kfZT16P+403FfqL9BTKf9DqP9Mv69HLHAwD8t4qauBihBqwe1qtDObi
         ioVw==
X-Forwarded-Encrypted: i=1; AJvYcCVgvP93GyFit3fEiRSpl4tLw7PKdbMQXD2pUoIBmnj/gZaT6oUSkN8JQrdk2XcrZBL1f+h2XwH7QD10l6WkOHVe@lists.infradead.org
X-Gm-Message-State: AOJu0YyckjHdA60/uVzlhHCcIfI07ty2nYuGEN2AhlGauPsAJzDz/dlc
	zAETNdSxcstNNlDtcVspx0hEkiJdFhMUFPON6tcdfn5ELKf4M1KsAAiseG8zY+HuddWbcSTaf2m
	JmCMZu14YNBVfUyl9BswVvYV5TBxX7rnXnfek0nD9AA==
X-Gm-Gg: ASbGncvJm4y0Nk8kTyznXJq3M1DEJSzVTt1glZvtuBPfrD0pTtT6ShFJLrLmRbAcapL
	sp8kjb0jU33g9cc/obZJ3XusNWejRgj8JvKMqB9jBFxyMg/jvoTdJlHe8OYcxWcIR5KspSGH3zt
	yctjjVbSB6VvoWVipu5aPRQTt8+urmCMmeobmjZdngMEqLa1ehcvImcg==
X-Google-Smtp-Source: AGHT+IHrFLYymR6F7UKamK/gjTFOEV/FWv98kovyNcG7HeAzZOtkYSEipfwxdZEaT2lEQ5TAU9vcD7JJ0ogSkLcbVfA=
X-Received: by 2002:a05:6820:260e:b0:613:8176:8a00 with SMTP id
 006d021491bc7-613d9db2e43mr1002071eaf.2.1752134546426; Thu, 10 Jul 2025
 01:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250707-ufs-exynos-shift-v1-1-1418e161ae40@linaro.org>
In-Reply-To: <20250707-ufs-exynos-shift-v1-1-1418e161ae40@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 10 Jul 2025 09:02:15 +0100
X-Gm-Features: Ac12FXw14Fnv-NHIV6I5KCDE4Qv3eilf3MCfG465JBU1_Jo35wVeJqk-I6YsdjU
Message-ID: <CADrjBPr_7NL4jFY=0B=VN7+WtxHrFxGvvqg0AnnPY_P45dtngQ@mail.gmail.com>
Subject: Re: [PATCH] scsi: ufs: exynos: fix programming of HCI_UTRL_NEXUS_TYPE
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Seungwon Jeon <essuuj@gmail.com>, Avri Altman <avri.altman@wdc.com>, 
	Kiwoong Kim <kwmad.kim@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_010229_033621_6F6F7DC1 
X-CRM114-Status: GOOD (  16.48  )
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

On Mon, 7 Jul 2025 at 18:05, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> On Google gs101, the number of UTP transfer request slots (nutrs) is
> 32, and in this case the driver ends up programming the UTRL_NEXUS_TYPE
> incorrectly as 0.
>
> This is because the left hand side of the shift is 1, which is of type
> int, i.e. 31 bits wide. Shifting by more than that width results in
> undefined behaviour.
>
> Fix this by switching to the BIT() macro, which applies correct type
> casting as required. This ensures the correct value is written to
> UTRL_NEXUS_TYPE (0xffffffff on gs101), and it also fixes a UBSAN shift
> warning:
>     UBSAN: shift-out-of-bounds in drivers/ufs/host/ufs-exynos.c:1113:21
>     shift exponent 32 is too large for 32-bit type 'int'
>
> For consistency, apply the same change to the nutmrs / UTMRL_NEXUS_TYPE
> write.
>
> Fixes: 55f4b1f73631 ("scsi: ufs: ufs-exynos: Add UFS host support for Exy=
nos SoCs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

