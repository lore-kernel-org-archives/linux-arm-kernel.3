Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDC9CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sVe55kbXzOg+Z8nDDwZg/tyzZkOiB0dMGcWUzNM9AVY=; b=PWFFZWTJ+yP+MaeCnxRxYwfvPz
	x+LdSZ6MFMF/zs/0QEpRSvE2CwzibUXfwptxZTxugDOocZb1tVpPz4nLjK7J5ysr21tRRO6LC/EZt
	S7SLw3PqC/n1LJDih1ZMj/HArUGFhbkbftJrPX3JNrCFBiwUVo/umyLn2lHQOWKr/s8JdoXQMeWRw
	zZPm8SRxkMMFbasu815ic5vsNeJlBTi+XqiwxwclFHRSG/Vun6msdbVTx9VNVau3jGvE0zxBVN/XO
	QKuMR5ZoukdspduAGEcSIDXrKTCMOfNp4zWeHq3NqT8X/AAWS5/QI7YRaRj03C8jIJ9ovJOKr3JFt
	KaTxR99A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzY9-00000007lga-2WZo;
	Fri, 29 May 2026 15:55:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzY4-00000007lfX-3SGi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:55:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DD30140787;
	Fri, 29 May 2026 15:54:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 415981F00893;
	Fri, 29 May 2026 15:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780070099;
	bh=sVe55kbXzOg+Z8nDDwZg/tyzZkOiB0dMGcWUzNM9AVY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=THR4yJ+SIEv4gOdeg1a71O5x2FJCph4oUeQBkYsREFY0TNOYpRjK7cEml+jLO6wKO
	 1QtkI4HvQgFJlgQejqTrXQaR9BCrsdWs7+ecj3raEZ0NUbc2EiGFITOOeycUtPSc/Y
	 GR2eoyfmSaWialaDzC59KjPaWUgkERidsR5YnBZ43Dyt01hGCdwjfq7JGQO/wV7i82
	 IDBdGGC06mik3nVm7zUvNRoy42xiNa1BUgcSmMOqCiHc/qVM062PmWzHFrBOhLgQgE
	 8uXUMUKpH1Fwsqh4Mnl4L8aLQq7uDe7tIo3lulxgqqYSU5EmfaQ8UeXWI/aIRH4Zcx
	 AKhXEy8L+Gihg==
Date: Fri, 29 May 2026 16:54:42 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Ahmed Tiba <ahmed.tiba@arm.com>
Cc: will@kernel.org, xueshuai@linux.alibaba.com, saket.dumbre@intel.com,
 mchehab@kernel.org, dave@stgolabs.net, djbw@kernel.org, bp@alien8.de,
 tony.luck@intel.com, guohanjun@huawei.com, lenb@kernel.org,
 skhan@linuxfoundation.org, vishal.l.verma@intel.com, rafael@kernel.org,
 corbet@lwn.net, ira.weiny@intel.com, dave.jiang@intel.com,
 krzk+dt@kernel.org, robh@kernel.org, catalin.marinas@arm.com,
 alison.schofield@intel.com, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, Michael.Zhao2@arm.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-cxl@vger.kernel.org, Dmitry.Lamerov@arm.com,
 devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-edac@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH v5 03/10] ACPI: APEI: GHES: move GHESv2 ack and alloc
 helpers
Message-ID: <20260529165442.76449f9e@jic23-huawei>
In-Reply-To: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-3-2e0500d42642@arm.com>
References: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com>
	<20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-3-2e0500d42642@arm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_085500_897112_8FE78C14 
X-CRM114-Status: UNSURE (   6.91  )
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

On Fri, 29 May 2026 10:50:43 +0100
Ahmed Tiba <ahmed.tiba@arm.com> wrote:

> Move the GHESv2 acknowledgment and error-source allocation helpers from
> ghes.c into ghes_cper.c. This is a mechanical refactor that keeps the
> logic unchanged while making the helpers reusable.
> 
> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
Reviewed-by: Jonathan Cameron <jic23@kernel.org>

