Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D25CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 22:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=meSfnHgTKRo60dTT4qxKQPctKIG2RRQoacJu7LFLAjE=; b=GdfUjF96rUiW/2MniLHAYTwgOd
	jOUdbp/98a8ojmiPKrxru1oGFCBMpK7t/GEWFDaKIWWf7qK+27lnMB9zRpdpspQHHpLGSWojPwBlY
	7MPc/VPIPBIi4tEdf6jD6z7+moAgtWKChYuJj8MsuP946wYJM2CKu5FtTZVsNWryu1kIYJGakhGmQ
	m8JnwFPMQoPcb0ktSIIyhtJwRgQ5FCZZHI/+PJhGzdmviszbCKM6HTjqrEDjhQXnirZVfCuKg9Ndu
	JTBPqf7oDAGwKfCXlnifKXfTojPRchhoqmGPTBBZLDLzaii/G8rWIHsNMmlbGU6KWYC1Y0TGh4EsQ
	WvaJsBkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDr5I-0000000HFca-1243;
	Mon, 05 Oct 2026 22:23:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDr5H-0000000HFcS-0rig
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 22:22:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 91F6860008
	for <linux-arm-kernel@lists.infradead.org>; Mon,  5 Oct 2026 22:22:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48AA81F000FF
	for <linux-arm-kernel@lists.infradead.org>; Mon,  5 Oct 2026 22:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791238978;
	bh=meSfnHgTKRo60dTT4qxKQPctKIG2RRQoacJu7LFLAjE=;
	h=From:Date:Subject:To:Cc;
	b=nGSy/atSuEI/tZhIZVM+ijm4nEb08xjkiNgFVxK3vhiBgqfsOFT0NJiTcZYansihJ
	 43u+v51+ib+Ehbm98b1KWAOigk2kQC61n8Zv+dKmzjm/syBOlBjvwVHK/r5Ww+excV
	 9J1jNIfC++9QRkCBybHI+uGFH/i0zShFI2jrqmosLuPWLif/ihaOB1p0a7tC5RScAs
	 dVfGbr7RxNTMcxYNUlhVYZweqvsBsWLgFwSSvnLhB0G2CobGnILC2ruSD6i1+TzYiS
	 2f11d3jI5KeEEFCvHy/vAO6/x2c3vbqj9XEt7JxsvKbiRBqFv/aQtH/lybJPSd5kkm
	 YqOdb2NHxwoYg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso2472946e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 15:22:58 -0700 (PDT)
X-Gm-Message-State: AFq9FYLmn9J8rqlmXYibmNkg0wAGGXCzcPKz0hZ/bVlqKDKaH90ORTii
	P7K4M8tz1aiTVR1dFmdO8WAuZUprgsh+aNJMPwVW7CzrD7fqdL40klnUEWUJPImpgMl0949SiGQ
	oAVQFMtHVjIUM+ll3qCm85CqxXlPb288=
X-Received: by 2002:a05:6512:260f:b0:5ba:36b8:ed16 with SMTP id
 2adb3069b0e04-5bcb5441a09mr2466647e87.11.1791238977050; Mon, 05 Oct 2026
 15:22:57 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 6 Oct 2026 00:22:44 +0200
X-Gmail-Original-Message-ID: <CAD++jLmcwRM=WhFmQXuNMErLqG_3XRqE2J+izqQVHdANB=ogEA@mail.gmail.com>
X-Gm-Features: AclHuK9q-maIWLr3qj80d9l2Unjh_6rOYSIVSsiYteeGYqXFZeAW-QIeTbOYijQ
Message-ID: <CAD++jLmcwRM=WhFmQXuNMErLqG_3XRqE2J+izqQVHdANB=ogEA@mail.gmail.com>
Subject: [GIT PULL] late Ux500 DTS changes for v7.4
To: soc@lists.linux.dev
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
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

Hi SoC maintainers,

The prerequisite DTS and driver changes were applied to
the power tree two days ago, and this goes along. I hope it's
not too late for v7.4.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 2eb92e6b94b612eccb53366f65018ae5e8d072d5:

  ARM: dts: ux500: Add Samsung phone audio graphs (2026-09-23 19:26:12 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ux500-dts-for-7.4-2

for you to fetch changes up to ff1501cbb825de117267124ecb8898112b4051c5:

  ARM: dts: ux500: Use AB8505 charger compatible (2026-10-04 22:23:59 +0200)

----------------------------------------------------------------
Ux500 second DTS update for v7.4:

- A AB8505 charger compatible and short interrupt list to go
  with changes merged into the power supply subsystem.

----------------------------------------------------------------
Linus Walleij (1):
      ARM: dts: ux500: Use AB8505 charger compatible

 arch/arm/boot/dts/st/ste-ab8505.dtsi | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

