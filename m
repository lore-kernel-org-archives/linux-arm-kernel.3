Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B787C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 10:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+2NBIuHNbi7BsUcnqqHDV/Qm2x3SHOAi3j+NHEu4JkU=; b=Db+e8fW+EWDVpcnE+/jaqgjoTa
	sJwLmbcfPtWG/edF6A9riWusr/T5lCaXCQTBChPHgDo/vV/8D68dBMoWOPa1Q2lLpohTDGxn2Q/kY
	MgSvuNROpJ7oO2LmQZ1Z3Q3fsAOTh/abU1oHD2VFBlHbZAK7YEnfcFLw4d0/zPAibNByiZRydhRJ+
	T3b+6atNLNSbi7w5zigXLMsU5DldKBPbFuTgjpV3K8Nd5gOibIpWqYDZD6lGjzmVCRkLSLNbdj3It
	IUAvcIVDCnTYvxgcP14HCvq7PybV3ijBJm8lUb3xPvI4OYjSRh46Z8dULSip1OY4pKveSD6b5jduI
	tFImHfAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnZMm-00000000EX7-2krY;
	Sat, 25 Jul 2026 10:12:24 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnZMj-00000000EWT-2NbO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 10:12:23 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso663981f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 03:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784974339; x=1785579139; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+2NBIuHNbi7BsUcnqqHDV/Qm2x3SHOAi3j+NHEu4JkU=;
        b=pnBYDVYFL4qSsfimMsCmjZbXCM870tDWxbeAq4PPAlMdS/wTdtbWVJDmwJoZG1R2DN
         MdE/vk3/KwbY3EXMuejaTn2PiW4Ps94sPwViffOb8Orw3NzTayHxp+4SaoDQUHcEgWLx
         tk6DHwajI9D5Si7Ny6ms7vcO0jf/L79fXwbztEXX0KNswltvXFi57DdmuRX/V+XW8kpo
         TKK7jAD3r68fttcmh4uN6vp41czZul7exVOFsBHP+S1cF4MRiGsYgrvK3GI1jfjNj6oU
         mU7RYdd9OYlLP5lGFDSOa+djivH49OVSJivSG9a9UL6MZK1WU1jtApeix1vx1U3Up3Zj
         TZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784974339; x=1785579139;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+2NBIuHNbi7BsUcnqqHDV/Qm2x3SHOAi3j+NHEu4JkU=;
        b=nBNdXo+N9dDJe9ctlnLolYZCXQ65/oCf/l/XPbd+kuXlsOxdgNppTuZMpQUDDKqXK3
         ienQDl1p1F9VNpp75tb8UXjCz+mojT0eqPMbYanHEyFlt24/7q+dfEpF4T21LUX+gwfO
         XPPhW47GV2MwSffxEC8Onu9Xpn6d8RBHWmDFfuz137TWcW/1srebgbeacUzwIlorR0lr
         MCmBbF5s5Tfof8+kjCwSJ6ZH+bVCyRfd7deUI5aKtSvV1trSulbVrw4KENtujEhQZuRE
         swnpbBcUx3Yjqzx+fjm7LeXu/ToFME7FzKaB/D+rCS54oYaAOpinkWtXkXaiifWkpmjr
         USSg==
X-Gm-Message-State: AOJu0YwgR6n1XoS8Cbh9xXkLDrBiiS9+M2Yr9NR272lkDCK53Bchdckf
	9xFu/KViJGxyHWwPxvZnr4jd/hkwnewPEm3E3cwgoNgN9ISZkdJgpdO+
X-Gm-Gg: AR+sD12gPpGSPVfrmORqFg2nBQVTr9XIdar1ueGGiKLrFEPF54REILnrFMNb84XMu/q
	LbPn+6URKaQOlG7E47chCh0kPsMNjaPiZGQbUWX8y2njcviKUUD23z2Tpfqctl248poz8sHX+Yv
	i9ZzacFgJGNHBCtpKuyJLwTgl5IPw7RN5/AUX4JMd0cuSeXqYQt1q4DXzsmzlynDLeBIOe6i6tw
	rJZTe2Rx0YPTBXQlmp0PA1aezEgEwu3fxic67LMRDMYMGw94mt+hzaT3xaviKXtImz6pdKZcKAc
	/rGHp3cAym3UUNX484q4JuOeGtIEaGHfIWW5mgcJN1IatoLa7U8pG8CU3o0eG42cfnD7Jl4NADf
	ztMkbJNqVAZfp7QHMMK8vCZPnwwMU1eQcEClzZPvhHwYcDTMeLvkn/fhH9kQTjRp0mH1WKz4k2l
	svbV/FJlO9Vf8b+KnXJYIvpY/GC11XKBnhjyKC1QK9s5LfZtUzpDZcJmJZlWZWbDFLA1Us2u9GI
	XFazxoLDm09H+AFbBJCmAVC/hWAoNusk3v5Km4/qYZzhJ/MD1o0yy9Tn5P65Qzh6CueTyccXCvJ
	IInTLW+LXZTn
X-Received: by 2002:a05:6000:2484:b0:47f:6b9a:9d54 with SMTP id ffacd0b85a97d-47f9fc86af6mr2200023f8f.7.1784974338989;
        Sat, 25 Jul 2026 03:12:18 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b344-be01-c902-8e3f-9491-60c2.310.pool.telefonica.de. [2a02:3100:b344:be01:c902:8e3f:9491:60c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm33743697f8f.1.2026.07.25.03.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 03:12:18 -0700 (PDT)
Date: Sat, 25 Jul 2026 12:12:16 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH] arm: asid: Do not replace active_asids if already 0
Message-ID: <amSFZixpR60Mrg7B@gmail.com>
References: <20180104180405.37596-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180104180405.37596-1-catalin.marinas@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_031221_611864_C787ED7C 
X-CRM114-Status: GOOD (  15.41  )
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

On Thu, Jan 04, 2018 at 06:04:05PM +0100, Catalin Marinas wrote:
> This patch changes the xchg to cmpxchg so that the active_asids is only
> updated if non-zero to avoid a race with an ASID roll-over on a
> different CPU.
> 
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Will Deacon <will.deacon@arm.com>
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> ---
> 
> This is similar to the arm64 patch [1], with the difference that non-relaxed
> (cmp)xchg is used as per the existing code.
> 
> [1] http://lkml.kernel.org/r/20180104111721.33834-1-catalin.marinas at arm.com
> 

Hello Catalin,

While the arm64 patch was reviewed and merged, this patch never got any reply.
It needs a small rebase, but the change itself still applies today.

Would you like to resend it ? 

Thanks,
Karl

