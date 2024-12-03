Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22028E6C5E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 01:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cPUytPs4xOuYgB/EnXxQxcKY3Ggm37SPyVhQ2/dO7hk=; b=HEQI2qDMlLnaQUNQ8dOYJX3H0h
	VtFrXoKHuauho6gj2q1vajVAKOd/xG3kBZYglg0bbDgtu4LGBlbps+wdGEpcUge2sPx/RQpCjm1g/
	RsHfNjqARbkdkF1RPfPQFGPpetYg/vgq1+dV3TZ+9zbgysS7OKCjDgQ3aAIQbhhOC84KrrRi58q2g
	443bhoXfWf+52QQgAddXFmfWCdrSiNWG666CXN3DpdJ1OL6UgFIUUtzNTgDU3Wpq4m5Npf501ZClh
	UZt4QnoXnwtQyHklh/JruhwH1K/4n2SMfS+ZyJrpDH46pkc2ZnDzvrn+D4qexIBLHRBZtshxGsxgR
	Q94TYhFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIHdf-00000007vLA-2t3V;
	Tue, 03 Dec 2024 01:23:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIHcU-00000007v9y-28d0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 01:22:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733188948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cPUytPs4xOuYgB/EnXxQxcKY3Ggm37SPyVhQ2/dO7hk=;
	b=Qbxa4vWVNSRrafeK2poN2RlKiF56mtPdSbSXq5wUnLSFIqYvzZyUWFjunvQ5wIU4+PxNoQ
	VqghlrIsLufrpim60GS+7XgndNaqnUV2pIsKqWkN90S2tAC2sRdHottTED81hy6LJ/Wv5N
	2vCkcOGku6IzXCA/VUuBtWZurslEiqk=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-8KHKbRj9MIioNAOLrUL3YA-1; Mon, 02 Dec 2024 20:22:27 -0500
X-MC-Unique: 8KHKbRj9MIioNAOLrUL3YA-1
X-Mimecast-MFC-AGG-ID: 8KHKbRj9MIioNAOLrUL3YA
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2157145fdb7so23641615ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 17:22:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733188946; x=1733793746;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cPUytPs4xOuYgB/EnXxQxcKY3Ggm37SPyVhQ2/dO7hk=;
        b=AC3+ASr/lJlgJ+pvovDdtnr52yN4d6hY7tJ9smpLNnh2gc5W/T/EqqBjpd+K0oEiHv
         SNzVhWyDiWGvKo9gubF4pb6N3pGXfv0daugAiqriI87ybr2wkrvOh+dnQvAr+QpcgsbT
         4gAOlMajSm9zy6+ktvEEscpJ0UhzaR2XDYgnMs0oGhZGEqt5YFty+E+fKczrazv+vIqw
         9JwvGNxeL7sZyRk57oeDvHUlJNkr1DjCsNlXfNoQ5eG3g7xYC58jmDjZPMA0ziQBC1ap
         27FTEsjPt0V6us7x8Aowd5rty77tzrkgUXL7dsnR9UeqWoZ/JuLc45nJQ6rsa+TB6OEX
         EwGw==
X-Forwarded-Encrypted: i=1; AJvYcCWvLsM5QadNfMHAlWSnvOPi9eq+kYdJlRWR4Anh+3OFS9H6CB9lBUUdDydMui/fE87jAVAF642iII0u/triVfAn@lists.infradead.org
X-Gm-Message-State: AOJu0YyIMLWBMK08CTpPF/wqtEdqgxxVWXekkAr/85VVHxEimj4m+a8F
	JUx0UorpGhkXSkQkPY1sLHP667P46PRQpE028f8OxqwDN2AB9F2BcDWa5IoLFLk31NmrA5Hqk51
	eoSCijQJ3yF5JoxPis9N8gJ70sBISP7CfiNdEMIVYiT/aVpmJhaMXPLrHSEKTH7dNKmzubtE3
X-Gm-Gg: ASbGncuZKe9c9RKLNZMdN/cHUz7TterukgLtLD1nhAu2e6MMb2fXHT2LDKBmmdWZv9z
	nHu26pMR7UkuiL05fKt37oA5xp0+JsuBHLj94qtDb2JKOW8qtV9HmgjuWUr5EZjP4L4UDMznJsc
	U12rMbqHPkg0VSH/jkdwivWOjD1Ln7ESR0+18SOxnIcnPMQFSG4xBeaXwm29u+ffB11dSj1d0u2
	NZEw8bPiBGkcX/OvI8xHCLrlUGrS9l7cZUc1umNBCfrx/Rfes0=
X-Received: by 2002:a17:902:ecca:b0:215:63a0:b58c with SMTP id d9443c01a7336-215bd24bb6fmr8484135ad.46.1733188946360;
        Mon, 02 Dec 2024 17:22:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBV6VFt7DuoJL3pKgqlDpBzWxmRBzOP6uqWUIOrzw83q0XzALRysgqcdQWq3lT5Z+Y++WC7A==
X-Received: by 2002:a17:902:ecca:b0:215:63a0:b58c with SMTP id d9443c01a7336-215bd24bb6fmr8483965ad.46.1733188946066;
        Mon, 02 Dec 2024 17:22:26 -0800 (PST)
Received: from [10.72.112.107] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21538ecb0e8sm71320085ad.63.2024.12.02.17.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 17:22:25 -0800 (PST)
Message-ID: <2285bc57-bd9a-4696-ac29-73bb233c9b3e@redhat.com>
Date: Tue, 3 Dec 2024 11:22:19 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] arm64: rsi: Add automatic arm-cca-guest module
 loading
To: Jeremy Linton <jeremy.linton@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: steven.price@arm.com, sami.mujawar@arm.com, suzuki.poulose@arm.com,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org
References: <20241203000156.72451-1-jeremy.linton@arm.com>
 <20241203000156.72451-2-jeremy.linton@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241203000156.72451-2-jeremy.linton@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4HgMNN8sE_UVoe2AdyDaWwbUV7kHldZJZBcsI7xUPSE_1733188946
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_172230_628236_0742B375 
X-CRM114-Status: GOOD (  14.01  )
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

On 12/3/24 10:01 AM, Jeremy Linton wrote:
> The TSM module provides both guest identification as well as
> attestation when a guest is run in CCA mode. Lets assure by creating a
> dummy platform device that the module is automatically loaded during
> boot.  The TSM module will be loaded by udev daemon after it receives
> the device addition event. Once it is in place it can be used earlier
> in the boot process to say decrypt a LUKS rootfs.
> 
> Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
> ---
>   arch/arm64/include/asm/rsi.h                    |  2 ++
>   arch/arm64/kernel/rsi.c                         | 15 +++++++++++++++
>   drivers/virt/coco/arm-cca-guest/arm-cca-guest.c |  8 ++++++++
>   3 files changed, 25 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


