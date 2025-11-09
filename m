Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC42CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 22:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=torA9iD+O5YccAO+gDgO+OReSyG8Lrsf/jD8r76xtZI=; b=Ip/qkex2TyWrIXjifAVvgfYJT8
	8LnWtc/yV9DNm00SnvK3AtirqMUiV8/FM/v34/m+LAlM5CNpJuxP3Y6TF2NT7iqbPiii/XyAAGm/h
	rMDK2j4nyMBz4/Cq8JLovFW/7aiqrjpOR1ruba4u31oHdrOJi+an7BMpSZ13LmZDTqz+j+LqAkCHk
	zMODm8dV6R1i2eW2LHSnJZgBjGrUy68rMndu6rAQcGkKT59WrJL0LUaI9Z/aa9bpd+aXGzvB1E/iy
	iJsJDov/kI5EzapUe/nKRCaCZkXbyR6ZKT/p4vO0HuSxy1lVhG8fkiS6GkY8hMGTc0T92sHiZTnRn
	1wN/+wfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIDdX-00000004QNU-3yAG;
	Sun, 09 Nov 2025 22:11:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIDdU-00000004QMv-1t4W
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 22:11:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762726307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=torA9iD+O5YccAO+gDgO+OReSyG8Lrsf/jD8r76xtZI=;
	b=W73dHUCnmQNV0eKFOji/URjkITSqRk/2oqm0yaXl94tmx1zA6Dh4VrQ5xj0+Jws4oFeOl4
	elEBUkN3EIvo0ijRQOLQuT3b3+OvuSxuykGQig5henTHNxvCCukCtbjEQqEPcuBiXQojwn
	6CVY6I4h29HUWjAInwpZe9TEDoxbhDg=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-ppXQ40n2Px60VIuF4rPH5A-1; Sun, 09 Nov 2025 17:11:43 -0500
X-MC-Unique: ppXQ40n2Px60VIuF4rPH5A-1
X-Mimecast-MFC-AGG-ID: ppXQ40n2Px60VIuF4rPH5A_1762726302
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-343823be748so826876a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 14:11:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762726302; x=1763331102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=torA9iD+O5YccAO+gDgO+OReSyG8Lrsf/jD8r76xtZI=;
        b=PnwadSijNonBt5vOaED7eKaY7NLJwgZl8+m7cx2mzkshUNUSK+g0Nys6Uq9FGO6QDf
         QOpIWnB+ttQNpO41ExUgYuOwltYpdXn549S9agiZyyDCylFG/ij3+6Jm1qa0pNGBO5fR
         WP8BwiW2en5Jo4GNN7o6SMwL3smJllU3FI0T98a8Cc9xiiH6tIwKd4YaRFeEOn6+qzSp
         eQisDENFwZkDCh5CjdO3rEqRcziuPH8GE5NFjEUQsr95c8Zl8NJlVjBu/2gAFSH4hpL3
         zLIEBDYLt1ZI/Qw/T4fhc8eYJpz/3MRMpMVLablk0LSj/KlVmo4h2Kmt/m6Pm15I2Xtb
         8+kg==
X-Forwarded-Encrypted: i=1; AJvYcCV8sZ4phF17P824WDEykeWYepTVsK+F6H7beh/9jLy1KpNHMSN0Z36ccCtenERdpWU9QCdtvijw+6dgSW4WbzeZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzBQ3+P24FmM1B9R0OCcUqJRN4BdFog++4USNjZhU81utoeO7Td
	uJDH3DvXwL8xQMBOJci2sOBRc66O5DoOi5s85wevi7RoifapjW+xmT5mtwmrrjmGHcb2zbQALt2
	hVghe0uqcP66s0r+SJDW8d+EpxGBCnTOjDd6cdoyo7/eaa0+GZSWY0Vje1JHgdAdM2nn+2GWfwR
	kf
X-Gm-Gg: ASbGnctH7YF/6z1E+j4/xans8Zrfwek93+Ax4e7wacrVH3KwNuNlL/mbTom5Vio+mFF
	NCZWStZoowiHzhQGzAknIR6rCcN1/SPyy2U7vomNay5fUO6zV4nBQUizOpuQgQcQThDjZLbiVkw
	4/1Ard/ADrtDQ5Pehmwyovvj+x0j5KiLiH7forjCvEofAjSn2u3Z9Xpxu2z3sXEiNjUiJI0lPwf
	/yFN7bnbE0rZjiwaCOlrqftFUxx1lrJ+MaTiiXj6KbuhG8WDR28e7PoPdFNWBMgLXzMRpEbeUSD
	SsJnukuPSeDDbNfKeycoNPtKlcYvVfKxqjEy9gtxFyUXnpyX3pvEY+yuZ71sUuOvxL36CLnX0ZW
	A4jFItJced5DFVsq43p86vXEs9vdFkFDinlpjn5s=
X-Received: by 2002:a17:90b:3811:b0:330:7ff5:2c58 with SMTP id 98e67ed59e1d1-3436cb7a977mr8352243a91.7.1762726302254;
        Sun, 09 Nov 2025 14:11:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkgqRagTj1BsYFqTTiIN11rDYYz+ULLJjYUpCoKdSxULvZJZQzp6ZykLD3a8LycOtC3JeYVA==
X-Received: by 2002:a17:90b:3811:b0:330:7ff5:2c58 with SMTP id 98e67ed59e1d1-3436cb7a977mr8352208a91.7.1762726301879;
        Sun, 09 Nov 2025 14:11:41 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3436c3d7dddsm5430819a91.7.2025.11.09.14.11.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 14:11:41 -0800 (PST)
Message-ID: <a4ee3610-5a5a-494c-b994-28447535f25c@redhat.com>
Date: Mon, 10 Nov 2025 08:11:28 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/33] arm_mpam: Reset MSC controls from cpuhp callbacks
To: Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-19-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251107123450.664001-19-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: d-G7TCI-ofEafyUhCiZQyVTozJ_PrlH_FvmaQHRjhXA_1762726302
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_141148_565860_F9B5A1AE 
X-CRM114-Status: GOOD (  16.51  )
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

On 11/7/25 10:34 PM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> When a CPU comes online, it may bring a newly accessible MSC with
> it. Only the default partid has its value reset by hardware, and
> even then the MSC might not have been reset since its config was
> previously dirtied. e.g. Kexec.
> 
> Any in-use partid must have its configuration restored, or reset.
> In-use partids may be held in caches and evicted later.
> 
> MSC are also reset when CPUs are taken offline to cover cases where
> firmware doesn't reset the MSC over reboot using UEFI, or kexec
> where there is no firmware involvement.
> 
> If the configuration for a RIS has not been touched since it was
> brought online, it does not need resetting again.
> 
> To reset, write the maximum values for all discovered controls.
> 
> CC: Rohit Mathew <Rohit.Mathew@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v3:
> Add tags - thanks!
> ---
>   drivers/resctrl/mpam_devices.c  | 109 ++++++++++++++++++++++++++++++++
>   drivers/resctrl/mpam_internal.h |   3 +
>   2 files changed, 112 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>




