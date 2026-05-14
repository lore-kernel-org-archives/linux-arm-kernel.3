Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8A7CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 21:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HmU2QdCe85bILypWHefyZFVcWWsKYpG1noJcgT8vi7w=; b=FJtR6/D9Lv86Gfg/h9Kc0/Zabb
	Yu1L9eV1VOP7UvJaeGfcSyJpK9KNNg36s3N3UZS5BZkbXDBY5EbsCk/VSOLpBrbD+YbQbSe1zT9te
	j28UTgAU0Rw2X21lEjeXGn1wxbYT5ZfRULAvdEMcUfA0c+pJjgkXGKC9MQl7RQes1fGSAMhXJLR08
	ET4tmPgVCK1ekGzI0N5IlXJNLsi4hyF8u2n1iWTnhwCsiYdnJ+vhrlqFo6K6r/d2t5yqhbMKp/gIO
	k5cmMrKyISu7irRUaVdopML5SAx9pkzdMujvWin2CxWl3Q5WjFWByFMuCCDJxwZwU5EKjZzvLzA8E
	Xjd2nGLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNdQg-00000006aOP-3uzo;
	Thu, 14 May 2026 21:17:14 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNdQe-00000006aNV-0c9w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 21:17:13 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so7375070f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 14:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778793430; x=1779398230; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HmU2QdCe85bILypWHefyZFVcWWsKYpG1noJcgT8vi7w=;
        b=Hrdu2XHSWP9A1JHaNPNED5Vyt6rTyxy7NMT8ZWZivxud8WZPVnTuf2bB5WL21jbzyU
         n6fypTTfIm+z+pVjZ25vmu2Bp8uIoMOBYBmd7hxzFS1x+M/MSYVKarhM8cJmn2+GrPwX
         06Sg+USPV6uTJJf6irnBA6Tf6/N/OqghlotCPbW3c6uO3ZSUVU4EzjLGxwRFVdobZwSH
         GX/17JI46cPupe50v/+NaaxUGl1p9QWzId55Ck9tDPLaBLBOVqDvrgitVdVg1W/e6DAk
         VfZT5AxhiYDX2zaFFWVxAbkgmnCVuRmfunhT94gmTDIlmGcmVAABfYQedadY728zkTcn
         toow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778793430; x=1779398230;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmU2QdCe85bILypWHefyZFVcWWsKYpG1noJcgT8vi7w=;
        b=Q5CQILAKst78H4WBWm64WwNHqR5csZUSNj88F6O1yaJMOhIqA5twvq3QFX+C/HwnYZ
         BXHvVrPveYw6YCiw58rf5FXOEYzI11mZ/zLMSCgqShtCFWeGjsxTgcN5nYKUsCNZ91V8
         4gxMXswqlwlEhWkaFWt2MrwRf4c1zYw2//iaHFOR+Qtf6HjtJH+ZSMO4nJiqYlXq58ha
         wIRlvLgalolW0Mnq97J+CB9blp+kuAwTaWwXtFZdszfKSPuBSsdcJTcRlHNnbQ6f4JyB
         B49a/af4KOXDoFPIwL0EH9B+MGEpPfPznPzeAzOzw8a8Qd9Fs5Dc5OcFVtSTGk9U7Oko
         vhqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/im7heFdnJHVIesSrkp2n2aWex8bNnYb4dxKqAlQSOvbZoxeVEMbUU8nYH1SIhCt2/x66jschd/xrdta43mCHo@lists.infradead.org
X-Gm-Message-State: AOJu0YwGATFoH/N6+ijeKilTghn3Nu87Fd7si7bhIasRSG/G69kfR6XP
	ZC25VFfDW280xVe+KWgtHNnSGgR14+rxYZOrTwi1tjxnwg4k82ji6uCa
X-Gm-Gg: Acq92OGFNsmidWPOJylHPzGnHxJcznbHj3jCR4n8Qnp/Zh41UwFZ0Vz+AjjUvO80vZX
	y66W0DigujCTWUrf4JSOinWbr8gT5rZVRQu5Fdpfb9ztCzlHUuH3xu4Kf9cGaHI5MsvWvQe05Og
	nrdGVQd+cIXlyHt1bpLY8PRkgMnitGVseBuwZoAtE4OfXYt/M5MlX/PLNRQW4crSVWOZRVzylM6
	4dqqY6ahafWzD3M3TNu4ywFS5khXA7ZMT7WNYBmLdZ5krpGlQEy53hcRHATdlKc3LwF9urbo5vy
	TXW++dCjWmCB+dbfG4hsUcbaFXw3HZEgvFwUe6+RFL9/RN/H9PpuQ905/KTIQUXV2Xk8PEusCJ/
	XUG+0w678PB5m8J2W/l3rRI/vtly9Cbil1OePShpPZTTXPfsrBmZJGX2rsy4dOTWWv+CombJeHa
	1TtTLvU5RQ0WQ/Xv8FeKzEN7qGLQA=
X-Received: by 2002:a5d:5d0e:0:b0:449:fb9e:4b4e with SMTP id ffacd0b85a97d-45e5c36755dmr965484f8f.15.1778793429319;
        Thu, 14 May 2026 14:17:09 -0700 (PDT)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768072sm9290771f8f.5.2026.05.14.14.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 14:17:08 -0700 (PDT)
Date: Fri, 15 May 2026 00:17:07 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: sunxi-rsb: Always check register address validity
Message-ID: <agY70wRwrkdI2pk4@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
References: <20260301144939.1832806-1-andrej.skvortzov@gmail.com>
 <CAGb2v64PvGdViT6DWHiNGoK=5L8DpfjVAdv+LbNf_Uisy6v0Aw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v64PvGdViT6DWHiNGoK=5L8DpfjVAdv+LbNf_Uisy6v0Aw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_141712_194628_221834F0 
X-CRM114-Status: GOOD (  14.49  )
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


On 26-03-14 15:33, Chen-Yu Tsai wrote:
> On Sun, Mar 1, 2026 at 10:50 PM Andrey Skvortsov
> <andrej.skvortzov@gmail.com> wrote:
> >
> > From: Samuel Holland <samuel@sholland.org>
> >
> > The register address was already validated for read operations in
> > regmap_sunxi_rsb_reg_read before being truncated to a u8. Write operations
> > have the same set of possible addresses, and the address is being truncated
> > from u32 to u8 here as well, so the same check is needed.
> >
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
> > Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> 
> Should probably have:
> 
> Fixes: d787dcdb9c8f ("bus: sunxi-rsb: Add driver for Allwinner Reduced
> Serial Bus")
> 
> I will added (via b4) when applying.
> 
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

Hi,

do I need to update and resend this patch?

-- 
Best regards,
Andrey Skvortsov

