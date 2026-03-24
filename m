Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4F6F532CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 03:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XblcNM6KU7hXW8KSNBudspXcLZs2xKbcalCmzhtiVUo=; b=A2ySGo+vtEuUBgg3PSoMqD6mvu
	U+W4NuYGJneJe0lgz5WiCayzZXkLcR2B8SEGpcCZ3W5h7YcZhFXbAiRlk8+fw2dP3rGamD1m7J+bj
	OUCtw37j1VVw9ShXXFNiRcCeilUsp2pVfjHj2bRdDEOC2f7hv2X9wqlToZp+LSCCOamDGRLW0aXMu
	LVKdUbOvGN8L5iSk94lHRNtplsehPO+QvGvnz1ms7jgy43DyFa2NUZOBYsi5h6aTc0ecsmUtQuNA2
	q0TlodYTRo173YI7ijmEcry7bXAMB/1G2X04sJiDEXjrcxyiFO2wqbPTJqBUEJPD3A39N78PClPe9
	M07eLiRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4sdD-00000000UkW-3T0U;
	Tue, 24 Mar 2026 03:40:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4sdB-00000000Uk9-22AN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 03:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774323636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XblcNM6KU7hXW8KSNBudspXcLZs2xKbcalCmzhtiVUo=;
	b=KzagikAoZeXaAXClYZRt/tW4dO0sJYLwUIRklwvl6XpsCqKFkuDa7yb8I6buHd8AxM+W7M
	M20NNN0EBWxO+Q1lbuxTCYBhzHZdmXl3qOC1U9lg1NaurCHTqplpbtuKGVJbB2m0vkBUj8
	jVe7xMP3W232w6LplzM9gii58c+xr+8=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-v65oK6heNUSIlvI8b6YO5Q-1; Mon, 23 Mar 2026 23:40:33 -0400
X-MC-Unique: v65oK6heNUSIlvI8b6YO5Q-1
X-Mimecast-MFC-AGG-ID: v65oK6heNUSIlvI8b6YO5Q_1774323633
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c6e24ee93a6so3835915a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 20:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774323633; x=1774928433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XblcNM6KU7hXW8KSNBudspXcLZs2xKbcalCmzhtiVUo=;
        b=StiiOg7sf7kY7vts63qTQBrioSWS2Rd4vu/OhovcUpL3roAHktO3LasXdcQPQM/+vB
         K6eZidWbYOx+EDv+9GKBzgMaP6EB+4mAGxBSFTTSKssYUqUkRrcjvKQu1QoeXCMnoWEV
         DN7DBuoP1hcJOQ2zHA3ev5o/Nt7W0qxoMpawm7akJcJ255sUzigWAJWj8IwV8AuDg1Hl
         0chZsw2Z5ES9riC+mMUT2iz/QHLvDyUg63xGc+Duc0GeQMtphrHBNwmj5HXT+4h7/1hp
         xeabUWfpHwY/Yb/ijlWfJEujtL7EWr7CG09Zbrm+sCnLcOo5xz4MF1ZiI7693DM2b3Qs
         3b4w==
X-Forwarded-Encrypted: i=1; AJvYcCXH3LhUiqNMOE/MIT5F4/2H06mhXezazfA7WkNB2pDBBro7oVG3niMcdAnjpx8hQKNv0yPA0pe69zZkqZnZDygk@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl8vlU0VJVbU9CIajFnJiQHbsoCP5WPgkFlyIfjPwTWHAC8c45
	4arpRuwU3DxQDjKNRp1WCRMKbHGnPxkGIlXSZU3x5kp0pLc88mOxUZbEy4bNNWv+B/oYwu3ffld
	vPRBN3cfTAGt4FWkP31jGYyO5ftUawfXGdUC+yWD2HMW7+HFXYHecAXZsxNnRSUtX78C3l5yOm+
	gg
X-Gm-Gg: ATEYQzyVDt38mCa2gD0RzkAvvlH2uUDWJ1skVK/cN3beUOrKUf1WV6RaQuZ3L1LWKAU
	BfbQYfQFCt/wiwRIhaGbCNIMmzTRrqYAcp/LNadL1INRYDchzHONgT4CRToUpL44mtDMNUrgZ+u
	sLH5VGZV0nec9Vk3XqDSqNPfaGSll8+vvHbs28TzYdjOfduTMZ2ldxFEoKvki+QcwL//CS5r1aV
	Q2IvU1PcbjV0EroJufnXxhrbWoaBFhjFWFK1WLlJdl8jK378FT8yl4Skv5uqhCCFeLy2c7LzaPe
	b3vw/FZuVDC+Vias4K8h2RLmuAYpVou5VYTEVuCSXaEdTdxl/mEktqrNPrkvtbetS6ZAC0C+tfx
	+WkJG0ayml8VpIZfL/tx5lDyCmTDwljM07fLmVbKaTarAKVwS7jOJLXYE+7oxULJo
X-Received: by 2002:a17:902:e847:b0:2b0:5306:5f20 with SMTP id d9443c01a7336-2b0a4e16ca1mr16086255ad.18.1774323632617;
        Mon, 23 Mar 2026 20:40:32 -0700 (PDT)
X-Received: by 2002:a17:902:e847:b0:2b0:5306:5f20 with SMTP id d9443c01a7336-2b0a4e16ca1mr16086135ad.18.1774323632220;
        Mon, 23 Mar 2026 20:40:32 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c443sm162024795ad.56.2026.03.23.20.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 20:40:31 -0700 (PDT)
Message-ID: <2825ca38-44c5-4649-8a1c-40cf98905c44@redhat.com>
Date: Tue, 24 Mar 2026 13:40:17 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 27/40] arm_mpam: resctrl: Add monitor initialisation
 and domain boilerplate
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
 zengheng4@huawei.com, linux-doc@vger.kernel.org
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-28-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-28-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wLD8ztf4KeJvsVHkO3TgPzkoigPpbs6YOk-m-5Uso-4_1774323633
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_204037_658712_64B2F693 
X-CRM114-Status: GOOD (  17.14  )
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

On 3/14/26 12:46 AM, Ben Horgan wrote:
> Add the boilerplate that tells resctrl about the mpam monitors that are
> available. resctrl expects all (non-telemetry) monitors to be on the L3 and
> so advertise them there and invent an L3 resctrl resource if required. The
> L3 cache itself has to exist as the cache ids are used as the domain
> ids.
> 
> Bring the resctrl monitor domains online and offline based on the cpus
> they contain.
> 
> Support for specific monitor types is left to later.
> 
> Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> New patch but mostly moved from the existing patches to
> separate the monitors from the controls and the boilerplate
> from the specific counters.
> Use l3->mon_capable in resctrl_arch_mon_capable() as
> resctrl_enable_mon_event() now returns a bool.
> 
> Changes since v5:
> Use r->mon_capable instead of resctrl_arch_mon_capable() as specific
> to the resource
> Comment line wrap
> Include offline_ctrl_domain cleanup from controls boilerplate patch
> Include any_mon_comp finding and
> Halve num_rmid when cdp_enabled
> Move mpam_resctrl_get_mon_domain_from_cpu() from boilerplate patch
> ---
>   drivers/resctrl/mpam_internal.h |  15 +++
>   drivers/resctrl/mpam_resctrl.c  | 231 ++++++++++++++++++++++++++++++--
>   2 files changed, 235 insertions(+), 11 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


