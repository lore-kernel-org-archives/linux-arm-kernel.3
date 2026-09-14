Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C458CC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QTyyRmihpMcljrlj8iAOOjw7vF5j4vHtfs9ZjQcTPeU=; b=Yj3/CIyrlda6hperSBDv7spIeq
	O9srTJEuM0bt+8sDs+XH5o68ZIu0pvbuoWqeuVQeONIERs7xF+YYGgspKBZOJfCh6n91IKSVNDHb5
	u6m1G7oGz5MvU0X4SxL0SQlmwWhkLXAp89gTrbuxvJE6BYmiNpL87llPdk1EvDbHVEAADkqsoJ6bd
	bubHOrdDfvO0yCXQcBXPSfuLfTEKd4PHxX/YOQ1qEvRixETXf8ncv0W3Y90SNvPQqQp50tUPuhAZM
	fdyeSLXt+v5EiB5yEwBrCOO5AHLWu4h6/JUp40JQUJnuiDhQXBQu2Bhm9U+ddl02aiUSof4E2K5dW
	XsLLl+6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66bp-00000003jbN-2Kd3;
	Mon, 14 Sep 2026 13:20:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66bm-00000003jaj-45HZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 13:20:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FC28143D;
	Mon, 14 Sep 2026 06:20:26 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D260B3F9A2;
	Mon, 14 Sep 2026 06:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789392030; bh=qccnsiTYONbRWySebO6ZiFYfo2sGWGcPDn1cjxnGQhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WxMq8OooOj2Fzfk6TeiR1IttqFNGgyHs47+3CVbDPZtNze6f8ETgMuqrLKbEoSW61
	 19e0ABb2O0/NOg5qqC0+QpiT+ioAlx83zrK4fJuNNey4ykXAP6Hgmbt4/d0Z+gx1QU
	 ewQBYatftul5NwpU4LcWpjvNRBffnBfPq8zsqw0I=
Date: Mon, 14 Sep 2026 14:20:23 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v11 4/7] arm64: realm: Move Realm memory encryption ops
 to RSI code
Message-ID: <aqf0lyf6dQRc4eDR@arm.com>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
 <20260914060511.277948-5-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914060511.277948-5-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_062031_049101_E81DB5F2 
X-CRM114-Status: UNSURE (   9.29  )
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

On Mon, Sep 14, 2026 at 11:35:08AM +0530, Aneesh Kumar K.V (Arm) wrote:
> Realm memory encryption callbacks are CCA-specific. Keep the Realm callback
> registration with the RSI initialization code instead of pageattr.c, which
> only needs to provide the low-level page-attribute transition helper.
> 
> Export __set_memory_enc_dec() within arm64 so the RSI code can wrap it with
> the Realm-specific encrypt/decrypt callbacks and warning policy.

Suzuki commented on v9 I think not to expose this function but I don't
see a nice way around since we now moved the realm_crypt_ops out of
pageattr.c (so we'd have to export something out of that file).

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

