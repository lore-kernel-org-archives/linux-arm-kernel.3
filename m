Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E1AC55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 03:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWuE3aPXJBBk1sgCezb0nxhHgt0/Tjj+1abOM/7n6xE=; b=qi+Lhuamc5oYu9qx86oZ31z1Gw
	5F5FcFUusOQbJUmgMRBZPkPNVkftO7/Na+DIPR1zs9NHCEQVvLfi1zfGBOmTmdtA5x1o0soCZQXU/
	7BUN/dUMlnDXb/H5Lqssnivy5kA/Iy8vaMCNcBD0lZPFnu2CDPKDMYcUsFMruOOfCwe1X5BbHo4Og
	mRhzYghbmIgg6gzFV02ek+cqJ12xwW3dnq8sKHOi0C8y1bpJBae83HH0g+yc9Yeq8xMJg/7hRbzF5
	ffUmKH6AjpiHSWcRAkcluJrZwgFOm2wBZdYzLi/zBuZjoZ8rYKBhMoQJHmbQyCl3sp1Z0LO1fOTGV
	R5+YfoTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr6Iu-00000000xsQ-3i0h;
	Tue, 04 Aug 2026 03:59:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr6Is-00000000xs0-0Qef
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 03:58:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785815937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hWuE3aPXJBBk1sgCezb0nxhHgt0/Tjj+1abOM/7n6xE=;
	b=b1RjuQOhKq15BSD0qxfBNCCtiALo+7oTeFgRNSTywGFfUB/C/yE0qC9qCMpuEd5IOCnB8s
	gqdMYKrnqXk9uTkRALKSMagxU58xiReMW3XsKD+cYicLrLhu4aYiROcplrygHUHHDR3BHd
	N/8Mm7/HuOU7SL7rMvfRzW//+uu3UjE=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-82qYY5r0MKCzcanGkyx1HA-1; Mon, 03 Aug 2026 23:58:51 -0400
X-MC-Unique: 82qYY5r0MKCzcanGkyx1HA-1
X-Mimecast-MFC-AGG-ID: 82qYY5r0MKCzcanGkyx1HA_1785815930
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848860def2cso4903269b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 20:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785815930; x=1786420730;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hWuE3aPXJBBk1sgCezb0nxhHgt0/Tjj+1abOM/7n6xE=;
        b=NLilzST/vphfBIlpUXekomsfW3pnAADlgEGo8Tzzd1DcrzWfh7TB6ytgwN/0PPC4PW
         ElrrVzkzcnnbXWV4S/bnsvkahdv/vfNvJ4Q6kSpgvth7H+Qlk0YsbtSuuXryvdRTEQeV
         U2eyI5DhQDLrtXWWE98tglrEg+U34bvRMtj5C9RPfAAqgmePwHf/g5fnA5PRraiM9i15
         s/d1rxhaOY20YmWTukPuSf4ZefLoHt988E/WToVjoqXguRuv+u65q9nnt7oA43e/iU+h
         upOAL14LBH9UsivLK4tKv/2qg1uqKWjku8hlwjpZBX9Q0yp1Xt1u3TRc2JNmZklZqiQt
         pxHQ==
X-Forwarded-Encrypted: i=1; AHgh+RpYrsx5dYHuwOXKfirk6Tdm5zVLDFHRKktPU5v2Hm4Gz5Djikq3CH3UAjcFBSr7OkIoCOyljCnTZYLNEY6Uu0qh@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1any39kt9+5khu7s79wn68oL4wKZ12rAbik3qjp2ts1pnqmAP
	Uk2U0lakqcjFuRgZ7/nwQ38vhqSOgw8L19b9u9JQ2/tscqTm5psFhHJiM4x2KOZ2u2fvfM+j/zc
	9JAqUILEASgi/N1xx8ypW7cz/3Xh9x4nkxp2G62g9vkI4O37/FGlFHkOnrMRadwhocf08SA1CTE
	uzXi8O3HEb
X-Gm-Gg: AR+sD12przD3Dp6B0KaAqld0Wm6NaJTAdKyT58YPCIKO+pNB/YFPvpFQNYj+woiSZqM
	CuMTTSGMhSYDr7mezBdomBN0Io1OeOosiUa13+n8VHs08kea8QERGL+OqJX8AQQ+bA53Q/MOvVt
	B9L1fxN8sIui2NbSeVcY0juIOowC9gDLkW+ODkeFv82i1KRerxYKrhH94MMvQMxtFLNvccXYvMc
	2arXqsHF2+uLrBY4py1XEUz+jwTAUQNzHwl5DXoMHzpJgmWysZswgpE1RNX/MMFmN1y4r43YvvF
	Ni+0shP1aB7jyjW18hEmDbFT5WpBlMfJYQlLBROTxvLhwv5LvtGHhN/lmX52uWbHqjezZsnUsU+
	8ejwo3dHLdXze9werzEo/AsFER7ZzsdXKv9rTbSvw1bc=
X-Received: by 2002:a05:6a00:3a14:b0:845:eb88:3d74 with SMTP id d2e1a72fcca58-84ee486504amr11053443b3a.29.1785815930005;
        Mon, 03 Aug 2026 20:58:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a14:b0:845:eb88:3d74 with SMTP id d2e1a72fcca58-84ee486504amr11053411b3a.29.1785815929416;
        Mon, 03 Aug 2026 20:58:49 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc29c73bsm4431143b3a.29.2026.08.03.20.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 20:58:48 -0700 (PDT)
Message-ID: <e7ff32a5-6fd9-45c9-807d-363c645d937b@redhat.com>
Date: Tue, 4 Aug 2026 13:58:37 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/11] arm_mpam: prepare mon_sel locking for MPAM-Fb
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
 <20260731170324.2927758-9-andre.przywara@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260731170324.2927758-9-andre.przywara@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: im7aZXNSkFVzOjlrj2dkAKKgvDhcavtAEfVdUEwCtao_1785815930
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_205858_521467_AA727769 
X-CRM114-Status: GOOD (  17.69  )
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
> The MSC MON_SEL register needs to be accessed from hardirq for the overflow
> interrupt, and when taking an IPI to access these registers on platforms
> where MSCs are not accesible from every CPU. This makes an irqsave
> spinlock the obvious lock to protect these registers. On systems with
> MPAM-Fb mailbox MSC access it must be able to sleep, meaning a mutex must
> be used. So MPAM-Fb platforms cannot support an overflow interrupt easily.
> Clearly these two methods can't exist for one MSC at the same time.
> 
> Change the mon_sel locking wrapper function to only use a spinlock when
> the MSC is accessed directly via MMIO. In case of MPAM-Fb, we use a
> mutex, but only if we are in a sleepable context. If that's not the
> case, we return an error. This should not happen, as MPAM-Fb by design
> does not require an MSC access to happen from a specific CPU, so there
> is no need for any IPIs or preemption disabling to satisfy CPU
> constraints. And since overflow interrupts are not supported at the moment
> anyway, we also wouldn't meet the other case.
> Bailing out early is already happening in rare occasions today.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> ---
>   drivers/resctrl/mpam_devices.c  |  6 +++++-
>   drivers/resctrl/mpam_internal.h | 38 +++++++++++++++++++++++++++------
>   2 files changed, 36 insertions(+), 8 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


