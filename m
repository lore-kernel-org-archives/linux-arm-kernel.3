Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC8CC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 09:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8029mWw6fjtVVvwRbx9nUYW/Vr2qA8XHwwBIbWh63c=; b=Z+tpSRCt1Ki8FaSQ3yhFJs63Cl
	G3rWBUTciwj+Q1xNzXdVsvn7jR5qoU1BELHE0Gp8BSLCGpPVEcXyoN3hyMZY3fxYe/6r0IUOLOgbe
	vUSGB33jhJTTki9OjrI+6SgS6CtHVPygwRv4lmvg0bhq5s/yFYBULO67NNWZG6MeznP1d/pPqa8OX
	kyWQJSxsXRzuGmZSADO5RyD44LmwdfxS6YAvxk3jgcchKHhaVggHaSPhY55k/3gUyxUlhfqbElr88
	bZ5jqi4RiOHJ2zjm4Z21I/fieYNOcnGlj+B16A8N8VrkpDKoPi+u6KF/vEbQ+PAmF3lmzclFCFljV
	dzfWCz9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnYTO-00000000CZl-1PBK;
	Sat, 25 Jul 2026 09:15:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnYTN-00000000CYM-19BF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 09:15:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C47B600DA
	for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 09:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE5221F00ADB
	for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 09:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784970907;
	bh=B8029mWw6fjtVVvwRbx9nUYW/Vr2qA8XHwwBIbWh63c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=a10aFBj4NUY0UoNVLMkunTyB8DT51IWLM7ThAR+tK+e85ob8my52Jt9ARVSozVWQ0
	 /xiq+r9/G0/FbIhMo4x+jMmmZeZB+WkOKwUolQmdKuDvN+L3YEKI6z8oCAbRdzSt/n
	 eSmDZFRyA92WAiCjg9KB6EO4MdDjRT+fXu6r4uAG7Qs0a1MNABPsnJX54l+pwwe9jI
	 /f7aUVobLQA2CtAREuHAaZGUrkxcgZnjDQpXzHbgTNPUiroIp+qh04ukHQ7gw1wehk
	 O1HfdH0uih+U0zd65qe6CXymWDBbb3D2vGMwdvFfbvp2knmTQgqyVamUZikUbHQYvz
	 OEJqrngvMJYuw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so1436436e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 02:15:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro/L7F5J/MceUSMoHjIgUCY828gKaPdEyeXwd1/cF2X48nKhjPEo9P6w+jQ/UZNoEJS3LowcTCi67NKz04BfZtq@lists.infradead.org
X-Gm-Message-State: AOJu0YxYGB4/8Lishf+gNVU2pVUT7rbSOuFq71v7lDaFL3JGDTp/n34R
	RgKH4/zAEtwTOemO6qchO/vMLLVQ/YJKj/FByIXnlrb7Hnrn1eZrIN9dBRP+1q5rE0Hv1hGlqTX
	CGVUrPB3mTcv44CyCYnT7j8z0KT3JrTQ=
X-Received: by 2002:a05:6512:6d4:b0:5b1:5d07:13bc with SMTP id
 2adb3069b0e04-5b2c1b59b35mr260489e87.61.1784970906334; Sat, 25 Jul 2026
 02:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260717105847.131359-1-panchuang@vivo.com>
In-Reply-To: <20260717105847.131359-1-panchuang@vivo.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 11:14:54 +0200
X-Gmail-Original-Message-ID: <CAD++jLn=aRZsP84bcygGYON1Vgm3TOqxrkDFi=OD7v0-+_2gkA@mail.gmail.com>
X-Gm-Features: AUfX_my8JwvTIIgKU3n3CvruIp2CFzDYYelhaPZUZpJEgrhPtXpEkhfkCApkmrs
Message-ID: <CAD++jLn=aRZsP84bcygGYON1Vgm3TOqxrkDFi=OD7v0-+_2gkA@mail.gmail.com>
Subject: Re: [PATCH 0/4] pinctrl: Remove redundant error messages on IRQ
 request failure
To: Pan Chuang <panchuang@vivo.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	"moderated list:PIN CONTROLLER - AIROHA" <linux-mediatek@lists.infradead.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:BROADCOM IPROC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>
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

On Fri, Jul 17, 2026 at 12:59=E2=80=AFPM Pan Chuang <panchuang@vivo.com> wr=
ote:

> Pan Chuang (4):
>   pinctrl: airoha: Remove redundant dev_err()
>   pinctrl: bcm: Remove redundant dev_err()
>   pinctrl: intel: Remove redundant dev_err_probe()
>   pinctrl: Remove redundant dev_err()/dev_err_probe()

Patches 1, 2 and 4 applied to the pinctrl tree. Andy already picked
up patch 3!

Yours,
Linus Walleij

