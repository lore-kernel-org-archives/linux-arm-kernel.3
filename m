Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375C8CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 04:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iX9DgFfgjdBAl007JWxmgssbqGhgCd0Hmt9BlGMfEVM=; b=unKNUBlxUVD20VpoPYXdBxI/J4
	5gf/6GhUvrSOH0NTvos347dpYCdfkt49hoTbaiXmZthh5mwMnBTDxTdWm/Fzq4JqOpY81/wvB8dLU
	JXwsQM5OopM0mIlssBSlGdWyf+wGcYYFnHQlQPy7PVAJUUkZ58miEszXmia0G2t3R1aUTMV+MR62g
	055ElJQHEG517Z7VNLFuf3U7sRyMz5r2IeqJZQmScKys1ArWQja6Wrikrp2oHrgCO1qkJeB2kfHlF
	+e+pF1+iWPsWz5waVygBk239xGHmlP1Jg1h0XcLeNdrVUibl+K2mpCysVSAd/2/UmhKBGkRIjviTT
	ci822u/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPYrq-00000003Vee-0b3z;
	Wed, 20 May 2026 04:49:14 +0000
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPYrn-00000003VeB-3sSk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 04:49:13 +0000
Received: by mail-qv1-xf44.google.com with SMTP id 6a1803df08f44-8b6dd874471so69478776d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 21:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779252550; cv=none;
        d=google.com; s=arc-20240605;
        b=RDA5nOMCwEMCAYJzyR1Swl7npvRZ25VA/J6cF7PKEQ0oqzfKv6KlZMU9iMQguNB8Wa
         iktBhTnO7Vl/i91SlxKyYOpXm6RYYB/ejGODXAz9qDo310ob1HOe/8j8GjtOd9HrZs1c
         MBznnTnv3ah+WasaA3Ovo1M0zTkzixMJ8hjk2FDU9OiK9PuYTpIf2Ov/E/WMa+ksh7w5
         DfUqj2SSgHEuYH7vc3JpIPRMIayOfIox4tP40J8GYORLrOth1W3NT3psvisGy54hu7uJ
         k0vnow3aY+tCRqayrKR+dpEQMvuLrG82+L6PKurPmKJpt676+y/3E3F0JEMJGe1Lsjnb
         OFPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iX9DgFfgjdBAl007JWxmgssbqGhgCd0Hmt9BlGMfEVM=;
        fh=yUCgYTMoGXvJI2YyM1JAousW3Ctox1xj5wE5eCnnGWw=;
        b=MHXmSHrqJw9wYrAqzh4UEkKrvMz3hKWpBCTyF5Muo1Ub2UkpsoMyjgsbCTGhy2s9BN
         3Ovst2aOPCqBO/fGM1hxG7Sej7j03+7SKk7Rwx984cpXTBhZzDPCZ4recd09VPSezRxU
         iXICStWRr5GRIjePI+9+u5xVsGlonmcLQzVIPmEgGrYyWJj1mrZsTyXyHLlkc2RX1ltH
         ZLpI6VH14IU1n4+iBgiyBU2Aq0MFMF2hBrYkLctpW0SUN51RPc2vrmeCt2SRhJbRJB8q
         /0USvJN5n8A33tabjKMx+3SNOPb/1ZHgp+pNB6astp3aOvsxLO6m4a5kljqNq3x2qs5M
         K6EQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779252550; x=1779857350; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iX9DgFfgjdBAl007JWxmgssbqGhgCd0Hmt9BlGMfEVM=;
        b=Z9FKqDoNGESFY61KkkrY/UD/cS7DyBwkd9VxyJyBISxrk74hUpJS5IE/evcz5MXrRV
         n1woGpVs6IB9+I1nmeewmkCqKQpR6vTkjgdM0NlGNpQpebDKx1N/SzfMB+HOJSZ0dcPq
         h6h8MueP9w9n91Fegn3ReApzjs8OK+8ZArAK0xUzLjSuzCIG5akxgR3/xVfgOrUN1xnx
         AlSZcn4MozBMZ416k2XPP6kunMWWxw6+WZgu2gYKU656pJ+X2vXE13GbmBruTGgzh7BM
         Qbcc/VcKJKizKr18an3jpytP/PFeLLOWWlgcWHA7fMt5wJrDtDsYReqNMBJBTmQC1a1t
         KhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779252550; x=1779857350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iX9DgFfgjdBAl007JWxmgssbqGhgCd0Hmt9BlGMfEVM=;
        b=RPHTuf8E6UnXY1ScgmYk1+33uP7IIa0i+deDNoQ93b3FgvIVGZFWIAjO0leFtYFjaL
         xsrjgw7E0zwErIObGmHc+V7RpmFHp5ir5U2AcdygjK5s2kozujJT15cnLn6Dub+56KIf
         X4CzOJ+Q4hqqvGrBMLe3INE49b4ZTl1fYubwoMgmZf1yF2u6lTOS2M88Tqzx5etxpF6A
         XrixOLJGA7DnRJ8+IcLE6WCMjRryG5G2wORcwpAcYHSnMpbWt9hvKXUHVfz7DW//fDGb
         njTaiSK7aoNsoSh/KjQOWjGAhWybUZlSTTLu9Mxi6mZLYPg2LA2UXcVHQPN0RapXN+L9
         FIdw==
X-Gm-Message-State: AOJu0YwPsH55zJzEaD6yb4PGWfhj94mEliD9wUTrAxcYoFuWYo59lJT0
	c2/jKAcyusNlVwPSTrnHy5PucOlmSq5CpX4KCBaw3DAnpMd0fKrXboQnMefpG7iZ1qPTaYlGT4i
	BKHcJ9zv3rA3qrmIYlhALr9nIqjKmmrQ=
X-Gm-Gg: Acq92OGpQCO63XpW94oPGPPUOK2oWtrhJpQ9ERP0QAUcPNSZ8mpOafvviy1+wekD85k
	Cn2q3YF+QZlGVRKbsAOR5TDYbUnR9KridfRn/2Uk01M1SoO8DApnOPeKz8TXNEwcZTszJCgszc8
	IsAb0a/5Q8YL0etKMNy+EdV/WOr/3VEFP/pY5XHaOKYW2iSzCGr4yL2C4WSyj1R2Zwv16N9rm57
	py2QV0K1IT7/x+eu/DWTUL5R5KQttVOux89JnYv3nU6UCFVEkrzLdl0el6vK24ZHKHDuqzo07D7
	i6v9w/engB+JzEEVaGsqa9ZdG4Uxq0EyFUP3k2M+KBDBeIMQU7CBcGmD0Lhs5NX9Klxr
X-Received: by 2002:a05:6214:478e:b0:8ca:f47:25ea with SMTP id
 6a1803df08f44-8ca0f4fcfb8mr351820016d6.0.1779252550653; Tue, 19 May 2026
 21:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260510023941.190396-1-enelsonmoore@gmail.com>
 <d0bb399f-1285-495b-babe-8bae608729e8@gmx.de> <agwpPFGkN3zHKdCj@carbonx1>
In-Reply-To: <agwpPFGkN3zHKdCj@carbonx1>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Tue, 19 May 2026 21:49:00 -0700
X-Gm-Features: AVHnY4JqLEwFuVkjtY2Lbvna297TfZ51kPMwwQBMs7y6OuNbOahusQtJV32GfeA
Message-ID: <CADkSEUhhLL6WxUWBChdA=LFrYZQJsCLKOFJoXA_Jsdpab6qx0A@mail.gmail.com>
Subject: Re: [PATCH] ARM: mach-rpc: fix zImage build after recent font-related changes
To: Helge Deller <deller@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_214911_976958_BE1EAEB8 
X-CRM114-Status: GOOD (  11.04  )
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

Hi, Helge,

Thanks for investigating this issue.

On Tue, May 19, 2026 at 2:11=E2=80=AFAM Helge Deller <deller@kernel.org> wr=
ote:
> Ethan, does this compile-only-tested patch fix the issue?
It almost does - I also had to remove #include <linux/math.h> from
include/linux/font.h.
This is probably because of the following highly questionable code in
arch/arm/boot/compressed/Makefile:
CFLAGS_font.o :=3D -Dstatic=3D
which is causing unused static functions to not be optimized out. (The
real purpose of it is to make the acorndata_8x8 array non-static so
the decompressor can use it.) Really, the decompressor should be fixed
to not use this hack.

> Maybe only the first hunk is necessary.
You're right. The kernel links successfully with only the #include
<linux/math.h> removal and the first hunk applied.

Have a nice day!

Ethan

