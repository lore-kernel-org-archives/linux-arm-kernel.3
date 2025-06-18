Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD73EC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 08:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7gcJo3/wfaTJZNHwp70Ko9JmEHSNZ37Pbopm46n4G2g=; b=B27ICkBUlhpbkEQRDZwHBhMjse
	vQD/wGjsRKcuipV9yjtVFVL6tNIiOWx5iCuP1EK6jsq5buuV5hm5594fmcDMqC2IRKdcSvn9+mCXp
	mGqyIGuNxpqizoGtz5T95L8jf6i/ibd+aFDITWHZ6dgdkHlW9tVQYLwdoGwDYsOdoTGKMPF9NJUkY
	Q/Wb+rPm5UgVysyPYqIbbBSMs8jOGt0uT45ug7FVVzusWzwIoSyBPm+n76+V1jD2s10ny65dKDm+7
	ZATb1Sr4mAEzbk45zFQLYwADJf+WUiV3zkJ8zY61x9nZINx/FLKKoCO1l/eLufDeq7N39Iz6CNVgI
	kklzY2qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRoCU-00000009Pny-2Q0J;
	Wed, 18 Jun 2025 08:31:18 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRoAG-00000009PgM-2Mou
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 08:29:01 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a575a988f9so2704723f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 01:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750235339; x=1750840139; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7gcJo3/wfaTJZNHwp70Ko9JmEHSNZ37Pbopm46n4G2g=;
        b=PO4mH4CjFjbl+/4dcWKQ97pxZBpmS92oClBJqxQOXUbDsD8+XPwrdDg3UAd7BW/kID
         moe/ezQii+ZqM3oPIre0vPBy82Lr3EgBFXunHksYtWUR14c7N1aNpkWSnPA+Jn+HGOgh
         p6ASizXCqe5uyisGYju6iq0lPXYbXKFD3Moh16M3hpdXPuVSN53bppBaEw6KnGPxyPts
         Me3RvkijiUfOrMZ6WNQ/dSnH0L3A2l6eguRnz6zWxyjcQt9ZTdMjlQjtu45W2HkQuUDb
         UIVSWnpCPCW+nCxe7IXrOaMoKQDP4kru3gaDcvaRZ5ojrnqbilBIuKRVCkelYpsXtVAW
         PziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750235339; x=1750840139;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7gcJo3/wfaTJZNHwp70Ko9JmEHSNZ37Pbopm46n4G2g=;
        b=Ace0X1W093vbptzXBSEgFbP4z19T6alUjfxct/3rxgCW1nLRENPnTu6VUHcisxFNde
         FxlzdcBiwd6djgEtQfP/1rgrfo/UmVlsnVuOF1hCceL5/+3YtdjI3+WPP53hT0HCU4F8
         0iSFBoTS6T8SICjSGvct1csJOoxGII+2o0HtYwx4HkvvOAZQHZhgAZQ/qEn2f31cAwzx
         OZs8M5jQM+QMcLLPBUgFwtLhh09LrBzW/u2zy6HLnKj21KomO4DzUWoOYoTAuMbzcLrZ
         YcK9gocJg51VB7OHlGTe58Jcp4RZPLxU55lu7DLxKHz7eoW1kO/M7KVFxho5ea/yAusI
         +dwA==
X-Forwarded-Encrypted: i=1; AJvYcCX3v9B0ALtuureR1KbumYdTeQoO71h1aUBApsJrbI+RIT6icDD3iJ0VMr2YYsUxbi8pNA79fEQ9GV2nh5aovSZG@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3MfwzJDsrbkclyvWaidxo/S0Dv5mG6lfSKsz//t5DTFAhiK91
	l3kiUJy2XoVvsXyO+ScR7em/jfk4SrMnzGxpHq85/dkArl9e/ZkF1p1Gu3rb/raA8GY=
X-Gm-Gg: ASbGncsQN7Ha6BNQGBlSassY2CKvPaGLevPmjb2l4+fTY61XYbL2yQRsFAKn0XM5/Jg
	pVHbxH8nDpz3Fr3TgY4ETJfty826ZujAQoD+qW+EsHscvFZH2BsoCpSqyWuqFRCChNZItGBw4xQ
	yKmszDDIZ//lUfBta6PE5iYd3aXAAKfTvVaHphxyXI6mpnudDXicm7J/G6tO8zKLwUcTCWrP92y
	FYs5g7ysl5UoHZRIYNYcLjw7fbuXTWhTZ1uGtFrvQYUd/2MFeljjbmY4lU5ZKMjv5MJ+UeFD6dF
	D+K4OGweZIBkD2nYdFW3R/DoKm+BFBOXTIozJUcshdJRtwBCrXHEaygxJBfgWBIE3wPikp9rTw+
	1Rg==
X-Google-Smtp-Source: AGHT+IGpz2E6KVPtFNpmns5QY+sc36eVwHYTe8Cv7AENssFnzG+4sIXaEKXOzytVt6DU/O/AkTkN3A==
X-Received: by 2002:a05:6000:2313:b0:3a5:51a3:3a2 with SMTP id ffacd0b85a97d-3a572e9390bmr13067498f8f.45.1750235338630;
        Wed, 18 Jun 2025 01:28:58 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54d74sm16476380f8f.10.2025.06.18.01.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 01:28:58 -0700 (PDT)
Message-ID: <0060a6d7-ceee-4ecd-b4b7-1c9fc422efc7@linaro.org>
Date: Wed, 18 Jun 2025 09:28:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf vendor events arm64: Update FUJITSU-MONAKA pmu event
To: "Kotaro, Tokai" <fj0635gf@aa.jp.fujitsu.com>
References: <20250618063618.1244363-1-fj0635gf@aa.jp.fujitsu.com>
Content-Language: en-US
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250618063618.1244363-1-fj0635gf@aa.jp.fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_012900_610511_8BC3E748 
X-CRM114-Status: GOOD (  14.58  )
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



On 18/06/2025 7:35 am, Kotaro, Tokai wrote:
> Update pmu events for FUJITSU-MONAKA.
> And, also updated common-and-microarch.json.
> 
> FUJITSU-MONAKA PMU Events Specification v1.1 and Errata v1.0 URL:
> https://github.com/fujitsu/FUJITSU-MONAKA
> 
> Arm Architecture Reference Version L.b URL:
> https://developer.arm.com/documentation/ddi0487/lb/?lang=en
> 
> Signed-off-by: Kotaro, Tokai <fj0635gf@aa.jp.fujitsu.com>
> ---
>   .../arch/arm64/common-and-microarch.json      | 70 +++++++++++++
>   .../arm64/fujitsu/monaka/core-imp-def.json    |  2 +-
>   .../fujitsu/monaka/cycle_accounting.json      |  4 +-
>   .../arch/arm64/fujitsu/monaka/exception.json  |  2 +-
>   .../arm64/fujitsu/monaka/fp_operation.json    | 98 +++++++++++++++----
>   .../arch/arm64/fujitsu/monaka/l1d_cache.json  | 10 +-
>   .../arch/arm64/fujitsu/monaka/l1i_cache.json  |  8 +-
>   .../arch/arm64/fujitsu/monaka/l2_cache.json   | 28 +++---
>   .../arch/arm64/fujitsu/monaka/l3_cache.json   | 63 ++++++------
>   .../arch/arm64/fujitsu/monaka/ll_cache.json   |  2 +-
>   .../arch/arm64/fujitsu/monaka/pipeline.json   |  6 +-
>   .../arm64/fujitsu/monaka/spec_operation.json  | 12 +--
>   .../arch/arm64/fujitsu/monaka/stall.json      |  4 +-
>   .../arch/arm64/fujitsu/monaka/sve.json        | 44 ++++-----
>   .../arch/arm64/fujitsu/monaka/tlb.json        | 56 +++++------
>   15 files changed, 265 insertions(+), 144 deletions(-)
> 
[...]
> diff --git a/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/fp_operation.json b/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/fp_operation.json
> index a3c368959199..2ffdc16530dd 100644
> --- a/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/fp_operation.json
> +++ b/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/fp_operation.json
> @@ -2,7 +2,7 @@
>       {
>           "EventCode": "0x0105",
>           "EventName": "FP_MV_SPEC",
> -        "BriefDescription": "This event counts architecturally executed floating-point move operations."
> +        "BriefDescription": "This event counts architecturally executed floating-point move operation."

The original was more grammatically correct, but the updates are just 
from the pdf so:

Reviewed-by: James Clark <james.clark@linaro.org>



