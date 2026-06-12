Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF11CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 10:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZiSEkCX6kKkdkS50nu71JK7uzuZuYnFd1L29ILY3Go=; b=BHUXUyU5cr2daLGKEFwvJqASGz
	IFZgz0e24EW9TNhMYxEXE02Bl3My0ZyVvUZfGVMiNDP3X1o9FJcahS/DJT2va87BmoHXRBM9RhaFI
	mmTenioO087z/G6AqVD1z91QE3j6G3GkYciRA5UUwJvjkUK0X7cdXqxrGvGgAwc2+CMB0GyzVG8rU
	p0fF4JTancTByHodaBy5MfB7KTR+eUw6uux9IXJhepop8uA+b3TFxw0nizJkILO4UKln0zPvY96U8
	TEuVySU4VCaIEoay+1e4zOtvnc3CMl75vnd9yG6cwTXoZZk2syIIu/wtywKfT1RITverE/qsA6+2z
	iWNvDIVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXzXq-0000000Am9e-2Xw9;
	Fri, 12 Jun 2026 10:55:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXzXq-0000000Am9X-0jBl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 10:55:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BD80543EE5;
	Fri, 12 Jun 2026 10:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A78B1F000E9;
	Fri, 12 Jun 2026 10:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781261724;
	bh=IZiSEkCX6kKkdkS50nu71JK7uzuZuYnFd1L29ILY3Go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nJs/iKnzz2mf4+YD03tIqjuzu3OUfrYeW4xhbk453t2LGeCZJGCndPIaxjvSNV199
	 Q/PKZfKfif6tWQ8P6zJCx8MOwxtZZ+46h+B+9Lk/nV6Dp0N2SGtEt1dptcHi32qt1m
	 03oruL4fN++UIzlBXqDL74lKmEjaCKuonuLb5yJDqzNa03s6IluXjCDfIvfeFAQ9Hg
	 pxTTGGzHw/5JwmzsnhNstKB3GvjcWMZdVACgB+X/FC0Gz6AqFp2QvKeZy7r43Csecr
	 Vdk/Myur0KeDyhbPUY2zbO50l6cBz87PldVBEOBYOAEGlj2ghIvts3wkkirKiWVND0
	 fSC4FLIq/Hh5Q==
Date: Fri, 12 Jun 2026 11:55:21 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
	Trilok Soni <trilok.soni@oss.qualcomm.com>,
	Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
Subject: Re: [PATCH] firmware: arm_ffa: Fix NULL dereference in
 ffa_partition_info_get()
Message-ID: <20260612-fat-energetic-hummingbird-8ddc62@sudeepholla>
References: <20260611-ffa_partition_nullptr_fix-v1-1-ec2b7ef7e130@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260611-ffa_partition_nullptr_fix-v1-1-ec2b7ef7e130@oss.qualcomm.com>
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

On Thu, Jun 11, 2026 at 01:19:17PM -0700, Unnathi Chalicheemala wrote:
> ffa_partition_info_get() passes uuid_str directly to uuid_parse()
> without a NULL check. When a caller passes NULL (or an empty string),
> uuid_parse() → __uuid_parse() → uuid_is_valid() dereferences the
> pointer, causing a kernel panic:
> 
> Unable to handle kernel NULL pointer dereference at virtual address
> 0000000000000040
> pc : uuid_parse+0x40/0xac
> lr : ffa_partition_info_get+0x1c/0x94 [arm_ffa]
> 

The above is very valid issue and needs to be addressed.

> Per the FF-A spec, the all-zeros UUID is the defined wildcard that
> instructs the SPMC to return information for all partitions. Map NULL
> and empty string to uuid_null rather than crashing in uuid_parse(),
> preserving the intended "return all partitions" semantics for callers
> that pass NULL.
> 

Agreed on the spec part but not w.r.t the interface. Where is the driver
using this call and why is it sending null or wants to extract all the
partition information ?

> Fixes: d0c0bce83122 ("firmware: arm_ffa: Setup in-kernel users of FFA partitions")
> Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
> ---
>  drivers/firmware/arm_ffa/driver.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> index b9f17fda7243..dd500fb81b79 100644
> --- a/drivers/firmware/arm_ffa/driver.c
> +++ b/drivers/firmware/arm_ffa/driver.c
> @@ -1129,7 +1129,9 @@ static int ffa_partition_info_get(const char *uuid_str,
>  	uuid_t uuid;
>  	struct ffa_partition_info *pbuf;
>  
> -	if (uuid_parse(uuid_str, &uuid)) {
> +	if (!uuid_str || uuid_str[0] == '\0') {
> +		uuid = uuid_null;

I object to make it uuid_null. Below check is enough to check NULL
dereference.

-       if (uuid_parse(uuid_str, &uuid)) {
+       if (!uuid_str || uuid_parse(uuid_str, &uuid)) {


I don't think we need to service NULL as valid argument via this interface
as the callee driver needs to pass its partition UUID here.

-- 
Regards,
Sudeep

