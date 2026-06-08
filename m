Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4592CD8C8E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 09:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGJeTRKsWTZd6TMNznExZMPKEFOtHdMmOsWk3k8oy6Y=; b=ao9PMIXqQH1SNH/1GvAQbi4t+Z
	9S4lT077AszldRZmxb1a6t7m9nwhg4qX/+dwUtdptGquSKNnB7UHI0kOtwtP6i/Y5GhK1M3YJl6qV
	0JIYymsDrpr1ak4vPH2PfNVj0I0mMKqwZo/SmAkk4gfY+VNxeyviubXfWIFFjqpcaEH0HUL/XmWhC
	APRUQT1doBqFbKAnozSltuAHYOdobOuNCXPxj5BmbNDpXohjnx0Ow6086FjV3Wdvpx6du+36Hy+wz
	6bCXEdSlVjVycp7m0e2SwtFJOVhxvHRtEbphKnEbBCB78+LhAfAUMBRRaqrDMCDiNgYBKiT+TTG99
	zf2SFaxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWVrd-000000038BS-3U3G;
	Mon, 08 Jun 2026 09:01:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWVrd-000000038B7-1AlC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 09:01:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F26B600AE
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 09:01:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA4541F00893
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 09:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780909304;
	bh=LGJeTRKsWTZd6TMNznExZMPKEFOtHdMmOsWk3k8oy6Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Xe2Kpgd6ysw9wl2YnpmSVvr3HAXiTGw9tpJSqvuB1dLcIhcvDLeZciesf414syDj3
	 ZlefxnKbXXkM1er65J8Ml1y8dYgq2GgHHnnTAt5jkitjab67Z0o2socpPV+3TlXM/2
	 WGmAX6N+tRdIgQm3Tvf4PFzNLJ5GH7MrJt9UC94Z0jnTnMaBFskEuRlOMiJ7E4vUUd
	 I5zaWO48nJQz3WuyRAJAv5HYAo6Unl0M7LYBVjdkF9zYrNymYEkaYwBNzKhRtIia9u
	 eAKGs5x5/Cx7JETdPkXaUw41Snr8SeRszR6DZrm82wLjYa77FhRSsBYD4tQ2JEJrVL
	 agFtyunFRtr3Q==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aa68cd8dd3so3642041e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 02:01:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/NC0y31pBNV6Qs6gcpQwtPzzdzztgZ/xS1As8dKc5UJzhSXrzkibjRP7N0qCJS9onNBdNLsrewudIfH0B/ShG0@lists.infradead.org
X-Gm-Message-State: AOJu0Yycf123NK+7nGLbMsCva8ikFEo3abo6vhCk1LxtVbv6E0mi397A
	+Fmqu3FVrbKRGBAZu66yMaA3JysOak2GSNy24gtq+PIMTy5G1OryRbdq+Z7xtazkrKZ+9QiKsYs
	Qs/PHxeIzYwB0zCbigGvB+SgHtVW/tzM=
X-Received: by 2002:a05:6512:6c1:b0:5aa:7126:c62c with SMTP id
 2adb3069b0e04-5aa87b40d20mr3965582e87.1.1780909302629; Mon, 08 Jun 2026
 02:01:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260330110135.10316-1-khushalchitturi@gmail.com> <20260330110135.10316-3-khushalchitturi@gmail.com>
In-Reply-To: <20260330110135.10316-3-khushalchitturi@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 8 Jun 2026 11:01:31 +0200
X-Gmail-Original-Message-ID: <CAD++jLmivL9gwoH=-8ckr1_ufV0pVpeLqjNH1GwZ3q1G=v3GhQ@mail.gmail.com>
X-Gm-Features: AVVi8CcySFMrp_-u764vQiNFLySCbzgBlciziVHmIzBXSnKSliKS23ncy01nEGM
Message-ID: <CAD++jLmivL9gwoH=-8ckr1_ufV0pVpeLqjNH1GwZ3q1G=v3GhQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ARM: dts: gemini: Rename power controller node to poweroff
To: Khushal Chitturi <khushalchitturi@gmail.com>
Cc: sre@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	ulli.kroll@googlemail.com, daniel.baluta@nxp.com, simona.toaca@nxp.com, 
	d-gole@ti.com, m-chawdhry@ti.com, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

On Mon, Mar 30, 2026 at 1:02=E2=80=AFPM Khushal Chitturi
<khushalchitturi@gmail.com> wrote:

> Update the node name for the Cortina Gemini power controller from
> power-controller to poweroff since node "power controller" is
> reserved for power domain controller.
>
> Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>

This patch 2/2 applied to the gemini for-next branch,
sorry for missing it.

Yours,
Linus Walleij

