Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B45C3601A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 17:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/O3VVSysq4lCokMdVtnNB1uCls3f3ZbSmyJWqnskNE=; b=P9a60Qy6DmFu2zSG+Mf4Ni+iVe
	ScHgYAOyk2Dlrlda+lDReB6g5ZVDcGFR0g7aGKvUtik/W9CmvMGVu169lz/f8msAeBQQAyf0Gen+4
	syAthveQqS59nt0v95Pek3nnr2iYvJ9LYz1IS/UGThKIloBnm+Qnfh0qvk850vF1LJk50BD1Qyn8/
	UkybfdeYOGPTyGgPXjGjyWGxTrgPSM/c/5dO770s0iX+Bdaab9/vD4Nmf/PmwHMx0U63HYTjsUgZo
	mrZn2hNFpHr1vbTHXGAEJVRG/fpjPTg9TtA8TotBabp2q5mAjzcpQQgT2MvhfaFdKEF9k93MKeMWr
	M7bpSv1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0l1o-0000000CQv2-3qAK;
	Fri, 04 Apr 2025 17:40:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0l04-0000000CQfL-03Ix
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 17:38:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743788318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=y/O3VVSysq4lCokMdVtnNB1uCls3f3ZbSmyJWqnskNE=;
	b=B3gidHRTnQlqD2AnHkd0K5R2NVeV0Tgru2f1wRWKHd68RlTZsSdTeC1ICoB3YNNnMlp+C3
	udMQBfWGy+xmFHLmwDIRhcpYRlLJ/iXFvrlzSZPjDFkDsNOIWm0GgSoY4r8FeeTEF5w+bw
	3uh73XVsvDl5eM2sU+xdRI8usfY24UQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-ASIULqYYPMeyLrwIaBD7CQ-1; Fri, 04 Apr 2025 13:38:37 -0400
X-MC-Unique: ASIULqYYPMeyLrwIaBD7CQ-1
X-Mimecast-MFC-AGG-ID: ASIULqYYPMeyLrwIaBD7CQ_1743788316
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39141ffa913so1180421f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 10:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743788316; x=1744393116;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y/O3VVSysq4lCokMdVtnNB1uCls3f3ZbSmyJWqnskNE=;
        b=Ga18+PnPddgYEkdTuGd5vAPB1LaKJOhWpPXrW6F4LGf/yRxfW6HlwQezd73h68g9YK
         HO09hacm70zyX/cjCV7wTD5WIhUP2Pi+WcTJVnQ5w3c0bVBQIjfx8BeV28FezBzbsgzH
         TzvwykCHhzv9ibl6p5A8R09URmAVf8+WKq3Srb9188H0oBGPIs2pAcQVfUXBBDgt9AbQ
         RFBdpgfrRnTDuLeEQIsdt0g3i5a6q2uzK8RHJdh+shQErTAgNxJ20ppMq8EzdnKO5Wxe
         6/KmYskYqAGAa1NE1JNbPkyoCQ0RWEooN2E597+nMo0gRHiWo+gl30tnI1wn1aJF+uFd
         t5ng==
X-Gm-Message-State: AOJu0YxrqYgUR+UHxoOfjRlreD5J5NFLG3Rngg5pJI5dpeYioHjqX9It
	P60CMiCuG3yv2MHjCNV7uIH8FSoUzBPBV+xJ0h4thzMA3k1RMTxiTII7PYeZbVuHRScKGpHSFiq
	SHdgP+qTFmHu/7eT6ayNXxq70HxFlyJnkHIHtil49EI9/ZX95TEk+DGq2lrAzL1NN/C469kY8
X-Gm-Gg: ASbGncswcYQ5G9OrdA1kUXzCMRFYnbGqGn16QbtWUjiLvP//As41OzxxgUOukPjZAFz
	ZkuPsd9zG9wFCqTh3ODv2D36lsaX3m2mQ5d998cjafF6KBJDjQ1ncxCsj/kZZSckL5CrzpjKro+
	tPnKoAZc/1zxRrbExJEb81Jkqb2Yu/KAHMejpK6ROFnp1aLUzm/Hf9lA2wrM3l08Jaq9U7dOetM
	9q3iPHyHDtqCEoGGifMZRuNvlugN3tx9/bbbLJh4ru3US3qpQWln4MQ/KJD4sfSVF1TOrPl7070
	Wp48d+4am+H2+Oc0LoQu3xbXhq64RP9STDHE147tiBlYGt8lcXb0sHM5uRiQt6pJVXNbuDFU9wP
	gCFgizWjpXiI7OgsaRkq+QEarPas3XpqMvj4Pidx8d6s=
X-Received: by 2002:a05:6000:4010:b0:39a:c9fe:f069 with SMTP id ffacd0b85a97d-39d0de2b931mr3119998f8f.30.1743788316206;
        Fri, 04 Apr 2025 10:38:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFTWLzuO9d/y6p1DjF493CzzzwSItmtkfVF/1m36gzNFcf2uu0G5Iwwp7jdPzTD6CiNy9efQ==
X-Received: by 2002:a05:6000:4010:b0:39a:c9fe:f069 with SMTP id ffacd0b85a97d-39d0de2b931mr3119966f8f.30.1743788315825;
        Fri, 04 Apr 2025 10:38:35 -0700 (PDT)
Received: from ?IPV6:2003:cb:c71b:7900:8752:fae3:f9c9:a07e? (p200300cbc71b79008752fae3f9c9a07e.dip0.t-ipconnect.de. [2003:cb:c71b:7900:8752:fae3:f9c9:a07e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec342babfsm52068935e9.1.2025.04.04.10.38.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 10:38:35 -0700 (PDT)
Message-ID: <1618bf36-7f7a-4d32-a6a6-242323007d67@redhat.com>
Date: Fri, 4 Apr 2025 19:38:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] support FEAT_MTE_STORE_ONLY feature
To: Yeoreum Yun <yeoreum.yun@arm.com>, catalin.marinas@arm.com,
 will@kernel.org, broonie@kernel.org, anshuman.khandual@arm.com,
 joey.gouly@arm.com, maz@kernel.org, oliver.upton@linux.dev,
 frederic@kernel.org, james.morse@arm.com,
 hardevsinh.palaniya@siliconsignals.io, shameerali.kolothum.thodi@huawei.com,
 huangxiaojia2@huawei.com, mark.rutland@arm.com, samuel.holland@sifive.com,
 palmer@rivosinc.com, charlie@rivosinc.com, thiago.bauermann@linaro.org,
 bgray@linux.ibm.com, tglx@linutronix.de, puranjay@kernel.org,
 yang@os.amperecomputing.com, mbenes@suse.cz, joel.granados@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 nd@arm.com
References: <20250403174701.74312-1-yeoreum.yun@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250403174701.74312-1-yeoreum.yun@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SZsH03yUv111tdPuU15cZQTVXY-nO2ptmpUGZ4LF_A8_1743788316
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_103840_125742_D3958087 
X-CRM114-Status: UNSURE (   7.79  )
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

On 03.04.25 19:46, Yeoreum Yun wrote:
> The FEAT_MTE_STORE_ONLY feature provides support for
> tag check for store operation only. read operation is considered
> as unchecked operation so it doesn't raise tag check fault.

Can you add/share more details of what the implications are, how it 
would be used, who would set it, etc.

Just from staring at this short paragraph leaves me rather clueless.

-- 
Cheers,

David / dhildenb


