Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18230C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 01:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qQH9RJPnonpFeg/AK/zTPsMMa2zq1+qitSA3lVbN8I=; b=YM/nafd/9TE6wX0j3req4BF6CO
	U+A68qmaCRN0HKHZ8Z6jlTBZT3QYgzLqfqh+PmKSPkLGnFG7ernto8TBc0EqAzqZieGmmqWQPHONY
	WvZONvnsP77PHHknhwzt755HPzZYxgqQSE2Z/rECidTugKUGgGWLX2AU1/FILGAE/z7mtJ2E8ToyD
	X088LptatkjjcZq4VAmPRN9G/Kj2O6knFTk6g1ZCvyLB8cIU4PWvy+A0t9dn89yMyuleOoFI0mqk3
	mKjm59pDbyVChLzdyeMU0YDjHPI5DjsBKP38a3sWgt/JHbUiRdyw+jk+RSoXLSG2zoSnQkN6BGuTP
	elS28dHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW3WG-00000000yuB-2eoF;
	Mon, 30 Jun 2025 01:41:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW3Q7-00000000yXh-3swW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 01:34:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751247295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/qQH9RJPnonpFeg/AK/zTPsMMa2zq1+qitSA3lVbN8I=;
	b=LqZwwduvST7h2fnfeezRk4CL1qa3dzmpJgxBLmAMg4BkbuvFpKCw6NE8Z5kiFoF/jefXe1
	MHzFRNXKdtAh9VYOK4OQ2s9tst+j/qFSAxP8+yMV9JxyU4j0b4WgzDf5gKB9R8oGXKvGsL
	Q0ViF8rNAWl5PluNJcfmpUt10WWEY9Y=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396-o_EYF8p3POCETb7bUg7jTA-1; Sun, 29 Jun 2025 21:34:53 -0400
X-MC-Unique: o_EYF8p3POCETb7bUg7jTA-1
X-Mimecast-MFC-AGG-ID: o_EYF8p3POCETb7bUg7jTA_1751247293
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235f6b829cfso10069775ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Jun 2025 18:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751247292; x=1751852092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/qQH9RJPnonpFeg/AK/zTPsMMa2zq1+qitSA3lVbN8I=;
        b=V35T/DwwIeQb4JjHCBDdTXHqMF7E5mS95ddny7QnT1KlcllHze8Gm6V+I4QL6hkAqN
         xCR3dlv9yIrhppmi/hh72tdgRMs+C/pPBvvsve6/1sOV3NITiSYAdse1rU/q+Wn8fYRb
         06Xe77d4AjRykmLmdhAjk80kpcmYvXDG/V512B9pEuWkJw9pcM4YMTq2MAGIT+Y0927d
         VszUaq7QSibMkMxac1UliNjsyEcbjLu2+TKfZgBKOVTGlCojgdN7mEYg4bBjk0imlI6A
         uOhwh7m2pRKg2/GbFW/CvCg+Wd8aqQWK9TwRmrKGqMlZMA4sthD/AUg4xcAuOS9KvyyO
         pryw==
X-Forwarded-Encrypted: i=1; AJvYcCUYrLSUIaxEAP2DT5gZt1bDWmy0T1HQTNfhmCOHlYxd+uK08fqJEB7YBWYfAflo48bWmV0ykrX3OqJIMLFplCNY@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk8MV0G1/mGBcr52fhc7eVx3ZDRlnTvrJ4AWXLCX5G3WKBDga1
	5u7nkYVNNhXZGwE6owPi1C1tHqdf4UyQ3udcfQw0q1uV/VkSrKtRIe4J5MPaL9RhWZ2qXJ3xFxt
	uQDi9XqTqdb8TU0YliqUWUznYwB/9pX7oaXqSlNFsX/gx/PbgRGHG4O4l6y217CyQ8PN2g0EzjB
	s6
X-Gm-Gg: ASbGncuWtgQEyPJtYA2W7nDpn0fVFZUPlyfXf5WEL4IHoylA9WcyugLiKnkD824sUcy
	nSJyQbQs2ZYT/XFpQu+LJoRqMrQe8lCYt1UZrg1o7Tp4Yivq8IzduyZxS41ZsP1H7x0yn6/QLnL
	lSfQbn9+SbYM1B2NivKmH2sHdWpBEEY60nLyzAgNorVc1GKU6Uz8dPHmiuJ3/SFCS8/Rj6ycp85
	Rf7UiLiX3K5OUE/ApUXjMxv1mTDRcy/IgtsvMyrttuKeenwTF6F1wlbSkd4D29JNusZ1nasUfs+
	DEAkwlv/4yB93Yo7mi1C1XwTtyvfJe+YW4YsCCQfhC4tDAbsjRZ0qh3Uxqw+DA==
X-Received: by 2002:a17:902:e84a:b0:235:27b6:a897 with SMTP id d9443c01a7336-23ac4605682mr190427385ad.34.1751247292738;
        Sun, 29 Jun 2025 18:34:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHES26D+vJKldUn3WQKkDcVbdtC6ULklx4j6LsOEXcAWhCMBS5RJ3y8LUPW9OLSx0GatAbXsg==
X-Received: by 2002:a17:902:e84a:b0:235:27b6:a897 with SMTP id d9443c01a7336-23ac4605682mr190427195ad.34.1751247292444;
        Sun, 29 Jun 2025 18:34:52 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3bc6b8sm66940115ad.203.2025.06.29.18.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 18:34:51 -0700 (PDT)
Message-ID: <b39791bd-1719-4768-9e6d-f8e918ab5669@redhat.com>
Date: Mon, 30 Jun 2025 11:34:47 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: acpi: Enable ACPI CCEL support
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, catalin.marinas@arm.com, sami.mujawar@arm.com,
 aneesh.kumar@kernel.org, steven.price@arm.com, linux-kernel@vger.kernel.org,
 sudeep.holla@arm.com
References: <20250613111153.1548928-1-suzuki.poulose@arm.com>
 <20250613111153.1548928-4-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250613111153.1548928-4-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: O9zT1_S3lPkJP1cQQrcp6MQDmtuKSuGnjnkJID2W7bI_1751247293
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_183456_037612_9CD8B42D 
X-CRM114-Status: UNSURE (   8.67  )
X-CRM114-Notice: Please train this message.
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


On 6/13/25 9:11 PM, Suzuki K Poulose wrote:
> ACPI CCEL memory area is reported as Non-Volatile storage area. Map it as
> PAGE_KERNEL.
> 
> Cc: Sami Mujawar <sami.mujawar@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/kernel/acpi.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


