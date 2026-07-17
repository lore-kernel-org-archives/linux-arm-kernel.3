Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D4BC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 00:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/3wHfrhG8FmNFUVWyPEvhZctAHFHZYrAF6KnLEZZvCQ=; b=qrcAF7121SdFelUDU74goNkYO9
	cJ8tXAoUGP1uS7aQbnT5TRsmyrlewdr9fOaHmH+jJG/JSPVNsRy3CZ0LHK2aw/zX/iMLViAWYjYds
	JUReB4TLKqBNmUcHrezxBNQPveyxGtO1xgoTfvSD8kX6OZCB/YmJmYqDdJH7Svu7tyKTOW731659L
	69jrIL0pUCDKBofNFk2APlii1qn7p1YQiLMrbNh8agvP6oNvYXEj71R1aBq6uDybS5Pb/xjsI2AHp
	/oRsN3gK3/BTzPBJyngk9tDLPaK8/3dh46tdbmsTNZj33NK5BE4xH1+REYgUZSUbgR4dfNvF2br2C
	aLfILVlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkWrN-00000000rdy-0uAS;
	Fri, 17 Jul 2026 00:55:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkWrL-00000000rdV-26Wi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 00:55:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784249722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/3wHfrhG8FmNFUVWyPEvhZctAHFHZYrAF6KnLEZZvCQ=;
	b=XmINRbvzZ2Sp0frk+AzjiQnN8i5lS6gsTOZrs32so4qkzwzFFhY/DzrKagRTJV3OM0v0dx
	agZm/Xop8IPY/JDcxhn87jRm3DVDHy7gIViZTcnqIo3TTEl082VukfIdp/kXO+s2nkhcUO
	tlEg6vmCBeRIvptrn7UJ/E+2AGHzvfk=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-KF0e_TehP7qHxhysf30U_Q-1; Thu, 16 Jul 2026 20:55:20 -0400
X-MC-Unique: KF0e_TehP7qHxhysf30U_Q-1
X-Mimecast-MFC-AGG-ID: KF0e_TehP7qHxhysf30U_Q_1784249719
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c892143db7fso3603627a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 17:55:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784249719; x=1784854519;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/3wHfrhG8FmNFUVWyPEvhZctAHFHZYrAF6KnLEZZvCQ=;
        b=JJMR3XrXQQXoJ3OnVLLzzsmWDjcw362FFqELCcfYOxaNrCScYAKHq6zY3mNk/ZuWj5
         r+yjMpuJvBS1EBRz7TMLN4PLmac3MAHt4XT23Yj+TJSwADSV1A+VUgeYvzgWnyThJYNa
         VxX8VmRMM3YRXSvHD2pvD1Jzuts4wZLme/0i/fojFH5e3nD9NZRqNdQ/4+ftM208QScK
         4kEOeOpnXIvDKlwp180HA7c3O+eXvjSTrAYXuwOsz/TLrsDH2hWwuBQ8HZ4LeQFafG9Q
         fDl7mFDzXxQJ4fBWC3q5rdqSKQ8mEOYhGJeWlpMD0j1TH3pgxZNs6aQ3TXr31FVKRFpX
         avPQ==
X-Forwarded-Encrypted: i=1; AHgh+RqIYaK1QaKKygBolDvF1HPhEEfS2B6456gR1zLGlXGDhGlVUrP00DzEYmqIl8rS7Yw2ruW9CCPuKXBJY+AfwK2Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt/WeJE05sgizhX0GnjItN12BlUYzHQHRncXjWFstWx/hQZX8G
	/9BHrg6sMflLNye2/ykYkffEVc4Ix7JAzFsGMSZdqidnZgz3R5lcSvZnKRmETB/URERdZXeafpc
	s5uvz4r9iQTORw+ef0Eh/FMyKv+Gjh9OtjxcWIXtRQN173eXNO+rszoNG6vRhStBwRo/2BC+Amg
	zv
X-Gm-Gg: AfdE7ckNtd7Km+TOQre37IG3bY7HooiLl0Fh6MjKcYFxvVc5VvwJKSFb/6Q8KKvYSca
	k8hPoP02R6DiZJxlsNwgh/lvklP53NKoc6b9qRXAuG9jo4C9cFaBHW0aRvMPYb9dotec/G/7sCS
	CWsPKyedmla2qS1sxCko70YAke9v65rhqFsyuZBeg78zRdKlX+Ut3b2qOyVoFbk3lFl+JsltE8r
	LiXG4hrCc8Y3gP1pEo5tvEJmDsDuKwZE+pyZJtVdvjSWRX9l5OszAsyNGOzGOaSyTZVcD0hdVvL
	d9vwnW2ML/5IZzV+gIQToGs9rpVzttzhURxM7SfXF+WtHcjvtMfWOxyiPzRwZEDVHfaGJcSjhHo
	1hCYWjBbJDvGbvBdDPcPKupVtMeDZNEumTLZ+qYJbFeQ=
X-Received: by 2002:a05:6a20:4326:b0:3c3:76f7:d66a with SMTP id adf61e73a8af0-3c3ad665994mr318195637.13.1784249719187;
        Thu, 16 Jul 2026 17:55:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:4326:b0:3c3:76f7:d66a with SMTP id adf61e73a8af0-3c3ad665994mr318163637.13.1784249718707;
        Thu, 16 Jul 2026 17:55:18 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fdcb09sm793009eec.9.2026.07.16.17.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 17:55:18 -0700 (PDT)
Message-ID: <d4be3f80-c823-4438-b8f8-5348ae88e66f@redhat.com>
Date: Fri, 17 Jul 2026 10:55:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/11] arm_mpam: Initialize all of struct mon_read in
 mpam_restore_mbwu_state()
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260710115546.29644-1-ben.horgan@arm.com>
 <20260710115546.29644-8-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260710115546.29644-8-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SdPDHnJsVOUyhNg8JWqFWErkbgzk8oFC3pohiWinFls_1784249719
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_175523_623325_716C1911 
X-CRM114-Status: GOOD (  10.61  )
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

On 7/10/26 9:55 PM, Ben Horgan wrote:
> m->err may be read before initialization in __ris_msmon_read() when called
> from mpam_restore_mbwu_state().
> 
> Initialize the whole struct mon_read in mpam_restore_mbwu_state() and fix
> the spelling of mbwu in the name.
> 
> Fixes: 41e8a14950e1 ("arm_mpam: Track bandwidth counter state for power management")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


