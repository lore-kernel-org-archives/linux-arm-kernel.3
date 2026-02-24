Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A32E9B262
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 12:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P+4mGVj3G+psOD6BQM4z8xFWUBs0ualVLWXw/Lw/cGE=; b=H4zrfSH6rGWyK9avhCn1SHTX8m
	xrSAypPBSET8vFkb1HsvFG9llUFw7Sdc62HH+qHlJsfaADAekP72o6W8KYxviDd7TZfrHxvplRepZ
	yHUI9oilgSgaptwEcbZpHD9gm83u3QYbPyXriFg7XsICOnjzvHuZemneSfw/VqOfaE9ACopzuz8H7
	hWQkWoKrlxqPSz5EuOymYNi5HjKjB+lc4WfWTtphMOBHqo18AFCu/MwzlTxzzdAmMQYLj/jqEg+V4
	Y95LfYRXrsvgQKJtvHMlxX5z0WKKsMdinBjL9MCucVb0QYBAMy9t3ztMTawuTLDVPxoTXJ/t/aRay
	LpNfFnuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuryO-000000025xv-368j;
	Tue, 24 Feb 2026 12:57:08 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuryL-000000025xV-2TWf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 12:57:06 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-436e8758b91so3780070f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 04:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771937823; x=1772542623; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P+4mGVj3G+psOD6BQM4z8xFWUBs0ualVLWXw/Lw/cGE=;
        b=jiCM5Fm7R0+2KR6yjbELmuNTqoL0Ku9LjFQccRk9VimhQDAU1ntDcLRR4BYUu9H7A5
         1tgn7L+6CBbrrWD0XUHApn41vaNsaFENutCOhYKSL/1vC/bfGJNt8hFBjYzP+sTszNuA
         rkkdSKz3fcxW6jIe+oQyTJICJyvVexqV9RXtQMknoRRN4iS1QF35f7jkWay0MZJHQEg/
         0EHFMrkyBwR5IJNZYvb2L5bfLVqqzZ9QNQ/5YFkUSDd9s2xRrimpk4nN14NebIjmNgPf
         SeN/8wksdeiMPhDXnf3bTcG0Hc8PjQV+i/4xt7h9ozjm8yiPLgEYygcl2QPwvKKucPwO
         Bwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771937823; x=1772542623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+4mGVj3G+psOD6BQM4z8xFWUBs0ualVLWXw/Lw/cGE=;
        b=FjIvbF8ZJ/fXxkYsgSzXBU0BoJOY5fdUvw/D4saAgnbT/ofq22jTvSW/IFvK4BEFYH
         9ry1JTU1+xiV6HVXKdYTOlRDW1ZsAR0o7ZGDAFMD9uIo+3DnRD9rw0jRykko9l6YWIB6
         e4v3u8kHCInFqpOmakpzgG6gfLRlbfhUAk1na+tzFJCXXfkg5mcnD+X648CmV2zaDj7j
         kOcJVg/ncPUqcapFzKHCnn1oMidiG+N46LFtvPJ47y592Dfomvbk/P1Bp0LRE3iE7TvW
         2Ibi4LLS8EOrt1sEhQZn2Ed4M8riRonojXiX7nkzAG80LW7Kqa8oQkj+n8jCJiiQ4PA9
         1DWw==
X-Forwarded-Encrypted: i=1; AJvYcCV5aUVj1H1vZ5eJqju9AWEDauzpNmwE3GWwirWwEA+0oofMqMwxWJShbPZDoj1nkEobhYNo3F9iiAQq269UIGh3@lists.infradead.org
X-Gm-Message-State: AOJu0Ywue5G68N9ylnwbEOShI4msONdto9eRYEbgvV0ApGtSUOhSrOlS
	j2bZ2yKrJ4Px8zWcmka2EuOFSzFyWmeeZO2K66GofN5PHKbP7xg5ryH38v29bOcrmdA=
X-Gm-Gg: ATEYQzze34EtMj7QFpq+mbUQFqY22HqpKdJ+uoJ8t3evr4mW5opkmFIBnV+KHDgC2z7
	3GfcTusESD7QJGwd2fABwufo8TpZPkxrMe0S0LL6/aAm5swEok8YxC83YKvQjrSxDVG5pKm9EAr
	0fK2h0uhFjBe072DQa7fLFB6ZMmr17ejdPZb/0WJv1YOIyD7gz99vf5Nr7hmv1WTnOwnZn6J7ZY
	RICjGiJfsGkqH0Ee78wRgpq4IqbXxRswdLK7Z6G/KUvqp1lpVwum/yLzZ4HNRGKejhacTL+qSud
	O8vGIo8V+O1httMzJZDZV3YJnubeeyBJsKKTV2wA1ZiULQFnSm9q2SDOEgAc2npa/DFz91UXvrF
	YT9cSgTY3TVdzWp9Ng+T0jEfHOLnjJb2bqZBgLp+Cn9NeqCRURo1xOu92tLJG4w/4z/Azz/FgY6
	KqLYvIIYe5ym0Hv8UJ9jOJcz0lnDdbWRcE
X-Received: by 2002:a05:6000:230b:b0:437:71cc:a246 with SMTP id ffacd0b85a97d-4396f153cd2mr24591474f8f.10.1771937822763;
        Tue, 24 Feb 2026 04:57:02 -0800 (PST)
Received: from [10.11.12.108] ([79.115.63.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4bf89sm25284611f8f.29.2026.02.24.04.57.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 04:57:02 -0800 (PST)
Message-ID: <b083e950-f54a-44aa-b587-eec2cc10460b@linaro.org>
Date: Tue, 24 Feb 2026 14:57:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firmware: exynos-acpm: Drop fake 'const' on handle
 pointer
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: stable@vger.kernel.org
References: <20260224104203.42950-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260224104203.42950-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_045705_683645_B0454B57 
X-CRM114-Status: GOOD (  15.29  )
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

Hi Krzysztof,

On 2/24/26 12:42 PM, Krzysztof Kozlowski wrote:
> All the functions operating on the 'handle' pointer are claiming it is a
> pointer to const thus they should not modify the handle.  In fact that's
> a false statement, because first thing these functions do is drop the
> cast to const with container_of:
> 
>   struct acpm_info *acpm = handle_to_acpm_info(handle);
> 
> And with such cast the handle is easily writable with simple:
> 
>   acpm->handle.ops.pmic_ops.read_reg = NULL;
>> The code is not correct logically, either, because functions like
> acpm_get_by_node() and acpm_handle_put() are meant to modify the handle
> reference counting, thus they must modify the handle.  Modification here

You are right that casting away const via container_of to modify the
parent's reference count is incorrect, so dropping the const from the
handle argument makes sense.

However, to address the underlying issue of the operations being
writable (e.g., acpm->handle.ops.pmic_ops.read_reg = NULL), I think we
should also decouple the ops from the handle struct and keep them strictly
constant in .rodata.

How about we apply your fix for the signatures, and I follow up with
(or we include) a patch to do the following:

struct acpm_handle {
        const struct acpm_ops *ops; // Changed from embedded struct to pointer
};

static const struct acpm_ops exynos_acpm_driver_ops = {
        .dvfs_ops = {
                .set_rate = acpm_dvfs_set_rate,
                .get_rate = acpm_dvfs_get_rate,
        },
        .pmic_ops = {
                .read_reg = acpm_pmic_read_reg,
                .write_reg = acpm_pmic_write_reg,
                // ... other ops
        },
};

and in probe:
acpm->handle.ops = &exynos_acpm_driver_ops;

This way, the handle safely reflects the mutability of its container,
but our function pointers remain fully protected.

Cheers,
ta

