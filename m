Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04360D6E2A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 10:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fuo4xlzwRFkpTmlfDCH+D8j54FL6JCPfYeuh+E70jb4=; b=o4Ogzzku/0EACTkZr6I8+ycogT
	Ab2mt8mkXnQHnH/p2lIIGA/SHFTG2540TKgAJ9akstLijduCGIHYqh7UpjBclY2II6swOD+ywxgHM
	IR5X/b4nHPXOG8iJQ8ZATzrsHux+pt4PEu1RVSVCBVIx6gYOt05pwy9zUNAS6mTq92CWL24PmPc1y
	qy2aHtkexKW7zUNjgBKjEyhtcIoUlfry/UxNE2H7hfgaEB22OWePBiwXqEvcU3zXLzOO0lO5jyuCl
	uVz5yXmhf49FqOjNvm6TO/XTYmdEvLUrVlidue8gx95Y9O7Xnkz7s9B/yUGF26W+UJpoc3CVGyMkB
	RluvSVPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE481-0000000HJlv-3I1G;
	Thu, 21 Nov 2024 10:09:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE475-0000000HJdJ-06AE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 10:08:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 617931480;
	Thu, 21 Nov 2024 02:09:07 -0800 (PST)
Received: from [10.57.92.130] (unknown [10.57.92.130])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 727303F6A8;
	Thu, 21 Nov 2024 02:08:36 -0800 (PST)
Message-ID: <b7636597-b72e-4bea-ab07-c6ad6caf2aac@arm.com>
Date: Thu, 21 Nov 2024 10:08:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] perf/arm-cmn: Ensure port and device id bits are set
 properly
To: Namhyung Kim <namhyung@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: Stephane Eranian <eranian@google.com>, LKML
 <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
References: <20241121001334.331334-1-namhyung@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20241121001334.331334-1-namhyung@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_020839_109589_9D3C4035 
X-CRM114-Status: GOOD (  13.99  )
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

On 2024-11-21 12:13 am, Namhyung Kim wrote:
> The portid_bits and deviceid_bits were set only for XP type nodes in
> the arm_cmn_discover() and it confused other nodes to find XP nodes.
> Copy the both bits from the XP nodes directly when it sets up a new
> node.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Fixes: e79634b53e39 ("perf/arm-cmn: Refactor node ID handling. Again.")
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>
> ---
>   drivers/perf/arm-cmn.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
> index 49bd811c6fd6efdd..b20fa600e510c54f 100644
> --- a/drivers/perf/arm-cmn.c
> +++ b/drivers/perf/arm-cmn.c
> @@ -2178,8 +2178,6 @@ static int arm_cmn_init_dtcs(struct arm_cmn *cmn)
>   			continue;
>   
>   		xp = arm_cmn_node_to_xp(cmn, dn);
> -		dn->portid_bits = xp->portid_bits;
> -		dn->deviceid_bits = xp->deviceid_bits;
>   		dn->dtc = xp->dtc;
>   		dn->dtm = xp->dtm;
>   		if (cmn->multi_dtm)
> @@ -2420,6 +2418,8 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
>   			}
>   
>   			arm_cmn_init_node_info(cmn, reg & CMN_CHILD_NODE_ADDR, dn);
> +			dn->portid_bits = xp->portid_bits;
> +			dn->deviceid_bits = xp->deviceid_bits;
>   
>   			switch (dn->type) {
>   			case CMN_TYPE_DTC:
> 
> base-commit: 43fb83c17ba2d63dfb798f0be7453ed55ca3f9c2


