Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67990ECD985
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 16:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TT2eQRvfgO/3XBRFae0T/CpdFBfoJ3maco9Ak5Gp/OY=; b=tb3TUwalACYYcigXO4md0Kaqey
	Jzhg27ZhcFVvjWwrOMY82aZbqF/60lF4fp0u8cZn8th2YApIQA+mJqZXQgw+DuYdXIAkZWTeC3pl7
	cF1e4PEx4FnF7CHO8HcCKrqP5M/Bfs+1aWTPr+l459u0QIVGJ6IwdQsbi9IWkq62zXSEjwYnd3//P
	cJ1Ij+M4AIcfKicDUHqifNJ/sXOcZsTzYI5vneMqNuGRdetQsAjsEufMBr1Tu0b9xPn0grvUvBoSU
	T9UV4svfev0Sjkn1pnR1VgGF3K8yGpsjZRTI5hX3sKBMyc0ucmnyXksoTpwbyNw10uph1TE/hg1Zs
	Ghk0pGpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo207-0000000ADOR-3QBm;
	Thu, 05 Feb 2026 16:14:39 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo205-0000000ADO7-1kPe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 16:14:38 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4362507f0feso423706f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 08:14:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770308075; cv=none;
        d=google.com; s=arc-20240605;
        b=ShOuI5+mWUzotl7csJkjQgRvvIDEJpoIW+IMjQ3JqRZhe1mHPOKZh+ENtBOhXDdrrI
         LnpbJrFPPdzRQlwvz42CoOb9RTYDDlXm3i4je7WZJHqpdtD34eTTBQTezkjFjN+aZDQw
         h8EN9bpmOqdwnjoSnGxisOufND8ZmIwySJUV6MW19WMz89aQsBwRJ1rofkriVd7W72Ef
         4PEfeVBUafaK2zdsYn5M+T8DyzT4d6jh6UYGMO825uquCmSoRSKaCNHU7oRgaVB2as5O
         dc3SZG6H54/fp2FrQVUrIT5D3hH3EkOaqlAL3cyu6Tzj0w7ZPp8P8L5In/x+ct581UHS
         YpcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TT2eQRvfgO/3XBRFae0T/CpdFBfoJ3maco9Ak5Gp/OY=;
        fh=ElBl9RUxx+ZsElBzKv0MXV11eON1QbEAk1Ual/bMHc8=;
        b=kz+FqIlyTFBuw+EGE1qKHB+gVGfZOvf2b2WHNZxlP9ONeg5l8wvjPHmUwLhDEt5lel
         Z31nNcZzBCoIU8CHyNHzwVqNjWNiH0Ulw8c7/f0i+4xqX1yHdSEdLjf0S/Fk/zabVSSQ
         SA8q3gRSikJrFvVOnCZnK1hb901mXaoHPCx6ireeMvLlmaX3fryNj0vhXbzxhU/xR9lg
         VRjzak6jzgcEKWZdEGVpdPjvTi4UK+F4t1dPviCNNxvjhhwcGZmcpxxVMN9KpNc/t48V
         hLMwJrOEMn308bl07/QzpiqNIFECdfbFc4BjFrRfka/xp0ZdN80lhOpMl7O0dtKsauZz
         M6UA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770308075; x=1770912875; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TT2eQRvfgO/3XBRFae0T/CpdFBfoJ3maco9Ak5Gp/OY=;
        b=DqyzBMXiKcuI5/YRfoCv+PuKotCN9YwXxNDZEvY0Ktk2gLoAlSjzzhs39e6r4oojof
         bYFarovTEsYjEw8mUB+Ar0XYJtOE4o/FVKAWq7XSHiAZeZY3YhUzS3nCuy57+yWclU1X
         XcLfORChQwLqgTKf9ecTBuTBpmfD9Ixpsy8vcL80OxCbKAXBeiigl7QrFmOS1FEbvEem
         GltiTP9EiwGpvS+zVMo0Z4irmApkXsYnY7ppjiRMkeH5EcAOMgyKAAD/0MZFyMdyjTvd
         KnSfava1eA8uJ28liusyNg8BQ1WqaqXa9LcaEvk5jkisnK3EfVYZOKEAYEh99BxH6USe
         J3gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770308075; x=1770912875;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TT2eQRvfgO/3XBRFae0T/CpdFBfoJ3maco9Ak5Gp/OY=;
        b=eKOTVf6HyuaZfTIgH7Vk2FmX9oLllvA4iDMbfKLVIYMcPkeY6hWm/rkWNau4TV9m4A
         +zaA5TvqnSbpeACcQ/p3WbC1TjgspPUh/ShzErMquSKIOh3P7z3btX9N0/hYZ5GGUMTc
         HrZelSN14MWTBYXTaa+cNrym1K1Ey9zmrQwUWLNRXjxrLCGIiVaNXSUOU7TWY9urhPuz
         KkIE/Ep+t2MVWcAa1S2dC2Zs8CGSf/8RAU7Dktijbg2aNway0ZZuDnLvH5zcuDwAI2GW
         Ai14hYTH75Y+jR28h47XpFPUYcM04w2GHmt+6xwti+CQ8ixuPvmA0aeoLNMPGiXC/76f
         rPNA==
X-Forwarded-Encrypted: i=1; AJvYcCX8LRLYmYFTBzJPcDj0hl/O6+M2j/lJHT9xfRT2t6j/WM4cjkT/cb4FfYp2jNQPzWAObTuzmJe3e2fnrDRQ7TQs@lists.infradead.org
X-Gm-Message-State: AOJu0YymiinG++f4iZeIFHHKAhG5efNTnSMq+Q96v53qoCpht0SHZLG9
	LiG819rZ99HoGfFdxF4v6BZDDDDd93e/34BUZHmOg1Gcw0fjh3zoG8QMyZCzflino+MShuxKqR/
	CWx+PE8nEpUqMS3u8RO74IU3fYxyheqo=
X-Gm-Gg: AZuq6aID4get+lZPGtLrPUuvuWFKU3BFwo+2ZyNCH2SeE2OwfFdglnoI3qLzrmlSPKP
	+/iSwdtQjSNqDRB0TY99YnVLovwoOZA85/RkzzrRSD7SnITfmLuh0oi4p6VfX+KOaX3sDB2Yjhu
	+hFE3/TL2IGh5dGuSM7avQisUu9xjB1UH21vhPMK9ptSPd6t+Mjfq0bwkHebgrnmoldvijyLpa/
	fYuGebssMBUFSZICR8mC1tvzW/H7e1c/xnVDS2/pfE+BoPilWEhOKulX8UpaJo3MEaIDKLs
X-Received: by 2002:a05:6000:4008:b0:435:e436:7fb with SMTP id
 ffacd0b85a97d-43618059612mr11097375f8f.50.1770308074748; Thu, 05 Feb 2026
 08:14:34 -0800 (PST)
MIME-Version: 1.0
References: <20260129022910.3942028-1-onlywig@gmail.com> <20260129022910.3942028-2-onlywig@gmail.com>
 <aXsdyzZEUaVzC34W@shlinux89>
In-Reply-To: <aXsdyzZEUaVzC34W@shlinux89>
From: Wig Cheng <onlywig@gmail.com>
Date: Fri, 6 Feb 2026 00:14:21 +0800
X-Gm-Features: AZwV_QhAb-x2AIC9FZ_A0KiIYxUwdfCa-Lm4hiLKANWs8oWf_rB0v7ryvoRkqvg
Message-ID: <CAPStFe7ASmYxJdDorJ0KAerfTH51ioZ=89F8fRcs6fBVqqhdUw@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] arm64: dts: freescale: add pixpaper display
 overlay for i.MX93 FRDM
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	zaq14760@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_081437_490193_98F4A333 
X-CRM114-Status: GOOD (  12.03  )
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

>
> On Thu, Jan 29, 2026 at 10:29:10AM +0800, Wig Cheng wrote:
> >Add device tree overlay to support the MayQueen PixPaper e-paper display
> >on the NXP i.MX93 FRDM board. The display is connected via LPSPI3
> >interface and uses GPIO pins for reset, busy and DC control.
> >
> >The overlay configures:
> >    - LPSPI3 pinmux for SPI communication (MOSI, MISO, CLK, CE0)
> >    - PixPaper display device with proper GPIO assignments
> >    - SPI frequency set to 5MHz for stable operation
> >
> >Enable Open-EP Community pixpaper-213-c support on NXP i.MX93.
> >
> >Signed-off-by: Wig Cheng <onlywig@gmail.com>
>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Hi reviewers,

Thanks to Peng for the review.

Just a gentle ping on this patch.
Please let me know if any further reviews or changes are needed.

Thanks,
Wig

