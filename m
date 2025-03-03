Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5895CC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 09:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQw2p5k8tqJ4bzlOs89ns2VtMHVE85d061ZtoKnG6Lk=; b=M7nTb2ov7aLkJbYhTwBQyB88FW
	UpDCyFsKil+9C/cz1mjdNyFQFeOHZIkeucsA3BegBmYqaGy4MSfJoAQFdBglpXeLUlZULTRuJO/wZ
	B02JO3UdeNL7kAWirps6qoDZiZK2HbecZvY/vSRjN5mVyjym8n8/w1n458r51VcE9/ew8BfbUcWfX
	ElECEhzdsgrRvhx1bF1xVWGvrtAw/J9YpyG4VfgVjI1djyCtOrUvM6WkH6uQdyP/a5Nb2djtOczqS
	YQ/kD6ZZxQI7Rr1Y8qmEu7zNwCszrhoq6sXmApsodSVRN+RqvnmStIhXY6zbgCrg8u476wZUvElgB
	fxJZn0AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp2B3-000000009gJ-136I;
	Mon, 03 Mar 2025 09:33:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1sY-000000005qJ-40aw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 09:14:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740993265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=JQw2p5k8tqJ4bzlOs89ns2VtMHVE85d061ZtoKnG6Lk=;
	b=IWL6HwQEXW9SaRT0noxbqvrvnKqXKJfaHUwOe/ya0r5ZRyTJ4ZByNxSljj9zhl+jC3ysYP
	tcJvHybLzMF6+xedt1Pyt+MME7E+WDfraLQPpi9c3UO4rs62/BIkzLEcbPRg+oHznmuS7/
	AmGrxrXiBSsPD8nEmRtK/s3BbD3MX8U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-bOubwhKIMvmv_WpsA3NDNQ-1; Mon, 03 Mar 2025 04:14:24 -0500
X-MC-Unique: bOubwhKIMvmv_WpsA3NDNQ-1
X-Mimecast-MFC-AGG-ID: bOubwhKIMvmv_WpsA3NDNQ_1740993263
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4399304b329so18730485e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 01:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740993263; x=1741598063;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQw2p5k8tqJ4bzlOs89ns2VtMHVE85d061ZtoKnG6Lk=;
        b=bCb5ftoye6MK4bszsOpcjP+lIbqeQ79hdKK1s3zAGnrJmstkU41mKvjxncdH6Kod/o
         XBA88cPM7q7UP5TndLLvXinz5FeWDneBM0ZRGPnKjSyOUAtJkFQ6+x46WeL2ty3CWmm+
         +bb3IbG9OqsFvnV3cqtUUrJY53inaI5xENi689U+7b+WM1r09E1/G+XShoRKvEckioLS
         x865yXZEXkciVCBi6fmZ/4UxBy8CgJ9RvJvr4C+IZ1fkdYb+La9OxCqG/0HGu9bdUQ6u
         ksiUYBwiWPJ88dgu7y5n/BZRZgzeuF83uttcSPAeRD25mDKIKIUXfCLiKRRyBZP45izT
         676w==
X-Forwarded-Encrypted: i=1; AJvYcCXWQxFxcTvOrMY77hn8r78qoJheO3v1jl1eqPuKl0CRM63rhCd6S8lzhFiQt4plu/8oJWkBeThVF+EiaAtyo75x@lists.infradead.org
X-Gm-Message-State: AOJu0YzgoUdY4o5iSd5/DuKgnFsK76TqdPtPlhAHq007jRSOPW+7ap6B
	HJZSoDVqRi76wAV1zey1NFbU40CAh8zbdSm/mAOA1MkyrSZtHZad6H3uf4OLblZ+A7ysIEoMLul
	Tn0xVBH/Wtr6KH4PDLMqluRS6mWkp191Szp3TkSqVPu1grBrjqiPt5gM4z2GjYfcBaHoe+8QK
X-Gm-Gg: ASbGncvIcHsLgWFd2sJqiAgsH6vtimo5TZyyxGQoyQ9PNrxd9Dl8g+Tg92jm/3EIwhD
	IM/wSPTfaJ56DyRJWs3t52HDeKBvPJDJe69i8wmKBUTw+9+Yx4aetiPUy3sVPIZ8murbGfEAGVG
	PnfHx7Ohw14dVSeIEbxmjpX3DHXSzIQFihrfps58TmgMEDT9++3mcGkr3Q2pbefA/sDB7iGMkVz
	79yy0GaE6q4nlFHf6E3m0zuVMCStqBlJ23VQ3ZMa6mdiUMcaNMcXMagryXjllZcWsdggsDiPHBs
	rmwFejnJUX9ojQzyQM9pVcpHbwZbr7hvN8yKKHHTltSl8F4mn3vFBt+7exKYGx/dsC62tcel95E
	M42FpQPi+XkKC+xkxhOef8M1r8EeX5J9bxO4Xy9wg9fY=
X-Received: by 2002:a05:600c:45d0:b0:43b:a412:d39a with SMTP id 5b1f17b1804b1-43ba8368a6dmr102313905e9.0.1740993263138;
        Mon, 03 Mar 2025 01:14:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBk2txAHyLgtnxudgOZTIcyeZpAosbYSo1SOfl6vxw93VKcatMetKhoauJTs0xjcyLQ0p8Vg==
X-Received: by 2002:a05:600c:45d0:b0:43b:a412:d39a with SMTP id 5b1f17b1804b1-43ba8368a6dmr102313675e9.0.1740993262815;
        Mon, 03 Mar 2025 01:14:22 -0800 (PST)
Received: from ?IPV6:2003:cb:c734:9600:af27:4326:a216:2bfb? (p200300cbc7349600af274326a2162bfb.dip0.t-ipconnect.de. [2003:cb:c734:9600:af27:4326:a216:2bfb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bbfece041sm28684095e9.1.2025.03.03.01.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 01:14:22 -0800 (PST)
Message-ID: <8609f693-0786-40bd-9136-3a8f9ee9304b@redhat.com>
Date: Mon, 3 Mar 2025 10:14:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Initial BBML2 support for contpte_convert()
To: =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>,
 ryan.roberts@arm.com, suzuki.poulose@arm.com, yang@os.amperecomputing.com,
 catalin.marinas@arm.com, will@kernel.org, joro@8bytes.org,
 jean-philippe@linaro.org, mark.rutland@arm.com, joey.gouly@arm.com,
 oliver.upton@linux.dev, james.morse@arm.com, broonie@kernel.org,
 maz@kernel.org, akpm@linux-foundation.org, jgg@ziepe.ca,
 nicolinc@nvidia.com, mshavit@google.com, jsnitsel@redhat.com,
 smostafa@google.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <20250228182403.6269-2-miko.lenczewski@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250228182403.6269-2-miko.lenczewski@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5YeCzTx2UxxVxn9CZPePg1s-bludAir_CWJjk8R4mmY_1740993263
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_011427_062520_EB12E729 
X-CRM114-Status: GOOD (  10.49  )
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

On 28.02.25 19:24, Mikołaj Lenczewski wrote:
> Hi All,
> 
> This patch series adds adding initial support for eliding
> break-before-make requirements on systems that support BBML2 and
> additionally guarantee to never raise a conflict abort.
> 
> This support reorders and optionally elides a TLB invalidation in
> contpte_convert(). The elision of said invalidation leads to a 12%
> improvement when executing a microbenchmark designed to force the
> pathological path where contpte_convert() gets called. This
> represents an 80% reduction in the cost of calling contpte_convert().

Just a general comment: Nice! :)

-- 
Cheers,

David / dhildenb


