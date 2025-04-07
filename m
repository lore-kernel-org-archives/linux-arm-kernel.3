Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACFDC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 22:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XnPScX/NAjyVz6+JEGr5QDMpo7liX3mFdulJgUNodLs=; b=vWaCNxdc7JxRaOcxZZEfkU/b4H
	j4AWak5GA+tkh4uB33ZtupLSjr8F8+8JtELC5CN4U0CH6Upqu61X67cY8BfG3XWmy5WZZc5HV/jL4
	YdNuTVJjPJNM2eweLRTTiGBnfZbP+bcqvDIyU6hvlcMRdn3ufJydGfWIwZiXvlTK6Uo4LdHwV8a/O
	q6I9B/pwU0/M87irVScrWTs80PXTS54SpYUvh7dT/H0b2obQPlJzGGz7pc6ArrpgThDPdOaFtirQK
	YUywUFF/KHOF6OxroVDiMhfx7QmJwPwY77co1HYp6kvNNrE7mzAgMhnoF8d1+mfkAD2YbE9OZn6Qe
	0S4gH3iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ufD-00000002B3g-2kTl;
	Mon, 07 Apr 2025 22:09:55 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1udP-00000002AwF-1D9K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 22:08:07 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744063677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XnPScX/NAjyVz6+JEGr5QDMpo7liX3mFdulJgUNodLs=;
	b=qfCRSOkMECNTiSrLqst2U3rlzfe1jESwhQJ4yfpXCZ7kgIBOOCZKxXYd7lketdl9vRpIyQ
	qptnoNk3OvZowA8ktf//DR1AEXK0zeXSeuC92EtoimT9QW9LDkxIrSd8I3noDl6c2jxKmo
	bN4WPHIoZKVMVfH99sMyjkJkbyJj7V0=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev,
	Will Deacon <will@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	Sebastian Ene <sebastianene@google.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Quentin Perret <qperret@google.com>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] KVM: arm64: Use acquire/release to communicate FF-A version negotiation
Date: Mon,  7 Apr 2025 15:07:46 -0700
Message-Id: <174406364625.3332785.16419054127617723958.b4-ty@linux.dev>
In-Reply-To: <20250407152755.1041-1-will@kernel.org>
References: <20250407152755.1041-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_150803_661700_71857282 
X-CRM114-Status: UNSURE (   8.44  )
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

On Mon, 07 Apr 2025 16:27:55 +0100, Will Deacon wrote:
> The pKVM FF-A proxy rejects FF-A requests other than FFA_VERSION until
> version negotiation is complete, which is signalled by setting the
> global 'has_version_negotiated' variable.
> 
> To avoid excessive locking, this variable is checked directly from
> kvm_host_ffa_handler() in response to an FF-A call, but this can race
> against another CPU performing the negotiation and potentially lead to
> reading a torn value (incredibly unlikely for a 'bool') or problematic
> re-ordering of the accesses to 'has_version_negotiated' and
> 'hyp_ffa_version' whereby a stale version number could be read by
> __do_ffa_mem_xfer().
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Use acquire/release to communicate FF-A version negotiation
      https://git.kernel.org/kvmarm/kvmarm/c/a344e258acb0

--
Best,
Oliver

