Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A218C83030
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 05:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RWA9x7qhxNW2l1p6ltGUfCp8OmCZaJaVxhg1nTkJ0sU=; b=Drdl0GZEOyivSYb+Pnbom2bjh4
	ztmieBLJcOfkk/ghl1PjKOMogWHggFo9aNPS1NJir1jO/VUv9KeEJRFu4HBHXo7PaBq0X6YReH396
	AkqyaEt6K8TTvN1PVzUAlI46c2f30qiHm+4GEP3hHlHF5ZkqtpOD1D7cSjfBWLbrYGmc+mnDvQIuV
	1BBB8CVLot7lvNqiXX8+wUsRkT354Qr386r9WmbCD339QXC8XT9b1XwMEWaHjdR+goGPjDcbAWXQN
	BuaSSrwM1veq+l4Ftc31G+yqBZsWAOdpXIhrMNhkijBPcqbiG+YRC+nf0+sQtTCJppb9fhVTwtcR+
	xrfdowqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXYXq-0000000DHtc-1QMe;
	Fri, 04 Jul 2025 05:01:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXYVI-0000000DHVy-3xoH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 04:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751605106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RWA9x7qhxNW2l1p6ltGUfCp8OmCZaJaVxhg1nTkJ0sU=;
	b=YvAy/tHiLYwF7Ahqo3ll4tTgsaZll03gi9AEW1JXD2490i99Umi9ff2NyyRHqAcB8Vx9T8
	yh9rMUWRwB9qJancrqSwuGdBrboXZvbr4KuyTWxrF6gbKg2jfBWCsXQLRDMWhtLlLlHZ1H
	idFNIWa2+meq58FV2uO9L25FFBC+XDU=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-nLYekmKiNPC5cHt8mlOHRw-1; Fri, 04 Jul 2025 00:58:25 -0400
X-MC-Unique: nLYekmKiNPC5cHt8mlOHRw-1
X-Mimecast-MFC-AGG-ID: nLYekmKiNPC5cHt8mlOHRw_1751605104
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-748e4637739so361574b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 21:58:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751605104; x=1752209904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RWA9x7qhxNW2l1p6ltGUfCp8OmCZaJaVxhg1nTkJ0sU=;
        b=b/e5v6csoI/r/ARBVJAcluCAGFhv6uUKbz/c9Q6U1GVolUK13C7+IFgsFHCjZgB9F7
         YLJL/7o6QjFRbuvLZnVUpaLYrMRtDdWtz+Z8YLAspQXqNgSb6D15N2yGTCvry3Px5/rA
         u+E1fo9ZAItVO7hmDyvXR36vhhg5pHXuQ/hGtiyYd9oFIBh3x/3U6ex+E3yiEKLJN+JE
         MMqcA5QDOx8xG2rl5nsHpC2lrnkZxMgt2e7fF/ur4oHOU6KoabK+sJs13RvFWtRvGyuA
         5qgpDfsS08XqSQr2v6Tb6OeO4P5SUkP7oHyKfgRQrCwVgO8XDjx+Jm8vMCGq4rSASYit
         msaA==
X-Forwarded-Encrypted: i=1; AJvYcCWtfrQkmenPcXzzuFCQtWYl/Fd8/zCVWY3zz7f6Tli6obs20biO0fCwUr7feQNXenHt2+FeO7f+U2Y2TN2GBDtR@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs2aWkqgrewvxvaT9Ewg3/nh9JbMSSu5+mQ1jQyW3xO/KMcDEQ
	x6hzlrODqN3u+II57LzBAZHZBg4vF9JkhS41uBtMjCMkAaNX5Ki4xZa1uNc6f3xAdJiqWe+s0Pi
	1X0WR7qoEsa9ZX2j1ZXKsrX3qxrb74QveRTSy7L/wy8ME0dtTA4EZR8l7X95yyydA0tw+tP72R2
	Rg
X-Gm-Gg: ASbGncvDSOfoiB2fvWXEV0fHf4GddOnqOmu7Pj31jJOy3glZ5oI8m0oxguegWhhjva+
	HQcOUwAwhOZx+PKNkMLWH6LW/vYxNtohZviuX9tYeiWzBPk0otxYFwrmYTGGpHZ14KJ/yOwfuwT
	u6Zmz1j7Pa844LdlNywlGNa6GNFirq5vbJQ1EN3Pu19/F2PMi6BXiUeu0MXNilBdTkqWROnTN1W
	yy9j1ruIWRSiXpEHlgR68Cevx7EAZCAUH1OqofEi7MwEX62VGZXD46EraCXEVWRvf1eDRwC6Xez
	BAELku39M3KA3g/idv05JIHi62sFDkmfFXHbcV6dxrA7rl3w3VuqSTdz/r4jFA==
X-Received: by 2002:a05:6a00:18a1:b0:749:1e60:bdd with SMTP id d2e1a72fcca58-74ce5f38772mr2112086b3a.2.1751605104461;
        Thu, 03 Jul 2025 21:58:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHF5wv+DE6Xrth2Z9dMtx7SbYzBfl2e7NF0on99f9M31vN5qmwp6uCO7D9ntAdPIgA97WcR6g==
X-Received: by 2002:a05:6a00:18a1:b0:749:1e60:bdd with SMTP id d2e1a72fcca58-74ce5f38772mr2112052b3a.2.1751605103850;
        Thu, 03 Jul 2025 21:58:23 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce35cc32fsm1076594b3a.52.2025.07.03.21.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 21:58:22 -0700 (PDT)
Message-ID: <0ef9c9bf-70df-47fb-976b-acf6bff4ca3a@redhat.com>
Date: Fri, 4 Jul 2025 14:58:13 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/43] arm64: Support for Arm CCA in KVM
To: "Emi Kisanuki (Fujitsu)" <fj0570is@fujitsu.com>,
 'Steven Price' <steven.price@arm.com>,
 "'kvm@vger.kernel.org'" <kvm@vger.kernel.org>,
 "'kvmarm@lists.linux.dev'" <kvmarm@lists.linux.dev>
Cc: 'Catalin Marinas' <catalin.marinas@arm.com>,
 'Marc Zyngier' <maz@kernel.org>, 'Will Deacon' <will@kernel.org>,
 'James Morse' <james.morse@arm.com>, 'Oliver Upton'
 <oliver.upton@linux.dev>, 'Suzuki K Poulose' <suzuki.poulose@arm.com>,
 'Zenghui Yu' <yuzenghui@huawei.com>,
 "'linux-arm-kernel@lists.infradead.org'"
 <linux-arm-kernel@lists.infradead.org>,
 "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>,
 'Joey Gouly' <joey.gouly@arm.com>,
 'Alexandru Elisei' <alexandru.elisei@arm.com>,
 'Christoffer Dall' <christoffer.dall@arm.com>,
 'Fuad Tabba' <tabba@google.com>,
 "'linux-coco@lists.linux.dev'" <linux-coco@lists.linux.dev>,
 'Ganapatrao Kulkarni' <gankulkarni@os.amperecomputing.com>,
 'Shanker Donthineni' <sdonthineni@nvidia.com>,
 'Alper Gun' <alpergun@google.com>,
 "'Aneesh Kumar K . V'" <aneesh.kumar@kernel.org>
References: <20250611104844.245235-1-steven.price@arm.com>
 <TYXPR01MB1886280D98B07E971424D62BC37BA@TYXPR01MB1886.jpnprd01.prod.outlook.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <TYXPR01MB1886280D98B07E971424D62BC37BA@TYXPR01MB1886.jpnprd01.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iFKBUYiFROxXJzz8mTWz-hfH-C_k9iuBTFFAoJgZK8E_1751605104
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_215829_063441_3C9DFC43 
X-CRM114-Status: GOOD (  10.15  )
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

On 6/25/25 11:51 AM, Emi Kisanuki (Fujitsu) wrote:
> We tested this patch in our internal simulator which is a hardware simulator for Fujitsu's next generation CPU known as Monaka. and it produced the expected results.
> 
> I have verified the following
> 1. Launching the realm VM using Internal simulator -> Successfully launched by disabling MPAM support in the ID register.
> 2. Running kvm-unit-tests (with lkvm) -> All tests passed except for PMU (as expected, since PMU is not supported by the Internal simulator).[1]
> 
> Tested-by: Emi Kisanuki <fj0570is@fujitsu.com> [1] https://gitlab.arm.com/linux-arm/kvm-unit-tests-cca cca/latest
> 

The series looks good to me in my test where the host runs in the environment
emulated by QEMU. With below components, the VM can be started, destroyed and
simple workloads can be running in the REALM guest.

Tested-by: Gavin Shan <gshan@redhat.com>

   host.tf-rmm    https://git.codelinaro.org/linaro/dcap/rmm.git
                  (cca/v8)
   host.edk2      git@github.com:tianocore/edk2.git
                  (edk2-stable202411)
   host.tf-a      https://git.codelinaro.org/linaro/dcap/tf-a/trusted-firmware-a.git
                  (cca/v4)
   host.qemu      https://git.qemu.org/git/qemu.git
                  (stable-9.2)
   host.linux     https://git.gitlab.arm.com/linux-arm/linux-cca.git
                  (cca-host/v9)
   guest.qemu     https://git.codelinaro.org/linaro/dcap/qemu.git
                  (cca/latest)
   guest.kvmtool  https://gitlab.arm.com/linux-arm/kvmtool-cca
                  (cca/latest)
   guest.linux    upstream (v6.16.rc2)

Thanks,
Gavin


