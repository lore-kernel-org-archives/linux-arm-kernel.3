Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119E6C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 17:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CH4napBsCBC0WBNNu69lyH6W2wkeBWtP8Vh2WDJOLuQ=; b=z/A6EJ1BgkmNdJyFI9D2xQbun9
	f08o21d+S9f3pjsSqg5gDLNdD16yWYEf4NRhMPPD1t1X2sOr/u7wn9X8m+s7gPC296Z8LeOdZtCfF
	oYgM2ip0H0bPU+5xffXfGnEQEv6XHSf6TCPBz7yWBeePvHKCLURyXnubo4TDlgCaT5Ob+8KFFmUq9
	R7eZQJKBF2lbraU8kKmxsTEThr6A/hEvZGD++6h7e1UPf97CI1B1/QFDwHlNy042HYh137+COobhC
	RaT19xNehWqUWOI0HHFB7laGtipX0ICho/HDxDoacuVrSR1gcOTvbIC6O6aOjMCBTmnKJxffCPZq6
	X0r+Nodg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uABAl-0000000DY26-0wbL;
	Wed, 30 Apr 2025 17:24:39 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAB8p-0000000DXuh-2krD;
	Wed, 30 Apr 2025 17:22:40 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6ecf0e07954so1943686d6.1;
        Wed, 30 Apr 2025 10:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746033758; x=1746638558; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CH4napBsCBC0WBNNu69lyH6W2wkeBWtP8Vh2WDJOLuQ=;
        b=N5qgEBwbbHGb+IFm7YuPXuXWKw3Qc95i+LZtjzEhslFqWz4zZHBAuf4Tes6LdIWxYm
         KoB/PGmEftckwJ3ul1LeigvMw0xkoNejBm6duW2lLID720B+XF8s450Qx7IwakEDMM3w
         N7Lv3/IN0QN+9z3VJQsPfDnKjiLOc1iHcHNW+8YAVHLXrqZMGgP5hfWVVUVnbyBcsMRl
         zXaNbzgKlZ9fZKC4q5y2gwS9nGRgmLulWKAkEkq/tjPiCeeBE7qmnSUlAVLFgm4VZGg0
         AgpEd6lh361gfzUiu8dMsJHSB4kLrQWPwCkN+2WK3Ab+e+Al4dlPL2HSUF45hMlwR6xk
         63Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746033758; x=1746638558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CH4napBsCBC0WBNNu69lyH6W2wkeBWtP8Vh2WDJOLuQ=;
        b=T0rJf/qrHBZ5cNU/y/Yo+Mz24wB6U3nj+M/S8IoG47/+TXbXyvyO7OMmIgftegFzg0
         NnCY6GdIUPAb9bl1fFRwrgZ+fBYmBPta7Xh+Jxiv6lr1cedu53zjRUcO698WMiKj0jEE
         +FEwXNfbPLUCiNelMulkoexb1YiG3II23Ik9e+4DtRK3D6eav8mPTdRbGYlxfgfgLCfy
         QwyqB+abqY8f/mh4exrV5zQLkun+8DOa3djgsIWw35Mnhl1ZQas0sPFlzVl5Z6u288Av
         CL0HfwsTk/UcP3fBj0R08EBc5J4EliSrkCCJfAFzJdgkgfAguX7R1tnrynViDYS9O0iO
         yukw==
X-Forwarded-Encrypted: i=1; AJvYcCU3W2AeSKdredlg03Kr1/3sbwcV6OiqovvDxOvFSW1MddYlP76UGXDe2sAj6f4d0XiArYs8jzNyTBzV9QH+MBt5@lists.infradead.org, AJvYcCUi/9KNnHdPo5l7MAmyhG995kyHQL9i3LG71So92rH5O3ol4eI84eRPp8IyZkar+qE1bKwpgh82VKsZ66LJxLA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzmEaUEv3czVCf+Ub3T9qM8ozTwWHjLz07tgbELyNgpNpBEySnT
	z3TbuKYCbzIfLdtsWK3hnIP/whMwAoxJTr7m4WL4Gt3fxHxoJMOgv1kOMmYuaG+XyC799Ju32s0
	nza+TmYT0494ZBLXTvNw/BVRezxA=
X-Gm-Gg: ASbGnctenh9HunLd7+OWeqCseYMarzF7jcwRoeHAUbrEmwjzXuf8Cu/Z9w1JF+wH+fJ
	V1Hg3q4viMNSHRJjaz0yR13S4QFs1Dd+sD4XZDE4RIaoHUEic+OQupooVrOvC/x1lBeGBRihCkz
	oPphKRlK8RxuL4MIkW9bJNCfI=
X-Google-Smtp-Source: AGHT+IF0hkSUkBscoztwrJiCPtGe/eqecg5IeOVFYTEiAr9H2ndJDheoCXzUScHPG2WNdnXZOmnD+9FyO9Oh9/9V6Q4=
X-Received: by 2002:a05:6214:d8d:b0:6e8:ddf6:d11e with SMTP id
 6a1803df08f44-6f509135fd5mr1962686d6.21.1746033758098; Wed, 30 Apr 2025
 10:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250430082651.3152444-1-qun-wei.lin@mediatek.com>
In-Reply-To: <20250430082651.3152444-1-qun-wei.lin@mediatek.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 30 Apr 2025 10:22:27 -0700
X-Gm-Features: ATxdqUEz8NUpZ41yOc0wEWBdYrRigHz3dBQhIEdEZTRmRa2kkuklIIa5A4uoDWA
Message-ID: <CAKEwX=P192ijuK+O6r5ocwZsbtiV=-gVc1tz-=dtQ1NCw65gUA@mail.gmail.com>
Subject: Re: [PATCH] mm: Add Kcompressd for accelerated memory compression
To: Qun-Wei Lin <qun-wei.lin@mediatek.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Casper Li <casper.li@mediatek.com>, 
	Chinwen Chang <chinwen.chang@mediatek.com>, Andrew Yang <andrew.yang@mediatek.com>, 
	James Hsu <james.hsu@mediatek.com>, Barry Song <21cnbao@gmail.com>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Kairui Song <ryncsn@gmail.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Chengming Zhou <chengming.zhou@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_102239_695346_90CD09F2 
X-CRM114-Status: UNSURE (   7.46  )
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

On Wed, Apr 30, 2025 at 1:27=E2=80=AFAM Qun-Wei Lin <qun-wei.lin@mediatek.c=
om> wrote:
>

cc-ing a couple more folks who are interested/working on this area
(Kairui, Shakeel, Johannes, Yosry, Chengming, etc.).

