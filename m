Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA226C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 18:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0xo2PNgclIAHBnClwq+LrBXBtz3y6yq3dfP31cUd28=; b=t1i+DVLgh8abBBvO560M1Gu4Hj
	c1FxxgJ2ByhiNjuAuBGdAm1NM6olRFDvuYIebSsG0jUZb7tspOuMm1TJJOn+A4xoCQNfmJoHSFxSo
	+oiiW6rV/BLkDIBg9dRLi/SXRrt6sWnYZtC4cOtBaHS+K5c1gcQ6F2FM/NP2W1YE4Qy79d35/h+sy
	0YroaLt9JUptcs1Tsigl4scsjkDKB2Qvqsdj2YIf7EQcBzbl1jn1rbqshaIU16TQj05L/4tZiGpMx
	YwQ6slHtsNyAgaKeVGyeGY+KYovWTKwmXKO/baTm85ZSVOpM1u3W988lKRjKaUEANlvy9vNNOawy+
	wX+We/OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukRQ4-00000003Rn7-1Foi;
	Fri, 08 Aug 2025 18:02:20 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukRG6-00000003Quf-1kRC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 17:52:03 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754675520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P0xo2PNgclIAHBnClwq+LrBXBtz3y6yq3dfP31cUd28=;
	b=MlkPO2yQ24PVP+nR4bYuz0GO3TcsGW2btDAOK9WNcQlyVq/dos8OLSoQmMvyjmEenbBujd
	hw+AJN4MVgTO09PsXAKseSw2qbxOLp2NhZY4YT2BAnz34U+aC54jHBsHQWBRXrdUDr58zr
	FgeEVfwAftRgA6A4T4NEWfSFIFjJ8Sc=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fuad Tabba <tabba@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	maz@kernel.org,
	will@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	vdonnefort@google.com,
	qperret@google.com,
	sebastianene@google.com,
	keirf@google.com,
	smostafa@google.com
Subject: Re: [PATCH v2 0/3] KVM: arm64: Fixes to handling of restricted registers for protected VMs
Date: Fri,  8 Aug 2025 10:51:36 -0700
Message-Id: <175467548065.670500.5861388247591755272.b4-ty@linux.dev>
In-Reply-To: <20250807120133.871892-1-tabba@google.com>
References: <20250807120133.871892-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_105202_611204_95131FF5 
X-CRM114-Status: GOOD (  10.22  )
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

On Thu, 07 Aug 2025 13:01:30 +0100, Fuad Tabba wrote:
> This patch series mainly fixes issues we've encountered in pKVM (in
> downstream Android code), related to the handling of protected VM access
> to restricted registers and injecting undefined exceptions into a
> protected guest.
> 
> The last patch in this series isn't pKVM specific, but a fix to the
> vgic-v2 code encountered while fixing the issues in this series. The
> issue it fixes was indirectly introduced into the code with hVHE.
> 
> [...]

Applied to fixes, thanks!

[1/3] KVM: arm64: Handle AIDR_EL1 and REVIDR_EL1 in host for protected VMs
      https://git.kernel.org/kvmarm/kvmarm/c/eaa43934b412
[2/3] KVM: arm64: Sync protected guest VBAR_EL1 on injecting an undef exception
      https://git.kernel.org/kvmarm/kvmarm/c/798eb5978700
[3/3] arm64: vgic-v2: Fix guest endianness check in hVHE mode
      https://git.kernel.org/kvmarm/kvmarm/c/f1edb159200a

--
Best,
Oliver

