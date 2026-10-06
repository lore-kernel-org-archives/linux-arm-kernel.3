Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84FBCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 02:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Di6epxlZpoHDGpBk057UhpR75wL2RoTA8HU7YmJFqJk=; b=uf90erzapWq1ckernAIyrgjZ/K
	aoVXJVzwfp5loHR0hVWV6s6Ri3rK8/Tue0roU7/i/6JCXqkzUGv4aBCnr5goVr/WXmSyMOU5OaFSZ
	+IQnKveoNXcQTPkvanWOCn6ZpJBTMD2hxmUwxfzN7z7cbx4arzYJOcVYJ+GfN7+oTWg+2J/cYdG3F
	dVwYHlQ7SkWS9pk4FGyh2irmNHwpXhxiiNKIpo9l3SdkkCbg/rB5DqyAVqu8k69zrIlb8P9jCkg5a
	RzzIH5gvQeF0o84BeQqCMJCLQnZwHKQJFHG8rCDCRIWV6pm0iJu9SSfBL1XPwV6HyjuF92sro3wdC
	ySCA219g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDv4D-0000000HVoO-0s9C;
	Tue, 06 Oct 2026 02:38:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDv4A-0000000HVo0-24bV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 02:38:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791254285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Di6epxlZpoHDGpBk057UhpR75wL2RoTA8HU7YmJFqJk=;
	b=HSpAXAOUUYSZc2OJAmoZC6rREC0CQjbxzj/1zkujGfkLLtWL73gwP1NHRcmCLD/m6ieUqL
	u7A7iDe8X2xYr6kTLqEGb2HmC0PgH2vhPODdRwC/t/tfRQuR/+OB5RVxFgpgE2r322e1mN
	wuI2YT8uByqxMaMvT97lRH2k4yINPjM=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-b77EhyhZNwyRu_8UFI5fHw-1; Mon, 05 Oct 2026 22:38:01 -0400
X-MC-Unique: b77EhyhZNwyRu_8UFI5fHw-1
X-Mimecast-MFC-AGG-ID: b77EhyhZNwyRu_8UFI5fHw_1791254281
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a6d95d6e08so1885071a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 19:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791254280; x=1791859080;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Di6epxlZpoHDGpBk057UhpR75wL2RoTA8HU7YmJFqJk=;
        b=tJdgeqeBjzUVKW8/y+eqnz3J52FQlMKyKyRqyPcmVh7gUCOjiVw8Crpz3Iwhm7VYIo
         e+28rGCPcUIsI0IMVucXF7MKY5QGWfqJW8rHJuHjKE4uBhRQmg57d9w3NJNye5AJ5CeV
         KmmDc2Q6Tp9eiv2e/76JvTw2us2GrBebGYWacaCCTQLEcM4OxtewOtxCxJ3QlWJ2NaB3
         PjsfhKIZclLZ6shjcFglbeyfghZc912aa3lGgxkqyuiTsPmDbFsAhsdOuQWT/OxLQAB6
         0+ZgRP9fmj3BYrS8vhfax7BG8t/UNqJESu3rnuagHpoP1nIAqUtDcRPW0H9eCwQonWSu
         nyxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQMb1aCyR6lU3+53xIBPkNCO1eMfpSeC2VEGcNmBcxwc3FmqQbBGxuYagd4XstMceaZHYlb3/bbNj1Rh8tqdTN@lists.infradead.org
X-Gm-Message-State: AFq9FYLdR+Cvoo0hkrXzx9lJPEQKUXULaoYNvLWA4MsY26Yd7gYBroCr
	24uhzfrlj7TBl1MtwIK2QkjBF7VAKGGBjVM5MT01TYTmVumXD8Erl4x+cfDHql2Bg6VirSXfSiW
	1BW9MrXA9r71iGkWkhcGoPknF3yAsRHy8hqu7GOHimWsaiIiiEaFv+UNAc1O5QVtQQg7nskiWNW
	oV
X-Gm-Gg: AYBFou1+ECXMbl40zg5v5F6xER9wpLT9eJt4We/ei6JPSGoyRDp6KInrZV45oeidaOQ
	Dqr7aTEw84MEobvMMqLjHqUEzoAeXaGbt11NQ+Eq5p7g1nYGXV9RTv90AYVOiZ1bFfWv5g8Zfxo
	VrSVN3IOKsvuRHWXVW0NurD0dTqW/bMreMnDsFDuUUj3co1oJteuSn/CoUXpgzMDxnNIz+Fc9xQ
	qk5zZ85Y4fm443URgTzTYsD9LfSrjtzAj6Pu5roDCK6Rv+DL+dE/Q39f26y2W2RM/aqZjRksJlP
	d30Xd04LL1HFUtqjVNf7Yjh4ttDx5kxnM3DIgOykW6zua63E9akr8/cxiPDtciIovTlWcElGPse
	hfzCwJlnQsluv6pDwiC+BjQDRcVVB5Lxr+Ne14iNT+Q==
X-Received: by 2002:a17:90b:4d09:b0:3a7:9413:cfa3 with SMTP id 98e67ed59e1d1-3a79413ddc3mr6299037a91.55.1791254280393;
        Mon, 05 Oct 2026 19:38:00 -0700 (PDT)
X-Received: by 2002:a17:90b:4d09:b0:3a7:9413:cfa3 with SMTP id 98e67ed59e1d1-3a79413ddc3mr6299010a91.55.1791254279897;
        Mon, 05 Oct 2026 19:37:59 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d2406b1sm1679514a12.8.2026.10.05.19.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 19:37:58 -0700 (PDT)
Message-ID: <c8930670-32b1-4f20-af0b-a13d17b45044@redhat.com>
Date: Tue, 6 Oct 2026 12:37:49 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 10/23] KVM: arm64: Consolidate stage2 unmap range into
 kvm_stage2_unmap_range
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
 <20261005090754.2140522-11-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-11-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5LseqQz3jjmwwqlrVz6RUNTZkiwuQDEceW92EDCAw4s_1791254281
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_193806_635832_36870FD0 
X-CRM114-Status: GOOD (  13.35  )
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
> In preparation for adding VM specific backends for stage2 operations,
> nuke __unmap_stage2_range() and fold the logic into
> kvm_stage2_unmap_range(). Also, make kvm_unmap_gfn_range(), the only other
> user of the __unmap_stage2_range() call the kvm_stage2_unmap_range(). Also,
> while at it fix the comment to make it clear that mmu_lock must always be
> held while unmapping. The code already mandates that and the two call paths
> do have the write mmu_lock held.
> 
> Later we would replace the logic in kvm_stage2_unmap_range() with VM
> specific backends.
> 
> No functional changes intended.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Change since v21:
>   - Nuke __unmap_stage2_range and consolidate the stage2_unmap_range logic
>     into kvm_stage2_unmap_range(), in preparation for removing the KVM_PGT_FN()
>     for stage2_unmap
> ---
>   arch/arm64/kvm/mmu.c | 38 ++++++++++++++++----------------------
>   1 file changed, 16 insertions(+), 22 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


