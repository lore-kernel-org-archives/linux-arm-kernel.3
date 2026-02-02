Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17269E7314E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 10:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFOpNv5aGURhK7guif4BLW5/Z1g5jtAibOsBQwSYIj8=; b=KukJKJ1pjjDoFQ7oFEb1l4woEs
	3ys+FR4WgI/47oZxCBgkdgNaLtivMgwntUI/y1ozwQRo7l/AkM7lRN/SOtWy5mS4V/wl46kh+q9oP
	U43V2JF14m9NCi3lY5OqvBqA5II8ZBuZV/HwPMPt+RDYYcwhNufU01Q64c2hwXbXDAoP0Y1VUbzwJ
	QLpzjFRX4WCfeF25IQlzuDqXFaqVZWJpbP1fLpoefI2GWjsO0+4oFd5YSEfstJ2sloNyg+tLb38/k
	kv2IUdnD+LtOEhYsbRrvZEFckj8rphOjXuURcqelOb5bQ9QwypMEGte24jfBH/pM9iSMak4Dcl+2a
	hr+Rf6Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmrAl-00000004pMh-1rhJ;
	Mon, 02 Feb 2026 10:28:47 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmrAj-00000004pLd-1zQv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 10:28:46 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c06cb8004e8so1718915a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 02:28:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770028124; cv=none;
        d=google.com; s=arc-20240605;
        b=lGEyr44fbJ2sGxOrE2rFwaRnp4vYWRsCPPTlo3gf/VRL9opr0YXXpIXVVOxM9NIWbL
         8y4dcWlSBEw9IQWWnhYAlUD0aODtTdFpv9bv0VVB3us9hJ9oA2GP1CDfjtzkiXqZXRC+
         hs04FzyrRBfLjYfyybNHEgJ4cKsqFPxrvoaDA7cKrD3QShgzqLZ6j7I8KxNPfP0fixgA
         EavpAENZGm59bpEWkHOEiscltuvzdG66f7GPlZniA7Khv9ewggYCQbUYfuewG/xY6LQh
         LR8bFgqKTbJ6bXN19wFXQHf6RvdawV0IvKg+BKCQYlqYNPUrDXZ2UPWXO1VEhB0d3xO8
         t8IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MFOpNv5aGURhK7guif4BLW5/Z1g5jtAibOsBQwSYIj8=;
        fh=FBVrmWIAv7bS3NB9N3ApH6+vwvMBqphSE/Pgh8Y5XmY=;
        b=NJPCS1eYv/394aB1GPbY3g6GqJuV/6bUk7nTAQb0GxZInPOEtxci3t51+F7hQB6XWm
         jFjdbkjUZWGd6R8HUAmzj2eP8OuU9sdZMl4x0inVv5fPaDYBGU8LzfYZCyQuCJb7g6aT
         txDbGsKBdMSeQXjbYk/Tdg/uaZRvQ4sPwaP2/51aG2KUqh1IUny3ErYp39FpNNORSA+f
         JPxzSth1q1nvUt9kWb4XzKCKfoildVcDo7ojAniMVLVx7l4QTCezpqiKBsKS3ts4oGdE
         tnVJBzUEbovHiQfhSyBFjHEma29l8n5JCiisHlD77iJ8abl8JwxpFxmOgD9xRB73G9sp
         kLuQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770028124; x=1770632924; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFOpNv5aGURhK7guif4BLW5/Z1g5jtAibOsBQwSYIj8=;
        b=EsLfMsvXMqibcAHeWlm5anPcxzpKbUMCqEeDxHTIiIJFhXL3e4Q6S4AbmqIwscKQjk
         fTioi9Vfdc+g4pinaf+XpLfN/BDIj7f/KJViQ/loVQBeLvDG+h5tSOOcW5s0lqDCIZPu
         kZ/aaArmkUUqYiIrvPqq48XpRliWLQlRgIR50RD7bz1d3nJw8IQJVDjeK2pdiy3IVgBP
         HWLZd/syogaHc+gCKhPqZWQZrN0jN7kwVWbMkRUETNNQgES9WOqsQi3u/j7HfbjtKFFN
         pyk3m2U2LjLXvhhVu54Z/HtDu1rVjsxRPPvmNbEB/haVhpY7osEZS0rDtjVnLOnzM/Zk
         +kNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770028124; x=1770632924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MFOpNv5aGURhK7guif4BLW5/Z1g5jtAibOsBQwSYIj8=;
        b=n1ck7dZGv1ujpuqa+P841NRhOQd9M9l2Xj1k2Pfiv+tvOxDMV+OW4MM+elr/W075+9
         f3MykuefmNmABvrvemAYvb/XcQPllWiRtGL/XNKNQcRWKa8oq6+QnY3VnxuybQeD6s8C
         uURZPGB4b+nuJ38U0Q7Y8VEnhbJZxGqdQpl5vBCsbNfC+31O85FrE39Zw6ftRPg7L+SC
         Y0t8JqJMPYumhsm5uvbecyZwL/bOyS+OcZr7gHUpkIklUnOu/UKR08NDFRDAkFeVgqvB
         w+7ht3WWhCJZmJTkiiOPQZmB+KXh1WW5kuzuZhJeWmAQiDMFxae07Z+SApMxjLiMmeun
         ANZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCmb2aX05Go7yt7Pg9Yj3rUp6hr5PjQ0+/pK1auISmEP+nIr9fnPURoSx/OZO09XrxsJbiogUvbFVOQMsih+nu@lists.infradead.org
X-Gm-Message-State: AOJu0YxngJgn4isOxozh6L6CttOX6D6cisv5T9URz94SUYakY1o5rXLN
	9vYbQI8NNncv59XpLGUep6CL3HCBhFglB6DJfChppE1QFspAsiRHLnB2jO7vwpqI1rhb5m0ZBP8
	9fseMvSwywm1tNblYVl9kcHxHHib3phI=
X-Gm-Gg: AZuq6aKWrfN1s1IS7vEV9zZbOWu5elxUZ1ldlcCf1UdxoTVpj0j4gRpCRva6sSu6gkL
	pKpW/TBeDAixt9NyVvdQrr70aN0n0gKCfKzuBJEIDy13KaVHdokmRrRWdf4AYmhkpWUXx3Z8zMG
	4DEW/aWOLYrw3kIxp2XwSufUzDBhCUDCEBLegQW2B3Vx57g/mb9S+OkAb7cYB4ebCgYThQcldId
	H2DJFl12UMX+DFRXHd8Zd+YgIEa49POvG3ITACfr/2KlD6yJEYPKyS11bGehOFQ1TV7e1djl45P
	fmyiTsE3
X-Received: by 2002:a17:90b:3f85:b0:341:8b2b:43c with SMTP id
 98e67ed59e1d1-3543b3d65e2mr11169058a91.18.1770028124249; Mon, 02 Feb 2026
 02:28:44 -0800 (PST)
MIME-Version: 1.0
References: <20260119082553.195181-1-aha310510@gmail.com> <CAAQKjZMHSQrowPWnWaO88Wynub00YjGLPnSNCg4n4CyNwgYtTQ@mail.gmail.com>
In-Reply-To: <CAAQKjZMHSQrowPWnWaO88Wynub00YjGLPnSNCg4n4CyNwgYtTQ@mail.gmail.com>
From: Jeongjun Park <aha310510@gmail.com>
Date: Mon, 2 Feb 2026 19:28:33 +0900
X-Gm-Features: AZwV_Qg17xGCvCzPBxDLKPqusD21IoQMfG9fEwI1GEiMPhdbVzUTaXzYVLC5Kk0
Message-ID: <CAO9qdTHodCQ=SnnSASSNnNiTyjxb6r2yfVMuTvdT8+LRLtf4Hg@mail.gmail.com>
Subject: Re: [PATCH 0/3 RESEND] drm/exynos: vidi: fix various memory
 corruption bugs
To: Inki Dae <daeinki@gmail.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	DRI mailing list <dri-devel@lists.freedesktop.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_022845_515783_E6EA1621 
X-CRM114-Status: GOOD (  11.83  )
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

Hello Inki,

Inki Dae <daeinki@gmail.com> wrote:
>
> Hello Mr Park,
>
> I'm sorry for being late. I forgot to review the patch you had posted bef=
ore. I will proceed with the review soon.
>
> Thanks,
> Inki Dae
>

Sorry I checked my email again and realized I forgot to add the Fixes tag.
I'll write a v2 patch and send it to you right away.

Regards,
Jeongjun Park

>
> 2026=EB=85=84 1=EC=9B=94 19=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 5:26,=
 Jeongjun Park <aha310510@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>>
>> This is a series of patches that address several memory bugs that occur
>> in the Exynos Virtual Display driver.
>>
>> Jeongjun Park (3):
>>   drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection=
_ioctl()
>>   drm/exynos: vidi: fix to avoid directly dereferencing user pointer
>>   drm/exynos: vidi: use ctx->lock to protect struct vidi_context member =
variables related to memory alloc/free
>>
>>  drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 +
>>  drivers/gpu/drm/exynos/exynos_drm_vidi.c | 74 +++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++-----------
>>  2 files changed, 64 insertions(+), 11 deletions(-)
>>

