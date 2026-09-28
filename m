Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7790C9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 06:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bf5Ra9GZUy8aIwIwYwR9PT31QHZBEGPbUTatiNyuQNw=; b=j1hlg7wz+Coi8ts2ruZ7q+zvP4
	kNQt3HVd09Gw4xt5rcDkpxUhomhqg51IBrLp+udOIA700Ov4mRxUjEl3+Y55j7nm8ykgEn7GkWQ6e
	xqy4WgdqWpSv71cBAOlfI6DeV7WJzvuHKkPlrvue1eTUrGnif9sVxe2bmSF2P07xOM7ospX35NHQ7
	lTbKu3RmM+ErO+zn1m3amUzZ6OOW+pDgd8f0MD2uAKhRUHDU+ygFjo3iFeclvU1u+Jwjj1EEb6C9q
	AYVQ6nzS0gH+zaDxr/gzFF8xH1nBw7Fq+KZCYBbTnFUePV5JRvwv3mWoeNIUkxchc4HaDbxfVmcYO
	dnGAJbgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB546-0000000HT70-1s9f;
	Mon, 28 Sep 2026 06:42:18 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB543-0000000HT6J-36rQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 06:42:17 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5b8c42da963so8924e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 23:42:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790577732; cv=none;
        d=google.com; s=arc-20260327;
        b=mZnyNh9+wUT79/Y/MxR4iiYxOHCL2fQLXzMlJli92oebuYEszY2+yE+fbx4dRyFCKw
         iacraAAtiTQ1eRg3gNaNk/8DMT7G0S4gQpoeuXLkzc8WvefT7qzoqu1SFX7Qm0qbmzrc
         dVFChX/MaVm+y3zFuXSk8a26qR+n75YDSpPSvJ+UmtEJ/b6/S+1PILBm2mALalS5Abgj
         IIQBMpGpy7gVp2PwlU+lB4szOvXNqmPM5Y86ILp+O+88zwLeoz19PC+vxAbrPwsPUw4E
         19KPi4lsgaERPLreaqoQI7FRibjTr3m9tsYskH2dGEa0pUI/dMy+RYXzYHI99h3C1GqW
         Gubg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Bf5Ra9GZUy8aIwIwYwR9PT31QHZBEGPbUTatiNyuQNw=;
        fh=P4GYs1u/R4oILJcOr/jeGYar50NPIo0jC0R1EucAsvI=;
        b=oxKCjailY4xTkOpc0MJnxHTDWOixiXe7iN+kojhu50aunoW8JvIeyMLR2tWMzvCGaB
         mgy+BNgSubIyui0PwToJJniiGJFswaNB61NB2+RL+zsUqOVRjHOYCFgfkRTdjMz5DAV0
         9R7Lk123kfNh6bStxee/YCum+4i3et5UO9EUHsS2Lmgkha3c/7Z3m1sFDRQsNxNNsMsY
         CTccb3jKa/aJKAa/Xg386/zynY/YFuNVREnMEdOfhEEO2pqFk+iTq4zjfhvwPqkyLh89
         BlUm+VgFjGAZxydJENkeBqU+Lg2zOKsehTv8TKm3WNYtWJeesq+ZMa+Ok7CQq2EibBwQ
         Z8Uw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790577732; x=1791182532; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bf5Ra9GZUy8aIwIwYwR9PT31QHZBEGPbUTatiNyuQNw=;
        b=kGGLpH1ljySwBJ0ATe+y3/4ilbFZV+a80UqeUpsi1eDnCCo3ZdIugSxeCLNI+unY3M
         5VeqUDk98RV7mnqCgNKFOCzgYqcBYxv5uXy9kgWuKCvNnT01jmwXo9lYWYegFFHRrS/W
         yTB/ANAVnYzqaukM9/OZnVZ2J/atfDnbMWUSPg7WzBs8QJEFLvCsCIF7170nrEDMdyWd
         Q2uNxud+nWbLU/DzdkgOd1r9Wi0VAjss8jxPqn3ZNzFkmhVFBXLd+9qNwOz3gmsRVsan
         oAboVT8HVId3vthqWB7flXwucRH7pw+VsQ0er0b2ieFGAH6GFB7P4zint5NTV+Whhjf1
         nyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790577732; x=1791182532;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Bf5Ra9GZUy8aIwIwYwR9PT31QHZBEGPbUTatiNyuQNw=;
        b=NTuErygMnq4/HvFa+lX4AsY2p8/99YMUHhmfxEhX4ka/Pw6yOsLd9repLuzfo5wqKk
         wjq3O1jMmf7e6dB58QpSnr7L4wHMYJ6ygpmeg9OBHuQsqEXtrNVr54KW4TYe3niehCW1
         zGshqfMza1rdwlqYTdRqQkn2jr6K+IjQou8e9VFgwaQi2Rp/8ssaZypooXP0TS6eya11
         Y18UmBjBDepnXERVVj8HitY12sX1t7f4ojj38qYTvzCPwOl5wzQipBoS5jh0Tr97EJkA
         mTXIhx88J2I3+pi7Wmf4mzQ6ScU6CW5wvAGd1FTs8endyMNsyquhlCtv3xMNbJVwzoiV
         xEdw==
X-Forwarded-Encrypted: i=1; AKwUvBzpopPS04ZKdG9407+4graUeoj+HGLa1UI1ZevymEKDnogV+dAcytNgFrdtPYDEV6UddnPd0ej7BW5sBZ4wkrdd@lists.infradead.org
X-Gm-Message-State: AFq9FYJi75GNdEp/k5KywAJ0opggcbWPNE2RAt7P7wsJkYigDwl0HRmj
	Hbl7L3TO+x7vrALStYbLimvS0hhAU2o61KfLjiazXHp68h8/zibW9aq/00eLV6vjEN3pz7OAA3V
	4sPGHDoq0qF/alWoJBmwlmBWqRe1GjPiEEsz6ikB0RJUVwu2ZxgMPHIzO8C0=
X-Gm-Gg: AYBFou3ouhuDU4Fjp/PhTJ+iESD6yMi+uQ+jHHQHEP5qGqGJeV4DVsMjVIpvdQehWfg
	GeFnv2wvJsXaxC+QJUdfQG8Z8G98tuFdxNLySgxgwx5sWcM1yZosjpcPZv614YKAV4S8p2kbP8e
	gAYLqgVeHPChjQnnUm6ybWf+IJTg/rxv951zJWkYitKNAmB2idcv4UBuanMBDZXA+rfkrMW6OIE
	XL9ebPd5gslb8WyO67PxYWxa0Wy7eW1FAHpqtcK9tFc0cHwms/r/MPeIu56DqSPazFFluSoDX7p
	bHFMBfhwLh5j71wJB/xmgaGHHdzi70WTdFqkLYCegsX9MhDyHFevwu3T19rt3GxUbVgCk4HUdEA
	mFd616teGXJWBIJeVBUetXIE=
X-Received: by 2002:a05:6512:118e:b0:5b2:a967:c0e1 with SMTP id
 2adb3069b0e04-5b8ef0d8197mr147876e87.0.1790577731865; Sun, 27 Sep 2026
 23:42:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260908142632.2795308-1-fuad.tabba@linux.dev>
In-Reply-To: <20260908142632.2795308-1-fuad.tabba@linux.dev>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 28 Sep 2026 07:41:35 +0100
X-Gm-Features: AclHuK-BFXQVxwev1h4oFTaX98t3AUrNTYP55S4zDU1gVDwi9bqTXCzyYzdaWQM
Message-ID: <CA+EHjTx-MGu=Rh90WDnTWMS4=8vcOdbhR35g42BtRBy7wqXBXg@mail.gmail.com>
Subject: Re: [PATCH 0/3] irqchip/gic-v3: Lifetime and range fixes in the GICv3
 and ITS drivers
To: Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Will Deacon <will@kernel.org>, stable@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_234215_800654_EFB15BD8 
X-CRM114-Status: GOOD (  20.41  )
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

Hi Thomas,

On Tue, 8 Sept 2026 at 15:26, Fuad Tabba <fuad.tabba@linux.dev> wrote:
>
> Hi folks,
>
> Three fixes to the GICv3 and ITS drivers, from reviewing the GIC series
> floating around and chasing down Sashiko's reports.
>
> The first releases the partition node that gic_irq_get_fwspec_info()
> takes from of_find_node_by_phandle() and never puts. Sashiko raised it
> on an of/irq patch of mine, and I said a fix was forthcoming [1].
>
> The second widens the per-device MSI clamp, which truncates to zero when
> GITS_TYPER.ID_bits is at its maximum and then denies every MSI on that
> ITS. I couldn't find an implementation that reports that maximum, so
> this is one value at the edge rather than something anyone is hitting.
> It carries Cc: stable because the commit it fixes was itself
> backported, so drop the tag if you'd rather.
>
> The third clears vpt_page once its_vpe_teardown() has freed it, so the
> NULL guard holds if teardown runs again on the same vPE.
>
> Based on Linux 7.3-rc2 (df2908090cda3).

Gentle ping on this one; it has R-bs from Marc, Radu and Zenghui.
Anything else needed for it?

Cheers,
/fuad

>
> Cheers,
> /fuad
>
> [1] https://lore.kernel.org/all/CA+EHjTx7eP_30vP47=UFk_wMAut-2uf+2DF-MZqn2SLE_k-8qg@mail.gmail.com/
>
> Fuad Tabba (3):
>   irqchip/gic-v3: Release the partition node in
>     gic_irq_get_fwspec_info()
>   irqchip/gic-v3-its: Don't clamp nvecs to zero when id_bits is 32
>   irqchip/gic-v3-its: Clear vpt_page after freeing the pending table
>
>  drivers/irqchip/irq-gic-v3-its.c | 3 ++-
>  drivers/irqchip/irq-gic-v3.c     | 7 ++++---
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
>
> base-commit: df2908090cda368b01ff43709f51890076c56157
> --
> 2.39.5
>

