Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FF7E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 07:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J2gzJemN8U3Zfj9uRE1MqZ+ZfT8drpA2gr00tKtTRMs=; b=lMOd1u6cQdv8buvNfrdauIbJba
	DFbdKRZYtz1PyaaImuG5rVAH28SpHvhIGoo/2jXK2nFErag3TFp0L/9mT6leNKvHbpkTmsMo8jL7t
	z1jc3t50PmoZT729e66TzpqgPGrWXuhGLn8PRN9OzlXGAr958jnMhPw/G5q5eExsYNVBaqvoKIXNi
	HK1cFLh07NzWD69ol7Q7RQKF4WHhDAasSsT75b0M9xP3A3wrH9j2lwBmGyaap0X2TDJsgXNGrP8fD
	NF39RFFVI08rI/VWRKQBEw7HiSWBW2J17WYFTY9MR3+lk/QC23KO2gHNIAtxtmz6dckd4GZnLm69g
	Dr/4Eiyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJpOa-00000003Zca-2UEH;
	Sat, 07 Dec 2024 07:38:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJpMp-00000003ZRq-3bVb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 07:36:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 14D2B5C4688;
	Sat,  7 Dec 2024 07:36:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E6EEC4CECD;
	Sat,  7 Dec 2024 07:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733557002;
	bh=9TX1vg/RCNPSqIDVVM5Oj3VMUTV+rCQORNzKqYqLZQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FZsL4aZNcsLObtU/CTsMaLemEfFflFyEBnYTOoFR85zpTuHUuuxn27wNiYjep+oog
	 aTSN1WoRFWQEKiDg3nkCH0F7v3Wta0pppeM9IpPWwA5S389yAHUzOwtnbFNASgE5+3
	 +uK0cVQi/xZzdhBu8zPxX7j0B4n9J31TQj6Rt5CJz4dL8zQMU2zuYxZC+Zij0AuCp0
	 apRJsmTd4Q/r3RzvKeWx7Tl0tEZlQXRunI3qb4yLMcyCbk3UlQx4b//OPbvWPeKqlH
	 SxglF7ykGTPTsYbcsQM/OC8CdaisQRTLldWEhoflSQUGYN/6HByctPhoKCpBBjPTp6
	 f9RpD2MEAaFbQ==
Date: Sat, 7 Dec 2024 07:36:40 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	mhklinux@outlook.com, decui@microsoft.com, catalin.marinas@arm.com,
	will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	arnd@arndb.de, jinankjain@linux.microsoft.com,
	muminulrussell@gmail.com, skinsburskii@linux.microsoft.com,
	mukeshrathor@microsoft.com
Subject: Re: [PATCH 2/2] hyperv: Move create_vp and deposit_pages hvcalls to
 hv_common.c
Message-ID: <Z1P7CJ4Inz97feff@liuwe-devbox-debian-v2>
References: <1733523707-15954-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1733523707-15954-3-git-send-email-nunodasneves@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1733523707-15954-3-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_233644_001081_5EAF15D4 
X-CRM114-Status: UNSURE (   6.74  )
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

On Fri, Dec 06, 2024 at 02:21:47PM -0800, Nuno Das Neves wrote:
> From: Nuno Das Neves <nudasnev@microsoft.com>
> 
> These are not specific to x86_64 and will be needed by common code.
> 
> Signed-off-by: Nuno Das Neves <nudasnev@microsoft.com>

Acked-by: Wei Liu <wei.liu@kernel.org>

