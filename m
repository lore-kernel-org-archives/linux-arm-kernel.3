Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A2EC9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 00:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2m73jnLSddTXID/zMijmWEgMqVn35akPc9oFGshsowE=; b=dMvlg2eccEqGz6+UGZo+joeP91
	BxwpDvSfDPo1VTq6Kge/jaimquBBFL9hSfvXz+i+R0Q2VgUWEAbK+AYNIZ4EyuWMv/u4wC7mCXTZi
	XrhljaeYTKG2IOJ9PVUDewCsnVYPCA+f6wafd0Epy2GXSwlEylCv0os2Iqi6oaPDBsh/KwR8LGFPh
	f6aQIi7DYwDGkqUux6ULTRmsJgfsFkhfZ4fe3sytQVbcnMGq18FNg6gXn0iSDk2rwzgjHwRCmPoZ8
	XJXtp9b7Se1cSAtqUTbwz0H/ierzeMtRS+eznGenFHwcA5ko/LKu7ZjaoPcN9OlJTbDvo9ujpAYkx
	cJdVT3qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAz48-0000000H3Fo-2JG5;
	Mon, 28 Sep 2026 00:17:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAz46-0000000H3FR-3OAF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 00:17:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790554673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2m73jnLSddTXID/zMijmWEgMqVn35akPc9oFGshsowE=;
	b=BFAqeBTNvA0oPO8w5a16/g2OwWHe4lpQo11zmnLZxZy+veF/QwIbV2XHS1/D4wFYoEKqfV
	/8i03xM0d0vxq1B4rvVLRxwtyFkvO9KW2M4JXr77Egw9x/Buifb9uj6JZeErg9DruWdMKk
	j0h/g/kjRWztKZgJVzPkW7b1TuebXGw=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-DejmxgBnPOKoSDbX7gzIbA-1; Sun, 27 Sep 2026 20:17:51 -0400
X-MC-Unique: DejmxgBnPOKoSDbX7gzIbA-1
X-Mimecast-MFC-AGG-ID: DejmxgBnPOKoSDbX7gzIbA_1790554671
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86917d18a02so1953009b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 17:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790554670; x=1791159470;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2m73jnLSddTXID/zMijmWEgMqVn35akPc9oFGshsowE=;
        b=uQn2x8gzqxk6bBR+Abqe79vc9oDfA4ybqlm/Ni7fhHWtFqqQJnZ/Y03x0jvtXd4868
         MQQZN16+20pI+Zf7FcanV1K8fBgDxBOWnOkSwrlK1QQun5mU+z3/kdWh5IxAT++WDZNT
         AOewJKPyMgxzIlvq8xDnD/HJY6pgRH9tQL33ZcTMDOrlPDAaVVkLLfMY+oDJxvcWEycw
         J4l58JdHqEp1b30G7Tl/wYRIEFnPKf98HCcpLiUwEsAb7fal7pFC0yUJhZkC8rHf3Iez
         m/OzNnE7T09YFFZoc5bDaraWwDnStNvGoo+CCbV+AzrNRwP+eoOMca9rU+cLiwerNav4
         HMuA==
X-Forwarded-Encrypted: i=1; AKwUvBxL/Vm8oL470Z8VUd6/T+XpZiKKDBzQZ3cDjb+oohHo11sDtTdMTNLBQlg1etmD/xtu3q8eCoJIEXoK3ZnnPtmB@lists.infradead.org
X-Gm-Message-State: AFuF++nalC3Cf5K5fWicHoUkaI6A+7Z0iFqFZZjWTws77Fjwgqcw0yE5
	AvLiTpUFMC6ric/N3Z9FWPShZh5t/T0W6qIS1MR5gDyj8MQHd1h5XnoaeE2BrNt5+m2lSIdvkmM
	yJjdmoDMwf8W6YJ+L3wiKSmK+Y6ED8zzPb/Fs+Il2CRt0A9d/JbJXoWSkVCwI98uVeXA3NYaCL4
	LK
X-Gm-Gg: AYBFou1WKQCNJZkjBYd4iVOgZa7WmLJKgQmUye42h5XsvYjgfBx0+HiEj1Ot+OSBWCL
	ADi3RmY6i13T2oJuTn8k4mzSJ29+6dqK0n9ivJxoVddhIJE++hBz0UX7Lxkphxc0elEsZmTaItd
	FMkJikWM4PUxFRziEZCeiLMfcqd5fnrghQJ5KD/xfHgMGq56+wF+RC9/U8xkH2F+0Oj+Mw33AUP
	Geo1kTKhCNxp4Ft6inPbW56JIYuZKEoykDDMyfhvuZZ0zSevaOYWiqggeMBj9E8IThn494LPJdp
	vU6HZRZjwVh+Yp5CkEvCeBFEWiVy5nRY7vhoxGXRaeQ6OvmsH7R0SHp6ipRMn0dstd//jQQQ0PH
	oYYte7oealWsRw4qF+qg38Tx6ID1DOkETR0oVJc16Nw==
X-Received: by 2002:a05:6a00:90a6:b0:878:34e7:9a3c with SMTP id d2e1a72fcca58-87e9c06a4b9mr9378163b3a.53.1790554670522;
        Sun, 27 Sep 2026 17:17:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:90a6:b0:878:34e7:9a3c with SMTP id d2e1a72fcca58-87e9c06a4b9mr9378123b3a.53.1790554669847;
        Sun, 27 Sep 2026 17:17:49 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-880951dbb8esm2754588b3a.24.2026.09.27.17.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 17:17:48 -0700 (PDT)
Message-ID: <ca399842-678a-4c82-81fb-2c66b95329bb@redhat.com>
Date: Mon, 28 Sep 2026 10:17:40 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 08/20] KVM: arm64: Reuse kvm_stage2_unmap_range in
 kvm_unmap_gfn_range
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 Fuad Tabba <fuad.tabba@linux.dev>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
 <20260920212845.707-9-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260920212845.707-9-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Xge4UXe-pVYDbL5LiHDnj7i_j-BZcPgphMcBR23BOjo_1790554671
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_171754_948139_606EF2F7 
X-CRM114-Status: GOOD (  10.42  )
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

On 9/21/26 7:28 AM, Suzuki K Poulose wrote:
> In preparation for adding VM specific backends for stage2 operation,
> switch to kvm_stage2_unmap_range() instead of __unmap_stage2_range()
> from the kvm_unmap_gfn_range(). Drop the bail out check for protected
> VMs and defer that to the one in kvm_stage2_unmap_range(). Later we
> would replace the logic in kvm_stage2_unmap_range() with VM specific
> backends.
> 
> No functional changes intended.
> 
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/kvm/mmu.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


