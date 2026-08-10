Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD003C5B567
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 20:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYSs7pwGOcP1HawBNqhdmv009wD4aFz+D/7i7ebIbM0=; b=L20g0DGuCB6eNeNsSOPk7XG3ZP
	yNuOJMSjZywcprf2hQJ53syeDus7Ws7oWTFN8B43H+6MCBPDLFUWKdESLI3/bQsTqYgx19fJ7xJVQ
	5pDzYJC8K7s/d97wO/56t4H3XLAa64t6rTZI4WKog75AbAj1YjbrsbVYNmQaWzcBCBvSRsPLDp5Hj
	qQdapw55SFRAbmDHw+jgqllO7W3b6CfGnrmJw4LSTdn4lnrIZMEZcMxPEo0hWftSX41eQ/jzE4vZ8
	ve5eenASDJjHOZU1zK5yeZ9+NVKeg87/ZkRoO1SeeWGdsXjPe87pdSOlybMjRaX/YEjrDAX5gPhl6
	jNFb4oxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWHu-0000000CnpD-3Hu0;
	Mon, 10 Aug 2026 20:07:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWHt-0000000Cnor-2ZOs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 20:07:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B8CBC600AE
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 20:07:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7E51F00A3E
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 20:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786392476;
	bh=bYSs7pwGOcP1HawBNqhdmv009wD4aFz+D/7i7ebIbM0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ofNkM0AhJ0ECf2vZ3YjsXcL6Fm9B/LUx9zOf2sBqypegScFN1+CgLPT7B1bDeqx51
	 64PSAdfaZ1hzB5RB1MefD71UVLE+rsrI7C7ZbugQa6QuVIsqlup3TfRVm3MYkEkwwy
	 A9SeKcscMEkg2HrBmxV4WHgOk9fLvYOARh3TH3ELrwnPIXUjd4DVFm8T8fsJrpBmT0
	 m/mzsIMEkeZAYuOVcn9jjZPhAals1XDOZwp+BibAMzZhsMTjjC4CPdFfL19rCmVmwg
	 YbX8uQhX8QYpT1LFs60IIZ9w1QMfk3Zj3EDVp6skcK8i3xpbxauMyjx3Vkmauqblmj
	 FmdZm5LV/9d7A==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so81167e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 13:07:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpzCwx7IwOB5UTGrzxxL3QuXbfrgsOqgQnBDaW08Li+2mxNjU741ueOqGenaQSI1aK3tonpq4PJWJoeNq7+2Ytk@lists.infradead.org
X-Gm-Message-State: AOJu0YwIndBL3rpwU99VhkngAj2rS97xY2kFbio5qoSjrkVAkl0i528Z
	o+lTx8OrCMuKA/bZ1bWp/vP/bgGlNRRZoxrYPUzq0Ml93SElsfWUJPaazg8sVdPXNIIlh4K73rX
	ktauhw+d3vHfRzZ0BS+Ghfczb+F5e7pE=
X-Received: by 2002:a05:6512:3e0e:b0:5ae:a995:c16c with SMTP id
 2adb3069b0e04-5b2f4cc0f61mr5811088e87.27.1786392475246; Mon, 10 Aug 2026
 13:07:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260729132736.3807082-1-sjg@chromium.org> <20260729132736.3807082-2-sjg@chromium.org>
In-Reply-To: <20260729132736.3807082-2-sjg@chromium.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 10 Aug 2026 22:07:42 +0200
X-Gmail-Original-Message-ID: <CAD++jL=hGH7a-LM+Foy=mVxmVhCdtaxdaF5Mfo+3BCwMLHNVdQ@mail.gmail.com>
X-Gm-Features: AUfX_myfAckQ8mgU7iFbZ97rmWnbGSBawmIas1W-k7uCRWa4QUHeMhWOocB5lDc
Message-ID: <CAD++jL=hGH7a-LM+Foy=mVxmVhCdtaxdaF5Mfo+3BCwMLHNVdQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] pinctrl: rockchip: Decode drive strength in the
 get function
To: Simon Glass <sjg@chromium.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	linux-rockchip@lists.infradead.org, Jeffy Chen <jeffy.chen@rock-chips.com>, 
	Ye Zhang <ye.zhang@rock-chips.com>, huang lin <hl@rock-chips.com>, 
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

On Wed, Jul 29, 2026 at 3:30=E2=80=AFPM Simon Glass <sjg@chromium.org> wrot=
e:

> The decoding of the 2-bit and 8-bit level drive-strength values sits in
> rockchip_set_drive_perpin(), where it is unreachable: the SoCs whose
> banks declare these drive types (RK3506 and RV1103B) take the early
> ctrl->type branch in the set path, and the read-and-decode logic in a
> set function has no purpose. Meanwhile rockchip_get_drive_perpin()
> lacks the decoding, so pin_config_get() and the debugfs output report
> -EINVAL for these SoCs.
>
> Move the two cases to rockchip_get_drive_perpin(), where they belong.
>
> Fixes: dbd2317d7b9f ("pinctrl: rockchip: Add rk3506 pinctrl support")
> Signed-off-by: Simon Glass <sjg@chromium.org>

Patch applied!

Yours,
Linus Walleij

