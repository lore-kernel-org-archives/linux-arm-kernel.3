Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0606C83038
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 00:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WE68W0bXQaTpxl/iIASF1f+Xh1LT+vGRhkdJSNq736g=; b=ZVYVSs1B1M2RDJ94g31hT3qgDy
	pHF9r83lgAxR9hObn/nKb2YNIRmKRj20gG4NUve4R7luWCbHqb/iXLtQEBC1Tn3lLimCo1Mjb90UW
	ZLGvEoThQ3C/+BQyrR3GccBNcdXOX3H4dqeEyPOrLSXmtzPi3fk6JvCAjaKzFrEwHIg0/YST4Od4F
	K2YeTbFTqnPjsKAbVvlvHkK7om7UVz3uUaTsPXVUpiEX4SG2TfGf8IEM3xz8efJFz35FRP68/OnzS
	bL3NSJaUObHRO2KwG94aWxQ5L17Clh6AAzZJqN/1Hf+l86/xtduqwHxgwRJgyN94qHrnXb4YyEwQN
	rMjELrfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWldu-00000006vV5-1xHW;
	Wed, 02 Jul 2025 00:48:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWlaL-00000006v88-3k2k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 00:44:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751417064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WE68W0bXQaTpxl/iIASF1f+Xh1LT+vGRhkdJSNq736g=;
	b=L/E4yAGUpje6KdzugCZ0jq+p4j/MoudsMtOVFhq/B5///BMoiHs55UhSUquvouSRf+HLPz
	RzyvAStt6Ee7jrA8C3Qg0r5cGPzVVB4PB/LuT0z2xlOuWPbAuFUpms9U4evvpA6AuJvG8y
	GaBQtBpoG9b26NkKmpe5qu9KKE3t0sM=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-ZlOllB7nNFegYSNVXav3NA-1; Tue, 01 Jul 2025 20:44:23 -0400
X-MC-Unique: ZlOllB7nNFegYSNVXav3NA-1
X-Mimecast-MFC-AGG-ID: ZlOllB7nNFegYSNVXav3NA_1751417062
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235e7550f7bso56459405ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 17:44:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751417062; x=1752021862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WE68W0bXQaTpxl/iIASF1f+Xh1LT+vGRhkdJSNq736g=;
        b=RznmNTBOD1UgwskEZ4Xek5Wrluw9+u5N8urmC0QH1OMZt8pJauqbgWWBuMeAEcdm0H
         Ms/W3nRfNjfbWKKXYDqh157mVNeVvnhVjwu51AdnvfdSyw9c1q/pR6DThXWeVo5+ecp7
         hMJh0+lUvOct15xjAlDfeEsjwIcCukawbVBdFTBnsN3cVJ1MXN91EHg30QO+TCe3EPzU
         Kmxx3bfGBqiQ+yz+mSyJeNliPdn4Jt1UQG7hTqImob6q+1ELBU75uoDvDFAiwapuWLrc
         EQ8c5PBnj+T2YiiQegNs6j1LkVdzHQaKrjW6VIdt+gioZNlxzI8tZGItFT1rgvpPWEt/
         GfUA==
X-Forwarded-Encrypted: i=1; AJvYcCVTj7pSc3FRX4NK3r8QSajQ1O4HY4HPBlwo663pEwx6Bt7ds3OibXJgLnm47lV2xJ0HcLqrvf0oGOLFdPLIvW/s@lists.infradead.org
X-Gm-Message-State: AOJu0YywM3bd14EcNEh26u8c3sCw03uPtbk258J4MT6DwDd/AgtMWCaM
	YQZ1VRGhBsi5SEUskuQCliaf0WtmjzdFie2+JCN9KBKLjYExw9FHy9tXPSIq0Ivxos0s2VxvuGs
	np4+qRvtjxgHUwOiv/9iw4SSL4yh0WmNZQYhLmXX1UcizuR+2WLha1yClhUZdKOpzMfY4+vGrFF
	AU
X-Gm-Gg: ASbGncuuWtvsihHsZFkSuVxISHx+/gTehKShY6P0KN1lIEiWEOjTluvE/X2E58T2wGe
	05JKgTV+ABf00IM/15UO0uJterfPT0UUQf/JGq+Z71CkvKpXI4wLWzWmebSvNpw1LUjwxdXvuHn
	Sz7fOZxIiJpN5jcxxwjHznbllyOttY5hlJ5FRqsdnmugMjvQpmJ20WuPa4aycohnvl3qA3ofRT+
	iwSFr/1QAmbR9usLys0K9Hksc7/azmNR65JjH9tZh59yQqMPzgpoxt7rScIaRWA5gQKy3GajSYK
	6payxM8g1zWNIjNb4SkSSgu9/HNys3JcMloXLfCEC2aDUgLl3k/4o5zqgwktxg==
X-Received: by 2002:a17:902:f644:b0:234:ef42:5d75 with SMTP id d9443c01a7336-23c6e583731mr8506505ad.20.1751417062329;
        Tue, 01 Jul 2025 17:44:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8Xe02tQUQpMvQ7JmZ6r+aJbfGWHLqnMc6SvZ+9EXS76Rb9Lau8L3Ze+pH8UDez4MEnO2doA==
X-Received: by 2002:a17:902:f644:b0:234:ef42:5d75 with SMTP id d9443c01a7336-23c6e583731mr8506155ad.20.1751417061963;
        Tue, 01 Jul 2025 17:44:21 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b871csm114358215ad.187.2025.07.01.17.44.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 17:44:21 -0700 (PDT)
Message-ID: <5eef96b4-2a33-4d52-a68a-323709beee5b@redhat.com>
Date: Wed, 2 Jul 2025 10:44:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 17/43] arm64: RME: Handle RMI_EXIT_RIPAS_CHANGE
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
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
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>
References: <20250611104844.245235-1-steven.price@arm.com>
 <20250611104844.245235-18-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250611104844.245235-18-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IIes_IWz54r5xzG5DpVmGTKvNTVx5O0MGjDg_Bi73o0_1751417062
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_174426_010866_9CD76633 
X-CRM114-Status: GOOD (  22.17  )
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

On 6/11/25 8:48 PM, Steven Price wrote:
> The guest can request that a region of it's protected address space is
> switched between RIPAS_RAM and RIPAS_EMPTY (and back) using
> RSI_IPA_STATE_SET. This causes a guest exit with the
> RMI_EXIT_RIPAS_CHANGE code. We treat this as a request to convert a
> protected region to unprotected (or back), exiting to the VMM to make
> the necessary changes to the guest_memfd and memslot mappings. On the
> next entry the RIPAS changes are committed by making RMI_RTT_SET_RIPAS
> calls.
> 
> The VMM may wish to reject the RIPAS change requested by the guest. For
> now it can only do with by no longer scheduling the VCPU as we don't
> currently have a usecase for returning that rejection to the guest, but
> by postponing the RMI_RTT_SET_RIPAS changes to entry we leave the door
> open for adding a new ioctl in the future for this purpose.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v8:
>   * Make use of ripas_change() from a previous patch to implement
>     realm_set_ipa_state().
>   * Update exit.ripas_base after a RIPAS change so that, if instead of
>     entering the guest we exit to user space, we don't attempt to repeat
>     the RIPAS change (triggering an error from the RMM).
> Changes since v7:
>   * Rework the loop in realm_set_ipa_state() to make it clear when the
>     'next' output value of rmi_rtt_set_ripas() is used.
> New patch for v7: The code was previously split awkwardly between two
> other patches.
> ---
>   arch/arm64/kvm/rme.c | 46 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 46 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


