Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0520C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 13:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wQbDye0Ug6lK7AwcUFZhsBEDnI1W9xjGfK//bEWCpeM=; b=33OhXOHHkfCByw8Yn8uf1LkMqk
	7+nuPHoN49yviH/mZ16ODf+vSZvAjZI3Z016E3Yg3megTYbJzvfHG22Go5XQcHmYOyrWqzM05PEfb
	BQoxjvrdwnrKIyGlMRy21GHLG87FGXlcLVG0VELx8pK+SZ1Yig8PP/TBy7Wei9aMvQgMcdOs1pTpv
	H3e5LmgJd8Y3/zo+inpAqA+ytIfYKpA+cDOLbHJx+CIhpEMgeqlWv+rKDBbXNmsZRkTamXkyBRtWo
	MVnqshTHlm7I2PtTgnRwbquhGWJnXfVy/ohvVic/ltGClGV30xaHRgWZ3l1+J49d40/cRbXj4tHLD
	SZ2CoNdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ISU-0000000Bore-2o7n;
	Wed, 09 Sep 2026 13:35:26 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ISQ-0000000BopM-2Ec7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 13:35:25 +0000
Received: by mail-yx2-x10.google.com with SMTP id 00721157ae682-85d46e4cdcdso12047627b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 06:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788960921; x=1789565721; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wQbDye0Ug6lK7AwcUFZhsBEDnI1W9xjGfK//bEWCpeM=;
        b=Wfks5BZyjRTcJVBuY3t0+DXMu83C1Dw5lrK8dwoXfDx7LAFVaQbh1hnY+w0Z5dHYe/
         /jBaYQnpp3+uy/bx2bPbw7rtXpovH3+IEtgFQ98dzqJUU6d/eTt0d9q01w0O/K1vladw
         x4DUzm8EUdzYnwRyfkyDpNlCFmT96/LqG2BuchxApoLhqVdqACi1yVP/qFYxBsaUlPmr
         TQRjATklZbt4M2olHneTnPtLIqKnU0d8NfOw4eZRMJXNLRLHSrbHFEERonCHgGftxnjb
         01CTkHl1PzjFHr1eBLvjOlr2aVnA3QoojV8QwUW7VSWqoRhUpzcXkxJboAVRGnvzxxCG
         OJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788960921; x=1789565721;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQbDye0Ug6lK7AwcUFZhsBEDnI1W9xjGfK//bEWCpeM=;
        b=OIqOSDDD0HrbPU6slbuKXmHEqOvQhd3IU4oVn6vr+zXnQE2Zo71uhXf04ZWk4karUV
         EnNwa0hc1ueSzvbG54KGVsFRb2byhjgUpvjxJi+37gABklLFiEj27kizQDL7HVhJJ8p7
         /qXl3tbsRuIG68oURxpxuxXAUn7noVItwy/8f+WYFn8JmZgwT8P90OfsGCdbggC8OXHq
         DfavOFlejsoekHDv5xwegobnXUq5JGF9rc7jy8Hrc/rxqwK7blAp7XqrdQYtQPRTaGgT
         CjFN6e3tVHh2AH4ft3pfEL/mzmjpDtM2AjhFkI2Lewlcy6KdQwzRHoyy0bP1yAjtB2xv
         Q67Q==
X-Forwarded-Encrypted: i=1; AKwUvBx2Xl+6tsSR7JU3PK5qjULZL6FmtYhS5EXzchKty//5h1c0n4BjJFGY0uVMZWYDe5gc8WTsEuwjaX4gCPe6VikN@lists.infradead.org
X-Gm-Message-State: AFuF++lB7ayIBYWdOM3LPVWgfmrxeC6BUaSctRyAPH4+7nipzO5Zd7h0
	CDkghoc/4FlG3YrajZiTnn0VA1a6H2RNJeL5AzOFcH36o83YZ7RkD2Mw
X-Gm-Gg: AYBFou0RNmkW1y2pfnJV+MWSjIB3fHFbZf9YR1dbUrqt3s3yrHDBwHlL647l52nnZ7N
	N0l7SBzCE8Sfqpfmj+ZPwA0sXbhimP5n5Pl/srQ/wU2MrrTVSTTAPna0pyCsO31yr0Crq+Ch6kS
	UuwM+uJiDAeua62uBaBaKHFcxTDT0olBkmA20V6JMQkY+3zMJUlJZGzcANmw9K3VIp7eIZ68ySH
	M1S7okTAz/oQcLqYWVE2IBZPD9w1lSdHh5KUm6TGR/2k6Aa1QWzvB2s8+Lum61wct0fyu7YVeBL
	oXlSss64SpTxBxv5cH2BwhQOWwzf6kL0dATRnuvjx/GGkXqKTaqwAG1mjPb340nhXibAU6BOBMH
	LSbBBnUXceSiYUWZU6B2Uck+UttB0+7oVHxxsXR+ZL3wLm8jF3BF1EABkpgMDDU9q0bYWL7xfFv
	0pLOczx7WM9Wh5RPtbP60pJ+yWTKmOwRiAvF2kTxXGqV1szrn95lLr9m4cs8T7tUNXQQ==
X-Received: by 2002:a05:690c:650c:b0:85b:35f6:bc5d with SMTP id 00721157ae682-87f23fe7a98mr29962947b3.13.1788960920937;
        Wed, 09 Sep 2026 06:35:20 -0700 (PDT)
Received: from localhost ([45.112.44.120])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714c0e5c6fsm111191177b3.48.2026.09.09.06.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:35:20 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Wed, 9 Sep 2026 21:34:58 +0800
To: Randy Dunlap <rdunlap@infradead.org>
Cc: kexec@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, 
	Sourabh Jain <sourabhjain@linux.ibm.com>, Baoquan He <baoquan.he@linux.dev>, 
	Dave Young <ruirui.yang@linux.dev>, Pratyush Yadav <pratyush@kernel.org>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, "Rob Herring (Arm)" <robh@kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 9/9] Documentation: kdump: Add arm64 and ppc64le to
 encrypted dump target support list
Message-ID: <aqFgNFBdwoS2okjR@Rk>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
 <20260909003657.1570544-10-coiby.xu@gmail.com>
 <83b9fd96-d0dc-4ced-97cd-287c82cdacbe@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <83b9fd96-d0dc-4ced-97cd-287c82cdacbe@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_063523_709679_10DE46E3 
X-CRM114-Status: GOOD (  16.58  )
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

On Tue, Sep 08, 2026 at 10:48:11PM -0700, Randy Dunlap wrote:
>
>
>On 9/8/26 5:36 PM, Coiby Xu wrote:
>> The encrypted dump target support is now extended to arm64 and ppc64le.
>>
>> Fixes: e3a84be1ec2f ("arm64,ppc64le/kdump: pass dm-crypt keys to kdump kernel")
>> Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>> ---
>>  Documentation/admin-guide/kdump/kdump.rst | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
>> index 0bf2eb100a05..36ad6125c670 100644
>> --- a/Documentation/admin-guide/kdump/kdump.rst
>> +++ b/Documentation/admin-guide/kdump/kdump.rst
>> @@ -572,8 +572,8 @@ Write the dump file to encrypted disk volume
>>  ============================================
>>
>>  CONFIG_CRASH_DM_CRYPT can be enabled to support saving the dump file to an
>> -encrypted disk volume (only x86_64 supported for now). User space can interact
>> -with /sys/kernel/config/crash_dm_crypt_keys for setup,
>> +encrypted disk volume (only x86_64, arm64, ppc64le supported for now). User
>> +space can interact with /sys/kernel/config/crash_dm_crypt_keys for setup,
>
>                                                                  for setup.

I'll apply the suggestion, thanks!

[...]

-- 
Best regards,
Coiby

