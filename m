Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C566AD1D48C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 20:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f8byXjPG47zjjRA4gisVK79Su6Rh5yAb1mMc6R/e1dg=; b=W5IevpQmBxAmy1JcV3Z1Fr5N8P
	gWmCb1FbeZyxZ97sLJu3p82+qeY6WqnrSDAf7PqNBurjuLvemK0n7rPpfNfWOHb9NIoMtOZy8lfUR
	sVBMlYuJRcz9gD7cQuBxDP2J5Z2BlR9y5d2F8K1l11Oiu3X6C8cyhZ2+JEnFzr9SOO2ZTZbHdYTzp
	FwQPeYD88g1A7k84OIdTdsva2LUdIzpl1+hPbiL26yAUbt9u07TNyGxJfY3heiIlgl9tUcOVR8wBW
	tqaGOUxZs66bgCQqgSdYs+192deQSmFU8Du9kVqwd/4i+SieFQT2JmTUrofss7ADzGFPl38ZBY3rF
	fedJ4lcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdwNr-00000000nwL-1HqV;
	Thu, 08 Jan 2026 20:13:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdwNn-00000000nvt-3xUf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 20:13:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB1A8497;
	Thu,  8 Jan 2026 12:13:14 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA72A3F5A1;
	Thu,  8 Jan 2026 12:13:15 -0800 (PST)
Date: Thu, 8 Jan 2026 20:13:11 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: kasan-dev@googlegroups.com, andreyknvl@gmail.com,
	Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: dvyukov@google.com, vincenzo.frascino@arm.com, ryabinin.a.a@gmail.com,
	glider@google.com, linux-mm@kvack.org,
	Jiayuan Chen <jiayuan.chen@shopee.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Yang Shi <yang@os.amperecomputing.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Huang Shijie <shijie@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: Re: [PATCH v1] kasan,mm: fix incomplete tag reset in
 change_memory_common()
Message-ID: <176790294571.2289790.2180517635826904022.b4-ty@arm.com>
References: <20260104123532.272627-1-jiayuan.chen@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260104123532.272627-1-jiayuan.chen@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_121324_041796_084C8930 
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

(for some reason, I did not get this email, our server dropped it;
thanks to Will for telling me)

On Sun, 04 Jan 2026 20:35:27 +0800, Jiayuan Chen wrote:
> Running KASAN KUnit tests with {HW,SW}_TAGS mode triggers a fault in
> change_memory_common():
> 
>   Call trace:
>    change_memory_common+0x168/0x210 (P)
>    set_memory_ro+0x20/0x48
>    vmalloc_helpers_tags+0xe8/0x338
>    kunit_try_run_case+0x74/0x188
>    kunit_generic_run_threadfn_adapter+0x30/0x70
>    kthread+0x11c/0x200
>    ret_from_fork+0x10/0x20
>   ---[ end trace 0000000000000000 ]---
>       # vmalloc_helpers_tags: try faulted
>       not ok 67 vmalloc_helpers_tags
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] kasan,mm: fix incomplete tag reset in change_memory_common()
      https://git.kernel.org/arm64/c/5fcd5513072b

-- 
Catalin

