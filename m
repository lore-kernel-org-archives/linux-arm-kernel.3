Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9F5CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 07:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j7OoOHB9ZeRPphxXVnwAj4bNVeeDK0KkFiEVcVNSXqU=; b=Rk2EtJ0q4yZn4Ysguq5mvbuRdc
	4PBCBzcSsVNnLVE8g9UvYkWCPd1+mEFX1xneQy864BWppevk4MdgiQZt7Jup8w8zP3Re/kCS+dxnX
	LSITAx05hCa1R6CS1bx0jRUyazDilvBI1jN7lNmQNXmuk/0CgRP+YzmpTtaEB6pJ5NOerZ2WArNJA
	dMQQVo1BQq831FN5m1vyKNouBUxa/ph01qFraRFCwWrLldjNIbweWuk2HVYqZrXX2nircdJ4i/21Z
	yVSdPCaa+zGRnxvev0Q1Wx36FEnSRrzGFdB/gb5BrVwswwuExmQz8s6vVXxNBodpx88ZhIi5Og8oD
	oAixdXsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKWuq-000000003pS-3dQz;
	Wed, 06 May 2026 07:43:32 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKWup-000000003p1-2iL3
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 06 May 2026 07:43:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=j7OoOHB9ZeRPphxXVnwAj4bNVeeDK0KkFiEVcVNSXqU=; b=Lf21GeJrNBgcTy7CCLIILg+XyL
	ct2vMy9UTG7kDOeDzWh+NCyfzRYlDsd6/F3RP00nOYKsB84WGJkvT9ej3AQMNB7qTs3/OqRc4f+zK
	cIu3+sPuiAMLOuF3ZGAGASwXzWhtrGMlkGTpFRUVDRKpWS/mObmWr9Ofmo2IwZj/sQM7B0WscpT41
	RVfTApVphvZsLdrztbbBRZEHPeETZHd77/XL8Y8pl9KsXkB46JDZws1ZuGnptKIlgKF0jAfojlZ4N
	gTLrE3jxABw8o3QPPXKlB2gEERiqOGz9KFsK0aCMWIFYjvUT+tJUdzMtum5JZH/9z6eoUbl4FEje/
	wd24hDiQ==;
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKWWa-00000000pHw-2MaQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 07:18:31 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=j7OoOHB9ZeRPphxXVnwAj4bNVeeDK0KkFiEVcVNSXqU=;
	b=YNVZl++ulB7Lj+02fluir6bwhbtbxqLMkPxn2pz6YWGVOXXm6saH+jt7RQqwZU12KHe1Is2Rh
	RRqUA9DRKbaUlfL2QrdDiPZs+Cs8pMYDuZFAD4sgMtBDdKs/UrbAJ/5SbrU4Wz6Ju4uWhs070Dm
	5kW4p86Fc5a5TcUqPb3OrXQ=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4g9RPj28kwzmV69;
	Wed,  6 May 2026 15:11:21 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id DF5934048B;
	Wed,  6 May 2026 15:17:53 +0800 (CST)
Received: from [10.67.120.222] (10.67.120.222) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 6 May 2026 15:17:53 +0800
Message-ID: <e4a2b49a-0efe-4942-9683-9c9a5af1b12a@huawei.com>
Date: Wed, 6 May 2026 15:17:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] selftests/resctrl: Introduced linked list
 management for IMC counters
To: Reinette Chatre <reinette.chatre@intel.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <jonathan.cameron@huawei.com>, <zengheng4@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260410093352.3988125-1-wuyifan50@huawei.com>
 <20260410093352.3988125-2-wuyifan50@huawei.com>
 <b1d3a653-79a5-44db-8d57-c052ae537823@intel.com>
From: wuyifan <wuyifan50@huawei.com>
In-Reply-To: <b1d3a653-79a5-44db-8d57-c052ae537823@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.222]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_081829_452373_AA832EC3 
X-CRM114-Status: GOOD (  10.79  )
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

Hi Reinette,

On 4/23/2026 12:02 AM, Reinette Chatre wrote:
> Hi Yifan,
>
> On 4/10/26 2:33 AM, Yifan Wu wrote:
>> @@ -113,6 +115,7 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
>>   				    unsigned int *count)
>>   {
>>   	char imc_events_dir[PATH_MAX], imc_counter_cfg[PATH_MAX];
>> +	struct imc_counter_config *imc_counter;
>>   	unsigned int orig_count = *count;
>>   	char cas_count_cfg[1024];
>>   	struct dirent *ep;
>> @@ -167,11 +170,17 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
>>   			ksft_print_msg("Maximum iMC count exceeded\n");
>>   			goto out_close;
>>   		}
>> +		imc_counter = calloc(1, sizeof(*imc_counter));
>> +		if (!imc_counter) {
>> +			ksft_perror("Unable to allocate memory for iMC counters\n");
>> +			goto out_close;
>> +		}
>>   
>>   		imc_counters_config[*count].type = type;
>>   		get_read_event_and_umask(cas_count_cfg, *count);
>>   		/* Do not fail after incrementing *count. */
>>   		*count += 1;
>> +		list_add(&imc_counter->entry, &imc_counters_list);
>>   	}
>>   	if (*count == orig_count) {
>>   		ksft_print_msg("Unable to find events in %s\n", imc_events_dir);
> Should cleanup_read_mem_bw_imc() be called on error exit path?
Thank you for your suggestion. When parse_imc_read_bw_events() exits with an
error, the linked list imc_counters_list will be cleaned up in 
test_cleanup().

main()
└── run_single_test()
     ├── mbm_run_test()
     │   └── resctrl_val()
     │       └── mbm_init()
     │           └── initialize_read_mem_bw_imc()
     │               └── enumerate_imcs()
     │                   └── read_from_imc_dir()
     │                       └── parse_imc_read_bw_events()
     │                           └── calloc()
     └── test_cleanup()
         └── mbm_test_cleanup()
             └── cleanup_read_mem_bw_imc()

Calling cleanup_read_mem_bw_imc() in the error exit path may be intended
to prevent resource leaks. However, this results in the function being 
called
repeatedly in both the error exit branch and test_cleanup().

Is there any specific intention behind calling it in 
parse_imc_read_bw_events()?
Or should the cleanup be uniformly handled in test_cleanup()?

Yifan



