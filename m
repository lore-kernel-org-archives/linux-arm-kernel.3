Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983B4D41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 09:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iuV++rBkrNA/kKc2HZDb0IcKwxQSZL9qjg+wv+qXbvA=; b=2PwgChUTY62EkjKEVaAvWaiUvg
	kEeH7VHPkroT88oi7RjqmRMLzLYvVX/tiJu83+oWVAczZF+JSDGo429pyIzu9AkHGHm7DEfKUzwJ/
	F3VEkMTBsluoThYrf5OC34lbr4nQXpqRvaryKRdp4A9PeXyCz6XJ84ulYo1V7PH1h4uS/zvAfBG2d
	V7cUIsASvTvvvCs3mF9FM2ISomgxzANUxeQQeGwkEG7QGdO2cHAzqqgqEdE+3jEWpxY0wjdXfqOrZ
	O3M56OyJkAjZ6gcMGeFFLwVMTuNNAYOyMMhlHnqlSHJvUk9VMsBJoVMyfJrYb9De7XEqBoTZDOkK7
	wfn8Q5aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV5K9-00000003POP-1jQ3;
	Mon, 15 Dec 2025 09:57:01 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV5K6-00000003PO3-2rI0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 09:57:00 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-6420c0cf4abso3161320d50.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 01:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765792617; x=1766397417; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iuV++rBkrNA/kKc2HZDb0IcKwxQSZL9qjg+wv+qXbvA=;
        b=PlN4SrMAmjjHnw/fECXQIOpxWUmxPuGq/aKCsVzzCmiPGwVTwaFUjrf6WefurqUDAK
         o4qxdmoa0S3XJda2IFHEcptF5y5LCH4EAa2w02FwlFA9D2qxQVSdpb0gaRvJYBmNMQrI
         HHaPSt3NgPPWMrjLJb+xPFVZEg5+CMMebhGg9gsVgrjvcD+B4/n3U1BAEtrx7wrnIhxy
         O2pnjpbnoDTqbm/WEfSr1cgm9C/2vS6DDy8at1091+UcjJVZEIgIv6BGpFrh1aeBzqic
         i4vc74WAaLr6B4bgDZdDzpjhwkCuacDoImE2XRLqahI6Qxis8oO40T/YvwJZrqoq08qb
         MMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765792617; x=1766397417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iuV++rBkrNA/kKc2HZDb0IcKwxQSZL9qjg+wv+qXbvA=;
        b=raIQ2HQ9lnoaKmvmOM0oCL+CPqc5k2boQTuxP949G9VbM3me+qhfknEvZj32Y2LoFR
         ifrsD1sSFwMHplqb/AJEHqdwJKIwaFCPigWb2kwq8oF+L9vTsXS6cYaK5wmpwLACUP5g
         /Eb7TQUA4PFWQlsCJBowoVT6uqkQGNfGqcuLCznDa6wC5o/DbBDxxittARm9bTPWiOH/
         zNLi5Vgnm3bsdlkIZoyK0eJXbufn5PBRYtgSAuijOMijIUtsUo904zYKEvMNS8DtlZjj
         f4e0J9dP2n8rWMk2Z30rRu4onaciaWbTrEL9090qh1xkUI/LUShov92c6WWVgs+NSexC
         VNeg==
X-Gm-Message-State: AOJu0YyI6AB3ctSGLA2XDIx0+sbjv+xioFwShRX9estTdjqDcLTDGc/q
	Isib3SwlJqYsx1+zI8RuN8iPxMV19VHq/j2cg/JyKGboyPif4O8FUjU/0J9iIiT/9QBjlDZsS0L
	J8ssGPOiT+TgzRYLIFBjBjJiMgS+j1pF3p8OcSM6Nrw==
X-Gm-Gg: AY/fxX5rTckiAqR6xE4CpKg7j1hCitSuyb4QhEj0hmmS+psgDsEA9MyepMDHiM5sCth
	sGLReFUSYHf6hgMb0bjkobev0w3f6NRdt/E8X5c9930clwVo/TdbO1pH4eBeJY4taVC3R1n3dzJ
	tRY6JG7n1qSYqm8S6xXoFwfE7ruUKFXZkn4/lyofExBSXQbLJ3UvBv6CAmtsxM5Xn8/L5unxUkm
	5ENnov7tLWWIsNxyzIE/S6rkXq/XXombHYyYiFs1mlhgcAl65Rv35ksJYiNg0a51dK3kv26
X-Google-Smtp-Source: AGHT+IGvRV+k5PpJ3mHqjVXWNH0ySYLSRmzIZa/3PhuG05Fhie+VpbBy/JBhrcR8TEOdgUG1Nhjy1u+B7Rb0r7A0s3U=
X-Received: by 2002:a05:690e:118a:b0:641:f5bc:695c with SMTP id
 956f58d0204a3-64555661ec4mr9123217d50.72.1765792616925; Mon, 15 Dec 2025
 01:56:56 -0800 (PST)
MIME-Version: 1.0
References: <20251212152215.675767-1-sascha.bischoff@arm.com> <20251212152215.675767-32-sascha.bischoff@arm.com>
In-Reply-To: <20251212152215.675767-32-sascha.bischoff@arm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Dec 2025 09:56:45 +0000
X-Gm-Features: AQt7F2oZumKMouo4dd8tGmO8LzSkjWfV4-sM3jXbB_jFEwXZwbdvqQR53He-UZg
Message-ID: <CAFEAcA-fgWOUu7yWfGNGyy0BwTPxH1ht+E5SQ4tjJf3U=w7e6w@mail.gmail.com>
Subject: Re: [PATCH 31/32] Documentation: KVM: Introduce documentation for VGICv5
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd <nd@arm.com>, 
	"maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, Joey Gouly <Joey.Gouly@arm.com>, 
	Suzuki Poulose <Suzuki.Poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, Timothy Hayes <Timothy.Hayes@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_015658_823873_DA068C0A 
X-CRM114-Status: UNSURE (   7.80  )
X-CRM114-Notice: Please train this message.
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

On Fri, 12 Dec 2025 at 15:24, Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:
>
> Now that it is possible to create a VGICv5 device, provide initial
> documentation for it. At this stage, there is little to document.

Is userspace access to read/write the GICv5 register state also
in the "will be added a in future patchseries" category ?

thanks
-- PMM

