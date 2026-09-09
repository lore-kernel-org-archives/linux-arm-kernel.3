Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D25C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 13:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IF7gGSnNHvzeRxMeQJEXPfnNoiV1RgOi8xQaXNAluos=; b=3g77xY77a/hWJYr3MeyEVEGwYy
	URzZ1bop6BrWqbv0k/Zg6jtK+ApJ4dycMs2Tr4Vs1HeKmzNOBxoi8gz2z05B11W7Dhn7/E6n3Wy6u
	eRJUj5AIzKa86m8j7GUvonZr837OsLlEe7yCh8norjoAHJsbV072+BJMBlUHaWMzUtADArn35bpOa
	fE7WlZuL4i6xjJMaX8jpY/GScAPj99Ut/5PZ7q9mv75VhwPumO7DEq4YpMA4GqSr3h4571CXGcFU8
	dmrsCBldce/W08pV3o+s3OYvsLE98lm79AAG8DZACmSKAPJpO/yIdTFROdWnYrsAm80TrdyZxAoGC
	sHE6hyRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ISO-0000000Boo4-1HG1;
	Wed, 09 Sep 2026 13:35:20 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ISL-0000000Bomi-2Cqw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 13:35:18 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-85a50f6a7f7so81657757b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 06:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788960916; x=1789565716; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IF7gGSnNHvzeRxMeQJEXPfnNoiV1RgOi8xQaXNAluos=;
        b=LstI6DJvNaCspImSb/CHQJWSVOlh3BXKFA2HXXQQuHply0IUjQmPlS5wL52Q8u14xv
         ncaMdvihtuLK20jUjP33WgzpDAB2j1x3iMjrL26e+m9W/m8h2vU7xUJz6QwQ24WrL8ow
         Nu6vnVJtzbev+lRXtkbukd1DatAhvwyXzyLeNQm8CCydI3e/s+Tbin1mVKfc2hJy9Lmh
         MxQaLdwCQO+qGRe5i5hw7Zfsns1B8ppoPj8RAnTBJ6yt3tMr4t5pm+hYgW7wGuJlK8tE
         B4JBpV5LmmyKdebgqeNM/cUpyPvbee0InD1ZDzk6efPaCSlksSjvehDRtXM3xNcD9DuO
         ngEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788960916; x=1789565716;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IF7gGSnNHvzeRxMeQJEXPfnNoiV1RgOi8xQaXNAluos=;
        b=Rk3J7oY8D3Y86hRcl+ss5qpFwzx4lRsSG5ISiGzvFleS/4mROQWXu7oYawTd08jJhR
         ns9RVWYIk44FulszC3MRQNGFRTuDWtEtu4koiXZNjrl38ppraXwfupNNm3VKF2Phd+42
         xXtsD06dP64r/3lFhJVU8T1yEdHP+p/7Qj26uyco30V9rP4wJ46GtuXwfxUljmz0w//r
         r3xqJu85C2sk4xl2o1kiyBGVQiU5jgqQ+oXz51NAD0qaiW33+sDPnszSw+Cy1kqi67EB
         S5mQMQpK8LoUly99o9DuqPwhsBr0X2qnNp+kHV+5Xc0G+Sso8D1No7ASnsYycTwF/yF7
         zPhw==
X-Forwarded-Encrypted: i=1; AKwUvBwR3PLWzOsF/+j2PDZKS8TeC9enxs2hFJsW5GGvSr5bKQ8uE337I5K+XBNVIMrkXuzMUK5r7++EvGNabDtaqXjG@lists.infradead.org
X-Gm-Message-State: AFuF++muxGnYdHYyXlmgktXLPWAuPARmrYZHtm5ucXKzWknQGDqdbQHk
	6wO4x4HAL+k2Q9XUkeeooKJ+t+/KNZ1q1eA3BJdbjk7DtZE0Mi64PXLP
X-Gm-Gg: AYBFou0MQn/Ih+RIM7phDobwsxPFcwQuFYEdMAIRV0UzHS4dEkXg7mNGdCP4GPmIHF+
	t8nZlQiecICRpa/UkahY6GsWmGmoEHUIYTwhEe6p3vstgD8wkkOM/WVBAMqMH45Xa6yCChq5jaF
	5+1iesgc6Vo/dfyFdNARtyVZFmfvnmROBG3zn/YyENBYA1U/bVHrYinyyBWDBsZ3AIpCJzuF3th
	5Jmi+fEh8qcxW+ko98p2xSAgbke+WF42AVXcUfr83oG72pTfWKQwCj10EnCXrVGr7FJ9RAqVZ7Y
	IbVJoS8n6j6d0bDTveKA70QBcI7vxiFDgzdQh1vV1ktPsZeOKMfc7qve6kScTTNtvGs4yrqO6KM
	L1UgYIgSPrjjdciPjN2EP7A98bbgPYcN7HXIoYASA5kAeJFcYhcfPGxqhEVmyAJxt8fBujnKwml
	6cLkXELj24LH2K3iYS8fyd9Jy+7b/dxw6VDIuXDpAUIBrRZgeSQuEdLG7b4u7o1/pEgQ==
X-Received: by 2002:a05:690c:ed6:b0:816:b469:cd12 with SMTP id 00721157ae682-87122f5564bmr131074277b3.8.1788960916082;
        Wed, 09 Sep 2026 06:35:16 -0700 (PDT)
Received: from localhost ([45.112.44.120])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-881575de059sm2427287b3.18.2026.09.09.06.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:35:15 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Wed, 9 Sep 2026 21:33:02 +0800
To: Randy Dunlap <rdunlap@infradead.org>
Cc: kexec@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, 
	Sourabh Jain <sourabhjain@linux.ibm.com>, Baoquan He <baoquan.he@linux.dev>, 
	Dave Young <ruirui.yang@linux.dev>, Pratyush Yadav <pratyush@kernel.org>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 8/9] crash_dump: Disallow
 configfs/crash_dm_crypt_key/reuse if crash hotplug supported
Message-ID: <aqFfvCpcrbN-8qcs@Rk>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
 <20260909003657.1570544-9-coiby.xu@gmail.com>
 <c0d5f2e9-9bd1-46fb-8111-d3af6b6c9e66@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <c0d5f2e9-9bd1-46fb-8111-d3af6b6c9e66@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_063517_591008_5C0256F6 
X-CRM114-Status: GOOD (  19.28  )
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

On Tue, Sep 08, 2026 at 10:46:03PM -0700, Randy Dunlap wrote:
>
>
>On 9/8/26 5:36 PM, Coiby Xu wrote:
>> If crash hotplug is supported, dm-crypt keys saved to reserved memory
>> will be taken care of automatically. Thus it doesn't make sense to use
>> configfs/crash_dm_crypt_key/reuse. Not reserving
>> image->dm_crypt_keys_addr makes it implicitly to disallow using this
>> API. Currently x86_64 and ppc64le have implemented crash hotplug
>> feature.
>>
>> Also update the doc accordingly. Note two doc issues are fixed as well.
>>
>> Fixes: 9ebfa8dcaea7 ("crash_dump: reuse saved dm crypt keys for CPU/memory hot-plugging")
>> Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>> ---
>>  Documentation/admin-guide/kdump/kdump.rst | 16 ++++++++++------
>>  kernel/crash_dump_dm_crypt.c              | 12 ++++++++----
>>  2 files changed, 18 insertions(+), 10 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
>> index 7587caadbae1..0bf2eb100a05 100644
>> --- a/Documentation/admin-guide/kdump/kdump.rst
>> +++ b/Documentation/admin-guide/kdump/kdump.rst
>> @@ -577,9 +577,10 @@ with /sys/kernel/config/crash_dm_crypt_keys for setup,
>>
>>  1. Tell the first kernel what logon keys are needed to unlock the disk volumes,
>>      # Add key #1
>> -    mkdir /sys/kernel/config/crash_dm_crypt_keys/7d26b7b4-e342-4d2d-b660-7426b0996720
>> +    VOL1_UUID=7d26b7b4-e342-4d2d-b660-7426b0996720
>> +    mkdir /sys/kernel/config/crash_dm_crypt_keys/$VOL1_UUID
>>      # Add key #1's description
>> -    echo cryptsetup:7d26b7b4-e342-4d2d-b660-7426b0996720 > /sys/kernel/config/crash_dm_crypt_keys/description
>> +    echo cryptsetup:$VOL1_UUID > /sys/kernel/config/crash_dm_crypt_keys/$VOL1_UUID/description
>>
>>      # how many keys do we have now?
>>      cat /sys/kernel/config/crash_dm_crypt_keys/count
>> @@ -591,15 +592,18 @@ with /sys/kernel/config/crash_dm_crypt_keys for setup,
>>      cat /sys/kernel/config/crash_dm_crypt_keys/count
>>      2
>>
>> -    # To support CPU/memory hot-plugging, reuse keys already saved to reserved
>> -    # memory
>> -    echo true > /sys/kernel/config/crash_dm_crypt_key/reuse
>> -
>>  2. Load the dump-capture kernel
>>
>>  3. After the dump-capture kerne get booted, restore the keys to user keyring
>
>                             kernel is booted,

Thanks for catching this typo! I'll apply your suggestion to next
version!

[...]

-- 
Best regards,
Coiby

