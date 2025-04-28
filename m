Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3C3C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 15:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZmHDDMjE/LTKxFydAAU+P7QoP/xktKjXvpz/1FyBlOU=; b=1fqiR1ULSIzbSUo96swWmY9uNl
	aVxV+eVWVfHjD6NpeaJ3L28mkQjqSLYqX0tdXsliNSfvrwhA/G4TVk3j9enElfbMk15YAabU3EU32
	P9XSwmfuBp1hjO+ETjvBLTRcJVp1OcD07MKgz0C0sCjrvczIQljVtWv1nUrb66KoVcKSuX31IbGyk
	rqfHKHDrRjJ3o3yo+3I5EEBOtI9/QcQsEmaFrn0fBdtdLJahhtwuL72YfkM0OAB896jbyTsTz2NIS
	Q1aObJVdD8BnKk9ha9DNHIosv+NeEas44ruyyfxfEnJtBqnuOMX0g/ufZ9rXcZb2ubh0xUyqlv8Tl
	2Z0B2pSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9QMw-00000006lG6-2anw;
	Mon, 28 Apr 2025 15:26:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9QKw-00000006kbm-27Nn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 15:24:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6350F5C4AD4;
	Mon, 28 Apr 2025 15:21:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BEA0C4CEE4;
	Mon, 28 Apr 2025 15:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745853841;
	bh=HzKzkrxa9A4F/zt2zYIknGsXS+zLy1fxDykz1llhI68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hq3lpwr6J3FigWsiuBd93GDgW7+LocZzZO4qV35W2Z3DVqLenlDHfJukspyiadhYm
	 uj9RRJp8DCUnPxagJAp2mDC8QgicsTp+AU7gFHo4L0fhRtj2t2btuUDnKTkafimpAO
	 jp2SjwZ909NDiImGdOHfc37lXm1c72newPMRUzXAqODW7nr23tQoKIcZfBnDd0X0hE
	 bPcKrnpek9brq0HwhW2DTumJdIZIyDI06TjdFtEHzvLmNIGwpaH6ifPFrj9WWn9zvi
	 isa7xYK/bOoG9YGq2Wh9Nc6ndsl8Wqs2XQI1xbhw0UbodP2JI5kY/PtRFa4d8SbpMo
	 LO4MFVuKpFbrg==
Date: Mon, 28 Apr 2025 16:23:51 +0100
From: Will Deacon <will@kernel.org>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: Hanjun Guo <guohanjun@huawei.com>, "Luck, Tony" <tony.luck@intel.com>,
	rafael@kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, linux-edac@vger.kernel.org,
	x86@kernel.org, justin.he@arm.com, ardb@kernel.org,
	ying.huang@linux.alibaba.com, ashish.kalra@amd.com,
	baolin.wang@linux.alibaba.com, tglx@linutronix.de,
	dave.hansen@linux.intel.com, lenb@kernel.org, hpa@zytor.com,
	robert.moore@intel.com, lvying6@huawei.com, xiexiuqi@huawei.com,
	zhuo.song@linux.alibaba.com, sudeep.holla@arm.com,
	lpieralisi@kernel.org, linux-acpi@vger.kernel.org,
	yazen.ghannam@amd.com, mark.rutland@arm.com, mingo@redhat.com,
	robin.murphy@arm.com, Jonathan.Cameron@Huawei.com, bp@alien8.de,
	linux-arm-kernel@lists.infradead.org, wangkefeng.wang@huawei.com,
	tanxiaofei@huawei.com, mawupeng1@huawei.com, linmiaohe@huawei.com,
	naoya.horiguchi@nec.com, james.morse@arm.com,
	tongtiangen@huawei.com, gregkh@linuxfoundation.org,
	jarkko@kernel.org
Subject: Re: [RESEND PATCH v18 1/2] ACPI: APEI: send SIGBUS to current task
 if synchronous memory error not recovered
Message-ID: <20250428152350.GA23615@willie-the-truck>
References: <20250404112050.42040-1-xueshuai@linux.alibaba.com>
 <20250404112050.42040-2-xueshuai@linux.alibaba.com>
 <0c0bc332-0323-4e43-a96b-dd5f5957ecc9@huawei.com>
 <709ee8d2-8969-424c-b32b-101c6a8220fb@linux.alibaba.com>
 <353809e7-5373-0d54-6ddb-767bc5af9e5f@huawei.com>
 <653abdd4-46d2-4956-b49c-8f9c309af34d@linux.alibaba.com>
 <de5d2417-dc92-b276-1125-4feb5151de7f@huawei.com>
 <f60f1128-0d42-48e5-9a06-6ed7ca10767f@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f60f1128-0d42-48e5-9a06-6ed7ca10767f@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_082402_595775_1BCBCF9F 
X-CRM114-Status: GOOD (  11.44  )
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

On Fri, Apr 25, 2025 at 09:10:09AM +0800, Shuai Xue wrote:
> 在 2025/4/25 09:00, Hanjun Guo 写道:
> > Call force_sig(SIGBUS) directly in ghes_do_proc() is not my favourite,
> > but I can bear that, please add
> > 
> > Reviewed-by: Hanjun Guo <guohanjun@huawei.com>
> > 
> > Thanks
> > Hanjun
> 
> Thanks. Hanjun.
> 
> @Rafael, @Catalin,
> 
> Both patch 1 and 2 have reviewed-by tag from the arm64 ACPI maintainers, Hanjun,
> now. Are you happpy to pick and queue this patch set to acpi tree or arm tree?

Since this primarily touches drivers/acpi/apei/ghes.c, I think it should
go via the ACPI tree and not the arm64 one.

Will

