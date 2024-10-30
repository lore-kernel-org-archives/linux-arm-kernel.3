Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14FFD5CC81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 09:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ag3qMEuX6Cc3v4bkPrSJRzpYF1kUzoXfTNF3zWq3sa4=; b=e3Zc7NMZMH4AHcrPs8gu0ascUT
	5KQjJAODDfYjBlxDYdam9hrGjflekYed3ygHstoanCypzVOfFTGcK4ZrzSwUuuVZAajCfL+0vCQon
	RUiQW17oflqNKW31h+1L4AdBs8PIYgH6sgv6hLP4Is2HP5NZPqedcTtZzooqc5+a3DJlJEePJHNhW
	Fhng6BODg2iJL96IeDsst/wvPkYbUk7jBuzAhIrblbq/DjUOEMhFr31/Fi16Lh1xegUbkWs7LQyDQ
	FBDPMYe2tSq72MM8dZwO43489Gz8K7xXlu1vi0o3DUuiHTOCfV4AT+dlWedw2mrxGc/ttyZCJ41KJ
	SofKje7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t65M8-0000000HRx6-3Rv7;
	Wed, 30 Oct 2024 09:51:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t65KM-0000000HRWv-1qnd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 09:49:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5BA00A433CE;
	Wed, 30 Oct 2024 09:47:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C323FC4CEE5;
	Wed, 30 Oct 2024 09:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730281758;
	bh=NDw0InURcJy7Z0GoHumZQCjg5VAENS9N1S5pr0z2yb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j0DJmS1zCBPUEjiPHvT4etc+FpuqaQI/KH7l25dsJAYubGrzFCR0ZoQlAvYpYgKOn
	 cOVUEMwVPVsgYdwl46rgLrJi4L0wXh4qorl48s4x2C/7i2rjtnNrgxlRteFOPPnHNw
	 UqCDsVbUlr3jNbnmcba08gJ37c51+ZdkNU/qp4Ajfx0oSmp2ak3jzb6gyOml17iNXs
	 FQBFj/i6whwIfTCKB3N/6Kqa8rpeD47HaH0rhzjwA1pCQoAmOG9afgtj/FE9C+C5cX
	 v72xlIfJDYcNroim9cDUyQb3k4HQ0hL19/9Z6FBE2wF81fDBmwao/3Nm7msjEKPWDh
	 43x9XTHhi+p+g==
Date: Wed, 30 Oct 2024 10:49:13 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Zheng Zengkai <zhengzengkai@huawei.com>, will@kernel.org,
	catalin.marinas@arm.com
Cc: guohanjun@huawei.com, sudeep.holla@arm.com, mark.rutland@arm.com,
	maz@kernel.org, rafael@kernel.org, lenb@kernel.org,
	daniel.lezcano@linaro.org, tglx@linutronix.de,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] ACPI: GTDT: Tighten the check for the array of
 platform timer structures
Message-ID: <ZyIBGRv/10kpOcOl@lpieralisi>
References: <20241016095458.34126-1-zhengzengkai@huawei.com>
 <Zw+O4nZisbkdvNtz@lpieralisi>
 <3bf1fe29-e135-c1ba-2774-d1e98c8b92b3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3bf1fe29-e135-c1ba-2774-d1e98c8b92b3@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_024922_687519_5A3F09D6 
X-CRM114-Status: GOOD (  38.12  )
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

[+Catalin/Will]

On Tue, Oct 29, 2024 at 10:16:41PM +0800, Zheng Zengkai wrote:
> 
> Gentle ping.
> 
> This patch still can be applied to upstream now.

Hi Catalin, Will,

this patch is a clean-up - not a fix, it could be merged
for v6.13, please consider it if there is still time.

Thanks,
Lorenzo

> 
> Thanks!
> 
> 
> 在 2024/10/16 18:01, Lorenzo Pieralisi 写道:
> > On Wed, Oct 16, 2024 at 05:54:58PM +0800, Zheng Zengkai wrote:
> > > As suggested by Marc and Lorenzo, first we need to check whether the
> > > platform_timer entry pointer is within gtdt bounds (< gtdt_end) before
> > > de-referencing what it points at to detect the length of the platform
> > > timer struct and then check that the length of current platform_timer
> > > struct is also valid, i.e. the length is not zero and within gtdt_end.
> > > Now next_platform_timer() only checks against gtdt_end for the entry of
> > > subsequent platform timer without checking the length of it and will
> > > not report error if the check failed and the existing check in function
> > > acpi_gtdt_init() is also not enough.
> > > 
> > > Modify the for_each_platform_timer() iterator and use it combined with
> > > a dedicated check function platform_timer_valid() to do the check
> > > against table length (gtdt_end) for each element of platform timer
> > > array in function acpi_gtdt_init(), making sure that both their entry
> > > and length actually fit in the table.
> > > 
> > > Suggested-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > > Co-developed-by: Marc Zyngier <maz@kernel.org>
> > > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > > Signed-off-by: Zheng Zengkai <zhengzengkai@huawei.com>
> > > ---
> > > Changes in v4:
> > > - remove the tmp pointer to make the code more concise.
> > > 
> > > Changes in v3:
> > > - based on Marc's patch and reuse the for_each_platform_timer() loop
> > > Link to v3: https://lore.kernel.org/linux-arm-kernel/20241015152602.184108-1-zhengzengkai@huawei.com/
> > > 
> > > Changes in v2:
> > > - Check against gtdt_end for both entry and len of each array element
> > > Link to v2: https://lore.kernel.org/linux-arm-kernel/20241012085343.6594-1-zhengzengkai@huawei.com/
> > > 
> > > Link to v1: https://lore.kernel.org/all/20241010144703.113728-1-zhengzengkai@huawei.com/
> > > 
> > > Link to previous related patches:
> > > https://lore.kernel.org/all/20241008082429.33646-1-zhengzengkai@huawei.com/
> > > https://lore.kernel.org/all/20240930030716.179992-1-zhengzengkai@huawei.com/
> > > ---
> > >   drivers/acpi/arm64/gtdt.c | 29 ++++++++++++++++++++---------
> > >   1 file changed, 20 insertions(+), 9 deletions(-)
> > Reviewed-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > 
> > > diff --git a/drivers/acpi/arm64/gtdt.c b/drivers/acpi/arm64/gtdt.c
> > > index c0e77c1c8e09..d7c4e1b9915b 100644
> > > --- a/drivers/acpi/arm64/gtdt.c
> > > +++ b/drivers/acpi/arm64/gtdt.c
> > > @@ -36,19 +36,25 @@ struct acpi_gtdt_descriptor {
> > >   static struct acpi_gtdt_descriptor acpi_gtdt_desc __initdata;
> > > -static inline __init void *next_platform_timer(void *platform_timer)
> > > +static __init bool platform_timer_valid(void *platform_timer)
> > >   {
> > >   	struct acpi_gtdt_header *gh = platform_timer;
> > > -	platform_timer += gh->length;
> > > -	if (platform_timer < acpi_gtdt_desc.gtdt_end)
> > > -		return platform_timer;
> > > +	return (platform_timer >= (void *)(acpi_gtdt_desc.gtdt + 1) &&
> > > +		platform_timer < acpi_gtdt_desc.gtdt_end &&
> > > +		gh->length != 0 &&
> > > +		platform_timer + gh->length <= acpi_gtdt_desc.gtdt_end);
> > > +}
> > > +
> > > +static __init void *next_platform_timer(void *platform_timer)
> > > +{
> > > +	struct acpi_gtdt_header *gh = platform_timer;
> > > -	return NULL;
> > > +	return platform_timer + gh->length;
> > >   }
> > >   #define for_each_platform_timer(_g)				\
> > > -	for (_g = acpi_gtdt_desc.platform_timer; _g;	\
> > > +	for (_g = acpi_gtdt_desc.platform_timer; platform_timer_valid(_g);\
> > >   	     _g = next_platform_timer(_g))
> > >   static inline bool is_timer_block(void *platform_timer)
> > > @@ -157,6 +163,7 @@ int __init acpi_gtdt_init(struct acpi_table_header *table,
> > >   {
> > >   	void *platform_timer;
> > >   	struct acpi_table_gtdt *gtdt;
> > > +	int cnt = 0;
> > >   	gtdt = container_of(table, struct acpi_table_gtdt, header);
> > >   	acpi_gtdt_desc.gtdt = gtdt;
> > > @@ -176,12 +183,16 @@ int __init acpi_gtdt_init(struct acpi_table_header *table,
> > >   		return 0;
> > >   	}
> > > -	platform_timer = (void *)gtdt + gtdt->platform_timer_offset;
> > > -	if (platform_timer < (void *)table + sizeof(struct acpi_table_gtdt)) {
> > > +	acpi_gtdt_desc.platform_timer = (void *)gtdt + gtdt->platform_timer_offset;
> > > +	for_each_platform_timer(platform_timer)
> > > +		cnt++;
> > > +
> > > +	if (cnt != gtdt->platform_timer_count) {
> > > +		acpi_gtdt_desc.platform_timer = NULL;
> > >   		pr_err(FW_BUG "invalid timer data.\n");
> > >   		return -EINVAL;
> > >   	}
> > > -	acpi_gtdt_desc.platform_timer = platform_timer;
> > > +
> > >   	if (platform_timer_count)
> > >   		*platform_timer_count = gtdt->platform_timer_count;
> > > -- 
> > > 2.20.1
> > > 
> > .
> > 

