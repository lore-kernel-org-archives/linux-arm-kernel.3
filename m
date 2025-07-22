Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35239C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 15:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUXfcJXt3yUtERWhIkgUGnNxGAtGAIrftLIQwcp3snI=; b=gowH+PkZKqfOd4QV4fa/IAn9DF
	Uh9WHGwxqbP6wAx7Ixk+BeMDizGFIojYlvDm761TMH33tTkjDIirfF/DNMmD6aTQ39U45FCJ7UX9o
	biMttsKe2XBpjAL5airSsynzawp19N5vsDrA7pnS/NVbsbGmTPpbY02/au0UwbTFHAB55l88RoXeG
	9wcdMVB/mx4vvg0+70BM2bpiBGLbxQ0+atvOt9bRzLZfgGMPG8OoJzK2rbu9JTDIzNMSV/vWxWe66
	JfdIEeXma0FsWC5aOBdKVdhpowMhzkJbM8xEijyB80emuO5iV1IzuuDKAg/H4qzPA+pxxWwLqve6u
	GNdyy62Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFO1-00000002w0S-2vAI;
	Tue, 22 Jul 2025 15:58:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueEBE-00000002js4-3waE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 14:41:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753195199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UUXfcJXt3yUtERWhIkgUGnNxGAtGAIrftLIQwcp3snI=;
	b=I23pAlhBvBTrfUYnUaTVUc4RgZt3RSzw/kGYPNpDPGcXF2+JR2PvEXTLMVd3KaioDUivDi
	qJ/c8lyHSvRgnKojLtcdaihsGAj69BNtLCSjm8HIfDVYHZorfv8RN0D3dpUzJkY2/xMaII
	u9aAVcqqtYZn8JePMuoK26Pl02fe2dw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-3Th7_bVWNH-j9739CZZeaQ-1; Tue, 22 Jul 2025 10:39:53 -0400
X-MC-Unique: 3Th7_bVWNH-j9739CZZeaQ-1
X-Mimecast-MFC-AGG-ID: 3Th7_bVWNH-j9739CZZeaQ_1753195192
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-455e9daab1cso12400265e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 07:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753195192; x=1753799992;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UUXfcJXt3yUtERWhIkgUGnNxGAtGAIrftLIQwcp3snI=;
        b=CVhV5y6Sr8qnZjkZkHUglxzLmS3ITaSY9cC6+oalMjhkVudDzepiULCfjbN8sp9XiC
         VV1iNmrZ6axCLMIePKgDe+wkVUzwpIeCA9yzrRKL6Fyg0xMlbaTRs+x8/rWqT51xD3ub
         Rs0cps8VzIpIdqz6oWjz4tC9oGUFySOTs4qZrbOy9Z86F66LDjRhTRFaP93IIFBCZ/21
         snpSg0sUkzJsVNfa1OCqrTMWTs2OflK26+Q50JzLe3SNGMErK3ouKAfs77dtqoKGfgzw
         Nrg7FOs2WnxaJUBZc02lFTavIg4bVIhb5TFfQXQ55FO3rI31mAtxJAw8QKRlMCu4G2+j
         FEsg==
X-Forwarded-Encrypted: i=1; AJvYcCW1dHUYfHmfb3k11FDnlZowYKn376G3Vc7mJFVYHhBWhqSzKPCNvZ/HXZz0Nl7RkFnHaAus5eGV1w80HoNKJqmT@lists.infradead.org
X-Gm-Message-State: AOJu0YxMm90L8ceGBPuFwOXIIOoikxVH6FMGZB+IqyUg/YOSNg8y/Sbm
	dlAeITof6HiGgjVRFeeRsf3VSDw1LmCNspPcJLze9c/Nk8sMGM2AEPEnPnzYNDg9rzUfoSUqQZl
	0Zjcyiy6QOAHEZJhA6natSvFZMX744HEWm9UFBhhC3Byte3abxQ0MsaNDilHbP25qVngxQG517C
	Hb
X-Gm-Gg: ASbGncvXqkW5ZjBRy3cRZABwKM51UVa0/t6MaDibRCu5iLFlaZz08JS7RrVa4qhnaXE
	3Fm8bCaKHj577uMAclX7gcqhD8RMiU9ISYe9CYfZ4zSGfmI3uT+F7iWtkK0shTbNxvDC+JqkJXm
	ncSvcgJ1o7tsEyzjS9mciOrRlgedsOa4/SWSEdYhsRCbDVwy3GFSqgVhocUVlKWbwqm7fdyjRSW
	eFiC4mAwkmshIh5FUKqWpf/BzqGtGFQ2Zw1ehCjFW7Hg6kgQCJ1ZuDwKGiR7NBrHhD/bUN2M6in
	9po7MQwV6uz+/jskDZEf025yfniRbYRhFtBRBXj5JGWMOHtnxNVCioJQCxqQf7bdBK7xwRn5QWD
	Pa2ucpgj1FFXY
X-Received: by 2002:a05:600c:310b:b0:453:9b7:c214 with SMTP id 5b1f17b1804b1-4562e29c33emr210945195e9.29.1753195192085;
        Tue, 22 Jul 2025 07:39:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiFVJztAJAsGCwFkVWQjDHWa5km7SIwfTibnU0fsbIHs3oWXWzepmUGBqcNc5EYazTcDWqmA==
X-Received: by 2002:a05:600c:310b:b0:453:9b7:c214 with SMTP id 5b1f17b1804b1-4562e29c33emr210944865e9.29.1753195191605;
        Tue, 22 Jul 2025 07:39:51 -0700 (PDT)
Received: from rh (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e886113sm196183095e9.23.2025.07.22.07.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 07:39:51 -0700 (PDT)
Date: Tue, 22 Jul 2025 16:39:49 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>
cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
    Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, 
    Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
    jackabt@amazon.com
Subject: Re: [PATCH] KVM: arm64: selftest: Add standalone test checking for
 KVM's own UUID
In-Reply-To: <20250721155136.892255-1-maz@kernel.org>
Message-ID: <aa2bbb09-c9bb-100e-b4dd-a3010c8458eb@redhat.com>
References: <20250721155136.892255-1-maz@kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Im4SMA_jpXCN43Pj-aZotQQIkUAp8LS2oFMCHIGv__Q_1753195192
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_074121_051693_38D7F669 
X-CRM114-Status: UNSURE (   8.33  )
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

On Mon, 21 Jul 2025, Marc Zyngier wrote:
> Tinkering with UUIDs is a perilious task, and the KVM UUID gets
> broken at times. In order to spot this early enough, add a selftest
> that will shout if the expected value isn't found.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Link: https://lore.kernel.org/r/20250721130558.50823-1-jackabt.amazon@gmail.com

Reviewed-by: Sebastian Ott <sebott@redhat.com>


