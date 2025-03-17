Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12160C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 11:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDzJ2VOAzEbHd4YJavbMDLDdsevX9sVYERz7dfOZXGw=; b=fuezpOH2xZQlRGmtBxTgdjKsNr
	jE3Zr6HzEMGJlzzZcifGlIDkCuL8J6ej9rrnpH8Tdx2eYJFp0cCAX/5QIO/GduSu1/b1FRY1YohCD
	g1kw6pbGgohvcYc9IPKlgBNwwxTVPRzi6U5xRQiiAzlgfkquGT1pN4tzkVB1sYomt+Lr4pLoz0lvd
	fv2E9kpRy28BwtE1XDWCbSjGKyPvVq0Cu1ByTbgW0JCbxJ5SewnNOv/8J/TARlvu6Cx+BrHxsdKdn
	r8KRSM8cAOw91RVQwmeob1v7jnQXrHoJw1Bm6TFmm/IyVsNdYEW6KSCCax3bacN3dQ5wI1dI6hV1r
	AF9SRSEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu8Re-00000002MHK-12Om;
	Mon, 17 Mar 2025 11:15:46 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu8N5-00000002LOi-25T6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 11:11:07 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso12232055e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 04:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742209862; x=1742814662; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eDzJ2VOAzEbHd4YJavbMDLDdsevX9sVYERz7dfOZXGw=;
        b=OQv1EdpIeelh319NlAdzBYUdmQB2v6sEUBG7E4U8aXNAznfJneMLAuyqhcE/xeuJ3f
         FjCDq63lHQNGJ6TnrLs94jOnSiec6Eup3+fmVdfiyV7QBce/WR5RtyjiWeSfKqDoPyUx
         jbF2Ef4Jan1WaDTg5DGQ1CcJQUmLqV+lTqclgeX6l7Yc74FNOupHolM2egIlxEcq64ZS
         +LPNbT7XHavf6SGDEoFATrqw80vW3NiMovj77ks7IwLnuWKhs6z0UHcEyJBfcu88ekiA
         ybI0VOdGeaH0L5VOZLydeQuy1xANGaGaAbnw8Xj05ZKAK1ew59Go9q4osisf74bb4Ifr
         qzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742209862; x=1742814662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eDzJ2VOAzEbHd4YJavbMDLDdsevX9sVYERz7dfOZXGw=;
        b=LXlzXZl+Gsaz31E9GO4ZH+WKzjjNqUZK7+XUKDj3CkPMWvgi9s9bRTR1kvbHBfBrFx
         SaLd1BjfL48dMSlj5iC2Z/GFaI4bdW/Wq6/LgD1wM5sn7D/FTx+u1PPYF8xjtBr+6akg
         VV/OO6950nI+aJwPbiHLRr6SPWg5cnQiBMycCttsg953QydgsqHstYDrp5j4nxJa34IX
         UwjUoKYZTuJxu68GPXvmB/olM94CqunopFRILjprlvO/OANa4UPlg4/58bQCFBL7C+ft
         K27MdzArQImKlXFkf2/q1fTWiD/uSzT08g+NC3b6pkevfFazBFYSwizBdLlNSDnCNHvx
         LVFg==
X-Gm-Message-State: AOJu0Yw56HeNF6uMvUHgPcDCdco4J+V3Ev2BAqMhDbpJdQEV9WvYOhUJ
	sLnhFQsRSKVdj2qT0bNDktUQdqTVulSGid0+xVil0ktDpcokr3YdqWG3qPcXAbQ=
X-Gm-Gg: ASbGncuDlFlvHBjyfUHvRIPQkvYTPD3O7hj5MHOoT/Xzlhnv+eHkngFqynah9Br80Ee
	CxZsS7uHr7Aaz4JaCkqEmbJndyoLT0Vj/ijTn9dEtpsp5lpAKid+r23dNsMBnUVdpo5ohgkM3J8
	5WNjQZVUUb71PsClmtd4TCMq/thgUQkTz+VuA9zFc0OBQjXU62NKoEUQUNNd5cuCq2hwwZjqhQ1
	j3WdKevRe2TBObFh+GlteFaBmg4be/b5oYaGKasMUQz72QbS7eLS0SRL4CJ2LDk7dbUXHsfFdON
	LCA/GFPX0gm1fRbRs01FAYSwW1cGBplG6XUT+66DXFSJYJbALhKUKA==
X-Google-Smtp-Source: AGHT+IE03/gw38YLSXA2yKf2gnc0bYqatqbU69Cuyezj6/XGCnmhURjlT9yMf7Kvkxg1rjJbu9xTyQ==
X-Received: by 2002:a05:600c:4ed2:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-43d1f1d2bb6mr120674475e9.3.1742209861923;
        Mon, 17 Mar 2025 04:11:01 -0700 (PDT)
Received: from [192.168.1.247] ([145.224.67.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe294b5sm102277455e9.21.2025.03.17.04.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 04:11:01 -0700 (PDT)
Message-ID: <4cfcb9d8-3187-4ed7-8951-d54d781b4bd9@linaro.org>
Date: Mon, 17 Mar 2025 11:11:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64/sysreg: Sort sysreg by encoding
To: Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, robh@kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
References: <20250115162600.2153226-1-james.clark@linaro.org>
 <20250115162600.2153226-4-james.clark@linaro.org>
 <20250313215840.GC8101@willie-the-truck>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250313215840.GC8101@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_041103_555770_CF5108D2 
X-CRM114-Status: GOOD (  19.78  )
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



On 13/03/2025 9:58 pm, Will Deacon wrote:
> On Wed, Jan 15, 2025 at 04:25:57PM +0000, James Clark wrote:
>> It's mostly been sorted by sysreg encoding, but not 100%. Sort it so
>> new entries can be added without wondering where to put them.
>>
>> The following python script was used to sort, keeping the top level
>> SysregFields and comments next to their current Sysreg entries by
>> splitting on "EndSysreg":
>>
>>    # cat arch/arm64/tools/sysreg | python3 sort.py > sorted-sysreg
>>    import sys, re
>>    def key(block):
>>            reg = r"\w+\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)"
>>            match = re.search(reg, block)
>>            sort_val = ''.join(f"{int(n):02d}" for n in match.groups())
>>            return (sort_val, block)
>>    sysreg = sys.stdin.read().split("\nEndSysreg\n")[:-1]
>>    sysreg = sorted(sysreg, key=key)
>>    print("\nEndSysreg\n".join(sysreg) + "\nEndSysreg")
>>
>> Tested by diffing sorted outputs:
>>
>>    $ diff <(sort arch/arm64/include/generated/asm/sysreg-defs.h)  \
>>           <(sort before-sysreg-defs.h) -s
>>
>>    Files /dev/fd/63 and /dev/fd/62 are identical
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   arch/arm64/tools/sysreg | 1006 +++++++++++++++++++--------------------
>>   1 file changed, 503 insertions(+), 503 deletions(-)
> 
> This looks like unnecessary pain for backporting...
> 
> What do we gain from sorting this?
> 
> Will

It's from the discussion here [1]. But yeah backporting wasn't mentioned 
as a possible issue, it's something to think about.

The summary is:

  * I added one out of order because it wasn't obvious from the unsorted
    file that they were supposed to be in order
  * To avoid more of the same review comments and save time I wanted to
    put a "keep this file sorted" comment
  * But the comment wasn't ok because the file wasn't already sorted, so
    we ended up with sorting it

To be fair adding a "keep it sorted" comment is a bit awkward because 
there are sometimes multiple places you can insert something if it's not 
already fully sorted.

[1]: 
https://lore.kernel.org/all/996c7843-7f51-49a0-9122-e688e37f9902@sirena.org.uk/


