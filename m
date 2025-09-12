Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42403CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 13:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QSYssbfbwh7unnRDBQbsUyGK+fDHzTg3AtR2sqn8/lk=; b=gZzHTt2wug9Wx+WB9pf3LVwiCQ
	uVvFe1FxBGSWq8Cqf9lQB21pGp20Kh7dW4hianYsZiUjN3k2tkylodZO0j83O8zkfZr5jzoHazVAZ
	vXGQbTUnxJu1IMKYJsyG0LNu4TgrT0LKJzxXbUySuefkdcioYk4grpZKxYmy13U4Twr8YOo495Fed
	ve80tO7ZRYjrRA3UZFm8Vn6GvPq/PruOM4BCSLoY5zwXalYMIqcCDpdPdOxTm5qzx2li2vJ/IXegz
	7hPBaI0IDLKwsrvl6zrYM+ShV++L0YgqAFZRdckA2meXWrTmiUxT80v+R/ar/4Gu1ms4stFDNZ0rN
	P4sgx8Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux42K-00000009ciW-3mdX;
	Fri, 12 Sep 2025 13:42:00 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux42I-00000009chY-1bYT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 13:41:59 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cNbCh5njzz6GDH2;
	Fri, 12 Sep 2025 21:40:32 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 0E4541401F4;
	Fri, 12 Sep 2025 21:41:51 +0800 (CST)
Received: from localhost (10.203.177.15) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 12 Sep
 2025 15:41:49 +0200
Date: Fri, 12 Sep 2025 14:41:48 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>, Koba
 Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
	<fenghuay@nvidia.com>, <baisheng.gao@unisoc.com>, Rob Herring
	<robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>, "Rafael Wysocki"
	<rafael@kernel.org>, Len Brown <lenb@kernel.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 29/29] arm_mpam: Add kunit tests for props_mismatch()
Message-ID: <20250912144148.00003204@huawei.com>
In-Reply-To: <20250910204309.20751-30-james.morse@arm.com>
References: <20250910204309.20751-1-james.morse@arm.com>
	<20250910204309.20751-30-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_064158_714346_8BAEA42C 
X-CRM114-Status: GOOD (  24.80  )
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

On Wed, 10 Sep 2025 20:43:09 +0000
James Morse <james.morse@arm.com> wrote:

> When features are mismatched between MSC the way features are combined
> to the class determines whether resctrl can support this SoC.
> 
> Add some tests to illustrate the sort of thing that is expected to
> work, and those that must be removed.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
Nice in general though I didn't go through the test expected results etc.
A few comments inline.

Thanks and looking forward to seeing this go in.

Jonathan

> ---
> Changes since v1:
>  * Waggled some words in comments.
>  * Moved a bunch of variables to be global - shuts up a compiler warning.
> ---
>  drivers/resctrl/mpam_internal.h     |   8 +-
>  drivers/resctrl/test_mpam_devices.c | 321 ++++++++++++++++++++++++++++
>  2 files changed, 328 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 7cbcafe8294a..6119e4573187 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -20,6 +20,12 @@
>  
>  DECLARE_STATIC_KEY_FALSE(mpam_enabled);
>  
> +#ifdef CONFIG_MPAM_KUNIT_TEST
> +#define PACKED_FOR_KUNIT __packed
> +#else
> +#define PACKED_FOR_KUNIT
> +#endif
> +
>  static inline bool mpam_is_enabled(void)
>  {
>  	return static_branch_likely(&mpam_enabled);
> @@ -189,7 +195,7 @@ struct mpam_props {
>  	u16			dspri_wd;
>  	u16			num_csu_mon;
>  	u16			num_mbwu_mon;
> -};
> +} PACKED_FOR_KUNIT;

Add a comment on 'why'.

>  
>  #define mpam_has_feature(_feat, x)	((1 << (_feat)) & (x)->features)
>  
> diff --git a/drivers/resctrl/test_mpam_devices.c b/drivers/resctrl/test_mpam_devices.c
> index 3e7058f7601c..4eca8590c691 100644
> --- a/drivers/resctrl/test_mpam_devices.c
> +++ b/drivers/resctrl/test_mpam_devices.c
> @@ -4,6 +4,325 @@
>  
>  #include <kunit/test.h>
>  
> +/*
> + * This test catches fields that aren't being sanitised - but can't tell you
> + * which one...
> + */
> +static void test__props_mismatch(struct kunit *test)
> +{
> +	struct mpam_props parent = { 0 };
> +	struct mpam_props child;
> +
> +	memset(&child, 0xff, sizeof(child));
> +	__props_mismatch(&parent, &child, false);
> +
> +	memset(&child, 0, sizeof(child));
> +	KUNIT_EXPECT_EQ(test, memcmp(&parent, &child, sizeof(child)), 0);
> +
> +	memset(&child, 0xff, sizeof(child));
> +	__props_mismatch(&parent, &child, true);
> +
> +	KUNIT_EXPECT_EQ(test, memcmp(&parent, &child, sizeof(child)), 0);
> +}
> +
> +static struct list_head fake_classes_list;
> +static struct mpam_class fake_class = { 0 };
> +static struct mpam_component fake_comp1 = { 0 };
> +static struct mpam_component fake_comp2 = { 0 };
> +static struct mpam_vmsc fake_vmsc1 = { 0 };
> +static struct mpam_vmsc fake_vmsc2 = { 0 };
> +static struct mpam_msc fake_msc1 = { 0 };
> +static struct mpam_msc fake_msc2 = { 0 };
> +static struct mpam_msc_ris fake_ris1 = { 0 };
> +static struct mpam_msc_ris fake_ris2 = { 0 };
> +static struct platform_device fake_pdev = { 0 };
> +
> +static void test_mpam_enable_merge_features(struct kunit *test)
> +{
> +#define RESET_FAKE_HIEARCHY()	do {				\
> +	INIT_LIST_HEAD(&fake_classes_list);			\
> +								\
> +	memset(&fake_class, 0, sizeof(fake_class));		\

Maybe just use a function?  Seems to be changing stuff that is
global mostly anyway so seems like it won't need large numbers
of parameters or anything like that.

> +	fake_class.level = 3;					\
> +	fake_class.type = MPAM_CLASS_CACHE;			\
> +	INIT_LIST_HEAD_RCU(&fake_class.components);		\
> +	INIT_LIST_HEAD(&fake_class.classes_list);		\
> +								\
> +	memset(&fake_comp1, 0, sizeof(fake_comp1));		\
> +	memset(&fake_comp2, 0, sizeof(fake_comp2));		\
> +	fake_comp1.comp_id = 1;					\
> +	fake_comp2.comp_id = 2;					\
> +	INIT_LIST_HEAD(&fake_comp1.vmsc);			\
> +	INIT_LIST_HEAD(&fake_comp1.class_list);			\
> +	INIT_LIST_HEAD(&fake_comp2.vmsc);			\
> +	INIT_LIST_HEAD(&fake_comp2.class_list);			\
> +								\
> +	memset(&fake_vmsc1, 0, sizeof(fake_vmsc1));		\
> +	memset(&fake_vmsc2, 0, sizeof(fake_vmsc2));		\
> +	INIT_LIST_HEAD(&fake_vmsc1.ris);			\
> +	INIT_LIST_HEAD(&fake_vmsc1.comp_list);			\
> +	fake_vmsc1.msc = &fake_msc1;				\
> +	INIT_LIST_HEAD(&fake_vmsc2.ris);			\
> +	INIT_LIST_HEAD(&fake_vmsc2.comp_list);			\
> +	fake_vmsc2.msc = &fake_msc2;				\
> +								\
> +	memset(&fake_ris1, 0, sizeof(fake_ris1));		\
> +	memset(&fake_ris2, 0, sizeof(fake_ris2));		\
> +	fake_ris1.ris_idx = 1;					\
> +	INIT_LIST_HEAD(&fake_ris1.msc_list);			\
> +	fake_ris2.ris_idx = 2;					\
> +	INIT_LIST_HEAD(&fake_ris2.msc_list);			\
> +								\
> +	fake_msc1.pdev = &fake_pdev;				\
> +	fake_msc2.pdev = &fake_pdev;				\
> +								\
> +	list_add(&fake_class.classes_list, &fake_classes_list);	\
> +} while (0)
> +
> +	RESET_FAKE_HIEARCHY();
> +
> +	mutex_lock(&mpam_list_lock);
> +
> +	/* One Class+Comp, two RIS in one vMSC with common features */
> +	fake_comp1.class = &fake_class;
> +	list_add(&fake_comp1.class_list, &fake_class.components);
> +	fake_comp2.class = NULL;
> +	fake_vmsc1.comp = &fake_comp1;
> +	list_add(&fake_vmsc1.comp_list, &fake_comp1.vmsc);
> +	fake_vmsc2.comp = NULL;
> +	fake_ris1.vmsc = &fake_vmsc1;
> +	list_add(&fake_ris1.vmsc_list, &fake_vmsc1.ris);
> +	fake_ris2.vmsc = &fake_vmsc1;
> +	list_add(&fake_ris2.vmsc_list, &fake_vmsc1.ris);
> +
> +	mpam_set_feature(mpam_feat_cpor_part, &fake_ris1.props);
> +	mpam_set_feature(mpam_feat_cpor_part, &fake_ris2.props);
> +	fake_ris1.props.cpbm_wd = 4;
> +	fake_ris2.props.cpbm_wd = 4;
> +
> +	mpam_enable_merge_features(&fake_classes_list);
> +
> +	KUNIT_EXPECT_TRUE(test, mpam_has_feature(mpam_feat_cpor_part, &fake_class.props));
> +	KUNIT_EXPECT_EQ(test, fake_class.props.cpbm_wd, 4);
> +
> +	RESET_FAKE_HIEARCHY();



