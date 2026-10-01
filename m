Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63244CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aKueKOhi2EJ/sJpvwQQBAHFYrN/nshYB9lnhmsVqc00=; b=Wckr98Rbz+QvkWvaoR5ZVc7+zZ
	vd/w/aPKZLo6kVZvgQ/cYbhM9b5fEcnujmBVr1qkzwpMzNGdbg3SVh5fUhFkRIKXBBoI+DpioXp9I
	s28kODmHSBK70x/JwIZCnExA6nkmAicKvk+odiiWm2IC6CU97fNq7qF5dM/axzv0dGJEtEXdcRB9d
	IFi+i3OO/MVKL+qqPx/6VoJ1KvqWPjiKQELX/f6yfZ8Ulr+a7zYYZu1dCPYdPEb4MURJ7RBSOvBvq
	JQqQm/5tCAGT/6y1E7yovNT4s7mYHk2LhQ9c1pQuYLhxqinbSVC4CyVRG+X/5a/Ti5t5vzurP+9Mr
	dlwX6Xhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBOR-000000081g9-0M1A;
	Thu, 01 Oct 2026 07:39:51 +0000
Received: from mail-ej2-x0d.google.com ([2a00:1450:4864:34::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBOO-000000081fA-2mE8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:39:50 +0000
Received: by mail-ej2-x0d.google.com with SMTP id a640c23a62f3a-c2e3f641442so28625466b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 00:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790840386; x=1791445186; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aKueKOhi2EJ/sJpvwQQBAHFYrN/nshYB9lnhmsVqc00=;
        b=lvQZpUaNPY/na6gzB1eGwWBZxuz1Y4SetbEakdpDFItTblUsu1T2GlE88Z0Lpfe8Gc
         g7EfXPaMzKBE16L1jiXR9nYCXmOni0Zcdq22gm/JxkknO+G/mbQjv8WrTNSwdxew6kNj
         geULBnrApEDb8gwtGXcyLwD7yJIcRp1PEGp+VuNSxHMYM8mirnmfG05schsMBXpEdE44
         dZ8+bKpdl0iEkD93N4mzSJwxvQCGuPHa3noTs4FCocR9ZlpA5UKhrM5wNLDp3J+ksCOZ
         hNIkI4VfNxRVvmjPenC5WhNRFQomVK9hESKcIlTdV/tuE9houCt79v8OXet72QHdmiYN
         P8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790840386; x=1791445186;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aKueKOhi2EJ/sJpvwQQBAHFYrN/nshYB9lnhmsVqc00=;
        b=2z0vbpP2Ofvkygf+lSymT86v0MIL3VDPO5pytokaWsfQ96E13mbz1HKAr5ViaVTCtD
         uhzoDSWylba0L5Gnt7JzarQZ73SDEGw/cuVftIL8IZ97VJd0fb2f+XQHFyqSOUTDUmN0
         ly6M9ldPwKAViINxt8Zd1IOXZEUiorEc8mbm1tKlI+7fBEobMV/l8oi2ZhWakm0GZB5z
         3HLbwmRk3R4sdF9VOmRMyF4GcoNNBiTArisYTNEx2YDEilWYX0egYCkyQhPU0ZiOBzkt
         iDRSZTRVrG4sZf3+yIRsGONUS8sWNu2b28xIOE3hsvh30klKrjQVl2CVzfiSFLBqa52E
         NQrQ==
X-Forwarded-Encrypted: i=1; AKwUvByjQdpJ8qJ6iRXo+Jw7e3bxSR4pVHH6gvI1UTjgXPoRNF229h1FEHKVbIiTbSoF0yTWZjYsLh6f1SIL82dJr39s@lists.infradead.org
X-Gm-Message-State: AFuF++mfeWRvHOByk+PY4uYcaMEUOgc1l/Z9jfA7faVNwx4Ke86pTiX9
	STeMAefeJiZe9MrSeAe7UtYv65ERa0tIJIWRCotq/axXBVo868brSg5WxfOkb9gx3UWZluxaYUt
	KuQ2ddfQ=
X-Gm-Gg: AYBFou1xISfiMPcDsw3F6ZfaZguvhjAmWt9QzxRDQvqDzA99y9PRVcw7LAwferlWrX1
	0qdtZkfJuY4rEPFPT2n6wlZ7BPMf9kwBP0ue3bdEOGglDSM8Hfqw7Io/YoqDIAv68U9+zLdfzb5
	TmLuvK8is1ITxqW72u5Gz2ixBZlfbnfJX75P1bsERrnRMk5bq63+tFKmLhQpNcNvgttZzLcEvNp
	Mj6ra5eoRh4MHJqoj3YcFhrAegKjdcEPmXpksV6y9auVha5GrttTdB0v6W2id5lMtktANG70Fzc
	kW2mBsMnArmvFwPpw4s4QNxysEtSG6E5zCOr+JUYC5rSCe65SETISd2hkE/SBijlukDJza3bEhG
	6WvzOPMIFfM53bbrovz+0deKOsQwMe2P5RSgex6DPvKxZh23Qx8WRDv6S2Hxge7Vr/2yA/Ramtr
	PWusoT00W54rq//dJO+i3Cv30vN0k7Bn55VsfXciUQ7VjgzxgFesS0p+RwPNNFi4vBy3HwzO4Ek
	hJHy2HtNLlPCH3S
X-Received: by 2002:a17:907:c15:b0:c2d:ca78:ea83 with SMTP id a640c23a62f3a-c2e23df5c63mr327337166b.38.1790840385430;
        Thu, 01 Oct 2026 00:39:45 -0700 (PDT)
Received: from dev-ag ([102.33.165.38])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31dc70adsm100397966b.68.2026.10.01.00.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 00:39:44 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org,  qinjian@cqplus1.com,
  mturquette@baylibre.com,  sboyd@kernel.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: sp7021: fix infrastructure clocks clobbering PLL
 provider entries
In-Reply-To: <179069997903.213266.2923932929883625249.b4-reply@b4> (Brian
	Masney's message of "Tue, 29 Sep 2026 12:39:39 -0400")
References: <20260820130224.1584902-1-ag@ffroot.co.za>
	<179069997903.213266.2923932929883625249.b4-reply@b4>
User-Agent: mu4e 1.12.14; emacs 30.2
Date: Thu, 01 Oct 2026 09:39:40 +0200
Message-ID: <sa6qzi9x41v.fsf@dev-ag>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_003948_964727_98B9DBA0 
X-CRM114-Status: GOOD (  10.16  )
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

Brian Masney <bmasney@redhat.com> writes:

> Hi Andrew,
>
> On 2026-08-20 15:02 +0200, Andrew Gaylard wrote:
>> The sp_clk_gates[] array previously included 9 infrastructure gate
>> clocks (CLK_SYSTEM, CLK_IOCTL, etc.) appended after the 64 DT-visible
>> gate clocks. The registration loop used the array index directly as the
>> hws[] index, so infrastructure clocks at positions 64-72 overwrote
>> hws[PLL_A] through hws[PLL_SYS].
[...]
>
> This patch does not apply against the tree.
>
> Brian

Hi Brian,

Thanks for looking at this path. I have a better fix now, but it needs
another series [0] to land first.

[0] https://lore.kernel.org/linux-arm-kernel/20260924164922.117236-1-ag@ffroot.co.za/

-- 
Andrew

