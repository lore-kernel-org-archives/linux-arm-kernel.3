Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8CB606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 12:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AA7f2UKj;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=h5Zoek30
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Rg0ETYbEaunw+LkMJf50lkBOkvciZg3rbVHhzrZnfXw=; b=AA7f2UKjNh2ILC
	/GZPagxMfYjl8eGqTE6eY2VBh+uKlehWkRhR3q/2nm8aBh+rvzrUU6GC5+caGxh6kjKr5azymm6X5
	cpVXV4O5IoZmj99zEYrYpbAC6jI4wbsz9uT1cFtlry9p4v/UhlwotOyh67q4oahHBmw7fDpKEqt1P
	CfF9thjeqo/9zIdgAPCmWj9T+DCNC4jdpi4CoHk0QnPTPRiWirT0MFJ2yeNUIOoTYTDccYPwDd5fv
	1MM0I1JdPVAVcxjUkFdFSs30TZY9K5nD3h9tK8CBmLXaDFDslWZyTVA9GY+oz0Gpj6ntOpyIF+Byv
	pHUwtQ9eGcsSPSpuDx3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJcs-00000002UGg-1U90;
	Mon, 26 Oct 2026 12:16:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJcq-00000002UGG-0Ii1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 12:16:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EC1215A1;
	Mon, 26 Oct 2026 05:16:22 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF8593F7B4;
	Mon, 26 Oct 2026 05:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793016985; bh=Gk4eUsoyed4B957tUYZATCS0kUgqsVIGWKLqcaoh44U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h5Zoek30G0L+Q7LsMI3bb6Z9oGY3tyyoKd09cgYLswpa0ALiG2swjoNgL8wLguwgl
	 7/ZeVD+zOKKceSTAYzcRIqvFHgp0kaRz5ICw+2wwpSOZHeGuVYAfovsNExLNL8vFFs
	 Fq/PWI1Wgg+FZId5F0j7Rg822id+Doa49D3Cmlo4=
Message-ID: <c5afae4a-c8cc-481c-8c98-8a0f84db1911@arm.com>
Date: Mon, 26 Oct 2026 12:16:23 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: Reject ris_idx == MPAM_MSC_MAX_NUM_RIS
To: Ping Li <leeonion.muyu@gmail.com>, james.morse@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 reinette.chatre@intel.com, fenghuay@nvidia.com
References: <20261022085710.1597276-1-leeonion.muyu@gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261022085710.1597276-1-leeonion.muyu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_051628_164420_F2950037 
X-CRM114-Status: GOOD (  15.45  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ping,

On 22/10/2026 09:57, Ping Li wrote:
> While checking the driver's partid and ris bound checks, after the
> hardware team mistakenly configured PARTID_MAX in an MSC to 16,
> this issue was found: MPAM_MSC_MAX_NUM_RIS is the max number of
> RIS an MSC can have, so a ris_idx of 16 passes the current check,
> and would later be silently truncated to 0 by FIELD_PREP(),
> landing all configuration for that ris on RIS 0.
> 
> Signed-off-by: Ping Li <leeonion.muyu@gmail.com>

Thanks for the patch. Yin already found the same bug and posted a fix first so I'll go with that one.

https://lore.kernel.org/linux-arm-kernel/20261008-mpam-resctrl-dt-knp-support-v3-1-35196c2b43bf@oss.qualcomm.com/

Thanks,

Ben

> ---
>  drivers/resctrl/mpam_devices.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 48adc49b833c..347a5a6d6a1d 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -700,7 +700,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
>  
>  	lockdep_assert_held(&mpam_list_lock);
>  
> -	if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
> +	if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
>  		return -EINVAL;
>  
>  	if (test_and_set_bit(ris_idx, &msc->ris_idxs))


