Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1ECDC197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 23:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EiYVaoXbtdVeqdOIjPOIL+TQYlIQmgqlmJX0DgXhCSQ=; b=I86dTbcehZIoJ0a2+M9yy4VQMt
	ZOYlq/pPMfcNZqbM8Ahl9GfqpYA/HF/iQ5xO9rVBSTlnGDfUyRfYgOuk4sqfIT04E/REArKc+6hR4
	NyEOBg2sQRiqBsd2dHrUbpfWXRdUd2XYl/8VcptQITHwvqPStUu6+Wtsj/UDIs3Gz5wUdjg/lnTxz
	eoJS1Cqj9GAEZKnIz/AQoJYiTRMdk/3HUSRi1CZJdfAS9TaZ3mEviCxV6xnPjKn/dCC2rM6YXT0+Q
	a9/wV0Z3iPPRkvm8jwPnTOUp/Y4kA6CD2V6vjLy2QeQx+QXYz3V3PLA+ICPfBB8qIPj6EXGfhUpLY
	dilJhQuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnnNE-00000009BMW-1PA3;
	Thu, 27 Feb 2025 23:33:00 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnnBv-000000099pZ-3wDC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 23:21:21 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id D4954210D0F2;
	Thu, 27 Feb 2025 15:21:18 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D4954210D0F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740698479;
	bh=EiYVaoXbtdVeqdOIjPOIL+TQYlIQmgqlmJX0DgXhCSQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZGgsU1Ox1cQX31aaBLp4RLR7Ct4s9L78MTyYhRvvM4obhge2PYIUmXflaMQPr6qxD
	 vDZ9RIa6tzCLJBcZd7GkKr5DDIzXQYIBYS0qvUsV9ZaFdp/0D65u8nPd3bH0DzGWS2
	 ZmGBG9mZl+qWpxpArzPuAcf0HDoEWs1++Nt3ykis=
Message-ID: <b9317a6c-5427-45bf-af93-2b78a8c97863@linux.microsoft.com>
Date: Thu, 27 Feb 2025 15:21:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/10] hyperv: Convert Hyper-V status codes to strings
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Nuno Das Neves <nunodasneves@linux.microsoft.com>,
 linux-hyperv@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-acpi@vger.kernel.org, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, mhklinux@outlook.com,
 decui@microsoft.com, catalin.marinas@arm.com, will@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, daniel.lezcano@linaro.org,
 joro@8bytes.org, robin.murphy@arm.com, arnd@arndb.de,
 jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
 skinsburskii@linux.microsoft.com, mrathor@linux.microsoft.com,
 ssengar@linux.microsoft.com, apais@linux.microsoft.com,
 Tianyu.Lan@microsoft.com, stanislav.kinsburskiy@gmail.com,
 gregkh@linuxfoundation.org, vkuznets@redhat.com, prapal@linux.microsoft.com,
 muislam@microsoft.com, anrayabh@linux.microsoft.com, rafael@kernel.org,
 lenb@kernel.org, corbet@lwn.net
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-2-git-send-email-nunodasneves@linux.microsoft.com>
 <74af19c4-639f-4bcc-b667-b5f102bbb312@linux.microsoft.com>
 <8338dd00-3aa4-418f-a547-1c19623358cb@linux.microsoft.com>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <8338dd00-3aa4-418f-a547-1c19623358cb@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_152120_001140_032E222A 
X-CRM114-Status: UNSURE (   8.64  )
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



On 2/27/2025 2:54 PM, Easwar Hariharan wrote:
> On 2/27/2025 9:02 AM, Roman Kisel wrote:

[...]

> 
> Sorry, I have to disagree with this, a recent commit of mine[1] closed a WSL
> issue that was open for over 2 years for, partly, the utter uselessness of
> the hex return code of the hypercall.

What hypercall was that? I see

		storvsc_log_ratelimited(device, loglevel,
			"tag#%d cmd 0x%x status: scsi 0x%x srb 0x%x hv 0x%x\n",
			scsi_cmd_to_rq(request->cmd)->tag,
			stor_pkt->vm_srb.cdb[0],
			vstor_packet->vm_srb.scsi_status,
			vstor_packet->vm_srb.srb_status,
			vstor_packet->status);

in your patch where `vstor_packet->status` is claimed to be a hypercall
status? I'd be surprised if the hypervisor concerned itself with
the details of visualized SCSI storage. The VMM on the host might and
should.

I'll look through the code to gain more confidence in my suspicion that
calling the SCSI virt storage packet status a hv status causd the
frustration with debugging, and if no counter examples found, will send
a patch to fix that log statement above.

> 
> [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d2138eab8cde61e0e6f62d0713e45202e8457d6d
> 
> Thanks,
> Easwar (he/him)

-- 
Thank you,
Roman


