Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94326CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 03:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5cWiG6eJGXgBSN4c8Xoej81PdjyTj8pUWGToWroZ4W4=; b=JWi5Ko99VbegZIxRbd8cucuZF1
	Ha1GfZePgAEKKG3NjoSBT92PJLVX1BCE9zvRB527QNPnNZ5eVVlOeolIKxj096fTn7UDi4TNzkwEK
	8SvPLUxYOiF/hVf5Vd5PGjYXmVZ0cM/oxNikKlwYJt8Daz/TZ4Z43KBCz4XqJX86j4tzmEyWrGFOf
	5fw8vTcwxCwszibBNM4xcd8hekaSEpD8H6K//qxcESVtXiYJ9u9O0m2F9j5bZWJwTdab1eUKR9SyA
	9BVyzBlscFYNQOa+1TvYqqAx7WW1OJlu30DFTxFfpo8c/tIvIPaAy3R/PL22LZlUmJHbI8UwRux4S
	GTneA4ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvRa-0000000HXTs-0A1P;
	Tue, 06 Oct 2026 03:02:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvRX-0000000HXTM-3MVA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 03:02:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791255734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5cWiG6eJGXgBSN4c8Xoej81PdjyTj8pUWGToWroZ4W4=;
	b=i94iBIAdIBNYVuEJbFWbCmtJ7Ig9rtyVJaZiyETW5Pe/cDjEJY7TiVYabIPsFkvM47+lVL
	gNVz+eQxmdW8SUbaMV7uRciALvVxHxeKxp2cmRcjH5btk+KRopoyTwV5lsLB0aR5ODK798
	TvaBZDVHVlFFn9VWk4kjAiXNC4k+D1s=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-F6t_hZg1NKO5-gtekvunGw-1; Mon, 05 Oct 2026 23:02:12 -0400
X-MC-Unique: F6t_hZg1NKO5-gtekvunGw-1
X-Mimecast-MFC-AGG-ID: F6t_hZg1NKO5-gtekvunGw_1791255731
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a47a81e70bso2523206a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 20:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791255731; x=1791860531;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5cWiG6eJGXgBSN4c8Xoej81PdjyTj8pUWGToWroZ4W4=;
        b=sAo73UKk/KXlKah3ukHTUvsGC46coOh3KE5WKQBe8VNJyC2OWMiNdzjfzkVAIN4M7e
         8G0dqktp5Oh0IVpxgAkmxPdjbBuOyKsas/y9N9UAJ+URa9kppS+szXRROygX4hsE1lSx
         uH4z06xMhLPvLFE5s0F5wv05ZyLrq2h8nxA/ENbUipnAvg36qKPYe7EaR5tom8Qlnc1l
         sjAJItBfIX7GvS/71Ko1wM5u08tYyFjmcq/EFtFbd65PfDBnskPdDF+q+Is/ftVkxQoH
         8DTRDdDupLpDh+udwLL/8wkay76xgeAkyO6yr9FahrTGWD2+Ms7PIfYkkYFbbr/kiP7Q
         y5fg==
X-Forwarded-Encrypted: i=1; AKwUvBzP58aYL9Tm4AEbG2vWI1eyUnf051a1qAOnUdKGf47aBdaAXtPikCfWTPFAGVAp4zeBG6vP7pOT1w9wXnJLPxI8@lists.infradead.org
X-Gm-Message-State: AFq9FYJ66+uuVkzn/ocFNIio2Trqp5I9HDXzbFG5n1xdVL4DWYW1QJhC
	kyoXZs54AA17K96Ymw3iwvYFnQbER4G2McuDRf0PTfRxwl9cEHKknoxuUVqlEUfopWsHPtgf/7b
	UJRFs1yBKA7deQPCxDF76WvWBFz1cjjQyS2IKupRtOS5doaag2wbfdPDgqU6N1nf4OS2m/4jzTe
	YA
X-Gm-Gg: AYBFou2ef3mFjbEZlOXuMHvrhNJlLWGUawWwzjLsfd81JJDoQV4fTHPaLeLR2dGlFs5
	+G2GjbwIonIv8MMz0ly7hSkGR/1tTVpYHw4ZS1mpQ7Tot5BlwhghKSC/JZ9okWjm/KqyLEHhOvx
	SbrF+HulO8n4nTbbYftjqrZA2DGr5ORKPcaznGUFq1egz9STJ1ntnNdFSQa9w/mgqREeI8yn4SH
	hh665AkBOeLUTUO7pMAHBqqyl3Z9MhyEprnzPtlzxAe3MxeG0wwrmf3VAMAjnpPdFwKdhaTx35N
	smTEV6VlCzn8pvJVp981pJs0shf0BKxiUbDxsJCDUIVmf246RY+si9/wCB2ppcfh2kWWvi2BG6v
	Iy/NuRRWDlyHpGqBHpbNw4PpEGI6RR1F2YTb6mze7Cw==
X-Received: by 2002:a17:90b:5483:b0:39e:345b:3322 with SMTP id 98e67ed59e1d1-3a873515234mr14419a91.23.1791255731424;
        Mon, 05 Oct 2026 20:02:11 -0700 (PDT)
X-Received: by 2002:a17:90b:5483:b0:39e:345b:3322 with SMTP id 98e67ed59e1d1-3a873515234mr14387a91.23.1791255730940;
        Mon, 05 Oct 2026 20:02:10 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a851630206sm2440345a91.0.2026.10.05.20.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 20:02:10 -0700 (PDT)
Message-ID: <7a9f554c-f39a-4423-a84e-a4766c7223ff@redhat.com>
Date: Tue, 6 Oct 2026 13:02:00 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 12/23] KVM: arm64: Use a local kvm pointer in
 kvm_handle_guest_abort()
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
 <20261005090754.2140522-13-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-13-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UPH08ga0UPpN5NA8qI81XI3MbOlk6Ta9Tuy3jjsUaew_1791255731
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_200215_913252_A8884149 
X-CRM114-Status: UNSURE (   9.84  )
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

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> kvm_handle_guest_abort() repeatedly obtains the VM from vcpu->kvm.
> 
> Introduce a local kvm pointer and use it throughout the function. While
> touching the code, fix the missing whitespace in the
> kvm_is_nested_s2_mmu() call.
> 
> Suggested-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/kvm/mmu.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


