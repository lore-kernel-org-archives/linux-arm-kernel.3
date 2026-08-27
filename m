Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4EFC61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 00:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7kI48VtjA0m79pfKThr79GcCuUw/Tq7WCD7HinJujWM=; b=A6HcINrv0jqJWrLsLul5r2vLP1
	vrwP5Gh/0RjCJwq6vrEflEhInLm7gyh7Ki7iojdn/zcByfrQ8shACr1ISLvP4ktEC4wMca+B1seJY
	PLKEnIDwrz4zfziBDJZmyflg+Vr/6RkCd5XWmVJ1y8+3Hj8L/Z1tdQlhwpGXtnPa1obgAwQKOAcUo
	22WCibvfm1Qiqa35h4bTcTwQH8q0+bV0ZeQRsOx3zcnXMWK4jjsboTMgDK0i3F5MWqXCD+ndu2Kwu
	sAnnU1RN9oy5toFlwRoWpPA/Oewq/pk9JuloPFRafkkNbvWvqt00jYQWS1Rvs6yTM4Tt/3trbR18p
	NpNaGOgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzNhT-00000003DkM-2IgS;
	Thu, 27 Aug 2026 00:10:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzNhP-00000003Djf-3WFR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 00:10:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787789430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7kI48VtjA0m79pfKThr79GcCuUw/Tq7WCD7HinJujWM=;
	b=FdEQWVrn5ZzLlPNHZ5cizhf/X7bQ+2PgaF7k67vNrFlocao2KzpYnkJnCMuGhoumdyG10Z
	eCXPAFyh8roG+RotAFIzDxLgjry3ebSEvx5wv/41SVKdaP/Ls1yLVBZt3WvRa/N1d577+o
	heYXdUMxN7dQEP6802UOdyLOEF2AZqQ=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-a-ZPzM10PGODvR9HLkk0Jg-1; Wed, 26 Aug 2026 20:10:25 -0400
X-MC-Unique: a-ZPzM10PGODvR9HLkk0Jg-1
X-Mimecast-MFC-AGG-ID: a-ZPzM10PGODvR9HLkk0Jg_1787789424
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso2917020a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 17:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787789424; x=1788394224;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7kI48VtjA0m79pfKThr79GcCuUw/Tq7WCD7HinJujWM=;
        b=JtSz07rMjpz3SnVb6VLdR0VunjjWrlXIpJs9cH/Euz/qDeRLGIXJ74dK6jg27GARFo
         o7nMAPCi5BMBD3kZPDGU0mCyJcH1CmqTENxrV0b3haWWFVWQp65EG4c2WC7IHkAlispX
         s9kAUA1WZKlnQMwSPQkC14atvrcHHLB+Rc/sGhZ0JO+eEAUIfVaCDRLBzwWO0WX42sTj
         ggMdn8R2pOnL1bbEOZ14lpdF12SdUk6B2MVZwVfAY1xcvkGaywKsEUbkQEyzg3s+20C1
         etKkLEvlvbi7uosLPX4MWYSreLyhU/LCIf1OKnRjlZqpYvs1bQysUwbf+/ohHAO8lLPw
         EVTQ==
X-Forwarded-Encrypted: i=1; AHgh+RpiZKNjHvGczgyT42FmDl7YHDLsJI12TjUUFHAFibKO2gY1CrZqd0wFIhZAk5Z8OeL08NSplTnGJGGJQz155KVO@lists.infradead.org
X-Gm-Message-State: AFuF++lzWAKPUsShTlrdkYomU0gGq0qIjrQ8v+cFXF4JSKu40C7TeU8x
	MgrBFD2sMFayWzrWj9Zjqs4uFVzwKt67kz1hmNg1Xdq12Rx/OBd42c/OQ69SZjraTWB+Ktmn548
	IfDoIxeGmAVQzsuGLk7LdXJMusyS2eDx8HIg92uhQKY/36nczHiLqildFdSK/efLystC+65qCPB
	L6
X-Gm-Gg: AR+sD12rA+40jQfaOBuK6DP6SLOdvVlgkvw4CHuc79DuvjhDyEV7DmOw7EVOMZfrWWI
	FGcxJ5yeWd3LQkEMLtkX4NMStOK4bO8EqW6baK+VHpc9XVwVbpVAc8uKjbxXP2jkhM55FukPmRB
	RFph1n9MEctrRqXJOO+vMfwlJ7YvUpW+ZKYTv/Mj45hsA+ejCiaT7usvMJ7TM+D+MmJoBo5PmhK
	QjbuwLPjSxUXLRFu4wkAnHWVQnxB8GSCEDQrWDY1MKB1Kh8pGfZhGZ0eM8fxAHMFGk2SwTEqTKZ
	An7K5DG7DfDB0qNBu8Hq0N8XAMsunuUC699OF18l17H7tpBGm2crAWlqyaBSv6Q8P4GEeQRuelg
	bLpC53p3zHdj40FsMGcmnFrkWo6IUrange8IPcIaNVQ==
X-Received: by 2002:a17:90b:1dce:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-3966d3e1cfdmr21940247a91.10.1787789424344;
        Wed, 26 Aug 2026 17:10:24 -0700 (PDT)
X-Received: by 2002:a17:90b:1dce:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-3966d3e1cfdmr21940059a91.10.1787789423479;
        Wed, 26 Aug 2026 17:10:23 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283da048d3sm12020839eec.28.2026.08.26.17.10.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 17:10:22 -0700 (PDT)
Message-ID: <996cd400-44e2-4b4a-8286-1235c3248750@redhat.com>
Date: Thu, 27 Aug 2026 10:10:13 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 12/12] arm_mpam: detect and enable MPAM-Fb PCC support
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
 <20260807105451.3728284-13-andre.przywara@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260807105451.3728284-13-andre.przywara@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8VC5t3hubd9HfthgaRALytMQ4bDXTywWUgqAQSuMNJA_1787789424
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_171031_960260_29C34977 
X-CRM114-Status: GOOD (  15.57  )
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
> The Arm MPAM-Fb specification [1] describes a protocol to access MSC
> registers through a firmware interface. This requires a shared memory
> region to hold the message, and a mailbox to trigger the access.
> For ACPI this is wrapped as a PCC channel, described using existing
> ACPI abstractions.
> 
> Add code to parse those PCC table descriptions associated with an MSC,
> and store the parsed information in the MSC struct.
> There can be multiple PCC channels, and each channel can serve multiple
> MSCs, so we need to keep track of the channel usage, using a list and
> a refcount.
> 
> This will be used by the MPAM-Fb access wrapper code.
> 
> [1] https://developer.arm.com/documentation/den0144/latest
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Tested-by: Ritwick Sharma <ritwick.sharma@arm.com> # on Arm AGI CPU
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Tested-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
> ---
>   drivers/resctrl/mpam_devices.c  | 112 +++++++++++++++++++++++++++++++-
>   drivers/resctrl/mpam_fb.c       |  41 ++++++++++++
>   drivers/resctrl/mpam_internal.h |   2 +
>   3 files changed, 153 insertions(+), 2 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


