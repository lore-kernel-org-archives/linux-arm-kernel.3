Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6E6CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 00:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDXuqYgBTFSeTj9HmL3kCs/tVEJAWswdP19jlLEVGcM=; b=COQ5J0VwK18V8+IBXuC3MKsLaf
	djPCq3lSp+6bCQVySJDwx83tn+2qziHRshX6HBeGUrHPb5BVDQ8ZOfbT8awJgD40QeoKAYZuh0lzs
	NXR01qcBWbXQhj2Il9BClNBZwyX67m98sRN3r7lD0yrqksVlp0jPi/tV3P0iw67NAEPFsUUDWFT7V
	waet/opR+9QJB8aKPkLjv6edY4vMNe/Q6DH+bCLb5oc92qiV0geTekPEgQpvKIVUvpvSvEj4jd9pC
	xBZ6Byn/FCkUVh/KSmcM8e6hON2lR67ClKhCoyJyYuwx1u2NxL1F0Hf9bpQSpHsoCiyrnrs/TVYlg
	NSuwC1Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0U1i-00000008QIE-0cW8;
	Mon, 22 Sep 2025 00:03:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0U1d-00000008QHU-16jx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 00:03:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758499402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PDXuqYgBTFSeTj9HmL3kCs/tVEJAWswdP19jlLEVGcM=;
	b=MouwOfAaQ41nIRAIVB6dmm1/p7ILXKT9XKAk60qXDHJFKPRa1qHXa8TjP2GtL2U3fDkYM9
	WAsmro7FyIyumLid/EPADF1UulUz1flpoJfY+R4R92dqLmW+AHjDvbJ8PcP9Ij++cFwFsT
	RePW/EBXvuemY4uJ/3Coel0QKKl4eoE=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-Hx7IIJbpOF--pdNSMrl0iw-1; Sun, 21 Sep 2025 20:03:19 -0400
X-MC-Unique: Hx7IIJbpOF--pdNSMrl0iw-1
X-Mimecast-MFC-AGG-ID: Hx7IIJbpOF--pdNSMrl0iw_1758499399
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2698b5fbe5bso46505515ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Sep 2025 17:03:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758499399; x=1759104199;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PDXuqYgBTFSeTj9HmL3kCs/tVEJAWswdP19jlLEVGcM=;
        b=XTXqUg9N2lZOFkGzSXvdO5G6l2DqRvoZ59NzNGlal0f4qG2F2HY8XNmK/YBGm6B87L
         w8cAd80AjUgibfHWTuwX1YgPO6+jOKbIshRtY1AJrhYhVSVQ7YuiRLEPY2SoMGU9VQ0G
         WwRCJcPXrzy693GNTvT+V8c3u4loqMF8+cZcZFx+KtiAQbSrCggTSnH89BnXu0KSgnhu
         mD8fcphbXMS90HyTnAFX4oFKl0AEf5IHY+oALBADNDOW17b/0cfC2bETkmMzpMaMDqwW
         akzMFy141y7dzpCV5UpQs783ChJVOLys34beBYQU76vnVMyG0i9L9h7lO44uPNzO7FZ+
         PjCg==
X-Forwarded-Encrypted: i=1; AJvYcCU3tej1/uqgu748A74v3dXa9JgZOYqaytMYOzjGYGJ4f9rDg/0WFSUe0C6qiC2sxYiBCzKdoZrwJJYg+adOIG4K@lists.infradead.org
X-Gm-Message-State: AOJu0YzdALYjUtiy4DUcLn0rPz3t3ChDBJpOMb5Wq/ScxZrL/+5VrT5h
	FrNym8HemYxJs11HZQwqbfUDvz1UWyVwUIsLW5biH4fV//MqegJo3gnWUrdudHRVsgfpET09uZC
	7xsalgWKIGvaynkFX+1Bfo11zxnaN3IKN8bWeI0J7RTMpzP6pXqlEjs2EtdCKvRz6935Js5segH
	Eb
X-Gm-Gg: ASbGncs3CfO44DMBD22KYcmJh4EsPk1I6yDaPu3qNlO/lPbyxFhmbU1FOV7VLgCZs48
	MKMkkvv2PyZRhnTHQBpnyS945K+tYVmZFoNzFVRctaEqLTJU2/hohxaOpfsKhT+XC9u/3hZyzn+
	8hfYsDaDtuCeFksfZlWlHqkSe+w9ZqAzyorcGlf6RFpodoH3GQIk7CSJ8etS+qpEdh/RLrrxeqp
	WhUhuufmIqI200DlZg/lE1j9+iGiKdpxsFVx94f8lMS48Mwv6A5Exp0EdHfisIDkMj3AJ2F0foB
	5HnzVO1ofFPzRmi8+FEVTuvJl6SvlteTpAOIE8p2zRwqQm3w36NAyQgfNx4wY9bpZSt+WJb63n0
	60n4p
X-Received: by 2002:a17:903:2f83:b0:265:bb0:cbc with SMTP id d9443c01a7336-269ba559260mr154624315ad.47.1758499398739;
        Sun, 21 Sep 2025 17:03:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0MfGExlYWTmOjV1WzK5kji6eVj+QSqlsV+EO7ogGlqCirbQxRS/TDHG9aRgu0NS0ideP2VQ==
X-Received: by 2002:a17:903:2f83:b0:265:bb0:cbc with SMTP id d9443c01a7336-269ba559260mr154623995ad.47.1758499398419;
        Sun, 21 Sep 2025 17:03:18 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269803601e3sm114894975ad.144.2025.09.21.17.03.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Sep 2025 17:03:17 -0700 (PDT)
Message-ID: <a836c085-9bd2-4160-9bf8-81c186f7535c@redhat.com>
Date: Mon, 22 Sep 2025 10:03:07 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 31/43] arm_pmu: Provide a mechanism for disabling the
 physical IRQ
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve <vannapurve@google.com>
References: <20250820145606.180644-1-steven.price@arm.com>
 <20250820145606.180644-32-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250820145606.180644-32-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QQPpvCHwVXSCGBkonQAzfcQdMr8-d4khHjYaqSZD3jA_1758499399
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_170325_722731_FD943A35 
X-CRM114-Status: GOOD (  12.21  )
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


On 8/21/25 12:55 AM, Steven Price wrote:
> Arm CCA assigns the physical PMU device to the guest running in realm
> world, however the IRQs are routed via the host. To enter a realm guest
> while a PMU IRQ is pending it is necessary to block the physical IRQ to
> prevent an immediate exit. Provide a mechanism in the PMU driver for KVM
> to control the physical IRQ.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> v3: Add a dummy function for the !CONFIG_ARM_PMU case.
> ---
>   drivers/perf/arm_pmu.c       | 15 +++++++++++++++
>   include/linux/perf/arm_pmu.h |  5 +++++
>   2 files changed, 20 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


