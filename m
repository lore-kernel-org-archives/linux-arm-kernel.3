Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2687CA9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 18:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9aoCkFfSDX2/6XxSiLf6H4ohGMtImVLYKMUBsJfeiU=; b=Mia4sXIxp/n+s1JZL7T31ZRjLm
	4pEtmOwxapkA58OG8CmrMuqUt7TsiyU5Flpk0XKseqF7nrzcDKeYhYDy++llXyfYIffQvkBVwRhbn
	YAK+HCLm4DYXndrJ1ir3avBVJKezaPcKNMtPtjutNnl8uD/mopJ/GHCx7X2uW5GlriNCtcbAy48GV
	89lYkJKf5OLIM5kdh7KeNLVJE1ksr8MdAtiU7TmXBzSkiDoTMO/S5j04VNiccssIfanKO3F1R2ucj
	ON1ktH1VcJ6idx/xRSxvAPEz+IzCL9CfjBc5AoVSc2hbXb1KPDM6niVaz0PGTStDP2MptS6asiHC6
	FG8TZofw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKMB-0000000BAjO-3muF;
	Mon, 12 Oct 2026 18:02:39 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKM9-0000000BAhM-0NSz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 18:02:38 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-3a9e87ba7f2so7212681fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 11:02:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791828154; cv=none;
        d=google.com; s=arc-20260327;
        b=WcZ7CBwruaiyMB5MJdv6aW4E26SqKQkniEUFQ9fQG7rt+r5omay2dqlYKe0eYIb3UH
         Da6Z6bVkq1CXGtYitvNjSbuNebAZyPDfiuRv6mwWXfq/LR0gMUYelms6lkfUG21VQcI9
         d0isYSL3D/mtJL5EC+SUa+xVkhQp/GtIh8c3yvcdtRop0XJjbjsdFsV3oaKmd+zQ4VER
         nSX30vz0OwkHF19kDAsaVBW3ruLIO0wx2xm3RltOMZK8HlUazTyQ/Y0Kl/ScanSMS8YM
         3LKmNOaM8iBg0bQCPDan1buWE6Ke6meVevOFQXJ7K/CrIlNcT1ZfcXpNecmfdQ5bMefc
         gKxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=f9aoCkFfSDX2/6XxSiLf6H4ohGMtImVLYKMUBsJfeiU=;
        fh=nc/6bOLNDp9F3DgzXK7y/jb2/vHWcqIkfkbxQ0q+lSM=;
        b=DfaMHf4YpyooLoe1Q0YigFjCJbZhSpuoWRs0B+p4XJh4Ac+KbtxNqu08Kp9A+HXq9m
         7D3hbRv2TK1YMQAlfcJlScsUIBolzTOhuTIaQ7gsOIM+FCKx7rhCBPDIX7gSfEwgT+he
         l2EtF1juxYZJMPdtxPAPR4iAk+LA72nT7lc3n6QhwtDMN1UA+oX0jbkcDRT1ej2uioQg
         D3BjsHjtfuVCcvMrucw8XvQumb7d8J62krzvBXU1INaO/XDKSJNKBoqv2WXRINCOQd6m
         2YOkhkD0POzT3NxC3eU266PQayhQhIVYpopSGcd8OQpBO5GwIR9XTEkFVyeyCrymv30h
         lnVg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791828154; x=1792432954; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f9aoCkFfSDX2/6XxSiLf6H4ohGMtImVLYKMUBsJfeiU=;
        b=iuVGDrNt8st8Kz5sEVRv1A8eTH0fhXymL63cnIVHx4pALNw1YaJXnsgUwmDcEjXCa1
         e4Hbb8LnnRnbI+VI5VlMNbRaklvdcYeUhWPUtZvx343OaG1Y3vFw2sd1XLQSZyUOTlcA
         YOwQdd44IiLnKbhYyb2MQTmFq9Z6EpAdJgi+d1gV4zk1vJRZwxvNPoYJiKIDztns7UrC
         ugoGUFElg2WshrpSsdIKr4L/QzIUZbc6QizjrfVVBiXL4jHOxLQAwnxyd4LDmhvywnfc
         o6PJyb+qSYd8rZw6gJxqUo0JdIhh9RxsNAmN0tmIrSuaq9lyVCJ7nfpDWANPNTmvo+S7
         b2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791828154; x=1792432954;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f9aoCkFfSDX2/6XxSiLf6H4ohGMtImVLYKMUBsJfeiU=;
        b=Wz4wR1ec6zCMdkvVJgtxM7gkuyVspLaRZyEWpTybFMcubBtiR3xQUIzP46IjViihzu
         C9MXt3rGEqT0zE9oczoqUQ9PKD/CEPRUQTjKvnUqghAhXCA4vWeFM9V7VZLzGurYdDM7
         vByf+3aYgjLcVjVebmv60utNw+GNUmNujcdytDEOGN+hDt+RJ64HjdtBkhrROKtQnoc2
         MVIXSON4RpHi9dcbF9+NW1Rjn1DVZATRRHtbpAIiIk06MpxeGTKtsCe36FK0LVn8K/SF
         VW/Lwuvuxugh1n9PpQOruyCuqKIbRO8aoE10wjH4f2QL7eJrYw0lwG/z2cphUQRv4a58
         W9iA==
X-Forwarded-Encrypted: i=1; AKwUvBzxuNavzGCWujMqf1DiYATFsVFYtoIo1qi2scnu0xpbKbiR+fzhLELg3+/ky+isMyrF3/rO2Pb202+ir/449hXe@lists.infradead.org
X-Gm-Message-State: AFq9FYLj39pe3pfph/UsdO4ju7xC6DZh7x2Z71Mtl057+aS5JPmViwbo
	2DSnIajFmKOX0NxMDcEY1jXH5OqW0aK71srXKHov2OrTJI98CP2ddu4U36qCCbxHuMidtgQGz27
	RlCEdTT1lRRQM55pP2uZggIIykeWSo1s=
X-Gm-Gg: AYBFou0F1nZgCa8u0vvbIrSA7rIIJefM5H92OFQeaKfi3qNh9DM2NcsNzq5AlI9wC/6
	H/njEfFal9kXIRd+PW/nxwTzP4uIAxsrBE9dn4RXHpyeyGG9x95exvuxzW/E5hjvGmKX4552PqQ
	JHZQDKglS5A47BHMlX82HSybe+Uyywu7XByBKHNOFfKAAhxN1rR8+TpStPVpz9a78cjv+ZUO/8A
	YlXoIfiicDA8oXIRsOzyeXfShOFd8lHvYVZfgdXUVRKpfzcg6t3LOiXuzZlMsO/vL17U8O3hoP9
	dP45VUWGKxhWf85iOW3q5a+xursUOQBk5elE58TWXs3AtCl1/HPfmj8=
X-Received: by 2002:a05:651c:144c:b0:3a9:d377:f5e4 with SMTP id
 38308e7fff4ca-3a9d377fd51mr18447101fa.20.1791828154266; Mon, 12 Oct 2026
 11:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <20261002090947.869220-1-jiangwen6@xiaomi.com> <20261002090947.869220-6-jiangwen6@xiaomi.com>
 <astarANeoldvqBxc@milan> <4f812ef0-ab14-48c5-908b-b7d82ce418b3@arm.com>
In-Reply-To: <4f812ef0-ab14-48c5-908b-b7d82ce418b3@arm.com>
From: Uladzislau Rezki <urezki@gmail.com>
Date: Mon, 12 Oct 2026 20:02:20 +0200
X-Gm-Features: AclHuK_uSuO89Qhd1bXs6ll2oIbh2EHyO8-k6OSdE2Rwub_69M_koNK3b1_sl9g
Message-ID: <CA+KHdyVjjk3B0gsfsx+NPeuNH+ZyN7HbiP=S0F9kspRO9ZAXAg@mail.gmail.com>
Subject: Re: [PATCH v10 05/10] arm64/vmalloc: allow arch_vmap_pte_range_map_size()
 to batch multiple CONT_PTE
To: Dev Jain <dev.jain@arm.com>
Cc: ryan.roberts@arm.com, akpm@linux-foundation.org, catalin.marinas@arm.com, 
	linux-mm@kvack.org, will@kernel.org, Xueyuan.chen21@gmail.com, 
	ajd@linux.ibm.com, anshuman.khandual@arm.com, baohua@kernel.org, 
	chleroy@kernel.org, david@kernel.org, jiangwen6@xiaomi.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, rppt@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_110237_172375_AF565483 
X-CRM114-Status: UNSURE (   9.01  )
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

> >>
> > This is arch/arm64 code. Can you, Jain or Ryan from ARM folk review this change?
> >
> > Thank you!
> >
>
> I will come to this soon.
>
Thank you!

-- 
Uladzislau Rezki

