Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB769CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 06:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1mi7S8ELUkNYWmRd8+GnLtzte8ipT5C2/gYWNcmpNc=; b=FNJFbW3X/z9v/7zV38s/SDto7l
	YJbLvzgcwDjG3I7q/q4ZtIUPZV7VL77Q+H/iqQdby8Tc9rjm6RHNtIZ49ccWhK+iWJthyNz563Dqe
	TIx681+0K1PViDLxQ6ZTMTHjr7BIfb5GmPh8HAZz78PpBAtTW1wEXqJ4madnYzRi06xTy9oDKpu2W
	opQOKye8LU0VOYAUav9Yo+KJC8x+TjuN3TmpokKf6vyrJW+hbCfryMPnhVpBSVibaHvH6HUqUnwAt
	TksgQcKLMdMdpDGO2AnP/icC6ExP+7Sb2LAu/PelryrFHLE0/uxGJBFQkuPYPx2+lYbJtRpH6+Nw0
	y6NeocmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3U2j-00000004Nt3-433D;
	Tue, 30 Sep 2025 06:40:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3U2h-00000004NsA-0LSV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 06:40:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9611244EE3
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 06:40:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D7AC19421
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 06:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759214454;
	bh=aY796e7ZjDJ3GpkqwDAOoDMWoCinINh6cbC/Z6IAkio=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DKgSCAt1CIUjTAPD85phyC6/D/engFWoLogA9Yz5lqVjDmSESvd0ZOchbg0bW326x
	 SW3YgAa4BKIk40LZ6tlKLlg0+2AmH9iEDSDkRkpUyTmOL/yMRy6+l1DvFG4sNq92g5
	 sy/a90b1stw+87lspEOgUef61/I56Yjy0Gx9rS9WSeSmXvC14Dd7DfSTvudUdeHmvs
	 hyf2tiiH4u7VKMaBdzQnBPsrh+0ulbD0H5T3ez6ZO2r1S0BXDt/Ie+UoPYrB2Y77Zw
	 nJdGsBiHyj7wChYx6E02wVyxskB4mWT6pVJP8RRkE4qkvJfPssQ/OibpAGmtBcuzZ0
	 my/RmbK0cZuXA==
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2698d47e776so48196225ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 23:40:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWvUcDGC+IZvbjUef02X1d65sOBYGxETeuOOrDlbH4cqLTerHtoQFV9YUDaMXuIdFPh6B7+dXgnnS8tx9cyKBEM@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5w0Sr9Nt4PoqkyxXlES3/V6s5/dlvsbGsqYehyR87QrxOICd6
	1cciQIOIMBZL2nXQLZ2dQqaI7Lnzepv7IOd5pxjSssUjWHNNqYddriQUPxNVtc8pJcjdQgY13Tq
	Erdy/Atun7y90GYeelugy7MZPm0hGJ5Q=
X-Google-Smtp-Source: AGHT+IFilulwB7yZKk8NWBisCkRd9EVIUP8wmRYd1pqL/aVk/i4cqOXK4Ip+OXNthJdD/mk9ed9ZzEkUxbiiEQK8Lsg=
X-Received: by 2002:a17:902:f68d:b0:276:842a:f9a7 with SMTP id
 d9443c01a7336-27ed4a5aab7mr219005735ad.57.1759214453755; Mon, 29 Sep 2025
 23:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250930035525epcas5p3a1238a3a7bc6e52113838397187e36ba@epcas5p3.samsung.com>
 <20250930040348.3702923-1-h.dewangan@samsung.com> <20250930040348.3702923-3-h.dewangan@samsung.com>
In-Reply-To: <20250930040348.3702923-3-h.dewangan@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 30 Sep 2025 15:40:41 +0900
X-Gmail-Original-Message-ID: <CAJKOXPc+ass6ftbxrodVzXVPFW+8rUYW=VyxsmGTU1wR_jBiAg@mail.gmail.com>
X-Gm-Features: AS18NWBGk7OJKwPJ5iy8_Rm-Qzpd87k2vQsijdmZj27-buhGtUmwdQhJcd2WDg0
Message-ID: <CAJKOXPc+ass6ftbxrodVzXVPFW+8rUYW=VyxsmGTU1wR_jBiAg@mail.gmail.com>
Subject: Re: [PATCH 02/29] arm64: dts: mfc: Add MFC device tree for Auto V920 SoC
To: Himanshu Dewangan <h.dewangan@samsung.com>
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com, 
	alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com, 
	ih0206.lee@samsung.com, jehyung.lee@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_234055_195669_C0EDC881 
X-CRM114-Status: GOOD (  16.98  )
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

On Tue, 30 Sept 2025 at 12:55, Himanshu Dewangan <h.dewangan@samsung.com> w=
rote:
>
> From: Nagaraju Siddineni <nagaraju.s@samsung.com>
>
> Introduce the device=E2=80=91tree entries for the Samsung Exynos AUTO V92=
0
> multimedia=E2=80=91function controller (MFC). The patch defines:
> - Reserved memory regions for firmware and CMA buffers.
> - Core0 and Core1 memory mappings.
> - The main MFC node with basic properties (compatible, reg, interrupts,
>   clocks, DMA window, firmware name, debug mode, etc.).
> - Per=E2=80=91core sub=E2=80=91nodes (MFC=E2=80=910 and MFC=E2=80=911) wi=
th their own sysmmu,
>   firmware region, and configuration parameters.
> - Resource table listing supported codecs and their capabilities.
>
> Adds full support for the V920 MFC hardware to the mainline kernel
> device=E2=80=91tree, enabling proper memory allocation, interrupt handlin=
g and
> codec operation on this platform.
>
> Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
> Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
> ---
>  .../dts/exynos/exynosautov920-evt2-mfc.dtsi   | 187 ++++++++++++++++++

No, there are no such files. Don't push your downstream here.

>  .../arm64/boot/dts/exynos/exynosautov920.dtsi |   1 +
>  2 files changed, 188 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynosautov920-evt2-mfc.dt=
si
>

This doesn't belong to media patchset, don't combine them.

Anyway, you completely disregarded DTS coding style and how we were
Samsung DTS. Please don't send us downstream code.

I won't be reviewing this, you need to start from scratch looming at
other recent code.

Remember also about Samsung maintainer profile, although with such
completely broken and non working bindings it's pointless now - this
code couldn't even be reliably tested with them.


Best regards,
Krzysztof

