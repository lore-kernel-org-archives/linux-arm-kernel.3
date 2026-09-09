Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F474C79FB8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ePDNUAfAQ3wJb48EOS828muxTyZ9V+mesfFPhrCI+k=; b=2QWq+6NtnUhvwDYC9lj016N3Z6
	Vm13xz6IhSw2rZA1SZlYblulfgoxmnogfNHmHF6Cjv9aALEQX0CJB8YqE/F5xOh9Hh1ecNBC2dU8H
	dLO6aBvQepOS0Kf3BLNc/H+7Ly1UWhKpox2BMpUebzR1AXEtaqDtF6v9g748Mngvw4NE0e4n1QAt5
	GaLP0//ruJerQNxbELOiDqVCJzM9IeE6xseC5lvt5cyZ/B7uoYC46yvBIv4V9je4xMVep+KYGuMsy
	xeCoVp1f8V2cuniQUYeuyjGa+OtX8IpInnnz8aZwycwIMYwbt5m2VWpAcbfaaM2YNjrXMQxwzCgKB
	iJz9pqxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E2D-0000000BB0P-3qwW;
	Wed, 09 Sep 2026 08:52:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1s-0000000BALb-1LdW
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 08:51:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2ePDNUAfAQ3wJb48EOS828muxTyZ9V+mesfFPhrCI+k=; b=q698UjUwY4bPOFf7X9xSrX5m0l
	QQc+lLsZgxb2I2AkSBcUeCS7CkPrsP0fn6qFI0XGQrG1UYbqb7YdT9Muz1cpGKFSzxB9ZxPaXYkyj
	CwXbzrVJtfjnOrp6o+D7115O/SJrx95Ri6LrqzQOW+UgkkFXq7EKm7D38Ci9sBmBlr2N7ULedPkJO
	EES5N7+J0+VqvxCiRyhd0Ai96pME+EeJG2Q8xXo9UKhl6baKBt4KRAk2wK3gq4qKkRoZ+EiykXUKd
	nLACpddOu1DjfqitAshz/H2pqgmfRFKyc4RSZS0khM2VfjNgwI+TJ2ZX1QHvSnlLGSliCTHaov1XP
	L86WSCTA==;
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4E1n-00000000wJ8-1Y30
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 08:51:37 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2ePDNUAfAQ3wJb48EOS828muxTyZ9V+mesfFPhrCI+k=;
	b=u8EPErGci2dvvoRgmrw/1JI+J0jvgL6nxVIbn+At4oieJ810pavVdUuK6Gcy9C7an7Eqt+64u
	zRc1aH84x3aTvAf74KPbpVZA4ImnJqhOwjJK7h+vTGVmUHd8w1cosIokO5AmSSMsAb9Oy1OUHDM
	gJxZs6XRc8LqQ1Eigc6jgps=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4hfvQQ11X6z1cyPY;
	Wed,  9 Sep 2026 16:40:30 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id C50F240580;
	Wed,  9 Sep 2026 16:51:23 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 9 Sep 2026 16:51:21 +0800
Message-ID: <4b1b136d-78fd-4629-8efd-08e750af2bc9@huawei.com>
Date: Wed, 9 Sep 2026 16:51:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/40] arm_mpam: Ensure in_reset_state is false after
 applying configuration
To: Ben Horgan <ben.horgan@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <carl@os.amperecomputing.com>,
	<dave.martin@arm.com>, <david@kernel.org>, <dfustini@baylibre.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <james.morse@arm.com>,
	<jonathan.cameron@huawei.com>, <kobak@nvidia.com>, <lcherian@marvell.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<peternewman@google.com>, <punit.agrawal@oss.qualcomm.com>,
	<quic_jiles@quicinc.com>, <reinette.chatre@intel.com>,
	<rohit.mathew@arm.com>, <scott@os.amperecomputing.com>,
	<sdonthineni@nvidia.com>, <tan.shaopeng@fujitsu.com>,
	<xhao@linux.alibaba.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<corbet@lwn.net>, <maz@kernel.org>, <oupton@kernel.org>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <kvmarm@lists.linux.dev>,
	<zengheng4@huawei.com>, <linux-doc@vger.kernel.org>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-2-ben.horgan@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260313144617.3420416-2-ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_095136_051810_722A1431 
X-CRM114-Status: GOOD (  17.31  )
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



在 2026/3/13 22:45, Ben Horgan 写道:
> From: Zeng Heng <zengheng4@huawei.com>
> 
> The per-RIS flag, in_reset_state, indicates whether or not the MSC
> registers are in reset state, and allows avoiding resetting when they are
> already in reset state. However, when mpam_apply_config() updates the
> configuration it doesn't update the in_reset_state flag and so even after
> the configuration update in_reset_state can be true and mpam_reset_ris()
> will skip the actual register restoration on subsequent resets.
> 
> Once resctrl has a MPAM backend it will use resctrl_arch_reset_all_ctrls()
> to reset the MSC configuration on unmount and, if the in_reset_state flag
> is bogusly true, fail to reset the MSC configuration. The resulting
> non-reset MSC configuration can lead to persistent performance restrictions
> even after resctrl is unmounted.
> 
> Fix by clearing in_reset_state to false immediately after successful
> configuration application, ensuring that the next reset operation
> properly restores MSC register defaults.
> 
> Fixes: 09b89d2a72f3 ("arm_mpam: Allow configuration to be applied and restored during cpu online")
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> Acked-by: Ben Horgan <ben.horgan@arm.com>
> [Horgan: rewrite commit message to not be specific to resctrl unmount]
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Subject was originally:
> arm_mpam: Fix MPAM reset on resctrl unmount by clearing in_reset_state
> ---
>  drivers/resctrl/mpam_devices.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 1eebc2602187..0fd6590a9b5c 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -2692,6 +2692,7 @@ int mpam_apply_config(struct mpam_component *comp, u16 partid,
>  					 srcu_read_lock_held(&mpam_srcu)) {
>  			arg.ris = ris;
>  			mpam_touch_msc(msc, __write_config, &arg);
> +			ris->in_reset_state = false;

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  		}
>  		mutex_unlock(&msc->cfg_lock);
>  	}


