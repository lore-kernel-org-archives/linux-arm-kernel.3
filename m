Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95242C55173
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 21:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2w0TLt9QH7s0lqrlMH/OvUd0WbfPEFOdoqJKDBnB5Sw=; b=LhJtGFyergShSuPChLYpMS8fLo
	DgsOAC5u6Ijo5wtPyZjBYbK1aYkCa5mkjLQLpVzCDkWeXdmIOunsuQz+0NgXvoKJ6ZcFPhLBpa8WV
	PkdXyNZOr0hY65BJMSBDvldPBx26YuJYrQakeOZP004pKqgp1xuCAuZ3tZi4iDyCHoNcn7Ub6QjvH
	vxvyNPWGGs85FnjuXQhmv85v3V6pRvlCzCc1pUqDFkU17TG/n1SZCt69alkuKw9zSUG30lYZTogbL
	9gmF5eOjdZDh2KemptrmxSBHyIkfn8kxbxvDsdnc4ZpKLiltc1gBfzPW9jQ8LmIEslOvHXaNt81jd
	5Qqeyzcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpv0O-0000000DdI4-2QX4;
	Fri, 31 Jul 2026 21:43:00 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpv0M-0000000DdHE-0ffk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 21:42:59 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c1f7666a90bso240205866b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 14:42:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785534175; cv=none;
        d=google.com; s=arc-20260327;
        b=blvTLLIzMJbt4nX4JT62/cr7inVD1yVYhg/t+spq1UyCAcaRKNPA0nbJ69lCWdNyBF
         JHh0CFwlhhQBHPDNGOvQQimE0kScgJXYb0+I6D7NEMgrf597cXdYpsnaUR2gMpdcgVkh
         tEnk7DujmdmgdfEBj5ITQuLOyunlDuQm+n01mxE3WNTUJGlvyxQFeLwaRI/zHOk9xeaI
         Ud8oLCK5AwdHZYXp8Q+EsaC9cH9R26AKAYRS9NOlZZazu0Al1Tah3LZdSIHfBWzQmPNP
         hQkmWKWpnOC+2wWX5qn9eppfsY9OjkTgwmfzh5gzqLBNlaAVSLBF+rzr5mQHvCXq711n
         roKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2w0TLt9QH7s0lqrlMH/OvUd0WbfPEFOdoqJKDBnB5Sw=;
        fh=8NuRkEwprnScAxdHvaoWavHSfNiUE1l7yXfRGlACLOo=;
        b=EKH0H/A9FeevzfWIvIOdYD8WK2BEMrNM4lMqjR8x8wxO2Ae0fjfdBINUOabTmLmahK
         4sVMo5y8BYbicmK8hTGXfDJfU+O2mHb/iGpotJZR3KaZi/oc2ObkxMjpQWSOwumfBaBa
         3SXTvcpMKkGr/6zxpMhNFBPPlZy9KtKP9kVdVD6F4KiFAgaoxmZigMR9Fc47lRwU6tgJ
         FbrVDRlq8bVjqh6fwBEQMMowrXkQ+CXL437m7iewHBqun7cFCwhw8eX1EMQgudl6a5p1
         83pIlmVXXU8o58tRKRLoCshR2NZHNKeGSMoJOaUjLz8kJdWHCg6xueUwf/3u8fd8G+xl
         5Vwg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785534175; x=1786138975; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2w0TLt9QH7s0lqrlMH/OvUd0WbfPEFOdoqJKDBnB5Sw=;
        b=ORGZhSVF4dqx1e6GOt3KT24x5zTK/69hsuo+J8S3MCxwfshcdgBCDmJzS5hzzndgP0
         JTgnv4gNabtAb00MrSZlF/NJ8Jt4ZnkgqA9RIvjmR0vY7UiX1yZzi59ArNG/L1OGHt7l
         ZqhCshWmYRj+KZs9gS5F+9xxhcG01bBEqIeaPt1GRxKovPN+0g8IlLV92Ikx/QnF6GNE
         BeX8wojWBATwHs2bjN2dUAQF0oftJF8jjHSj2MjRY9z9xy1oMQve/alCqIHr0FHCrvyR
         0k31F+2uTma6J7Xf9vWBhYR+UYHZRI2DUBQ21/BwSj01Y+pgkkV3TXh+tKy/ULXCAYgw
         7I3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785534175; x=1786138975;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2w0TLt9QH7s0lqrlMH/OvUd0WbfPEFOdoqJKDBnB5Sw=;
        b=QVJlkak9EX/r45LOPcah8vfAQ0wm4QVcpQ5ZwRxuyqlYMOTN8M1/hzJjFSuWDkaAW3
         fa+s+0XvICWRJEomtcZdthJXwX0VW6Vy6NDOQkh01Iy9tzbMaQSxDRbwR+PMHh3Z2qvP
         3DHQOLMHfkzZz5kba+rAD77BDFL15ezUqK+Ir4MUXKwgAaAE8q1+pNRc+pJGUFuFGwiX
         CX7ipr6Z6O+qHe1QgdbDxpuc/5bN6xCtG3vVSrcvoGBOH7aCtSgVP+6DRQR4z2HBwsmZ
         4IfVfbzeFbp23lNBee4rjDCnAc9eZKosUofnnYFqLTR9JQ2BUGQ4GSUNHJJFTz70AVkX
         xZ6g==
X-Forwarded-Encrypted: i=1; AHgh+RpJsKSMaxnPa/Nweh3C1VO6RitNObSx83aupiCoPwWF3MoyrPu59fH18Sb9AOuDkSbS01nchy5RmqpqEYxLQXz/@lists.infradead.org
X-Gm-Message-State: AOJu0YyZZ3+FBcrWvCY2Nm6g7GLpS1YC7yGz7IFpKbD3m0i4+9bH3wBf
	XwBXl6u+spbnwleLPEdJP287mjjlOAhz7/apDYnyhHQdc2ecWXRRA2BdSfoYh3KjQibdQFFYwDA
	SwwtXT6/g2JhEZAY+ysLDHLKZIQL6JMclidoXYbvk
X-Gm-Gg: AR+sD11lTIVfC3dowkFUJfZPN3MaqzTtbQlQAWeHVXBydpYsigp519T5tiXKAw7M5yL
	8sstqVBP7fz1c9NpxIbmbccPTZqUhBMAZcbOEfOz+AnzV/TKe1cvFRtYPrgK7x3G8KoQDbtXHXS
	8MymmDbtc4yV5ziZkeE4dM8Skt8UYYB7QDBB2vsXdPjt+aCY81P6JWDQ8QZfWpx0TLx2zfTRCZI
	r2KvreIuYPJBfBjqjeLOqUGKZhXJkkBHogDkfLQv4UElXb5wjCnD1J0i7HyGPGlu5akWkP5/PhQ
	KxAEmlL5ZoR+nnSgBIZjiw0oT/rv6c0TE2nbBt/osjXKU9XSYhNTfauQWXTm/BLgLNWXpRlUJ72
	76l1qrHQFLagbdyVN4mQW2aNDrJ7fZY8Ru7Th1ed8Mus3zFTqpmXLT2VECUg=
X-Received: by 2002:a17:907:961a:b0:c16:8aed:cec3 with SMTP id
 a640c23a62f3a-c1fe8315915mr71437266b.58.1785534174731; Fri, 31 Jul 2026
 14:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260731-airoha-spinlock-array-fix-v1-1-863a7e239a5f@kernel.org>
In-Reply-To: <20260731-airoha-spinlock-array-fix-v1-1-863a7e239a5f@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 31 Jul 2026 14:42:42 -0700
X-Gm-Features: AUfX_mxeDK0UjkpXMoBLEays-SsJvXAu7pPwCo_E4Ldx0HgqctY1Xwd1UgDCFnY
Message-ID: <CAKwvOdm0NpX9LXO9J=u4+S3-VzJN0_jxBMy=aDf6zUi9r5L=qQ@mail.gmail.com>
Subject: Re: [PATCH net-next] net: airoha: fix ARRAY_SIZE() division by zero
 on UP builds
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Simon Horman <horms@kernel.org>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	llvm@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_144258_221119_C18082DF 
X-CRM114-Status: GOOD (  19.01  )
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

On Fri, Jul 31, 2026 at 8:48=E2=80=AFAM Lorenzo Bianconi <lorenzo@kernel.or=
g> wrote:
>
> airoha_alloc_gdm_device() initializes the txq_lock[] array iterating
> over ARRAY_SIZE(dev->txq_lock). ARRAY_SIZE() expands to
> sizeof(dev->txq_lock) / sizeof((dev->txq_lock)[0]), but on UP builds
> (CONFIG_SMP unset, CONFIG_DEBUG_SPINLOCK unset) arch_spinlock_t is an
> empty struct, so sizeof(spinlock_t) is zero and the expression is a
> compile-time division by zero (undefined behavior), reported by clang
> as "division by zero is undefined [-Wdivision-by-zero]".
>
> Since the array is statically sized with AIROHA_NUM_NETDEV_TX_RINGS,
> use the named constant as loop bound instead of ARRAY_SIZE().
>
> Fixes: 78a35725e533 ("net: airoha: defer GDM3/GDM4 WAN mode and GDM2 loop=
back to QoS offload")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202607311850.6p0ZUVq4-lkp@i=
ntel.com/
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index dba7c52c0896..64619e9a704d 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -3467,7 +3467,7 @@ static int airoha_alloc_gdm_device(struct airoha_et=
h *eth,
>         netdev->dev.of_node =3D of_node_get(np);
>         dev =3D netdev_priv(netdev);
>         u64_stats_init(&dev->stats.syncp);
> -       for (i =3D 0; i < ARRAY_SIZE(dev->txq_lock); i++)
> +       for (i =3D 0; i < AIROHA_NUM_NETDEV_TX_RINGS; i++)
>                 spin_lock_init(&dev->txq_lock[i]);
>         dev->port =3D port;
>         dev->eth =3D eth;
>
> ---
> base-commit: 2fbade66245059c78daeaccfce13ecf499fffb51
> change-id: 20260731-airoha-spinlock-array-fix-d239f7841cb8
>
> Best regards,
> --
> Lorenzo Bianconi <lorenzo@kernel.org>
>


--=20
Thanks,
~Nick Desaulniers

