Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C10AD5E12B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 04:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A0vEUFyfwb+AHUDrN438og+hVkohgSw0iUoCdoRA1Ko=; b=B6RY+Oa6nXeTwHV+07pgKEfgbJ
	edhgKAUaj2ALoQFsvv9ZteoMPymU110CUS9hj6yLpm/vcdlpzBANZmDTERvZnU8Z/mVjeDDFNJe+z
	wL88U186806nnX7LU9UHsqSYm0nTfO3eSsXfiUhJNKUgtxoobvQnNTh2XcXNc8JDgj9i2uGVryVyv
	RRPAhyho1g2Jqn1Wr+ZRxOSvptq/2wLLE9cLFbeWDWFyy+ZRo8pRgIREfMeYpWLX8QGO9+8Yfke0a
	PJwpz0ONBXoRifDObosJRjwRX6+L6+laB4zY2UKypUiK9LxnxhRVHOed1VxvV9AsDBVSRqhwQeo9q
	z+C3W+Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9GsH-00000009J5W-3gFi;
	Fri, 08 Nov 2024 04:45:36 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9GXK-00000009G6D-1H9K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 04:23:55 +0000
Received: from [192.168.35.166] (c-73-118-245-227.hsd1.wa.comcast.net [73.118.245.227])
	by linux.microsoft.com (Postfix) with ESMTPSA id 3146E212D516;
	Thu,  7 Nov 2024 20:23:51 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3146E212D516
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1731039832;
	bh=A0vEUFyfwb+AHUDrN438og+hVkohgSw0iUoCdoRA1Ko=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=Q5wLvscPYwSE2Gv2RNViaS+MQCJVhbLsRYc+QH7A59zAaVXAzXr/CNHosZHtn9oIq
	 ItpyTxzuVdw1CtCC0hgVWJRvWivgrK8UAAjT83gKTtJwz4K7phvj69liK8jbr9hC/M
	 tba1rtqTZHWTlxyISa5uv33pRbr+1jMCNc2u1wGk=
Message-ID: <ff6ac9b5-0903-498c-be2a-2949e9bee8d5@linux.microsoft.com>
Date: Thu, 7 Nov 2024 20:23:51 -0800
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
Subject: Re: [PATCH v2 1/4] hyperv: Move hv_connection_id to hyperv-tlfs.h
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>,
 linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, iommu@lists.linux.dev,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-arch@vger.kernel.org, virtualization@lists.linux.dev
References: <1731018746-25914-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1731018746-25914-2-git-send-email-nunodasneves@linux.microsoft.com>
Content-Language: en-US
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <1731018746-25914-2-git-send-email-nunodasneves@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_202354_409901_9FEFF69E 
X-CRM114-Status: UNSURE (   6.77  )
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
> This definition is in the wrong file; it is part of the TLFS doc.
> 
> Acked-by: Wei Liu <wei.liu@kernel.org>
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> ---
>  include/asm-generic/hyperv-tlfs.h | 9 +++++++++
>  include/linux/hyperv.h            | 9 ---------
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 

Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>

