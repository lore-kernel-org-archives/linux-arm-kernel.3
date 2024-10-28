Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D7DD13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 08:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZvzHzoAhSvqMlNJ4Z3rTvD9uHN+8mD+ZB2Dwhaab9E=; b=LWegzWfiMDhhTRV0PgWorFRCX9
	iDlpqwCTM4oP1NQ1LDrRN7cOru/QykQvIvZhYuh7aJZtX6K+CLE/vmUGJ5LuHKCeBQzPoE6QN/DTO
	B6RHtxZUTvFa2+tzS1EAk6kHszfv9Ua+JJnNVSBVKVH0K6ydsUQJ0DIoe5w8giLs9WSp2wnwYcWcw
	aiUFh34CF46yWT5eqy3j+6YuDJR/wnqHKdx8oKWyvJMkKtECSrQe96wp0cLBBkZQI45ueI+vJj/PV
	TqNrdGhX5OXzngbrzptAzS+IOkArEQwhgLVGr/aFfq/y7nEptso6U6Vqbg4OtPdrgD7cvxkfj38DL
	/lOg58Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5LEa-0000000A79e-1pUX;
	Mon, 28 Oct 2024 08:36:20 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5LCz-0000000A70N-00Us
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 08:34:42 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2fb5638dd57so34925641fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 01:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730104478; x=1730709278; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OZvzHzoAhSvqMlNJ4Z3rTvD9uHN+8mD+ZB2Dwhaab9E=;
        b=oUEKNIMwBBnNpCRpp6DMhiVcmBEopAWSOQqOtm88LJRySpQbAXf7WtJ+NEuE1iDEwl
         cnEFwcRja2MjnTmgF28+rRv5hmfTWIiU3EbT75w2CSuASIU+ELWlrQd4aL1NfeRbqLuc
         f9xmxhgD8Qnsy84CHkzYZuxt6FecnM1n4rdQhza4JtAfF6Fe5iOSVvl2TP5zYQa9eLKE
         k6Jo4Kb0foPqB3RQgr80sxZ4Cd2DIDbCiWdY912jaYs7F8ZqCMqNHm7U9l0DPUCywEY8
         1skRn/pVXlgLIe5v9IqdcIRop2FS60f9tDm9Z0nM3p2LkwVaJuJVAoMtetHasp8fjLnP
         3a1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730104478; x=1730709278;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OZvzHzoAhSvqMlNJ4Z3rTvD9uHN+8mD+ZB2Dwhaab9E=;
        b=ufmXNgxX0wMILoQqyYwbxbMV1KA3+APkTQ7UZ04EzhpLCPb5DoatCFvSi91lvahkfN
         EKqsYXvYTiBnkEHN4yeA3yCuJF3hreGvmeDQJT76OE3lZg9cIdVcxsgH7SUvUER7cNtg
         RRsPLSXLoC329YnGhboPLYCyZfNG4bl8k3GAx79xSEEVCij5FKJu/JCWqU24LZK+tb3w
         qZ1zMAqUTn90Npgh42I5mZ3G6iXvh0kPohZ4WWKQzLTmVU9JVYkkKqUOVFv8O/DwgmI7
         PMrYfQKGpqLnrBkfliMhYWm9zFw6P7CWfdLP1ilOwb15lzS8dDJxRY+0k6DuJMILr+dj
         acYg==
X-Forwarded-Encrypted: i=1; AJvYcCWsr0N0oV6Y5LtyJ+J60W3597KrR6f3qhkTU3skOdgHKkGbsm5KC/hMk1mBnbtM2kFBgYrZASt6VJ8QytQUqft8@lists.infradead.org
X-Gm-Message-State: AOJu0YxLr/HraVjDumtahTsqB3SUg/eC6d3/DslWe4fCicLv0aY/uVTk
	UofuFTS9J5ZPOrjqHgZvFs1Gcxe9Y6zqlnTw4r21PxnbWdAakY+OwjbCYdtXXII=
X-Google-Smtp-Source: AGHT+IHvf3GhuRMSFKVfZ81qhF/flm6MKCz+LjHzg8vMbfIK/ulHNHb5uk/8WCn12dX/Q8vNZNNArA==
X-Received: by 2002:a05:6512:3d26:b0:539:f4a6:ef4b with SMTP id 2adb3069b0e04-53b34c8db59mr2835250e87.55.1730104478404;
        Mon, 28 Oct 2024 01:34:38 -0700 (PDT)
Received: from [192.168.68.136] ([145.224.65.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43193573e47sm102561675e9.8.2024.10.28.01.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 01:34:38 -0700 (PDT)
Message-ID: <05c1d469-846b-457d-b4b9-216f8c7e33f1@linaro.org>
Date: Mon, 28 Oct 2024 08:34:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] perf arm-spe: Allow synthesizing of branch
To: Graham Woodward <graham.woodward@arm.com>
Cc: nd@arm.com, acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
 jolsa@kernel.org, irogers@google.com, mike.leach@linaro.org,
 leo.yan@linux.dev, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241025143009.25419-1-graham.woodward@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20241025143009.25419-1-graham.woodward@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_013441_088182_263EC4AE 
X-CRM114-Status: GOOD (  12.60  )
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



On 25/10/2024 3:30 pm, Graham Woodward wrote:
> Currently the --itrace=b will only show branch-misses but this change
> allows perf to synthesize branches as well.
> 
> The change also incorporates the ability to display the target
> addresses when specifying the addr field if the instruction is a branch.
> 
> Graham Woodward (4):
>    perf arm-spe: Set sample.addr to target address for instruction sample
>    perf arm-spe: Use ARM_SPE_OP_BRANCH_ERET when synthesizing branches
>    perf arm-spe: Correctly set sample flags
>    perf arm-spe: Update --itrace help text
> 
>   tools/perf/Documentation/itrace.txt       |  2 +-
>   tools/perf/Documentation/perf-arm-spe.txt |  2 +-
>   tools/perf/builtin-script.c               |  1 +
>   tools/perf/util/arm-spe.c                 | 31 ++++++++++++++++++-----
>   tools/perf/util/auxtrace.h                |  3 +--
>   tools/perf/util/event.h                   |  1 +
>   6 files changed, 29 insertions(+), 11 deletions(-)
> 

Don't forget to pickup the review tags from the previous versions. If 
you use the b4 tool it does it automatically:

Reviewed-by: James Clark <james.clark@linaro.org>


