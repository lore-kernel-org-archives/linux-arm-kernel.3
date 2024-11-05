Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8225D1CA0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 01:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NHOy9HMfGZsNYCZrwLCSvIFDt8NcrmF4jHCNX3GgtvM=; b=bl9G0Q79CulPCoLSfpzit17yTb
	IOgMaHiDIx3++oeOpNlUM9vxO+nop3spFj8WY0tCI2F3xLxsIirvg8pyMs+7tkQuUYKmbDKy6/n2T
	ZU/1p5in/4SLJtKzhGH4SeSkeUNBOlcut6wYwqptakMMGMmRjaXoKlHXhoQkq4aR7rV5KFtrE4YwV
	pt3y4RDPc7ijPL8j6bc4dhI4mTDjPa12yCXSAUp+u01n8fP5EwGT/G9EdMLnvM9+y3/585deCGkuu
	pKfGmAz6vvf3ZLipFtJRurxzRGsRuJYymSZdr20T6/XBv12cLPaC46SdPj7WvZUYoi71GUO7eW5O7
	2JruA6Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t88Ve-0000000FaLi-16Pv;
	Tue, 05 Nov 2024 01:37:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t88Sl-0000000FZof-1i8R;
	Tue, 05 Nov 2024 01:34:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BD667A41C59;
	Tue,  5 Nov 2024 01:32:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D0B7C4CECE;
	Tue,  5 Nov 2024 01:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730770469;
	bh=pZqyeDU4Z0xb82ka1rqo9zPh5E+ZbwXvL5ApzcS2al4=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=cilUS0qQCFaxNF3zH63qgUIqVpBsK5ZAO2+Mc4CrXmk6QZIa3ZA/1eyWd894pH2td
	 p6DeOBI4b44PBAllxDSwZ+pvc/5OEkcYzKgLtcgnvluIpjNagN96SxdO1hq1RTBHL4
	 IsHQ3dUtDassq5aGIJOJqxs+MkAOhLYww1/sRgfew7akFKeqGOT8zYLFCTpqAtJETh
	 hetvPOAoOKDF42PLByagmL9JEdRSFvR3DT2TRaUD4mTfYhVrokbWecXm5y2cdsb4O7
	 uykYoTN0CALyatfk7dtT2vPJ/mDxiOvw5DHvt59QcW4RICZcRPoNv9l/f+5h04HOGk
	 wE3h4ii4bPJsw==
Message-ID: <43d8b52e-5e5b-4a37-9a18-6ac392048d92@kernel.org>
Date: Tue, 5 Nov 2024 09:34:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Chao Yu <chao@kernel.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, x86@kernel.org,
 linux-mips@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-ext4@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [f2fs-dev] [PATCH v3 17/18] f2fs: switch to using the crc32
 library
To: Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org
References: <20241103223154.136127-1-ebiggers@kernel.org>
 <20241103223154.136127-18-ebiggers@kernel.org>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20241103223154.136127-18-ebiggers@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_173431_547981_131D4B50 
X-CRM114-Status: UNSURE (   7.32  )
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

On 2024/11/4 6:31, Eric Biggers via Linux-f2fs-devel wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Now that the crc32() library function takes advantage of
> architecture-specific optimizations, it is unnecessary to go through the
> crypto API.  Just use crc32().  This is much simpler, and it improves
> performance due to eliminating the crypto API overhead.
> 
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Acked-by: Chao Yu <chao@kernel.org>

Thanks,

