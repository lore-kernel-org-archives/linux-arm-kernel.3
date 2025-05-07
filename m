Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4899C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 08:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/jWrb5ObufWdp/TqLTqFq4iyOq4wwysHakUs6xba8E=; b=OnpaQXbtETK6zsUZq/kOkesK00
	4BLaBEbwctJNSGG6h8ln85w7NcOOL8ztiESOEViuuEy6anzDZanI2BtRalDQuLF5TEbrMwSILkXO6
	b4kZmx3Ia6LDNiOg5QXQiMQssFDsZLSeNl+T/sQOM7HJux0KlYJQWz1ikcAHXBTw3pK+TzStXlJxk
	veFw4DfNkFMXUiTO3ybO4MFAa/sdqnMNTN+iKjx19VKp/AxFajCJRKJ7TUi/IMNZ2/dx0zgioA80V
	j0NtM8VrRGhTnVBnaff8mveE0PitoTRkRRNYnHM5ZHOXWB4zLqRDvSJMyXfFuwbJlhD6ZXTycNXUQ
	eX/Lp4gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCaYO-0000000EpPY-3Chw;
	Wed, 07 May 2025 08:55:00 +0000
Received: from out-170.mta1.migadu.com ([2001:41d0:203:375::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCZeR-0000000Ecsl-03Lo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 07:57:13 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746604628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x/jWrb5ObufWdp/TqLTqFq4iyOq4wwysHakUs6xba8E=;
	b=azLg/sI8sSK0Zi6OEV5H7j14UusXX4bvQhsXMag0nu0Hvv+9jCRS1yP9o2QRAxkPvc0fyX
	hChtum8TT4F7JzgcLJGFAyGeYiGvkWQtVM1QZNiAh/nUo5yKRThfJvX0UlpV8y+oGbIzV7
	/8a3yOvmr2ixCv/CLkcPNlNCCpYPqHE=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	D Scott Phillips <scott@os.amperecomputing.com>
Subject: Re: [PATCH v2] KVM: arm64: Force HCR_EL2.xMO to 1 at all times in VHE mode
Date: Wed,  7 May 2025 00:56:50 -0700
Message-Id: <174660459087.2542293.11599535036974656323.b4-ty@linux.dev>
In-Reply-To: <20250429114326.3618875-1-maz@kernel.org>
References: <20250429114326.3618875-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_005711_192700_F21D5C31 
X-CRM114-Status: UNSURE (   8.80  )
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

On Tue, 29 Apr 2025 12:43:26 +0100, Marc Zyngier wrote:
> We keep setting and clearing these bits depending on the role of
> the host kernel, mimicking what we do for nVHE. But that's actually
> pretty pointless, as we always want physical interrupts to make it
> to the host, at EL2.
> 
> This has also two problems:
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Force HCR_EL2.xMO to 1 at all times in VHE mode
      https://git.kernel.org/kvmarm/kvmarm/c/859c60276e12

--
Best,
Oliver

