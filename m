Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220A7CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 09:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OclG1+kzl/iGxxR7lC3nMmz/XW+nbQzJ3yd10e73GM8=; b=0dPrTkmYH/nhuquNMEecVWup9i
	IrwcJOa4Osf/6eB9UaGOliGVXOZPHWOhNE5G34qZp6motW8Hm0OCQNRcDAOtrNCftrS7C9J3rFSsP
	Ac+EAQJK/CqUTN28Na6j2oD5tHNjiLwyN/Wrjf8lU89RmDklNJJg2+Rcd+7cwtHW9jrYYYNFGugHP
	qshbBE+5qTQ0NRK+zh2Je5cupopLdFzpZl6uAgGTYs6CiXRolFFbojxUvuxNb35Y4E+zo19Sn0Tvm
	yS9kNErZVSXZ1zbYBojtxvJrDJgmF2kBHiJaV7Gu7dDMiDtbi1VaVAMNC8tNJeepmLAABEpza042V
	q3O2DG8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mZp-00000005b1c-0DTs;
	Thu, 09 Oct 2025 09:04:45 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mZn-00000005b1H-0hxp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 09:04:44 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-46e61ebddd6so7390965e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 02:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760000680; x=1760605480; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OclG1+kzl/iGxxR7lC3nMmz/XW+nbQzJ3yd10e73GM8=;
        b=cXKTphsvqn5DHEtqkcoxcDnp3JeMYScEwx0t8Whd7NkANIAyviteYrUtXIGYGicOtx
         ZG6kx0jeI5lECi0hvc/732Cd/pISdICzc+b/agt/S/BRfM1ILDWrTydK9LEQoncTzpUr
         r6R0NeQKg64OxXlewiVDSnq8qT2CZOUYF4/i2iNLg/zrME8enOxKVbEj/7fPevVASYmJ
         /UWsAbJHemSuGadmzTHRZ2+V5vPmyVpfNUMjvP+pM1XNTIwPBm46kp5ck5MvYBu67yvy
         sJBV8XwtS5DB1F6tXwrIcTOQe/tcbJl3SbOrSXFP4ILLQIpxx0XS9ub4YVzy1gR8dEXU
         g5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760000680; x=1760605480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OclG1+kzl/iGxxR7lC3nMmz/XW+nbQzJ3yd10e73GM8=;
        b=K5HeOqa0i4mJeB6PTgOYut6tDI8GhkqGjT+6/HamSjV6d/THeymlEwDIUSHjzaPTZf
         k9AeMNpYjEWo7tBhB9Fo7kSzRG5iTWSAIeXJmdYi0rbOAZjcn5FZG+F0/Ybhg2RtGu9l
         bY/i5E1xMj0ZvY0Tu5bGwlDvHaIWep194xp7Cz9RfWICaXe5eVsliMs7kqGlJ3D9nUYw
         IDWwhLxhjraFOY1X0vbHlSUeTjRcOE4V8cVpu+Ug19kUWvIRAMxnTw7AtjhclrLjUdkS
         uw07GR4eFwYQjdL58o1DrW02xsGRjXkd5dgVv6+az15mDsvPWhwpNlSIzkVJcK29kaiU
         KC5g==
X-Forwarded-Encrypted: i=1; AJvYcCUyYuaidv0HNpyCxm0xnrn8VITIc4YsMsu4J5STs52sjI4QzVDDHLSdMQuId7mOozCHYNMNqrPmoWxSiOOjNSGj@lists.infradead.org
X-Gm-Message-State: AOJu0YyBHtsnrPyJAiSSWjWiMXMAI8iyd7qJySMBAHSoT7w03VGhJsFN
	In0yw21Jd9x2HNBJHZNkyBbkI3Rq1HbjUSm/FtR5ue9qbHVJ64TzihHhpbaiIUnhhCc=
X-Gm-Gg: ASbGncuxkZWFGUnxC0CINj9MYVcatRSrUBqFp8EhAOpTkzn2+EHr/3u5utr88n9oie7
	YZ4ATAZgNuqdV1gscmpxz/K2YUsFpGzWbqM8FpL8p2Gdz2DUHiJoyg14pEss6SukCn+OeX6dN7q
	tcd4gNDEtKt2COS6t7jhFm5CJpFXLJ51bnoBoiWB+zfsQnNwRUYDaRwFRgudXKExVeLP96MZMN3
	K0NevupZDKaV0sfl1dAyYDa0DBOrePFISlwJLAZjbdJLFW6MrbE2CwL8mPfbUwJacQAGpSB3RSS
	FPYXDaRtKhTqScDqmyE1otBmmgHLOx2mTVLAT6y7hBQxAbwVYfL9HCE8hi1GhkSdf30+dAOmJEe
	SGEvvnau92P11gg8Xe8iZTQYDpZigSPB/bSfFHDeTXt+uu7tY5qa0uBjpOwWLPDnQG20=
X-Google-Smtp-Source: AGHT+IHuZPJvj5chfdbrdzBcDVd4tdia78dqN9AumnIHt0HsTrI5NBoiI28owPGskp0+wYu7G+MfVA==
X-Received: by 2002:a05:600c:4fd1:b0:46e:4abd:6515 with SMTP id 5b1f17b1804b1-46fa9af8ebcmr49616235e9.21.1760000680262;
        Thu, 09 Oct 2025 02:04:40 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9d4c8c5sm73350045e9.11.2025.10.09.02.04.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 02:04:39 -0700 (PDT)
Message-ID: <897c28a8-599f-44b3-8939-8279d2639f2c@linaro.org>
Date: Thu, 9 Oct 2025 10:04:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/25] perf arm_spe: Decode ASE and FP fields in other
 operation
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>
References: <20250929-perf_support_arm_spev1-3-v1-0-1150b3c83857@arm.com>
 <20250929-perf_support_arm_spev1-3-v1-5-1150b3c83857@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250929-perf_support_arm_spev1-3-v1-5-1150b3c83857@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_020443_412050_4E9E3236 
X-CRM114-Status: GOOD (  16.58  )
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



On 29/09/2025 5:37 pm, Leo Yan wrote:
> Add a check for other operation, which prevents any incorrectly
> classifying. Parse the ASE and FP fields.
> 
> After:
> 
>    .  0000002f:  48 06                                           OTHER ASE FP INSN-OTHER
>    .  00000031:  b2 08 80 48 01 08 00 ff ff                      VA 0xffff000801488008
>    .  0000003a:  9a 00 00                                        LAT 0 XLAT
>    .  0000003d:  42 16                                           EV RETIRED L1D-ACCESS TLB-ACCESS
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c | 6 +++++-
>   tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h | 4 ++++
>   2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
> index 533920b738cbcb39136d1ba3d88e99f9d8009e74..21b65a9b40f481b6cb25aaf01ab627ade046ff72 100644
> --- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
> @@ -351,8 +351,12 @@ static int arm_spe_pkt_desc_op_type(const struct arm_spe_pkt *packet,
>   				arm_spe_pkt_out_string(&err, &buf, &buf_len, " FP");
>   			if (payload & SPE_OP_PKT_SVE_PRED)
>   				arm_spe_pkt_out_string(&err, &buf, &buf_len, " PRED");
> -		} else {
> +		} else if (SPE_OP_PKT_OTHER_SUBCLASS_OTHER(payload)) {
>   			arm_spe_pkt_out_string(&err, &buf, &buf_len, "OTHER");
> +			if (payload & SPE_OP_PKT_OTHER_ASE)
> +				arm_spe_pkt_out_string(&err, &buf, &buf_len, " ASE");
> +			if (payload & SPE_OP_PKT_OTHER_FP)
> +				arm_spe_pkt_out_string(&err, &buf, &buf_len, " FP");
>   			arm_spe_pkt_out_string(&err, &buf, &buf_len, " %s",
>   					       payload & SPE_OP_PKT_COND ?
>   					       "COND-SELECT" : "INSN-OTHER");

A warning for unknown packet type would be useful here now that there is 
no final else catch-all.

> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
> index 48bd9e9ef132b11b79ffe2e2fbc7cfe4c340ff92..704601c6dbe30e93f83a82670d0d60344a22222a 100644
> --- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
> @@ -123,8 +123,12 @@ enum arm_spe_events {
>   #define SPE_OP_PKT_HDR_CLASS_LD_ST_ATOMIC	0x1
>   #define SPE_OP_PKT_HDR_CLASS_BR_ERET		0x2
>   
> +#define SPE_OP_PKT_OTHER_SUBCLASS_OTHER(v)	(((v) & GENMASK_ULL(7, 3)) == 0x0)
>   #define SPE_OP_PKT_OTHER_SUBCLASS_SVE(v)	(((v) & (BIT(7) | BIT(3) | BIT(0))) == 0x8)
>   
> +#define SPE_OP_PKT_OTHER_ASE			BIT(2)
> +#define SPE_OP_PKT_OTHER_FP			BIT(1)
> +
>   #define SPE_OP_PKT_LDST_SUBCLASS_GP_REG(v)	(((v) & GENMASK_ULL(7, 1)) == 0x0)
>   #define SPE_OP_PKT_LDST_SUBCLASS_SIMD_FP(v)	(((v) & GENMASK_ULL(7, 1)) == 0x4)
>   #define SPE_OP_PKT_LDST_SUBCLASS_UNSPEC_REG(v)	(((v) & GENMASK_ULL(7, 1)) == 0x10)
> 


