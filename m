Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F0DEFB818
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 09:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dd/gT6QA+Dp8Thp1escmNkBWo8V0/a+d5yMpDmFY/co=; b=F/9czaJ2CNqKrHTytQ8y131tJI
	YXT/jXnZmf8MzLB6JGGwY4WNzzO7bNGvufjlJNh6/8Rjyi8CmmsQnwhbmX5GH9dOW0mQci0ccqG4g
	sLv/Er9jVBBpuH/7r3h8zaN9UymelXO4reG5R0hIuwIzoPcn86Nq8uB2E0qeO3zU2EAv1oc8rER9Z
	sMUsrKRE20lZXrwEdg+VlsIyeN3i//H625zJn+SawP3T+0rxAFVZ879oz2/48lzxJVa++kvCznXiU
	VVCyvIFqFIBecFTWwbB6g/hNHP0cmLqdVQMHaPTybvZC7HkgIA1AWav1TN358uDC3RbHd80hZjHTh
	nH3sK3yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoJc-00000001hne-2DfP;
	Tue, 24 Feb 2026 09:02:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoJU-00000001hlO-3czN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 09:02:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 69A924373F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 09:02:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B0AEC4AF09
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 09:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771923760;
	bh=dd/gT6QA+Dp8Thp1escmNkBWo8V0/a+d5yMpDmFY/co=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tHv0N+ELI40VPhWnDz2DTayTADymk3xbwJk82BEoyiBSs9ka2/Ld6scqeD04wXYMX
	 PMxSaTUbAO62zO+UdhI85awhDzle9Qjt1CamZtisgsvl31tkIXc/Lj1CelJX+Gm0yu
	 9XmrmmtWqcOnZQyKuw/You2XfX/PW4XCqpEdK/oCY8g5++VEc3CRLEFWRNhoyL4PoH
	 czUgpbK1GRC/jazU151rOCPnetFGNbYfL+KAL1rJIe9cn5VOteOw9UzeRH7x+y62Zs
	 I+Tsp7q3mfVmp0wiq8YWjGtDFQu/zbAGYqXLodx3d/TVcotG6m6ym4PLXdiJy7zskm
	 zsQmjfXitXQNA==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79827d28fc4so27355287b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 01:02:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVeQYVg02O7lP7z+M76jcs4F6mDIylYEMngZAqA0NeLC/bDMus0w2szGJMbhDlracpMtSYUFBEVXQACvLytu8K7@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn4OKXpyn2QPJn6KpqcS/1vf7Xt6zZLdXH5ufuMC6So9MAkkV9
	SHAGS+brDPFj+0804LDPRDVUMvo+aYtBWmHDV7a9LDGh3AoS7jvQeV2I9Xcc4sKz7oIclZau+5h
	Ask+AmW+k3LYfN9ZR4YTunLfEII2at64=
X-Received: by 2002:a05:690c:64ca:b0:794:d639:366 with SMTP id
 00721157ae682-79828f18d18mr102093417b3.26.1771923759669; Tue, 24 Feb 2026
 01:02:39 -0800 (PST)
MIME-Version: 1.0
References: <20260211-imx2_iomux_warning-v1-0-1c5233771b32@nxp.com> <20260211-imx2_iomux_warning-v1-2-1c5233771b32@nxp.com>
In-Reply-To: <20260211-imx2_iomux_warning-v1-2-1c5233771b32@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 10:02:28 +0100
X-Gmail-Original-Message-ID: <CAD++jLmPRLy1iJWRtfpS-7OS2533AY42OU87U6hUT59efz-B8A@mail.gmail.com>
X-Gm-Features: AaiRm52oa2BbbnnLKw9EN11_kQbctbk-A3FEXDfTH-WIg6jXcZh2TKpyJ74DM6w
Message-ID: <CAD++jLmPRLy1iJWRtfpS-7OS2533AY42OU87U6hUT59efz-B8A@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: pinctrl: imx35: add compatible string fsl,imx25-iomuxc
To: Frank Li <Frank.Li@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Jacky Bai <ping.bai@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_010240_927828_836B9854 
X-CRM114-Status: UNSURE (   8.65  )
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

On Wed, Feb 11, 2026 at 10:00=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> Add compatible string fsl,imx25-iomuxc.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

This patch (2/4) applied to the pinctrl tree.

Yours,
Linus Walleij

