Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D05C47BF2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 14:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UoYXG9t8n8YMLIHT40O/UgeIzaa1LyX+vueb16fos1k=; b=oiXzgLPmgAe9G1xylGD+XhSdHW
	j7hwRmfaemIO4touBxngpusqQM/he40J2vFfDj1h5WDCGIXUio34UklYAB8JWP+zCCYwUU7zgvBHc
	v7SmA6J3vUgeESazR8eOjUQi3KRS/t4jMPes6tXuFbxPPnyCKel+yOn47usD3idBGu33NQfQZTmuw
	IDPLGceKR8LZtYbyKJdL3u1ZQjL4/UNwVfFsRB2x63m62QeuUBGHDWPgA16QbNS5rMW2d5UJ0Z5a9
	L7MlITDCPjp2CV0cM1mwrmDYKplYopARcnpixnFv72/rzvRHNVESGJImFp/LU0G1YQUrlFfvwmZLa
	J0Di6WQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd7sc-0000000DGTy-2wDW;
	Tue, 06 Jan 2026 14:17:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd7sa-0000000DGTM-0r1n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 14:17:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82DF8497;
	Tue,  6 Jan 2026 06:17:38 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B7BA3F6A8;
	Tue,  6 Jan 2026 06:17:43 -0800 (PST)
Date: Tue, 6 Jan 2026 14:17:41 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ben Horgan <ben.horgan@arm.com>
Cc: ardb@kernel.org, will@kernel.org, YeoReum.Yun@arm.com,
	Mark.Rutland@arm.com
Subject: Re: [PATCH v1] arm64/efi: Don't fail check current_in_efi() if
 preemptible
Message-ID: <176770904603.530757.14500068534558829858.b4-ty@arm.com>
References: <20260105135847.1585034-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105135847.1585034-1-ben.horgan@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_061748_281208_83816B52 
X-CRM114-Status: UNSURE (   7.40  )
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

On Mon, 05 Jan 2026 13:58:47 +0000, Ben Horgan wrote:
> As EFI runtime services can now be run without disabling preemption remove
> the check for non preemptible in current_in_efi(). Without this change,
> firmware errors that were previously recovered from by
> __efi_runtime_kernel_fixup_exception() will lead to a kernel oops.
> 
> 

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64/efi: Don't fail check current_in_efi() if preemptible
      https://git.kernel.org/arm64/c/dd4d71f587f3

-- 
Catalin

