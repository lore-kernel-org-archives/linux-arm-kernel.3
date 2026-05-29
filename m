Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27BACD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 08:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCFl9tIcUOt3miefEeSoEF7h8rFNw+sRT0B6NcU/2J4=; b=t/ivoLt9qElCegJP+2/oa6DS8/
	FpEbkrKC16aiRN6ww6ZG+qO15ET6JMmW/lTYH0p0xT9eNrB2tO6i9/1OESmHHv3mVuB55OM6u5juO
	s2smHniJAroCCSQGT4mynG+/cga73eldJ90MAEto7o4YR2J8Z9WJ2hCqSYqdE+KFKgG2F55E1hItm
	f8tRm+my0s3xvdEJNv49BIe+CGNM1fel4HTCEad0C+D7Q2Uz3jRjP+oDULMXJNhP53WLPO7P4Vb6W
	CkDvLE+/hr0M4QyVfocgf0uE3NnwJYOM++/VLTHb5IhTd+joURYIC0mU+JJreLc1+YZAv8fI4yH27
	0FXd7H2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsdT-00000006xgc-2oaM;
	Fri, 29 May 2026 08:32:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsdR-00000006xgJ-2gl6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 08:32:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40E3C201B;
	Fri, 29 May 2026 01:31:59 -0700 (PDT)
Received: from [10.57.91.162] (unknown [10.57.91.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 273AF3F632;
	Fri, 29 May 2026 01:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780043524; bh=6FINnAeejbCpxEsJKKtRLyzzbDAImuU1hMJl2QkGje0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TV+/R2ZqySGE36yEvr5DLTOVlwuwSWVBVD3mZtBpqf8v0rbiwgfcbKu6cuFovDtpi
	 GaHm0tH/kehwWUycIvD+JGIA723f23KKbNPAGoLtZw8LFIA0m7DdkzlVGMwTtlPKMn
	 fsVLYwoh7j6HcLdUiAn+UEYC9Fs7vc4gZXqUTNVU=
Message-ID: <3b2d27ee-28d5-43ef-9d45-038b147d04b1@arm.com>
Date: Fri, 29 May 2026 10:31:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/15] arm64: Unmap linear alias of kernel data/bss
To: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com,
 mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>,
 Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>,
 linux-mm@kvack.org, linux-hardening@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org
References: <20260526175846.2694125-17-ardb+git@google.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260526175846.2694125-17-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_013205_743984_CDE455A5 
X-CRM114-Status: UNSURE (   7.07  )
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

On 26/05/2026 19:58, Ard Biesheuvel wrote:
> Changes since v5:
> - Reorder series in ascending order of impact, so that the first few can
>   be merged earlier if desired. This also makes the patch that remaps
>   the data/bss linear alias as tagged redundant, which is therefore
>   dropped.

Definitely makes the series easier to review as well, it's all looking
pretty good now :)

- Kevin

