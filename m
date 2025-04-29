Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF05C3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 14:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZmHfsW91YPWRvQ6rKwiFn3NnMv9gzsRMQhen56flCqo=; b=c7IMU4dm7FuN75ViFX9MihvGMp
	i9nF+IGMSUe+DHDlR+Vq3YvEMatNyk/ZphpEVsbWzxTjYlVZtO2sD2igjrYs1IVTyO6iz+QH1FBLt
	OInlUGZgG11zzp/C7nLk1nT9qJFHINVRWz2IiNUTA9GIrpvOAwZfGKTbqMb0zzWcpR1vyxk1BYtrq
	nR2SkkfD44nM15lDUj7POMj6Tq97fJNjoCuWojv6a7Kid57yN/5H6F16YJ5SgIoylyYNdteXGv6cx
	TBK1pnY+GRVm5rCbr08H/zmAvYMYhHX+f/95M62s6LRaOjo+LX7y+iss1TG8ZjljXElrddtA0pHW1
	xF5o/Gdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9liQ-00000009su0-3ha3;
	Tue, 29 Apr 2025 14:13:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9kgK-00000009jR8-08wX
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 13:07:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZmHfsW91YPWRvQ6rKwiFn3NnMv9gzsRMQhen56flCqo=; b=cKlmQFK8AIURMcChm+DekhUSSg
	bhJ6aYTHjnvK8yEOsSIf19MXYKEEEhPJDhTLDIl5xZKLQlBWjJhtw/lA/RwHXvgYjFPhzQ+LdWvTH
	cetfvvw/exk/h69MK42EQ3LkhPkMXNMc0kCPx5eoiHD/JVnKrXCZ1HanqpUCXthQ5/ZQ9m8oWUAip
	icZ7e1D0luXgNCaybwVO/8hcX2q/Dl9gbKlx9sJLhojycko02ITOqXmRvpLXhSkzmWxvl3kEl1DVi
	P1XlQUh0LTIjmr/DKlfAfjcLiv/QcSzOA8/b65dkKXfIWF94J+pzWdchrYwg2uVg8Ly7tlw8OqlNe
	ktY1Xwig==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9kgG-0000000DLqC-42UD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 13:07:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E54961515;
	Tue, 29 Apr 2025 06:07:14 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D59CC3F673;
	Tue, 29 Apr 2025 06:07:19 -0700 (PDT)
Message-ID: <b41361d2-fe4c-4242-b814-b0556cb91ec0@arm.com>
Date: Tue, 29 Apr 2025 14:07:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/42] arm64: sysreg: Replace HGFxTR_EL2 with
 HFG{R,W}TR_EL2
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>,
 Fuad Tabba <tabba@google.com>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>
References: <20250426122836.3341523-1-maz@kernel.org>
 <20250426122836.3341523-5-maz@kernel.org>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20250426122836.3341523-5-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_140725_237175_1D8F0BEE 
X-CRM114-Status: UNSURE (   7.83  )
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

Hi Marc

On 4/26/25 13:27, Marc Zyngier wrote:
> Treating HFGRTR_EL2 and HFGWTR_EL2 identically was a mistake.
> It makes things hard to reason about, has the potential to
> introduce bugs by giving a meaning to bits that are really reserved,
> and is in general a bad description of the architecture.

There is a typo in the subject line. HGFxTR_EL2 should be HFG_xTR_EL2.

Thanks,

Ben

