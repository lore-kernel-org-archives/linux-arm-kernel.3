Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B742BC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 04:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0OhMOSuXOUEXfdlbZU0t+HljDfm8+At7UQaWOLB5k7o=; b=h/NzayHwcE9VbDSoWK/p0TDGQO
	uS4leY1c8ny2heFO/fjwnEZN1/7AMyHPCgqekR1tsUKpB404vSNFdQ7VLhuqCH7kuL0Nu2y02TqU3
	87aY0QAhPgPtrOogm3UqEkxZPa80rneE0bymfGnzJQhhlb97FG8a9qrHqxDLfpJ5xEV9t17VUTlpF
	cIvIRcoECXUgbeBT1ENjDaI6g/aoeSG2xRrSeYMjLSHXqWsqUDJ9rdaX/Tk6VXsHoC5fGI1Jo9Ip8
	Lv6xQg0Y+Gt0qoVGxVJt38yOm+3TQHcKR6cVd9y36ZPHmxGSyTygnUnRWLcOfB1q7BzL79LKQqpxB
	WWR4qMqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wteHQ-0000000DHkc-3X0x;
	Tue, 11 Aug 2026 04:40:00 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wteHN-0000000DHjf-0Q9r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 04:39:59 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so13125715e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 21:39:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786423195; cv=none;
        d=google.com; s=arc-20260327;
        b=du8nqFAjLMOQp/v7234Feq8QnZKwuLmTdplHEZVG9dXttLe0cC5XlMXx6ePWuQztDJ
         s5n9PSbBh5sHLbaVO7NK+jnnocuGYo564uGi6Z9iVlyEgDfjjXYbe2e+w6svJntP6kTS
         DepQwDB/JpuliPEDxA8ppR51f4ZNHRpQw+0EXeaiHvLrvLewpwS4DwRU3Cg5gd53WXXE
         OIBDR6+EwK+rMgNRu4SRposbsPlGWelVgrfjlb/fKlzA5Eh9/zd8h2BJtqh6Hjxrubhb
         BL88O8m+ggtvFIgR7qjNGOq8PAL52i1160rk39gBxK5yravud1QZg4xR6Ad6QE/n9iPn
         M8Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0OhMOSuXOUEXfdlbZU0t+HljDfm8+At7UQaWOLB5k7o=;
        fh=KboIQMeY2R0njQMhUZCZCCKxzZgVcjjunk9NbQEPo+g=;
        b=FSe4E4KqO+r1U0AAe+h9CD2h2U8jOpv6O0wL+qhCgpdnwfSwtD3ctCkOfQKrlOdaVr
         hChVpnYtXo+VRId91L9JamSj2gytcgkzSs3VW4zEbED/QL/UFhZoG7VRzJuoqlCF8QnI
         DKfnTEnnR6EDJUCwRO/bXlghl1BOJxKRQeHbX+6Q5VS2pPHVByDnChrQW8FkaI7MuiG/
         azh9I3RDMLTUPbatDms9N3Ll9CnY1wNbafkq4y2d3mcn74NPGilJpuICglpUBOeqq2+T
         TyIk3pgrKwY5AuuBR1YIf9f8FU67q4B5wZJEUSg+3LWZvarkv1YX4+9e+gUbdboWBuPr
         tATQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786423195; x=1787027995; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0OhMOSuXOUEXfdlbZU0t+HljDfm8+At7UQaWOLB5k7o=;
        b=mlXzPQb0lMi90mrXDfM1Zqm0LL8hjD5YcRAjLoWtqFPy3OnbUMe9RO9GzHELwFD6vV
         CrqqzCvc6GovRB+PfSJs7fnL24lxRwvjRt3fwdtAaRstWEB4kh+TAk0NXophR89oIpMP
         7sl9+liNGxy3bocot8zcCxRdLOwFQVWB6HbsASlswFSDkuyDdsqflLBT951H/ThXAWnP
         KYCe5UOZnN2hcZKdOvlxk7OEPsCheWPSs+87OVKL1b+wQdMpBKDSqAxDkWgINPt+G7w9
         l1D2kYuGR0hcUYT2Yh/df+163tL3AtAgiwtqqEseVn+m6LHTdIEACKA8Jfmjv6asCNyn
         baYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786423195; x=1787027995;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0OhMOSuXOUEXfdlbZU0t+HljDfm8+At7UQaWOLB5k7o=;
        b=jEpYEXeUWysQQepQzSHlpaXjv4YZ8DF5sgxTLKj8QLVNOw9mFq0tluem2vJb0y5iQ7
         Osirv+2XkenD4DDSD/c9H6vx2T8tup234V3uFodNuVggo1slRfFUBm9yYtOHDka+evKM
         jdAX0bHct1T5Ui624e0T4Ap42RyQrrxkt+tTiBS0SMwm2fOvV6QOzWMfcrfV+CDILl10
         NSDg0TQ/3UoCUn6ew5jHsjoy2gjaqIiog5QupWZ+jZnT1VAQMxVGccY3CAM/SGyBg2gu
         M9+jnEPmJdczZ40eBbV+Qkdxn3spYCA+c4sa5tp8ibzEK4xF9EmELppSYoEjIPMiQ7JR
         vVsg==
X-Forwarded-Encrypted: i=1; AHgh+RpoHpWf69EvkBKbOpQnGrm5hFYxkNi/Ku/yI2Bz7lIUvIZG+oee17nqu67Xeg2FYISk2ub0fLRxql1IidQZfhNO@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2vuB35pMdXZE/gmDbEo87vb28VD0lljXQ+11v03Jxid1BbDBb
	Ss40bKo7PJWSfCoMl3Zzq/XuHJmR3s9o0a4QH6YnXjOVZgOLJyibjhMvWgJnzPMNNXc5+4Whw6e
	xyjvUgF3hTqK6aEF4gL5TBJ82lEx8iLI=
X-Gm-Gg: AR+sD11nAnP6jsLqLsK7jbcDWZBoUI0PgHhmFG5xxOibGaXisKfQNctz7tVducwz/Zv
	qFBOeWIVs1l42X7gOM9exO0Hvwuyf9RzhJxmRevHJ1k7c32GWh5b/qsqpIANMfkn5gk1hUBnyvc
	KdElbjL1W1ndZcgJYdZ/gFq45DQdzTErym5Q4leqP1qYX3DyMfJ5VhklJI2FDzbL629+V9htWvJ
	GFG2GPGMTwBlE0Q6ebRLxuPjgTjjj2lNmdpiK9jTmvFnmY3g1aCN44cm3t0r8KlIzTpumzDpmK2
	v3Sacctf4KpnY3op9J9+h07kw0Dcb/YRNxz4LiLJaK0VZeMtmKhier8Bls4YgVu6n3w1Dwa6iJj
	w
X-Received: by 2002:a05:600c:1381:b0:495:5fdf:2075 with SMTP id
 5b1f17b1804b1-499783a9ef4mr9152235e9.0.1786423194546; Mon, 10 Aug 2026
 21:39:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260810100000.2643814-1-amadeus@jmu.edu.cn>
In-Reply-To: <20260810100000.2643814-1-amadeus@jmu.edu.cn>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Mon, 10 Aug 2026 23:39:42 -0500
X-Gm-Features: AUfX_mza-VJwrK6CpIT8Ad35vh98xr4X4uqgmOeZ7lmZ7Zm9P_j5It8RrMjWN74
Message-ID: <CALWfF7K2t4nt05a4TugBjOQkaQK=M=+wDSeG26B33znyMMzhAQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: enable NPU on Radxa E52C
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_213957_157501_9AD313DB 
X-CRM114-Status: GOOD (  15.64  )
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

On Mon, Aug 10, 2026 at 6:20=E2=80=AFAM Chukun Pan <amadeus@jmu.edu.cn> wro=
te:
>
> Like the RK3588, the RK3582 has NPUs. Enable the NPU cores and their
> MMUs, and connect the regulators.
>
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  .../boot/dts/rockchip/rk3582-radxa-e52c.dts   | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts b/arch/ar=
m64/boot/dts/rockchip/rk3582-radxa-e52c.dts
> index 854c118418eb..dd29a3ea7031 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
> @@ -300,6 +300,10 @@ &pcie2x1l2 {
>         status =3D "okay";
>  };
>
> +&pd_npu {
> +       domain-supply =3D <&vdd_npu_s0>;
> +};
Now that the power domain has control of the regulator. The regulator
should have regulator-always-on removed, so it can be powered down.

Jimmy

