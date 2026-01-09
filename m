Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D805BD232E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 06:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qgp72385LGLdMRsHkh4r7fySKyjZ32QFPwk6d0+hg3k=; b=IFRDIApj8w8gQ9VNnP86Ds1XVG
	80r2iHimhi8iLusgm1G402VnRu1lISGrSumnQk4gnlIgNrBjUh4CuIMpTEcLHxp6hJqV8kRsB8hyb
	c954LZw0H7HFoxaF7hIFhq/CmjyruHfo7HO/HllmH2o0ZNMkide+GF6n1Nqyscrqmk+qvViielgKd
	uwvDV7IhT3UTKVJd+4adM1ID9PuuoSid/NeOVCtFNDueTLbrd1bGFZS3jeUzYcm6XOu0No9CYtJCn
	XSlArfJCuy6RumN5MKUFD98G0yvCk6niBpVi2TVXTpZ0M+qETzoEb9yC7hafVHKd39/q7pydKrMgM
	sQojdyDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve5e1-00000001WAf-2Yh5;
	Fri, 09 Jan 2026 06:06:45 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve5dx-00000001W7K-1d29
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 06:06:44 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Qgp72385LGLdMRsHkh4r7fySKyjZ32QFPwk6d0+hg3k=;
	b=5slUs5WaTSoRNVYBRNm8hGG21c8xx6wabHJ42URk36SU0b7vUvKwMZ30+5zCNKtZNQKLBAXPw
	uyzqnfd7PkdsdUbnKsyrlUBFmi68/nc5ebQuIwCRxhDlb+yBvcizbd7vdMIUtTk8kKSzYSoVHwa
	gTyENKbD/kXNpPi1Xu8Wzbo=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4dnWQs4RxyzRhQQ;
	Fri,  9 Jan 2026 14:03:01 +0800 (CST)
Received: from kwepemk200017.china.huawei.com (unknown [7.202.194.83])
	by mail.maildlp.com (Postfix) with ESMTPS id 65D1240569;
	Fri,  9 Jan 2026 14:06:18 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 kwepemk200017.china.huawei.com (7.202.194.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 9 Jan 2026 14:06:17 +0800
Subject: Re: [PATCH] KVM: arm64: remove unused vcpu_{clear,set}_wfx_traps()
To: Dongxu Sun <sundongxu1024@163.com>
CC: <maz@kernel.org>, <oupton@kernel.org>, <joey.gouly@arm.com>,
	<suzuki.poulose@arm.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
References: <20260109025837.754242-1-sundongxu1024@163.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <d4f231b7-f170-c456-3fbd-0063891378fe@huawei.com>
Date: Fri, 9 Jan 2026 14:06:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20260109025837.754242-1-sundongxu1024@163.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200017.china.huawei.com (7.202.194.83)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_220642_056587_380660E6 
X-CRM114-Status: UNSURE (   7.49  )
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

s/remove/Remove/ in the Subject.

On 2026/1/9 10:58, Dongxu Sun wrote:
> Function vcpu_{clear,set}_wfx_traps() are unused since
> commit 0b5afe05377d7 ("KVM: arm64: Add early_param to control WFx trapping")

checkpatch WARNING: Prefer a maximum 75 chars per line (possible
unwrapped commit description?)

> Remove it.
> 
> Signed-off-by: Dongxu Sun <sundongxu1024@163.com>
> ---
>  arch/arm64/include/asm/kvm_emulate.h | 16 ----------------
>  1 file changed, 16 deletions(-)

Otherwise,

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>

Thanks,
Zenghui

