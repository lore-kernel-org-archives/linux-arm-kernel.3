Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242C6C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 18:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4q4Rd+dCTyhOZPDVmfxkU2Ic3J1ln9HZwiBcptLHGi0=; b=PQxsnBhYA58aJrCQEzJUI5NWrZ
	2N2ylUw18h5qjqDnEMiHoVaUds40clwzy4+dXdqTJvHTq5qHuIy3PON4NuyVW29H00784YcDY8B3w
	YA8BnsZazI8rWpHWKnHz7e6MKM/ZFIEB9rT183YJGUEhcGFGa1xIfRA7nEEBKMAqChm5l7/LDu9/8
	3YDNAlHXv0oDYqxydOIFQxKH9/wvtdx9N5kN6NQDnhAMebSMgrA5FTtAWl4LZjr3ZmLyd8Pqfu+SZ
	PI23A5C2RzutTcBIW38xo9uDDCcl+nB+PWo+e1mNXwF2QmK/Z0qCxSUIye63oGFOzKqMqxm+JXNcc
	o7lQh2MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttA1S-0000000F3OW-0d1T;
	Fri, 14 Mar 2025 18:44:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9zd-0000000F3CZ-2762
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 18:42:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E1DDE5C551F;
	Fri, 14 Mar 2025 18:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2259FC4CEE3;
	Fri, 14 Mar 2025 18:42:44 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Douglas Anderson <dianders@chromium.org>
Cc: Roxana Bradescu <roxabee@google.com>,
	Julius Werner <jwerner@chromium.org>,
	bjorn.andersson@oss.qualcomm.com,
	Trilok Soni <quic_tsoni@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Scott Bauer <sbauer@quicinc.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/5] arm64: errata: Rework Spectre BHB mitigations to not assume "safe"
Date: Fri, 14 Mar 2025 18:42:42 +0000
Message-Id: <174197748983.735859.13306599472795958808.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107200715.422172-1-dianders@chromium.org>
References: <20250107200715.422172-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_114249_605213_40DC0DE5 
X-CRM114-Status: GOOD (  10.88  )
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

On Tue, 07 Jan 2025 12:05:57 -0800, Douglas Anderson wrote:
> Recently I realized that a device with some Qualcomm Kryo 4xx cores
> reported in `lscpu` that it was _not_ vulnerable to Spectre BHB. This
> seemed unlikely to me.
> 
> I wrote up a patch series to attempt (with a lot of guesswork) to add
> Qualcomm cores to the tables governing how the Spectre BHB mitigation
> worked.
> 
> [...]

Applied to arm64 (for-next/spectre-bhb-assume-vulnerable), thanks!

As per Will's suggestion at the end of last year:

https://lore.kernel.org/r/20241219175128.GA25477@willie-the-truck/

Doug has reworked the code to assume vulnerable by default. James did
suggest some splitting of patch 2 but given that Doug doesn't have time
for a respin I decided to queue the patches. If anyone has a strong
opinion, please let me know (and reworking the series is welcomed).

[1/5] arm64: errata: Add QCOM_KRYO_4XX_GOLD to the spectre_bhb_k24_list
      https://git.kernel.org/arm64/c/ed1ce841245d
[2/5] arm64: errata: Assume that unknown CPUs _are_ vulnerable to Spectre BHB
      https://git.kernel.org/arm64/c/e403e8538359
[3/5] arm64: errata: Add KRYO 2XX/3XX/4XX silver cores to Spectre BHB safe list
      https://git.kernel.org/arm64/c/0c9fc6e652cd
[4/5] arm64: cputype: Add MIDR_CORTEX_A76AE
      https://git.kernel.org/arm64/c/a9b5bd81b294
[5/5] arm64: errata: Add newer ARM cores to the spectre_bhb_loop_affected() lists
      https://git.kernel.org/arm64/c/a5951389e58d

-- 
Catalin


