Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D48FA3748
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 14:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RXq+k7GhUDyXsBWATF3Aj4ljg7geuf8vz12d3IpoY2c=; b=I2zoyWhiCEXaAyXE5bD+S4GKLq
	0PHAwwLnZ097sbxeFNWq64nLVn9jmUW1gfZBEMFgLg7TcguoFEGG2e9QKTxVX5UkIwqKdUeSUU/TZ
	VgFUmTY5vxa22LjuKcnVrbSQqHEvzGFUNiRmYgXP/d/AEqSXGbgqLukT6/OYGlR70iZIqoN99mynm
	oZ721R0cTRrrtlrT+u1K8H1nl/1F4U/f3cs6r2fcP6jK3dJw3ZG97O7Yx+PeQiauUc6S8bgqyCQUZ
	KpadR4x6KnkWw6fLnAq6Tz6WAoonWiXLMtZJ8lHQHtRcGih3NP57YNp27tNvZigOmKndUTZPl5AOs
	agTbcABQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbgOt-00000008NaZ-2y5R;
	Fri, 02 Jan 2026 14:45:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbgOr-00000008NaB-2Y28
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 14:45:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14127497;
	Fri,  2 Jan 2026 06:45:01 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C4383F63F;
	Fri,  2 Jan 2026 06:45:05 -0800 (PST)
Message-ID: <89fd9661-731c-4335-bee8-575a7c221390@arm.com>
Date: Fri, 2 Jan 2026 14:45:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] KVM: selftests: arm64: Make set_id_regs bitfield
 validatity checks non-fatal
To: Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Oliver Upton <oupton@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251219-kvm-arm64-set-id-regs-aarch64-v3-0-bfa474ec3218@kernel.org>
 <20251219-kvm-arm64-set-id-regs-aarch64-v3-3-bfa474ec3218@kernel.org>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251219-kvm-arm64-set-id-regs-aarch64-v3-3-bfa474ec3218@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_064509_722317_860F4521 
X-CRM114-Status: GOOD (  12.32  )
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

Hi Mark,

On 12/19/25 19:28, Mark Brown wrote:
> Currently when set_id_regs encounters a problem checking validation of
> writes to feature registers it uses an immediately fatal assert to report
> the problem. This is not idiomatic for kselftest, and it is also not great
> for usability. The affected bitfield is not clearly reported and further
> tests do not have their results reported.
> 
> Switch to using standard kselftest result reporting for the two asserts
> we do, these are non-fatal asserts so allow the program to continue and the
> test names include the affected field.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/kvm/arm64/set_id_regs.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)

This one also looks good to me. I'm not aware of why the asserts have
been favoured previously though.

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben


