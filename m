Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F977F532CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 03:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SY61T0BWUy1OFaShdZnORkkoebo47/qKa/D/wut4yWA=; b=FU/r0t55crpvJ3Xz3rtx9LxxCS
	2JZygxqOaC62DHoqHNWOY+PIJxEw30/8kAEZ00tBioIuy5sU5ifcAxoCPGyO7bq1B1JsInfyeVY2/
	dIzLXiV3u2PmbIBbKsfvkckCBQU5fD69kEl/ouC57mIbnrHJf/3ZCaBQMBd4I5QEOhujUSxcjDmS5
	0BXsYzKEPDoBxY79+GmY7r7r3jQtwk2XjRwIxC40qGLd0WO3iIhsZQhL//V81ZsGo/Gv4jBo9nJbw
	IPMAtHyxWA6nENIq5d0fsNqiCdg2yxSPsmzUsjg2dNGgfgFC7fa4KmiCnz2Yk0cA8h+3l5wetRJLo
	dvTz5hMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4sfe-00000000VX3-3Rf8;
	Tue, 24 Mar 2026 03:43:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4sfb-00000000VVf-2kAZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 03:43:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774323786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SY61T0BWUy1OFaShdZnORkkoebo47/qKa/D/wut4yWA=;
	b=YK6RdZTI2/Rg98tz/hbNhsDFmsff73U5++qAvVxMws5NqDSqmomp2zXzvfJwyvEKad8zmN
	iln19SMbb1CHnfYm3QWgFRt1SddLd1e/XyRgLVcx7AjybX9DMZhgPWbNE4f8xDQmOdNaz+
	aB8pllXWXa2JR+9bzvX4HnZvQbn/Qf0=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-4HBAmdiqMHeJtubO2b1_eA-1; Mon, 23 Mar 2026 23:43:03 -0400
X-MC-Unique: 4HBAmdiqMHeJtubO2b1_eA-1
X-Mimecast-MFC-AGG-ID: 4HBAmdiqMHeJtubO2b1_eA_1774323782
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35b94e2caf9so18309823a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 20:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774323782; x=1774928582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SY61T0BWUy1OFaShdZnORkkoebo47/qKa/D/wut4yWA=;
        b=DUmFpkgQrVPdyYrUw73lxfP89zURrS99WNi7xcaGgzikW6loOKYYOscF6dHNNKvI43
         +q/+KOOObuMLT3IGnd0c1S72NGRzm3AvQyIRpLVni/bPc4vRvDPZZiAPH2oUF1xJWDRy
         rWY2Ozk3v3tUYTZy6DKwXjP6iydBkmaTuBp7GKCRkYEvhsWbZHLWCBmflyExPWSppsGp
         vhF0TT9/3HEXJF2Y/Cj6/BpC1z8s8/SfekxsXd1rxsyZdsWkNs+d9AJznIL4PANLFS01
         /LkbUglSiC/Xk9VNBj/qKPg/YYKQE/OMI21nbfSYrRkjzhUMC18Q5PoNapIsVtFOZYku
         9joQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrus4dqxwWp+7HvFMl4+g6ik+75+XuTOhmUP0G0mhGQsAkX+wqlm27pL7Fvi0m82Ub8IX2Q2z1m7e7DEwicq8Q@lists.infradead.org
X-Gm-Message-State: AOJu0YyoeD1YVlyrA2JGkHg148faEKWcEhipCMMD0YeSYGnZb8j9hitc
	n/NoUZAhrM7DBlP8ILPYdn5Y/UVuQ2LNWb1u6ZTQ/YWMCsX6HWneit2/x7bH2TqEWSp3UJN8pYh
	p9YjMGcXOuYfJgL7xUQmFjuftN311lGLMNJh406rOwrnR7AH1QScim6asUYkujm9tgf2zcb8Qxa
	QA
X-Gm-Gg: ATEYQzzbDlqmHGePO52I852W1cH4dQW7DK5CnoUCC3vw7AOcaSNXAlcpVzu+4abMLSq
	DJa9q8NcOkAyzG4jgyw0pmn3sV+BzJx9IQZuo7cC8wz4dueX6EjHRhqpFwtapPhC3I17CREylUC
	i4HFcIv918iijB0I5ihEkEZtJAnMNWmBZiuJWjrqytl2wLryBq0/GY4VW4rybr225egOdUOWnAP
	ItpCiejIzb8jo5kpTYjVWBY4eWp++Kc2Q4rfQd+/hTlypRuGvBz4Z4MBk/WJ1SMDijZM1PjXMLt
	2Up9zhDOtF+Wbwp28bZ8rfejTeccvu/WgSeVuuTdM4fNOOfm6VJJUs3fJKzK5CK3efcF4d9COd8
	gBl8G81D6AsnnBz1tMK+scog3jsIccImiTbHqVnmkQ4eakTmdlBc4fKHcs+vb0fqI
X-Received: by 2002:a17:90b:3946:b0:354:bfb7:db0c with SMTP id 98e67ed59e1d1-35bd2d349efmr12535746a91.22.1774323782502;
        Mon, 23 Mar 2026 20:43:02 -0700 (PDT)
X-Received: by 2002:a17:90b:3946:b0:354:bfb7:db0c with SMTP id 98e67ed59e1d1-35bd2d349efmr12535706a91.22.1774323782097;
        Mon, 23 Mar 2026 20:43:02 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03044d04sm751468a91.0.2026.03.23.20.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 20:43:01 -0700 (PDT)
Message-ID: <a09e6800-bbdd-4798-a419-df656e18668e@redhat.com>
Date: Tue, 24 Mar 2026 13:42:45 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 33/40] arm64: mpam: Select ARCH_HAS_CPU_RESCTRL
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
 <20260313144617.3420416-34-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-34-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fcZGosU8Nu8mJnH4YQOwayBU5c1IKl7GrWN02sQU6tc_1774323782
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_204307_774389_F7DE7603 
X-CRM114-Status: GOOD (  13.19  )
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
> From: James Morse <james.morse@arm.com>
> 
> Enough MPAM support is present to enable ARCH_HAS_CPU_RESCTRL.  Let it
> rip^Wlink!
> 
> ARCH_HAS_CPU_RESCTRL indicates resctrl can be enabled. It is enabled by the
> arch code simply because it has 'arch' in its name.
> 
> This removes ARM_CPU_RESCTRL as a mimic of X86_CPU_RESCTRL.  While here,
> move the ACPI dependency to the driver's Kconfig file.
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
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   arch/arm64/Kconfig               | 2 +-
>   arch/arm64/include/asm/resctrl.h | 2 ++
>   drivers/resctrl/Kconfig          | 7 +++++++
>   drivers/resctrl/Makefile         | 2 +-
>   4 files changed, 11 insertions(+), 2 deletions(-)
>   create mode 100644 arch/arm64/include/asm/resctrl.h
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


