Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73A2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 04:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7oZHOBdSLZmv8DzC8nUn2BhOLEhw/y+oCq0Qrz3pQg=; b=2WUjfdhc1zAJCpH9cJnfItzbVc
	x2U52oWCA07OhxhvWimXp1Gv40dgZlhHUbWeB104B1kDhasSaUS/KCfK/LmwJeKn3LhksTYwc864q
	qYkZPJ9tyblgLfJ1niHQsnXEa2yl7AQHWMSD30eutV40mJtRce1RYAKMpc1oAYB0DvqUNLfdjDJ9T
	/V/ue0ni5+pUbuGF3+gNAawjPxmfqqtSSTl1uYWsaAuiAjjFJA4pMICwEEuynNxSUnnxBI/MDLNRa
	fTEEwt9MbvDxmtHR0M/RpZuOPbWQvwYKFA/zBwhYF5+bKH5bHFA8egJFvj1CTi9vWVEiVjKIbg0r8
	+cTViITQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkEAo-0000000GRRq-4BwA;
	Thu, 16 Jul 2026 04:58:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkEAm-0000000GRRJ-2MPR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 04:58:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784177891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B7oZHOBdSLZmv8DzC8nUn2BhOLEhw/y+oCq0Qrz3pQg=;
	b=J8Q2KYKxT3VSfLG8bN9i4EVbIrKmq00RacNtSdh6RVNCPogD+75piIFM3LnoRSalhaZaDs
	3ORblcIKAu+QGrmjtPgvlaroUBKyJPaH92cBkwskvSFLhYRFKX5uYIuSNiZK/Qr5m3rQTM
	+9LGByPyNtOSVNGWIZegcVKpx/Nqj0g=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-ouVIKBC_Pg6D64-rPls3Fw-1; Thu, 16 Jul 2026 00:58:09 -0400
X-MC-Unique: ouVIKBC_Pg6D64-rPls3Fw-1
X-Mimecast-MFC-AGG-ID: ouVIKBC_Pg6D64-rPls3Fw_1784177888
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cee1ec30f2so41679045ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 21:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784177888; x=1784782688;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B7oZHOBdSLZmv8DzC8nUn2BhOLEhw/y+oCq0Qrz3pQg=;
        b=p0eR1IIRY4eBofee2wQh1WHv2QE95bbkoYaOmEg5zaCEKwodEyS4Qsb+IgpscWAo5I
         3vCF2kO53UvW16wxaLYFFlmIvt0JwX/U3Zf1TL/o9tgHQWIhm1LAh4VJoR3VsO+j/K5s
         dI+8j/xNbK5HORZfsKRR6OpHkrMQhIJJ+yAZQOcJLMuCd0HXZbpLUeK6sKxwweY2uPeY
         UHo9MF5DVpdlmC7KHszfwxdQwPCO6/ZBVuoX09ywOOyDGPFHeEmQ0HrsSn8aE+C2/egT
         0aYgnn+f5940xxY3z5bJgd60T5Kj1DgqssP1TIJi95dPMrRG3SDPY0WiTzUJ3QbseNJc
         KBGw==
X-Forwarded-Encrypted: i=1; AHgh+Rree+TCynBiRzjLHlmbqw9rGICcmwbYyTiNZfrRevObUjr+5Mo6UNx7V2Q3uyQbJr+Bxnod1IM/5KF+YwwradXm@lists.infradead.org
X-Gm-Message-State: AOJu0YwrrcrvCgbNWnZ6F81VR7r8zA3oKfHCPgGXvd26Mi/yBSo2E/Bd
	RLriPBAtUdDYwbpp92Y4C6A0BMMlUCjx3ZfT54zqwo0aUc2JvRul5q31yLwSZcjTwioXKzZH8Bg
	4ZB//3SRS8UbuPevZGEHgw7Vg4FFVNp7qTpZZao7nSh5tg/apLmubE5N/wYXeLPui5gsCtkvULu
	Gj
X-Gm-Gg: AfdE7clAw/11tSsDP3BPNZ/Fz0uCGHWhXXQYnf77UEfaT1Qy4hxfBSacy452NvKUnOA
	AZgM2k7AhGKya005ZZtnPdeu+jgmfgRgQUGp9csINYebNpGGvxb+I4ZRtvC9QwYSD5jNrvcepIk
	T3+lOktSPpjPKQE6dFcV+Lz9DBDVVJKqtSeygRWNLiOo/z4yZ2X0rS86B/0RUoheeTmMmlTfT3q
	ReSQs/srTsx4FoOJIalg2pmuk54PG75nDIYJS6FF3fkOXACKAvPbHEzD0j22laBOwzZSdd5/6HR
	rRNgMQQSvdCUZsXgNuk2WGCicQLfpJg7reC0b3Ax0tkB1rYzjZ6My5uk8jzC4Yh5dnD+kNSV6Kz
	POs81t9XB7qRuYsRMa12u4GMfO7cQ1zd6X50MPIr3fKU=
X-Received: by 2002:a17:902:da2d:b0:2ca:be8:62d with SMTP id d9443c01a7336-2ce9f3a0083mr182851165ad.32.1784177888399;
        Wed, 15 Jul 2026 21:58:08 -0700 (PDT)
X-Received: by 2002:a17:902:da2d:b0:2ca:be8:62d with SMTP id d9443c01a7336-2ce9f3a0083mr182850885ad.32.1784177887771;
        Wed, 15 Jul 2026 21:58:07 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1072eacbsm13239025ad.80.2026.07.15.21.58.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 21:58:06 -0700 (PDT)
Message-ID: <75394e50-45da-4b53-b0d9-80d57395b1ab@redhat.com>
Date: Thu, 16 Jul 2026 14:58:02 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/11] arm_mpam: minor fixes at v7.2
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260710115546.29644-1-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260710115546.29644-1-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DAk4knw5eP_YqHL2XtzmGrNXUfM6aSMrPkjrGqJoOrw_1784177888
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_215812_678544_212F115C 
X-CRM114-Status: GOOD (  19.53  )
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
> This is a bunch of small fixes for hypothetical problems in the driver. They
> were found by a mixture of messing around with a software model, inspection and
> llm review.
> 
> The first two patches ensure the error interrupt isn't accidentally disabled
> when register state is lost. Patch 3 keeps the feature accounting correct but
> has no functional change. Patches 4 to 7 fix mbwu save/restore but this is not
> relied on as we plan to just use resctrl assigned counters and these are
> unassigned when a domain goes offline. Also, MSC afffinity of a region smaller
> than a resctrl domain has not been seen. Patch 8 makes read_mon_cdp_safe()
> behaviour the same for cdp_enabled and not. Patch 9 fixes an infinite loop in
> a system using all the PARTIDs which is much bigger than anything than anything
> I've seen. Patch 10 stops some allocations failing on similiarly big systems.
> 
> Based on v7.2-rc2
> 
> Ben Horgan (11):
>    arm_mpam: Move MPAMF_ECR write helpers to allow reuse
>    arm_mpam: Restore the error interrupt enable from mpam_cpu_online()
>    arm_mpam: Set mpam_feat_msmon_mbwu_31counter when there are bandwidth
>      counters
>    arm_mpam: Add missing mon_sel locking in MBWU restore
>    arm_mpam: Ensure MBWU counters are reset on restore
>    arm_mpam: Use __ris_msmon_read() for saving MBWU state
>    arm_mpam: Initialize all of struct mon_read in
>      mpam_restore_mbwu_state()
>    arm_mpam: resctrl: Correct check that existing class is L3
>    arm_mpam: resctrl: Make read_mon_cdp_safe() self consistent
>    arm_mpam: Don't loop forever if there is the maximum possible amount
>      of PARTIDs
>    arm_mpam: Switch to kvzmalloc_objs() for allocation of component cfg
> 
>   drivers/resctrl/mpam_devices.c | 124 ++++++++++++++++++++-------------
>   drivers/resctrl/mpam_resctrl.c |   4 +-
>   2 files changed, 76 insertions(+), 52 deletions(-)
> 

Tested on NVidia's grace-hopper machine and looks good: (a) kunit_tests passed;
(b) l3 cache partitioning and MBW (soft) limiting work as expected; (c) llc_occupancy
monitor counter alters when workload is attached and running.

Tested-by: Gavin Shan <gshan@redhat.com>

Thanks,
Gavin


