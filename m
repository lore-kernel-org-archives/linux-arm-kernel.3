Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C90CA5FF4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 06:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U7wcPigaqRC6JM0r5LtbYtiW9wo9Ugj074EGL3sYK8Q=; b=EEEItoId3S+CAs3mGPD/Cxjstq
	clVbxXzOTtrxvfY36TeDVnyc5G3Zvj+tZsg1Jmxz0WZ6DFxnGf8F+C93J3dZE1lZee/LTGIGHsBb7
	adpmMt8so11AO5yv0xMt9Qfh3XCcQzPWMl08iq3qIRrx3ejxj//DfzvYxybnqgNH/PJlzJYxIc1Wa
	vDokeTmkBYz/mBu8itox29ByHWhwqM9vq9/Ii45+06C/iXvj0yldxt6GbmaWT4uun0aX1SCXTrhmh
	3CkiWb70Ib7loaW4vC0pCet+WUktu+m/MQaERoFXvzbJpcOiI61E1v8YoVjTDOFbtEa8u/O5tdYwe
	rDSqNMbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjCG-00000001RFQ-1NBA;
	Mon, 19 Jan 2026 06:57:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjCD-00000001RF4-2vV4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 06:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768805824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U7wcPigaqRC6JM0r5LtbYtiW9wo9Ugj074EGL3sYK8Q=;
	b=GuxQbyaFYL+8IfqPsUhHMniAba0LG78oGzK1HBeuN/uc8+4SB32XEPsqYDBACsdzVWAY7Y
	Fq0OEBeGbLM61PZGMWUyjUGkiqhj6VCden35cGP886QYn/239CpQiQOCxvdRiUg9zorRKE
	sDG+BMcS5t6zyU0xxJomq0rzz5QTwM4=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-p7C7yTonObm7m5fqxCVi-g-1; Mon, 19 Jan 2026 01:57:02 -0500
X-MC-Unique: p7C7yTonObm7m5fqxCVi-g-1
X-Mimecast-MFC-AGG-ID: p7C7yTonObm7m5fqxCVi-g_1768805821
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81f53036ac9so3031655b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 22:57:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768805821; x=1769410621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U7wcPigaqRC6JM0r5LtbYtiW9wo9Ugj074EGL3sYK8Q=;
        b=iGBFVVz+1+UbU2k0j46iAu7V6wjZ3x44XKJQGXLIspGF9+9U7EGia52cCIyR2MxwpK
         Fd+//HW0rx4RCo9HVRjQCpwH/pMNkpDiia+a3zORnCAu07cP9roxCsOlTJWoOHN0ggNB
         7HRBEMauRpLMK9lkKWSPIsa3Lv7g9dKDU0W00fqqeamTZKdRz0RrE1yRImc3tZ3zZ4Bb
         idQIG2JGPdLRiaAOtvM9wapt0i6rj12hZoPdrC5WBx2vX4vUODrZvTJP5Aph4lcFyrpI
         vzKdHFb+nvTvfPR7snSaVZMNN4ou7DA5C5e2nJOU49Gx7C5JM8NYZOM0aP4f+Rv17FLN
         xJ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVRqH1dubNvTikikZdaVjjEASY2QzqM7JlLMM2UnnRyBxlNOlt0Xp5GAJsd9ipYx83Mpu5NUUFHvK/0ar+0Aayq@lists.infradead.org
X-Gm-Message-State: AOJu0YzNcD/JU4fRJQDaBNfMNoOY8nvBUpUtjced0ZnbzOuEmcZQy5i8
	95BNUCEDxCo6VjJbU75wrSsqMjrZDmi2bv1CyWA3zR9P2Ezru8qDdd8usw3JZKsqZ7VHAfZZgef
	QFnppU8r9v4VvdcSZiLofM+WQ+K7QX1GD7zUKWl4V9fqUizo0+NCTrhuxIw0MVGfn0s/UXunsc2
	Me
X-Gm-Gg: AY/fxX4SNw9a24u9mJ9N4osoWFjlL4u/gf20owmf6gemqVL0oE6Hz9WdUhdnwxAujy5
	Xclu5SVMCBSN4Dbqyk4QT/5yjLEopqaI/jenJrCYAkFxhjAiU277X7Iiil3OTJ0ATfn/NSfcbXF
	hG2UzggFsiZffEMhhZwASHFUrZUZBsOtc1ss25PnOTIOFx5wSiN/H/SIkcWr6qNX5rwImzhzKkO
	ZIbxOJb6r4TLuE/hCmLCSMzEJcjaGNkhtRNavqeEorfJ1gwNyxtCLsqpHeSmlm6BkrbtFDOfP5M
	kEqpqpnB+6MacVz24Gkfa7YJNWk2WGQ15iSYI4wAzcE/z4pulkMxxCJ6v7w5nZXPYKayQXpngim
	7Bnn5xj8ToB0=
X-Received: by 2002:a05:6a00:600b:b0:81f:41c8:765a with SMTP id d2e1a72fcca58-81f9f68fbdfmr10063436b3a.4.1768805821388;
        Sun, 18 Jan 2026 22:57:01 -0800 (PST)
X-Received: by 2002:a05:6a00:600b:b0:81f:41c8:765a with SMTP id d2e1a72fcca58-81f9f68fbdfmr10063416b3a.4.1768805821075;
        Sun, 18 Jan 2026 22:57:01 -0800 (PST)
Received: from [10.72.112.128] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa108c4dbsm8361835b3a.5.2026.01.18.22.56.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 22:57:00 -0800 (PST)
Message-ID: <232cbeeb-1a8c-4b09-9e72-50fc544864b1@redhat.com>
Date: Mon, 19 Jan 2026 14:56:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/47] arm64: mpam: Add helpers to change a task or
 cpu's MPAM PARTID/PMG values
To: Catalin Marinas <catalin.marinas@arm.com>, Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, will@kernel.org,
 corbet@lwn.net, maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
 suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-12-ben.horgan@arm.com> <aWk8aZafbtXx5bPu@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <aWk8aZafbtXx5bPu@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _FhUB6pGm2JCoyqnqtRgHGVM6QrhSjqct8mSSzd9lH4_1768805821
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_225705_815062_1F838872 
X-CRM114-Status: UNSURE (   9.25  )
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

On 1/16/26 3:13 AM, Catalin Marinas wrote:
> On Mon, Jan 12, 2026 at 04:58:38PM +0000, Ben Horgan wrote:
>> +static inline void mpam_set_task_partid_pmg(struct task_struct *tsk,
>> +					    u16 partid_d, u16 partid_i,
>> +					    u8 pmg_d, u8 pmg_i)
>> +{
>> +#ifdef CONFIG_ARM64_MPAM
>> +	u64 regval = __mpam_regval(partid_d, partid_i, pmg_d, pmg_i);
>> +
>> +	WRITE_ONCE(task_thread_info(tsk)->mpam_partid_pmg, regval);
>> +#endif
>> +}
> 
> Isn't this function, together with mpam_thread_switch(), in an enclosing
> #ifdef already?
> 

I think Catalin is correct that this ifdef inside mpam_set_task_partid_pmg()
can be dropped.

>> +
>>   static inline void mpam_thread_switch(struct task_struct *tsk)
>>   {
>>   	u64 oldregval;
>> -- 
>> 2.43.0
>>

Thanks,
Gavin


