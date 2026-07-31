Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 858AAC5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 15:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KGP6YYWa3E46HVm4iujdsDlLjDhR2AjMoL5m0l3+/TY=; b=H2LZU4zWmoEDeFR3JpVANiJFmO
	9BtlpZl+ZG2qL68/hHXg1R9/Vp/RdTveAf0zr0Y2YvAWcebE+KlLGFTMmjEcXLaykaU8h4dp3FmM7
	gD06is6ZWv+ewHiTbjg0cFNZP142PVWqIUVgHQ/XiN+xsA+bKa0cPip/oj26JYqwFM4x/h9pDGJ7l
	HHbCphOiUI+tcja7ngkUGdT5lGYzhuV4LwB2ffljdKAhhP/KwgPsPM4Z+dRoqNY6SxxP+uvYQOyLI
	eic/puG8jG5bk0513oVPaIdsa+3OUtJ+JgXsNg4Oe39jdZGkGVZtd/ouDVpsV2pv5T/BtvR5c8IO8
	+9DkQTMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpozc-0000000Ct5d-3poh;
	Fri, 31 Jul 2026 15:17:48 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoza-0000000Ct4o-28tM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 15:17:47 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-74ad03fa605so622476137.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 08:17:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785511065; cv=none;
        d=google.com; s=arc-20260327;
        b=ITKjjnBuV2nj7hI9c374xSXZX6/+ndfIbMwyWdERKewK1a+H/Yyt8AbtVikIz7r9eO
         eqzEOqaZUfRog4yG4xy0JwiSH+/eeXGOjdmvsvf8Eg3m8iKtZWmfFx00URMQZy5j/tB+
         fYXNV6Qm6kKZLxEmrnxAgon7EuGj3lQtyzbwrFIGepbswEw1b+Y1T4Ou0Vg6suzUzypF
         9a4zdKxtCyhlaVB7nI/ZYYBsJBJjSoVuP7x/n/KwQPdxA0aQY4ffJNkS+n4lNQAKI8As
         E8YVLEqz5v91jLuxizqU/Glr4E/TFQ0hL2IjFBo7mog15pEUsEtaNP5BhcBfmiBNA2v0
         GQ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KGP6YYWa3E46HVm4iujdsDlLjDhR2AjMoL5m0l3+/TY=;
        fh=TGM9QA3F8qDJa6TjHl91DHyJ1QeinVOYwqI+4WNhY0k=;
        b=ErTOz3G+obkw3+tbl7TsA9g/GXMTzOG30W3TAzP9Ep6xTh4ob4TgUiG2YLsuajCvRu
         5BJq6hxbYYS/koFlrVUJQHTMtSD0jObXSzKVCnrqhefVggcjUB4AwKaV75lrCQ40qffN
         C5QFN14G4ZJnm5QmsIpiP5V0ej9ZbnKb3LUeBLvBcxiqZskEyAxXFj0sNfqs14PJKsFS
         j0chppRbj6FzijK6khZdmPJG2GdyjttKy2WW5LMGuO4SA1V1wJRlbUpPsve2cosGnjkh
         Qub1I2oQWWddOWsouvPRmYiglxuoVRzcQXpnHqzYLf7gONk+cXD0Bo5VjrYpfqZqDGKI
         fTSw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785511065; x=1786115865; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KGP6YYWa3E46HVm4iujdsDlLjDhR2AjMoL5m0l3+/TY=;
        b=U+jm/28XRYTqzyH/O7QBonicMuDaT2aDVDwHtSYzN3Z3+Uk3vgxBGqJo5aR8ku0HXt
         0/dR9JXh2jczU9lDrpOZ55goHShEwKGgGsGOMts5PNn+ySNgM+X5vY1dxOvgdH36vIdD
         TSqn7++FwqRVX30cgBpD6FeNddTXrBLgjtuDN0D0e96SZDSecCuGMzPFk02BcTYSLsSy
         KPoadi+0Zej+VoTVwi4xgVbJ0fARLYAbelBhANm+noaP6FbBdgIu0DKR+93oOshQRo/p
         RaFDeoefjiWVwVBkFKS+52s4BXriC+AQslmSweMIgwEWCZfTDSxvUmQzdvMFxI/e+yKb
         0xXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785511065; x=1786115865;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KGP6YYWa3E46HVm4iujdsDlLjDhR2AjMoL5m0l3+/TY=;
        b=dijGD7ytmZGn+ZlEAFvVo78WWFqfpSJhS8f1lYZitp1GDiQS9xeJidBHGHIjnY7Suw
         24WfL4D/6I7dkrNyoygVP1QxqxFJdlk0xb7PT0i0716dqPk12QiMnEo6x/2RLgbjvZs5
         EMdLMqDnSsEoTqDyWAcmIavUH5odtqEpUBXUizEvOfeT3TaVv5xxXdLKGql99V1/NMe9
         JoBSv9DOCysikSoX5fniOLTc05pLm2F/LYuPCjMzWkIEFkAM+A5D0pJTnDudvI3mDNkS
         luzmxZa3GLqMZKv74yfzjbxSoJGNvF99xVhh16I/65UV9iQJCugVEZggjcLLgA+S80o9
         gehg==
X-Forwarded-Encrypted: i=1; AHgh+Ro3/OMb8KNdi1J6rw/fVQLSYeD/bhQD4qb17VyDlLrRBy8Stsw+lh87oFZt8yq1EtHQfyjm2dNzk6csijAvXH1H@lists.infradead.org
X-Gm-Message-State: AOJu0YytEezjjSYquRSvpQiezsdiiULrCPvivUrhYnZiA8uQOC5ZNgBr
	orrsPbHvXBG8RlAbTpYpAtOOp8XoNq38JClTP4UbSIZkouwq2imWWo0KETUeJzSRrLU/GeJad07
	xeAvlHctDLrZoQxfGIzLp8oSiWMXDWYs=
X-Gm-Gg: AR+sD11fz7RgGFhq79WMuat66bnQtaEf0TujdlIu4DbcJCbNpuwB7bJtdYmFp+PLEpx
	b8pFvQeyYubew4kEf8S+SuiNZ8nqpE8PzSjT0Nxx7Gvuo6HPcpm9G0a+7mnnn094Rolv91kdqOq
	G0D8Jg11vf7ItiyKWLY8+Des22ZR9mSEUzlR1/JqGq+ZpdHXWGW7ZAyOBkcfHPQrLmC+qiWKKwY
	z1QsidEDOsGkyUNBD5L6cWWkMKigbb6YwrovfR6dWYHJGwv0Mdhj6LsMaxihWrE7CD/pINnW9JE
	JLKskgGH4cudYt6DLiHavpMylTMJYUHCNaRVfzKjZMjkFAGPb4KAzwizXXbtsAOSy8265pTmvf4
	=
X-Received: by 2002:a05:6102:441a:b0:738:1ef6:51b9 with SMTP id
 ada2fe7eead31-75b22260dffmr475318137.5.1785511064843; Fri, 31 Jul 2026
 08:17:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260705110221.153481-1-mdshahid03@gmail.com> <20260724122254.121935-1-mdshahid03@gmail.com>
In-Reply-To: <20260724122254.121935-1-mdshahid03@gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Sat, 1 Aug 2026 00:17:04 +0900
X-Gm-Features: AUfX_mxZnAVCtLemF1RKBEDkqKNByd4RYkTmPt_s3OtHb2BMMIen4YexrgB9y3Q
Message-ID: <CAAQKjZPwb00MePpUTmKZbn67jXp=UWX7m81evttd29L+9UcVxw@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: vidi: use memdup_user() instead of kmalloc()
 and copy_from_user()
To: mdshahid03@gmail.com
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_081746_559378_BA75DFFB 
X-CRM114-Status: UNSURE (   9.65  )
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

Hi,

Thanks for your contribution. I will review it soon.

Thanks,
Inki Dae

2026=EB=85=84 7=EC=9B=94 24=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 9:27, <=
mdshahid03@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi,
>
> Gentle ping on this patch.
>
> Could please take a look when time permits?
>
> Thanks!
>
> Mohammad Shahid
>
>

