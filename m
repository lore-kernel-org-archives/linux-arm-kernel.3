Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70516C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 05:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALe8gaqPx0ivwZMUhNjC7kbkgwdK+iS+cXrLOMiOcsg=; b=S1Np9lUJOzUM4MEF7l+8wcLQnd
	tJkhxGw4+inGlz5oJyns/bMwos/9e4KmnQkh9xpvdScRvBp1bmSyJQmfcg9+5lXhmed3fB7dPw98b
	ZvlFqHWIsAbP2oRQgyImO//TDoSmYp8Iwbc9gQJl1/W4Wp7MDhHkWIBbra0HYMPlJVlm/1lfQPAno
	rOCSTEy1QTGJ1XKizXnzBTa9kSJC56GFismTR8CxPEElwkF148Lf3q/fzcp1/Rsz1uZSt0pMMZG7O
	lvPOvqrkz+43leY+dIXTT34WnmQjBVp1wzg3b05e0jHygjA3Pbf+3uGanAFG3hNkiAvo+oCTBWp0d
	tRgnqIog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpL9x-00000003ALP-1Rko;
	Tue, 04 Mar 2025 05:49:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpL8N-00000003AEO-2eTT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 05:48:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741067281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ALe8gaqPx0ivwZMUhNjC7kbkgwdK+iS+cXrLOMiOcsg=;
	b=cDYZOCKSbxHn4yVmmzNX4T1//MQ5xNEZvrJzW90+cf/xSm2FDmRY2QpwhTNhsxjFZqyQkl
	L/0KOZNWERGgROCSkRYyWgtY07SXmrTeqdFJsvBzZGoN6FH6zL4oVO5fm+cLOY9BO3or31
	bHB5CiXiVg0ux4H0lOQS2UWKusD6jK4=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-VzU7f-MnPe-t28usPbiKrw-1; Tue, 04 Mar 2025 00:48:00 -0500
X-MC-Unique: VzU7f-MnPe-t28usPbiKrw-1
X-Mimecast-MFC-AGG-ID: VzU7f-MnPe-t28usPbiKrw_1741067279
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22379af38e0so51901565ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 21:48:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741067279; x=1741672079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ALe8gaqPx0ivwZMUhNjC7kbkgwdK+iS+cXrLOMiOcsg=;
        b=Xw/1+2yP6edIBJelRp2G0wIRJhPh7J3euE7kNMFc8cfc7XnQOB52Meyh+7J2Z6ieAr
         K55x/lHNxOBPE9TXdMcgymC5gpsKkrVBxovS1/8WSiVTMj7KEr3eEcYs+4GSaGMT125t
         AN5/fz3YTe8uZ6Y30MrVgUu6e4Qxjje2fX2dMog1arimuUdfvitnesU607iIt8eJncGI
         tczSgc998LQ7jA3nFVpPEBqTANZI9N3aDQbixRF1zpe+8bSZed8mNlCGEj0BwzfP0pGF
         C+15gsODJXIt72+zrNQt2bxy5gedfpTZWEgSViCR8TKBJ2cbjVv0Ab2HgNCb0nFp1Xe5
         1GsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdzH8Ig2l9HSDCeDNNP/1DJpgB/Nb/+8X/vuLaXURtB7dwuQI0vHOnSPXfejcCNuaCBsEgxLqUJT/HIXf5dXlr@lists.infradead.org
X-Gm-Message-State: AOJu0YzLScsksZtgay8ijzBTKLiaiSXLFeJrb9Ha3onjRw/UxRf713gc
	8nHnjVTewt3bxaJD1zpyuN3QoRI0RYJ5odcNwMc2OFbwugEmms7Ifb6kCe4MSqzdVtfxo00poB6
	+MhRByK84zN3ycQMQSWQrIVn2VMaP2hu54fR5lU/3RjjrskYtk+oWMFfDHCjeyiC27al4/UC0
X-Gm-Gg: ASbGncvRVL/G3gka50zkJdxv7A15Bj9Ty2Kwh/ILounkxU1/pCqtHDmjF6AOGeng8Hp
	o3qy86rga0t9NMy3SCDg+HKeh+C6T7SlD0nNsVUfbxmxr6ApRnVvR3Z0nr4ufzS8novXEW6jttL
	6KUBhrDrrgyI6vidR4TOeNoWVNYELIKbkYCgiSmi2lqHoYuvXcnjFtyFsW1Xgxf8D1ADcw/ZTll
	5xF6qqO7jG7cvWzzO/u1UACCLwJIFOf+rGQ22Z6qlYlpunTiHRqVf3r4e0mdwQLqOFJbPdCFyJX
	HF688GeuIk4RWaoRhw==
X-Received: by 2002:a17:903:1988:b0:220:eade:d77e with SMTP id d9443c01a7336-22369255615mr277878245ad.40.1741067279411;
        Mon, 03 Mar 2025 21:47:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFx0Lhe2HGT1KmpDnS5ZyyAdNkSfy6p9uQW7gR79fCGqriIN6Hj8entskHLAJfXfbmV6sWD4Q==
X-Received: by 2002:a17:903:1988:b0:220:eade:d77e with SMTP id d9443c01a7336-22369255615mr277877915ad.40.1741067279165;
        Mon, 03 Mar 2025 21:47:59 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fae0esm87110695ad.93.2025.03.03.21.47.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 21:47:58 -0800 (PST)
Message-ID: <2505ead3-64a6-4135-a96c-85c5dfef26d0@redhat.com>
Date: Tue, 4 Mar 2025 15:47:50 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 27/45] arm64: rme: allow userspace to inject aborts
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-28-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-28-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZYvNmAIRxoniHf1yUqyCykabnuO-8Xc_6FaPnlgSJvo_1741067279
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_214803_751502_741F5832 
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

On 2/14/25 2:14 AM, Steven Price wrote:
> From: Joey Gouly <joey.gouly@arm.com>
> 
> Extend KVM_SET_VCPU_EVENTS to support realms, where KVM cannot set the
> system registers, and the RMM must perform it on next REC entry.
> 
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   Documentation/virt/kvm/api.rst |  2 ++
>   arch/arm64/kvm/guest.c         | 24 ++++++++++++++++++++++++
>   2 files changed, 26 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


