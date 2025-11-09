Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C0DCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 23:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ub4HwkWXj0kR29vkzdE7MXJ+PIlZjseX2UvZ7umPC1M=; b=CmYrMHaMnAf+C+kB3GLzIhTgkv
	PUN1dpXGDdFVDKQ5tvdCsR8T1arVQ9qdNS/Xw4o6HC9JJtwE2JEP36W1KAXTnGTwXiUuKRwqiZ5eC
	WTEO0HkLhtoCBFSccLhuUn8Ipa8GVtDreMm+ZlGK5DeOoChvaPdkataSwvd6FRpoRcVSB/We8qGEi
	k37Pu9dTTkcKEMJWtaWBEyeg+rs3YW3xFtqAkHvbLKVPt0s7XwYlAZdTomMnFVV4WyysuN1dVCb0C
	mdmt+6TIw/OTtp5Bzb2xgQlfUOZspIfJvzkMqLBKPFXELYsJtylFzkvTtjoDDd1HrnwZD5UlYYs+5
	g5y6hbpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIEhl-00000004UUq-2THG;
	Sun, 09 Nov 2025 23:20:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIEhj-00000004UTv-07R6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 23:20:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762730414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ub4HwkWXj0kR29vkzdE7MXJ+PIlZjseX2UvZ7umPC1M=;
	b=OAzj/dmepwXVPMUS0Y8e+J0jAZSCotQyoiR9BxnAcJTOP6E6/efFIXZ2F6lrEKlLzRMTyO
	tkNPtQegL8kvOtOk5n8V92F9KA0AvmxJ+h4hLEVoikiYotsEzYP5hz3cEpbjMzy0v6maQa
	Y5Y2p6DRyvJaz7mgA5EZO+63l2EcTWI=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-QCA-302BNhK1jxE0rQsWtA-1; Sun, 09 Nov 2025 18:20:12 -0500
X-MC-Unique: QCA-302BNhK1jxE0rQsWtA-1
X-Mimecast-MFC-AGG-ID: QCA-302BNhK1jxE0rQsWtA_1762730411
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2955f0b8895so30568105ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 15:20:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762730411; x=1763335211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ub4HwkWXj0kR29vkzdE7MXJ+PIlZjseX2UvZ7umPC1M=;
        b=Tm2VsoA8aIOKLgT2mpJXsMvyJSy5CDr/Ej9SY3ulskWnCDOTojFPlNWevsWEtPhDQ3
         ZcuCLws8PjL3SJqYL/L+V0KlypppUoKomcxsDfRmDfz6wZ6EXrtaKQ+AoAeLlgAc6X05
         F33xbHMFoCZOdRMLPpKwe41Gdse1IoxEmKsrbRK6g94xCO4KoaK5GaG8NNCSuQd8Dkif
         a5DJOvNck3bnDbNRdNbB4FZzMcr2vAApZRYmjyjGNvuJI5OaQlAx7amUqckbMmhtKKv2
         BEOehERuBS6d4BvbEtAK0gyL+iJc/0VTiRU6IzjYbckgDyCIPan/rFv2VK7LUu+2pgCj
         d02A==
X-Forwarded-Encrypted: i=1; AJvYcCVVVIiDm1xwv+GmFfCRn3e+MR3XwBpUvE1zGbU3sHxIQoqPTmRPZUo+v5MTkXopm0uM40x76t1lFXbBS7DuHuvz@lists.infradead.org
X-Gm-Message-State: AOJu0Yw99zxb+heVn24AfRVuaekS3BD+wBgLchViZffLDv8dQ7YMtOIR
	n4nuLFxQ7FXuGBH4R4A4XQH3QAo8O5WcWMrTwphoDmH0ivxtqAN9LplDfeq5Bv4qTSYeFcw1kPc
	gxDrojLz+TFesk+32lyGvjSy0t4z1NdHO5M6fdoNY4yU6c2zE4aq2qecoJlAbIr5ZV3girpajO9
	u1
X-Gm-Gg: ASbGncuakNVhXr53O5wBp2odxnczyhHp1WqmnQnVtxHp0XsDsSZCcepVSaYHEEE0YKl
	WBhpDOFyPBf69In/xhb8QYriBjHhU8ePDkaXJbgzMs+4GEG4/CmR6jSQ334vkjde6oO8x7JPfHb
	1KZ0dnIcOmRB4C0xlGM4ep/eZotJqkXYRhHL8ePKMS7odJLkjI8c+MUFT6K5E31GzuCWeFz9fN3
	l7hCPCpdiKP7LECJYfguyjl0mc+yo6yXNw3xQFCG7flK7lP/vnIhl8BD0S3PZdwjB/8DyI7TaUC
	Y57ww4zjJxy/V0BMl5HI0DT2jD+EfcOrbLqJ7GrU+vnJfl+hPHGvhZt6h/qPEjvwWXmD/IOv13b
	hy/jhnaln2KlQyKDDdtQLqtDw34iA8kYLia0NVoc=
X-Received: by 2002:a17:902:f707:b0:295:6850:a38d with SMTP id d9443c01a7336-297c95b383emr105100695ad.19.1762730410848;
        Sun, 09 Nov 2025 15:20:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfT7bPjU7rlLqD1mvfy96eNWnGcGXX4eCviCus1dyeXGa2C8aUiTh1n4HBCdkV+L+6gpZHRA==
X-Received: by 2002:a17:902:f707:b0:295:6850:a38d with SMTP id d9443c01a7336-297c95b383emr105100275ad.19.1762730410453;
        Sun, 09 Nov 2025 15:20:10 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096dbe4sm122937955ad.11.2025.11.09.15.19.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 15:20:09 -0800 (PST)
Message-ID: <62a6e89b-00da-4901-93b0-255c0b72a16c@redhat.com>
Date: Mon, 10 Nov 2025 09:19:57 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 33/33] arm_mpam: Add kunit tests for props_mismatch()
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
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-34-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251107123450.664001-34-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TOacaZjPbrm9fS4LnC6fjTfic7LL0n0IflmXgTXrUjw_1762730411
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_152015_151175_DF520ECE 
X-CRM114-Status: GOOD (  11.99  )
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
> When features are mismatched between MSC the way features are combined
> to the class determines whether resctrl can support this SoC.
> 
> Add some tests to illustrate the sort of thing that is expected to
> work, and those that must be removed.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_internal.h     |  14 +-
>   drivers/resctrl/test_mpam_devices.c | 320 ++++++++++++++++++++++++++++
>   2 files changed, 333 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


