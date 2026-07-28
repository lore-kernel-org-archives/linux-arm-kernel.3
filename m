Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDE2C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 01:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jITBCFedCA5wFtGXNz55fwexqW4gQtD6j/4wdQhI/to=; b=LkNuHB26wXEYs4cwjkrrBPssg8
	KbeAn1e04dG4bweNuw6wckecfa1KKLdu+Soji0QQIYDiTNlRyNwtnBXL6NTwCGmFdfBUW4l88j4ew
	ECs8+Lun93tn9dsAG1VhGmrqDJLE1qqgAAMuXZG5Dsxe3+IpotbdzbyveryDMfypFMDwqvHzS8oo8
	uCPW0cxjCIWvGGmtt4WZMqTXuEZgbTP4F5nsw+5GGO7uxQ/d9wpFMxl9xKSbASd/onVtK4euXqVl6
	dM/KZib8cQwqLdVnfEN/OX+XwGEdGTsiJaWR6OHxBkxL1BD4TIpq32DXdhj0P+5hvJtzP4kYF0hIn
	eRGL/Tog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woWRL-00000004BMp-3PMT;
	Tue, 28 Jul 2026 01:17:03 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woWRI-00000004BLu-43rQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 01:17:02 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=jITBCFedCA5wFtGXNz55fwexqW4gQtD6j/4wdQhI/to=;
	b=Z8AfXETwFvTzOD4XO6ZU7Hw7xwGGLIl5Td3WQS3TlIFJk6JujTHasKT4uJvQgkLFDke4BPUU5
	PW6iq8/wWV61SSw9nVW57h0dAi7xgGFb7kvrLYZDF8m0i7fzaIUnoTQ5nnidPgAfJU/oH9xHk0x
	Vi7a1oA4CuW74l9k02isNLs=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4h8HPP1KrpzKm4b;
	Tue, 28 Jul 2026 09:07:21 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id DAEE640565;
	Tue, 28 Jul 2026 09:16:49 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 28 Jul 2026 09:16:49 +0800
Message-ID: <1504d691-e05f-46eb-924a-d960c7fe2ee5@huawei.com>
Date: Tue, 28 Jul 2026 09:16:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 04/45] arm64: hibernate: Restore DAIF state on
 error
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <liaochang1@huawei.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-5-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260727163453.7969-5-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_181701_466473_92EEFC41 
X-CRM114-Status: GOOD (  14.44  )
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



在 2026/7/28 0:34, Vladimir Murzin 写道:
> Sashiko AI has reported that if swsusp_mte_save_tags() for some reason
> fails we return from swsusp_arch_suspend() with DAIF being masked -
> that is not what we'd expect. Restore the saved DAIF state before
> returning from the error path.
> 
> Fixes: ee11f332af96 ("arm64: mte: Save tags when hibernating")
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/kernel/hibernate.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
> index 1eb1c1074c5b..7bf117427777 100644
> --- a/arch/arm64/kernel/hibernate.c
> +++ b/arch/arm64/kernel/hibernate.c
> @@ -348,8 +348,10 @@ int swsusp_arch_suspend(void)
>  		crash_prepare_suspend();
>  
>  		ret = swsusp_mte_save_tags();
> -		if (ret)
> +		if (ret) {
> +			local_daif_restore(flags);
>  			return ret;
> +		}

We can use a label to reuse the exit path, otherwise LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

--- a/arch/arm64/kernel/hibernate.c
+++ b/arch/arm64/kernel/hibernate.c
@@ -349,7 +349,7 @@ int swsusp_arch_suspend(void)

                ret = swsusp_mte_save_tags();
                if (ret)
-                       return ret;
+                       goto restore_daif;

                sleep_cpu = smp_processor_id();
                ret = swsusp_save();
@@ -391,6 +391,7 @@ int swsusp_arch_suspend(void)
                spectre_v4_enable_mitigation(NULL);
        }

+restore_daif:
        local_daif_restore(flags);

        return ret;


>  
>  		sleep_cpu = smp_processor_id();
>  		ret = swsusp_save();


