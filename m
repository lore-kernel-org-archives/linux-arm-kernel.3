Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D007C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 17:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XdsCmzlviAN7D8zW7RN1bkzetwH59L+fJQ05vlqmlxk=; b=v8gQGMMrhaYJMw+ffBEsDY7Fed
	jaTL8c5CDfgmKpYmneiehM7sn3hjt/wwHmhYLXWgYuwTQ9K1v7liYeZ2+3DvJ6DlYKMUt1hDl794r
	uXF7p9xlKRrx7P/sF0RvDAILGn4DGUuLZnsKtX4oShIb90EzWEDwSO4g8pCsN+NNd3nRFZTwe2/ip
	bqe7GQASwJWp5PeHt5gonNFz6LVfC2nI09Lu0iYRaFoJ5nJ4mkTVludDweWtV70PtRb1RzPmxWWlb
	0NaqHu0ni2lQppPQ2shWVaVjuNxAM47samisDTV6HcyTQ6t/l55W8lAFjiIscvaqlaAFakLLiWynh
	NCHF5B7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOgG6-00000004nv1-13ev;
	Mon, 09 Jun 2025 17:26:06 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfRU-00000004gSL-24iz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 16:33:50 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559Fxc8D010757;
	Mon, 9 Jun 2025 18:33:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	XdsCmzlviAN7D8zW7RN1bkzetwH59L+fJQ05vlqmlxk=; b=l5x8CTLtU5RADRo6
	SxU13ZIwSRejlojuW9TaZ6uGJVu49k/9cAUsTCzU6JM1hW+eEUkHZOmqDCmbDvW/
	Rlgk3Q1Qw0Ec6ZUMpHN3ajvuStAjAiSDldeDTaB80zeSD8ZjKgXncHounqKYRxlq
	KYsC5TyOe6AsBUlnqsXBz8lAdCYM3qZbLL99yUJrs1vEkXngi73WG39pYvYnWVSC
	O1sUpZeXV3Q2exKZD7j1bWn2VF37XEfHzvFOqHeo7H0zl8vcv1KHTks1Z7m61pn7
	pQTUsZLgeyVgnJLFNYeuKhcmQs37PTvi932ECEProqA/gJ1Oc0yytWrPqRNHkIdS
	61sKNQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cahfx2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 18:33:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 26A7D400CF;
	Mon,  9 Jun 2025 18:32:19 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 70948BF25F3;
	Mon,  9 Jun 2025 18:30:09 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 18:30:09 +0200
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 18:30:08 +0200
Message-ID: <7850c6f4-6a6f-4934-895d-9ec0688cda2a@foss.st.com>
Date: Mon, 9 Jun 2025 18:30:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v16 0/6] Introduction of a remoteproc tee to load
 signed firmware
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Jens Wiklander
	<jens.wiklander@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <op-tee@lists.trustedfirmware.org>, <devicetree@vger.kernel.org>
References: <20250603100808.1074812-1-arnaud.pouliquen@foss.st.com>
 <aEb8XbhY5dR__GM-@p14s>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <aEb8XbhY5dR__GM-@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.121]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_02,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_093349_027046_6D23F91B 
X-CRM114-Status: GOOD (  24.56  )
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

Hello Mathieu,

On 6/9/25 17:23, Mathieu Poirier wrote:
> On Tue, Jun 03, 2025 at 12:08:02PM +0200, Arnaud Pouliquen wrote:
>> Hello Bjorn and Mathieu,
>>
>> I am resending this series after waiting for over two months for Bjorn's
>> feedback, despite a prior reminder.
>>
>> Please could you coordinate between yourselves to determine who will continue
>> reviewing this series? It would be greatly appreciated if the review could
>> proceed within a more reasonable timeframe.
>>
>> Thanks in advance and best regards,
>> Arnaud
>>
>>
>> Main updates from version V15[1]:
>> - Removed the rproc_ops:load_fw() operation introduced in the previous version.
>> - Returned to managing the remoteproc firmware loading in rproc_tee_parse_fw to
>>   load and authenticate the firmware before getting the resource table.
>> - Added spinlock and dev_link mechanisms in remoteproc TEE to better manage
>>   bind/unbind.
>>
> 
> Have all pending issues been resolved or is there still questions about some
> aspects of the design?
>  

No pending issues on my side.

In terms of design, I resend an equivalent of the V13 design incorporating
Bjorn's comments on V15.
The pending questions are:
- is that V13/V16 is aligned with Bjorn's expectations[1].
- are you also aligned on this design even if you proposed an alternative that
  implemented in V14 and V15
Few details on the V13/V16 design:

The main point of discussion is the rproc_tee_parse_fw() implementation.
In V13, this function loaded the firmware and then parses the resource table.

You proposed an alternative, to add a new rproc->load ops
in the remoteproc core instead (implemented in V14 and V15).
Bjorn expressed concerns about this and proposed a solution that, from my
understanding, is equivalent to the V13 implementation.

Thanks,
Arnaud


[1] https://lkml.org/lkml/2025/3/5/906

>> More details are available in each patch commit message.
>>
>> [1] https://lore.kernel.org/linux-remoteproc/20241128084219.2159197-7-arnaud.pouliquen@foss.st.com/T/
>>
>> Tested-on: commit 0ff41df1cb26 ("Linux 6.15")
>>
>> Description of the feature:
>> --------------------------
>> This series proposes the implementation of a remoteproc tee driver to
>> communicate with a TEE trusted application responsible for authenticating
>> and loading the remoteproc firmware image in an Arm secure context.
>>
>> 1) Principle:
>>
>> The remoteproc tee driver provides services to communicate with the OP-TEE
>> trusted application running on the Trusted Execution Context (TEE).
>> The trusted application in TEE manages the remote processor lifecycle:
>>
>> - authenticating and loading firmware images,
>> - isolating and securing the remote processor memories,
>> - supporting multi-firmware (e.g., TF-M + Zephyr on a Cortex-M33),
>> - managing the start and stop of the firmware by the TEE.
>>
>> 2) Format of the signed image:
>>
>> Refer to:
>> https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/src/remoteproc_core.c#L18-L57
>>
>> 3) OP-TEE trusted application API:
>>
>> Refer to:
>> https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/include/ta_remoteproc.h
>>
>> 4) OP-TEE signature script
>>
>> Refer to:
>> https://github.com/OP-TEE/optee_os/blob/master/scripts/sign_rproc_fw.py
>>
>> Example of usage:
>> sign_rproc_fw.py --in <fw1.elf> --in <fw2.elf> --out <signed_fw.sign> --key ${OP-TEE_PATH}/keys/default.pem
>>
>>
>> 5) Impact on User space Application
>>
>> No sysfs impact. The user only needs to provide the signed firmware image
>> instead of the ELF image.
>>
>>
>> For more information about the implementation, a presentation is available here
>> (note that the format of the signed image has evolved between the presentation
>> and the integration in OP-TEE).
>>
>> https://resources.linaro.org/en/resource/6c5bGvZwUAjX56fvxthxds
>>
>> Arnaud Pouliquen (6):
>>   remoteproc: core: Introduce rproc_pa_to_va helper
>>   remoteproc: Add TEE support
>>   remoteproc: Introduce release_fw optional operation
>>   dt-bindings: remoteproc: Add compatibility for TEE support
>>   remoteproc: stm32: Create sub-functions to request shutdown and
>>     release
>>   remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
>>
>>  .../bindings/remoteproc/st,stm32-rproc.yaml   |  58 +-
>>  drivers/remoteproc/Kconfig                    |  10 +
>>  drivers/remoteproc/Makefile                   |   1 +
>>  drivers/remoteproc/remoteproc_core.c          |  52 ++
>>  drivers/remoteproc/remoteproc_internal.h      |   6 +
>>  drivers/remoteproc/remoteproc_tee.c           | 619 ++++++++++++++++++
>>  drivers/remoteproc/stm32_rproc.c              | 139 +++-
>>  include/linux/remoteproc.h                    |   4 +
>>  include/linux/remoteproc_tee.h                |  90 +++
>>  9 files changed, 935 insertions(+), 44 deletions(-)
>>  create mode 100644 drivers/remoteproc/remoteproc_tee.c
>>  create mode 100644 include/linux/remoteproc_tee.h
>>
>>
>> base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
>> -- 
>> 2.25.1
>>

