Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1014CC0218B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 14:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qYQHBdk5i4zn8knyVHEsUvxgDpAUE193jWRLHV0XTVE=; b=McKLPwm+he3gL0RMwRKIuDwIC0
	kmlxzlFPSuzJ3Vxg6MEKiQ1j6DI1qR2JDWkIFgkvYc3Fv8xEfjGYZ+FBsnUvg5krknVr7kNk20HBo
	5feKmfSz8GMHjLboAQZTm5N3Tw6wdpgpwj8LkFxc2Bvrx/iJtLfYuEOFgdPJWIZ8yNF/NV8lz96DE
	aaAs4tsxyQKnWUduc+ZCXhE6XIEur78zPRImBsK6ntM8Ocv/zdBmfPbPS8GtIaqfgZDnD98fXWG9x
	Kl2iKGx2SbmbcqllibW5/9/ZIuUEDP0dW01TrD2SQq5AjfG6GT+gpwNXF0bcVKYYvxnyGUXexx7pM
	NBkJFqWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbL48-0000000Eta6-0U5F;
	Fri, 24 Jan 2025 14:53:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbL2j-0000000EtPU-2Vby
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 14:52:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3105EFEC;
	Fri, 24 Jan 2025 06:52:46 -0800 (PST)
Received: from NH27D9T0LF (unknown [10.57.6.244])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3B4A3F694;
	Fri, 24 Jan 2025 06:52:17 -0800 (PST)
Date: Fri, 24 Jan 2025 15:52:10 +0100
From: Emanuele Rocca <emanuele.rocca@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>
Subject: [BUG] ARM64 regression: NULL pointer dereference in
 arm_smccc_version_init+0x90/0x1ac
Message-ID: <Z5OpGluX6oX5NLxh@NH27D9T0LF>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_065221_682786_72BEA5E6 
X-CRM114-Status: UNSURE (   7.48  )
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

Hi,
longterm kernel 6.1.123 crashes early when booting on the Lenovo Thinkpad X13s
with the following error:

 Unable to handle kernel NULL pointer dereference at virtual address 0000000000000264

 pc: arm_smccc_version_init+0x90/0x1ac

According to faddr2line, that is line 31 of smccc.c:

 arm_smccc_version_init+0x90/0x1ac:
 arm_smccc_version_init at debian/build/build_arm64_none_arm64/drivers/firmware/smccc/smccc.c:31

 22 void __init arm_smccc_version_init(u32 version, enum arm_smccc_conduit conduit)
 23 {
 24         struct arm_smccc_res res;
 25 
 26         smccc_version = version;
 27         smccc_conduit = conduit;
 28 
 29         smccc_trng_available = smccc_probe_trng();
 30 
 31         if ((smccc_version >= ARM_SMCCC_VERSION_1_2) &&

This is with kernel 6.1.123. The last known good kernel I have available right
now is 6.1.119. In the 6.1.120 changelog I see the following commit which seems
potentially related?

 https://lore.kernel.org/all/20241106160448.2712997-1-mark.rutland@arm.com/

That's stable commit [1].

The relevant upstream commit [2] is in linux 6.12, and that kernel version does
not crash. Comparing [1] vs [2] I see differences, but I can't tell if they can
help debug the issue further. 

Thanks,
  ema

[1] https://git.kernel.org/linus/bfcaffd4cc2d61ecb0571c5baf127c4089978ad4
[2] https://git.kernel.org/linus/8c462d56487e3abdbf8a61cedfe7c795a54f4a78

