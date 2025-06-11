Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2523DC71134
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 19:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUZR/39vopw/woL6HiKhpJ8H5BiBMcCwO+TEzoPGWpA=; b=JZNhFqCpW/vwFZXjA/TryRAGg9
	Pmjqyo//Y0PZdh9GPyphZBxNdVePNV7OyX/mJOlBNyxGhEMeczqtRC4islBnNb3Kg/SAOtdWOMTQT
	V+6ylZghAoytJVmbhFTJXQ31TO98yUIv7k0ttEetCS1pCgsdGVV+vYfjIvvC/6VDdJ2tjCn6oTQ9y
	VxS6/Pu+v5jRil9tMTIN6rwMoRBAyIU4AtecqKiJwrrw1blGLkrZOCdtBGsa6hXNrAUYuRM8aKpdR
	5itE4isw2FS+6vgk3vVc7bGJQ685dWyJKCcQUoXzy+wgJFRtE2sRgo0v7ly2PFxPhbWPr12UrZObc
	mITQrT5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRYy-0000000B55t-0W5U;
	Wed, 11 Jun 2025 19:56:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPOUn-0000000AdgM-1iA9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 16:40:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3CB0349F6F;
	Wed, 11 Jun 2025 16:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B67C6C4CEE3;
	Wed, 11 Jun 2025 16:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749660012;
	bh=TqlQzmTCsnQRMQq+SYvGGb4qf8vY2W39tOrtj8jKeCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g0yes6/mOGsZwNR36De45p0AXo8bgF/d3Lsy5MV3CpXXXkJqD25wWAJVbCF4oR9ey
	 Wqlv10yXvQT1ZBw+Pf3wDLAX0WpjrLCZW71WWxcrDQFjpNhXwff1Wzy7ec2FbtlltJ
	 qi0+1NJd2uU+I09mugwMdLJhBPkU4CbpN7biYR0ObjMlW4kjPYFti+z2xKHDMay18W
	 sSxr2ClV9TMGztKGtC4HuF9oTrlNVSsXd8lf8rdtUCRUDUebbDwdeUqFRnNGCBBVMh
	 jW0yIexgIad1U6HHbtHYGioPfOo/zD1vsqBFOsSmXlXUjiXdu0M5fX5mKDP0R2Oj13
	 n75pghFXrgmqg==
Date: Wed, 11 Jun 2025 19:40:08 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: sudeep.holla@arm.com, peterhuewe@gmx.de, jgg@ziepe.ca,
	stuart.yoder@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v2 0/2] fix failure of integration IMA with tpm_crb_ffa
Message-ID: <aEmxaJQNfYJwSCd0@kernel.org>
References: <20250610060334.2149041-1-yeoreum.yun@arm.com>
 <aEgmhwu1RP27yBpw@kernel.org>
 <aEgwpXXftXW6JNRy@e129823.arm.com>
 <aEg6Bgh8TqzK5nSu@kernel.org>
 <aEhDY4VlkIPYAjPE@e129823.arm.com>
 <aEhIPC95FisptBO5@kernel.org>
 <aEhNnAxlToRMteA2@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEhNnAxlToRMteA2@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_094013_465092_C0FDF977 
X-CRM114-Status: GOOD (  10.87  )
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

On Tue, Jun 10, 2025 at 04:22:04PM +0100, Yeoreum Yun wrote:
> > OK, if ffa_init() is leveled up in the initcall hierarchy, shouldn't
> > that be enough as long as ko's can be found from initramfs?
> 
> As you mentioned, this is handled in Patch #1.
> However, although ffa_init() is called first,
> unless tpm_crb_ffa_init() is also invoked,
> crb_acpi_driver_init() will fail with -EPROBE_DEFER.
> 
> Please note that IMA is always built-in and cannot be built as a module.

Sure but if one needs IMA, then tpm_crb_ffa can be compiled as built-in
with zero code changes.

BR, Jarkko

