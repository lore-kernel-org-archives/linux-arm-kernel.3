Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53690CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8mqtx3+0vc+jv90ZX77xIIPZlJiggKZDSroDOlfYZM=; b=jB4VJIFNlfUnxfN9uYzZBAD4KS
	B6O4lRmpXfz1zULlmVnfUb1LT691xdi8GFT680jZactViU308EY7T6JJslXzd03edUg8n9EwCG5Yj
	zvokOVANcrbRoi8v1UoQ/C0HpBm7//sg6DgvZKdKikAtmf7EhcloRCtnQ0NVD8+l1u8G6GahsgJwk
	PFs19Ee+SPZnctEbhdybC6+tA4ZA/ilI0NKtCKFs6ijoAcxwl9kE5to+YwNe/cx/F1d6fR4aXf6Ll
	cntIaUDkizIOeh93wVmm01+31CrNsOEILAR+eSgYa/hKwPHXmPgyrSWUilvDLuv+29bDgOpkZg7dl
	JMRH4INg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNGd-0000000D0SF-1FjM;
	Mon, 11 May 2026 09:49:39 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNGb-0000000D0Qf-1IBl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:49:38 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-393ba0616aaso44407681fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 02:49:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778492975; cv=none;
        d=google.com; s=arc-20240605;
        b=UAapCob0wEDvOrIJOhQbKrQxlo4HIavEps3TOo1d/w8QcLIjIgVehRfR8n6aX4RMt6
         HiP7I1vXN7dt9cWWChZO3Zf9G2ERQAQC1ELfpksXUMqLlnrWu3Lq/MAllFxmnikSTVXm
         jcOvWsdVJtxsPTqt2aAIFwHo0Sw4gunwbhOBC/YSjk4g42vtIKhxB5TOH6/2uud3uzSB
         BtfXPCi5wsGxAdtgmVfFiF3lXQjDsNuLfRFRr4ybUsNq1cu9COJW0u/ockZRsU9qGEHn
         eLNnFAp2SaLZe55zp76CzYdGXDMehzxz+SuzEi3nF64iKqqm4IZw4Y7KG0gF/9dYhAKl
         cvRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D8mqtx3+0vc+jv90ZX77xIIPZlJiggKZDSroDOlfYZM=;
        fh=tloW9rWKqQJMMmLGSAg7XfTu1VMBxOtYhCydLthZZ4Q=;
        b=Th9r2dE0eUao6ABa/RR/5hElcZNBPCMCeinxWKA2/Of27J+0kD6+YjqhCxioKowK16
         lsv3766Xreib8GcIa232HpGjWVzIRfuyVifLZJSP872bqYOiR/4uef/xS+luJBsDeWk3
         1oeMrdZ6AppuFGCjhJMftF2YPg2wqwn6mtD+8FRKCbxN2X4Aov3/j5oR+eurbiEGzAqj
         5OjuwsJStIJtJvegzASjZWNYRpEn44h1dI1LROQMhYM/L6iX4TmqNSrv37jPJLOVi3J2
         wG3AHkwXed9z8E2VuB9RTZAnR7nvrQ3+GhUmYSGxLgcHCERujLQ+1ORhIZVR+vD7CWFL
         bntQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778492975; x=1779097775; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8mqtx3+0vc+jv90ZX77xIIPZlJiggKZDSroDOlfYZM=;
        b=CgKQMUOQMLmOfx+/QeE/8iMrC4q8gOmLNbMJOgJwFL5CvnJQlBWP9v+yd0O8aRTCyz
         bPxuHrVqWVKD64Bs17kmkQXO6CR4LX2lc5cNgcMP/AoBnaVrEX6sZwiiH0X6z0P9YazJ
         r0wMx8R03yhCfXAUfBJ22kBkmN40kbndC8UE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778492975; x=1779097775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D8mqtx3+0vc+jv90ZX77xIIPZlJiggKZDSroDOlfYZM=;
        b=eZLjnsiaRLnTQ5hQvIdT8NoXWR51LMGpGJNB7FV430fDAsGnJuCiSCCR2Lff2C4prK
         CaJxjAs7AIcedmUNH6a8/iV6/UsCJWdcVVt2X4GBZxLezmv+WRKXJ6Kb3Zhyhk4K39DG
         c5G1ZKrFxptQf5wEUbv5NAVs5EivVmLM/9Hp1LiVy28tEoetvR06KQOujWFQOl1PvzZY
         YuoOR5J8IGjdw6B1GBQh4LP4H2Cysca3O8hw65KBwNoilZqf78nB5/giRy6qPXEutJkE
         tACEaLnpmOzlYvuHwpo1ph6fN0iQdcD3NaVjhHbeA70Nkv/Gpi/F4lDGSciqmk6g5RWL
         u+Zw==
X-Forwarded-Encrypted: i=1; AFNElJ95pkJkUmBYgGARQSvYh2stWXyQjpGPxUlKePRkDqRsjlPm5eZ2ix/+qAjOh4awgr2oLHPo201T/sGuxE2A79H1@lists.infradead.org
X-Gm-Message-State: AOJu0YwLvP3fkhE56ATCLNerhNMnQhKsMuUVxz7Ut4224IsEsyNBXyCP
	ytMxZM893IPgKWvoBb6WcRPGUOTp/4xPbIAKFJVeHNaGiB4gfSSDlpJjQ+isvzZmnHavyUtGVa8
	yAmoxaQe1e/a42aixap7ZXTWYdsyLEnVM3MK6j5Kf
X-Gm-Gg: Acq92OFu5vP3ncUlncW46u7BTA41iE1xeZ3huvGjahKeGUPu9KAXuveY7Nrmxwv2Qxv
	AWUvhA0Zt0isFyy+upf16lJaw4ktzlqQZphTSpQyixU5faIBGP+GOKy54hDPPhbvknUGE7jOXC6
	AYPMewb1S9yBT9rJcXVjOsK4GMMix0kKxMIMpGgeb4uptQLRsEgaanvZK0QR0aeQ81jET9rghz/
	b7autMpmf0SGWUFIx4qyBOnDlH9RpiMTy0KElKsZdUfUsh438UQhhI+4o4MKDLuz3GgUALgPCpN
	2xn7oZf0+r0G24cBxhawpOLLj1BoCCXVSqOn8w==
X-Received: by 2002:a05:6512:10cc:b0:5a8:89d6:93c3 with SMTP id
 2adb3069b0e04-5a889d69612mr9222261e87.21.1778492974942; Mon, 11 May 2026
 02:49:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260430120725.241779-1-wenst@chromium.org> <177849219930.115964.12285046748812181326.b4-ty@collabora.com>
In-Reply-To: <177849219930.115964.12285046748812181326.b4-ty@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 11 May 2026 17:49:24 +0800
X-Gm-Features: AVHnY4I2n3jCQB3QPukN_nmGjnmGT3z0Rt-UHUs2BJl19pmL8VcxIKApqqizml4
Message-ID: <CAGXv+5HsrUQ0wb_8cceGZywU-HNxbFehP-NzKmPs6f1q_He4Rg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8192-asurada: Move PCIe DMA
 bounce buffer to host
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_024937_389935_DFC12D7E 
X-CRM114-Status: GOOD (  13.90  )
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

On Mon, May 11, 2026 at 5:36=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On Thu, 30 Apr 2026 20:07:24 +0800, Chen-Yu Tsai wrote:
> > The DMA bounce buffer is attached to the PCIe host controller, i.e. all
> > PCIe DMA transfers should use it.
> >
> > Move it from the PCIe (WiFi) device node down to the PCIe host
> > controller node.
> >
> >
> > [...]
>
> Applied to v7.1-next/dts64, thanks!
>
> [1/1] arm64: dts: mediatek: mt8192-asurada: Move PCIe DMA bounce buffer t=
o host
>       commit: 0f91911b61d06fc02a058ff7fb0a27e53f7b1136

Sorry, but we actually have to wait for a matching binding change [1] to
land, or we'll get new DT warnings.


ChenYu

[1] https://lore.kernel.org/all/20260508063633.3894348-1-wenst@chromium.org=
/

