Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BADC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 09:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWPNdBRci+ilO56uoSaBVlNcIj5sRExNLvAX8TWjSSA=; b=Z57v0yDsDEXcrbGII3XvoMLqNT
	qnqE17gn/oH0z3aLBIn83DlAXgKi40oyNxe8vFd10B5p48ichIvH8K8UrDxnT0XE/S5TNcpePEvzN
	0uqo7xvTrV28EXhAP8q9/mdjEVk1uneN4YDeV88AodZNigLLrJ9DKCprpzaWRZJUDM8mV2HjiLul1
	0h48LD1heU66oDryNFpiNcaOMdGkFaDNFQYF+DoTtXDpZjXYPcuu8f4IqLOW/KVsVlun/oj3uBRn7
	gJJFgC/VjpRk7dv0ldwzAZ/9G1LRWdFG1OcHpY5b2Kn1n2OmMaBzkwjyh7bOLbJUnZ8uNzrbuhww9
	5TyOhgIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9J4T-00000007hN3-2FlG;
	Wed, 23 Sep 2026 09:15:21 +0000
Received: from mail-ed2-x0e.google.com ([2a00:1450:4864:33::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9J4Q-00000007hLD-45CX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 09:15:20 +0000
Received: by mail-ed2-x0e.google.com with SMTP id 4fb4d7f45d1cf-6aab5dae09fso579401a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 02:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790154916; x=1790759716; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eWPNdBRci+ilO56uoSaBVlNcIj5sRExNLvAX8TWjSSA=;
        b=HE6dPxifwhzWXmt8hMPEHTQUrKetaLqeB7Qz35AduCKbszFM8lg+Natf5Cp2oWuj4A
         IL2M6YxruTxoEBXar+C7BR2GrKqGJXPwjQ5KONWkYDuJQUh5Nt8uJXjtt2Sl8JLi8mvS
         eMaxR340+OCe32iYodvh4cp1/2qGvC6Q3aJIsJkLj2G/alNi8x+EWJSxT7/RkSsy/eAL
         BTiqlI9HOWEm0lywvq4jLHCOmiBYhcjfNjtPTjxhDIpaTLfdFaYtWLQFt6gMscEZXYsX
         d64sZbmWRMG+UjRHbgmUbPanLMFmY/WJmFwDVf+NEllF72C/AxvEvOjq8UyRw+UFEw7a
         uHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154916; x=1790759716;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eWPNdBRci+ilO56uoSaBVlNcIj5sRExNLvAX8TWjSSA=;
        b=RtE4IhcdGhDLR9vYwYurx+y9KrO4S0xwm0z2ZQ5FXiCDtkM3INx7QxZFmt6NbaJrgs
         2ESzwtgty5GlqXQZBW6fqEqkFFksifrU0FhBc8cbr4ie4WwFeUyOIDucn5UCrvgrvkf9
         ldSsae8vhI9tGwPRm2aE0jOOd4yXaX++HJhZ1Eyi4jjqkAA4fxBd3hM5/U/hattmBHFo
         Sct5mN+aEDj9nU63wvekqFQy3HfDXuP01SHbU6/taivcb6eBwzSI0+qY5pQHw9dGgipt
         MEgI5n8eaAkvud0dGpSSJuw1qU5G0s1V+e9wIeliBcToOyNuzuEIp3DUlOGnzEr7w1E7
         pNOw==
X-Forwarded-Encrypted: i=1; AKwUvBz+fPFfO3HE4B4TjdsFOlUXqxgJ82fIW9qErp9EW8yOKusd6fOrWMQx9/t7EiHlxwRx8AJaVGcXFiOE3W8PKU/B@lists.infradead.org
X-Gm-Message-State: AFuF++m7JIDqMic1wY/RwthGI0OBsqNJYi3cgMWuHWibMz6bVjrmXOUD
	kOdBS7kEVcN8ns3EGDt5wUQT2f64yqLmEyvB39qyaBD0OJ3EUNyu1OZNv7fDodPu28Y=
X-Gm-Gg: AYBFou02sh8UrS5GKIKb4rqVHCnVXtbrVqBUv+aVnoWS/4IgO2ICu5GajtHKfy3PqRK
	4j2ov8kzDkmx7RH2CYTJTFBuPAPvYMmoMu1Ut0UcFE9S1870Bf4i+6hGlzg+6Im/AEi3QC51xb/
	vE45x5mcnLTRo7+6rxhEe4fQeBSPipRwX3EprLDFwx9Xo6HmQdXMowsOtevn10hfszl8UtkBmFX
	K6ZaZmmkgYMqLH813RhlPRO7ldoBjX+x4DaWS33C1nOuXXEAZk/5po1b/hlYFD62KqGNThq4oyP
	uXNlzdT1uR3tj58p/Gu7+UnKwrXoMzEZOH8ta5DjuNHdzrYLrP33Qs6Cyks3Fosp1ZMYOS/1nAg
	k3k57qFqN6Ol5Vun5Uqtpg9D8F2LYtReayHRsaU1dBa3MfhbU1R2JYVcuzeSTQa9tEN+f8TEbb1
	ApJXuCA1tWKmw6yqywkF21Jp5+4NqLzaUnvMMAaSSVxhsAcm6GHZu473380qfu964lZttH7vyce
	oY=
X-Received: by 2002:a05:6402:4516:b0:6aa:734a:a082 with SMTP id 4fb4d7f45d1cf-6aab3b98705mr1736439a12.25.1790154916043;
        Wed, 23 Sep 2026 02:15:16 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab37478c9sm1181333a12.0.2026.09.23.02.15.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:15:15 -0700 (PDT)
Message-ID: <dfa8362e-0dad-4f23-9d2e-dde03cb5facc@linaro.org>
Date: Wed, 23 Sep 2026 10:15:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] arm64: Add BRBE support for
 bpf_get_branch_snapshot()
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Puranjay Mohan <puranjay12@gmail.com>
Cc: bpf@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Shuah Khan <shuah@kernel.org>,
 Breno Leitao <leitao@debian.org>, Ravi Bangoria <ravi.bangoria@amd.com>,
 Stephane Eranian <eranian@google.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Usama Arif
 <usama.arif@linux.dev>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20260810164622.1829843-1-puranjay@kernel.org>
 <CANk7y0ixo5a3Vfzj_HVhVHRNce2Rsit4pP27GCtXd4jHHzmiKg@mail.gmail.com>
 <CAEf4BzapC=7YM2QLMyKKfyOWGgBTfEJmPPN8e9Jf5xT9SutBTQ@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAEf4BzapC=7YM2QLMyKKfyOWGgBTfEJmPPN8e9Jf5xT9SutBTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_021519_042201_D07AF426 
X-CRM114-Status: GOOD (  21.79  )
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



On 22/09/2026 21:40, Andrii Nakryiko wrote:
> On Tue, Sep 1, 2026 at 6:45 AM Puranjay Mohan <puranjay12@gmail.com> wrote:
>>
>> Hi James,
>>
>> Can you review this version of the patchset? It is implementing what
>> we discussed in the thread on the last version.
>>
> 
> James, do you mind reviewing the patches again, seems like Puranjay
> went with the implementation you suggested, would be nice to review
> and ack, if it looks good to you.
> 
> Mark, Will, you guys seems to be designated as maintainers for
> drivers/perf/arm_brbe.c, can you please take a look and give your
> feedback as well? This is important and useful feature for newer arm64
> CPUs, it would be great to get access to this functionality that we
> had on x86-64 side for a long while now. Please help get this upstream
> or, if it's not in the right shape, guide Puranjay towards a better
> implementation. Thank you!
> 

LGTM, and the Sashiko review is good too. It does conflict with the 
FEAT_NMI patches on the list, and you'd have to disable NMIs but as it 
stands right now it's ok.

Reviewed-by: James Clark <james.clark@linaro.org>




