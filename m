Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE487C5B567
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 06:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cMPYqH2rSsPZKaiB6xyd/bPub1tzYs85s7i3sDSGdS4=; b=PQMtM0q6UN+1Ej71Audtp/Bbfp
	jAVXOzuROO5B0OGl73zyE8ZARSiyhlS43yuADx99tv8VbACm3llatMPs5cT3UuWRXxoSscXBkIDyD
	PAIsw3OHYlafd0W57M6ppJm7y7YPa/d16d0GvGdDBugDhN6PJpZnngabG0d4FfbNDnEgWp5m+OAa2
	fHEydEza5A6A/pAhBupbYREqZ6cBMZouVlau4pE4l+wWd+iLmFz6za92hgewxO+jUaasrOGSd0Wsn
	wVLD16S+mwYayqedi+Om28ykNVYP6FeK/znuMMkAS5OHZjKwCZ7XK+f/AV72fdXngNNl7OfWYQ5i7
	jnJyyGsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu2Kj-0000000FVY5-07k0;
	Wed, 12 Aug 2026 06:21:01 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu2Kg-0000000FVXO-2Ovf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 06:20:59 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-4a46a53abc9so403602b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 23:20:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786515657; cv=none;
        d=google.com; s=arc-20260327;
        b=msr3yJ5eiku0ZPVr85evqvWlf4wE98EzMIn5d5D8SHaeAlen0q9ZPmzXyWQDDnKKHb
         +hpmW5q7UVSzv2qeEaEn81GcmDSb+91CokWxNlyyYtRs0Qj/qimZDMp8BsgzdSBxJhzJ
         yUTXKi6AFkXqGvgCTv8s6Z9PGH9LFBYlvnaQtDwoNfVYAB3CklVjwajzwuaZ41iwyEtH
         vTL2aOgg9e26X0mCzoScB2dZJhHH4VaQRryKbwqmu8IoAQNr34sYBdbo2z0jm3vi5aCn
         HNoE1lmUpEDhEiRcn9mqpWjr42oCtuQ4Z75Wq0/Xqj6fS3Am+5pSrXtaFTDwpxLJRxRh
         4IDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cMPYqH2rSsPZKaiB6xyd/bPub1tzYs85s7i3sDSGdS4=;
        fh=LdK0Im0TmUJqDxKHru/hjd9FqmCjLLeCwLcevPs1D3c=;
        b=HnVq43ZDW7fmw5qDM3nL+pRbdODWizsppt2acQj7Nn6EQ2+VmYf/aboUcKINTwDIDR
         dNSQVZ5Cd/c3SXGuf1Xpl9lXMZNNUauqfAYIawFkkWTdrx+qWkZ//9fnASaUFZx2d6GT
         QP+tbXJbmi5eP81AZFmROhh8x8mSUkIWyeewMoumYGG/BnHlHfZIn6FQ4DCBBIdCi61z
         gRz0V0nzcTZi7ketSnvZZa+YIeaQpynTRoFKpnxDpaU4eZR8l8I36UxUE1LNUNBAqBrr
         CiCSN4TeN2OsORcpQp0+fMJisVXcBySIqN8YbHJFz23KTz/eY7OaKCFum2SeXQGwtwJI
         os9w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786515657; x=1787120457; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cMPYqH2rSsPZKaiB6xyd/bPub1tzYs85s7i3sDSGdS4=;
        b=hkE6deyxOHaQgePJcJ9WLXH2jMbRwxUWnRiK5FGypkx/R2xkqdUaR2IDNjHjmQN0TN
         5+mtV7OcibUtgYDod7A/vXidtV6mddbcGLkUoOXQpkCK8cf7bwo4mcKBU4gZr5+lAGAf
         +LzYUZEYg0VUhfpBrYoeJ26+0Aw5iTxA61q24rCSji728tAJu7B1QSTX3j7J89YlP7vK
         V9cbD943JsnrktUjhWKKPpCZqZqBRfFjmfzohSh2pz80ouKhCSTzMmXVSwTjyYuXZMDF
         RQV1/RMqZzIFLBrYeFtgTZfNuWQqz80hZSj7MIXT7ckAe/uvOcbR6vtfbwKiyLokZedp
         VpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786515657; x=1787120457;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cMPYqH2rSsPZKaiB6xyd/bPub1tzYs85s7i3sDSGdS4=;
        b=Bn3PFtwTYnIe5q4VSllxxjd77F7MsKKb0IgFQ9H7BzpU5TzVBZZHXVDtFpW5Pk7DEL
         qSl2YMem8OcXOqbQppfX4k3eSBvE8sPvfkqH54TSbNCQtX7DBqDvn5RBY1XjbTxPOIOj
         bP/6ETj0ZZCMnDPaO53SlnCEkVi7fZQuQzIr5+kymyeOitgvLlgpY0H3RjrjRBPzsFuh
         drk63DLBGTFhcY2zny/q6W4tqPvKy9gG6ta3CZlsCZf0QMcXqKVqQSDtXz89hiDqKuEp
         F5AIwEG00ZI2qHCZa3+XJNNM6B8X18zt0Mua8o1SQ2WqwzYsUynkM26/BgU+7zDA4fXT
         BKZA==
X-Forwarded-Encrypted: i=1; AHgh+Rpvy9Y2Z9oBN4Cya8RJ8qUlHa+kcirsOwywNXSOvahcTA1DuMjVUqJfeBzvgE2J5QzGmzC8eogJe5wtE9ZC620F@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3s8O1juwXdpx9zixgss6aEGIb/mLIpUXxjDNDebpqSp55qEHH
	28Lh4P1FX24QXV0LwU4He+yQc1ayzxKKTbgrt2tEzgn3fw/zoES6XCB5aR1RKXR1HXaMRKsi7pR
	rfrRNuNoK4rzVnUJKcHsrfKJNZ3JE24ngjZ8Hsah5iw==
X-Gm-Gg: AR+sD11Xmt9sO4rXCXJhVsLb8+NmzpEwhLLNtomenL4ukwk11kY6pqZf9Wqk5NLdWQC
	9FSf+0jHCympmcFF35DeOjMBuEah9h7P0ZsK4KdfnbY2rruPlyYHOq8bvEiBmP4t272BGe3Fard
	hBMs6OWOAu5J8ZneSat5dHf+5RCYwTuV67bugNiGZ1zaNEESY3KF7CKhHgWKgnlAGXz1Vyw5BNO
	U9SO9E8j26NzUpi2k3qYRzrnf2IH7x7jJDQNW8veuw49M1BsU/BHxJnd/GqP84/Gkmwo8X8I4fm
	1PybHZHuf9VPlc/2xFWV8hbEj3YxrtVRpFtRDLzq3bx9gpoZ8FGOdfTkArAbVJzR+/WkRKw3i2T
	RvrTJDzw6Gn6y3JyWoLtqcZn8JRDL
X-Received: by 2002:a05:6808:c187:b0:495:f223:bcdb with SMTP id
 5614622812f47-4b21061c5damr2531855b6e.0.1786515657026; Tue, 11 Aug 2026
 23:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260804072630.28745-1-arash.golgol@gmail.com>
In-Reply-To: <20260804072630.28745-1-arash.golgol@gmail.com>
From: arash golgol <arash.golgol@gmail.com>
Date: Wed, 12 Aug 2026 09:50:22 +0330
X-Gm-Features: AUfX_mzlabjmvWrDZZ1bt6DkpShw2PYSh2yJEy72hNkw53lZIQYbsjEUo5mnP90
Message-ID: <CAMxPZkgk4+idrZowJ1z-ddAzaD-hx-NJP+KSj8pUrSfL0HH4aQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] media: sunxi: Resend active-state conversions
To: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Cc: yong.deng@magewell.com, paulk@sys-base.io, 
	laurent.pinchart@ideasonboard.com, mchehab@kernel.org, wens@kernel.org, 
	jernej.skrabec@gmail.com, samuel@sholland.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_232058_618791_BACE66A9 
X-CRM114-Status: GOOD (  17.77  )
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

Hi Hans,

On Tue, Aug 4, 2026 at 10:57=E2=80=AFAM Arash Golgol <arash.golgol@gmail.co=
m> wrote:
>
> These three patches convert the sun6i-mipi-csi2, sun8i-a83t-mipi-csi2,
> and sun6i-csi bridge drivers to use the V4L2 subdev active state API.
>
> Each patch has already received review and testing individually in
> previous postings (see the changelog and links within each patch for
> that history), but none have been picked up and none currently have
> a delegate on patchwork. Resending together to make it easier to
> review and apply as a group.
>
> No code changes since the last posted version of each patch.
>
> Arash Golgol (3):
>   media: sun6i-mipi-csi2: Use V4L2 subdev active state
>   media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active state
>   media: sun6i-csi: bridge: Use V4L2 subdev active state
>
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 155 ++++++++----------
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  27 ++-
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 ++++++------
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
>  .../sun8i_a83t_mipi_csi2.c                    | 112 +++++++------
>  .../sun8i_a83t_mipi_csi2.h                    |   2 -
>  7 files changed, 194 insertions(+), 220 deletions(-)
>
> --
> 2.34.1

I've been trying to get these patches merged for a while.
Multiple pings and followups have been sent, but they haven't
been applied yet. This series is just a collection of my
individual patches.

All patches have full Reviewed-by/Tested-by coverage from
Laurent Pinchart and Paul Kocialkowski. Current status of all
patches are still New in patchwork, without a delegate.

Link: https://patchwork.linuxtv.org/project/linux-media/list/?series=3D2873=
8

Given the review is complete, would you be able to pick these
up, or let me know if something else is blocking them?

--=20
Regards,
Arash Golgol

