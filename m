Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5366D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 07:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xzb4o6woI0sKd6leSwCGnufqfj0RdO1VKVEpocSGcGU=; b=B0pHOdG+2vW63GFiWoSKvcP0ad
	4jCDzjd+/Nt55XOw40TKNT1tTR/hJSbTCDgIRTNIZ3z2IRllFaHqydBpJQZkFsZwo0L69cV2NbKML
	QLKrIt/v6Ym6lBtr4apnWLfFHBNVMDULV4Y+zFXEFdJ8acJTWOXZ56/A/gsVcbmFkCsda0GhFTfRU
	L6OSmTOhjb/d5C5fNgUnFX3zqe4aTmpZTjkC3a5dzjpOX08boDFH/v6H/DVn+n2wZEjxw3GtFXlxC
	al2qDnPiJXNNhl5nKgpDfcJfYq10djkLYGtsKCe7ycY1k9fLklzAaaaANFJXIZuB1LV2Yfy662yqa
	79ZSxJmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOtEd-000000006wa-2twI;
	Fri, 28 Nov 2025 07:49:46 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOtEa-000000006vl-2IDb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 07:49:42 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-8b2ea2b9631so148874185a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 23:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764316179; x=1764920979; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xzb4o6woI0sKd6leSwCGnufqfj0RdO1VKVEpocSGcGU=;
        b=gIIGgszseYVldLj0Xm0V3N/g+B1H40yixnZLV7ffi6UfGdFWIuB2ZQxH4BxS+yTgEg
         1QTW9XacpBKtWx6Zecg7ASN1+DR08+B5/7+uHtYyYqlwN6XHg52jVHUIJIDGVUyJYX7a
         uRuwHjxRpQ8ECyEqybwCvZotHRI8zYhcmoUazf17QHQd47nTGz2ZIOPxdmMYsSj3XMtI
         K5z6ddPVgPMQnmYSVHlGjTe7pSYvZjR5Y9UF+mjwdpBXQLtJlPgT02fXAg2iuYI24lOb
         7CkZ52zb7ou1cpMYgS4UfJF359D6/cInEbFdTA2JMygiYEFgbf4DzVTks55yS/4FXnsW
         wS1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764316179; x=1764920979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xzb4o6woI0sKd6leSwCGnufqfj0RdO1VKVEpocSGcGU=;
        b=i/I/hIEytITbFFufaVNqtTJWJ5BdTUW1XXuk3WEe5jt7XBbGNYtMeIjIttavcwQYx5
         aocpacYdtnk8X1EVKjVOsiXmSWBKNbfe1i7FxfLC2MRXN22Dk+B8C03zv0LtZM5mKI1D
         A2GgMlT979tBT8REt2Nh2bA9kYMQAnOY0SRsXj+zWR59ebO+w9hGCNV+Nk5h66bR5yp7
         hEKbdcVAfaBGLHZoFjKxgt9/gaSXi9FiW0b7r3m+6pCEmMfaFca+EB1EHoGzwiwFZnXH
         8XZItl5ZBIjZJCcj0nYt+FnjSKUuEIgfE1xtWIkwOjESYYHC4j2jZP5Dr4rPUNOdafcy
         4cZA==
X-Forwarded-Encrypted: i=1; AJvYcCXCPc4dLgL3LYxcfs7yQFCh810lT/MagvGjwWjYZB0OLzN9PoPiEX9MouGaS7UN4/h7ai32CElxzcqff7vYFyBS@lists.infradead.org
X-Gm-Message-State: AOJu0Ywzeo/cLluaJ7YVS6u7R7+0R0FNuf1vUHB77f0nSM/gBrV94KB9
	oRXWpnP7IRZQplr8sNPyPBJ9wmUWPxgsk4T1UDcyL/X9X8WJ/KpgRvjoQ9T7cuTqOij7p5N+j+6
	pChYk2PTnvHyq32KV7cqgMRK0L9LXnwk=
X-Gm-Gg: ASbGncuM4V8ZFCSDNUkT8ffefGsV2dZMgFQQ05ZMTrvFwOoF1EmVqIiBQ/fgyU2D48f
	ske9DYYInMF7R8nhJJLSPwPI62aOSIGUym8DACWGJPvgl6OhU9mJ5PCOc1YAWwmIxUtmJxqcc4y
	Geiqkg8+maaYH1C2eVuIgUrHEbdPgENQ1jXkRI/GB+oANOZbWSSvRYfFfj6vKxjEtSsU189+y+D
	RGJfAeQPDeHBRWaW/X1bIf10VMEBp/Edcoc/TRAMVwzejBgZidoY0WpWHk/KveiVNBtjGXcwjuo
	sQ0hE5KTBjRv0/HIFwMP7zZxmDFO
X-Google-Smtp-Source: AGHT+IHYzLcGh+cWGpJkei51y/kYklMPmBU3wbElTrGhOhOpPSp6GAM0EV8iuyukCLvsobhwpt+JVDig/00Wu3PpzZo=
X-Received: by 2002:a05:622a:4d4b:b0:4e8:aff9:a7a8 with SMTP id
 d75a77b69052e-4efc3f2a0efmr187482101cf.52.1764316179224; Thu, 27 Nov 2025
 23:49:39 -0800 (PST)
MIME-Version: 1.0
References: <20251127-nanopi-m5-ufs-v1-1-0d28d157712c@gmail.com>
In-Reply-To: <20251127-nanopi-m5-ufs-v1-1-0d28d157712c@gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 28 Nov 2025 11:49:31 +0400
X-Gm-Features: AWmQ_bnfm67nHyppKcn_WewzrQOH_TFdC0fMKR8wgi2rranNPLttVu9G4ijWIFw
Message-ID: <CABjd4Yx0wJG-RjbGo1EZXK=bDp0sBJvcwA8tJ5jNOZRmGq3r3g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: enable UFS controller on
 FriendlyElec NanoPi M5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_234940_611923_34C44A08 
X-CRM114-Status: GOOD (  12.63  )
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

On Thu, Nov 27, 2025 at 3:46=E2=80=AFPM Alexey Charkov <alchark@gmail.com> =
wrote:
>
> The NanoPi M5 board supports pluggable UFS modules using the UFSHC
> inside its Rockchip RK3576 SoC.
>
> Enable the respective devicetree node.
>
> Board specific supply regulators are not added, because they are all
> non-gateable descendants of other regulators marked always-on.

On a second thought, I'll add those regulators in v2, and also include
a link to the relevant schematic [1]. Explicitly listing the
regulators has a slight benefit of fewer complaints from the driver at
boot time, and maybe at some point we'll want to try and remove some
of the "always-on" markings (which would require a reasonably complete
description of the power graph inside the device tree). They are also
actual devices on board and not pure aliases of other existing power
lines, which IMO qualifies them for inclusion in the DT.

FTR:
VCC_UFS is directly fed by VCC_3V3_S3, no fancy circuitry in between
VCC1V2_UFS_VCCQ is fed by VCC5V0_SYS_S5 via a DCDC buck converter,
whose EN pin is driven by VCC_3V3_S3
VCC1V8_UFS_VCCQ2 is fed by VCC_1V8_S3 via a MOSFET gated by voltage on
VDDA_1V2_S0
UFS host controller itself is part of the VCCIO7 domain, whose logic
is driven by VDD_0V75_S3 and whose VCC is fed by VDDA_1V2_S0

Will wait for 24h to elapse since v1 submission and send a v2 later today.

Best regards,
Alexey

[1] https://wiki.friendlyelec.com/wiki/images/9/97/NanoPi_M5_LP5_2411_SCH.p=
df

