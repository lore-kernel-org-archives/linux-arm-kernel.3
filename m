Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DA2C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 11:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1SJQCGEYPEhCrI3qgX6t+obEkrQ6EqASbeC+/fQb1k=; b=13nqdeK3bFlHZEWF+cH9blOIFV
	/hzSTz9NoSgHzMBurFKyLJPVECCLJE9tpvZWRSJFf1GC/ckNsaWt4u4rV81mwFCKCpnUelWqkrbJj
	NTv+0GS6BB9q+pySN0bRs2fuBEuWWcetZQ1NElpx5FzaudlirPeYSYeYkW8tm+dOAeQLrsWvFIUEb
	9uNK+OxShZiXSJNpZSdBwxTHrLrQoPisxAxODWZe3Pj+p6Kzq37yzFfCkHho2h4odR463A8/kvVwZ
	m0UcVc+GAKZ5mHlWrXP40d4JwCnyrPVByjtvhFH9aPy4XuwifLioDQRPrjYdPS5JOGJgc/kYLzGDs
	5JJC8j7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u50x0-00000009LXY-3xy8;
	Wed, 16 Apr 2025 11:29:06 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u50tZ-00000009L1B-1M8W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 11:25:34 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso64356525e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 04:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744802732; x=1745407532; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M1SJQCGEYPEhCrI3qgX6t+obEkrQ6EqASbeC+/fQb1k=;
        b=ds/vOg//dLEXXMKN2+3shhkCQUb8fCdRhRfHUfTsF4z9RKT8B4bY1AzRqH+cpHfkJl
         IFQJga2OjB8qvzYYu1eUm6y9weWZ3/0LgJ6eJ8vWheGKAiE/yofxy500P1JdoSh6SsN9
         s5ZIZqMYayKZ4S6GusX/W0ddr8+k7h3B7yuOUQ7DhR4yK9ZPc3C8K+E1VM025jHkH24G
         dSBXK9XIAgBpsdsCnkvygtq54BX95slWHqSFZ79KMZ4pH7xmpQXJ6fSBcJg2sOJpCY88
         pp6ew/kmE1PK0655fOSDeZwTuRR1MZjv3t6pN3QXaWF39qn3uEIQL6xKM3yA9tefQO1d
         hvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744802732; x=1745407532;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M1SJQCGEYPEhCrI3qgX6t+obEkrQ6EqASbeC+/fQb1k=;
        b=m7qbyVSczfSuWuimYsoqvaz7vSWCqrHIf1Uz/X/pTfJpeXEFAKTRmAp5PxpiuJxUgr
         DDsmD+1WD8iOkpWWcMmv7tw/44mZOIJFQq/BrZj/kLOfn8MEIUZVBgHuUOJTzT7JPtOU
         3VCzNOcQ5DzL0NaoCJIb1rtH+EmSDByCyR+lRnhrlWslcXl8+3nFAewn7OnBfQtt8KmM
         C/ddCmLCdYydu144j4AkmG3ROPI64V68qzgXsVd6UdjWVc/mI9gmdY5r6uP5Jl2+4v1d
         wKtIBbGUCCWkZVq2KBQhaWL30glEIdhLGdE2+vU+5LGeRwo7iT8Tlap7m+dyfxv+2urs
         KODA==
X-Forwarded-Encrypted: i=1; AJvYcCXS0Qt2VGK0jotifHdcHpuZSgfIj63qX9jWhImaxMs4CiKM3968EmPdbopDNyuMO3PBxMSiwU0CUK+TgnIL1Knh@lists.infradead.org
X-Gm-Message-State: AOJu0YwHzJnWaMk1pZAwaBJxn4WF0AykIEDnTVUQ68oKlI5CuWAf6TD/
	Lq/JRr97jikk1M6VJ/6a75NWKO9gQXWQ3wI2412szLuJyEAyef/tvvU6dpEl6SM=
X-Gm-Gg: ASbGnctHbxg8K6bCJvkMdLkfDEG4tD/t/QqOfX1QHh5aZSP4Yy0+ljxt9EKDl/MufmF
	jK/YuLpLXEs4nxJyksRcGZyGAYbMss30hwMR1NZOWla+b5yU3lIx35h+p+G4642PerWEhkQ+y+G
	qS5LQfE4EiSJ2Y61y3+8OcMbijUSDsCsnmSx3ABylpzywOVAhmHFYNF1Q6+0MP/f6mcSzBiH/ZD
	m+1TdG4FlH3BJYTVClJktPmWcBdEBMyl3UfwXGh3HKdgPe/GIB9/6n7lS4TgBeytkmusOLDKSf/
	51qcB6iq8DPq5uy5CkKiVEcG0tDvvMi/RBJnoMxb
X-Google-Smtp-Source: AGHT+IE2uGk7viULXRHwcMC6GtLWc6X+31aPOyWo4guoKeQ4IlVtxGCdVZQNStIgzEReOhLBuSGQSQ==
X-Received: by 2002:a05:600c:3d0c:b0:43d:b85:1831 with SMTP id 5b1f17b1804b1-4405d5bd218mr15007975e9.0.1744802731815;
        Wed, 16 Apr 2025 04:25:31 -0700 (PDT)
Received: from localhost ([2.216.7.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b5adb6fsm18524045e9.40.2025.04.16.04.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 04:25:31 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Apr 2025 12:25:30 +0100
Message-Id: <D980Y4WDV662.L4S7QAU72GN2@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Fugang Duan" <fugang.duan@cixtech.com>, "alexander.deucher@amd.com"
 <alexander.deucher@amd.com>, "frank.min@amd.com" <frank.min@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "david.belanger@amd.com" <david.belanger@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "Peter Chen"
 <peter.chen@cixtech.com>, "cix-kernel-upstream"
 <cix-kernel-upstream@cixtech.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: =?utf-8?q?Re:_=E5=9B=9E=E5=A4=8D:_[REGRESSION]_amdgpu:_async_system_error?= =?utf-8?q?_exception_from_hdp=5Fv5=5F0=5Fflush=5Fhdp()?=
X-Mailer: aerc 0.20.0
References: <D97FB92117J2.PXTNFKCIRWAS@linaro.org>
 <SI2PR06MB5041FB15F8DBB44916FB6430F1BD2@SI2PR06MB5041.apcprd06.prod.outlook.com>
In-Reply-To: <SI2PR06MB5041FB15F8DBB44916FB6430F1BD2@SI2PR06MB5041.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_042533_363732_A90C23BB 
X-CRM114-Status: UNSURE (   8.41  )
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

On Wed Apr 16, 2025 at 4:12 AM BST, Fugang Duan wrote:
> =E5=8F=91=E4=BB=B6=E4=BA=BA: Alexey Klimov <alexey.klimov@linaro.org> =E5=
=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2025=E5=B9=B44=E6=9C=8816=E6=97=A5 2:28
>>#regzbot introduced: v6.12..v6.13

[..]

>>The only change related to hdp_v5_0_flush_hdp() was
>>cf424020e040 drm/amdgpu/hdp5.0: do a posting read when flushing HDP
>>
>>Reverting that commit ^^ did help and resolved that problem. Before sendi=
ng
>>revert as-is I was interested to know if there supposed to be a proper fi=
x for
>>this or maybe someone is interested to debug this or have any suggestions=
.
>>
> Can you revert the change and try again https://gitlab.com/linux-kernel/l=
inux/-/commit/cf424020e040be35df05b682b546b255e74a420f

Please read my email in the first place.
Let me quote just in case:

>The only change related to hdp_v5_0_flush_hdp() was
>cf424020e040 drm/amdgpu/hdp5.0: do a posting read when flushing HDP

>Reverting that commit ^^ did help and resolved that problem.

Thanks,
Alexey


