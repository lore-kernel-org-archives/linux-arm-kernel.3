Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7692AD3399B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 17:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YnLp2twzv2TNQbo4aCFZTZoiRr0XaMjJP+UKxGSJsRk=; b=aQASe/gE9Y8dNwfSPHMzO15ugQ
	l6GXTA5A1NNPElQvQ+GMsb+zNcoGssSPla1769O+kOY17UOxpPvyrIBa47+jYvj/ceuZbyZjNo2cB
	/A/YWCBeSol9ieUoc3YvPQk/TF38YVKzExjFsPjYyzS9L3/W5iAs6FQiH/+E52H4BelRXJ0iRDxjr
	lxoaSZgqTr7vZFxfmEKs5vJziHSehg6Yvsg87mUN/t+JYJNJxv+RAKOWHZLb51cZBRj45m3vCBiD6
	r1b/1F5NajghDoFf5SGdgq2X1X0vvO1bT/jkuRsyRSq3LhLQu+9nwGS2v0YXCJlI0QUbzrVx3QX1l
	zzWlzRRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5TAe-0000000BbTh-46Yg;
	Mon, 28 Oct 2024 17:04:49 +0000
Received: from mail-4316.protonmail.ch ([185.70.43.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5SnY-0000000BXVF-02IU;
	Mon, 28 Oct 2024 16:40:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1730133652; x=1730392852;
	bh=YnLp2twzv2TNQbo4aCFZTZoiRr0XaMjJP+UKxGSJsRk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=YDPMWx+VopN7IYplxBpOGlkFuWwiT0GjcLnCz/I7w3zK8cYhr/x9MRkDkWtFKNbt0
	 GuokZV2xiVMslVNXUso5BClJwe29PB0anTiGBGDxkAH4/4g/0Pdq/ZQYpn1tbsis8d
	 Jh/j1593zuLLkEzL9LtnyXZiyk1dsrdn/4GOXE9o+SzVZclfjLV25zyy4eABWHjZXo
	 ReRwqZJjW7aUN0dQyecLkqMMwEg4saP5paeE4yNMUL+uPOQp2W+WM/cuuDVY7VukL/
	 p2OCHCd9MA/8rzOp1+hz9J9t+5YSuQPGA8qkRUx2Kdddk4PakB/P4Ex23rK+F2UQDU
	 rqdNzkUVc3Qdw==
Date: Mon, 28 Oct 2024 16:40:46 +0000
To: Andy Yan <andyshrk@163.com>
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, Daniel Stone <daniel@fooishbar.org>, Dragan Simic <dsimic@manjaro.org>, Diederik de Haas <didi.debian@cknow.org>
Subject: Re:Re: [PATCH v6] rockchip/drm: vop2: add support for gamma LUT
Message-ID: <-rVNN65kgfRzFJBJDIwQF3jNMfXIZFP8GibtUgB_p-eWGLBkNZhYFr-BXEas8IjjofHxWQUqNicUSTp5rb9XmuLi35XsDd0PzJPz79j-M-8=@proton.me>
In-Reply-To: <2bb58a1c.6287.192d1dc9b2d.Coremail.andyshrk@163.com>
References: <20241016223558.673145-2-pZ010001011111@proton.me> <DurUfF_0TBHKv4DHKIP3ggQh_85nRY0usYWn_fu_oJ45txO7dGKv-OK5rl6EDEPmX5l8WzrwPCzAvYz0xFPfeKGyx7enu1g-prsWIpilv88=@proton.me> <2bb58a1c.6287.192d1dc9b2d.Coremail.andyshrk@163.com>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: 70c53b22f6b3d3f24ee6b0df1f6f75d1e7f29476
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_094056_803375_D7633D96 
X-CRM114-Status: UNSURE (   7.83  )
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

On Monday, October 28th, 2024 at 7:42 AM, Andy Yan <andyshrk@163.com> wrote=
:

> Hi Piotr=EF=BC=8C

Hi Andy

> Tested on top of Linux 6.12-rc5 with rk3566-box-demo in a buildroot + wes=
ton environment:
> weston --backend=3Ddrm-backend.so -i 0 --continue-without-input
> weston-simple-egl

Thank you for testing it!

> simple-egl will draw a triangle on the desktop.
> After the patch applied=EF=BC=8Cthe triangle will flicker again and agian=
=E3=80=82
> So it break some function=E3=80=82

Did you have gamma on? The screen flickered for me when I ran something=20
writing gamma LUT frequently because of disable step I reckon.

> I've been quite busy lately, and it will take some time before I can anal=
yze what the specific reason is.

Np, I will try to reproduce this behavior with weston on Pinetab2 in the
meantime.

Best Regards, Piotr Zalewski


