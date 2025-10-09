Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7619CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 09:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUiCTQ3L5vyJ1npU/Ek1l1Cxj0jZdtJk6kQTDX+q4eM=; b=a8J6v63XIYGcYaysfoFle2szx2
	sgIvDwHblUdNppirz6wXXrbxPXBW0/T5xOG3wLtNfYNElXz0Nacj4LVK2BF7Nry+51LS5tKwyudFi
	6+0riGsL+bUoaZK7I/1ECsY+OcCkL5bL6FgmHp7BvDl8fXsAFcUSrB8EORxr7Y6VM7taafxMTrVnX
	xGk60XaPbufd2NoObDMOGWYtfveMCWd/ZUAj8xnYgDMavEG24cY4AWS2spKJF40ZtI0q+ZGM5FQib
	lMSm8H5gJqGPRsFi5NcuWKOGT8IlYYhOimebl6CXIeFOtKqE/19mlObqpdcrZxsZS0rEqy+eSnVIF
	Hvx0rQsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mmn-00000005dJ2-2PSE;
	Thu, 09 Oct 2025 09:18:09 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mmk-00000005dIg-3V8j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 09:18:08 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-46e48d6b95fso6452135e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 02:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760001485; x=1760606285; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RUiCTQ3L5vyJ1npU/Ek1l1Cxj0jZdtJk6kQTDX+q4eM=;
        b=RMb7v8whVlvm/7KvcTJUs+9zEAw6FivcbTVSM8Cs7sM3OeRXIDbI5xOh2bdY/j3bsX
         L6ON5aZXzrmE9PcbP2k6m2Z9d3VULsKKNbWodlevQ+FQ+N9OYXTTsfLhq3HjBWOq/zOG
         tynwH89XC92T/MyxNiRYBNOSWPivkyeUU3sB8IjGuftdltd4MtrAf9tpvPdzW23DfDO2
         wWwhLM/F7xEvR7b5qy2wddmPTGQvuGYgam8ml/GCF40aZO0rVbl74Egw+29Bg0JKv2XE
         oD12OZaONcCGfB+bAdtoC7CIdXBAWCnct/2i1PKqEY04jADJp43tazHtbU/3TsBWOovB
         dbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760001485; x=1760606285;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RUiCTQ3L5vyJ1npU/Ek1l1Cxj0jZdtJk6kQTDX+q4eM=;
        b=W7ebMdz/yk2v2LmP3G1WBjjgEpcQUYZUNXwytPOkhyYvaTm4yHPy6+Sle75ALzeoq8
         N+aKAaASDtpfXUtol+MjbUShaAfD8URqmh/jeEhXHNxJoNvoqP/XalSM5f2DCqe2+u/f
         PuNuszsmnw6u+6P2dycepchxpKNJ55zNrTxK0WMSw+TRINC+Y1P5CS/6meKdqkHhUQ8T
         wgxx8CzYi/TKHnWaz5qPcMqfZAe0A8/eNC4O/qqr9KS0K0YhsBWph0KmRHUtfnXv1l3/
         BeuBgjwBmI20Ud56DlkaeNXp41mus4txF4d0+75rztKXIF8sUWRecnCLqjbnrdmR8cR+
         08xg==
X-Forwarded-Encrypted: i=1; AJvYcCVjkhWeG/D0u0zKeOtlTjbtKg6fRXzbE220vbBdZquisDwpX3PiyZUtimaXc2cOVxX3cmK60yotEy7h/1Do9fI0@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5gcZL5Wqa7c3lD/g3VMX/Aid9yFX8LvhYsedtmH3fe/rNZTf3
	F5604KCl+qSOJ+Sx2CTWvBaDfkYCgFfeXGoh6UrzyIInYcDKXgsPpW2XJP2GE2IHK/Q9bNuQ1eV
	1mJvB
X-Gm-Gg: ASbGnctLvaBnWxrXHLTWcJpvzguMdTOZtNq8NI3UAUV9+4Jqko0RJW4STLaXoSW80qr
	8zuyqHNGL+LTT7fh3bE6jFetEsmE5mCHqRqbK0Kr8pLtQc2e9UGJSXFvyuRQPRBQCdqsNyM/3aH
	+q5kjZpqqhkhOE4Qh+8g83wTjxbkktcGTcJUuiurLypDisM5n3wAfnMbLKefvfXCjA4KRsFAY5O
	QkbiFPNy9t+EeqAsyVs2Y4sHjFaS5AHU+qFOZl8ixEZMEjE7ggB1VXHAdfsHOZuT35YLk4ZQGqT
	7FjJBupmcwyHU8LBdl5Pidsne8tZ27YnAH2V/bej2eH1n7oy++LCWhdlZo1ADDXlnQsXCNMzW9Q
	tqkIelMq+e74PWMY/WMK7NDvFk1pVHhaXXmWmjvj3AlKWS69HBCnQVdcvWTB1zonfNJ2pZx6bQg
	xPIA==
X-Google-Smtp-Source: AGHT+IHtSgHPb6AVg9rdfLA09kZRMiuW6l7Gm8b/VBTmTW5QLOQGmo05tlRDmK++reg15GI7jX/9Mg==
X-Received: by 2002:a05:600c:198f:b0:46e:38cc:d3e2 with SMTP id 5b1f17b1804b1-46fa9af3125mr45681515e9.22.1760001484904;
        Thu, 09 Oct 2025 02:18:04 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9bf8288sm75584245e9.2.2025.10.09.02.18.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 02:18:04 -0700 (PDT)
Message-ID: <6cd67290-a673-4375-b8b5-a8ed68b0ee72@linaro.org>
Date: Thu, 9 Oct 2025 10:18:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/25] perf arm_spe: Consolidate operation types
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>
References: <20250929-perf_support_arm_spev1-3-v1-0-1150b3c83857@arm.com>
 <20250929-perf_support_arm_spev1-3-v1-8-1150b3c83857@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250929-perf_support_arm_spev1-3-v1-8-1150b3c83857@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_021806_899521_C4659886 
X-CRM114-Status: GOOD (  17.42  )
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
> Consolidate operation types in a way:
> 
> (a) The second-level types for memory and SIMD operations are classified
>      by modules. E.g., an operation may relate to general register,
>      SIMD/FP, SVE, etc.
> 
> (b) The associated information tells details. E.g., an operation is
>      load or store, whether it is atomic operation, etc.
> 
> Start the enum items for the second-level types from 8 to accommodate
> more entries within a 32-bit integer.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/arm-spe-decoder/arm-spe-decoder.h | 40 +++++++++++------------
>   1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> index 1259cbadfdc8098019afcd4cf65e733475310392..8156aa04f82e59ce345fb44223d3d22ecbc149a7 100644
> --- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> @@ -37,28 +37,28 @@ enum arm_spe_op_type {
>   	ARM_SPE_OP_LDST		= 1 << 1,
>   	ARM_SPE_OP_BRANCH_ERET	= 1 << 2,
>   
> -	/* Second level operation type for OTHER */
> -	ARM_SPE_OP_SVE_OTHER		= 1 << 16,
> -
> -	/* Second level operation type for LDST */
> -	ARM_SPE_OP_LD			= 1 << 16,
> -	ARM_SPE_OP_ST			= 1 << 17,
> -	ARM_SPE_OP_ATOMIC		= 1 << 18,
> -	ARM_SPE_OP_EXCL			= 1 << 19,
> -	ARM_SPE_OP_AR			= 1 << 20,
> -	ARM_SPE_OP_SIMD_FP		= 1 << 21,
> -	ARM_SPE_OP_GP_REG		= 1 << 22,
> -	ARM_SPE_OP_UNSPEC_REG		= 1 << 23,
> -	ARM_SPE_OP_NV_SYSREG		= 1 << 24,
> -	ARM_SPE_OP_SVE_LDST		= 1 << 25,
> +	/* Second level operation type for memory / SIMD */
> +	ARM_SPE_OP_GP_REG		= 1 << 8,
> +	ARM_SPE_OP_UNSPEC_REG		= 1 << 9,
> +	ARM_SPE_OP_NV_SYSREG		= 1 << 10,
> +	ARM_SPE_OP_SIMD_FP		= 1 << 11,
> +	ARM_SPE_OP_SVE_OTHER		= 1 << 12,
> +	ARM_SPE_OP_SVE_LDST		= 1 << 13,
> +
> +	/* Assisted information for memory / SIMD */
> +	ARM_SPE_OP_LD			= 1 << 20,
> +	ARM_SPE_OP_ST			= 1 << 21,
> +	ARM_SPE_OP_ATOMIC		= 1 << 22,
> +	ARM_SPE_OP_EXCL			= 1 << 23,
> +	ARM_SPE_OP_AR			= 1 << 24,
>   
>   	/* Second level operation type for BRANCH_ERET */
> -	ARM_SPE_OP_BR_COND		= 1 << 16,
> -	ARM_SPE_OP_BR_INDIRECT		= 1 << 17,
> -	ARM_SPE_OP_BR_GCS		= 1 << 18,
> -	ARM_SPE_OP_BR_CR_BL		= 1 << 19,
> -	ARM_SPE_OP_BR_CR_RET		= 1 << 20,
> -	ARM_SPE_OP_BR_CR_NON_BL_RET	= 1 << 21,
> +	ARM_SPE_OP_BR_COND		= 1 << 8,

I know it was already like this, but this should be multiple enums 
stored in a union. Having an enum with duplicate values is a bit of an 
abuse of the language. It takes more effort to understand it to 
carefully make future modifications too.

With multiple enums you don't need to rely on a comment to describe 
them, because that info would be in the name, like "enum 
arm_spe_2nd_op_ldst", "enum arm_spe_2nd_op_mem" etc.


> +	ARM_SPE_OP_BR_INDIRECT		= 1 << 9,
> +	ARM_SPE_OP_BR_GCS		= 1 << 10,
> +	ARM_SPE_OP_BR_CR_BL		= 1 << 11,
> +	ARM_SPE_OP_BR_CR_RET		= 1 << 12,
> +	ARM_SPE_OP_BR_CR_NON_BL_RET	= 1 << 13,
>   };
>   
>   enum arm_spe_common_data_source {
> 


