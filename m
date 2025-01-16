Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764F9C02187
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 16:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QGPiUeQaDByXyGYfaiyGjoevsH3zwreWTmPpwDEUSo8=; b=pw3de7Pe3iD2AxG+eyl0Lq4cIj
	lOslcrK5lKbBAdKc7N0GrVCZe+KmCD4vlBvcilEO2WqsVejo9dUF1KpSm3eqU7vsy13panJGglsGu
	P2PDP4gQiwQxRvsKoZvSEGK5kKBSY+xqqgwnktVVUJXYTUgothnk9RP2N/JhAojWhX14cqv+yotIf
	5Ufh69eDwzADI7h7u9tmztRuZMiFwxbBBiw+ne7znu/6JjxwcodaKr5QZ0hyRMkEOYgjZcBnVyV6b
	SnWUOSOfkR34Qs9g2lHGp0Ohx4AIw3DvG/ZD0zhFPWKOkkZZnEj0mcxAqqBIlpwgCdSPryT5Rlc13
	d99JfZkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSMs-0000000FSXa-1g2Z;
	Thu, 16 Jan 2025 16:05:14 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSGe-0000000FQ5Z-1rlp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 15:58:49 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-e549b0f8d57so1887295276.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 07:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737043127; x=1737647927; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QGPiUeQaDByXyGYfaiyGjoevsH3zwreWTmPpwDEUSo8=;
        b=oY8+W8R6Ym7AeM8vUv7+7Eu66MVBPMA57lnzisPE4teL34ZoTzZzDBdPSC8PuJp5Fx
         rgrURwRjsgkWSh+4mCIJZXkd+W89kv/Z7NfXL5FZuVt45vPxgXiwCo5cfAcrSV5m6NUl
         PeevADCOUPG0Cxhkxt0axKcYZI2nPAzeG2mLKR06xyBiTkfCDvF13Vsn6+UXMZzXWYWV
         c5rqhDbgZ6pUc1RzwRLkV7doq8OqJ2r/zQw1lHxQ9xfFSzugEKu1K0bzi+nwb381ElTP
         DWkKgff8Bw92vxhTNQo6iFXxQqc+7/yYuS2zpHdjQued/rB/TRQFXOBgHuvA20ALG6ve
         kFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737043127; x=1737647927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QGPiUeQaDByXyGYfaiyGjoevsH3zwreWTmPpwDEUSo8=;
        b=r/IC0D4ZTb6wIR5/hCD5oqnrkKu4HWaN2bfetHjLu7vOLFM+otxcFpVjoVKc/lU2Jt
         jx/ZPGODQH2SkUnZH4cMg6JBxdyHdDmHEpfwlIFZ/KKj7xIBYPV+8JvKUCjm9c3t32gD
         y+ED8S8XUt4ihZfa2pr3OxxsoN1UvR7tOlqfQO4sUd0eZ9pgbOZLulFwsOMtTY/uGnjI
         LmNfDKSIj1fWj0nhibF9tLbPNzQmccdsuk192SGNb6aErPN3Uqh0c8KNOtMulUsVLl7t
         QyVDUxASgqoWzQJFmZYX7KjqjI9lEF5YxafXB6iZDQOpwLz4iTtMSUzAqFLKxKz0K0KS
         GCrg==
X-Forwarded-Encrypted: i=1; AJvYcCWa7BuMGVBvHYsOW7P7+c/Hz85GaOsHyI2fqp1qqcfIwQp+dD9LrpewUjZiGa1umsvvVMRlKH4ao4dMlboT30AX@lists.infradead.org
X-Gm-Message-State: AOJu0Yyly1TDV14Si1PRtUObmVevBStVfoLO3VL2nYwPB3lLci1+HGz5
	8rUBw4AxYHOV2Y3w1sew1l5BPVrNTnfpsvA17ALiw4G47int4KhlbX7EhG8AM9kzVaBSbcBARRJ
	o95pBgefxcZi31v70ri4Vjn+ykkUJgfEQCqOeQQ==
X-Gm-Gg: ASbGncsTbQc+m+MbANyyqUVApdSda2098Csi//Vn2Q2mZ1yGz1nwEs2CAG12tvbh7nH
	DEZzmgTh/f1cisFV+5iKQtqfY6cuunf9CX5/E3GU=
X-Google-Smtp-Source: AGHT+IHzQbQYAi6FZO8GNmu8t3VQrhl2ccDWHjHOxE3SLBVC4VwnOsYtSa0UftO9WxJZ8AnPeBd+o1qUAP/ZQG8iuDk=
X-Received: by 2002:a05:6902:18c3:b0:e57:8814:13a6 with SMTP id
 3f1490d57ef6-e5788141804mr6901177276.17.1737043127387; Thu, 16 Jan 2025
 07:58:47 -0800 (PST)
MIME-Version: 1.0
References: <20250109131313.32317-1-ansuelsmth@gmail.com> <20250116070214.vdnbyyqnciifngha@vireshk-i7>
In-Reply-To: <20250116070214.vdnbyyqnciifngha@vireshk-i7>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 16 Jan 2025 16:58:11 +0100
X-Gm-Features: AbW1kvYjzgMKu3xCJVK7F5l29WK5ilTbahAEoFI6YcNzZrqQ5wXTPLxX0mm-M2A
Message-ID: <CAPDyKFr_z3WUyO2bTV7fPt8=ECdoHCERd=f5UN8MmNpyN=Rm_A@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] pmdomain: airoha: Add Airoha CPU PM Domain support
To: Christian Marangi <ansuelsmth@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, upstream@airoha.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_075848_476402_B655A22C 
X-CRM114-Status: GOOD (  14.62  )
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

On Thu, 16 Jan 2025 at 08:02, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Ulf,
>
> On 09-01-25, 14:12, Christian Marangi wrote:
> > Add Airoha CPU PM Domain support to control frequency and power of CPU
> > present on Airoha EN7581 SoC.
> >
> > Frequency and power can be controlled with the use of the SMC command by
> > passing the performance state. The driver also expose a read-only clock
> > that expose the current CPU frequency with SMC command.
> >
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> > Changes v10:
> > - Depends on HAVE_ARM_SMCCC
> > Changes v9:
> > - Fix compile error targetting wrong branch (remove_new change)
> > Changes v8:
> > - Add this patch
> > - Use SMC invoke instead of 1.2
>
> Any inputs on this ?

Apologize for the delay! This looks good to me! So, applied for next
to my pmdomain tree, thanks!

I assume Viresh will take the cpufreq patch via his tree? Please let
me know if you prefer another route.

Kind regards
Uffe

