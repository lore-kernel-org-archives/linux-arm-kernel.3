Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402A3E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 00:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u23OnO0SqaMwX3ZNIieQ7xZ/JwcOd/jMwpkHUTV6Uw4=; b=K0HVaZsPZNR4dkn5/mXAw5o31b
	ikrrapdGdX+uTm2P5CHGzX/RcojCshdsI1ZXphcSPDI+VdAvQGjf4x9BoM/PC971w/5TvTKt8nM54
	SjWEztpTmDXvgF6WHeqi8dQ3F0aJXoq6rCQUpLdAvldfaK2Xb9bpnh3r8kxfL+7MklS8MMlXxUGZa
	rZINicNu1P5cQSCNS6AyhRyw0ZkP+gAkiGv/v2RoMLfQNfZOdU3oNPXOd0ipoNv0hmEA1fpCz7XBj
	FNI9CmuKVSk5T9ImSNJSsEFAuq4cHCFaPFl/VELDA9hiA6j0RjrfU9tbUpl75JvH7YtG4U1Z4zmgQ
	s5RHVd4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKRK9-000000063Bx-2xUH;
	Mon, 09 Dec 2024 00:08:29 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKRJ6-0000000630J-0Ec4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 00:07:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4413FA40DD0;
	Mon,  9 Dec 2024 00:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E74C4CED2;
	Mon,  9 Dec 2024 00:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733702842;
	bh=qQNrvfENV3cjN5xREbhZ7VhcAz/yAeIeQ9LRLJN97rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iax8gMl+0GT3J8M4iZ9gQyDPrIu27a3sIyltOK6REilnDJPHdyhdVAXaRpTxxtOqB
	 MuqYjX3mhFXSRTor5pSLAmTNhGqLX3rmQwUsVw1mIIQaMU8vd7TVVaPJGzHmpmf/D0
	 daiD828J/LIghaf4mumgtHGdKuVOqThvGRQ1PTODlqAUQpPGSsDwLt9knC26SfKG8m
	 WwmSMezcdQ82gahImT/PW3UM/9cgOCD2+zwAWFB94NzIC+EQ1lBvz5zRGeTOxXjn89
	 QpSpbyWeYA4tGb+l7kxIZkDNWiRpm9eHgkMBH9Vmty7qgrQhdwOU8rrzaCbGYjrm8x
	 /E28uEALgWPAg==
Date: Mon, 9 Dec 2024 00:07:20 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	iommu@lists.linux.dev, netdev@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arch@vger.kernel.org,
	virtualization@lists.linux.dev, kys@microsoft.com,
	haiyangz@microsoft.com, wei.liu@kernel.org, mhklinux@outlook.com,
	decui@microsoft.com, catalin.marinas@arm.com, will@kernel.org,
	luto@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	seanjc@google.com, pbonzini@redhat.com, peterz@infradead.org,
	daniel.lezcano@linaro.org, joro@8bytes.org, robin.murphy@arm.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, arnd@arndb.de,
	sgarzare@redhat.com, jinankjain@linux.microsoft.com,
	muminulrussell@gmail.com, skinsburskii@linux.microsoft.com,
	mukeshrathor@microsoft.com, vkuznets@redhat.com,
	ssengar@linux.microsoft.com, apais@linux.microsoft.com,
	eahariha@linux.microsoft.com, horms@kernel.org
Subject: Re: [PATCH v3 1/5] hyperv: Move hv_connection_id to hyperv-tlfs.h
Message-ID: <Z1Y0uJlVn-86KHE8@liuwe-devbox-debian-v2>
References: <1732577084-2122-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1732577084-2122-2-git-send-email-nunodasneves@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1732577084-2122-2-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_160724_169858_94DFBF8C 
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

On Mon, Nov 25, 2024 at 03:24:40PM -0800, Nuno Das Neves wrote:
> This definition is in the wrong file; it is part of the TLFS doc.
> 
> Acked-by: Wei Liu <wei.liu@kernel.org>
> Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> Reviewed-by: Michael Kelley <mhklinux@outlook.com>
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>

One comment about the ordering of the tags. It is better to organize
them in the following order:

Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Acked-by: Wei Liu <wei.liu@kernel.org>
Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>
Reviewed-by: Michael Kelley <mhklinux@outlook.com>

I've made the change for you while applying the patch.

Thanks,
Wei.

