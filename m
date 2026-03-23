Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3825AFC72C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 06:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NKbSNz1bnQPVRgBTucbuG+mAtDWNAO0AjF15TWaqka0=; b=uYhNJnmGJVyqHRLKWrzhFWrCui
	yirmtoBCh1ipSp3bU82hKkilvS2lTjLATgbi8ETzZmJVyESnBPJjmCax/5XqoX2krvkb/ndwNhwen
	gFRckXkL2dug+c2njb9ZlkfKs8aJzZo5rmbFYP8MtQ3YegtXkpNXlO6xyYM2yIGpMP0Gn4ql5PsC+
	k5rz6L6ZAJIyczX2f/jXZt6J+i7e9UEWb2pvyeolKBCrvBOoRE7RrhUnIpxGcAF4mpJAbxaumuJpP
	IYJEW7z8OBnorRZlju8M1o91LFgkAFPrMEOjOipUCmQ1iWlINY/zeqtFjlVyhUQ7O8hKv9KQ0Q3TM
	/nEPKaFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Z9A-0000000G9C2-34k9;
	Mon, 23 Mar 2026 06:52:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Z97-0000000G9BE-1fyr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 06:52:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774248736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NKbSNz1bnQPVRgBTucbuG+mAtDWNAO0AjF15TWaqka0=;
	b=V/nJVevjj0DjRhK5QX2jhgyM3dwptn26kG3yo2eeALJKzdaaknNAHEepA0RaZ95qqO9C2x
	A5uBRHFknoOX1FZo2IIP7TjHKcdOLO7Nqj1zCbT5Edh8kuDHKa9CH/FMBia05Ba+4xUv5I
	8xPhoicGPRgVDEN+qs1r9QzcfByo8gE=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-XaMd0g95Pb-JSY3tueIkfw-1; Mon, 23 Mar 2026 02:52:15 -0400
X-MC-Unique: XaMd0g95Pb-JSY3tueIkfw-1
X-Mimecast-MFC-AGG-ID: XaMd0g95Pb-JSY3tueIkfw_1774248734
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8297d261a67so1878811b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 23:52:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774248734; x=1774853534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NKbSNz1bnQPVRgBTucbuG+mAtDWNAO0AjF15TWaqka0=;
        b=ID3aO4cqpJG55b9oIbtrWdm5Mao9cPpX74S6joxqLHrD4FuFB+q5z0OTVuYzmpljWs
         yGTPTMgExf7qh51qED0/9kOdjSjWmuXgAsyNGRH2fqn5CP6Kjgk+E/s/gh6QTCx7ebVz
         8ssHzC/KzdkZCh61iLIfMCMdTd+9VSFQul9edMEMhu2fK2O9vZCguat+Itq0nxJsxwS/
         IOWhcRWu9Bh31IjFQ1iL9CJjLo6me7kSHzvC6Ayc9BEaf5Vf7i9pF0lDrZEgg5yTKNXo
         zZnA6DqDP6IcHsz2544PdaU2m3wM/SGhYqLbLJwTc7fjCKAetj3vDhDiRYXnczHpJiiP
         S1Mg==
X-Forwarded-Encrypted: i=1; AJvYcCXQeN4qham7Ren3GCqccQIUm3f4JG2yJ7TX/GOXI88wB7ya1p2cuQ3v9XkGVgjZlNNIuMCQQDHAy0tpXAT0J86f@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0g+DegE+gUTv1/i94WGlLcvrWw4c13ScQ+waEA+WEwr8zgbVF
	kn5I4zZdVrTtXeG2cud7U+RyjHasFwzuIeYmS/+/LEXTQNyA7UltEWTpPm3Eiioh91d5HQxLxJ1
	w/RXtNZmSeSD7DLeqJJoTN3RXNg7PW9iZbW+BJOL8IhQj6geJc3cKPp2dWiXXc7GJTP1pInZAom
	mM
X-Gm-Gg: ATEYQzyKrNGYolEXy5AuE8idIQRullSXEvBXo5UEeGGxLk6BN54uH2XT7SgYdBPoChV
	5JXl2x+pSRxRJL3ePdiRBVQSsSn+Z0JpZE2cBKPa6cZHFte9m93RAXfRimPVE7XYrn/ihLm3pbV
	QEphxDmVvf6tp589sInQ7ka/dYw/1UdmmkXUazXm9xcUtZqKz0xGh+EJfPUYK0V6v/38TqbmL8q
	PXXKNz4m8oFXSh71Q/kzUIzHd03cVY0ByYXa+Uv93A/Ey0uTAeb60X/ZFERtrjs8MND7pz5sArc
	D+FlnypcmEygwHmWG2BFtfGZCh+0pswSIaDHEG78YaI3/4jiPUqSB/sb4ji+enBkiKPB0hkhaRk
	jJUcLX1M6G88TuPmKiuSKa59bF5QlY2GXPKJvhbDQgmemEi3ajllYTKKfvBvO1Gh+
X-Received: by 2002:a05:6a00:23d6:b0:82a:14aa:795f with SMTP id d2e1a72fcca58-82a8c35da6amr9132144b3a.35.1774248733769;
        Sun, 22 Mar 2026 23:52:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:23d6:b0:82a:14aa:795f with SMTP id d2e1a72fcca58-82a8c35da6amr9132130b3a.35.1774248733349;
        Sun, 22 Mar 2026 23:52:13 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bbebbfsm9997455b3a.18.2026.03.22.23.51.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 23:52:12 -0700 (PDT)
Message-ID: <98e46fa1-8e33-4288-9894-e1756da113e2@redhat.com>
Date: Mon, 23 Mar 2026 16:51:56 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 18/40] arm_mpam: resctrl: Implement helpers to update
 configuration
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-19-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-19-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DGGe-NHrRajZfdM1mJwgbTdwJlzHhfltyTN_oopDcXU_1774248734
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_235217_546871_A67FF7BD 
X-CRM114-Status: GOOD (  16.65  )
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

On 3/14/26 12:45 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> resctrl has two helpers for updating the configuration.
> resctrl_arch_update_one() updates a single value, and is used by the
> software-controller to apply feedback to the bandwidth controls, it has to
> be called on one of the CPUs in the resctrl:domain.
> 
> resctrl_arch_update_domains() copies multiple staged configurations, it can
> be called from anywhere.
> 
> Both helpers should update any changes to the underlying hardware.
> 
> Implement resctrl_arch_update_domains() to use
> resctrl_arch_update_one(). Neither need to be called on a specific CPU as
> the mpam driver will send IPIs as needed.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since rfc:
> list_for_each_entry -> list_for_each_entry_rcu
> return 0
> Restrict scope of local variables
> 
> Changes since v2:
> whitespace fix
> ---
>   drivers/resctrl/mpam_resctrl.c | 70 ++++++++++++++++++++++++++++++++++
>   1 file changed, 70 insertions(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


