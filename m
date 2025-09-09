Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA61CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 12:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kjI8yLNL46JujTBVdfX+1NUIEG5NdqCM6d/7sSAIi0g=; b=NVyMO45I5Zf6iuuJWtLanGoMtP
	Ne3zfIk0v+s8LfvX3DZ7Ne9DzreWckHjpMhRYh0ciFRTflI2kiTxHwo3NAdI78FJIDT9lZdX7fcIA
	FJLf42jC0CRm5OUH1UQEV5qYVJpnNvTR/1Tn3P+FIB0wydhhPubJ1lbQMCC5sCICxuL553Pjaa4dx
	VmeMr2AX/PWyfdbTyCypzbl4ivYITvqkEXttmyzl9nB01uKfXQZ/NZJAYFwGo47w2rr+9jVo0ykjm
	+VGcVes+Kitp71VhbB9zHxgBsMNec7LbvMjTTd5oNyZJ8Gulc9o31R6kScQTzMddvfehTo7t4m5H5
	TbeQbLuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvx4W-00000006wLO-2vEw;
	Tue, 09 Sep 2025 12:03:40 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuaw-00000005wh3-11dr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 09:24:59 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1757409894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kjI8yLNL46JujTBVdfX+1NUIEG5NdqCM6d/7sSAIi0g=;
	b=eJlTKMmzYZpLew34qSC9s68db8VsN2gT8IlLEawPBkgsOS7Cxe1kSusXwKtr4hv3eG09Xu
	QzGxljkjGppHekS+NzfHi28Z3nCxurshaYdXEsNsAnP9BAF5OfJ4mtxOPaw2E5CIra9q+X
	yu+SECkaR29SOvnEvLVqUL/ZRByXk0FO93BfP/sfyGkpP82KKtJmXxXYg/cmO/9r4MWuIl
	huhNsslAE5R+87wQlEMETevRjrZbVotNktOD9ylriNM3nMxUbgasSvrX1zwRMkMEIDkNkw
	q3e+YsAce/tVuVYn6TERtP/sHAnfcPtcdov+itM2E30TaRXq6uGtzHiSyMUT7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1757409894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kjI8yLNL46JujTBVdfX+1NUIEG5NdqCM6d/7sSAIi0g=;
	b=kht2FRWAE5xLDAwQEQQL2CWiSg5araebssnmf7Dh13rxG9eZFdDbUcKWCC51hkCZfhygQG
	XoZurdLKyUkkGeAg==
To: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Sven Peter <sven@kernel.org>, Janne Grunau
 <j@jannau.net>, Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark
 <james.clark@linaro.org>
Subject: Re: [PATCH 01/25] irqdomain: Add firmware info reporting interface
In-Reply-To: <87ikhsvvau.ffs@tglx>
References: <20250908163127.2462948-1-maz@kernel.org>
 <20250908163127.2462948-2-maz@kernel.org> <87ikhsvvau.ffs@tglx>
Date: Tue, 09 Sep 2025 11:24:53 +0200
Message-ID: <87frcwvuze.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_022458_456868_F6FCA5B0 
X-CRM114-Status: GOOD (  10.68  )
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

On Tue, Sep 09 2025 at 11:18, Thomas Gleixner wrote:
> On Mon, Sep 08 2025 at 17:31, Marc Zyngier wrote:
>> +int irq_populate_fwspec_info(struct irq_fwspec_info *info)
>> +{
>> +	struct irq_domain *domain;
>> +
>> +	domain = fwspec_to_domain(&info->fwspec);
>
> Just move that to the declaration line
>
>> +	if (!domain || !domain->ops->get_info) {
>> +		info->flags = 0;

It looks like @info is not initialized except for info::fwspec. That's a
patently bad idea.

Why has fwspec to be in info in the first place? What's wrong with doing
the obvious:

int irq_populate_fwspec_info(struct irq_fwspec *fwspec, struct irq_fwspec_info *info)
{
        memset(info, 0, sizeof(info));

        ....

No?

Thanks,

        tglx




