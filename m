Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70B2CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Oct 2025 20:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MAAATEzUG/gnyFxR4G/qPSO1lh1Qm5uC32oRTnBeWCk=; b=uCJwLlH/yEEHbANrPSTn6RV0p7
	vBUZbObBSyFaVIqpgUeztMJ/sj7JA0zsmms3bW6xfQHB1fhnX8b0H8+VUmi8C2f2IE0vPL8aoErA8
	RZLqgG3Ho5KjhLYupuFf6Ibi0E2xM/oVmWEOJF0QneVWx2+O4sibxsq+6N8Uexc1aehirjM4KiqNH
	Ze1pK8n5+2/hr2z4cIhft01gmXLqNgY/OBRlB93U0FMuy4Sbjvc92j6btFOyYNzsoH+DRGzf80AzX
	H8r/X5jzFsbNflNIi/ekUbIFO2fvXtPlfryIsZjPnMKE4lvbcbBBKiKH8mg3nbGBP2rTQFF7j3EqU
	5ZlXKe3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v58QS-0000000DyrG-0jur;
	Sat, 04 Oct 2025 20:00:16 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v58QQ-0000000DyqW-0Nkj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Oct 2025 20:00:15 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-269639879c3so31524375ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Oct 2025 13:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1759608013; x=1760212813; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAAATEzUG/gnyFxR4G/qPSO1lh1Qm5uC32oRTnBeWCk=;
        b=WQSi2TSgi9qUpJW/qbpMdq4sDdTZqlJgo6UjlRKag35zXiVEV4iqgSs+4WB/f/ZO5p
         bZYIKt1IRne/GUQCB8I+8PgM36JBSHPxc6fdQc4XtyO0jWQ6ZLm4wgKfmWLYqUD7k4Q2
         gkq1S1OFLe6psDvnjJyBohYw03HC6QKRy7ailVW7azYj0O3tLoS/Fdmda4dhHI9l1uFm
         csSklf3EYtDDpAJXQiPrw169n5vQNMHu/1PTt2weOwwKOptcRyMACkIu9HhQWIO2NV3q
         p1fsoXnBXUpj5oQWvY8o5xYJoBngTIHEggaJ5A44bfbOmIbqcEv/M0Jz3gyp08vDElOH
         uBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759608013; x=1760212813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MAAATEzUG/gnyFxR4G/qPSO1lh1Qm5uC32oRTnBeWCk=;
        b=VOXXXmDvNhnpmyqV+Y2/bGVK5GBFeuxFtnQvP3eExL6TgGOfz2j4QoGLyAV3YFXEkW
         gLivY8ChIUnEXeot07axNAbRptA67tyI5xj9pKvCgJGIJ5223L2mbmRfYYcnDuPAifrj
         hoqlPQYkIqplspxEQ19vPMRhK91gPcPSvUq1yjgayWKZUpPxzKBD865XRnEZ7r8UEFEw
         pztxOX6VyJzgPuuHn5dy6GzPu4uNPBaL5psrc9mT1XTDY4h2+4mb5ybWh8eG51MX3vU2
         8gk5nf3bY7/3r50FlQZhOSk3OC/JXbgIb640V+slH4Ct7b/C/du/A6wsKX01Fvwas/vU
         5yVg==
X-Forwarded-Encrypted: i=1; AJvYcCVBoPlNQk00OZ01qqRXjP4xWwaZwyWARv5V1qXvlYNmxqcyzbqrU/JdvKGtNT/LBoEfBRIjEO2xQ3AXKswL69Ui@lists.infradead.org
X-Gm-Message-State: AOJu0YyGPbPyZir7tEDLqXYcjkhDpHVLuvM8BmSGgiOl4bNAXBD+AhDr
	lB1JzE+a/Umy9d0CajNqwCoSi1zaM6yjpcnL9zjcDb2+cGKySu/izwl0ezMpHibNqdoy2nGB4og
	7SQcg2w6+7F82uHwLXRrj0VrH8mzWwww=
X-Gm-Gg: ASbGnctm+o+OM+pua6/yXBduU4ZgQJdbiKrWA9hIACxcQ2HYrhuH/R/YJJoU29Dtn84
	cpF5g5VzRiDRLK/gMl24W6QEIPsXygdalPqANaJjXxBau46YUDerIqr+q4KyDXCrTYuPSXg9i/g
	kUSdf2vJrUW4zm8DxVvO0FYLNYxHH7pS1ZKBWx/FZp0i23pkUn5Y09us3EJtarRjw/g03TKgSjG
	uEqC0gXP1rjyoWkvwXATnX5Zyek5tzrtska+0NOHsj5QqlS5s7040w36f6guOdKNyZZIqkeIe2d
	XNZqTFcBQQ==
X-Google-Smtp-Source: AGHT+IFiDzVT+2dmKCxs79HazquRaVoEKj9U/SHZ9ROcZSGxvoksUVUV31FTbP+B8I3rHTQWDxtOGVKUAq/NVn1bvko=
X-Received: by 2002:a17:903:1aa8:b0:272:a900:c42e with SMTP id
 d9443c01a7336-28e9a693ea9mr80467765ad.35.1759608013223; Sat, 04 Oct 2025
 13:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250927125006.824293-1-christianshewitt@gmail.com> <20250927125006.824293-2-christianshewitt@gmail.com>
In-Reply-To: <20250927125006.824293-2-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 4 Oct 2025 22:00:02 +0200
X-Gm-Features: AS18NWBM_Q13VsV8nrfsb2laKCZ_aAXl7OeFBFEiWoHsvMuxISq6Y9mZ9LHfpAE
Message-ID: <CAFBinCBeN-wjn-LBpgX9N_evzF1gL0nU8DPk5GSC28_s+tX+AA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: meson: add initial device-tree for Tanix
 TX9 Pro
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251004_130014_136354_44EFDAAD 
X-CRM114-Status: GOOD (  13.68  )
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

On Sat, Sep 27, 2025 at 2:50=E2=80=AFPM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> Oranth Tanix TX9 Pro is based on the Amlogic Q200 reference design with
> an S912 chip and the following specs:
>
> - 3GB DDR3 RAM
> - 32GB eMMC
> - 10/100/1000 Base-T Ethernet
> - AP6356 Wireless (802.11 b/g/n/ac, BT 5.0)
> - HDMI 2.0a video
> - VFD for clock/status
> - 2x USB 2.0 ports
> - IR receiver
> - 1x Power LED (white)
> - 1x Update/Reset button (underside)
> - 1x micro SD card slot
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
> Checkpatch generates the 'phy-mode "rgmii" without comment'
> warning but this dts is using the same rgmii format as all
> other Amlogic boards, so I have omitted a comment.
So far we've been mimicking the vendor kernel (which sets up the MAC
to generate the delays and disables them on PHY level).
If we change it we should do so for all devices.


Best regards,
Martin

