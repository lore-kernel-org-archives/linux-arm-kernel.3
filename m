Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6C1C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 13:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQylkDyhUMfAxwzHJuOU6RYKfPVocoG2MM8Zczy9TIY=; b=f8p/hCREmr1r50pj7kh+0yxl1U
	GunAxIRj2qd8Vf4zaUNGtGHhHbQafwJZ5Dub6s4/zclrmM8blEVXGQMbadcU7iP3EVhQ9sV0rVe6x
	D/9+0Zc9HU9IWF7eCDaa+YJalw5rTK49r7fAcsugY3csD2n9CJdZrOKunuSvdVk87xzsxV409uW1Q
	ZAwQ+bSWWPYeajJZWRxf6WXUVey5QjVYsuxtTbyo2/PYqzhUABMEtKGACpvDLZLmsD7N6C5eaMGdP
	IA9Hf5AYXB4DShGKW+XrjBVw5ugGdELVUtA3q7tKMP4AsG2uXyK3ZYI9rm/LqO50ubrnZ6IzS9lCq
	RpxpLFOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyqpn-00000000pD4-0nKT;
	Tue, 25 Aug 2026 13:04:59 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyqpk-00000000pCh-3ksG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 13:04:58 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c167aa9500dso720750466b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 06:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787663094; x=1788267894; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PQylkDyhUMfAxwzHJuOU6RYKfPVocoG2MM8Zczy9TIY=;
        b=a2UacGckLJMOCeJx2xe3t915Mrl7b7TibmVVjgZ2yksdzS8fX81Rxiebt56Wc8WfIh
         SwsQmIWeYNzZ+RNcZsIMYvW0e64pDbb5z0nbfAPIGYWmckKIx+WUhhAfMlyP2y7iedXc
         W215yRb9afDo8JnVHIzPQUuRzbjJmgRzf6VrjZ+ZW+LWiU5dJWNrWJ8qeqdvhAYfwmAC
         DFv4zhwkNoKZwhCyzq3uOC8ylLzYRBAyu4PWzrMFEQJBODmOfFXmoYRJRwRwklzjQCWH
         CTtx2+2fIbf+BKsYFdULMsWxj2Q9qrf2j2Fhjo0EbNiCZ2Xy/ZNCGVFbxcsZMQGU+lBH
         xGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787663094; x=1788267894;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PQylkDyhUMfAxwzHJuOU6RYKfPVocoG2MM8Zczy9TIY=;
        b=mWtt5/22WVJ8zb9i63OETGnVru3cWgrSw4KsLTj/AjrdA+aTkaE1ChJhKbEeL6yuuz
         qSKv2slV50Xv/RIhHcAw6tRe/KIhAMX5L3YahwvrD8+opSznrYpfBt/WBTQ26lRH2R/Z
         uqlmbr9S/W03w/xLARQOJfHkfFNPz2vSvxLvq57ah+iOaouW3UOMHp3ncwD1rHejKAmw
         unDLChJK0bhYxgcqLjBfObKsSXJiJt5jJDPoQBEqGdAmX2yWkjpbLV08R6ZbWnUO4Xfr
         FBvLsFqsIlP0KKPilv/sTMWZYoY5lr+szIVUAw3JkhRrYhiUUDwN+myFDaUJ6vppJbWi
         t6gQ==
X-Forwarded-Encrypted: i=1; AHgh+RroNkafGSJ62O3ZiX1kyO+l3OirZ/zPZxZG5MIqdu3JZx0orKN9aIuja2+tUaOVNmZYXt69eC5KC9ucl69QVaYf@lists.infradead.org
X-Gm-Message-State: AFuF++mS7PAgWSe/mNgd87/4fHXeqtMCIz96kAE0wWuG2KhijZBq7Yga
	9Er2LvmV8A5uomz9Ek071HgnvqBanZjkgCxhn4KOF3UfzJVozfsAsEzr
X-Gm-Gg: AR+sD12Em7zmyDKzisT6xGQ2+AKjTrq2f3Ngmeim05ulVDo4Z6Rt3ZUkMkjbEyg7kc2
	YNN4IVKjkQ7MSnosCfufopIdOO2Qf50bKAUIPSB6MOv71CJQoUlZF7nXNbyYvUo210tS74eh8xN
	ksfHvaodqRgXIQxJBwMCV71O3uLXPYxvPOjPmQJkxQeWFgogg471vSqKnuQPfe8Hd+joS92bfFW
	cH7rolRcnsbUFU7dwh5lvHsMh86wF8XD02DWOGA965K7PdIfse2KLuzkloherD/mxrJp4ye5HSt
	bmqXysANFVI8idgUmWewTIfvPQjf4j4bxZx68YkjexZ/u428K51YKZ7nBH/4Gn0w6jR/SAVd9sL
	NbJRTDgV/EMYuOhMWDZ8+ztk08ZPHLc8REueJi/inyMzOe+K+e63th0IifqCb2f6K7kgaBMYzk/
	w1vbRQ0aHZWNSxZl/UePfgw8xkrsYqjpZ+r3y397rH2IdFfLVxI7gFjhuou4GaNtl53dwIMw9yq
	ihB
X-Received: by 2002:a17:906:fd8d:b0:c25:58e:83ff with SMTP id a640c23a62f3a-c25058e8844mr45353566b.10.1787663093845;
        Tue, 25 Aug 2026 06:04:53 -0700 (PDT)
Received: from [10.45.28.110] ([15.248.2.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606b4f1sm1822703566b.3.2026.08.25.06.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 06:04:53 -0700 (PDT)
Message-ID: <f81f8437-57da-4545-9046-28562df3c385@gmail.com>
Date: Tue, 25 Aug 2026 14:04:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] KVM: arm64: Add pre_fault_memory implementation
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, pbonzini@redhat.com,
 joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
 shuah@kernel.org, corbet@lwn.net, vladimir.murzin@arm.com,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 isaku.yamahata@intel.com, Jack Thomson <jackabt@amazon.com>
References: <20260612162354.73378-1-jackabt.amazon@gmail.com>
 <20260612162354.73378-3-jackabt.amazon@gmail.com> <alEXtW7w-rqlNG09@raptor>
 <0365d77d-616b-47f7-a5f2-3388bad692a1@gmail.com> <ao2KmmUd1lVFUUkp@raptor>
Content-Language: en-US
From: "Thomson, Jack" <jackabt.amazon@gmail.com>
In-Reply-To: <ao2KmmUd1lVFUUkp@raptor>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_060456_986662_1CD73FA9 
X-CRM114-Status: GOOD (  12.46  )
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

Hi Alex,

On 25/08/2026 1:29 pm, Alexandru Elisei wrote:

[...]
> 
> I think there's a word missing there, I meant to say that it would be useful to
> explain *why* the x86 implementation does not mark new PTEs as accessed, while
> arm64 marks them as accessed, and arm64 also does that for existing PTEs.
> 

Ah got you, I'll update the docs in v6 to explain that. Thanks!

> I was wondering if you have any plans about posting an updated series.


Yeah I have v6 almost ready, I've addressed the comments. While testing
it found an issue on pKVM which would case a hyp panic if we prefaulted
before it's first run, the EL2 context load blows up. So I've also go a
fix for that bundled in.

I'm just tidying a few bits up and hopefully have it out within the next
couple of days.

-- 
Thanks,
Jack

