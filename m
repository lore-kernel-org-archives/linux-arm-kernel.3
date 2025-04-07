Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399C5C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YlS9SNfRqEBGJwWaFAFEV0VEKXfqmIqqn9u3rCmOfpU=; b=3Z/F+s1NkGpGboFXkzCDLZa0PQ
	4ur/jj/ONrxO7q4SYRmjGaGJ8sAkobTXfeEMlOdxx8czbIXtlyhENcVewpmkiAL0fpAh8MaHvFawZ
	TAXMyZnOZu44KLtIVEGMXXYiTo3t3oQlHl+tw+SpO0iLvJ6kixSQDTvJzygJ8VbbUVX6pbAPPmxTa
	kVpDjyf/2VtLw7RPYdJIoC43yuT9AOQQhI0utPfmr9CYiVtK/fpXU2V5wyy8/Rro3dzexbLC66SlT
	ZfLqn8bYz46F8GZyB3MCJs/z02VwlwY2oHdE+/cwJI3yGXNDK1S082vRTKJ+VbcDGkogZQ14gfg3D
	bHFv8W8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1r1Y-00000001VMb-2Uya;
	Mon, 07 Apr 2025 18:16:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oqB-000000011zG-14r3;
	Mon, 07 Apr 2025 15:56:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 31AC06115E;
	Mon,  7 Apr 2025 15:56:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55AEEC4CEE7;
	Mon,  7 Apr 2025 15:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744041410;
	bh=lB60eOJuf5tOWXfPKUzsxGfJef4dFGup2NjoNJe7wnM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Uh5uiJLM2GbJZh2empkgAoW7OP6kChL6dFWFY7ekUSlkXXjH/HNgLOaHvwXV+Y2vz
	 ZQ0WYyMFRITXJeVajWbn8NQrleMF6L2lu6svbF6TujpSvc8Xv2GSsmSN4hDJ1eYZzB
	 l8pLiPOZL5dLdRjxw8kb9JuL8mzyiwr3tX86QnCDuGo4L7PsbOKlIJSMylX4EPIt6V
	 7Q2ipTIQJxrwPp/Kc5herELmX9RlDXBEq2ammPU+n4F+g9bwSELzteAJBDCh369ZHn
	 nOFnK27gpbD4/1VNl0UOqVYUt0iRJpEJWU0FUiJI3j74luu1G0LAndJH5oa7JZUoAR
	 NrEpQ1ePUmF6Q==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abbd96bef64so874550866b.3;
        Mon, 07 Apr 2025 08:56:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVlCRNa6yjp1BaWZfF0x4xCkpoWv5GZlWVZZkyoZkq+dr5dZNAQnmHyYwEI6RTdpvEz3Cwz8vS7IUJF6kJFpPMD@lists.infradead.org, AJvYcCX4n/xe2HyGTYbJAytf06YJ4s8zl6u59bLSm5ArnVIybaAMY5wTkibQDPUWP2jCAWc2ptHy8GSHlZxUjHAqoX0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4xVch6MuQAI+Z+GgEf6AZpCU/PJlepK6lQVZgQw7MU2wM34HM
	M9G5Am7tbQ804KsBVg1LgcwU0HQbSfFDfk3J+FVwZCCrYcA8MEn4IOqj/sQIgYoCbMVKXpjNs3/
	LIN+XXID64GMiqJ5KIx6Yp/NdfA==
X-Google-Smtp-Source: AGHT+IEwypuQHtewe7oLHDK0Lin7VVDrmqaMnF/yfoZXK0Vm9Z2Mu4r1UfY0Dvl+rcyWlqG0RDs93c4ecVbGJ/eFp/s=
X-Received: by 2002:a17:907:7e88:b0:ac6:bf3d:bf45 with SMTP id
 a640c23a62f3a-ac7d19671efmr1333301966b.36.1744041408915; Mon, 07 Apr 2025
 08:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <5552256.Sb9uPGUboI@phil>
In-Reply-To: <5552256.Sb9uPGUboI@phil>
From: Rob Herring <robh@kernel.org>
Date: Mon, 7 Apr 2025 10:56:37 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJo+9ycUFHVZ2Darh_RWaRuJGX6KKQGsbeuDWav7vKA2g@mail.gmail.com>
X-Gm-Features: ATxdqUFJPngLMLFKdy7L4W0Pm0-UEMG8nDV-9UTClAhrHanA2WHbpGaiUSuF7Mg
Message-ID: <CAL_JsqJo+9ycUFHVZ2Darh_RWaRuJGX6KKQGsbeuDWav7vKA2g@mail.gmail.com>
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.15 #3
To: Heiko Stuebner <heiko@sntech.de>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Mar 19, 2025 at 6:56=E2=80=AFPM Heiko Stuebner <heiko@sntech.de> wr=
ote:
>
> Hi soc maintainers,
>
> I made an error and accidentially applied a patch that was meant for
> the mfd tree. Thankfully Stephen noticed that when the duplicate
> commit appeared in linux-next.

Both commits are in v6.15-rc1 now and the revert is not, so this
should not get applied/pulled. Or you will need to revert the revert.

Rob

>
>
> Please pull.
> Thanks
> Heiko
>
>
> The following changes since commit 73d246b4402c3356f6b3d13665de3a51eea7b5=
55:
>
>   arm64: dts: rockchip: remove ethm0_clk0_25m_out from Sige5 gmac0 (2025-=
03-15 15:49:00 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v6.15-rockchip-dts64-3
>
> for you to fetch changes up to cee24bc73d4f3f47344a1a54100a69c72f1db061:
>
>   Revert "dt-bindings: mfd: syscon: Add rk3528 QoS register compatible" (=
2025-03-19 00:22:18 +0100)
>
> ----------------------------------------------------------------
> Revert of one commit that was applied accidentially and should instead
> go through the MFD tree. It is already part of that tree as
> commit 7f3e3e7228bb ("dt-bindings: mfd: syscon: Add rk3528 QoS register
> compatible").
>
> ----------------------------------------------------------------
> Heiko Stuebner (1):
>       Revert "dt-bindings: mfd: syscon: Add rk3528 QoS register compatibl=
e"
>
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 --
>  1 file changed, 2 deletions(-)
>
>
>
>

