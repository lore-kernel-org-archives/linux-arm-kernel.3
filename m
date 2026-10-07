Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7933CCA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=csPIWgh2vjj2d+64o9x9jlg+4Kf6s3JJFOXj1yDjO7g=; b=2MrQZsgMQ2QlpUNocZUStKv649
	fLbXrPsed1bF4SoHW3pb5zTwfaQbuETmgcLHrZhefYOJUDT3Xye6lwP56Pjg0xKR/nvoN3BbpeUR/
	JOKhOFCd8MDnV2v9kpCB66KIdZepAmSuY/dwJv4jaFYEh5hFt3ROTM6wDMTr4vhjfZWQUrkaQqtmh
	/NqEpPSAZ9j0CNq4/yYTJEHLDi478ZbWSJemC0LAcxZygLC3AOJNIqxT9h6xqQXQoL/+bPuC3HWTN
	F55IMggITe364+5KB4+hUttRivRRgKeQEPZF0Ux9mH0BmbV11G+coANyzj4ibUl679OsekiuY7unH
	0t94pCcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPvP-00000002KsF-24XW;
	Wed, 07 Oct 2026 11:35:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPvN-00000002Krj-3eba
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:35:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F7E443EB7
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 11:35:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63C2A1F0089D
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 11:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791372905;
	bh=csPIWgh2vjj2d+64o9x9jlg+4Kf6s3JJFOXj1yDjO7g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=F1w1Uushn0CK2fctUMMwIBX9Q/AryAYvJosGMRW7lT+tJUc+G+RkL2hgCuE4F8xLJ
	 AzkTRul5lzF1AZdpVmSk6RIXiRaseePmVRvnbNbKOazQornNUUGym2LsrYuWbrmQqt
	 Ui/l1ZqWPO/wHMckVv90XMgsxI4/Nvpk9qhd3MlK58CeM9PKiblqEP4MQUvetI+aM+
	 VSSvqp0p0bFH6sXh1ae6H8SQ2sx+b6d1AfFxqs2RRAstrmI5v1Cksf3gHQfaFz/Gc5
	 mJxpSY96KehYo4SzmKUJgM1Q9ODYmy8hlM46gyORv2EymfskrSdaDPw2xwxvmv8dno
	 eLkcCgBAbkcXA==
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-48e9476e26aso548988fac.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:35:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwTCIt3lWdpctD9yHdXDF0N2iVw/Yl2Zirglo2YHtbzzO5kmBAazxif+DMPUBT+c/1i7q39DFGIuwS/L+7MIsKU@lists.infradead.org
X-Gm-Message-State: AFuF++lFpD5nN09swDVJnemJwUlVgM60MgdfG7AyDJkU0swfJc6KX2rR
	W7cgmqENdDb68XcQpYaCcWMggL9Sp+mbCgG5errpWe5jdYXdw0DVD6WVm0Bz60vJVLPcmQMKpXj
	9PlrwvLZHs0M+pzx8/KOfkE4zL9TmzZY=
X-Received: by 2002:a05:6870:15cc:b0:48f:e0e5:a1dc with SMTP id
 586e51a60fabf-4a2598087c4mr1786465fac.49.1791372904792; Wed, 07 Oct 2026
 04:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260925-mt6735-pinctrl-v9-v10-5-cc042983c565@protonmail.com>
In-Reply-To: <20260925-mt6735-pinctrl-v9-v10-5-cc042983c565@protonmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:34:46 +0200
X-Gmail-Original-Message-ID: <CAD++jLn5gm9iR9cJO5DnLjozhm9MgRpmmdemFZyTcGeL_sz0Uw@mail.gmail.com>
X-Gm-Features: AclHuK8GVwt3n3_Tf9yHLVWOERk-G9rrExeh-m6C4ooGn236qBT253lfkigNGlc
Message-ID: <CAD++jLn5gm9iR9cJO5DnLjozhm9MgRpmmdemFZyTcGeL_sz0Uw@mail.gmail.com>
Subject: Re: [PATCH v10 5/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Add bindings for MT6735 pin controller
To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Fri, Sep 25, 2026 at 8:53=E2=80=AFPM Yassine Oudjana
<y.oudjana@protonmail.com> wrote:

> Add DT bindings for the MT6735 pin controller.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Patch applied!

Yours,
Linus Walleij

