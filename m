Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B3FFEA80D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 06:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pf2aP5j0cWMrde9xV40F9uxk8K2GUvZ19JNXNz1B5Hc=; b=TkdIxQkXbu2gIcV63LdyZCeOlb
	KvDc0XxweZ9Pj5xodOpi0wAxmgau+4IrfkLkfSx3xXYFjqZEUnOKYc0iEavOXkNNn3iUkbnD9jfxv
	Wej/A0SDHcMfMk6dAaGXZ9N/MNexwomx+NLIqvGnBiRb7Lkq2BzQi7LqxKQRPvyYqQQ678e6VMpKq
	v/8O8vYH1tJVAfT3/Wj7SxiN+iCl1vmKByyqFfOxjabWWkWCWd3YULEXzc14oyRt8+lvP0OW2JBdM
	3ep089kMGAX5sTOesEmfGkjzUPvoLgl9b805HCZYMbWXpXXp7y2DZssNKkHCrX6dyC0aq0te3Tckn
	o0wx7ppA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Hsb-00000002nSK-01Q7;
	Wed, 25 Mar 2026 06:38:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5HsY-00000002nRJ-0uyU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 06:38:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774420687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pf2aP5j0cWMrde9xV40F9uxk8K2GUvZ19JNXNz1B5Hc=;
	b=A4Ma5kI+gUClzeqlpsBX4FPv0i3UO0xYGl6lF2osBMwAwntWpiO61kmHAbvtT/3IhkHFuA
	6X9e+LKSxziH7SIPLU7rxqf66vK2/xb69uG12Kt/LJIMOnDfzzHO5niYwlh5Y0s6El7c3B
	qKv1r58fBTpun3OaW3HWkEBZdvlIuZw=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-9vkppXxHNk20xJzbsgDMHg-1; Wed, 25 Mar 2026 02:38:05 -0400
X-MC-Unique: 9vkppXxHNk20xJzbsgDMHg-1
X-Mimecast-MFC-AGG-ID: 9vkppXxHNk20xJzbsgDMHg_1774420685
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-829b7ed8964so4790531b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 23:38:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774420685; x=1775025485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pf2aP5j0cWMrde9xV40F9uxk8K2GUvZ19JNXNz1B5Hc=;
        b=TXF0vEBOFpeOsrTTNRIPuSUQM3EZi751zUXxSEoChw/YLJK2neniSOImcmu1eEZWvm
         6uwF+PZicKq2n+W3Q4flZ3xFcr6PCGUMj90CGGpLjgnoEoOAVdRSf0J7twGxzro+oDGw
         PzF+UTQqNMYtUDZJuQHBXPpf5RJh4rb+jpDHEmTCrBi2/495A6miYe54x6tD6GtzxfoP
         7IcSXF+krLzK3bRWzsUTL+F83pQvW/i90FI7qZoTlkc8vZtxUlCqI23xJC3WMXhUkCR+
         jZ6F+xs4+mApwknU5bkZPWI/4Fw93Qg32Ga3fqrisQTfpITUpRexN5mxYRcngDQwDhQB
         CN6g==
X-Forwarded-Encrypted: i=1; AJvYcCVv5X/WRp8+ZldBBeDNrRmYq78CJJtahlol35oQYgvSFVb43rCLe6OMtvqF6nWC5Iwh6z6JryWESSCws4Em7YuM@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9vYQsvayZeIOiNR5zCVrEVhWVa3RxtTY3M5HUsd82i0LlM9Em
	NVHMs3+4WzMrNxOyRZkerwAa5kXYE8h3+1ioyOdpqfnoywajbqzo0bpILDK3xCnobS5SzIspSug
	T9NpO8oC80dIEVq1/0mm9QeHY/rACCQcbUKiCXDsO+zqLl3WTJwE6G+srTsLquUMzWSGuiOfZ00
	lM
X-Gm-Gg: ATEYQzxQe+qB+/1Da3LHyU/rtl5mJcgGmAJKl+w1+ijcUDVr2Bk+BU5v/vlXGZw2cNC
	YESeoxYWWr23Dnf+efh5zCertA+5aJdm4eL4qebddwi6aeYWmfuDH1MN7HVn8TsYi5tyoD4exWq
	HBglPwSm24851o84tfiYg6cOF2l9K5kuS+IMBNc3sspL3M9YLBtFYl0xvVjUqMDDZDwC279s6cd
	ac/CaETF+3CHL0lgh7G5lxzN6ahNW41X+kSjUXBuOz5NkkAFJ+NLRZse6pDq8WTKN2OPpRTb1MD
	Zzk52h7eUR/URG4Vr6TS18ZlcYbrFOnjUaK50m2olBpW1Jp/fyBJeYwjXevcyZZyxnNN1rBwYEt
	AFCDGPqLr8j+SgjylZ1CGRsDFyy5qwe97zIzbXqWRbN9um/VfeWlkr3VVQMlpc1o5
X-Received: by 2002:a05:6a00:1f0d:b0:829:8041:83f with SMTP id d2e1a72fcca58-82c6ded62f5mr2295357b3a.7.1774420684589;
        Tue, 24 Mar 2026 23:38:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f0d:b0:829:8041:83f with SMTP id d2e1a72fcca58-82c6ded62f5mr2295316b3a.7.1774420684086;
        Tue, 24 Mar 2026 23:38:04 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bbf0c2sm17111626b3a.15.2026.03.24.23.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 23:38:03 -0700 (PDT)
Message-ID: <0b7121e7-3c74-4303-a200-01d2b7c535ce@redhat.com>
Date: Wed, 25 Mar 2026 16:37:52 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/48] arm64: Support for Arm CCA in KVM
To: Steven Price <steven.price@arm.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
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
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve <vannapurve@google.com>
References: <20260318155413.793430-1-steven.price@arm.com>
 <abyAbPIkDn2bGZwd@p14s> <37bc1222-6fc7-48f0-94d3-6eaac420aa55@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <37bc1222-6fc7-48f0-94d3-6eaac420aa55@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AsJUD9LxFtwJovN0S56521LUR9-m4GZvgLlr3i2UpQc_1774420685
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_233810_337250_36CAB414 
X-CRM114-Status: GOOD (  13.27  )
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

Hi Steven,

On 3/21/26 2:45 AM, Steven Price wrote:
> On 19/03/2026 23:02, Mathieu Poirier wrote:

[...]

>>>
>>> The TF-RMM has not yet merged the RMMv2.0 support, so you will need to
>>> use the following branch:
>>>
>>> https://git.trustedfirmware.org/TF-RMM/tf-rmm.git topics/rmm-v2.0-poc
>>
>> This RMM version is expecting a RMM EL3 interface version of at least 2.0.  Do
>> you have a TF-A to use with it?
> 
> You should be able to use the 'master' branch of the TF-A repository.
> For now you need to set RMM_V1_COMPAT=0 to enable 2.0 support.
> 

In upstream TF-A repository [1], I don't see the config option 'RMM_V1_COMPAT'.
would it be something else?

[1] git@github.com:ARM-software/arm-trusted-firmware.git    (branch: master)

I use the following command to build TF-A image. The RMM-EL3 compatible issue is
still seen.

     TFA_PATH=$PWD
     EDK2_IMAGE=${TFA_PATH}/../edk2/Build/ArmVirtQemuKernel-AARCH64/RELEASE_GCC5/FV/QEMU_EFI.fd
     RMM_IMAGE=${TFA_PATH}/../tf-rmm/build-qemu/Debug/rmm.img
     
     make CROSS_COMPILE=aarch64-none-elf-                               \
          PLAT=qemu ENABLE_RME=1 RMM_V1_COMPAT=0 DEBUG=1 LOG_LEVEL=40   \
          QEMU_USE_GIC_DRIVER=QEMU_GICV3                                \
          BL33=${EDK2_IMAGE} RMM=${RMM_IMAGE}                           \
          -j 8 all fip

Booting messages
================
INFO:    BL31: Initializing runtime services
INFO:    RMM setup done.
INFO:    BL31: Initializing RMM
INFO:    RMM init start.
ERROR:   RMM init failed: -2
WARNING: BL31: RMM initialization failed

Thanks,
Gavin




