Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD0DD6A235
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 21:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPm0EAc1K/nvytn2cDBsP3xI8cBGOIMbd0Cl3IWdsjU=; b=sGh5WTEOs5Dp3hrwiOSkibmYz9
	CozH6uxdEUjs1fGu74J6xUvfiWx6XxO3K3eI9K/68/K/3ukJ1xvew9u7FZIyb8PadxtnTLm8UxdAP
	lDVFzZWIoOlmsG67DPAQOPdybcp7+ofM3Wzd2AJFijQJqZZvvRnurSKjKAaMQV5vLz7gc1CpadYEg
	qD/dQMd5vJYaIeaXVMDBPBwOclniAf4coGUdGGd2TQ5oFIYeeUK05MQXpjHK3c5e3bX3m/kBjH5Qd
	SJsapMX/eoOh7AAj0S+ZoT986aN+A8677pdS7+ci+sz8th7OGWTHtyXtvyQU4FND/u5Cu6TLHhR+Z
	JyPPRKow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBhWJ-00000000tZP-01vW;
	Thu, 14 Nov 2024 21:36:55 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBhVN-00000000tJG-2C7K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 21:35:58 +0000
Received: from [192.168.35.166] (c-73-118-245-227.hsd1.wa.comcast.net [73.118.245.227])
	by linux.microsoft.com (Postfix) with ESMTPSA id B9C9C20C8BA9;
	Thu, 14 Nov 2024 13:35:54 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B9C9C20C8BA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1731620155;
	bh=XPm0EAc1K/nvytn2cDBsP3xI8cBGOIMbd0Cl3IWdsjU=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=NQqKMwIsblJDQplTM3wYIQkHUxgOW2n632p2zFLlvECKHoCZPlToMzD5erEwPYfpe
	 0xAcZl2lQraCLw3r4lLsocd3IgabK8u3iSBdob3SxKEh55p874cPox288sd/GyuZhW
	 Ar0G9QMjSax+jhKvh5SSd5YXIokLKru/kSANZoeY=
Message-ID: <4743445a-09c4-4f14-b6a7-2e6509077680@linux.microsoft.com>
Date: Thu, 14 Nov 2024 13:35:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: eahariha@linux.microsoft.com, kys@microsoft.com, haiyangz@microsoft.com,
 wei.liu@kernel.org, mhklinux@outlook.com, decui@microsoft.com,
 catalin.marinas@arm.com, will@kernel.org, luto@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 seanjc@google.com, pbonzini@redhat.com, peterz@infradead.org,
 daniel.lezcano@linaro.org, joro@8bytes.org, robin.murphy@arm.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
 bhelgaas@google.com, arnd@arndb.de, sgarzare@redhat.com,
 jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
 skinsburskii@linux.microsoft.com, mukeshrathor@microsoft.com,
 vkuznets@redhat.com, ssengar@linux.microsoft.com, apais@linux.microsoft.com
Subject: Re: [PATCH v2 4/4] hyperv: Switch from hyperv-tlfs.h to
 hyperv/hvhdk.h
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>,
 linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, iommu@lists.linux.dev,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-arch@vger.kernel.org, virtualization@lists.linux.dev
References: <1731018746-25914-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1731018746-25914-5-git-send-email-nunodasneves@linux.microsoft.com>
Content-Language: en-US
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <1731018746-25914-5-git-send-email-nunodasneves@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_133557_595229_0D21AB2C 
X-CRM114-Status: UNSURE (   9.67  )
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

On 11/7/2024 2:32 PM, Nuno Das Neves wrote:
> Switch to using hvhdk.h everywhere in the kernel. This header includes
> all the new Hyper-V headers in include/hyperv, which form a superset of
> the definitions found in hyperv-tlfs.h.
> 
> This makes it easier to add new Hyper-V interfaces without being
> restricted to those in the TLFS doc (reflected in hyperv-tlfs.h).
> 
> To be more consistent with the original Hyper-V code, the names of some
> definitions are changed slightly. Update those where needed.
> 
> hyperv-tlfs.h is no longer included anywhere - hvhdk.h can serve
> the same role, but with an easier path for adding new definitions.

Michael already mentioned this, I'd also agree that it's better to
remove hyperv-tlfs.h entirely since it's been superseded.

This looks good to me, I'll wait for v3 addressing the other comments to
take a look again.

- Easwar

<...>

