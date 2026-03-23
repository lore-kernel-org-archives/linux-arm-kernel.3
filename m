Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AE6D58CB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 06:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/VzDoLUhO1gb7oNNZE+I+ReWQ1Pd7mAscGwxQPtNBNo=; b=aqDt1We9km0bUYVXFG3QWh3CuU
	kRq7Wt1pkOtZydFzvWrKrNWqtkvcIktoFLO9orKFcJL3rWjPCXMAFr0nUlDd1b9dnasGuEt5w2nCg
	ErWBBw/HU3zlXzaMrovxd6sPELJxsWlh858yTDlNuF1RD+GcQ4Jull/3RN709BxH4s677GDMaQ9XV
	pFwYx370XnPfyT87Bo+zfSUjvtLV5ZIt1RlODB7Oo5Ctf2LMvlGn3BEPRn3/VDt/qy2FEu89PS72S
	ddQ2UQbG7ETWvE52rJpo+tjGSySNBeqVteGK9Rio87MGWIS4AzAuusX1R68b+5kNJjici8vMbO8GX
	9lG9099A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Yz0-0000000G8jf-11Hw;
	Mon, 23 Mar 2026 06:41:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Yyy-0000000G8jH-0uvU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 06:41:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774248107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/VzDoLUhO1gb7oNNZE+I+ReWQ1Pd7mAscGwxQPtNBNo=;
	b=Rn3+j6f7IUMq46kafqK6jUyNhmmDN05Ihgx+/IcoV1o29P3NjaLpbBYciCJBXQFFt7X+L9
	emaE4C+f51usUGehziszIIKVNghneRPiQYm5yJerXfgV7IMogU3nPKMQfJeVOAwsN4tkCf
	t1cGcHOxZBKQlqP4oV5Eu745wlw549Y=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-jPAqZBfKOjCZOsF3d-J6tQ-1; Mon, 23 Mar 2026 02:41:45 -0400
X-MC-Unique: jPAqZBfKOjCZOsF3d-J6tQ-1
X-Mimecast-MFC-AGG-ID: jPAqZBfKOjCZOsF3d-J6tQ_1774248104
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b060c14ccbso39951295ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 23:41:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774248104; x=1774852904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/VzDoLUhO1gb7oNNZE+I+ReWQ1Pd7mAscGwxQPtNBNo=;
        b=XWiqXOu2/D1A/XtEBkJrxjvj1guY98IR023a13UJpklVMOio5pvYT8skB8+4Utcjm9
         3QIGrAJjtQStj4PNE4fZwEMX2/B23sSR+ysiYAtHOvhVg4sorl2vxW0WL2cjYS4ixBOL
         Hr6Zf65iYNJdytIFKcJc8IZdnRpKvdBQ3oLaKi0fTxKdHR6TA2+Bkb5ZQ6j3jR9Q5oaT
         IvCVJzpSoQ5eAEPARf/P3/8CGRNoF0muF0NeHQ8ffRKhWgIklAw6Fcq6/AtIY0wivzRH
         P+wmzHMAQGRBSo8fEAOIpAc3HrZZ7MaUn144zU7/f4fjtDzpnMKoxTAy2/1JnYP/QEBc
         pl2g==
X-Forwarded-Encrypted: i=1; AJvYcCW075jX5In7vRMgFRoCVtV9mNCjCSXMn4U2vxYXpfMV0iTuzekq4zuJOoBh/YhlqEBPbGGMYyoZPYSi+K/PPiVe@lists.infradead.org
X-Gm-Message-State: AOJu0YwBNQtM/QwDK0n/Z9VeZd6eY8imw1vAt2wxu4xxK9ipmDXSxBuZ
	fqKcfdpi3T4M+NQMEumEgMmNjlzXgu7SgnEAPS+0d5SUipJnsSIpRLdFaSGLq/1Ddcviz9AD+ew
	hK8aXx6oghgeHQZcnqd6EKiVAYuverfKybZSadts4OGW1w/GFYW1NY0rPVSq2A3NWLOEfUWGm0U
	A/
X-Gm-Gg: ATEYQzxBK16EzH6wdeSx0CSyfL6ZNeJCscfZZ2jH+iTMpPLaUkKd30+SKGc+Fw02I4i
	k0NUlaNAITN4gy0FDL34+On9RdA1RC405aJGuBUAPU3UB1L70+7ZbJIIrWLHaNXSq8X8VOyDJbX
	Wz6LD2RilP6b0OcK4M+Rcxief0XHx1hcmOZKio8teeqsZbYLZ9mW6dK77xCciKSt4Kqx4EGqGtJ
	NiEGw8SXDmucS+BP8Ob+CJn6ilQ9hsY8+J2bTbVvuv0BelurxKzrXkkVeVyBRz1gQr1G2gQGZoY
	lWOicsyEDUyhMINqkNkMItgtdfr7WAJROM2hnUWxZZFtnf+0jEwQlulKZj3LLBXmNur0qsxyw7Q
	NnnpUk66Mv2LnXw5VwoorKT6CZd1BmW3aQ2jdkqH7b3rttPdH1R5Lkp71zyIAKJ3i
X-Received: by 2002:a17:902:d2c1:b0:2b0:603e:e147 with SMTP id d9443c01a7336-2b0827313b4mr111046435ad.22.1774248104423;
        Sun, 22 Mar 2026 23:41:44 -0700 (PDT)
X-Received: by 2002:a17:902:d2c1:b0:2b0:603e:e147 with SMTP id d9443c01a7336-2b0827313b4mr111045975ad.22.1774248104047;
        Sun, 22 Mar 2026 23:41:44 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0835298acsm101110265ad.22.2026.03.22.23.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 23:41:43 -0700 (PDT)
Message-ID: <310ac0e6-6999-4969-b03b-a10564fc2901@redhat.com>
Date: Mon, 23 Mar 2026 16:41:27 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 16/40] arm_mpam: resctrl: Implement
 resctrl_arch_reset_all_ctrls()
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
 <20260313144617.3420416-17-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-17-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZuDyToSUtRCHyUDaunyfQ3k2pAD2ybph4emreV2gPcc_1774248104
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_234148_338762_73EA40CD 
X-CRM114-Status: GOOD (  11.82  )
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
> We already have a helper for resetting an mpam class and component.  Hook
> it up to resctrl_arch_reset_all_ctrls() and the domain offline path.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v2:
> Don't expose unlocked reset
> 
> Changes since v3:
> Don't use or expose mpam_reset_component_locked()
> ---
>   drivers/resctrl/mpam_devices.c  |  2 +-
>   drivers/resctrl/mpam_internal.h |  3 +++
>   drivers/resctrl/mpam_resctrl.c  | 13 +++++++++++++
>   3 files changed, 17 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


