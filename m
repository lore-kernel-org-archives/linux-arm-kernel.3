Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E97C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 21:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ZEvYXDUXqUYL2U4yUoW9/H/AvBZH66drMq9cCnWHGQ=; b=H0WdNN5a5Dzxy3TAjMkJ/mKmQV
	MVnJRW177tALkIjczW2XHaM8QSw/aMsjW9b0SFE/u/UfIM1TupC+k6cn73pd0eNvvaWiqSjEHiOue
	J/gXG2LycclqNvqZq9Bkzs0V6zwBGYNuo5jP0OxAo5hWGbOZF6S6XJSY/aDbSQ2QfubOLiMSsQQKg
	dM703jjxiQPIFXigwmUoSRxxlzqrA3PJYKzonNl8YvIeQhtksCSx0MH9GDWR1tjrwOwgN3g1NJ5Pd
	CX8mRmSDJXduvtD9KGNT4EVQ2XdhoPW5C3lDmkm+7y3IpfMt/4aAraqt7GEIm/mBdvvo0UVZQYux1
	A11yVqFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMvxR-0000000EH5j-1W8J;
	Wed, 04 Jun 2025 21:47:37 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMvvK-0000000EGzB-37UL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 21:45:27 +0000
Received: from romank-3650.corp.microsoft.com (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 3CE6B201FF58;
	Wed,  4 Jun 2025 14:45:24 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3CE6B201FF58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1749073524;
	bh=8ZEvYXDUXqUYL2U4yUoW9/H/AvBZH66drMq9cCnWHGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aVv3UHTQKVgOQ5XsgnaygQFe03yxAZNtEsH3jGkDUPvYuK34m4Z7khFKcra3lSHee
	 XhLPJqXAbk34Fd+VuAGMjmGmH42rlQEZXAg3DL7+J7tnfZuV3zI1sYAuo2V7xnAJVa
	 1kCbZehw9I9ISiM1y4Am8D2DN/7jVGD5QHx83oCQ=
From: Roman Kisel <romank@linux.microsoft.com>
To: anirudh@anirudhrb.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lpieralisi@kernel.org,
	mark.rutland@arm.com,
	sudeep.holla@arm.com,
	apais@microsoft.com,
	benhill@microsoft.com,
	bperkins@microsoft.com,
	sunilmut@microsoft.com
Subject: [PATCH] firmware: smccc: support both conduits for getting hyp UUID
Date: Wed,  4 Jun 2025 14:45:21 -0700
Message-ID: <20250604214522.3523-1-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521094049.960056-1-anirudh@anirudhrb.com>
References: <20250521094049.960056-1-anirudh@anirudhrb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_144526_820110_73578839 
X-CRM114-Status: GOOD (  15.80  )
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

> From: Anirudh Rayabharam (Microsoft) <anirudh@anirudhrb.com>
>
> When Linux is running as the root partition under Microsoft Hypervisor
> (MSHV) a.k.a Hyper-V, smc is used as the conduit for smc calls.
>
> Extend arm_smccc_hypervisor_has_uuid() to support this usecase. Use
> arm_smccc_1_1_invoke to retrieve and use the appropriate conduit instead
> of supporting only hvc.
>
> Boot tested on MSHV guest, MSHV root & KVM guest.
>
> Signed-off-by: Anirudh Rayabharam (Microsoft) <anirudh@anirudhrb.com>
> ---
>  drivers/firmware/smccc/smccc.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
> index cd65b434dc6e..bdee057db2fd 100644
> --- a/drivers/firmware/smccc/smccc.c
> +++ b/drivers/firmware/smccc/smccc.c
> @@ -72,10 +72,7 @@ bool arm_smccc_hypervisor_has_uuid(const uuid_t *hyp_uuid)
>  	struct arm_smccc_res res = {};
>  	uuid_t uuid;
>
> -	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_HVC)
> -		return false;
> -
> -	arm_smccc_1_1_hvc(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, &res);
> +	arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, &res);
>  	if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
>  		return false;

The patch is a strict superset of the existing functionality.
Validated on baremetal Linux and KVM, Apple M3 nested virt., various client and
server ARM64 systems running Windows ARM64 with VMs managed by Hyper-V and OpenVMM.

Looks good to me.

Tested-by: Roman Kisel <romank@linux.microsoft.com>
Reviewed-by: Roman Kisel <romank@linux.microsoft.com>

