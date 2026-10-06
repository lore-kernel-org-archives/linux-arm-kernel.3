Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC4FCA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 03:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ikmq0G2vWuzS8RQjLvE7O0ZgTT2QCtc6oU8WM5b+mQo=; b=pWMdvqp3ET6KCjncN/50bCWrZl
	VHY1SA3q7x6O1GpxS1k9e/AkCIgWqaXNr1lcUYAT+hV++XFmatO6N+ufbtFSt/gVyC7fTpPFduz9w
	xOMpAC1AL/mQtEowlGvPTnVd83Hr3ezf+a6W55oFodmcbE5jqsGDX2nZnBnRcL0WNgO+p8nXrJ+6z
	zT4CmN7SQT26RpGjF4UlKAY7E09m+HMX7lwzwaRqs0DVGqHhCSzFQpUYdC9vxsk3wNVe9TRoXTpW6
	l7x47H7Na28zQcjVJveZuIIKdigQgaqlJzgl7jgt1JX//yPGh9eJfidOEteTJn/JXIB9g6eo8ccUX
	xqoL+6TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDwBk-0000000HaWu-1eme;
	Tue, 06 Oct 2026 03:50:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDwBh-0000000HaWX-1VZB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 03:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791258596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ikmq0G2vWuzS8RQjLvE7O0ZgTT2QCtc6oU8WM5b+mQo=;
	b=J2HpYpQSWabE5hCCNcWkVmNof2kEkc+FlyIH13yLTgbyqOzmD+MpZxadC0yj3/n+aWiBBF
	Xu7U+cSWobZW8PP9irvkXLYSEp83E63HIHeCLigx735LM83wMyUDf/Rjt3ySwgyrv0aUF2
	sIXB8q4E1yqtnmeaoAUmVUZPZLJLBfE=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-B9n1QovQO5SQMZuvRthkHw-1; Mon, 05 Oct 2026 23:49:54 -0400
X-MC-Unique: B9n1QovQO5SQMZuvRthkHw-1
X-Mimecast-MFC-AGG-ID: B9n1QovQO5SQMZuvRthkHw_1791258593
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a813204f87so1335212a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 20:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791258593; x=1791863393;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ikmq0G2vWuzS8RQjLvE7O0ZgTT2QCtc6oU8WM5b+mQo=;
        b=ACJXmmphhIwScQ1apUKj/cG3S9Wm3ZHNYDiZWX6gzi0Vkax1O4m/YbE1gnQzoOMGjQ
         9GOTc7BFIG5FZ6aXuazDPxKFU9tkyVFiXjQJ/AsoGZxh19tUdRxaAtHWMeK7TxHfdBM8
         h4xj/HaDk/Z54v8bjIw+gBRiDukNYa8pyF4PCIv8y5MIEZv2RSZRzAFAjrR1oNO/5lp5
         SyHDtShAmNrhtZIFy/PAiD+TTmWlQyIFn4uCSshgST+JwLNGNOZVdhrkajh2Z6ylTchg
         9+X+o1wM/u+j5zayYtEe2I0H5+zNtDzjKvNTDNxPdUqO3MuGhpUa0KRReTFg5ujZKiqZ
         cvHg==
X-Forwarded-Encrypted: i=1; AKwUvBwQ5pTQRsbmVFnBTpp7pVPS6jksU5i5bPN1yEr3ZwjfM2B96Yd1BkOFnlS+hj3Lqp3NlEf2kTUv8AwemCwFbPCh@lists.infradead.org
X-Gm-Message-State: AFq9FYJxdHc2u0+4rZuTmadePd82J1Ok3o1YdRa9DswMS8SyOvVIChKz
	r4yW3tzil22gOCrlJ0khYcFu6OCCeqyI7hHMi/PbnSldIceR5J1LHK7fZZqjEVeJd+pgonhCKh6
	d5Nir7hf77Jye8H9TQ7mLCiMwQegzQCCy7lX9tBfxKOy77GSqr/duoby0z/yBDNAjQcfFQ1ZwzE
	9t
X-Gm-Gg: AYBFou1AbI7Dyjn2oOC447EVMIpXVKpRAOFcQsFg8R3XJnTHE0MRKIT5v277iL5qWHg
	sX1lXBFSw7JmEAGAA+Bn6sA985gOS9GV22MojV4AuTVidfO5QnJSxJLyXKgDi/GG1RzWmOmSgv4
	iyp7TVBvkQkk4ZV4OzT7anhpQcnLnJympqJxIvh0bfQkUcfZAfg/sHNVFLAPziwael3g5qLDihS
	5D4U+p+ItcSTvMng0ggUWBUOMhr8kQwBG9rcgil9YyNsyRmeNaKFZof0Z3Uh+XdXaZXEEh7HYkd
	aYrjvMlBxzskoMbuOiwexvd2NJ1S3BVRUbu20NJ7tjdCoXSEiACiQFGAtRIVpN6SCpshm5YCwdS
	hmhyVx9X0naWVLtq8BImLS/TFvildXf0r3E/ubyiGjg==
X-Received: by 2002:a17:90b:2e45:b0:3a8:1745:6c01 with SMTP id 98e67ed59e1d1-3a873697b75mr93382a91.35.1791258593268;
        Mon, 05 Oct 2026 20:49:53 -0700 (PDT)
X-Received: by 2002:a17:90b:2e45:b0:3a8:1745:6c01 with SMTP id 98e67ed59e1d1-3a873697b75mr93373a91.35.1791258592828;
        Mon, 05 Oct 2026 20:49:52 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853889667sm2507543a91.1.2026.10.05.20.49.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 20:49:52 -0700 (PDT)
Message-ID: <2e83d025-2edb-43bb-a9fe-cdc09ac2320a@redhat.com>
Date: Tue, 6 Oct 2026 13:49:42 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 20/23] KVM: arm64: CCA: WARN on injected undef
 exceptions
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
 <20261005090754.2140522-21-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-21-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: q-MKKlTKPXXWdtMz6hWSKfwSp-c7N5p0SIWJfidaRqg_1791258593
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_204957_480048_7D7C0544 
X-CRM114-Status: UNSURE (   9.82  )
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

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> The RMM doesn't allow injection of a undefined exception into a realm
> guest. Add a WARN to catch if this ever happens.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/kvm/inject_fault.c | 1 +
>   1 file changed, 1 insertion(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


