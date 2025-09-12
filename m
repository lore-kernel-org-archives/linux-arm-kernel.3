Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B67CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 16:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7elSQBMAFDtx3LU+iu2AHo8cqZFN9YegFKjbtCN4SAM=; b=ikFmgMAICDTKV+azt/yXA/43M9
	yZvcPkmz+oigUtopPWWrjDAlxfNsCK2ivt2KWm/0o0UQYA/vW4ZdyOBvAr7peQ2lI7qGxsgGfP4YT
	F9KDazMa+Nnt4cpoAaGZxsgflcKCQ8qjq9K140jzZ/HO7sDgR+Z04r35BxUW8Ma3Ki+23RdaCwvVo
	AnzhUzUNbHK1i7p8fhRDuqwYuF6sgu/MFVPFHMKSeFudAue9s7k2LU7EDA+LN8CYTxfU4NGFx8AqN
	nIZIKSrB+rEhvujZpgZzS515Zpy+XR9Mwx1IWPW9O2yEgSgRrxctC8tLgTTHRUVuvsBvw1VkjNx3J
	89vhMpsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux6ak-0000000AWZw-1SUe;
	Fri, 12 Sep 2025 16:25:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux6ah-0000000AWYm-301B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 16:25:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CFC5F431C5;
	Fri, 12 Sep 2025 16:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F054C4CEF1;
	Fri, 12 Sep 2025 16:25:36 +0000 (UTC)
Date: Fri, 12 Sep 2025 17:25:33 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: will@kernel.org, broonie@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, james.morse@arm.com,
	ardb@kernel.org, scott@os.amperecomputing.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v7 2/6] KVM: arm64: expose FEAT_LSUI to guest
Message-ID: <aMRJfYKj8l5UKBxm@arm.com>
References: <20250816151929.197589-1-yeoreum.yun@arm.com>
 <20250816151929.197589-3-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250816151929.197589-3-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_092539_774328_CD0183DF 
X-CRM114-Status: UNSURE (   6.57  )
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

On Sat, Aug 16, 2025 at 04:19:25PM +0100, Yeoreum Yun wrote:
> expose FEAT_LSUI to guest.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Acked-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

