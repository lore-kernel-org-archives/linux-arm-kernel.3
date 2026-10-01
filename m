Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD57CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 10:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nhz6ns8td9NvZN6ayBEXDaOQ/jthJX46fvpgHDR7D4g=; b=jD9I81u0k4OcDs0XBjuC2Uil24
	T7lZNnhWmc5UNPVJPpQzhJitElbZpJpi9LKMaJv6fX2zt2rEh26ogU2AgCwgZmEwBVH5Qh3jHVAg7
	sm2Ozg/dX4PoqzoKRXK2AxpuaEPox+noxi4NA/Fntn7E0SF2mtDimSpMYZcU/u8Oo7Bg+wTHIV2eT
	s7pl0/40czM1gZJDo/PuIw4RafIiUuKyam5WgjsOgjoQbwUsLmQkH34+m1iCnUhDPl6s8NLguh0nZ
	vLLwS0XmhIEEccAWHvYYW+pPnU9WnQrehg5eFjJAX6YouNl4xmJx6iiZO6CismuFL/CAP+Vba/4+7
	S/U3VlmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCECs-00000008X0A-36xS;
	Thu, 01 Oct 2026 10:40:06 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCECq-00000008Wyy-0kaN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 10:40:05 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ffed768deso16531495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 03:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790851202; x=1791456002; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nhz6ns8td9NvZN6ayBEXDaOQ/jthJX46fvpgHDR7D4g=;
        b=hCGWoRxunv4rDRHtxGrdRVHGAllv1P8Ikx8vfBYEYOOHZekvrfoTv+bpByELeg4QSA
         QKnl4STYjvGPpiYreONa9CY00uiJct31+IbVyTt0HD0IpEaW/1RCyGHsREKKk6KjQBpI
         8EandajF1LWmXkaDFHcfJpGjB9J7xPLf482gQrk4wnyX+MgV8AgQfc6/l1B0QUxi9tJs
         C0J6VmBLh2lUoht0ZbISqurfRlTJLdiJoLQQdfzXnouWiWJoyUfhkG1PW8RKFFhBTieh
         j0ehMY8nSibm0u6Dg5a4SpsPlXmS0mD3A1wDx8ibijZNXErhMRq8xmtj9UQVy2RD6kiq
         X2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790851202; x=1791456002;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nhz6ns8td9NvZN6ayBEXDaOQ/jthJX46fvpgHDR7D4g=;
        b=GqjSIDRhpFNS07N47SnZyCbo0f/ZjkjG5x04icszWYbGinK/ZWSzidZxdTDPwsIOzu
         K9yiLyBO2alO/StztPAfRCwS3jHwVx/ZR/xABtWHwe0O2GwUqL6/bz6UZUFz9BmpYoAY
         qvXifwllQ0Nk0hVT0Iy7n3EwT5AXGxm6El/KKze4sLjucOFhCuWaIVJm/IS4bLzI5/We
         wz4EwaZICExQmbBkzDOQxH9xYeZoVfVatjzdJZ4wqjUi5vuhNnXkhXKPj1zqSOjk1lfU
         L1RE3mowt+lY71BuZjnpBgccMSsbEsTIv88izA1wPk0u2Ry1m4GdeDm4jRnykelvEaz7
         jOfQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7AimSDrepPuR/c2rEPvvIpMyAlhZw3XGYTFPUGyH702e4etbtgYvUmxJqnK4RsO96cI6WHm3ODVUvm5J+Pkb0@lists.infradead.org
X-Gm-Message-State: AFuF++mD2vGYKQ04gEi2Cskcr8c5O6psZyvy/Iahz7FjTGlA/jvjZlAB
	ahTrWvZxZvYilLcPYpKzx3PMBqG/xoN9vERICbVMGrW6pTeBhBoaxr713zn4CaSrKRA=
X-Gm-Gg: AYBFou21a0Dvz/B2o19XLV/+9nhAerfLMhO1huU66J2JIkaSvwd9ag6YyhDJ/Pvh+Zi
	hxB0LfWOLp5IYahwY8GmfGI5FQiSgDxrRTjty96DKGSK7vSOYHu2jYv7eWua7WuCiyEltjUTQeL
	20x06YE3ReYQtPhMz9G1mRha96Aleugd8GZLTougUZQnlvLIh+IMMgM4+QemvfNrRKBvoTuDlQq
	LHIj4LBguLUHwlffSSDnqlCD2GUgAzOKLMqckD2CoLQCjA+XXJegsRmKBp/JrTvsqraUk3IUQCe
	brNty3ZLwrrretVD2BbpFTGLM3cVwwK82dNGXwLOE7Hq67C6T2gMwhfGjGK1A+kkcZSnQo92q0l
	kOHCO5PAwHETBikic3eBrrx0ppqNy8AoGkQCHDRys84Pkh0qdddoK7vun/Ccstg2nTT1v5gQiNC
	wDnGgE6arVLKz+0bfHC+tT8fCFQJ5OwOSJ1H3+pEoeYn7MRF16NJGw803RMuDYhLOwN2Fqw2mMR
	UY=
X-Received: by 2002:a05:600c:c3cb:10b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-4a01eaf5b29mr32874605e9.3.1790851201999;
        Thu, 01 Oct 2026 03:40:01 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f93ad0bsm40417675e9.4.2026.10.01.03.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 03:40:01 -0700 (PDT)
Message-ID: <d3e34f2c-6838-4902-9204-f32b59f12f3d@linaro.org>
Date: Thu, 1 Oct 2026 11:40:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] perf cs-etm: Free partially created queues
To: Leo Yan <leo.yan@arm.com>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Suyash Mahar <smahar@meta.com>,
 Amir Ayupov <aaupov@fb.com>, Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260821-james-cs-hw_id-output-failure-v1-0-9d532ddabcc3@linaro.org>
 <20260821-james-cs-hw_id-output-failure-v1-2-9d532ddabcc3@linaro.org>
 <20260904171214.GA8904@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260904171214.GA8904@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_034004_414302_1B328501 
X-CRM114-Status: GOOD (  13.79  )
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



On 04/09/2026 18:12, Leo Yan wrote:
> On Fri, Aug 21, 2026 at 10:50:30AM +0100, James Clark wrote:
>> cs_etm__create_decoders() can fail half way through and the
>> err_free_queues label won't free them. Call the full queue free function
>> here instead. If no decoders were created it's a nop.
> 
> [...]
> 
>> @@ -3520,6 +3527,7 @@ static int cs_etm__create_queue_decoders(struct cs_etm_queue *etmq)
>>   
>>   out_free_decoder:
>>   	cs_etm_decoder__free(etmq->decoder);
>> +	etmq->decoder = NULL;
> 
> cs_etm__free_queue() also calls cs_etm_decoder__free() but does not
> clear etmq->decoder. Should we do the same there, or drop this
> unrelated change?

Yep we should do the same, I'll make cs_etm_decoder__free() call zfree() 
and drop the explicit NULL.

> 
> Otherwise, for the queues free fix:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>


