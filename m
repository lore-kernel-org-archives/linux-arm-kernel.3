Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2774CC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 21:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a39FSsZMvQ9DjuOekvV+Xdsq9nwpLHLFxDXkhuLj9Ww=; b=MTNktzebl8cMV1QGVv9sJpIAWh
	ljF3wJ8tEMNVospOkc7RNyZay6e/Apjsqp0U0zjZreJs5MdDZhL525HNNedKq99lDOauXxvEUXut3
	IyJZD3XvqZwW5lqUeXjTnVOkPVg0XLzgr0yZUAtGkl1WcY+jsoDqWFfZedlK2WHngT3zlWQ/CXhl9
	eRf4oPeN994seVpnFFvQ2aUHDr5oZFW0XYZfC1HJ1ljno6Jwyo+HnY/FMFlY+JkZOHLj7wwP+VrFu
	0Guzni5gcWJwXGr06QKdlR2siPYDdQ+uEJs754R2Uenkuv1d5DWL8nrCw5c+yFYU2LTV1PA4qS7xk
	mdlzVDtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsTHi-00000009VJQ-07PA;
	Wed, 12 Mar 2025 21:06:38 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsTG0-00000009UfR-1vUF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 21:04:54 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741813488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a39FSsZMvQ9DjuOekvV+Xdsq9nwpLHLFxDXkhuLj9Ww=;
	b=ozk48M9CcNR5HQHm7WaZL2T+eFxtp0MSKh2bFDfJhFHHCxuEPa6oY3iLxUxLK+HaQXaWWV
	J6A9HnYEj3bwsHBkdVjDhXGYf2VLgOW9pP4wvLf/VskbaItKEsty/frECa6dck5ol0ql92
	X/LCS+Vgpm3BVRjI/zaHS2mmW6VZYvE=
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sebastian Ott <sebott@redhat.com>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Writable TGRAN*_2
Date: Wed, 12 Mar 2025 14:04:37 -0700
Message-Id: <174181344705.1158293.6270593433232646712.b4-ty@linux.dev>
In-Reply-To: <20250306184013.30008-1-sebott@redhat.com>
References: <20250306184013.30008-1-sebott@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_140452_696600_815E644B 
X-CRM114-Status: UNSURE (   6.89  )
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

On Thu, 06 Mar 2025 19:40:13 +0100, Sebastian Ott wrote:
> Allow userspace to write the safe (NI) value for ID_AA64MMFR0_EL1.TGRAN*_2.
> Disallow to change these fields for NV since kvm provides a sanitized view
> for them based on the PAGE_SIZE.
> Also add these bits to the set_id_regs selftest.
> 
> 

Applied to next, thanks!

[1/1] KVM: arm64: Writable TGRAN*_2
      https://git.kernel.org/kvmarm/kvmarm/c/edfd826b8be7

--
Best,
Oliver

