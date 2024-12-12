Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7646E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 15:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DpS9P9XwAS30njS9V7ckdqZVR6lOQbdme3ixokuDXWQ=; b=goaEI60i+qYyNvqIR1s0Ef3oAk
	oc7D2Y1Lw7TkNYQCItDPKL8aEe2Au98fsBfkHDpGZFaxv7RzFybx/4hMzVCo0alSLdGIf3d0C6Mh8
	rNi6gzMRT4V5xqY4qD1Gb71ounlGMjSj3o85y+JPKYmwkzCLmwsShxoiNR6yDs1WrnNiTQ3N9qPD9
	kmMSr/YDFFcsxCRFuMsarryLdZFVnk6Qyvi9amyN9wE/4UDoYAM3OefAogTby+MpqLMu/Y6TnwqIL
	KLSifcGhJqQ3WRXkVoOblqWx+hD6veSM2R0HnxZNMSjvtkFciNLmrdYYPrW+64Tdx/4NOMlYI1UUe
	EU/0q/pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLl7I-00000000l4l-1ssu;
	Thu, 12 Dec 2024 15:28:40 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLl6B-00000000kwu-1cTw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 15:27:32 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4361d5dcf5bso8030295e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 07:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734017249; x=1734622049; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DpS9P9XwAS30njS9V7ckdqZVR6lOQbdme3ixokuDXWQ=;
        b=dK9l+jvST2M6aE4ActdlfwlDqhBniUcY7b18WvI8aNUlm+74ZWIdspdoSwZmHbNrEG
         uveiI/sRj27XQj6GMVTQjP/EaQfSol+tbZXbrFJf8PmZUNER99cEg/IsekKSzqPLW4xl
         INBM7Jf/ENi+lJH6btaVXeDuNbxZnw8yXntLJ9vlFXr1ju0VbpdrjP+EytmQPQOKIUY2
         RAdDuSwINVWOdR1op75rAmU+91Kgfr6B6pHRfAJuNAea5S30BEo/fTcVQX0vOgSedecn
         TQcIEEwerml9gfuzSB9PSXR639mYupW7RCiNWEoy5Th4MatI2k3/n1/5liPkCmomXvaJ
         5qew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734017249; x=1734622049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DpS9P9XwAS30njS9V7ckdqZVR6lOQbdme3ixokuDXWQ=;
        b=DocU0p4o0/XgfYVQeBgj9qF3B58Hp84k8vulzRRKzfBewzOAagKn6U1ZQ6kZgI7NaO
         hyhSVTLLOi6KLNunBNI2ZlTsKDRomqhZgXc9PABcMSfj1HV9ugcL2kYWeT1eRevKdaQB
         /2dfQMYfFByP10sv/W8tKs6atoyvzqd0Y46RU/uyMeYJtvQb/WlHdVDz2F7I/anWvFH/
         qJIg7JkWc222xAwD7eSUDF9E9IbU2+XMYhKcn+Ikpo0zIrW/NAvIeVGGc+MuRHAlgx4x
         48J2KVr279D0LVRtHEQpRXEhgf0nnVuRkgvMtuHN2F31bIOXP295RHMpiitZiT9pYn/j
         87HQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2UXFYt7uKHlvupgfFv88Zr7Mb8oFeyBtT0xxWaI4+vp+om9RqfyM/b61X4SlE2qquoBuSpkumhg8LywIh+vM+@lists.infradead.org
X-Gm-Message-State: AOJu0YxdfgAAwLHo8WpaHxbv395YHJxY5JQMlP1bXLdOaWQ5J5t2hrfa
	qwnseveyPdyvRYNHIaiafsnylEFPuEN6/88yUOhc4MtUEW0QB1ab8tW9ncNMoRs=
X-Gm-Gg: ASbGncv1MjidsJLX7KEHs9L6RF3VKi/FopWdJXKhAybb9BuS2hXJb6RyZiecuUZk+pb
	hyaRaan9tiSjX+nRaZgXbHW3NMnlXpvws3XqnhdMCmoa6cXPrNE1qqfoK6sbR6n7rg8vz1zUOVC
	Pmiq+gMEtsgqsW7ZEnZgVj8x5cak3RvU05qJZ3qkGjtFY4fjzL+T9Cy4FVE2ln9cN2NcOc5sgDI
	wz+UU88/jqwgfr0rjY68uHa4O9RhfbwC5nNKRPTDFAAPhEcS4g6z6Wb4DQKl0XrkZ8=
X-Google-Smtp-Source: AGHT+IEhNl36m73Z9uj23to0PG8NFMTyNmDs7ZQ3Hettg3uLA6lpt+bVWiT/atLfW0TWRdXrBJzlMA==
X-Received: by 2002:a5d:64a9:0:b0:386:3213:5b9b with SMTP id ffacd0b85a97d-387877c9747mr3330810f8f.43.1734017248923;
        Thu, 12 Dec 2024 07:27:28 -0800 (PST)
Received: from [192.168.68.163] ([145.224.65.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3878248e54dsm4329749f8f.19.2024.12.12.07.27.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 07:27:28 -0800 (PST)
Message-ID: <24299600-277f-48f4-9be5-cbd65ab6ddb7@linaro.org>
Date: Thu, 12 Dec 2024 15:27:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: docs: Remove target sink from examples
To: scclevenger@os.amperecomputing.com, coresight@lists.linaro.org
Cc: yeoreum.yun@arm.com, Mike Leach <mike.leach@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@linux.dev>,
 Namhyung Kim <namhyung@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241210144933.295798-1-james.clark@linaro.org>
 <9e53f5b9-d8a9-46b8-8ff1-7f018e2d9c06@os.amperecomputing.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <9e53f5b9-d8a9-46b8-8ff1-7f018e2d9c06@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_072731_427056_5861A506 
X-CRM114-Status: GOOD (  15.33  )
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



On 11/12/2024 6:01 pm, Steve Clevenger wrote:
> 
> Hi James,
> 
> I thought I'd mention this issue with multicore self-hosted trace. The
> perf command line syntax does not allow a sink "type" to be specified
> (e.g. @tmc_etf or @tmc_etr). For multicore, it doesn't make sense to
> specify a processor mapped sink as would be the case for single core
> trace. A sink "type" should be allowed to avoid the auto select default.
> In our case, the default is the ETF sink.
> 
> Thanks,
> Steve C.
> 

I'm sure it would be possible to add support for this, but I'm wondering 
if the real issue is that the default selection logic is wrong? Are you 
saying the default you get is ETF but you want ETR? And there is both 
for each ETM? The default selection logic isn't easy to summarize but it 
should prefer ETR (sysmem) over ETF (link sink), see coresight_find_sink().

It's probably better to fix that rather than add a new sink selection 
feature. Maybe if you shared a diagram of your coresight architecture it 
would help.

Thanks
James


