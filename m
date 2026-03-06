Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9F1F0182F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 13:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZPTd9XqPxo27WQA3KpO9Gn9NiuPxcGYqc9Rn0MTrsQ=; b=4X1ZCjviN1kAdEkoFkmqMxtN7Z
	K0hlGyh3OoJe+Kvoh0tuLwA9tJpBM5KiWSvfEEtaeDgC0ZMuSaHXHVCwGyYmtI5NEURat2PUcf/ny
	Xq1Vi0jqnIUvsI8yNE6V60rjswChS2l1Y3GFYHPvP2J0vHz862yynL2OoM+1+BlqaXcjF+9D1f8fP
	Oom3/GSt1H9B4qsCs2ZsQ1+IpkYzxZviG7tXp5M8DCZ6eZEUVEEh45zZ8AT865NbnLRI1DNGCiz5k
	qd5tsk28pn7h9WR4YBQJLdQ1iiQpNbIt5nBbMnSFSdRsCXEHqCQ23umfYpw63wFio5GemGHKeqdDN
	CCFz/6Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUo9-00000003iBM-0Dbb;
	Fri, 06 Mar 2026 13:01:33 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUo4-00000003iAN-1MCq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 13:01:31 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-439c5b40f60so2674828f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 05:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772802086; x=1773406886; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pZPTd9XqPxo27WQA3KpO9Gn9NiuPxcGYqc9Rn0MTrsQ=;
        b=FWRS+i74xkdo9GnOANX597+TsenHbP4NCTm9lAakYn13akUCzRIHh3Fs/WofTnmqvh
         E00MzMXeTgHBgs9RfIm6w/rKNRxBzx/ruIlFUI7McruPrYxZ0TJ2wFMcbYUv4ZIpCs4A
         WJGreL0pQNERl/1/o5At/UWXPJFTrn7ifV3ysahnFAio0RDQVNmMoRj/qzKUCH398QiY
         jKqY32CrZnWgpWaPj+4c6CUCVYcLuXGvvg/yX+8Lq7X4ucssp6rTThRsWhmhwWbYyOnO
         vswrGjWhC/+aN1H1HJYB8r7cpwuAcxrW6Q0uonDtOfx5XMNLjIFthekNQwjnj9NS8r1D
         kqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772802086; x=1773406886;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pZPTd9XqPxo27WQA3KpO9Gn9NiuPxcGYqc9Rn0MTrsQ=;
        b=tlx6l9SE1FQcRs5wWL6boIDVQ+EHtMipMzvEuyukzEqj0NbQVEHUfN1BDxIZareCo1
         MWUbP+KVtiix6pR7Wfdt/RnQ7qoE5XtYgYRqICthpKFmYbVyg1jyCNB14ExZtCbZVmPS
         8W++ULu+KQBLILWUQ06/5pAVGtBmkTmrvI/5CN1BUkVk5j6eElww8iJpJtDCl8bCBfDF
         lspnnBGm4ktPLD+DwcUrAyztl0920qmuJhs35PV6HBwhDiVRzhrpSrKvjJWa/reU30aH
         E11Wyh1fS3Tah2zFxtX3cobC8ZFnmqeuKyxm3HEwdoI7uMh6juQ/j64xzlVaY8+pHXWe
         mMuA==
X-Forwarded-Encrypted: i=1; AJvYcCWZOC6PNIpsn08jF/TzMFvlByG4EjDc1+fKfnH8Mfx/+Ko5nDr0aOvBw+Spt9Gf6yYvSnEHMQpv+KBGq1zxkpei@lists.infradead.org
X-Gm-Message-State: AOJu0YwcbMj4UJ5NMZQmxknU6YdOc+QzF6vl/M+j1f79Esrt9MXNWbF3
	DPIS/vp8ZYNEg88EmCfi9i9CK+l+troJoebpo6SksCG+wJTas4YD6ny4JTOIZwdfSyQ=
X-Gm-Gg: ATEYQzwF1BuyXlsgaAvxe1t7XVi7XSe8Iqu85Y3/jqoMD33QoKoWEJJsicojoWvFJ4+
	dMVKybqz6iy7Uo510WjgIUTnQ4U8WZiFcvSZHqvEZhZjLmOO/OCWw5yl2cF/uv/yuRVQkJ/yCoV
	rjh0uQ0cAZB8/9H4YYz/Uu+kOzQy7pCR8vPjE4dKFhEkVievaHKA77te/goto6NxXHkI/DxsF6o
	jmqc0lyORAaZroMgYOMORvOJb5uHCrMXA14F0UNaJb/HKXjsNUtjLEUXMUt0E/xYt9MrThE2n9p
	AtutaFx4SXSZxIf/d/0CDEd3/bndgT676jB0832odfV4iEJqb2kNlBOFSG+MCQ+X1IajXkwUWz3
	8CmNBixM2tQaWDaR6iJCa3m48VKm174QLjJ6cZxMp04+uFMXAeGajhHQRbiYqo6edygskkhqB8O
	Pduy4CYF+3DsdZMsp/P4JDvzHWt5wW
X-Received: by 2002:a05:6000:2913:b0:439:af0e:57a8 with SMTP id ffacd0b85a97d-439da669bcdmr3404575f8f.33.1772802086227;
        Fri, 06 Mar 2026 05:01:26 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3a20fsm4090161f8f.28.2026.03.06.05.01.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 05:01:25 -0800 (PST)
Message-ID: <0be8ed2c-9305-49e6-a315-bdfc15af70d6@linaro.org>
Date: Fri, 6 Mar 2026 13:01:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] perf cs-etm: Finish removal of ETM_OPT_*
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Leo Yan <leo.yan@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260306-james-perf-remove-etm_opt-v1-0-03c662380361@linaro.org>
 <20260306-james-perf-remove-etm_opt-v1-1-03c662380361@linaro.org>
 <20260306122729.GL1098637@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260306122729.GL1098637@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_050130_633646_FA593C62 
X-CRM114-Status: UNSURE (   9.00  )
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



On 06/03/2026 12:27 pm, Leo Yan wrote:
> On Fri, Mar 06, 2026 at 11:24:45AM +0000, Coresight ML wrote:
> 
> [...]
> 
>> -static int cs_etm__setup_timeless_decoding(struct cs_etm_auxtrace *etm)
>> +static void cs_etm__setup_timeless_decoding(struct cs_etm_auxtrace *etm,
>> +					    u64 *metadata)
> 
> nitpick: here it can avoid a new argument "metadata", directly retrieve
> from etm->metadata[0].  Otherwise, LGTM.

Oh yeah, I thought it wasn't assigned yet but it is.


