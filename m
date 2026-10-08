Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CFFCA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 11:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tXgVHNq34Cx58izcfCmTHFSdqJ5kRhjjCGeXQDHXIK8=; b=vpR9RAbyNNy56coGZOaUEZWHc5
	gB3iJjuUgCr8ozK1IbmzSGCURC6jdz5x5JFxCAPNyFwK4FFR/myETrFEKSv+XCy1wWufb/9Av2GPV
	EqDx1pFEXiOR7Emb8EElgC/XjzBIwBmiNlPrubF6a4nyt15ORfzZts7rGkcgH7JX51cgBIRcL1mKi
	Lu4O43NCaMktfCZri0UkcrChRXHKkc6oxqF//xS5rKs3gNKizJzNtVfHhPzOMIkERmNmXDqUA7jFv
	t1Rq99XQk/MpBScIkx2YxLRCaYieYALdsGGEdtOtaIi3AwSVGEz95SJSNA0qX149AWRgJF9yGOBRM
	LP/1wEAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEm2E-00000004DPs-3KaQ;
	Thu, 08 Oct 2026 11:11:38 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEm2A-00000004DP3-3HBc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 11:11:37 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=tXgVHNq34Cx58izcfCmTHFSdqJ5kRhjjCGeXQDHXIK8=;
	b=Ft0QBMsSVQYqUZD2YC9zkdhZdAW35YyO9EfbpIpQVWVdAT75B/EJzmIPHUvK6EClRaawe0i0E
	1BtlxpVBKkag1/23BUXi3zgCLK6KGuAV+6/rqzo2Bf2VWGZteXUhxlY7BsYisIKt5wIjBbH/e2J
	+hPsdMqBgSkdZadKel16hj0=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4j0n6s124wz1prNF;
	Thu,  8 Oct 2026 18:59:01 +0800 (CST)
Received: from kwepemo100015.china.huawei.com (unknown [7.202.195.69])
	by mail.maildlp.com (Postfix) with ESMTPS id 4C47D203C1;
	Thu,  8 Oct 2026 19:11:17 +0800 (CST)
Received: from [10.67.111.244] (10.67.111.244) by
 kwepemo100015.china.huawei.com (7.202.195.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 8 Oct 2026 19:11:16 +0800
Message-ID: <9e74ff9d-e8a3-425e-bf7c-f973d06e6cdf@huawei.com>
Date: Thu, 8 Oct 2026 19:10:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/3] security: ima: support TSM measurement registers
To: Yeoreum Yun <yeoreum.yun@arm.com>, Roberto Sassu
	<roberto.sassu@huaweicloud.com>
CC: <linux-coco@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Eric Snowberg
	<eric.snowberg@oracle.com>, <linux-integrity@vger.kernel.org>,
	<linux-security-module@vger.kernel.org>, Dan Williams <djbw@kernel.org>, Mimi
 Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, Dmitry
 Kasatkin <dmitry.kasatkin@gmail.com>, Paul Moore <paul@paul-moore.com>, James
 Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Suzuki
 Poulose <suzuki.poulose@arm.com>, Steven Price <steven.price@arm.com>, Sami
 Mujawar <sami.mujawar@arm.com>, Aneesh Kumar K.V <aneesh.kumar@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>
References: <20260930-ima_tgx_integration_v2-v1-0-722c35370548@arm.com>
 <ebe68f6463f8ece8a5cd8ce70bba292ec4f64a41.camel@huaweicloud.com>
 <c4fe5315d70fc162f1e5648e3fccb1676710d5e6.camel@huaweicloud.com>
 <ar5tOUor0bp3MtQ6@e129823.arm.com>
Content-Language: en-US
From: GONG Ruiqi <gongruiqi1@huawei.com>
In-Reply-To: <ar5tOUor0bp3MtQ6@e129823.arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.111.244]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemo100015.china.huawei.com (7.202.195.69)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_041135_414362_D4F79F8C 
X-CRM114-Status: GOOD (  19.24  )
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



On 10/1/2026 10:24 PM, Yeoreum Yun wrote:
> Hi Roberto,
> 
>> On Thu, 2026-10-01 at 13:27 +0200, Roberto Sassu wrote:
>>> On Wed, 2026-09-30 at 14:43 +0100, Yeoreum Yun wrote:
>>>> Confidential computing guests without a TPM can use TSM measurement
>>>> registers to record IMA measurement digests instead of TPM PCRs.
>>
>> + Gong Ruiqi, of course.
>>
>> Roberto

Hi Roberto,

Thank you for involving me!

>>
>>> Hi Yeoreum
>>>
>>> a similar patch set has been sent to the linux-integrity mailing list:
>>>
>>> https://lore.kernel.org/linux-integrity/20250630125928.765285-1-gongruiqi1@huawei.com/
>>>
>>> Could you please work with Gong Ruiqi to have a unified proposal?
>>>
>>> Thanks
>>>
>>> Roberto
>>>
> 
> Thanks for letting me know and I think the proposal is almost the same
> with the different terminology only.
> 
> @Gong, what do you think?

Hi Yeoreum,

Nice to see this topic picked up again — I'm glad the IMA RoT framework
series I posted last year is still of interest.

Yes, I'd be happy to work with you on a unified proposal. It's been a
while since I last worked on that series, so I'll first revisit my
previous patch set, and then follow up with you to discuss the code details.

Looking forward to working with you.

BR,
Ruiqi

> 
>>>> This series introduces in-kernel interfaces for accessing TSM
>>>> measurement registers, abstracts IMA's measurement-register operations,
>>>> and adds a TSM backend for Intel TDX and Arm CCA.
>>>>
>>>> The following mappings between TPM PCR indices and TSM measurement
>>>> registers are defined for Intel TDX [0] and proposed for Arm CCA [1]:
>>>>
>>>>   TPM PCR index | Intel TDX register | Arm CCA register
>>>>   --------------+--------------------+-----------------
>>>>   0             | MRTD               | RIM
>>>>   1, 7          | RTMR[0]            | REM[0]
>>>>   2-6           | RTMR[1]            | REM[1]
>>>>   8-15          | RTMR[2]            | REM[2]
>>>>
>>>> These mappings allow IMA to translate PCR indices into the corresponding
>>>> TSM measurement registers.
>>>>
>>>> The TPM backend remains preferred when it is available at IMA
>>>> initialization. Otherwise, IMA falls back to a supported TSM backend.
>>>> Only one backend is selected; IMA measurements are not extended to both
>>>> TPM PCRs and TSM measurement registers.
>>>>
>>>> The attestation proccess for guest with TSM measurement register will
>>>> be done with Confidential Compute Event Log (CCEL) which is exported by
>>>> /sys/firmware/acpi/tables/data/CCEL. Here is brief process in arm64:
>>>>
>>>>   Verifier                 Realm guest              RMM / Platform
>>>>      |                         |                           |
>>>>      |--- Challenge (nonce) -->|                           |
>>>>      |                         |--- Request token -------->|
>>>>      |                         |    with challenge         |
>>>>      |                         |                           |
>>>>      |                         |<-- CCA token T -----------|
>>>>      |<-- CCA token T ---------|                           |
>>>>      |<-- CCEL event log ------|                           |
>>>>      |<-- IMA measurement log -|                           |
>>>>      |                         |                           |
>>>>  Verify token T:               |                           |
>>>>   - signatures                 |                           |
>>>>   - Platform/Realm             |                           |
>>>>     token binding              |                           |
>>>>   - challenge freshness        |                           |
>>>>   - platform/RIM policy        |                           |
>>>>   - verify measurement logs    |                           |
>>>>      |                         |                           |
>>>>      | ----ACCEPT / REJECT---->|                           |
>>>>
>>>> This patch based on arm-cca-mr series [3].
>>>>
>>>> Link: [0] https://uefi.org/specs/UEFI/2.11/38_Confidential_Computing.html#intel-trust-domain-extension
>>>> Link: [1] https://github.com/tianocore/edk2/issues/11383
>>>> Link: [2] https://github.com/tianocore/edk2/issues/11384
>>>> Link: [3] https://lore.kernel.org/all/20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com/
>>>>
>>>> ---
>>>> Yeoreum Yun (3):
>>>>       virt: coco: introduce tsm_default_tm() and tsm_mr_read()/write()
>>>>       security: IMA: introduce ima_mr structure
>>>>       security: IMA: use TSM measurement registers
>>>>
>>>>  drivers/virt/coco/guest/tsm-mr.c          | 159 +++++++++++++---
>>>>  include/linux/tsm-mr.h                    |  26 +++
>>>>  security/integrity/ima/Makefile           |   3 +-
>>>>  security/integrity/ima/ima.h              |   7 +-
>>>>  security/integrity/ima/ima_api.c          |   4 +-
>>>>  security/integrity/ima/ima_crypto.c       | 137 +++++---------
>>>>  security/integrity/ima/ima_fs.c           |  16 +-
>>>>  security/integrity/ima/ima_init.c         |   7 +-
>>>>  security/integrity/ima/ima_mr.c           |  48 +++++
>>>>  security/integrity/ima/ima_mr.h           |  76 ++++++++
>>>>  security/integrity/ima/ima_mr_tpm.c       | 155 ++++++++++++++++
>>>>  security/integrity/ima/ima_mr_tsm.c       | 290 ++++++++++++++++++++++++++++++
>>>>  security/integrity/ima/ima_queue.c        |  39 ++--
>>>>  security/integrity/ima/ima_template.c     |   4 +-
>>>>  security/integrity/ima/ima_template_lib.c |   2 +-
>>>>  15 files changed, 819 insertions(+), 154 deletions(-)
>>>> ---
>>>> base-commit: b561246f45174b7472c24b75358ea95bae72b7b8
>>>> change-id: 20260929-ima_tgx_integration_v2-1c54aeeaeaee
>>>>
>>>> Best regards,
>>
> 


