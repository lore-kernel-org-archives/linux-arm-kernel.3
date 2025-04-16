Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEECC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 11:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V0bcAVcIBXJUMVNToi/c3WDygqPJpKfs0dNrgJ/Ax5Y=; b=jQVC8hHwYrxT1bGYZm6uHBDNqz
	Dqg8n14wNDVYFp+HOVHwVq3KMCa9sZQm5MMzmFQVnM5PIw4gjzcQ5YLHGpKy0z9CFzV1nvHfTY8xF
	7ecYKQdc12kYURZZyLewJ1m5QfbtnlPkLMFo8zaDLlpXb/H1NfFSNZqVUoRAnrYeF3jw3DgCQpqOQ
	TjzCdUxqHriTnanLITZGBaqgUV4czAssYzfnFsQt7yNpBr4VP7ZGSJ6ZyvRcW/qu7Xa985Lqar/WD
	0gC3xg1UVgAA3gsfGxY8nUIkz5FJNFa09DhEHL93Ev6btXkRmmQmYwDfORSpDgzJOyBPCVwb0WZDN
	kHjC11tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u50lN-00000009JuP-3LaU;
	Wed, 16 Apr 2025 11:17:05 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u50iT-00000009JYr-1NZY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 11:14:06 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-30bee278c2aso6822041fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 04:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744802043; x=1745406843; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0bcAVcIBXJUMVNToi/c3WDygqPJpKfs0dNrgJ/Ax5Y=;
        b=dWzcrvmmk77JLxScXUXyrjFTSE9LnvrXMoMm2veotCKioHG7h3hcRUO0o7GWSUNJzM
         h63f/PCcJ6/y/MsVk8G3+f0VvwzKnFRzju/w8hGsa+qUeW+J0tosvowN5VQZ06p6A4lk
         8bPoMRy3Af6bUh3cOIZl8Ur+PvncomlEAqvng9gaZKSipQROzKkaYJA/JMW5RGwRZz4Z
         RlZv49p0pE2qjeuPhIQq1vSQizBCYauLfffMM5r0Om2FK4glZxtdXO2katAznZVgGB7P
         PiSRfi/CajsqdcatybTtCkI6O0kL8cKI1RprT/j7Ccezr4eUEuSk4BHTrE4k9+SCiQWM
         ddQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744802043; x=1745406843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V0bcAVcIBXJUMVNToi/c3WDygqPJpKfs0dNrgJ/Ax5Y=;
        b=oUV6gwHled13tHQLdZB0rmtzovzIqQTXr1EFTorZpmy/2MPVnm+jwrT/MteE0QpjbB
         eSmSOIEkAD/432i967jFP92FdkdtVHuyGHRIgfvPZCTXYqy9JYrRSaegi1QRpiBDrj8R
         WfiM+BKBbuhTguatT/KPTQ/q3uWzTBI48dHtHPvi82qeDftLExqKOLtNHMeLAb494Vrv
         8R2e3v0RtvBpgNOtmS3y+1qFdZ3HZZs1/EbvmzbxPQMSArAmfmvgCDSwjn8MwClNtcjI
         idxpC3WwmlZskGbCgJGs4asxJGHaQGTTDS7Yi9pCLS9oKujviO5idEIlIPBAZ8iHj7ru
         uxTQ==
X-Gm-Message-State: AOJu0YzzwV73Xssbv9H1+D+oIRibzaS1vPpJ0D3mUcHOSQsE8GtBchY0
	/9/Dsk10fUY036KcvqCfNjxmaQt4Lxsqe8KMe1oTcZM6aQlY+RYJQ5sKkDLdscn0szwKoJxx0I9
	2Qz/hJOf/vqlZnJWZ4fwxf8IvFzAfX98C4O/WCg==
X-Gm-Gg: ASbGncuAqEqd00TEmMBd5WN+3XjG1TRJZ5NBDZJ+Wh5TUfRCJfH3uuT4HNEOa5trs8i
	Uvp9L75oL2sNbZbF4i6QHtMsHhHXjU587ChzEPuijTUrlsCjra2oyvOMY+pdR/Homv6w7cW78Kn
	MUMB7vSYanOGWMUjkK323Tfg==
X-Google-Smtp-Source: AGHT+IGoVa8oKz/9H6qwN720SjI6iTNhQ//CNlCY1oUOFqYVxtOvYaL8+BRnRaElkmRz7KRCi++4w5Het53XuVm3gb8=
X-Received: by 2002:a05:651c:892:b0:30b:fc3a:5c49 with SMTP id
 38308e7fff4ca-3107f6cedf2mr5715001fa.9.1744802043437; Wed, 16 Apr 2025
 04:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250414133219.107455-1-ross.stutterheim@garmin.com> <20250414142140.131756-1-ross.stutterheim@garmin.com>
In-Reply-To: <20250414142140.131756-1-ross.stutterheim@garmin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 13:13:52 +0200
X-Gm-Features: ATxdqUEiBb754m4GSLXFUAZJuTsxVh_7GqMvgbsAw6DFPoC5SezWgynWEt0JdL4
Message-ID: <CACRpkdbYZAt=gs=Fqq_VvOzpmUHiwoaQuGy9e8nfydqjdM4NyQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm/memremap: fix arch_memremap_can_ram_remap()
To: Ross Stutterheim <ross.stutterheim@garmin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>, ross.sweng@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_041405_371918_AC599E71 
X-CRM114-Status: GOOD (  13.95  )
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

On Mon, Apr 14, 2025 at 4:32=E2=80=AFPM Ross Stutterheim
<ross.stutterheim@garmin.com> wrote:

> commit 260364d112bc ("arm[64]/memremap: don't abuse pfn_valid() to ensure
> presence of linear map") added the definition of
> arch_memremap_can_ram_remap() for arm[64] specific filtering of what page=
s
> can be used from the linear mapping. memblock_is_map_memory() was called
> with the pfn of the address given to arch_memremap_can_ram_remap();
> however, memblock_is_map_memory() expects to be given an address for arm,
> not a pfn.
>
> This results in calls to memremap() returning a newly mapped area when
> it should return an address in the existing linear mapping.
>
> Fix this by removing the address to pfn translation and pass the
> address directly.
>
> Fixes: 260364d112bc ("arm[64]/memremap: don't abuse pfn_valid() to ensure=
 presence of linear map")
> Signed-off-by: Ross Stutterheim <ross.stutterheim@garmin.com>

OMG
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Also add Cc: stable@vger.kernel.org as pointed out by Catalin.

Yours,
Linus Walleij

