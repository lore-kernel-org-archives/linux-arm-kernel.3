Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6270DCFD355
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 19:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1kHi++ZNMidWcUYlTrVTx3q+FjuKsJa/tn2+fCONh8=; b=vchGrsxHxYR4uJt+CACDUx5ABX
	/dbgW1lvKCKMnkZPoQnYLtAXv2iLTOHESmSsWWIlIHLrn9iw/9HH7rOQFD8Z5NukxdWl+SgYRuk7h
	b/+VUeEGJs8p0LrX1V4WtFiZsxyKIFj1O0T9bnPu+X5PTCqBncul/5n2YTxiFd/+rEWUzTWxPM/iA
	dh+UaP9Hpqs1/G/w5yBF//FL6d35EhlwIOun/u77XVb320gVz+5YRmITbfU/e7t6tTuKVC94cp2Wh
	/hjg10e7gnfPMWtStqO5fFhfznmWcHklV7/z1FmrG9wwrCxRBF63Ln5hz7+Cjercp+D/XoHvkQ9nQ
	URwn/5Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNcew-0000000CGr1-1QZc;
	Mon, 24 Nov 2025 19:55:38 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNceu-0000000CGqZ-20ag
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 19:55:37 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-59304084e17so649969e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 11:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764014134; x=1764618934; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1kHi++ZNMidWcUYlTrVTx3q+FjuKsJa/tn2+fCONh8=;
        b=ih2hpGhuYUk+PdD57yWAD9YByUNN1PTyzWCkrLepJt/iw627WoRiy49wNb9WIuUa/e
         T9WAO8WF4R8vXcNLqX+wxvz3JtoP8ntSJNMUfOT33h9lZBgqvd4mkNFSCpegyeR2XrEr
         gWOnV56Wpapj/+qwbn8rTNnUZcq6WeAhwRWAGHCLmP6Gyk9XN5QEhu5NzXb0GGLxxTsU
         qF662mjXvU/5MVZlpYIovcSI/6nNgM7RlVrDsn1IplnWb/5HppaIIYkLzoXdriPmISs0
         L26Y14XyygvB4WE/Dk/wHvSqPyDc3PWIVshxfZq9NcFJa9rdaMQBWrgWahfB6mZfBL6C
         oyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764014134; x=1764618934;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s1kHi++ZNMidWcUYlTrVTx3q+FjuKsJa/tn2+fCONh8=;
        b=Axwqii67B3tW0gFL2WPW5FpLwOWoow0jHw6kuk0qPm7TO8OXng7OE+HuUXtiH7jyKH
         dZxyO/DQBmHWk1vj0jU7zax5IO00/5uPss0+H1vfjjUAqQjJVI6Zs3aMcJdTCSU12Chf
         aA7LxxoWeL2YuDKEGjGQ1CI/tgvf/6sBzJuNraRkDbQ47TT8OEOE7kt2pA77qC19RJVs
         777JNWzs2SULA8gyw+yRFz40CCWkMorygXszUguKr89rjsP9UuNtuc9yKHvlBpzL5qBE
         8vErzr00hAeN7Eab4Lu96I1SGXExRoks/bYs4GtJ/fxfmEgePq00RH3x8Tkz/YzACicx
         DMgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVojgn8Q7MJvkanz5Hiw2MH0l/O+k/ssNxNYLciIYh2e0zChf1Q8UpNj7iA9vwsaKsjFRLziDOY3gUZ9mN63pHO@lists.infradead.org
X-Gm-Message-State: AOJu0Yyqrn2VXeNPPr0XMc//zVnPEIvos3knVQUiwNTRWzx+9SPtEPbg
	ej0eupbBsNi5HKSwzqk4R2KuiF7dnOneQE11vUQvzH4wLLvOFZ+z3nZ5adon71ej+uw=
X-Gm-Gg: ASbGnctVA7/p3UdK8DhTU+3bEsAaJR3oWShoekr5DtQ2JbdzfvOYl+usd4J7oaKQlpM
	H4ZmgHc5k6DpExWtCmMDKx1KfVueudXhvLonSNRjEGbshHjkKJGnRGN9bQzLucqPtRy0HJBsAgz
	AL/B78JYwzbRMGT25vfYiEvMtsidoU9mTj6QWD7Na95Sw7nRtdny61Trlcx53sSwmWxHH6CNHMg
	Hu51pGzP8E5hyx4yG9B/eENDjaZnsYhM1ytF9xPbr7XCt5EJUJOPoc3s9+xZj0ZMxyKyXBsh548
	+vUavcqhboZsyyR8+FtXTABKxCIdsf8lhK0U4HU00kvGl4SSOXG+frJV777dv8xGAKW/XXvS4Gb
	gOUgAu0VwkWn5PIGURWY5G27/Rk6Ged59KVSZ4sefkjbzBqeMSpmJ2pb9gOY6HYaN4+60NY2nuc
	jSFBLkPtQyoHDGAW/4iYs2EMhvQLDcJ76arR5S0uprIiy32NRN9Qe6OP4aXTJzlG5SKg==
X-Google-Smtp-Source: AGHT+IGftA4Sbl7SbaEW6aFFPJ2zH/lY6elgcX7aSCiKVohOvTSQTJmNIh0kVXSACBJSpj5m6pkvWQ==
X-Received: by 2002:a05:651c:3251:b0:37a:5ae5:a1d2 with SMTP id 38308e7fff4ca-37cd9254795mr18408431fa.5.1764014134295;
        Mon, 24 Nov 2025 11:55:34 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6b64091sm29578181fa.22.2025.11.24.11.55.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 11:55:33 -0800 (PST)
Message-ID: <4d347c15-a2fa-4b86-a5c3-c47ecbc804bf@linaro.org>
Date: Mon, 24 Nov 2025 21:54:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: cpufeature: Unrestrict ID_AA64MMFR1_EL1 bit
 assignments
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <20251124162955.3616314-1-vladimir.zapolskiy@linaro.org>
 <86ikezqq46.wl-maz@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <86ikezqq46.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_115536_552173_2D8F13A6 
X-CRM114-Status: GOOD (  22.01  )
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

Hi Marc.

On 11/24/25 19:47, Marc Zyngier wrote:
> On Mon, 24 Nov 2025 16:29:55 +0000,
> Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org> wrote:
>>
>> It appears that 4 out of 8 Qualcomm SM8450 SoC cores do not generate
>> an SError interrupt due to an External abort on a speculative read,
>> and it is reported as a failed sanity check on boot:
>>
>>      CPU features: SANITY CHECK: Unexpected variation in SYS_ID_AA64MMFR1_EL1. Boot CPU: 0x00000011212122, CPU4: 0x00000010212122
>>      CPU features: SANITY CHECK: Unexpected variation in SYS_ID_AA64MMFR1_EL1. Boot CPU: 0x00000011212122, CPU5: 0x0000001021212
>>      CPU features: SANITY CHECK: Unexpected variation in SYS_ID_AA64MMFR1_EL1. Boot CPU: 0x00000011212122, CPU6: 0x00000010212122
>>      CPU features: SANITY CHECK: Unexpected variation in SYS_ID_AA64MMFR1_EL1. Boot CPU: 0x00000011212122, CPU7: 0x00000010212122
>>
>> Due to the failed sanity check the kernel is marked as tainted in runtime:
>>
>>      Tainted: [S]=CPU_OUT_OF_SPEC
>>
>> Unrestrict the ID_AA64MMFR1_EL1 SpecSEI bits, since apparently it's
>> a supported option at least on this heterogeneous SoC.
> 
> Supporting asymmetric configurations has always been on the basis of
> having the same feature set. Just because some SoCs ignore this
> requirement doesn't make it acceptable.
> 
> Tainting the kernel is the right thing to do IMO, because that's an
> unexpected difference.
> 
> Additionally, making things non-strict may open a gaping hole in the
> virtualisation support. All you would need to do is boot on the CPUs
> that do not have SpecSEI, and bring up the CPUs that do have SpecSEI
> late, *after* you have started a VM. That VM will have been told that
> it cannot get a speculative SError, and yet will be able to run on
> CPUs that do.
> 

Thank you for the detailed explanation, perhaps the unveiled problem
on Qualcomm SM8450 SoC could not be nicely resolved in the software,
and I'm convinced that leaving the kernel in the tained state is the
best option, at least I can not imagine any better workaround.

-- 
Best wishes,
Vladimir

