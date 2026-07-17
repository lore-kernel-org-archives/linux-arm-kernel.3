Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DC0C44512
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 00:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBnKDSvOueTAUhAzYLfByVoitz0I+gaL8EouTfwU7Tk=; b=b+C68UR8HEL+gVpluLUJHp0/IJ
	it3V5PIK+6i8BieGqzjioRKcnXzg10Ar6F4PMnqm1+RZvFhtyh/4D9JDAoiUEUDJXQLAmayrVAjnu
	a6rHzPImcCD2vsN9gu+mARWCZg0DYhWyLn4fVdMdFYHOKzs14ml520fKD1mpDHQTqSdcDhRWqZMgp
	3Ts2qj97kWvGMoUvjBNK9gIldvPRBnW+M0tnipbYvx1SA++t9iTyoO1sqr6+bNC5/Wj+aZfQRYEn1
	Jkb8XqSmMmxvma7nQkBtKOUIXcu1sdEPIOVY+LTPuiN4If8Pbvf+9SIZOGGzm5soWJaQ073mMp5rF
	4T0tIuYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkWpw-00000000rVV-46yo;
	Fri, 17 Jul 2026 00:53:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkWpv-00000000rUx-0IEu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 00:53:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784249634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YBnKDSvOueTAUhAzYLfByVoitz0I+gaL8EouTfwU7Tk=;
	b=BdQ275wXjkVg1BID34rjKhCQEkDfUolx/VNOfucrVDJZgPe3WGMOfu7AqZ/LfAT7MWhHVY
	P2DpsCs/jO+n7wladExWy+sS/CFxZXW9hwtpuL3rO+jZFc/oJd5RPg8lVZOd7+jyoI/Hlo
	9kmNrDAVxhYArADDzFTBaUhdrkTYSAw=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-qzZrkTjXNI2F1RA1cK9JXw-1; Thu, 16 Jul 2026 20:53:52 -0400
X-MC-Unique: qzZrkTjXNI2F1RA1cK9JXw-1
X-Mimecast-MFC-AGG-ID: qzZrkTjXNI2F1RA1cK9JXw_1784249632
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so3251964a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 17:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784249632; x=1784854432;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YBnKDSvOueTAUhAzYLfByVoitz0I+gaL8EouTfwU7Tk=;
        b=ib5+1slbnVhRQexCyZZ0VusG/61NVc2C7Lhl2qT7tDEfpX/3Px8igZ0UnV77R6XsLy
         zEHDbBhNeFzGlxPuZSYH5L4RWGvLNXdTDv0HUE/YROYPFLM1zZ6uVHkUxNOT32pMi9kQ
         EwVtsb7/yYQlTM7EMalU8mmnZLlpBTEvh3WR7ncBsj/ttm7wmE1gFGSV61ScFHaPwmHU
         TZaXYfCv2w9f3sBo/WHqQuRaHSatE/p9IiIitmFU1j/oCFJS3wumWmd+cFm29JunKQMD
         5O59lW1zkMaqINf/0Q4i4bPQLF3p2y1PwkimSNua3Goc70gR7eBOsgXIDOANBN83DSk3
         DR3Q==
X-Forwarded-Encrypted: i=1; AHgh+RqLP/T8tlk4S1WmwebffMQMnO3N7VRDAYDHrF8chbOLpP9uSBrkwoCygDqSsZpJ4qC0w6zAW+3k9c+HP7dM8Gyp@lists.infradead.org
X-Gm-Message-State: AOJu0YyvViIawhDa/x4xhSmO72DRP+vfIXhvCNbIaCdm67zUoYTuuGFY
	B/JSvIq3rCfFJrK/HQauPivRUyuAVnnEl+yRB+dkRECT33RHmA5kyJ6i6+e1nuNE0pQ/lGpfczO
	8PrN+d9kpu06M4efB3n6Whbik9q2VgXr0X+XrJFqnCsnqcWGyzrn7Tmf5crNl9i3lp3/tajVX8W
	Od
X-Gm-Gg: AfdE7ckKQ2BFI8mIuON6vs75Hg6ENWABNzUCgWfIa98NW6K2YkBf6DolghZfmXGQs6d
	THpv7B2EWl1YNWpimHhmslV0NMtW1hk42kzD+JVGpsW51efEeukleM/47KdBusxxEfkY4Kz4J0d
	YXFQ0uJkrmoId4/oDTuy+UqL5jIyVmbNLBYp1wNbDtchFbiaodVx6lpm7ldUW/bzR+5yjcHlT2t
	yqE2R3BfW+BFKBeymb/IsmzuMOnyS5K8fxUij8PL8Dgzbizn1CJHZjAx+Tevr+C1EFo+ROtWace
	r0sKh0YcBGxvxldCJzqOmQSZbRTHn8Lo4t7qSPCPWfjnhdmAskQp8XMknHIB7ESCixFzpnhn6mZ
	JDBIxFROTQBh+y/1vZeVHzBvGtCqROamtKi0H4W2v3A0=
X-Received: by 2002:a05:6a21:1404:b0:3c3:76a8:c0f with SMTP id adf61e73a8af0-3c3ad665b6fmr322303637.4.1784249631579;
        Thu, 16 Jul 2026 17:53:51 -0700 (PDT)
X-Received: by 2002:a05:6a21:1404:b0:3c3:76a8:c0f with SMTP id adf61e73a8af0-3c3ad665b6fmr322270637.4.1784249631085;
        Thu, 16 Jul 2026 17:53:51 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cdc4accf4sm6125716c88.10.2026.07.16.17.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 17:53:50 -0700 (PDT)
Message-ID: <98303800-ff10-4bef-ab2e-7f48b0f6584f@redhat.com>
Date: Fri, 17 Jul 2026 10:53:44 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/11] arm_mpam: Add missing mon_sel locking in MBWU
 restore
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260710115546.29644-1-ben.horgan@arm.com>
 <20260710115546.29644-5-ben.horgan@arm.com>
 <8e7f992c-db87-4b79-8d92-d9a44295a0a6@redhat.com>
 <33654cc4-9b36-4255-b761-3249174a97d9@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <33654cc4-9b36-4255-b761-3249174a97d9@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SoHRDgEAhmtZmhHxm47Hbvwuj3O-B8JYSaY-6c8ar_0_1784249632
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_175355_179551_B65797C0 
X-CRM114-Status: GOOD (  17.37  )
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

Hi Ben,

On 7/16/26 7:31 PM, Ben Horgan wrote:
> On 7/16/26 05:29, Gavin Shan wrote:
>> On 7/10/26 9:55 PM, Ben Horgan wrote:
>>> The mon_sel_lock is used to protect the mbwu_state, as well as h/w accesses
>>> that use MPAMCFG_MON_SEL. However, in mpam_restore_mbwu_state() mbwu_state
>>> is accessed without holding the mon_sel_lock.
>>>
>>> Add the missing locking.
>>>
>>> Fixes: 41e8a14950e1 ("arm_mpam: Track bandwidth counter state for power management")
>>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>>> ---
>>>    drivers/resctrl/mpam_devices.c | 8 ++++++++
>>>    1 file changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>>> index 11b10c3bc334..b34e2a368516 100644
>>> --- a/drivers/resctrl/mpam_devices.c
>>> +++ b/drivers/resctrl/mpam_devices.c
>>> @@ -1648,16 +1648,24 @@ static int mpam_restore_mbwu_state(void *_ris)
>>>        u64 val;
>>>        struct mon_read mwbu_arg;
>>>        struct mpam_msc_ris *ris = _ris;
>>> +    struct mpam_msc *msc = ris->vmsc->msc;
>>>        struct mpam_class *class = ris->vmsc->comp->class;
>>>          for (i = 0; i < ris->props.num_mbwu_mon; i++) {
>>> +        if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
>>> +            return -EIO;
>>> +
>>
>> The code can be simplified by avoiding the unnecessary nested conditional statement,
>> something like below:
>>
>>          if (!ris->mbwu_state[i].enabled) {
>>              mpam_mon_sel_unlock(msc);
>>              continue;
>>          }
>>
>>          mwbu_arg.ris = ris;
>>                  mwbu_arg.ctx = &ris->mbwu_state[i].cfg;
>>          mwbu_arg.type = mpam_msmon_choose_counter(class);
>>          mwbu_arg.val = &val;
>>
>>                  mpam_mon_sel_unlock(msc);
>>
>>                  __ris_msmon_read(&mwbu_arg);
>>
>>>            if (ris->mbwu_state[i].enabled) {
>>>                mwbu_arg.ris = ris;
>>>                mwbu_arg.ctx = &ris->mbwu_state[i].cfg;
>>>                mwbu_arg.type = mpam_msmon_choose_counter(class);
>>>                mwbu_arg.val = &val;
>>>    +            mpam_mon_sel_unlock(msc);
>>> +
>>>                __ris_msmon_read(&mwbu_arg);
>>> +        } else {
>>> +            mpam_mon_sel_unlock(msc);
>>>            }
>>>        }
>>>    
> 
> Ok. I think it will be clearer what's best here once Andre's error propagation in his MPAM-Fb series
> has crystalized.
> 

Yeah, we can clean this up after that.

> Thanks,
> 
> Ben
> 

Thanks,
Gavin


