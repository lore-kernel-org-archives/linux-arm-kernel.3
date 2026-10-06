Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E0ECA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 00:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3isgNN8kiLtIbsG19uUxm1RN+HXpbBndqmLznSpT6Ig=; b=XbyS67Uthea8+c4s0YuygulKB5
	sDn8GiDtdVygD7Mz61v9K9u84Ryz8CWtvYq6+npb6SAL9hL5C9IMqgIEWrHsf0dRVW0LIL83q+Rg8
	VV1cVHtdTWbU9dBq1eisZIGgQ6sprqqRvpX7zPPRGsZKCxK63mJwJicTMliNRGr1UNcGUgke+Kum7
	haokCjdPHJ5iF0coYxBvLT5z97lnVX90swYaiU0NCKePzeXK/YBgI4LNX/bYWFQ9W7gBxaU5cA7Ai
	BDapkIcU5Ugyg0TbaKfxFik9742IHFKiRZJn/286d0afrquupKWCSdtoGHu2Ewg1cooYJfZWBJ7zz
	LMa1EJjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDseY-0000000HMi7-2gY9;
	Tue, 06 Oct 2026 00:03:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDseW-0000000HMhN-14UP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 00:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791245007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3isgNN8kiLtIbsG19uUxm1RN+HXpbBndqmLznSpT6Ig=;
	b=cNep+JQo4axXB+zS+kBdZCbLlodDSmYNKCYbbgyAUdqHB2hv4phi2K7+Ya2jUGKKxUKcTk
	dTk7Pt0tYZ38aYqcxCUsz14ttvpGW7yRjUi2k9u+WfeDv/AKdzfANCljwFW8ns4kL39cbn
	F+RuIuihirMcHiqbiyReq7ejXgno4KY=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-HzpMFNX3OTirpv_ejxxK2g-1; Mon, 05 Oct 2026 20:03:23 -0400
X-MC-Unique: HzpMFNX3OTirpv_ejxxK2g-1
X-Mimecast-MFC-AGG-ID: HzpMFNX3OTirpv_ejxxK2g_1791245003
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-395543dc382so2197798a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 17:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791245003; x=1791849803;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3isgNN8kiLtIbsG19uUxm1RN+HXpbBndqmLznSpT6Ig=;
        b=WSuZ0/FcaCSommKlms54LwdrFbUgEllHkX5gfq15Rtyaja8tB4R1VjeaE20/7wySOO
         8/kV4l+KKeDwyVrRIUDmgoVph1IlphDaQEw+6l2ET06pNPTdDNzvDkucF8+9uFywLb63
         md+bScLnsCxHudxmKCyXa3crYZFDdKI7wQ3xRRMRWXWVfsbbM91JgSG871MdPFFE6iMW
         1DuJthG7HsQMB6b5FLidoFdGQVJqoOdAYqHdEHW3WcfiVXhGcdOL6wvNPtLaKrdoDWmX
         N4MSemHPvsgnqf84/F579ZsItTdGFyDzOQS8zv6/rxyEb32r88DrWz1quR/++oJS/c+L
         kj+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzw5NINvuPXNpSlo/m/LDEF7P55FWST7IaKuthtbeCKcbRDqbyZ05QESI9cc76kyHPTMWx/jVSka92QaO3LtCfE@lists.infradead.org
X-Gm-Message-State: AFq9FYL/17S49T5rY4PgAwnzlpq9PItYU4ynVgTCBk9Ol8G8XdZ2zEoz
	ujx+q5O02adr0QC5kPfPL4KhcSZH/fo0z+hesU27fuimWzZaPXCftgff0YiihOmpN5GiVTnsbjW
	ZpjmzrppxkzK66oUSNO23OfymMx29DpMrK5U3u4EkXmp6RVGykAtEjDb0+dv6W9a4efMMRk5Zxf
	lX
X-Gm-Gg: AYBFou0tb71/pzBVQhOSwHgwFmPPlxRFQzevAJxKJ3X2hMEEL1WwGOTY0Rafv/x+Xaw
	b73U9LxVsZfi9hd/hdJawDz3itr4Nm29ZNr9DTTCIXKVH3PIKUNnjAgXc+rQBG2H+PCk91GOX5t
	HHctRPykW8BgVIN2UcXp60EYzpRrXNx2GiS6AQF/RblZxeJ9opypZLOzLGS4J1FLtMYNBnCMUpT
	9v9LKG6C0zGOyNB1l4jBU/eZybNRP2U6XfsOMoLtcjg23Saltr6XjWnlAHQUwTHkPdADFnDOAXy
	Vn6DiVELh7FyUWE68OCgZAEBqVHNodLlRucNIEvSFCtN2BpM7Q9AbaQxBOoFLNDhZ8DAnkXvySv
	KS5WckMsdpk9YuJw4THZCOkuOI0zE8yyafwISX5wmXA==
X-Received: by 2002:a17:90b:39b0:b0:3a4:c8d2:6c2c with SMTP id 98e67ed59e1d1-3a6ce845d78mr5199387a91.49.1791245002607;
        Mon, 05 Oct 2026 17:03:22 -0700 (PDT)
X-Received: by 2002:a17:90b:39b0:b0:3a4:c8d2:6c2c with SMTP id 98e67ed59e1d1-3a6ce845d78mr5199369a91.49.1791245002098;
        Mon, 05 Oct 2026 17:03:22 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dcbdd97fsm8611158a91.0.2026.10.05.17.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 17:03:21 -0700 (PDT)
Message-ID: <7b196a7f-d31a-4acd-9f3f-a24c0e78db43@redhat.com>
Date: Tue, 6 Oct 2026 10:03:11 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 02/23] KVM: arm64: Disable Steal time accounting for
 protected guests
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com,
 Fuad Tabba <fuad.tabba@linux.dev>
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-3-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-3-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zviGr2VHEsIJc-vsiRgnkCfi_Vhvbs98AGqeIubs5PM_1791245003
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_170328_382245_3BA818FC 
X-CRM114-Status: GOOD (  10.20  )
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

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> PVTIME support is advertised by KVM_CAP_STEAL_TIME, which doesn't take into
> account the kvm instance. Even with that, a VMM could skip the CAP check
> and proceed to configure the PVTIME as we don't do further check on the
> DEVICE_CTRL. Tighten this up by passing the KVM instance around wherever
> possible and catch things early.
> 
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/include/asm/kvm_host.h |  2 +-
>   arch/arm64/kvm/arm.c              |  2 +-
>   arch/arm64/kvm/pvtime.c           | 14 +++++++-------
>   3 files changed, 9 insertions(+), 9 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


