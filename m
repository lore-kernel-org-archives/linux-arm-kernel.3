Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EA3C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 23:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=apls3JT829ifJDsJne75u3rNFMkdEv5XlW99N9rTPso=; b=JK1BLKJjAMkVTtFWHzW1W5ZUiE
	5Z43AIpljvlFDZUZMWrv0FwPERL7CritpXNlFlMTqxS7BuANTp1qXft5zl8FRxz6ID9VMT69KE/Hy
	YinAleyUM3tkMNpka7YgqsCMqizOokPoKlrwvO+12FonAnBgYvBxCo1Lz/5vf2OrCbRuWoINwFHYa
	D+6fVFc4NJUyYnTxOHzNTRmFq621FXkTFYE6IOXsXFJkZGOzzC6wz6IYZsHcjPJ0JYjOVS/Ry+x8z
	V4heUIcXPcdun7T4s/urqiaqA5CJUVnhdjn/NQXtQTCvrygaLVRJc3wVzEv/K4QkGIWOoZrQYRj4p
	E+BHeBwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tot0A-0000000GouQ-0DsD;
	Sun, 02 Mar 2025 23:45:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tosyb-0000000GooQ-0PgQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 23:44:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740959044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=apls3JT829ifJDsJne75u3rNFMkdEv5XlW99N9rTPso=;
	b=i1lGxoBbSZ2E+5XlEobAJAZ+9M39qcnluBwflz/PBXdgdUP9kr+W7YebD3Ndwf8wL0q+Yc
	5oqp6i52++jTbglZukbTwEU4sjxAqtFygQgevJE28XX0AmUyYZI6X39RX9cVqSzlmwevD1
	At4jJ8hlCHwi8WCi1aAFzq/d5XHrkTQ=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-vqvrQdKPOBWfb7Q27rhRKw-1; Sun, 02 Mar 2025 18:44:02 -0500
X-MC-Unique: vqvrQdKPOBWfb7Q27rhRKw-1
X-Mimecast-MFC-AGG-ID: vqvrQdKPOBWfb7Q27rhRKw_1740959042
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22387acb40eso40108465ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 15:44:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740959041; x=1741563841;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=apls3JT829ifJDsJne75u3rNFMkdEv5XlW99N9rTPso=;
        b=kYPn/zRCpFM417mILxsqcQxhUJfh1jEjlpU28HdthhTlZA4j2DIXBcN//MkhBflIXk
         tmmbVhobvc+5A4i0AJIND6A+T601fpXSPOOPmFnW5rTz8ldf7PSYEcUs+OT3xfHy/57k
         8YlmamJaH6r3giHRY1cLYQs0Kw5KMpDuccdxsLREzqj8WYNgwDLGoHvVNFWBhLKdiCA9
         yBHfJbO8aWSuDgUzfYuIG9U6bS6wO9Un2xMs0JNnoWX5v2+poih9d5Os2iiyFtJC1aBQ
         8eXMb49OqBfrMyoLMyD02E1XWINhKPiSsLtJmNb1yHqpF/tyqbJfLIL6NpxH2rF9FzdT
         R9yg==
X-Forwarded-Encrypted: i=1; AJvYcCW6pWyVol/SQ+iI1thBelqv6o1PTZNfnGAAzEIrlWwTAP50Mqg0FFJbDxraMbKhU+TY6CZAq0KVZ8B03ib1MvaM@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1w8PWVBlWXKlJJvD60AwFgdRLQ11voozAGopOyqDevla7H3Wl
	THkH4ITCcgEHogmTGCzpSkSYGJHSqOHuMXF2fKbGekWtSkLQCcWWaiBRfR0iPkw39c7w0+0Wyno
	13G7nSPc/ACiFOvN2toYR9XGNFmIhmE7q6CO4ToBszylLJLQQ8z5Qfagw+s9Kkq0fIEFSL08N
X-Gm-Gg: ASbGnctdmak7ycbIMdmi2P5JJKX1FXuexeNGGbnneUU651XSVZh1KoynWFsYZ10+DAt
	3wykwW3p2eltUkDuwsXDGVtsfNDQr+IcASvWgB4ek2qyKSf0VPV/SHqbMSKV6ppOiIgac4snaNp
	6z7JYrwQFKO7+toUYcSFXt37IFmaVrFav8nMat/qbo8RDYIcQaxrv6qVlrGrROTKNPvYVJqr5tK
	y/0ehzF8sFWL59N6WEWp9uYh51d3WraKvE349rmhTAYVSKK4ZFszrgP4nDwuQOmcDTFSAKKTI9T
	kTLVWx/7EB/in1/7rg==
X-Received: by 2002:a17:903:1252:b0:223:26da:4b6f with SMTP id d9443c01a7336-22368f74891mr183107375ad.14.1740959041707;
        Sun, 02 Mar 2025 15:44:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFYssys7UGoPXMBxe9bSswsi7jbUP9yKeJMmGxQGuBfHCIW8f2mxFgGu/EUcQbiuyd2gk6SQ==
X-Received: by 2002:a17:903:1252:b0:223:26da:4b6f with SMTP id d9443c01a7336-22368f74891mr183107165ad.14.1740959041447;
        Sun, 02 Mar 2025 15:44:01 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fd28dsm65811695ad.94.2025.03.02.15.43.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 15:44:00 -0800 (PST)
Message-ID: <9dbebd7b-b441-405d-8c45-0dfa4d3df9e3@redhat.com>
Date: Mon, 3 Mar 2025 09:43:52 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/45] arm64: RME: Handle Granule Protection Faults
 (GPFs)
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
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-4-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-4-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VgYNaHfPvSXkfazUbVThTz36XhT8MB0I_SUYr-wY_c8_1740959042
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_154405_219158_B22346CB 
X-CRM114-Status: GOOD (  14.02  )
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

On 2/14/25 2:13 AM, Steven Price wrote:
> If the host attempts to access granules that have been delegated for use
> in a realm these accesses will be caught and will trigger a Granule
> Protection Fault (GPF).
> 
> A fault during a page walk signals a bug in the kernel and is handled by
> oopsing the kernel. A non-page walk fault could be caused by user space
> having access to a page which has been delegated to the kernel and will
> trigger a SIGBUS to allow debugging why user space is trying to access a
> delegated page.
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v2:
>   * Include missing "Granule Protection Fault at level -1"
> ---
>   arch/arm64/mm/fault.c | 31 +++++++++++++++++++++++++------
>   1 file changed, 25 insertions(+), 6 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


