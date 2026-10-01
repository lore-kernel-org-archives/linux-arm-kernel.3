Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AF9CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 21:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oaFDnLPAu8Azz5pGOzAaVOnZU0E7BdpohXF2E62Q87s=; b=H2e2KkJ4/wDeHaQNJ5y1A1A2+s
	dZ+LTi4lSYksNIiWdsbgaFus3zRCZ6Wtb/T+cG8XMTRWZY1YYY2NVT7witTKU/S2XXHRW7OnhirD7
	IFgVyM0a/M77O6jibZx+/K2/irKM9RBg/Ld3QtIFLLtZNpW89g1QjVz8ldPXWb/uc3DVyElHytbVh
	JZegf0GsEMKO3G2RROO4p2VhKsOMyxDphXp0OBQ9mbAE4qIZ+ACsi8n9845kdwOKksTGuxfl+SW+0
	H2tfnKspRJY+ZsBUbwp7t/pJnkq3hTnj94j8p3cTnZzTDuwOZXE0BFX86TW1biVDpCxPLYZ/9MzrQ
	hC5x9MIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCOXJ-0000000AHw3-14JH;
	Thu, 01 Oct 2026 21:41:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCOXG-0000000AHvf-1Cvy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 21:41:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790890909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oaFDnLPAu8Azz5pGOzAaVOnZU0E7BdpohXF2E62Q87s=;
	b=GeQoGMPUd5b21djfYmTcgC1bXVyoSymBWZvr7SDDXzii3nPqO4haWsLSDDCAb9J646qO6u
	RRH47lxDpOa91YQ4sGBOxtlsREdIKOcWxUVyITmnr1PQ7Xz+nQjxg3Fu2WHYZyMqouYATw
	yeglWBh2vpMn5qUK3fhgKJ+aRjntvsg=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-aIY1rYjGNFCztonzAGPfKA-1; Thu, 01 Oct 2026 17:41:47 -0400
X-MC-Unique: aIY1rYjGNFCztonzAGPfKA-1
X-Mimecast-MFC-AGG-ID: aIY1rYjGNFCztonzAGPfKA_1790890906
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8886b1d3242so946266b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 14:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790890906; x=1791495706;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oaFDnLPAu8Azz5pGOzAaVOnZU0E7BdpohXF2E62Q87s=;
        b=iMX9KjC+X+ej4DIq3VgaEjVCjfKZtfslWuHG/zVAfuPWulIhVTXtmITEfbICx5eAbT
         9FJtj4PkAoB0i574ZL6WC3PZY9HPjdbrLG/QCw3QY1KefVmp/M2T2kPyiD2c42MX4WTV
         rC+36ZJY0/yzeI4NwXpIU74YAC1w/Jgv+AZ1KTnysVHUnRT+koNCCyEbR0rf88oQTaDy
         DiXX+yvA0JLCIu/6ys+sreIKHErMUMxRBWLNg2XankXrKVoH+MMUuNXqSqI0naJbfJTp
         HqiQ+GDnqOv4+CgyJW9R5q738TQNybtGWLi9I9NwYKdPIk84M+H7+Kc8qyFW1OlTRi4K
         9+WQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/8R2Ko8S8jLFf236vOcTYF+jvXqm7ALoBG1ozSNoZ34FHHxAylw2RQVljB8gIpjH307StU9+g4uve2yOrfSTJ@lists.infradead.org
X-Gm-Message-State: AFuF++klM+lgdUhdk9B5nACl4a01QuT5NZGK9PrTx/RI8so9dVEaahvX
	ephMQHRZtcS/fmHm57OmSmPnPgBieAJO+AanD6TNny9L00zkyt5ahM6J4mrUdj2VSmoUfRMfpBQ
	49kCD0bFQlrjJdU5jmIuz48MtxcitYmswd+/r4FEw6kjb5RUJ2CiSDeFam/02V2vGpyS7/bW2fl
	1N
X-Gm-Gg: AYBFou0ESWof1LPyoUMIBqUZQYpHe4fXdXHbPrMRbVwxE16Uy+bwwPxP6ywk210eCNH
	r8cBp7e6HwGsrmRcW/4wtgTlm5dprK4IRWZ3j50B946HlDHXCx2gsWrNkn3ewZQ+9HnfLI+bIhv
	QnrevjLs0pEsKIh5Bgmn3A+/hH1HtlxuZCtoKBNPgJ4S+wsARFdWj9Ce7AqZ7f7uHUYoce5TPvM
	jrKBtO8FHRhxJw5XkmvVKusHU19zNEETP8trewewVf9YFHMK2ZTClahWnudmpFZS54h6Xc+WSiA
	wLBS7J4ciIfTtD1dYT9Izqx1R8RpQpgv3yzA5fjCa5vo7etxrg/rHFfVC5xa0RxOP6bbye5/RFe
	KB2QLGNI77OR/1pUxSYxDzPdjcuaeiTGuI96s2Ezx4w==
X-Received: by 2002:a05:6a00:409a:b0:882:1b4d:1840 with SMTP id d2e1a72fcca58-88af58d4e46mr745868b3a.24.1790890906224;
        Thu, 01 Oct 2026 14:41:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:409a:b0:882:1b4d:1840 with SMTP id d2e1a72fcca58-88af58d4e46mr745848b3a.24.1790890905746;
        Thu, 01 Oct 2026 14:41:45 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0cb72834sm165561b3a.45.2026.10.01.14.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 14:41:45 -0700 (PDT)
Message-ID: <1ed590aa-a4bf-4980-82e1-185aee205909@redhat.com>
Date: Fri, 2 Oct 2026 07:41:37 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 00/23] KVM: arm64: CCA: Add basic plumbing for Realms
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261001210703.1597150-1-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261001210703.1597150-1-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IUmxU8Z6GyZG2Np98FP_GtqVg1XiZnWjoKC8X1x4ua0_1790890906
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_144150_434613_2548DC83 
X-CRM114-Status: GOOD (  10.02  )
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

Hi Suzuki,

On 10/2/26 7:06 AM, Suzuki K Poulose wrote:

[...]

> 
> NOTE: There is a conflict with Fuad's patch to drop the WARN for unknown vm
> ioctls, that is queued in fixes.
> 
>    https://lore.kernel.org/all/20260914093838.1082637-1-fuad.tabba@linux.dev
> 
> This series is comprised of (3) and (4) above.
> 
> The integration branch has been tested with the following components:
> 
>    tf-RMM:   main branch (commit 5e6e2acd) compliant to RMM-v2.0-beta3 [4]
>    kvmtool: git@git.gitlab.arm.com:linux-arm/kvmtool-cca.git tag:cca-kvm-v20
> 
> [0] Arm CCA KVM Support v16 : https://lore.kernel.org/all/20260803134403.80630-1-steven.price@arm.com
> [1] Linux firmware RMI v22 https://git.gitlab.arm.com/linux-arm/linux-cca/ cca/cca-host/fw_rmm/v22
> [2] Linux GPF Host  https://git.gitlab.arm.com/linux-arm/linux-cca/ cca/cca-host/host-gpf/v19
> [3] https://git.gitlab.arm.com/linux-arm/linux-cca/ cca/cca-host/kvm-v21/integration-v3

This branch doesn't exist. I guess it's "cca/cca-host/kvm-v21/integration-v2" instead?

> [4] https://support.arm.com/documentation/den0137/2-0bet3/
> 

Thanks,
Gavin


