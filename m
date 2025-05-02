Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9356BC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 15:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YUgHFLorqc1kGTFNbEjnpM4RfzqutyDaLTremEVuq64=; b=txwqk4TLTmlvpmoGkWI1Aalh7P
	Ure6IvGcSwJq77aVGJ5J/V7vDPumIo0vb/meR83cwf0ovOeevTCug89W4ZUC+mU5ZTDpz1UdumOL1
	3QtGKidRDc4tdvz51WflGKVbyrUfInehJekhE4TkDyhW4GTLX5uIPthlCRV53Mqev3V6y1a9Xc9PU
	cNMMvL+YQt2QDKKrS2os9IW+QLxTeXplLcWywzO6CUJWZh7Di+f5EANHdNSUZxqgtskqlzoOW3jxd
	h24Rit3q7ThMvMbwHP6EB0wYYT/ZkwPfikTZqZrSt9gJxcz1tEMWlEgE6P3+DCsa39ZlSV/1H8YWr
	U5gk23DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAsOU-00000002LjL-0V7G;
	Fri, 02 May 2025 15:33:42 +0000
Received: from mail-qk1-f172.google.com ([209.85.222.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAs41-00000002IoR-2jL6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 15:12:34 +0000
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c597760323so239050985a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 08:12:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746198751; x=1746803551;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YUgHFLorqc1kGTFNbEjnpM4RfzqutyDaLTremEVuq64=;
        b=qpOXEH/I2TaIO9V7bKb0OHoUO7wmEF3kHVOafXVkD50FYuNn75oDfCpELpRZI8KBQV
         E5i2blZ/Yx1sg+Q0Z7zZq1sqDvImmteIvcD7ePFeSmeNrLDWp59WNdRn6FdEvgsphZ/G
         5BKUMZwBqYeJct+UHu9Q4pfIcUEBz19MGtAOIabOQ4I8ycZtj25yuwiq1O6IVqgD3xWh
         bs2J9r6UMu8TJlrqLSoL8mggXfh0TD1QhjWRt7NNU1+oRwFxMjgtP2Hm7tlbSF5e0p9Y
         gb1im0l8Sq1Nq+XQoh2ckHrUJH2EKrYZRfUi9DLpDOMcgbGc6Z3/+5v30b0G2DCILUJr
         53vQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgPIZXL6GG94Lydzf3gEA28m8Z4beii6y2McGwN2UPEZumSWknUsZtn38GV/Adz/sajxbfsobLNoaky862UXTy@lists.infradead.org
X-Gm-Message-State: AOJu0YxcCYnYLj8s+S+MsU76gtbQckxBlRDczt/5hgSfvxQx+0eIoOxb
	TCjiY4A6ru2O/5bsatSUyAFIBSC70KA/TPeH+HlfE6awFupJnUiCyRxnl76n
X-Gm-Gg: ASbGncuzAUlnfsWArTUNZgsBCxKWuLo6KcB70HOic/1AOPH3peVeorhJOPg9aVsU8WO
	9d/Pmg65IW4Ue2T1kyOaU6yMhK0TTWlRBY2cm3Ox2nffxg63aXKPn+36uMkGUO+sqM2QLnBmXOq
	SadMkBN8hHNCcJVZp+yv4GGKbSH2aUolqFy2qdOplUxm96L6fBzGfNLANHtxlz6P0JP3Ksjkbxv
	wasWlJAjkJBAErgqXOPEZQiBexVQEkDiHkBEiDgsob9JysnYezm0QoyG78CD526csQXswCdmft3
	7RAGCgbZty5NmXvDIeTpGWaANLaKrYRkR8lTYQUCWEnOvSIp3uzxu5NTwcUcOR7IQzQ0Kbfm6pW
	9UEmrnuWuZqdRnCM1Qw==
X-Google-Smtp-Source: AGHT+IHsx8Ii98P5FzZtaP0iCOirw315GrDN3GRVmtGvc4LMEZdT0FrvCqBKY5vB/5F78EakKmHw+A==
X-Received: by 2002:a05:620a:1a04:b0:7c5:5f19:c64f with SMTP id af79cd13be357-7cad5b29eabmr412881885a.4.1746198751320;
        Fri, 02 May 2025 08:12:31 -0700 (PDT)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com. [209.85.222.180])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad23b5b7bsm194968885a.19.2025.05.02.08.12.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 08:12:30 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c542ffec37so272635385a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 08:12:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXuaU/t5HJHmhi1wnMBbDh3brWggCqMjpSjrqMlX1IOJ3o36TCSr/kb5bFbrMySwZOXY/AqfP3qQ8GdGZC91yuB@lists.infradead.org
X-Received: by 2002:a05:620a:c54:b0:7c9:5ebc:f048 with SMTP id
 af79cd13be357-7cad5b3ff6dmr377329085a.20.1746198750656; Fri, 02 May 2025
 08:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250424054050.28310-1-biju.das.jz@bp.renesas.com> <20250424054050.28310-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250424054050.28310-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 May 2025 17:12:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWNTy9+MQVmwoaVn_S2CsL-YT6xfFF4Xf6ehUgpwHU54g@mail.gmail.com>
X-Gm-Features: ATxdqUH3ixU5-e0144v1C4GMTrU1irCUcPJxoW004SfypH51jbvHQMGuupsTRpo
Message-ID: <CAMuHMdWNTy9+MQVmwoaVn_S2CsL-YT6xfFF4Xf6ehUgpwHU54g@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: defconfig: Enable Renesas RZ/G2L GPT config
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Taniya Das <quic_tdas@quicinc.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-arm-kernel@lists.infradead.org, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_081233_691891_75F34588 
X-CRM114-Status: GOOD (  16.97  )
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

On Thu, 24 Apr 2025 at 07:41, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable PWM config for Renesas RZ/G2L GPT as it is populated on
> the RZ/G2L and RZ/V2L SMARC EVKs.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

