Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB94C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 00:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4C9bzIpuuaLAtIJfd/nedrnMHSui02xazThUpELcIQ=; b=Wk3gkWiegBvJqbieVNJSCn/QZk
	wp/Ovez+3Uz9BmbkLs4E/PWJqehAhRowIv+XPl08+n09G7cgXmoPGkEnFB9Zs37ggDsFu05HTY9oP
	h2jzoJYqBhaUEcfjmfFHk2tReshrTRGG6L/QfYOsmi1Z6/hpW3Lb5OQxsH54h4MFIZWWpRGGTk+aO
	uPas32d2mq2bPEYR2vxDuO1iAiNKJCJD9JemUx4RMhZDO5uPQAHrWgHqpbo6fHHoZjPfR7gySv2FV
	R5uJiZkLla76HqeRwOxUgAIVvUQmJ6wTbNklnDKQEGKBwv10JdM54PqGS6Imvca+WrLp6zUCT0wou
	6VqjLDjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzNh3-00000003Dhn-1fcM;
	Thu, 27 Aug 2026 00:10:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzNgz-00000003Dh9-3vPd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 00:10:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787789402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P4C9bzIpuuaLAtIJfd/nedrnMHSui02xazThUpELcIQ=;
	b=IGY4cYVMXeyy0fwI9QIBVWRLV9Td/MLZf0mc7eT3pCBB5obJv/KzVADrGm0XgSPHPbRLU2
	4IJqlEPiEjIcYaXdcSvZu+n45Hx3b026Z8wFp2/OtlDcPK9mpUubwuY5Xd55y8fP7q7fD9
	/7vXRQNgLFm5bjPs/o1odlEGno8Skno=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-_zVt0wdjP32_lu5QSZLx4Q-1; Wed, 26 Aug 2026 20:10:01 -0400
X-MC-Unique: _zVt0wdjP32_lu5QSZLx4Q-1
X-Mimecast-MFC-AGG-ID: _zVt0wdjP32_lu5QSZLx4Q_1787789400
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d55d8cd938so6489715ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 17:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787789400; x=1788394200;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P4C9bzIpuuaLAtIJfd/nedrnMHSui02xazThUpELcIQ=;
        b=YL2UTDkWog3nxEV0v8V+FJZrzIMz2xZOqzW77fQC79ChRuOU8byqbweGig3w8TlEwK
         gqFbJo2ky2KjBSOvb00HM1jf724r8BxJQzMKXio+hp34fTWv9zxMOT61Xw+oyOfoDGdv
         dSjdmOZmoNSwLFgBxacSDwChKZNRs+q8uwiUJgbWyTRTTLFIAJ8rjvrK9l04Pvmy0Wk7
         vLmpJQFheolBaP+VLjdq2tWA2TPQIzy6l4HzIqI3+XVgW4X3hkNbAye/BrZ3vCE0hox6
         lIFaMKLoGplyZGQ2zYZR9Jf1TEk3v8E5hej/ysw/qwnuNj9TbZjlrCdbFP1smO5uwWV1
         vEBw==
X-Forwarded-Encrypted: i=1; AHgh+RrYXw+8Wb7uft33GXwdsmLJJTGCP4qgnAZUhmj8mfDTcwo8IRBmOS9d7RbFFhq45j1Ov0A9eZTY0tPLQJERhELh@lists.infradead.org
X-Gm-Message-State: AFuF++msawMYfEKPA+m0hjBuxpTuKQeMWvg49IByYtSA6ysl/WhQcgNk
	z8/U3G9bxfnNmp8u1mTQ3FIVK5SGnJ60lAoS+EN54SnIGukDZ/YElFnjnYAUAkotMV9IZDtDUS8
	OCNeQ+DHysoH6jFfpI/XtYwoRIJLvv0EhLelge0U2cXs0Ory3PhF8siKhylH7ceXF/0ZSDoJ+kH
	J5
X-Gm-Gg: AR+sD11eUk3y2hjbST98DdAuPtEDDi/6KRnhOYNfhcAVZpBsc+IcMAbJFB5cWCpuInw
	IUp8ZPlZhy4ZT3nHvGbOnU/DZTioqDlg1H479mu1UL84hqsQjMOuByoU4wPxJ4qqiJIyYAl2gTH
	MSAtK/A46ry1Xus30IdLO/P/r56uKUmF7A47bIc/4r+lr5MX1gEfP9iHoJqK0trs4pW1In81OWQ
	cwP5x7yv5Ywj9pDQLKI3nEAGPD0+hsY8sS2v9bLEwE+mP4V4CSYSWXrAUpuRSE7n/817jD4faeY
	L4pw15DDZtyGjyl5Th6PCWwbeNT7fmnLvGtUR3lnNkY9utG+fTQvzHbkxgMgFyhCYCVBGqJqjHg
	ysSAQHSPxTQkHz1f5be9seaGhS3vjgViZsB2ds/bClQ==
X-Received: by 2002:a17:90b:4e8f:b0:38e:2517:5d1f with SMTP id 98e67ed59e1d1-3966d4032e5mr24140885a91.9.1787789399985;
        Wed, 26 Aug 2026 17:09:59 -0700 (PDT)
X-Received: by 2002:a17:90b:4e8f:b0:38e:2517:5d1f with SMTP id 98e67ed59e1d1-3966d4032e5mr24140764a91.9.1787789399495;
        Wed, 26 Aug 2026 17:09:59 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a9035ff1sm10395038c88.11.2026.08.26.17.09.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 17:09:58 -0700 (PDT)
Message-ID: <a2ac5d0f-1fe3-4dc6-92cc-d6aae82a9baa@redhat.com>
Date: Thu, 27 Aug 2026 10:09:49 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 11/12] arm_mpam: change MPAM-Fb error IRQ to use a
 threaded IRQ handler
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
References: <20260807105451.3728284-1-andre.przywara@arm.com>
 <20260807105451.3728284-12-andre.przywara@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260807105451.3728284-12-andre.przywara@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IA_jJ8vSOMJYPCCa2TuKnKIApf80KBC8jFEfrOYrVLM_1787789400
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_171006_067375_F0B30397 
X-CRM114-Status: GOOD (  17.52  )
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

On 8/7/26 8:54 PM, Andre Przywara wrote:
> When an MPAM MSC gets into an error condition, it can trigger an error
> IRQ. We cannot really do much about those errors, but we at least query
> and log the error, then disable MPAM functionality.
> 
> This error report relies on reading the MSC's error status register
> (ESR) in the current hard-IRQ handler, which is not possible for MPAM-Fb
> based MSC accesses, since they involve mailbox routines that might sleep.
> The same is true for clearing the interrupt at the source, which requires
> a (potentially sleeping) MSC access as well.
> 
> Change the error IRQ handler to be a threaded interrupt, but keep the
> handling in the hard-IRQ part for MMIO MSCs. This is needed since the
> CPU affinity check in the MSC accessors requires a non-preemptible
> context.
> When the MSC is using an MPAM-Fb based access, we push the work into the
> threaded part of the handler, where the accessors are allowed to sleep.
> Also forbid per-CPU interrupts (PPIs) for MPAM-Fb, as we cannot use a
> threaded IRQ here.
> 
> The actual IRQ handler learns how to deal with errors. We cannot really
> handle them, but we can try our best to disable the IRQ anyway.
> Should the level IRQ line deactivation fail on the device side, we mask
> the IRQ on the irqchip level, to prevent an interrupt storm.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 77 ++++++++++++++++++++++++++++------
>   1 file changed, 65 insertions(+), 12 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


