Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7708E7716F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 04:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyAXQCgIHOXGLPN0zQ1vAthsTkCgk+6VWl/7rdtRNuE=; b=j4SHSPZJjMFbbCwOFF7EH6ez+w
	Y0U6yHEFeIKImxSWORuu2oF7TDytmKF3TmMwijIUPf6wfX6jeYf5cex99LzNYa4M/irMdmcA0lzva
	mqjpi25r/3aqDK0SG1LeaVlr08Cwpppx0PYakdMDcUVcHjPKv1ni05OCJh86Un6cHnY9JrJ/OYf5c
	xn32XfRNkcEIlcqW1SZsG5ooha5r1xDvYd45HUDYU/mhRZND5FtiQE9lpoBU7UTz23hsV2l0xYHhU
	v/6kiCV1M9c5sNcqlHX2C1BbVjJH9a09G5N+C1aDkLqKQn/L2Q8BW120GkGeeThaWFySrzTAlNA1Y
	jc1MnoNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJPrB-00000000V3e-4Bvi;
	Fri, 06 Dec 2024 04:22:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJPq9-00000000Uxs-3Iyk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 04:21:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64617169E;
	Thu,  5 Dec 2024 20:21:44 -0800 (PST)
Received: from [10.163.50.12] (unknown [10.163.50.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4518A3F58B;
	Thu,  5 Dec 2024 20:21:11 -0800 (PST)
Message-ID: <f625af22-cb60-47d2-a775-e9fd273a8e7c@arm.com>
Date: Fri, 6 Dec 2024 09:51:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] arm64: make rodata=on behaviour be the original
 rodata=full
To: Huang Shijie <shijie@os.amperecomputing.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: patches@amperecomputing.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 xiongwei.song@windriver.com, ardb@kernel.org, steven.price@arm.com,
 suzuki.poulose@arm.com, mark.rutland@arm.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 cl@os.amperecomputing.com
References: <20241126085647.4993-1-shijie@os.amperecomputing.com>
 <20241126085647.4993-2-shijie@os.amperecomputing.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20241126085647.4993-2-shijie@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_202117_877724_AFE955F5 
X-CRM114-Status: GOOD (  13.87  )
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



On 11/26/24 14:26, Huang Shijie wrote:
> Make rodata=on behaviour be the original rodata=full.
> After this patch, the rodata=on will be the default,
> and the arm64 kernel behaviour will follow the
> Documentation/admin-guide/kernel-parameters.txt:
> 	rodata=		[KNL,EARLY]
> 		on	Mark read-only kernel memory as read-only (default).
> 
> Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
> ---
>  arch/arm64/include/asm/setup.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/setup.h b/arch/arm64/include/asm/setup.h
> index ba269a7a3201..5ded3bd11476 100644
> --- a/arch/arm64/include/asm/setup.h
> +++ b/arch/arm64/include/asm/setup.h
> @@ -21,7 +21,7 @@ static inline bool arch_parse_debug_rodata(char *arg)
>  	if (!arg)
>  		return false;
>  
> -	if (!strcmp(arg, "full")) {
> +	if (!strcmp(arg, "on")) {
>  		rodata_enabled = rodata_full = true;
>  		return true;
>  	}
> @@ -31,7 +31,7 @@ static inline bool arch_parse_debug_rodata(char *arg)
>  		return true;
>  	}
>  
> -	if (!strcmp(arg, "on")) {
> +	if (!strcmp(arg, "full")) {
>  		rodata_enabled = true;
>  		rodata_full = false;
>  		return true;

After this patch we have the following and seems like 'rodata=full'
is temporarily broken until the subsequent patches come in ?

static inline bool arch_parse_debug_rodata(char *arg)
{
        extern bool rodata_enabled;
        extern bool rodata_full;

        if (!arg)
                return false;

        if (!strcmp(arg, "on")) {
                rodata_enabled = rodata_full = true;
                return true;
        }

        if (!strcmp(arg, "off")) {
                rodata_enabled = rodata_full = false;
                return true;
        }

        if (!strcmp(arg, "full")) {
                rodata_enabled = true;
                rodata_full = false;     <---------------- here
                return true;
        }

        return false;
}

