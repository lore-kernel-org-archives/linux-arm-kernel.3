Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A9DC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 03:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rd+7vAfqiUBzcRKGEyy2nh9xcJ8M+Wgk6xnmdZSE0Jo=; b=adiMYX6u780h5npgaZ7v/YCgai
	FaFBh7eYiLRrPf6kpj9yj6LMN6m39SzOlFXDs4qZyAYRbJN4S3EO88xmJF6ojaR1kEmnRZgm1cJDy
	I3fggA2RKi0fTcsc5iD7puVArWyaZHEW2ytMTK7xKE9ouo8g+jdaxuPU4HM591J6PkjhonTcrjW0c
	gCMfdhBFIo6jSk8Yx/AiLnj0DxxUJuHKD5OIiSUyuncXhisWXzgvF9MAhz7S5iczq7qnDjgRGExii
	wzPapTs2Meni5bGQEQtq4LWUsJxdRAgF+63wlO9TDcTsiDREoPqCsNAZLVInpOOtW0vGr67QYKkTl
	B3jyXN3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr631-00000000wYa-27mw;
	Tue, 04 Aug 2026 03:42:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr62x-00000000wXX-0nBZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 03:42:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785814950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rd+7vAfqiUBzcRKGEyy2nh9xcJ8M+Wgk6xnmdZSE0Jo=;
	b=KJv8tynGk/iHShX0pguT2TvEllW7EOcZuYUBKKfiYNn3j6xvIeJdEUJ8bJeRK7VHc8pGvL
	GKP6VZYyXzclLj5zmEWIDIrEljHdZNrcTPNZ9Vc6qtamvWqonTaLslyaVbqnSpcC4G90zl
	7Z71CgplIxAQi6BGsSODIg08H7P1c1o=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-7LleLowuOquFZqqvkQP6Og-1; Mon, 03 Aug 2026 23:42:26 -0400
X-MC-Unique: 7LleLowuOquFZqqvkQP6Og-1
X-Mimecast-MFC-AGG-ID: 7LleLowuOquFZqqvkQP6Og_1785814946
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e0234967aso3499079b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 20:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785814946; x=1786419746;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rd+7vAfqiUBzcRKGEyy2nh9xcJ8M+Wgk6xnmdZSE0Jo=;
        b=hyUTB8CmhTqJGu1AruF7g47O2V6WKgWjWmAo00NvxRf3fvm/58g8FUuyFm8O9emdfS
         fWjTJs7ZmJknT+PrnFqZRw+kmayvnL9A9Ji+xyObuvSV7M8ewbMRaK6KovRnQD90z/Yl
         3mnMlnP36v8R0uF2Xdudm81LYcpqUTjY+Ue6Fr39NXPp5Nxln2tt0kEqDlysGx2V1gOl
         P4SsAFcioZiPpZrkfa4HKDhR7cZWh9yPoPvmSgGStm/nFVVasRv2jZLd58JdMfXP1Fjn
         hiWOMSX+XbCya5SRBEnuBoMJoYg23KaN5edsKvXM1huLz7Uy7K1XA21Qri7WfYl9O10Q
         PLlw==
X-Forwarded-Encrypted: i=1; AHgh+RpdNnbLWeg5wD+VoyMAc0wa1VtrC+H+YbWqWx6hA8TamK9THXZH7O/00N7+ACQ6DyXCO9qjepNpKHqucjBUEpRa@lists.infradead.org
X-Gm-Message-State: AOJu0Yx95Ljp9EVK2kTMM0cOVwLaXfGWLv7VtyBA/kOXpGp1hXKS7Q7L
	ra98XFhWAyWZ6cKMvj+1PW7S36raib0jRtjVrWxFeOu6YArh9j2Tf8nZ8wgfN2XauHKlXiGiZ3k
	jAJp4erqpFPJ3bOnJA2lYK59EuGQXmXeowXh5gh165t73Wl1qp7gPCskbetRnd+aRchFxTZp/zo
	Lq
X-Gm-Gg: AR+sD13hC+UIUta6x+oaXcAM6+L5fkleDhHTBnA29QtLiDQ9AitLPyGQ/kp4JOoYIEf
	8YghnQw0NgzLrP46K7C7MRw8P2PpWbCjqJnyc2G5FxX73qgzG8onR07Om/eVJ5dpgZuBqK41Ns/
	fc8Hb4+kNpje7Zi80MUzAEL2lv/EArUnV6qFuxOudG0SO8kg+jIigej8wWdjlUzMcc5IYzCvI5d
	HRQmZP6VwDatlmyp8Ng2V34FcykQkj3N64lKimBHF/5zpM5djVbcx4RgNXwfhnDTwJv8owLBhNe
	tyh4c9QKBtdoxOezd43usNI8BQOjJ7ETbuVaVQYtKFFyt4EtFGMe4oIDRxWac2B3Q1d/pnTraOb
	m2jJ/ADkhwG39Dc1I0PbagcgOVTa84ZNXLGmzaNJ/RA4=
X-Received: by 2002:a05:6a20:734c:b0:3bf:6d96:ac40 with SMTP id adf61e73a8af0-3c92a5a8071mr12890693637.12.1785814945792;
        Mon, 03 Aug 2026 20:42:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:734c:b0:3bf:6d96:ac40 with SMTP id adf61e73a8af0-3c92a5a8071mr12890658637.12.1785814945289;
        Mon, 03 Aug 2026 20:42:25 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04506csm46284807eec.17.2026.08.03.20.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 20:42:24 -0700 (PDT)
Message-ID: <26bb2daa-555f-437f-99bc-b92080bec9d1@redhat.com>
Date: Tue, 4 Aug 2026 13:42:14 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/11] arm_mpam: propagate MSC access errors for
 hw_probe functions
To: Andre Przywara <andre.przywara@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 Ritwick Sharma <ritwick.sharma@arm.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260731170324.2927758-1-andre.przywara@arm.com>
 <20260731170324.2927758-3-andre.przywara@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260731170324.2927758-3-andre.przywara@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ofeiSfyvw5z70lS-7j1J0x7-DUvAryIf1Pq4r-ra4wE_1785814946
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_204231_302656_DCDA72A5 
X-CRM114-Status: GOOD (  11.68  )
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

On 8/1/26 3:03 AM, Andre Przywara wrote:
> Allow the functions probing for MSC hardware and features to return an
> error, and propagate read and write errors from the lower level up.
> This uses some "scoped cleanup" functions like scoped_guard() and
> ACQUIRE() to avoid the complexity of error handling when a lock has been
> taken. Since the mon_sel_lock is a bit special (even more so in an
> upcoming patch), we define a new GUARD type for it.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c  | 126 +++++++++++++++++++++-----------
>   drivers/resctrl/mpam_internal.h |   4 +
>   2 files changed, 87 insertions(+), 43 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


