Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9798C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 23:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=reNm9sGtqEimjHd3mQAilX9ShNbqr3AbNvUjgnHsW88=; b=c2byLjJjvXtzJ62yROKO5c3wBK
	Rhh1G8fkB6mbBlNXQ8ie/AY1XbOsHBM0ZIEClhJe4ANHIPUrNUmyhn8EZouP2mco+5ugH5WpAUPYi
	SPY+U0EECHeHCDpihv/4M9bJXVjDKNiI/ISN3/5UUDKsXtabcpk0rv2X+ZfJDlzTH0X8t6OVGAfVq
	XwMCJXS6I1WSxkxHp+yllkEebCw0rf3o/Cw7YgFOvwazYQ5ODBOxKTP43iZM1Fxpa8opCwFF/Vgdb
	r7skhBrw9brNsrnNOLUKlQTgnbkhSeNCjN/zMDchGpDUeio22IIjm+286zIA5Q6wYuODkWpA8TaBl
	qwH8QNdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk9Ta-0000000G6NY-3Pb6;
	Wed, 15 Jul 2026 23:57:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk9TY-0000000G6NA-3yZH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 23:57:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784159836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=reNm9sGtqEimjHd3mQAilX9ShNbqr3AbNvUjgnHsW88=;
	b=Zy1RyY+gCEPVCRcJ+WK1NGaRsMnYFHyozlCDCpXyC6ro5SZrhh0pTfkut+98cQNUWIMK9P
	C2VuPHmgkYuzBEZuqEna/t70taN3qVk/GeCU+j5Z0ocdnJmqYF6BMUcVBY6qSIZwwg1F8m
	GwCc38e2iCdEyrfWBTs3q39W8hLh350=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-WLZJaNyDOMejohd_dUZ0oA-1; Wed, 15 Jul 2026 19:57:14 -0400
X-MC-Unique: WLZJaNyDOMejohd_dUZ0oA-1
X-Mimecast-MFC-AGG-ID: WLZJaNyDOMejohd_dUZ0oA_1784159833
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c891ed872ddso10557192a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 16:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784159833; x=1784764633;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=reNm9sGtqEimjHd3mQAilX9ShNbqr3AbNvUjgnHsW88=;
        b=Ikc+7YUSTNrUcY43CuDzir3b+ouFwUQxq3rt0iBXylR/ah1ytA8+CNPZfA4DKYWl0D
         EJAa327MMndfcgl6M2m3/y9BOHcZ2zzMmPLNyJrl1OsUXp/VA5ExaqdZZKQDRH1lnpTk
         H77fk3vNVZR58fIWf7u5FTyT2nf0lNnIw4KzdRebv9cjN/R3fwvB7UkgfhUKdsnjdAsU
         d/mFCwIqtqiWhUQiR1soghr6axfoRyYWu/uDG5wg4ghcaCe52k6QDo1lwCRm76iDm/p/
         O9Dlu8e67NQiBDV+rbFgn95HOWu/FHHvkou8WXsnkVtOACKTuCb0jItBhKyDk0THb27F
         Us+g==
X-Gm-Message-State: AOJu0Yzm2JhyVjtJRiAYOPvdfpNTA6wKxworIr/U7xykEx8oqBLNozW3
	zSF8ZW8Kf8T2CaerLBx4NWb72xsxdZ4O1JbBoKagLlrmz8dKqfNyk8pAEPyPnFi3by6BQL4gpUh
	Mpx6dPC6fQsDHS+0jT9JvzVlxtgaiG0yNNC7I8TVnnMeQ4LX88kjPppfXbgKodu9gxNlnFDZxEf
	ds
X-Gm-Gg: AfdE7cnNYoGQpD5x6g48MqVfVaGtf3gzDswcU9GxIu+cYWo85nn+lSzgIxEzr4rEAjA
	+BsTJF3VvKKRHRYuNfPmSzFuutmwocU4Qf3jeu19N2p7CE7fYVzRyi9/EGZJjpCmZ/XXUBcleXL
	jjJ+w3+HVOdvhXR/5TBgnf1HQD/2kf0fa12p8i41LjA/EiXXgoRMlpCekABeghizix9qFuLICbO
	VeL92foDTWyKLpM/7BQLVESoOqq5mWnY7Wmpenkn07I+tSWtLu6B4rCplUqqIIdHHlYwEXL1a9P
	vWRvDxYG/PbTBkXF/07wOttwkqU2VwRgwmbXFLyE4e8lhQuNHcZUoWDvk2dDLzv5Ty+TbpGxGuy
	kDxdhUqbQ4xv79DsnIMMfOdCPZtCQtfkwsYi0hq1ltLE=
X-Received: by 2002:a05:6300:8941:b0:3bf:ba2a:6a8e with SMTP id adf61e73a8af0-3c34d583230mr11957899637.21.1784159833162;
        Wed, 15 Jul 2026 16:57:13 -0700 (PDT)
X-Received: by 2002:a05:6300:8941:b0:3bf:ba2a:6a8e with SMTP id adf61e73a8af0-3c34d583230mr11957872637.21.1784159832776;
        Wed, 15 Jul 2026 16:57:12 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e500e8fsm5420247eec.6.2026.07.15.16.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 16:57:12 -0700 (PDT)
Message-ID: <ad4e2a77-05ce-4089-9e05-96216e573496@redhat.com>
Date: Thu, 16 Jul 2026 09:57:06 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] arm64: cputype: Add C1-Nano definitions
To: Linu Cherian <linu.cherian@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260715053408.1950475-1-linu.cherian@arm.com>
 <20260715053408.1950475-3-linu.cherian@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260715053408.1950475-3-linu.cherian@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CRoTCf-2BvO3IkFgUE314PsQJzg6HfZBxofXHOqsql8_1784159833
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_165717_066140_EA646C93 
X-CRM114-Status: GOOD (  12.79  )
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

On 7/15/26 3:34 PM, Linu Cherian wrote:
> Add cputype definitions for C1-Nano.
> 
> The definition can be found in C1-Nano TRM,
> https://developer.arm.com/documentation/107753/0002
> as part of MIDR_EL1 bit descriptions.
> 
> This is going to be used in the bbml3 support list.
> 
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> ---
>   arch/arm64/include/asm/cputype.h | 2 ++
>   1 file changed, 2 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


