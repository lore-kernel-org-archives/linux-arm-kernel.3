Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D37CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 22:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h0Dmle5MeuP1yPXjVcDAVWMlS5lDrlFusVKexEqhKFY=; b=pjtAW29UVPvSn3tp0fI5sig4gA
	m0vnWZplz2VAZI5oOaOWKcpTyBMHGv7m+eq3ToAelNnfgOpsf3EQgKhSga+Gg+xeMnKR2mBuK+R9r
	hdZjCK+SCyG38XPA/zUIrZOl5TggwKJTKukT6mNJTJT7BJWB6MBcHYFKi4JYitm9hy+OWXAaJ8LNb
	CMJmG+qsstw38SfkzQkK6z38fPnZ33s0VRNRLWyzSR3f0Rkt8KQIKaqZmjxNNwhkZVNA8kuFDWt08
	eTfnKtu2J1qQBOeDZwFLeSI3QzEHBuUDpGFhQ8FsjyoPCmMeJVFGBcmlvfu4xvSeF13B4JSWSWM3I
	KnmRtr1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXQzK-00000008PAa-0vP1;
	Wed, 10 Jun 2026 22:01:30 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXQzI-00000008PAD-2DC4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 22:01:29 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2c27fc587ebso17908225ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 15:01:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781128887; cv=none;
        d=google.com; s=arc-20240605;
        b=GmEaqmeQ1TVIkELq0CrrwKSYxPo+Bh9ozO4d3OcsmZMFaiINVoA6lYqv0/MXpT+rdI
         WhRZT8r5wnYrjHYwdZKuAc99MZNHNpnygUxqOuKzdBZ/1Fq7wLpnst/QEdJVnfPGt5Zf
         qRp6OVeLOkwnuJViX5hopwNP+cycXlDEd0JS3rKN7eQIMPacl0nLCHwdlfoUf4Atr6CY
         ekkVNFQrmpAcFWYUG1Dg0uWPp7LECXMPcOUJjpT8f80DaoJvDsl1T1WHC9KtkfbsOmvw
         +ABVE8X3CMfbJqNPZ1SmXpDtnR30VNhqUVlNpo0/V1BDR83YdzmLGF91QPAiGRh5bu7E
         NNAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=h0Dmle5MeuP1yPXjVcDAVWMlS5lDrlFusVKexEqhKFY=;
        fh=QzOlI8oj7rwiWKVAbSHyz8dN8aTCowMfXFQ/XP0LmU0=;
        b=Nz6AE/XOeg0dFCQvqsLetjPAKJfphj2rCVZ0xETetFNojWhcJzK9PIN1EElnuVdDhZ
         Mx+Eje+Q+1liUri/9bke7t0ZHEVJyCSw9Uz/SMLPXcm9ShRZjv99fk4Jls0x+H4leBwb
         Q8TZIQ3NmB5oEXOXOe93+fewPWNmZQOU3s1kKe0cQDoMTxUK/PwaXUudoQaZN2hPsq0K
         vOzR9mjIHYMBiWFSIUEqhxFH4RY6uNe0pPrRiD/se3SS2CqtIG78BBGLvcFqN6y8QdGE
         cpYQICvwyymYDdHoy/RVJlT4XvQh8B/810UNUnAQR15joRJRo3S10BQ/GSeOsZRpMQZH
         E9dg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781128887; x=1781733687; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h0Dmle5MeuP1yPXjVcDAVWMlS5lDrlFusVKexEqhKFY=;
        b=B8VGpRioaYJZJF2qzdnOdEZuHjwB+N62XaFRRx1/j+VJ3LlsOvHl9jNHbTKhuasxKm
         AoyTMxzJNpY97f1myVeWNy6T4P9l0qgi5nsz6+HCAxFVqrG3jMNaEzyVtWSm5kVgpVfg
         YQBBRyHUmWgXpIiQtfWwrgxH4PTwq46gfSbvgDQp4vAvKbRo4BD4jXqPsC7g8JWYdBQV
         nepdACHr7xw6nSPZuKwicVbt1EfGGKbVBXLZpkGrl+4rm+ZSaUChV5bfEoaQ3O3f9vwR
         9hA8IcyUYgy2KKdZuSmSrtrh9Nu+iQYYrlvz7VyfwoPIq+fRfc6pX7zjyIXvwvUB/QqV
         Vo3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781128887; x=1781733687;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h0Dmle5MeuP1yPXjVcDAVWMlS5lDrlFusVKexEqhKFY=;
        b=rVVpzb/ODbSbZwt2VZM83/GOvrD909cQFes0faAOPup1swBkHM0ZsJLchZnBt7HtWX
         phCaOpccaoYMPKbFKoUM5Tu6KfSs71tQoUVYngzCHybAL8T6evKepi9LlrpPAm8GtqT5
         eqGwchbbiMV7YVgTD2o90xj2WPOv4P+qsvpMt6Z+BmUR08NK7yNig+RKw+DrN1YMwHIN
         1BMgSdv4KLJEcnKK2AEMrTeHmNHPSNTFY40lCS/l1zfukLFl0uhoqmbgLDeZnds/olUs
         +rN5UayLY9rRA+fKN8Jdsq+u+o4vW/7eNTyMQMOtULkVokWEjN+eERXlceRNcao+/ufu
         3YqA==
X-Forwarded-Encrypted: i=1; AFNElJ8oRPn3bd09zplo0ir1sloInPA8et9iSqVVWDL+1OujIc/1rlNDOFGpb2SHHJ3xN3YdcUjo0uZpgP0IMeRp3xQR@lists.infradead.org
X-Gm-Message-State: AOJu0YyQATB3Qi2HSpII8KnJOEeKJSkQf87R9TBUGvndTPmlXCtoD7k5
	Kh/M/3mR43nZErxqsi+eWwquxdpBbwQVaYYNo1IKT0J83cXIhm8vJO9EJ+tWDl8RWenUqG24mf6
	al/vSU/156tGPHJsos5JsWJowG9SyqCQ=
X-Gm-Gg: Acq92OFKBDu/yHKoKwuVqDzrQnVEktjj66jE5dIFze1exjl35vewljP6kQv5v4vHbyU
	Sd+jsgnGlIZSvjQ71fF4w2f+JO09QXrTfrKzBzWjshjMk1Nql5JoZqeSwSJO+T9V+N7S9oh6EiO
	uaBVONXN62ciVmq01qizmFA2U20WDT9oiMw1EYZ1Gf2NNB7WMKwBBIQQY4v8ecCdlN45PVc/xvf
	Ze5QsvqPqFcoLGAOMCa5sF3Jl60wWinTU4wurAqriru4UCytoCfPyggCB5/SYBAp6/I16mQWnye
	yveY2JkSlXaYExg=
X-Received: by 2002:a17:903:138a:b0:2c0:a9b3:bdc6 with SMTP id
 d9443c01a7336-2c1e80f9214mr284349325ad.30.1781128887315; Wed, 10 Jun 2026
 15:01:27 -0700 (PDT)
MIME-Version: 1.0
From: Enzo <enzo.adriano.code@gmail.com>
Date: Wed, 10 Jun 2026 18:01:15 -0400
X-Gm-Features: AVVi8CfxAHDyBqNO0Ys_rdLGOZmuKmThiL3y1SJyB19d0A7iTcl0mFxuFzIXLu0
Message-ID: <CAHWUu5EzER1mEmMpOeMgQN_ynW0my-TM2UGt808mjEe4dY-vkg@mail.gmail.com>
Subject: sunxi-mmc: A733 IDMAC stuck in descriptor rea
To: Ulf Hansson <ulfh@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_150128_598158_201B47F3 
X-CRM114-Status: UNSURE (   8.64  )
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

Hi,

On A733/SUN60IW2, SDMMC0 works with PIO reads but normal IDMAC does not
fetch the first descriptor.

This is on a Radxa Cubie A7S, testing Linux v7.1-rc6-gabc8d07b0a63.

The failing transfer is a single 8-block CMD18.  After starting IDMAC:

    IDST = 0x00004000
    CHDA = DLBA
    CBDA = 0
    CBCR = 0x400
    BBCR = 0
    descriptor OWN is still set

The descriptor memory is unchanged after syncing for CPU, so this looks
like the controller never reads descriptor word 0.

I have already checked the obvious descriptor/DMA cases: 4K descriptor
size, shifted descriptor/data addresses, descriptor memory below 4G,
coherent vs streaming descriptors, and the normal-IDMAC 64-bit DMA mask
used by the vendor tree.

Is there an A733-specific clock/reset, MBUS/NSI, firewall, or firmware
handoff bit needed before SDMMC0 IDMAC can access memory?

I can send the full boot log and instrumented dmesg if useful.

Thanks for your time,

Enzo Adriano
enzo.adriano.code@gmail.com

