Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA95C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 03:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBzfpKZnt5CxAomKzEA1Dj2dpRWqVssdq1NJBzT2e30=; b=jotglyJlQCh12+7HdTSR8UFOkF
	iHINtYVX7o+O/gCLOjHO229wzZIWSTMaw4cSSD83ffqHWSbHSLSV0PXwZiLUdj3WhivWSkfOCS60w
	49E8jZ9H6jqwT9DCjlVraqoTtjYtobGsN3QjGWK+//tR2TIETtAe2xTV0d2QM+mXuSwZM1DjvcShh
	cetNobgTLBuNhqUyw0zJE+/tFqvSso9dL9dx8kiU+/3hoOUvDaYFGImIHUEOXkCfV35TB8o+WcCbp
	CvIDVcI2gXaJsiDpqBpHpz0iWDhC/0vbAJOukRcnweGSma9SwBc2ZMszKXXkIutjRRc7lWIkOqYDK
	1eyByVfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAKqI-0000000Ed9j-1LU2;
	Thu, 01 May 2025 03:44:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAKnB-0000000EcqP-2nhF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 03:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746070856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TBzfpKZnt5CxAomKzEA1Dj2dpRWqVssdq1NJBzT2e30=;
	b=g1nldZIPuoOCTXcHfX71pL5QYQTEEOQIDxV8bzSKCr7m0qoPY0wFTYAwn1D9RANQfrZ37C
	enZ6Z/riKoBHvwwVSVpPR4rv7c7EHLh5svTPyNUAMF0rIdZeNNejMXRAgffOsB02vQ/Vdh
	ukLkAwmZ3zTHrcBqnfeeOAKSHSwJJb0=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-J5Gfr5tOMs6Q-iQiUeqj-Q-1; Wed, 30 Apr 2025 23:40:55 -0400
X-MC-Unique: J5Gfr5tOMs6Q-iQiUeqj-Q-1
X-Mimecast-MFC-AGG-ID: J5Gfr5tOMs6Q-iQiUeqj-Q_1746070854
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-af59547f55bso330232a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 20:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746070854; x=1746675654;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TBzfpKZnt5CxAomKzEA1Dj2dpRWqVssdq1NJBzT2e30=;
        b=YmQ+fZW79nzoeQn89uU5oatPp47bb+eYmTUS0mIfdh/nha+kxve5xLHj1X8rQfD2Th
         P9Wo59Mt3ndXI7m9HVpEyUHRTQ7xc8Z22YHpFYZJrTb/z+pqkMqbyN7lfo3vo3o1wjDB
         6jZYnE6PlD8Dpl+KC+4KDvTo7XUrmLOKjQ4lPt4vPgxJBAmCKW5NjxzoG/0MN8Q2C54G
         cr3RV7Xvb0TCTASu8OZhotvLvMJnDoJB+TC8GOMNp3v+gqifoVps6ogjiCS+ez4jJapl
         Ku46LwFn09f7y2dde8bdFHawv8j2xWd/5fsebQAnfxdNR7NpSGAAOFVXB/EsVVJR2f4j
         ecww==
X-Forwarded-Encrypted: i=1; AJvYcCVtt5C3a5vmpAVB94Lwam+Gn/CWc4Hscx/pFShPnQPRD80GhQSWvbuUSmrECziWMEYA3HIupF97Awt0Wesju9gj@lists.infradead.org
X-Gm-Message-State: AOJu0YxJFN8aGtLf6eOmvZ6wRwbu9vxf6kKgQWCs+jiOas8p0WpShaSI
	HOGmCZvnN+9zZOBUi/x7WU6zkGmK3VCizEyascVuzegxPcB3FFchQQAnDipo6puh22ollEr0bKe
	mWLxvWZWq0gWC9Epkjbq3G40yefz2lD2I2/EFjldC15Y1p7j6J10934H8Z+qdP6XA0giBwrjd
X-Gm-Gg: ASbGncs7AsBRX2I6ijDBDPU4+asI2gl0+QLGcAIuBXehNf1YWFyuZGSWz3O4OKctGKv
	gXfSmvyxIYTi7h4P6ggIewqCDTgzp8J1hWISXMoeLXJRrIXUIWuELE+thjKFI5CIy5RtNWuCPoH
	Lz7tBvWGZ1qGRWRmapoK/w2XM1ZPLj0BHK+hTZxSG6SGcN23EcYLgQCRTOWOEPs/dU9IzWXNrGZ
	Wyp1jokImyHD6vFItkeDg0UeV86q5Y6HPuEqHLgqW18WC1QNvG43uy/eOBy+kxCJqQVXTuyAVNI
	0ueOySQoEes7
X-Received: by 2002:a05:6a21:1788:b0:201:4061:bd94 with SMTP id adf61e73a8af0-20ba74f9efemr2316692637.19.1746070854024;
        Wed, 30 Apr 2025 20:40:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcdCIV/XU+3thu81d9MiACXjb+DjhRRhcxhdfe4+xkJBBdN6cJ+Wf09/OtaoBNYxBmSezekg==
X-Received: by 2002:a05:6a21:1788:b0:201:4061:bd94 with SMTP id adf61e73a8af0-20ba74f9efemr2316662637.19.1746070853706;
        Wed, 30 Apr 2025 20:40:53 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a2e75fsm2624953b3a.98.2025.04.30.20.40.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 20:40:53 -0700 (PDT)
Message-ID: <0be0479c-13d8-4fc9-9128-a3d414392a5b@redhat.com>
Date: Thu, 1 May 2025 13:40:45 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 34/43] arm64: RME: Propagate number of breakpoints and
 watchpoints to userspace
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
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
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-35-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-35-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nxtm2bR2OrJBCzxFayzuqXOvi1FT6TtZi3B30uN4-Io_1746070854
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_204057_777800_86FA8125 
X-CRM114-Status: GOOD (  10.86  )
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

On 4/16/25 11:41 PM, Steven Price wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> The RMM describes the maximum number of BPs/WPs available to the guest
> in the Feature Register 0. Propagate those numbers into ID_AA64DFR0_EL1,
> which is visible to userspace. A VMM needs this information in order to
> set up realm parameters.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/include/asm/kvm_rme.h |  2 ++
>   arch/arm64/kvm/rme.c             | 22 ++++++++++++++++++++++
>   arch/arm64/kvm/sys_regs.c        |  2 +-
>   3 files changed, 25 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


