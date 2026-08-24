Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB79EC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 11:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHOpoEdx6sAdpQxdlI+Wy7alzqV/AK0WHQTc8WJWFHE=; b=BdHCTqQ06vi4Hy80hfQUsT6PXf
	7mqSsiaugL7ZKSmKuwmn41ywc+rjsCFtqRs0RM9kmu87XAsCfFMgJWJNhhVReWm8cPju87zEoKBwR
	FLZzsUj8m/K9VGt2L18lH96PpHxXMo53BpZcvQcUqNm17IZp/qHOaBNmTSrgag1hdK6VaAu41X68u
	O1o1KlkDRXh93CAWxbcV+VXrEeH+bUYZb9LAPzQZ1Syi4Kp4Qx2Z6j0h+kmx3f+Bu5NZ55n0Ap+zM
	qlYY7BeKJNFZyC5Yv/LqwWlz16DjbifCQZkqZonCSJztafuL5eb/rQfyqZ5pdBZ0x9Pe2KiqP9QMR
	4Y0szSkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyT45-0000000GXFu-1oNb;
	Mon, 24 Aug 2026 11:42:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyT42-0000000GXEl-21sB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 11:42:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D1671756;
	Mon, 24 Aug 2026 04:41:59 -0700 (PDT)
Received: from [10.57.70.220] (unknown [10.57.70.220])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3429A3F66F;
	Mon, 24 Aug 2026 04:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787571722; bh=50CME7CgCbOvbtl/iWrw4jnUPnZ5Evy5HokIhTg4SvY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=InoE8EYNBzl8GgsO6hioqCP9oBK7gpn/8Cbt3wPK6LDvFNQV4Zs+cHLOabTlst7cd
	 Y15Gp4DcaUBgur7LTJ9KnPEnpcQI9YcuP++Rg4ICgOmzEqC1bOTZWd/sdtKccVJ45P
	 8sItpfHBlcXeqXZThiuw4JoH59o+r6jn3QDUkCng=
Message-ID: <78f188cd-706b-42cf-82a1-527c1efefce1@arm.com>
Date: Mon, 24 Aug 2026 12:41:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: arm-cci: fix device_node refcount leak in
 cci_probe_ports()
To: Manush Prajwal <manushprajwal555@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, sudeep.holla@kernel.org
Cc: linux-arm-kernel@lists.infradead.org
References: <6a887550.f7f62383.10ed1b.5875@mx.google.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <6a887550.f7f62383.10ed1b.5875@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_044207_112236_BA61D57F 
X-CRM114-Status: GOOD (  23.73  )
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

On 2026-08-21 4:57 pm, Manush Prajwal wrote:
> cci_probe_ports() has two device_node refcount bugs in its
> for_each_available_child_of_node() loop over "cp":
> 
>   - When the computed port index "i" reaches nb_cci_ports, the loop
>     breaks out without releasing the reference the iterator was
>     holding on "cp", leaking it.

Note that this could only happen if the DT is bogus and specifies more 
control interfaces than can physically exist. And even then, holding an 
extra reference to a child node doesn't do any harm, since a) we already 
hold a reference on the parent node, and b) it's not like you could 
remove the system interconnect at runtime anyway.

>   - When a port is successfully parsed, "cp" is stored into
>     ports[i].dn for later use, but the loop keeps iterating afterwards.
>     The next for_each_available_child_of_node() step puts the
>     reference on the previous "cp" to advance to the next sibling, so
>     the pointer saved in ports[i].dn is left referencing a node whose
>     reference was already dropped.

...and similarly this isn't a practical issue as we never dereference 
the saved pointers; they're only used for comparison, which in reality 
happens once in cci_ace_init_ports() immediately after this is done once 
. Plus we do already hold a reference on their parent node, and it's not 
like you could remove the system interconnect at runtime anyway ;)

> Rework the loop around for_each_available_child_of_node_scoped()
> so the iterator's reference is dropped automatically on every exit
> path, including the early break. Since a matched node is kept alive
> in ports[i].dn past the end of the loop, take an explicit reference
> with of_node_get() when storing it.

However, for the sake of good practice, just in case anyone were to try 
to copy this code as an example for something else, it seems like a 
reasonable cleanup to me.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Manush Prajwal <manushprajwal555@gmail.com>
> ---
>   drivers/bus/arm-cci.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
> index 000000000..000000000 100644
> --- a/drivers/bus/arm-cci.c
> +++ b/drivers/bus/arm-cci.c
> @@ -438,8 +438,7 @@
>   static int cci_probe_ports(struct device_node *np)
>   {
>   	struct cci_nb_ports const *cci_config;
>   	int ret, i, nb_ace = 0, nb_ace_lite = 0;
> -	struct device_node *cp;
>   	struct resource res;
>   	const char *match_str;
>   	bool is_ace;
> @@ -455,7 +455,7 @@ static int cci_probe_ports(struct device_node *np)
>   	if (!ports)
>   		return -ENOMEM;
> 
> -	for_each_available_child_of_node(np, cp) {
> +	for_each_available_child_of_node_scoped(np, cp) {
>   		if (!of_match_node(arm_cci_ctrl_if_matches, cp))
>   			continue;
> 
> @@ -498,7 +498,7 @@ static int cci_probe_ports(struct device_node *np)
>   			ports[i].type = ACE_LITE_PORT;
>   			++nb_ace_lite;
>   		}
> -		ports[i].dn = cp;
> +		ports[i].dn = of_node_get(cp);
>   	}
> 
>   	/*
> --
> 2.46.2.windows.1
> 


