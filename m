Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E86BEA3C5F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 13:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ev3RMMGjO06UYL38WMnmpo1Zv5dlNGgwSiRluf+t5pw=; b=bzVWeK5XQF+hhKVgyEMbluifrY
	Rp6gKVPjpnC4LQFxzmMiMTy7yohYWaKLaz1ZVdCQu6Cyeal4ezV7YS+q/v3P/Yz/6+zsCMGYyvq0X
	jeKbVImu6gtLba3LhRS7mmow+zbMAjQxcVIBFPi9m/fdKkWKSxW24NSN0vC6exmHCoWagkSGLOTUc
	K2wYt08PsF8W2HFFHsIkzlHEP7EmqwESryMlI9r8PuTYSIg11V/uqA3Kh/Z96bCkjGJsidNasv2Ud
	2c3wLb+90JUXKrMRchtuWuktjuEQEpamP00VQXhzcoa7YLr3cMvTib6F3/Gwop2SGw29vOMKLB9H/
	AYZR+ggA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApTL-0000000AWDY-1wxS;
	Thu, 09 Apr 2026 13:31:03 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApTA-0000000AW91-0K2A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 13:31:02 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-66bd4e0560fso1126657a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 06:30:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775741450; cv=none;
        d=google.com; s=arc-20240605;
        b=LVR3e2jeHcaXSifEk9Vd484pCgq07QjZgnixs7iatxeaBcHuymNAor7SUfzbKpghU/
         E5SmJWJ96wc8KbyVdLnro6n8p6psTSSxYaMsz8vqq+f/xmfTqGoByBvmgQzP5V7X6KHd
         U9+mPQlU2SwgAqgntD634zSL0X3rWRl0eOsIxLyRvCN11KlUvznorn9Xw89fFYh9cDVt
         uuZnc3fanwfmNhqfSi5yISfE9lD/48WOshmvwmiodl9siS5lhZVZLtN/CXKYF5hVzTGN
         9J1PpDHwSXTO2xX4N7DEAyA6Ix3U2zluExLkZkyLTBMDn7+bmvJlVSJ4pXCupgUBdLJI
         PzIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ev3RMMGjO06UYL38WMnmpo1Zv5dlNGgwSiRluf+t5pw=;
        fh=d8DQiGytnx0OgOZY5Lb37K99X59V4gXMXEiVXFY2Dhk=;
        b=JUqBlNjimfy/7pFJ+ny1jZo22123rP8c+iis1HNngzQoHaBTDnm2LRglfl0At9kLbx
         psvtm17Of0VClCm9AZYSzhjITWsOAhKi7Rhmn9Sue+jnDvTnan+txmpQLAjqCgMKbMuJ
         K5tSnlqxrEs3DPYQh9ndQwRiLAeWaks9GnUIY0pl+hKnC63lYaZlIGMuFn5phM3vbPnH
         xM8tFMk64jV2jQQEx1qsO4uNVc+DrQ9dzv4k/LaX0+lhIrmFDn5ionkzmhim5fy9Qcwh
         laVwGGW9GTcXxVhZRUnLUdn0p1slAAijQfK2+I4mAon468y/61ZEUES8LMmp9jw4MRKG
         x8Ug==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775741450; x=1776346250; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ev3RMMGjO06UYL38WMnmpo1Zv5dlNGgwSiRluf+t5pw=;
        b=HngNAlVRDIwXviVP/WR297oaMgEJX5S6i5A4z188dqPE8gg0CezGazne9mLkZJknc+
         h7ZXF8GANdgq60mYf+WmLRRTaktUYH1C1KwgCgKc7bhC1cWQkN85zOn5rUl67jqMzWfR
         9bQ1P5CpSE9wBsYj3/a0txgt9I/ZWNxJ9PIEh5BWHIRDvVRtTBkAJGsflYhKQE/yh9R2
         UGTJmmyi8X3dBkOXmeKfdozE7+dh69ny5Z2W42t9AHxF9QuhFVlEUeGWrBIyB2ch2oEk
         IxJYwl+cTr06hqS94yjTNgbigylzzbtNp6GNZtYM05G8Ki2/ON+4LPnMrCcooBM/2png
         snuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775741450; x=1776346250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ev3RMMGjO06UYL38WMnmpo1Zv5dlNGgwSiRluf+t5pw=;
        b=nvzwm/KEfJhsf5DOjHuTcDMOhZ7NJsGi68Wr6rmTWHX/WAVFvTN5QJ2vTkcHISjgzF
         KDqb0bWmHcWdkyYjHDaQrjHzhLbNOI/ZfP81WmUIsZtGuUz0RmNb+5c9cFLNYu3b21ux
         IxI5zIS8oBlbZTT0iNx+g2mX9I2l6adlJgdNKQkpADxZgTC2c3qjPmPnYNMgZv9yhR7A
         MlTB6j1j2ybJyVN9gvynnqBhDdsZios7FhjyvS7wa8emGIhqMyy+RPHy5k51DuYvoZSt
         1q6nG/at2gZMA1a0zh9wpdsd/rSBo8lI6FJzbaf495qdzHzBVKfeNqLDglXwb1mXL0gb
         j1qw==
X-Forwarded-Encrypted: i=1; AJvYcCULIydV96FoooPjM/ylD7yzBT8lKquswr6zPdz72wV7iy6pCbDKAe3pBN6pEVHR8evSZVmL6+PYwnV7EqCq70o9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6+tk5hOjiAf90nze09a+yLeCOv95wNbBL918mxH3LvAKlfI9x
	R2gOBPTQ9Ooyewk6qC6iS/ezyhVPvR/XBgvSz+uTQb2gI5JMTGNIOODBcnlQ3sZA0MDU5Uqu7vx
	gGY6e6uILk/1dgkVdPT7gZ/IyA22Ij3Q=
X-Gm-Gg: AeBDiesgZljskkbrzLEZ4LRhXinQHegjaOAjz5GSliFguJy5noqqWGG4LZ7wZSteG9w
	q3YuHEXXcAY218x1NWEvSycSRJXWI8KKGu8Sf1l8GEp37jfKuuHPgXhbcU1d5sGnutOBsNH/e2T
	hWNys1MmjsaLj2Rlfo/ASzAnQvARCugVZpx/dRLtWzN09UO/cDDPPnUeKvDaQjVY/oereJV+k1z
	AG5VeDfDdkjeMNTYfta+sESYj3RZLLETp50h0Uj+1py+IohOlDdyj/7k4lzJlIp+HgxbPFEEwlj
	QCqF3g==
X-Received: by 2002:a17:907:9727:b0:b98:42de:3700 with SMTP id
 a640c23a62f3a-b9d46227f6fmr183342266b.17.1775741449801; Thu, 09 Apr 2026
 06:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260409044939.7647-1-linux.amoon@gmail.com> <add2QFfHd5Jv9XU7@fedora>
In-Reply-To: <add2QFfHd5Jv9XU7@fedora>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 9 Apr 2026 19:00:32 +0530
X-Gm-Features: AQROBzDhqGfLcjBjGT2Hvs3ZMinMrOpBMtp_gMJbNkkfMBequ6wtYDsgQQOO3PI
Message-ID: <CANAwSgRqEJ5sqjY4bAj=PiK8wA_LOYDu1OOPLWsL8u_4Afu+rg@mail.gmail.com>
Subject: Re: [PATCH v1] phy: rockchip-snps-pcie3:phy: Configure clkreq_n and
 PowerDown for all lanes
To: Niklas Cassel <cassel@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_063052_406680_C292461C 
X-CRM114-Status: GOOD (  17.13  )
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

Hi Niklas,

Thanks for your review comments.

On Thu, 9 Apr 2026 at 15:19, Niklas Cassel <cassel@kernel.org> wrote:
>
> +Shawn
>
> Hello Anand,
>
> On Thu, Apr 09, 2026 at 10:19:30AM +0530, Anand Moon wrote:
> > During the rk3588_p3phy_init sequence, the driver now explicitly
>
> Please use imperative mood, active voice.
>
>
> > configures each lane's CON0 register to ensure
> > - PIPE 4.3 Compliance: clkreq_n (bit 6) is forced low (asserted) to mee=
t
> >   sideband signal requirements.
> > - Active Power State: PowerDown[3:0] (bits 11:8) is set to P0
> >   (Normal Operational State) to ensure the PHY is fully powered and rea=
dy
> >   for link training.
> >
> > These changes ensure that all lanes are consistently transitioned from
> > reset into a known-good operational state, preventing undefined behavio=
r
> > and ensuring the PHY is ready for high-speed data transmission.
>
Ok, I will update this.I f
> First describe the problem, then describe how you fix it.
I was investigating the PCIE30X4_CLKREQn issue highlighted by Shawn Lin,
analyzing the RK3588 TRM clock request configurations (page 878)

[1] https://lore.kernel.org/all/77f0d3c2-649f-770d-1636-6fd52f3b5f5e@rock-c=
hips.com/

Looking into the power management state on Intel=E2=80=99s PCI Express Powe=
r Management
documentation, which defines states such as P0, P0s, P1, P1.1, P1.2, and P2
Understanding this mapping is for interpreting the behavior of lane-specifi=
c
clock requests, so initialize this to the P0 state..

[2] https://www.intel.com/content/dam/www/public/us/en/documents/white-pape=
rs/phy-interface-pci-express-sata-usb30-architectures-3.1.pdf
>
>
> Kind regards,
> Niklas

Thanks
-Anand

