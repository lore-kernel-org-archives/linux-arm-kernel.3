Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE7D1091901
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 17:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Onzzq7oy1lftP7IkujFnMbCJMSMTPD9HBxhnZj7Sc5E=; b=plo87HhzRbXbyZ
	ml/NQ/LMVzhkTlBjc4SghwAP0axCIgdpxCa/AWKJo4iU6ehzd6hakjDugnLx7kVhoQz9kHgBgPbCv
	lZAvBp60LYJm5VcM3/HWBskjHIMxSFPq/finxfjnPc5J5EXKxM4yN3z9iG2/JY3ETQmzHlMp/hoQD
	LCjwaGn8qDVXXYGX31Jk+CTj0hxdE1LJqX/SCdWGUNz1LVfn9kXj6XieC9cTNlNaWAealWgMlkOS8
	uUQh/lTIrbIqLRCeKI5T+qTGIJVSJPiUO6tS36tZoiPl8cyZ1pxULlP+s/yjw+r7V2Wz2m56BqQQI
	Am+/iv/h8m+ON/W/I6OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3HOM-0000000BEQn-0JbU;
	Thu, 19 Mar 2026 17:42:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3HOL-0000000BEQN-0gFf
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Mar 2026 17:42:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description;
	bh=Onzzq7oy1lftP7IkujFnMbCJMSMTPD9HBxhnZj7Sc5E=; b=cUsjFxzd4WQCoz29QxUmpzAqrL
	QkYwT/etNGniqxhAIupzQbtrSgK7KaXhMocYJ6ERakixvJUdXUsb+tpTMGM20dOhJzcIFeDjmWTBA
	MpuICH/20nTvEujupB5SgICb9/DYhoheAsLTzMOAacJMLq5X3Y9Gb4yySKF/a28/h9NOZljihGYgI
	pvA1EQTP28Apv3CycyTAK7gsAikQx7Iv4JXls8KFjvEFdQh65HRQeeehOxK8By/e5IXSuwyBa5QRM
	owWY4czxpevIHG21uwr7GIKu6at0ArUiLBfDviUi/Cd3UamwW/XKIWb9iIn6p09m46zAqC8EoHLmI
	bHpsXdkw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3HOI-0000000E8kL-0SLO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 17:42:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 19D5943A62
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 17:42:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDDD0C19424
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 17:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773942154;
	bh=Onzzq7oy1lftP7IkujFnMbCJMSMTPD9HBxhnZj7Sc5E=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=k8RCdVqFhBOGyF7c4rIFijTXollYxB5aVkzCF4SFduX+XgyRXWggF8Bz9x+59Y7BI
	 ZuClGhKkrLEJP5mv/IZ/vgufDxz4SNe22m+8sbkSL/Z5aBaC5ItNnkM/b4owV/L7sp
	 3TdihfzVecDaA+vEDojIh0LZTk0eKfFDj/kqBcFneH2Ib/YpPOJmzhuE5jJoQMJ8br
	 PVmSwTWjC/4pmykPZoH5sKlNiaWkJIhD9asubARIM0pq/7IVo4wfkWvHsiw0d/WSN5
	 fsquXVjG5cEUu5ArLVWx6DkeNSRMcFpUBTcczaN7+iXxjSP3fHYiKNMoKo4H1coTzE
	 pMi3kbgYm9EBA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38a32d36396so10655891fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 10:42:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+wzoCx/axhF3j4AJ14iJx9ma+Avhlnt7g8gAtT1Mdl6KfDxd1r/TE9pO3WGV9VQ1jfmw+Y0qCNnssCR+nAjWs@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4yLRIJIzkA68RqfTAxtkD67/dBRg7UP+0seTrVWlBNkBSA84k
	qUVfc06VhUK1SWZXrPQVs8XnI6z4ExbLHYwdHmg9/GibFG9QDIqKZnvQvaHzef56+WBvJReoJ5j
	AAgMMDz71IxlbCqK9iPiJ9RCiB8jwIic=
X-Received: by 2002:a2e:a9a6:0:b0:38b:f0f0:e39b with SMTP id
 38308e7fff4ca-38bf9dcfffamr543791fa.10.1773942152347; Thu, 19 Mar 2026
 10:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260319-rc2-boot-hang-v5-0-092834a882b1@mmpsystems.pl> <20260319-rc2-boot-hang-v5-1-092834a882b1@mmpsystems.pl>
In-Reply-To: <20260319-rc2-boot-hang-v5-1-092834a882b1@mmpsystems.pl>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 20 Mar 2026 01:42:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v64BTnUO-iR9G4b1PsX6TB4+Q_a0Tm+sj1dhFJ6a06iJkw@mail.gmail.com>
X-Gm-Features: AaiRm51RH75lnRJn_EBMohEogUERC_EJc127jS4qWxRj9yZmVAMa-2MWjYOn-TI
Message-ID: <CAGb2v64BTnUO-iR9G4b1PsX6TB4+Q_a0Tm+sj1dhFJ6a06iJkw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] pinctrl: sunxi: pass down flags to pinctrl routines
To: michal.piekos@mmpsystems.pl
Cc: Linus Walleij <linusw@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_174238_419321_CC2A5E21 
X-CRM114-Status: GOOD (  16.27  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Mar 20, 2026 at 1:19=E2=80=AFAM <michal.piekos@mmpsystems.pl> wrote=
:
>
> From: Andre Przywara <andre.przywara@arm.com>
>
> Recent changes in the Allwinner pinctrl/GPIO IP made us add some quirks,
> which the new SoCs (A523 family) need to use. We now have a comfortable
> "flags" field on the per-SoC setup side, to tag those quirks we need, but
> were translating those flag bits into specific fields for runtime use, in
> the init routine.
> Now the newest Allwinner GPIO IP adds even more quirks and exceptions,
> some of a boolean nature.
> To avoid inventing various new boolean flags for the runtime struct
> sunxi_pinctrl, let's just directly pass on the flags variable used by the
> setup code, so runtime can check for those various quirk bits directly.
>
> Rename the "variant" member to "flags", and directly copy the value from
> the setup code into there. Move the variant masking from the init
> routine to the functions which actually use the "variant" value.
>
> This mostly paves the way for the new A733 IP generation, which needs
> more quirks to be checked at runtime.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

Please carry tags forward if the patch is unchanged.

