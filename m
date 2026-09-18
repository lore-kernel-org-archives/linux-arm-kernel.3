Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DFBC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 15:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m9PpjDJTI5A4O9GHsrecsFdQCMZtDm/KhMOyyrkdNv4=; b=kv8HSXT2oxMrFFRh5QcuCoPfTD
	X8PEF88Z78PgSJIFHnJ+YZV07IPHrb2UlP5Mfr0RYDf8seqUfsDg1m8YNHkcfB69zcl7cBRlTvrPL
	K/Tp5iqY02aoe5KRbC085ehkLdoKV2P/uZHVKnSFBbgOqeojixWh4RPTX9rwRGMGEsG2e8l7A4jZQ
	dNbJV0kkrwvSa7P2FFLBwzcE1Kue6SVQzLYNiXcnTg6XsAMi6Xz4N/kMJuAJ1btzl8i7LbRWIRwfV
	rS32TTXN7UAhEJrzZT/6KEEkBymKpbDJ0yhpeLZZnu3V3EITK6ruNA1wey0yS2RrtZMSECro2pHNB
	xXdCksgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7aDV-0000000Eptj-1q1Q;
	Fri, 18 Sep 2026 15:09:33 +0000
Received: from mail-vs2-x0e.google.com ([2a00:1450:4864:3a::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7aDS-0000000Ept2-3T8U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 15:09:31 +0000
Received: by mail-vs2-x0e.google.com with SMTP id 71dfb90a1353d-5c97b28165bso727631e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 08:09:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789744168; cv=none;
        d=google.com; s=arc-20260327;
        b=RYGNZJHZo+U1nSuyIvfYt90LtkW7BE3B8i68smILVO00plkq2CrQRRsaiAUC3LD+gP
         YGC8T4Tqzbzf22FVAtqttOfYpSUkmhGwBLVIWKgitQSpeHYXo8Hq83sFhU1GsVk6hoo6
         zzGLnaz+GcK6JmYorC90DDL8K+nNQHgFBpbDj4RI6EyHS1BL2fF5A5DdUh+bAp2RheoM
         XLuXFLgfBkYUuMmQKFQh9nW08zC+JzfHpm4mJej5TouTBr9J8O34HMDtIPy/xTGqiqQV
         JXnNhH7be+E1GYx47/w1MljXmtjsuXnWnPdNBufzL3fIUMKqeo509xUwAh+jexUPz/Rq
         Vj9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=m9PpjDJTI5A4O9GHsrecsFdQCMZtDm/KhMOyyrkdNv4=;
        fh=ncOzUZUMEcg9897crEW8km3lqIyanfO9ylgxP5SSDwU=;
        b=GJhGfPsghpIQT504vHxktr2hRC4lrBMQgiuad0UvGfRrYknhkftzN0h5aWW/T1zL89
         jLSpVCW/jenI+ZlU9ENZ6DeDkCcDsB46BKq8oQKtERR28Mt0w6zEhqvWxmuncL0Fjmk/
         umH5qKSlVXf5+pSELd6iFWwsNkKAY0VrJhas9BhZRzkQJeFccKgn9KDZr2lIDbbcpzd8
         aZ5eKgkCb57ztWLWfB5eRy1eNaK6P5UomgjpvFY8+Oz2kpIb3gtMxfo2U/m5Ak49w0r7
         0KHgb1yWhGqLIMyUt5iodJycUhVKGFCKfKZIQELqNzQ0YPF4Pj1jQSVUGxltyWky3qE7
         XZMw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789744168; x=1790348968; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m9PpjDJTI5A4O9GHsrecsFdQCMZtDm/KhMOyyrkdNv4=;
        b=Sz6oZP0Y/FVzPSf5oYf4bSrs0YDrH5Z6VRmDHjPbuLUdDI/lfMZFEa0HgDcsDby3Ek
         icn9k9BZegEsLlktHjhlENxbFKyHisc8Bs7zyo45txtKPklcA5oiVWibFIbHwhCDxNNY
         dN6fNeJ8fOK6ZpmPSJ9yiR/IGAaoe2NxSKS72PxzF48MSSUjdyVKNG4K0VenGY0BkH6S
         wm1d9AjNc3x6jFbcwOPm6v9ndOTqzF74AXsYXL2vlkvf4OkD7djp3eQj7AyuXQtxEOQ9
         SVGFjCFQjSCrMpDAeqmxYiN9PHHyQYcr0AyFeRipENQP5FjP3HXZVpFjX4sWXrGXW9m2
         g7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789744168; x=1790348968;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m9PpjDJTI5A4O9GHsrecsFdQCMZtDm/KhMOyyrkdNv4=;
        b=0Br5cwY+dn8+GLdGZlRmxzXaK1JeUJxAGgaW/QhvSR1gXzUJ1sUwuvHMMWzwvVMuxF
         VlhpEWg6owSXt4GHgjGWhHXCNDBEl1VI5Tj5yG/Sj1vDAjJmK2jOx4c/744VSaxs325X
         wT7B+/9FLsJJhTxqIWtPpHiznKu6vqrZF656hplysOHafkpU90WNQmIUyjvWxOlljJBo
         w8RWWNf2jZtZBgF3hSlXm9VOaVSVaD4/WuRSm6zZvDcFzwh9uS3McgwLnQB/jR7Yldj0
         a7uyBFoqhlU3+OgK31y6ydugN/Dugl1LL7sygavTS1By/V+BWT7B3JRTUW+B+cpBhYMH
         UHog==
X-Forwarded-Encrypted: i=1; AKwUvByQT6eeWcCL23a9/mYJh6wb2aWI1q2jh9EA0l93Y9enh8twAHkE+wh41O1Cj+a9BlGsmCA3iAdmgbjPr3NYdKAt@lists.infradead.org
X-Gm-Message-State: AFuF++lVtmfpqaS9O3Ocv8U2Kyw1CNcv752kDM5vnihAZAfGsU/afGPN
	yn3eIORz82GkUzzWtiUwyf5lyDAlunHSUSC4DYAhKINKThQF3ZGE0GAnJ/mSvRO+HIAQM32RP5O
	ghMehQ8PZp0ZXqVqgAoSy6Iio/bJ+C9RAgdSQoSYdZQ==
X-Gm-Gg: AYBFou03eAK25gnVPGMO+j/DExyvnRT0t683XQv/MFtVXrm39s0tKoem+Nx++eCR0aj
	7f0OmHGH93LE/YaQhjq91aH/KuvAoX37DlFQnxYUCM00FK4oucK3UNcbiEMzs4Rx+oHHODGWSMr
	ROH5K7WAKU2Itho9xXAnN7g+aBMgu0NBBdPYyKZowt7vNQRA02zli9a3FJ7OsT1vxmjdQrIqgpn
	CMnPjGMqGf1Kw6dzFUrmhy1MZxYEyFoo3L33rIGsgT6WkNsQZTOuTuJXVJACrUicjkw/N52vqFV
	VWois1Za5t3xN0uGJYCuexJjFTxlkntjf3F2YWKwFMtUhlNQXBAH6r6UGyoWRZubqUrTsy4sBP6
	dzgnu8qbxGFcepZyEjCk7BgV4
X-Received: by 2002:a05:6122:d89:b0:5c9:a60b:e5af with SMTP id
 71dfb90a1353d-5c9b59d5fedmr1460675e0c.17.1789744168196; Fri, 18 Sep 2026
 08:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <6108b9d8ba5e750fc3f104c7c47c765cda12ab0b.1788430197.git.geert+renesas@glider.be>
In-Reply-To: <6108b9d8ba5e750fc3f104c7c47c765cda12ab0b.1788430197.git.geert+renesas@glider.be>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 18 Sep 2026 16:09:15 +0100
X-Gm-Features: AcwNN1WbCgmZ6KBoleiDGX2IyJqTG4BFE69tG3w6kSQzgb-TPyozGD3DKfdtb2Y
Message-ID: <CADrjBPosa6tyVCrEh9vsUoba9tWBbqa-kG2emcu+L1t48QmjSw@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: exynos: gs101: Drop CPU masks from GICv3
 PPI interrupts
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_080930_873336_D7ECABB2 
X-CRM114-Status: GOOD (  17.42  )
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

On Thu, 3 Sept 2026 at 11:11, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Drop the masks.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - All other patches in the series have been applied,
>
> v2:
>   - Rebase on top of commit d0298724f901d45c ("arm64: dts: exynos: Add
>     EL2 virtual timer interrupt") in soc/for-next.
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> index bfceea5486f46686..9e17f36e1fbb7ce2 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -1928,11 +1928,11 @@ apm_sram: sram@2039000 {
>         timer {
>                 compatible = "arm,armv8-timer";
>                 interrupts =
> -                  <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
> -                  <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
> -                  <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
> -                  <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
> -                  <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>;
> +                  <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
> +                  <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
> +                  <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
> +                  <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>,
> +                  <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW 0>;
>         };
>  };
>
> --
> 2.43.0
>

