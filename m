Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A128E77181
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 19:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aNTJR2KnZDmn2B9w7QnkiUuDqNvJl6jmEMliRyXtV4c=; b=WZdlvA+elCcOfovNjS429EeQXl
	nBBq9gN4InScVY+dS2uVaSoM8bt3GHr6liyXaDJsvph7T35Il2sPUoDfElHH+Fq1LLgveUyI0lpHH
	jH/3GzOkpuTHi8xH2tMv5d4ozOWOsWx0n9nGMuK9IV0UmbPtjjxcr5YtpjXgp8wwTQb9qhjo0sxfH
	+ncHB2KSTEJxrv49XjoUTvYHO8vMyFClszz7NNcilwwxu2t/KiJVJDjB4rOAV93+9Cjfy1BFDSAlv
	c4LE2BcP5hJyZj0XlPtGJUxuLF5ZpC12LlgpBYAsz1GeqKbJxvZ6KAB4LzrG2rbI7Hh5YSeNJIHiI
	ekPGyS2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKjJ1-000000091gs-1YsX;
	Mon, 09 Dec 2024 19:20:31 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKjHy-000000091NJ-28tr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 19:19:27 +0000
Received: from [10.0.0.115] (c-67-182-156-199.hsd1.wa.comcast.net [67.182.156.199])
	by linux.microsoft.com (Postfix) with ESMTPSA id A64AF211F951;
	Mon,  9 Dec 2024 11:19:23 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A64AF211F951
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1733771964;
	bh=aNTJR2KnZDmn2B9w7QnkiUuDqNvJl6jmEMliRyXtV4c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X79ao65h/u13GLNKxSqyMJ9uUvtBpp3rw2v4gWdlaDngbyQZXN55Xh0ffA4IZXRhV
	 QT6eYndeymBwoYWDgPYJwOjTDoq9oNVdrDHwkzAldgCCnjvKQkd2EPP2EZ64G6LAZ0
	 D3aklNFCdRwoxFPP+bj7TYr2I59tP+ffoezRugPw=
Message-ID: <a76d129c-2956-4bbc-bd14-cb12737b64df@linux.microsoft.com>
Date: Mon, 9 Dec 2024 11:19:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] hyperv: Move hv_connection_id to hyperv-tlfs.h
To: Wei Liu <wei.liu@kernel.org>
Cc: linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, iommu@lists.linux.dev,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-arch@vger.kernel.org, virtualization@lists.linux.dev,
 kys@microsoft.com, haiyangz@microsoft.com, mhklinux@outlook.com,
 decui@microsoft.com, catalin.marinas@arm.com, will@kernel.org,
 luto@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 seanjc@google.com, pbonzini@redhat.com, peterz@infradead.org,
 daniel.lezcano@linaro.org, joro@8bytes.org, robin.murphy@arm.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
 bhelgaas@google.com, arnd@arndb.de, sgarzare@redhat.com,
 jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
 skinsburskii@linux.microsoft.com, mukeshrathor@microsoft.com,
 vkuznets@redhat.com, ssengar@linux.microsoft.com, apais@linux.microsoft.com,
 eahariha@linux.microsoft.com, horms@kernel.org
References: <1732577084-2122-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1732577084-2122-2-git-send-email-nunodasneves@linux.microsoft.com>
 <Z1Y0uJlVn-86KHE8@liuwe-devbox-debian-v2>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <Z1Y0uJlVn-86KHE8@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_111926_584826_700D88D4 
X-CRM114-Status: GOOD (  10.67  )
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

On 12/8/2024 4:07 PM, Wei Liu wrote:
> On Mon, Nov 25, 2024 at 03:24:40PM -0800, Nuno Das Neves wrote:
>> This definition is in the wrong file; it is part of the TLFS doc.
>>
>> Acked-by: Wei Liu <wei.liu@kernel.org>
>> Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>
>> Reviewed-by: Michael Kelley <mhklinux@outlook.com>
>> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> 
> One comment about the ordering of the tags. It is better to organize
> them in the following order:
> 
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> Acked-by: Wei Liu <wei.liu@kernel.org>
> Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> Reviewed-by: Michael Kelley <mhklinux@outlook.com>
> 
> I've made the change for you while applying the patch.
> 

Thank you, noted for next time.

> Thanks,
> Wei.


