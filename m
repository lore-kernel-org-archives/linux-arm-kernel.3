Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBC9C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 11:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lek6cL4/AbRQCXtH33ScvBhO9kuHePx/FpqKIeX9tRE=; b=AvwI1BH+eTAuXqhDKxrn9AjW4w
	LkS24LyUbLhLKD1YZbtknEB7mwWn1Mwx2+uJdtyUMyrsIAPxsHepw1nd5eXF8bme9CAuFmMb275DS
	Dmrp2+oT2ZnnEibV0p4TTXzCF2AZxf6jRe+FtCEF5naO59TKTtHDGKlszJSSNLnCIKnvzP1UodTsF
	DNsbMvgJ6vbsSd1VfpNrOW17S55xJIGMNPtSDgzg9AcmO6Ncy+avNF5QW8XAmru8pBYtQ2UK7S14A
	Fj9nlftbceFTK0fwYflvZCjH3Dpuasg1QdQ7gzJvrpzuGisdw0YukGdR0wN/k5C+nVMOuia3xBO/l
	JTtuSWcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wofwm-000000054Rc-2X5x;
	Tue, 28 Jul 2026 11:26:08 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wofwj-000000054QY-3dNO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 11:26:07 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c1c26d7e951so532708266b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 04:26:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785237963; cv=none;
        d=google.com; s=arc-20260327;
        b=HTJ2mAPgRIVYYxwkm6NB19o8oiETNoU2D4yAfxOhQ9s0nQVfttggLCM6OIIhhbsMKy
         HbTEoBoGz9d4xNiOARGq+yPSxm8+latyY2GxZ5EN8ZGn5ibuMzpFd5bz64xkChhnHYGS
         ZLM//8/z382RbGkbqoDMxZe0OYXMSEJddrVYHq5X2arqVljswXYu8IT1nru9TWsNDLwz
         4te8ZOkay1LOkECCoyfoGCRUUsWmbnFc0D2kwvQKr1KpL5KKEarWq8I/Irg0tWovJmxN
         By6nm8pqm8NqO67HBN0GdcD/texigj3pNL2Ix8zNeaIv29KxyxbWcaWC1D/j6xQoqDBZ
         7dXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lek6cL4/AbRQCXtH33ScvBhO9kuHePx/FpqKIeX9tRE=;
        fh=8x6S9AmXJtPq7kugJe0L3CJJiBfnXcNwdOpfLfVJPxg=;
        b=AJZRD/2gMofP6lcpGtTGpTeXZGvkvPnkSlLpHV7Rms9khB7/XDPyO3uNaO4Etx1a7J
         NwerpvCdD/sVLjmlJtF51LNSf1E+xFeQKaTW879jrUDsxkEWyWr/rmesHKG71Zp7oEmG
         pq2BvTSqQmYVn2qlBMmyVkuyotDmjNH24Bb7ygY6R1apkEq8oVxUTaZOIPLrhpsQZ/ko
         k2/+Sq6O7/guyH4TNTGj0ceoSeXBOUY532VeAS0W8MGNeLnIExpWe05+UWWBu8pW7Cfx
         7rjgeqNHzOBEC8Y4BgaH413DoIMp8nCrBpj1WgL9T84KoiqzvNGsLwHFLcVX72cfAJR3
         ZjEg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1785237963; x=1785842763; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lek6cL4/AbRQCXtH33ScvBhO9kuHePx/FpqKIeX9tRE=;
        b=FMQFNXRFF8s/mT14EzzXJqMQ307ry//ox2eO7DLEH3301nQCYsDphxJLiTijvoo/eI
         c9KN1cPYNXrO5xQkItZJt2A0bs9uvZI/AbrbkD64D0BDTD9VeNy0BzuCV9yEifwzcbdb
         I2BxXMIYBqre4ji2vtmyhJJcX2Sj9Ko2rkUld/JMhKQPT6/l05CaclxlkUwjp6/ATREd
         jCzCmEjX5Dx16GVfT0XhujJwraK84n0ubTaIxZ/00GYRCI49TmnG92VX7pjDDifczs+V
         WRGROfyMVLdb6lQ79AZ7nhZsX8lvoEdKz0Gxp6HoWQoaKHWhCrN3Ul8Uxtf4R9KNN2N0
         9pDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785237963; x=1785842763;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lek6cL4/AbRQCXtH33ScvBhO9kuHePx/FpqKIeX9tRE=;
        b=S3F7EnCt7VpjUNzcRKqff0KSgdI7kSjk2yRO52j8t9Ov5H24TphXill9L6QP4v9RVc
         RnqHMgRabqrVQIImbyeQAnm0nsRLBGDgvqPDcLz+rMUVrZzXHNaXgoNp49gfrP4jpX0n
         O2GhpO53qTzAsC5M3l9IPJxhroc9gaNqNZatVHJXI+fi73Hq84M99Cn6hC6nGEY8T0r2
         G1yctq4RtmdCTQdKDtCR6s8DUADPj3UjRCy2Z4AU07gfjuOAA7i+1UvuGQNFMlFveFzJ
         O/lHGtiP+DzQeOjnBtw6+uyuhz93a2tMtdsM6VsCTiBloIXTcqO7Bnor/JmOqAau97Yq
         qq0g==
X-Forwarded-Encrypted: i=1; AHgh+Rr3aTVIDto2LNM0p+sLVmpaI1TOpiBTRdMk0ZlpM9UZBBGXwXqRbj3j67olpoOfn45/Ta8V4I0RJx5W+sh/Qdkd@lists.infradead.org
X-Gm-Message-State: AOJu0YxQqPATw2pJXxYnTRy0wYZxpJtY/xJ29+Uf49RJwxTdDAAoM/hd
	Gv+QKLu/XyZIU2N64t9YANUWXZswwPZ/KOkRqdMUzXdVuBolDHtet2Z7c35KHjV8lJN9hKeAx7B
	dv+bXCKr1+nGegC/Kq8tfLwTV7+p60Ceg9454F7acCg==
X-Gm-Gg: AR+sD11YpnDcoAmjPjGk/bigljuBLCwb/yuR9h97SitRwwH/JnJQvbEQN9BXmO0viDb
	6EprBzj9RWk1zxwVdL2AkYYzUFX9KGuVRTFSmO/HANXFlZL0/s2pwYRcFMYIdMf2qfzcmtZxQ0P
	19HxhlFcEoK+N6xjwYQkkDtUva9ExM27JAJ91+EKy/pZPXtmQd3RirGyj3WQIj+LQiJ2AWXh6TW
	lMts1pFNs07CfA8IbO/Teqcik8L1bC6uDYJq05V5XU4tpqAJHRAo+XWH5Dgyss=
X-Received: by 2002:a17:907:c80e:b0:c12:34ed:da14 with SMTP id
 a640c23a62f3a-c1f72504745mr91551666b.64.1785237963102; Tue, 28 Jul 2026
 04:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260723-rk3588-fracpll-v2-0-3adfb9dda235@flipper.net>
In-Reply-To: <20260723-rk3588-fracpll-v2-0-3adfb9dda235@flipper.net>
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 28 Jul 2026 15:25:47 +0400
X-Gm-Features: AUfX_mxMy4BRnDAVX9M9UW7_BMaDykpALH1nDWvPyZtvog3_VcfjLyQR3l2_74U
Message-ID: <CAKTNdwHcJvpjkG741j-bCTePb5n0wiu53eHctT8qfP4NdVCqVQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Fix RK3576/RK3588 fractional PLL rate calculation
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Heiko Stuebner <heiko@sntech.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Finley Xiao <finley.xiao@rock-chips.com>, 
	Elaine Zhang <zhangqing@rock-chips.com>, Detlev Casanova <detlev.casanova@collabora.com>, 
	Sugar Zhang <sugar.zhang@rock-chips.com>, YouMin Chen <cym@rock-chips.com>
Cc: Dragan Simic <dsimic@manjaro.org>, Liang Chen <cl@rock-chips.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_042605_927560_81A2C9F8 
X-CRM114-Status: GOOD (  18.90  )
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

Hi Heiko,

On Thu, Jul 23, 2026 at 2:22=E2=80=AFPM Alexey Charkov <alchark@flipper.net=
> wrote:
>
> Fractional PLL rate recalculation for RK3576/RK3588 doesn't correspond to
> what the hardware actually does due to two issues: wrong denominator for
> the fractional component, and wrong signedness of the fractional
> component. The result is the kernel-visible PLL rate being off by about
> 2 MHz for the two affected PLL rates vs. what the hardware produces.
>
> While this fixes a real bug it's not a regression, as the issue was
> introduced in the same commit that added the RK3576/RK3588 support.
>
> Note that there is a separate unrelated issue with the rate table, namely
> the 2256000000 Hz entry currently leads to a VCO frequency of 4512 MHz,
> which is just above the TRM-stated maximum of 4500 MHz. Also multiple
> entries in the table end up with Fvco < 3 GHz, which according to the
> TRM leads to a PLL period jitter of +-2% vs. the +-1% for Fvco > 3 GHz.
> To be revisited and optimized separately.
>
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
> Changes in v2:
> - Split out the denominator fix into its own patch (thanks Heiko)
> - Reword the commit description for clarity (thanks Quentin and Sebastian=
)
> - Add relevant clock derivation formulas and key constraints directly int=
o
>   a code comment for easier future reference
> - Link to v1: https://patch.msgid.link/20260721-rk3588-fracpll-v1-1-b289b=
f17cf17@flipper.net

What do you think - is this good for 7.3?

Best regards,
Alexey

