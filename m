Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8577CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 19:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LfAw6m2PbREHafgR0eQ3z90an64dhc3G5xAmXUhmUi8=; b=gB0CkHOTGmK5Nw3MSl+2WWzYh+
	dCGqnlvXdcEba5FGzKkFiEUJPLhvBvic4KYofoTy4/vBd/+c2DXXjB8ijg2JU+uFcQ+226S1/+Ntd
	Nsi9b3zV536X5Xi5sVLUEONY1ZhbgvcjHdWbFnW3lPi6i4soTwIkRNze00zcPr77144+WG0wnUW9z
	Q93DdCIp1rHlssGRBG3cJ+AflOYgYyYMPS8HefdxIcFvqqcyCxsc987uPRYMs6lfcm+mfpXcu/9C6
	4QLkLDrPxPE2dc1JTOUcZNMTPRZVAkhfMR/Z9dYjK965WxMvEq4Syf/m0P+76f36mpN/0bDLfFojA
	FNrDZuug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQXD-0000000GIhK-18ZW;
	Wed, 10 Sep 2025 19:31:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQX9-0000000GIdY-3dZ8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 19:31:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E824016F2;
	Wed, 10 Sep 2025 12:31:02 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC36D3F694;
	Wed, 10 Sep 2025 12:31:04 -0700 (PDT)
Message-ID: <4d7a9b82-9d96-4796-949d-d32c02b6af28@arm.com>
Date: Wed, 10 Sep 2025 20:31:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 33/33] arm_mpam: Add kunit tests for props_mismatch()
To: Ben Horgan <ben.horgan@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-34-james.morse@arm.com>
 <ceb64a9b-0ffe-4193-942e-5ddf71478e5d@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <ceb64a9b-0ffe-4193-942e-5ddf71478e5d@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_123112_025677_0AA2AB81 
X-CRM114-Status: GOOD (  13.47  )
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

Hi Ben,

On 29/08/2025 18:11, Ben Horgan wrote:
> The tests seem reasonable. Just some comments on the comments.
> 
> On 8/22/25 16:30, James Morse wrote:
>> When features are mismatched between MSC the way features are combined
>> to the class determines whether resctrl can support this SoC.
>>
>> Add some tests to illustrate the sort of thing that is expected to
>> work, and those that must be removed.

>> diff --git a/drivers/resctrl/test_mpam_devices.c b/drivers/resctrl/test_mpam_devices.c
>> index 8e9d6c88171c..ef39696e7ff8 100644
>> --- a/drivers/resctrl/test_mpam_devices.c
>> +++ b/drivers/resctrl/test_mpam_devices.c
>> @@ -4,6 +4,326 @@
>> +static void test_mpam_enable_merge_features(struct kunit *test)
>> +{

[...]

>> +	/* One Class+Comp, two MSC with non-overlapping features */
>> +	fake_comp1.class = &fake_class;
>> +	list_add(&fake_comp1.class_list, &fake_class.components);
>> +	fake_comp2.class = NULL;
>> +	fake_vmsc1.comp = &fake_comp1;
>> +	list_add(&fake_vmsc1.comp_list, &fake_comp1.vmsc);
>> +	fake_vmsc2.comp = &fake_comp1;
>> +	list_add(&fake_vmsc2.comp_list, &fake_comp1.vmsc);
>> +	fake_ris1.vmsc = &fake_vmsc1;
>> +	list_add(&fake_ris1.vmsc_list, &fake_vmsc1.ris);
>> +	fake_ris2.vmsc = &fake_vmsc2;
>> +	list_add(&fake_ris2.vmsc_list, &fake_vmsc2.ris);
>> +
>> +	mpam_set_feature(mpam_feat_cpor_part, &fake_ris1.props);
>> +	mpam_set_feature(mpam_feat_cmax_cmin, &fake_ris2.props);
>> +	fake_ris1.props.cpbm_wd = 4;
>> +	fake_ris2.props.cmax_wd = 4;
>> +
>> +	mpam_enable_merge_features(&fake_classes_list);
>> +
>> +	/*
>> +	 * Multiple RIS in different MSC can't the same resource, mismatched

> s/can't the same/can't control the same/

Thanks,


>> +	 * features can not be supported.
>> +	 */
>> +	KUNIT_EXPECT_FALSE(test, mpam_has_feature(mpam_feat_cpor_part, &fake_class.props));
>> +	KUNIT_EXPECT_FALSE(test, mpam_has_feature(mpam_feat_cmax_cmin, &fake_class.props));
>> +	KUNIT_EXPECT_EQ(test, fake_class.props.cpbm_wd, 0);
>> +	KUNIT_EXPECT_EQ(test, fake_class.props.cmax_wd, 0);
>> +
>> +	RESET_FAKE_HIEARCHY();
>> +
>> +	/* One Class+Comp, two MSC with incompatible overlapping features */
>> +	fake_comp1.class = &fake_class;
>> +	list_add(&fake_comp1.class_list, &fake_class.components);
>> +	fake_comp2.class = NULL;
>> +	fake_vmsc1.comp = &fake_comp1;
>> +	list_add(&fake_vmsc1.comp_list, &fake_comp1.vmsc);
>> +	fake_vmsc2.comp = &fake_comp1;
>> +	list_add(&fake_vmsc2.comp_list, &fake_comp1.vmsc);
>> +	fake_ris1.vmsc = &fake_vmsc1;
>> +	list_add(&fake_ris1.vmsc_list, &fake_vmsc1.ris);
>> +	fake_ris2.vmsc = &fake_vmsc2;
>> +	list_add(&fake_ris2.vmsc_list, &fake_vmsc2.ris);
>> +
>> +	mpam_set_feature(mpam_feat_cpor_part, &fake_ris1.props);
>> +	mpam_set_feature(mpam_feat_cpor_part, &fake_ris2.props);
>> +	mpam_set_feature(mpam_feat_mbw_part, &fake_ris1.props);
>> +	mpam_set_feature(mpam_feat_mbw_part, &fake_ris2.props);
>> +	fake_ris1.props.cpbm_wd = 5;
>> +	fake_ris2.props.cpbm_wd = 3;
>> +	fake_ris1.props.mbw_pbm_bits = 5;
>> +	fake_ris2.props.mbw_pbm_bits = 3;
>> +
>> +	mpam_enable_merge_features(&fake_classes_list);
>> +
>> +	/*
>> +	 * Multiple RIS in different MSC can't the same resource, mismatched
>> +	 * features can not be supported.
>> +	 */

> Missing the word "control" again.

Copy and paste!


>> +	KUNIT_EXPECT_FALSE(test, mpam_has_feature(mpam_feat_cpor_part, &fake_class.props));
>> +	KUNIT_EXPECT_FALSE(test, mpam_has_feature(mpam_feat_mbw_part, &fake_class.props));
>> +	KUNIT_EXPECT_EQ(test, fake_class.props.cpbm_wd, 0);
>> +	KUNIT_EXPECT_EQ(test, fake_class.props.mbw_pbm_bits, 0);
>> +
>> +	RESET_FAKE_HIEARCHY();
>> +
>> +	/* One Class+Comp, two MSC with overlapping features that need tweaking */
>> +	fake_comp1.class = &fake_class;
>> +	list_add(&fake_comp1.class_list, &fake_class.components);
>> +	fake_comp2.class = NULL;
>> +	fake_vmsc1.comp = &fake_comp1;
>> +	list_add(&fake_vmsc1.comp_list, &fake_comp1.vmsc);
>> +	fake_vmsc2.comp = &fake_comp1;
>> +	list_add(&fake_vmsc2.comp_list, &fake_comp1.vmsc);
>> +	fake_ris1.vmsc = &fake_vmsc1;
>> +	list_add(&fake_ris1.vmsc_list, &fake_vmsc1.ris);
>> +	fake_ris2.vmsc = &fake_vmsc2;
>> +	list_add(&fake_ris2.vmsc_list, &fake_vmsc2.ris);
>> +
>> +	mpam_set_feature(mpam_feat_mbw_min, &fake_ris1.props);
>> +	mpam_set_feature(mpam_feat_mbw_min, &fake_ris2.props);
>> +	mpam_set_feature(mpam_feat_cmax_cmax, &fake_ris1.props);
>> +	mpam_set_feature(mpam_feat_cmax_cmax, &fake_ris2.props);
>> +	fake_ris1.props.bwa_wd = 5;
>> +	fake_ris2.props.bwa_wd = 3;
>> +	fake_ris1.props.cmax_wd = 5;
>> +	fake_ris2.props.cmax_wd = 3;
>> +
>> +	mpam_enable_merge_features(&fake_classes_list);
>> +
>> +	/*
>> +	 * Multiple RIS in different MSC can't the same resource, mismatched
>> +	 * features can not be supported.
>> +	 */

> Comment is for a different case.

Fixed as:
	/*
	 * RIS with different control properties need to be sanitised so the
	 * class has the common set of properties.
	 */


>> +	KUNIT_EXPECT_TRUE(test, mpam_has_feature(mpam_feat_mbw_min, &fake_class.props));
>> +	KUNIT_EXPECT_TRUE(test, mpam_has_feature(mpam_feat_cmax_cmax, &fake_class.props));
>> +	KUNIT_EXPECT_EQ(test, fake_class.props.bwa_wd, 3);
>> +	KUNIT_EXPECT_EQ(test, fake_class.props.cmax_wd, 3);


Thanks,

James

