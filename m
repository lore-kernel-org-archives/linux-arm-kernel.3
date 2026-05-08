Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AFBCD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 17:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fK/Onl2/FR7oKRPW6JslxqlXqWvXkxaD4pvcDzkqZu0=; b=PQLm18V3/a3vjmXijeKouy0EsN
	zDF+DV2Wb+dECN5NKLCeJaSoE0+oZZiNMb4tczdffzhEHGVkfMp8la7CgrWRgPnwtNPtLX0CSVwFG
	b7swKjtDySXBN5BlBau+hL7aMGHBw0HORk2tkb6DomrWoYRBz6qnERNmfXavNmPA9GkcIqvxzh1GK
	HCfIpT0jFnSPFWQ2a6sK6IEV7VM00FfDoamO+n4x32dIDSn7sdOKufmYd3hOZPKxI40pMLieIB8iw
	KMf0/4nrerb+08ff6ZsE/JSvSunkZGCX5JMvej+8T+0b7bR9hqL5//Wr4o0V6Ry2lkQN/MOg7aWQK
	2vpd9nPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLPUD-00000007DOi-1ZvB;
	Fri, 08 May 2026 17:59:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLPUA-00000007DNl-241a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 17:59:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 155DD4057E;
	Fri,  8 May 2026 17:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58D32C2BCB0;
	Fri,  8 May 2026 17:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778263178;
	bh=f+C6+Is1XDoPUTJlfzjwfJtrygH27kCkd9+va+Q5+wQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JWAWPDvGtq97KDoBUrMNVn9jGLtr0S6yU0SmNcoAoyE2s2EAXBMnXtXMka60FpLeN
	 TOFqpirW5UGbw7mPrCRrkHf7mSHljwAahNBB4PpxRGUlk0zsQ3JGvXACFJ5JagLcJa
	 4aKx4OzboqGUMVOH29tprYlLnrAKRc9M0h6jp8Xu8JsIc4Uaf4/vQHPH4DD7ofsEMj
	 jZdY4bHynb3dvCv3fYpWYT3cG0WJTIIb1kWp1Cv5pqgdvE3ayQNdJh6xbZnAynDj73
	 8QhrF5OUcnvkDluYPJUNvNH+/1hLDYGVcoY+ThxaAG4VaOG/iLDTGcoig4HtjCMQZY
	 tIoUF86YTBl3A==
Date: Fri, 8 May 2026 18:59:32 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	jarkko@kernel.org, zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org
Subject: Re: [RFC PATCH 0/3] initalise ff-a after finalising pKVM
Message-ID: <20260508-ubiquitous-sexy-robin-b1ca51@sudeepholla>
References: <20260505095409.1948371-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505095409.1948371-1-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_105938_563803_409727D3 
X-CRM114-Status: GOOD (  17.57  )
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

On Tue, May 05, 2026 at 10:54:06AM +0100, Yeoreum Yun wrote:
> This patch is split out from the patchset [0] --
> fix FF-A call failure with pKVM when the FF-A driver is built-in,
> specifically the IMA-related part.
> 
> When pKVM is enabled, the FF-A driver must be initialised after pKVM.
> Otherwise, pKVM cannot negotiate the FF-A version or obtain the RX/TX
> buffer information, leading to failures in FF-A calls.
> 
> Currently, pKVM initialisation completes at device_initcall_sync,
> while ffa_init() runs at the device_initcall level.
> 
> So far, linker deployes kvm_arm_init() before ffa_init(), and SMCs can
> still be trapped even before finalise_pkvm() is invoked.
> As a result, this issue has not been observed.
> 
> However, relying on above stuff is fragile.
> Therefore, when pKVM is enabled, the FF-A infrastructure should be
> initialised only after pKVM initialisation has been fully finalised.
> 
> To achieve this, introduce an ffa_root_dev ("arm-ffa") and
> a corresponding driver to defer initialisation of the FF-A infrastructure
> until pKVM initialisation is complete, and to defer probing of all FF-A devices until then
> when pKVM is enabled.
>

I have posted an alternative based on all the discussion in this thread
@[1]. I have not cc-ed all the people as the changes are contained in
FF-A driver and not sure if all the cc-ed here are much interested.
All the lists are included I assume and one can always provide feedback
referring to the link.

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/all/20260508-b4-ffa_plat_dev-v1-0-c5a30f8cf7b8@kernel.org/

