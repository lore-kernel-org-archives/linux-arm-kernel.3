Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31A2CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 00:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dKXjEUftIgp77OKHDO3ncsIawS7cJdjkrLy6a3G9XM=; b=yjiMKTV/OQP1oELA+HAd9XPLfb
	G3iQ9Xc7N88TtvRsSbsW75PIQCwaO1Dik3waJdKem1GX2Zn+SCqELb3HhAE+DC6KliwESVEuA3lYx
	6HkYpVr/yaPDVVdNGk0jCCAweqveEVuSN2EUV3XX6NdZIcYcWTtb0qiwpyotHTsGbKquGoZc0U+Cm
	MJsxwnorEIkqBId/w0NiS12kATisUBAhm22stThRHgRONX/TsC5Gi3gFbXC3K1FLYAINaGoNAbiuG
	uJpBGECF4NWr6JdmjsDveIztRO2SJa1Pj9eIsmjhKv2YOcbAhe3Ju5JZzTJAZunvAWEzpyPvuyCRl
	gs2vA/SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDt3j-0000000HOEH-2105;
	Tue, 06 Oct 2026 00:29:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDt3f-0000000HODs-1A66
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 00:29:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791246566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2dKXjEUftIgp77OKHDO3ncsIawS7cJdjkrLy6a3G9XM=;
	b=LkWT9i0XgMwl+x5AbkeNxSWWhVpz05KjOpYwYdTenv/6EXXHhnQFioDZ7sRl+d2bwIwBJB
	D5LTZmDgn5Pl2y/I4yxU48i2is05q90hunQAzhhRd26yiGed61gBkwEW1JmokkzhxVPihE
	xf6DdUf6kx8xqungsUGPoymOMaW9VMk=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-w16IPM6APz6mpUBRjapN9A-1; Mon, 05 Oct 2026 20:29:24 -0400
X-MC-Unique: w16IPM6APz6mpUBRjapN9A-1
X-Mimecast-MFC-AGG-ID: w16IPM6APz6mpUBRjapN9A_1791246563
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a7ab1ca9f4so1955688a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 17:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791246563; x=1791851363;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2dKXjEUftIgp77OKHDO3ncsIawS7cJdjkrLy6a3G9XM=;
        b=urhxIUlhkF+8QM+qZitkumFd9BtCZG+n18bNDNYhdW5h7J8xONJcE/QrMmQifc7v7x
         GayuubL/FxeI+x05yW+lUdUXalS/TZk8+dJalQv/3xcFYbn+nugckT4x07q4+/aiy2a2
         3ohNqszD1sj6ZgFs2EYFud3Fuml7Mogw6J1kM9pZAz9uWygfu29DVAkj2XJTpKqN/cbK
         PInsB+piI9YIpnwiwnorTm2NT2DSdQAgJnja/lkTyfyhoK9VIeat02tFUHJrl+oahoK9
         jDqx4/WEpuLJiczZLQdcaMradHwyQsi9nJ3TPQr5uIOoG7x/mA1I4Jo9j0Gs6LUqq4FI
         moxQ==
X-Forwarded-Encrypted: i=1; AKwUvByq03ajKUUfce5gs7iO2wXhHSewW7o+TWEDErGnh/Zo+1UjpVipRPtQXMdcsbyqGJBPOVzjpP2GKBIviXqDURQo@lists.infradead.org
X-Gm-Message-State: AFq9FYI2JbKCVPr7t/vlP5MOZG93bZ4pOF6NOt9huT5paJiPmAGp5vIj
	Y5bNfoBE14+uHMW69w3obm48mdTphCrhcQ+IGALnSKO85tJr2Km+/torQlSrWlPaPBhxaHkqbbN
	srKTA889ci3nkoR3FxfBz1XTqt/LnBPF2eB8/MbAxAToItqSSh73T0iXHa5zOUhOUX8L/geW8Dw
	7M
X-Gm-Gg: AYBFou34ASPPnSsrgqEB4c9zEdx22wMxBL8a5XGIWQWJKbgE1E9AjMQMVSQHWLqck8L
	nJYw2ytYlFoLLVJW19BRP3fT8Wlv+7WyX0LevMs4nWOatfOwXOvcEk4Mz/LGD+xc0yArE/F07na
	ppbdVxUjo/tFtVpb6no3vddiOOELzjTg5JtrdDMdoH866EQI0rkkX/hygnJm1gVhpmMi9nSbXOj
	6IMmvuv7pmBfoGFF7kS666h9Hdj3B/YiISbcP0AUq67/tJ9sAHSSFL9vWPDR8hdTRQJPbGdt3A8
	n1CXYxvFiFcwdvjWT80ZXzR9eYnaSzkmtqUe9N548ZpKjmq8XoVDVteu8UZOwtOSbszhBbM9t8V
	KNwSoUXU2Z89ffzuRtbwLr5awbIlq1NoS1z8eFpdPuQ==
X-Received: by 2002:a17:90b:164d:b0:3a8:163b:b06b with SMTP id 98e67ed59e1d1-3a8163bb193mr3223730a91.57.1791246563181;
        Mon, 05 Oct 2026 17:29:23 -0700 (PDT)
X-Received: by 2002:a17:90b:164d:b0:3a8:163b:b06b with SMTP id 98e67ed59e1d1-3a8163bb193mr3223706a91.57.1791246562693;
        Mon, 05 Oct 2026 17:29:22 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533abe0asm1954324a91.1.2026.10.05.17.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 17:29:22 -0700 (PDT)
Message-ID: <9536a477-3d66-471b-b58a-b941e4a372fc@redhat.com>
Date: Tue, 6 Oct 2026 10:29:13 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 06/23] KVM: arm64: Don't call vcpu_set_pauth_traps for
 pKVM host
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
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-7-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-7-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wyGxAfPzWHCLH5yRqsHxJeBSicVe79v6kA2eq0L48Mg_1791246563
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_172927_400305_870E0A34 
X-CRM114-Status: GOOD (  12.89  )
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
> vcpu_set_pauth_traps() bails out and does nothing for pKVM hosts.
> Clean this up by moving the is_protected_kvm_enabled() check to the
> caller, in preparation for adding VM specific vcpu load/put callbacks.
> 
> While at it, do an early return if the vcpu doesn't have ptrauth.
> 
> No functional changes
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v19:
>   - New patch, since addition of this to the Refactoring patch makes it a bit
>     more bigger and harder to review
> ---
>   arch/arm64/kvm/arm.c | 52 +++++++++++++++++++++++---------------------
>   1 file changed, 27 insertions(+), 25 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


