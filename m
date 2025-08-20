Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AA6CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 20:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qayB9LeR+RX6qridAjwC/zM9VoXQvXrNVT4vZTRfnEA=; b=tN7qxmLZE9YaWoioDx2mmVT4gS
	UkMWgEu9R8QA24rN6J9FTC5kPvImhbum9bwtKrIdEUmOUdvq7XCCC+i214cgsjcMMIggnyoUZEpX1
	70x/bfFrVIfaL351pt6qyfE/X+raZzIQ6Qxnf34cs1+KwwJI1kxwcq6PyU4dHcLkeVaOxb1rrBAHi
	bYAXkY8iVEtFr9rE3VhD7AFs7B2b/yl7T1cZQjyi8V70ORivtDxF650GsTAbvlo7cIz4eiUw+0hKY
	Cefd8yH+1vM9ZJFVg/2iY7HPw2bcHj/OLRNWf9K3rrXstlMr3bC750v5H1o+rTxAdl/bfbgEu7smV
	bjrC60Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoppm-0000000EveC-23bI;
	Wed, 20 Aug 2025 20:55:02 +0000
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uomHF-0000000ETuY-2LE7;
	Wed, 20 Aug 2025 17:07:09 +0000
Message-ID: <dc829b1a-f0d5-42b8-b128-e305a1ceb32b@infradead.org>
Date: Wed, 20 Aug 2025 10:07:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] acpi: PoC of Cache control via ACPI0019 and _DSM
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, james.morse@arm.com,
 linux-cxl@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org,
 Will Deacon <will@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Davidlohr Bueso <dave@stgolabs.net>, "H . Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Yicong Yang <yangyicong@huawei.com>, linuxarm@huawei.com,
 Yushan Wang <wangyushan12@huawei.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 Andy Lutomirski <luto@kernel.org>
References: <20250820102950.175065-1-Jonathan.Cameron@huawei.com>
 <20250820102950.175065-8-Jonathan.Cameron@huawei.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250820102950.175065-8-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 8/20/25 3:29 AM, Jonathan Cameron wrote:
> diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
> index 4551b28e14dd..158d3819004e 100644
> --- a/drivers/cache/Kconfig
> +++ b/drivers/cache/Kconfig
> @@ -3,6 +3,13 @@ menu "Cache Drivers"
>  
>  if GENERIC_CPU_CACHE_MAINTENANCE
>  
> +config ACPI_CACHE_CONTROL
> +       tristate "ACPI cache maintenance"
> +       depends on ARM64 && ACPI
> +       help

If there is a v4, please use one tab to indent the 3 lines above.

> +         ACPI0019 device ID in DSDT identifies an interface that may be used

and tab + 2 spaces to indent the 1 line above.

> +	 to carry out certain forms of cache flush operation.

-- 
~Randy


