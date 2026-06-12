Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAA6CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 05:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrlCKzvFsyxGrxQK3KvEE4LY6nBZ6Rnv7YfgKkrzOIM=; b=20aI8r3Fu6TMDPvpuSuySDdmhO
	7M0s3jcOId1+w5HZ4wou8B/JnpGeFqArguV3saFO4y/T/o30cLe5raloNTnDkt0iwCu5HECtakxkU
	n6xf/NpuS2dEo14pTh4hMmPCJKV6TczNgyI57iwKOKT010HARoNLn2YW43BQ9FebDhqsQ84zaueL/
	w6NRxuuwwwHqZWZjPtcwGpvgwSBDsvlb72B/HdfSN+SK0G3mqJTI8/te/bVSaQJrdtltW86J6vP55
	NQ/tkTY6hGktd0x5C6wNWBuM1ifKudWvFwv79hDcE7UorRRH+FXl5W2kjs22ODyKmzAmo1Md+5AD2
	ZAq4cvnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXudn-0000000ANZI-0DwN;
	Fri, 12 Jun 2026 05:41:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXudm-0000000ANZB-14tS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 05:41:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F076E600AF;
	Fri, 12 Jun 2026 05:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 507891F000E9;
	Fri, 12 Jun 2026 05:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781242872;
	bh=ZrlCKzvFsyxGrxQK3KvEE4LY6nBZ6Rnv7YfgKkrzOIM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=P/0HuaVV38AfmIGLj++Oa3uvFtlo76KtgEUe/JBTlKIS3pwTnxrWAmjZrib9C4eMB
	 XNY35ihgn30HbafuVL9YMTqR42haFVp2ildahYKETPRgTIGL/3p9F3vqF+yLc0VoOJ
	 zZF5fp7b7Izp9KPHmFImJgWUb5FzQlti4QRgoJYSfCD7xL6rasIukNwvyHzAWHELzP
	 Qt/nWeqMnHnW7CwfjlAbG044pBnK9nWANg/JsL/hV/6zp72SxP1kvOf15eG9+67O0C
	 9B+xAE0PaR604D392rDMPD9oop876felITahXdEDvR0US6k/vfwH2gX7C0n9K68Z2O
	 qljPW3aeKI1NA==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v7 3/6] firmware: smccc: Move RSI definitions to
 include/linux
In-Reply-To: <b009e840-6b79-415c-a3da-705ea569af38@arm.com>
References: <20260611130429.295516-1-aneesh.kumar@kernel.org>
 <20260611130429.295516-4-aneesh.kumar@kernel.org>
 <b009e840-6b79-415c-a3da-705ea569af38@arm.com>
Date: Fri, 12 Jun 2026 11:11:04 +0530
Message-ID: <yq5a4ij8mi33.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Suzuki K Poulose <suzuki.poulose@arm.com> writes:

> On 11/06/2026 14:04, Aneesh Kumar K.V (Arm) wrote:
>> The RSI SMCCC function IDs describe a firmware ABI and are not arm64
>> architecture specific definitions. Follow-up changes need to use them from
>> non-arch code, including drivers/firmware/smccc and the Arm CCA guest
>> driver.
>> 
>> Move the RSI SMCCC definitions from arch/arm64/include/asm/ to
>> include/linux/ so they can be shared with the driver code. This also
>> keeps the firmware interface outside architecture code, as requested [1].
>
> Please could we also mention about moving the "wrappers" only used by
> drivers accordingly ?
>

Added this

Not all helpers in rsi_cmds.h are used by architecture code. The
attestation token helper wrappers are only used by the Arm CCA guest
driver, so move them to a driver-private header under
drivers/virt/coco/arm-cca-guest/. Keep the remaining RSI command helpers,
which are shared by architecture code and drivers, in the arm64 header.


>
>> 
>> [1] https://lore.kernel.org/all/agsNO9cc7H-b0H8L@willie-the-truck
>> 
>> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>> ---
>>   arch/arm64/include/asm/rsi_cmds.h             | 74 +---------------
>>   .../virt/coco/arm-cca-guest/arm-cca-guest.c   |  2 +
>>   drivers/virt/coco/arm-cca-guest/rsi.h         | 84 +++++++++++++++++++
>>   .../linux/arm-smccc-rsi.h                     |  6 +-
>>   4 files changed, 90 insertions(+), 76 deletions(-)
>>   create mode 100644 drivers/virt/coco/arm-cca-guest/rsi.h
>>   rename arch/arm64/include/asm/rsi_smc.h => include/linux/arm-smccc-rsi.h (98%)
>> 
>> diff --git a/arch/arm64/include/asm/rsi_cmds.h b/arch/arm64/include/asm/rsi_cmds.h
>> index 2c8763876dfb..633123a4e5d5 100644
>> --- a/arch/arm64/include/asm/rsi_cmds.h
>> +++ b/arch/arm64/include/asm/rsi_cmds.h
>> @@ -8,10 +8,9 @@
>>   
>>   #include <linux/arm-smccc.h>
>>   #include <linux/string.h>
>> +#include <linux/arm-smccc-rsi.h>
>
> super minor nit: Please keep them in the alphabetical order.
>
> With that:
>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>

Thanks
-aneesh

