Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED210C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 13:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dxNdm96bKIoWq/16pYhKcq8ECSivtcVW8xJ/F+AWQTI=; b=je3Aj9hjR7iUzD3kiznjhLE4PY
	2dT58jl1YMHEb2qqIMWlx7DdY+d0498t1uDUti+LYqTSEM8ul4iE+OpIjbQQLX6FY1EoHm6k3cdZQ
	Vbd6bWTYFpTwe0HpGbpghjlU2uacUnEl9Vi3gF0P7M0rANzkz31v+xP5WVckOBTtYeY7TXledqgXG
	P2X0FAxBPVl01fIONj4nSS7Mvu0ff9t26ZkCBuSeBByNlzU07AOdyyj2WMczFARAhLhw45MKyWGQq
	9aqqBngmpcojScSn0z12K+bLJLsTRhPohAVGpl82DHlh4SP2x+c8y4vh7LTpq+rcmrlZG62OoLffR
	qDWRvMHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4IOE-0000000Bo47-1PAv;
	Wed, 09 Sep 2026 13:31:02 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4IO9-0000000Bo1h-2tIM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 13:31:00 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c25b661d37dso850356966b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 06:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788960656; x=1789565456; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dxNdm96bKIoWq/16pYhKcq8ECSivtcVW8xJ/F+AWQTI=;
        b=esbbHtkCPBNNN+kohxEd7GHx2LBzKcghOrTzJTXpO1ZAofepXcy9+K7IwLUunNBMB/
         MJB6BfKqQsuSGjGc1e4jpgJeYTBEjvUoqL2qbzcycJkyg4ddJlWb8AmVRjIpc9Q38Fy2
         XdoGxTWYoCKSl+AuLh2aT+kb8N/xYlsvO8XMWrN7+2uXbY82sYzTpU5qE/JAgbHNVoId
         woCe6MJ7z9cJurxa7DyyV1tuho1Ej4O+byUNEauOqD3WxeUeBYluE/CawoU45UgcIUiM
         S9GwlHiw68NNDp17bTdUVd/7pkbbKWCzyJq6ytXCmgVHE3bExqjeMVjghJbOa8NoUaNh
         buhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788960656; x=1789565456;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dxNdm96bKIoWq/16pYhKcq8ECSivtcVW8xJ/F+AWQTI=;
        b=XhAdMISDUVmr9YoQtxqHpQelUJpCDuBL39lVwKKsdWk61bzgf8XOU2Owb9f3fljwm1
         g4c+Z2CynUdrSSovqz7dCW6nfWvO4xAP7kVlE8wTmuVAINt+er5BxNqJtygLUS2MUcdb
         +iWbqpGCzeTTB83Jts1lxrJGi4txNvwhtp6I2PmXNSs/ZO4e1hfLgbwIJXr+hp5F5x6v
         SrVp3u7mJBIKybWpVDBZEWrwGKlaFAsQXYAR5hLHpwzLSfL6gytFhT6W5cQsj6Wp6JW3
         9ZQjRqaaEdArsyPhrc5omUIUSJMSP6J9chYS/XnHV5T37hDi5jrqYdHpOSSUNDDCSqiI
         4yoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwChDxgcpTkbotoKD1PNTuKVgQUBigWksQrWr+iXuC24GlDR+XqLsXK713JAAWVOwFKHjB6MNCDiROtBck0EWUt@lists.infradead.org
X-Gm-Message-State: AFuF++mUozvUCt//2xO6qlw70ZFijdmvTXgNZp46kOcUjD++V0/vpDJc
	qw+aVbIMqzIfZshn5ZALJA3Kad9AXCaNT0SnzEIKzT3KfgNBlA+c+DeO
X-Gm-Gg: AYBFou1H0wwBIwqjodAo2M8iGZmA4MqeQgTEm9xDauPtAOrMbsE7SnMCxBAuFzkdmjC
	tU5JNY3/8XyE0xvk8WlBgt8Wet+giFNDj9ZxvroHwm2pCu8lykOLjeJRNPFOHBWjPTRdlz/i3GH
	5DouZN2Uic45trqM2TuXzNx6Yc4yJmFo5nRHUb8lLiBf9oNrtj0kvn8m53/5SyndQH5c6IGQ6tt
	Y54WN5wXzsot6FEerefkcKPch+QH8EG6kVoZl5+4Z+XaFImv05rrUXC0JYjoucZ4YbKQEOUNMZa
	kZkrBTYmyRtauFKl+twe20j/eF8ZarMJbZQux+a5Rw1BwVBvB2JchTmSbI+5mroC3jHcEbXf7b2
	tMKg6z4t62ngip0jEBlSkKUmDl8E2w/3dPcZdVfG/BoM8Ns86gk1H4nSTp8kCiNRFgL9dg4VQrH
	/EPX6++XKDUQB6+dGWYbw3yne/gmKR+3H0/5/k+iRg4iLPW8yUl4A/9YIe3ZHElvxkqg==
X-Received: by 2002:a17:907:1c18:b0:c16:4e5:944a with SMTP id a640c23a62f3a-c260ca241admr1431773366b.21.1788960655994;
        Wed, 09 Sep 2026 06:30:55 -0700 (PDT)
Received: from localhost ([45.112.44.120])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26e956ea81sm568148766b.33.2026.09.09.06.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:30:55 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Wed, 9 Sep 2026 21:29:14 +0800
To: sashiko-reviews@lists.linux.dev
Cc: Baoquan He <baoquan.he@linux.dev>, 
	Sourabh Jain <sourabhjain@linux.ibm.com>, Dave Young <ruirui.yang@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, open list <linux-kernel@vger.kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Mike Rapoport <rppt@kernel.org>, kexec@lists.infradead.org
Subject: Re: [PATCH v5 3/9] crash_dump: Disallow writing to dm-crypt configfs
 during kexec_file_load syscall
Message-ID: <aqFe50U0bp4dguMT@Rk>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
 <20260909003657.1570544-4-coiby.xu@gmail.com>
 <20260909004722.649E21F00A3A@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260909004722.649E21F00A3A@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_063057_786321_929DD4A4 
X-CRM114-Status: GOOD (  17.08  )
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

On Wed, Sep 09, 2026 at 12:47:21AM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
>New issues:
>- [High] Severe locking imbalance in `crash_load_dm_crypt_keys()` leads to a leaked mutex on the error path and unlocking an unacquired mutex on the success path.

Thanks for catching this issue! I'll address it in new version.

>
>Pre-existing issues:
>- [High] Premature and unconditional reset of `is_dm_key_reused` to false breaks ARM64/LoongArch kexec load retries and defeats intended cleanup logic.
>--
>
>commit a9405cf8948ba39213612c61a1f3b10b23f437e4
>Author: Coiby Xu <coiby.xu@gmail.com>
>
>crash_dump: Disallow writing to dm-crypt configfs during kexec_file_load syscall
>
>This commit prevents concurrent writes to the configfs group during the
>kexec_file_load syscall by utilizing config_keys_subsys.su_mutex. It aims to
>avoid buffer overflows, stale keys, or memory leaks caused by changes to
>dm-crypt keys during iteration.
>
>> diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
>> index 3a416933979f8..580534d43b66e 100644
>> --- a/kernel/crash_dump_dm_crypt.c
>> +++ b/kernel/crash_dump_dm_crypt.c
>
>[ ... ]
>
>> @@ -478,6 +490,9 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>>  		"Loaded dm crypt keys to kexec_buffer bufsz=0x%lx memsz=0x%lx\n",
>>  		kbuf.bufsz, kbuf.memsz);
>>
>> +unlock:
>> +	mutex_unlock(&config_keys_subsys.su_mutex);
>> +
>
>[Severity: High]
>Looking at crash_load_dm_crypt_keys(), if kexec_add_buffer() fails earlier
>in the function, it jumps to the out label, bypassing this unlock label.
>Does this leak the config_keys_subsys.su_mutex if the lock was acquired?
>
>Also, on the success path, mutex_unlock() is executed unconditionally. If
>is_dm_key_reused was true at the top of the function, the mutex was never
>acquired. Can this cause a kernel panic or corruption by unlocking an
>unacquired mutex?
>
>>  out:
>> -	return r;
>> +	is_dm_key_reused = false;
>> +	return r;
>>  }
>
>[Severity: High]
>This is a pre-existing issue, but since the error and success paths
>unconditionally reset is_dm_key_reused to false here, does this break
>architectures like ARM64 that might retry segment loading?
>
>If load_other_segments() retries the load sequence, the second pass
>through crash_load_dm_crypt_keys() will see is_dm_key_reused as false,
>find zero keys, and silently load nothing into the kdump kernel.
>
>Additionally, crash_dm_crypt_cleanup() checks !is_dm_key_reused to determine
>whether it should free keys_header. Since the flag is unconditionally cleared
>here first, does this defeat the intended cleanup protection logic?
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20260909003657.1570544-1-coiby.xu@gmail.com?part=3

-- 
Best regards,
Coiby

