Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22D2C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QEbDsC7zOesvvA0J5tAlZE6+h1PCWgc42liU2tI3McI=; b=Ann3TsTKKO5IUjzb45A5djGLZo
	+I+oS25pdyLGx+GVMXBtYkfKfChg53tbT+QPDM8SQ7KXPt4Yjc5fZMrGbZk5lqHgmwJNNNBw0meBh
	M9pSd6QOYjPwisLwNYoq+zCYcZsFBu5Dl7PzU8SmQb04G/iKQgS2rhl7AZTQvV2dhOXwIbptcHRUi
	HEqs6cnJtwDc6t6aUbEhUpWrrdm8AAuYhW6AGatnak9AOrWhynamnknJFUis8smDDzhD5QmqQXS9F
	ceIC5hMercI89tq8nm8ZitFp8793Wfvf1JfptAr6pY+4u/ROUyfIkmYD9JoBixJpw349t8e5RJhMf
	v33HZTSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjylu-00000004CwF-0F8V;
	Mon, 17 Feb 2025 10:54:42 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyc4-000000049Wx-3vn0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 10:44:34 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so844336966b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 02:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739789071; x=1740393871; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QEbDsC7zOesvvA0J5tAlZE6+h1PCWgc42liU2tI3McI=;
        b=Wm0UzA+J9sHlXHYExcpH3B0m5YweeUflHZcirBHza4niRKaTFlwBw/46ulbDM5eTEy
         IHfzQNGGdUUgpZZv2/oPCi3gqlJS6RHMr8riSgRD9rnmMXaKUpSaluciKUA5FaiasQEp
         MRzFXF+5PElmET5Dx8Yoe0aBQnmK53Zmmth9/slMTf7zo652FhC2J3sz/U/r1EnMu6lf
         TNQO6eH8/rsH+cnKZhyYNEZtMiZFG92XnBtMoMCMHXGIfZlpKhnls5k4e0Q2h2dn0McF
         BLR/2NSbeEdW5bww8+2HsHz6u/v34KJSWYnGrRjxGhyusojiV0nSxh8pIPQXh/860EQb
         7foA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739789071; x=1740393871;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QEbDsC7zOesvvA0J5tAlZE6+h1PCWgc42liU2tI3McI=;
        b=C0mZ5p+O22jrDOyaE5q/7dGN+7D60pcT2O6ufxKdGKyt5OlLK8k7I28d3Y5o6JN2Ay
         8MbzOH7icylVLru0i5LuCwnuoVcjOSX+lU81isGDSNT3UEBnMizE/lMV8RK03/Zr6ntT
         RSsqZCMt6ShFxpoJEZAK2RhlSxxfS8HULu/dj/RiMvRhfbJic9GxM6ifwaQ6S8ffwrpq
         Dk/U8z8QMMjqEtAb4RVmzepVBLsJ3hToSoreK/HDVm66wJUdvSEx3PKz7cWun9bDW17R
         A0V8s6DcrSrXKminuOQe2WnKtjfkbyMhZmH20FO4MON9J0cwOXipiaMz4dtgJxOqPyrG
         annQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaGYP8sYCNZRIojxhHgY9zUO17CzuFrEVc5MkLan6VR5diiIWOCU14Xj1hrn5YehPBfp4DjYdltHeCGbdAuZJN@lists.infradead.org
X-Gm-Message-State: AOJu0YxTWoQak3jeGE0HKz1qwUwEV7yIkHR4zDMNs+yR5+Dc0Pl4adWB
	DESshKkQYj6zq9C9bLPEH2tbfzLHAcqVvPvY8utQ89HxV/nxR8BSBwtxaWek1bk=
X-Gm-Gg: ASbGncsHm3lXD9867zzo0IxyBAB4N3kCrK9d2JCVFfM9MP1UzUjjMqHCB4mR9ipceJF
	Ugl5fpqTvnCbn9u9FZOy2PMFza+7hcoWqNdL5j3Lf/fTLrZiJBYm/SnXcSWA5O8pX+YGQHjTUZO
	NgK2KeJN7locHXvwve4sEfPTHKIrdbmK9A22DdgTxKENPDbUobSHDm/SeAXkhd8PrSyqgWEGyKI
	k4thJlCCxoDGnN4Vva7e8//Lz5NLxaZ5pQVb/rNzkxwB2mpTNASse8l7W53iFBeiUb8eaGWnReV
	ZOwY1CCQdz/OKHe8k2C1ugU=
X-Google-Smtp-Source: AGHT+IE+qR+XkSpEa4n8UFFb2YUXaqm+JYBZqs/0Cfmj9Y8tSfbfIbKyD0WPukltsMDTzYdEa4UX0g==
X-Received: by 2002:a17:906:7312:b0:ab7:ca44:feb8 with SMTP id a640c23a62f3a-abb711304d9mr1001080366b.52.1739789071395;
        Mon, 17 Feb 2025 02:44:31 -0800 (PST)
Received: from [192.168.0.24] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb88c69c1bsm330535466b.110.2025.02.17.02.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 02:44:31 -0800 (PST)
Message-ID: <b304d582-9328-4e1b-9e34-5604125b0c06@linaro.org>
Date: Mon, 17 Feb 2025 12:44:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 00/10] pstore: directly mapped regions
To: Johannes Berg <johannes@sipsolutions.net>, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, kees@kernel.org
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 rafael@kernel.org, dakr@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, tony.luck@intel.com, gpiccoli@igalia.com,
 pmladek@suse.com, rostedt@goodmis.org, john.ogness@linutronix.de,
 senozhatsky@chromium.org, quic_mojha@quicinc.com,
 linux-arm-kernel@lists.infradead.org, kernel@quicinc.com
References: <20250217101706.2104498-1-eugen.hristev@linaro.org>
 <c4b48faeae8531e670ea5909800d1a0bfed69862.camel@sipsolutions.net>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <c4b48faeae8531e670ea5909800d1a0bfed69862.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_024432_984434_D5F7A5FE 
X-CRM114-Status: GOOD (  17.75  )
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



On 2/17/25 12:23, Johannes Berg wrote:
> On Mon, 2025-02-17 at 12:16 +0200, Eugen Hristev wrote:
> 
>> This series comes as an RFC proposed solution to enhance pstore and
>> devcoredump with the following functionality:
> 
> ...
> 
>> This patch series attempts to solve this by reusing existing
>> infrastructure in pstore and devcoredump, and provide a copy-free
> 
> ...
> 
> You mention devcoredump multiple times, but it almost seems like you
> don't even know what devcoredump does? I don't see how there's any
> relation at all, and the code added to it seems to have no relation to
> the actual functionality of devcoredump either?

At this moment going through devcoredump is not something that impacts
the idea of the implementation.
The whole reason of going through it (because things work without it as
well), is to see whether this has any kind of impact or not, and if
there is any kind of fit/reason of going through it.
Devcoredump is involved because the whole core registration is similar
to a core area that devcoredump could use.
For example, would it be interesting to have a handler going through all
devices, and have the dump areas already registered ?
Meaning, when there is a request to generate a core dump, one could
directly dump this area instead of calling back the driver, and provide
that to the userspace instead of the driver calling the dev_coredumpv by
its own.

> 
> johannes


