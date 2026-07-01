Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB64C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 06:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ofou19QbyrdcTBD9IzbCWECuazAfQMESoAqczJbChhE=; b=QQMV3kCX42JGTRjwYQa0C6ETO5
	yyXt/Nm4v5evtnHFRFKpi7ygc6uZNx7IH7PtIPh7TbdicDw3lhOMkp2lRSYtRLX7KWIXCzTFaZ2zH
	gYWHfDbrfTi1R8M+ZMG67/c/fk6KuKeVSK7KTlYI3qs9yKz8KBbukB9fsgKwGUP2t4JAPClGxSGky
	P7Fvre9hc1edmNzuXUB9Wk5SI3SYLCxy77V15mG65jU6MSg4t4pFBtne9RF+bKdLyt+6xOLEIqkh3
	FqvcJkLomnUqWuigSK4wCSa09tbFfzCRS7GhfQSFJW613YNFXWXkkKNjfTmyeHow4bkwVISB2RGi9
	8NdEsxMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weo7T-00000000lyw-326J;
	Wed, 01 Jul 2026 06:08:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weo7Q-00000000lyK-0DMg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 06:08:21 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lYKk059375
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Jul 2026 06:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ofou19QbyrdcTBD9IzbCWECuazAfQMESoAqczJbChhE=; b=CYIfQ9lsAw5/cTEO
	1n201Gl1zCy4ZOigz9S+E8V8B9IIR1fzed/x8bMvFM384f1/7dJNGI0tZFHeOnaY
	SqaLjvRpllfLIV1FV9h9jtMys5RRqdEw5FeLPw4mbII8Xa0eXQgkE79U2sJugKVB
	+NkQSFCvP6J0t7Lnptj6rBPmFupWVunwbrulFySwvHvQ4kkHEnjJlzGcatoq1hvh
	fAejf1G+9zv6bxGhte/E3huia80acteUMFn2RzLhcC4EepXBNfOPGwCHUsIqyZeW
	n19guOlhI56/wisx0CtpDiyVTbp96u14nL0nAw9vGVBGNVYjXvWJwtGYf8qMcR4X
	I75low==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3sjcq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 06:08:19 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-847950bb95cso263097b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 23:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782886099; x=1783490899; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ofou19QbyrdcTBD9IzbCWECuazAfQMESoAqczJbChhE=;
        b=WmM8jwhix2QYYJe52gTMumB0L9D4hZ2jMGe3GXDV3TpPxmFCR6YSOPeHek5RqJl1bK
         PqIDyZCkXQ1pNGzz6sHL4TkdTyjx7tmnGycHdlOCCHawFKeZb16GMMWGxX11yKytik12
         KbADNX9EF9yBva5cNrEGzYJXdLM5AEjHdsA4Uo/gZyDvaDjaxIYexsTQO8Hd8/b69/lO
         frl+nAuZcwcMobRD5sU2JzmTL/HRR2ORk4RSPfJbh7x8LsHnE08gH39q1FmGgpEYJ5vi
         GuxTc01X6EdKb7KADHxtUCEEnHWqgw4E8NRsgIcj5YExz5svkYh3h/Tr9vB5pEuVo4MK
         orfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782886099; x=1783490899;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ofou19QbyrdcTBD9IzbCWECuazAfQMESoAqczJbChhE=;
        b=Cm9XcsNBtl6KiyNApfRPNOxJiRJnhKXx8NJdG7Gn6ZnoH8WTPGchClzdMRc86KqqcE
         xhw6L8u/WFkfVJXNDfL/+60snPv0gI0NnwEYMgm0jEbHOAal5SUVfjGhFNahleZ9Kr0/
         c7faoaGDofBLKqa3YT4pk2zlFBZqgnhRW5MHRhrsVrR92vIEbBSGCDKkwUjwu8agwNjP
         zAiI2GTSz07tB++6FpcQRaQrTAt0oX8Z9rMMSRL4rRoTzuG5NpLInH7wQ35Fso6pLKgq
         M/C4fVkl0SbGUD/d8Cleidw8x3b1uKWhxQBlZUUztrFRs6dSkx+Zlxpca7I2qgEP8fyF
         bSQw==
X-Forwarded-Encrypted: i=1; AHgh+RrtN6VsqEnk7qjIRCLOnQvx3CFkM6nMauZmTCi0B7MhUxM4MWa67+kbEdT451J7CqjPZkeGbMQqiy0fLiPdGj5m@lists.infradead.org
X-Gm-Message-State: AOJu0YxqENghqbXAcREAsb2P3JtqCk20/vkW21PVLQ3BeOyecskVSCC0
	bELJOv2yDrFXnwWdJTJMkcL47AZpZmB6b4rmhJabp38IHi1l5uc6RKMi3Il2SJgVQV/YmiRTYMR
	28IAV6ZOGyLZygW2FsRWWy2Ahe9GnoKd8vFh7+/3dqy2ttxQdojDi1ZtsXbhEc5/5sEVqNaKNz1
	sfQkD9zb4A3gB1
X-Gm-Gg: AfdE7cnpb9XvNADUcUDEYQ6rVp6mPRCtBJyhY1HesfN6SdlQkobXIW5QldyX3lxXSJQ
	0joFwXRkzh7rDMlRJg691PpblSKpttViclopNWI9XNMCTZPiqLAaMi6SJz+OQD6bh45aKM24jxP
	cX14+me464edKWd5rrpE3I96BxyhnO+dv3KIfHnAnt1R8ji9TTl8aZN14Jumar9FlkjsaseOVld
	sQbJ7E11nwC8bHSgIEMNfDivnuaWA0Ey+vo39aZihmgCUb6zCHrdPQY3wbn8XlvjX+qfrAQKz/j
	IO+zrUoJeUy3A7qu7K5dBaX+Coa6NCCK6V3onEWhWblc9yO5bSspt0OQlBhULDt6X4y+YKcp4T1
	JEiIATf2ctx3QKrHPCwvE3lKoTH/5Ztq1MiLHuC0cuNSYFxM+i8XxFcYXcsq20Y8FDWugu/8Q6Y
	TbhqB/rrw=
X-Received: by 2002:a05:6a00:4f82:b0:847:6ff4:da97 with SMTP id d2e1a72fcca58-847c0a2353cmr178436b3a.61.1782886098579;
        Tue, 30 Jun 2026 23:08:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:4f82:b0:847:6ff4:da97 with SMTP id d2e1a72fcca58-847c0a2353cmr178414b3a.61.1782886098098;
        Tue, 30 Jun 2026 23:08:18 -0700 (PDT)
Received: from [10.133.33.239] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479fcfacafsm3318955b3a.0.2026.06.30.23.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 23:08:17 -0700 (PDT)
Message-ID: <ad5b766c-acde-4056-9328-f95f945d2f11@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 14:04:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 0/7] Provide support for Trigger Generation Unit
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Greg KH <gregkh@linuxfoundation.org>
Cc: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org
References: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
 <48c6abce-c492-46a6-84ef-3074983e817c@oss.qualcomm.com>
 <a36a1ed3-5194-465c-b029-0404e0f2bcee@oss.qualcomm.com>
 <2026062959-distaste-launder-e253@gregkh>
 <c09d70e1-edd6-41a8-8ab3-db353bb6f8eb@oss.qualcomm.com>
 <ce9a2121-8f7e-4ac2-8795-5ee602966e74@arm.com>
 <e7d83356-c9cc-4324-a65e-fda3bd27af76@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e7d83356-c9cc-4324-a65e-fda3bd27af76@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nZZ1GXbQTQ6RYiU8JBCvmaSFTtjiYL2H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA2MSBTYWx0ZWRfX0nI2jqd3f1Jk
 go1n5PZF3EI/5fDtghIdzypNxe/Wy34Q3Z/p1S65CuJEEh1UzgzA25C9dcwPlKTf47eT0Q9N7xo
 nk/pw4xPhJ+5gRLtj5+UeCs+NLthS1b2vFFEK5hi3gOeFcDDUVpiGqwxZZoI72dKmJDQQhUEh9a
 EHP/WqRVJrnqWuD8QEy6nKBQ4M2kv4lcRkFDqwe7Lxt49mneGXyZGvyFZ4gMZuaqqHHDOckFjAe
 q0g8BzTipBILNXleP8aenq6xgSGdcOcyU7lWBqNAGscJFTRIZBoU7vHuBGb4o9b3hY2ZbtC9W02
 NoGZixVZkmV6c0WgdQenLJV4CublhFUFHlmVSOrYaLylee0b3ZKtG2lNv1nxS7sPExae1iFVZ7w
 wr17lKYA2uw9hs8MJEaQZeMNxFKhAg17qzYP83AhomnzlRPCExRWbkup1473XcxkY3fXy5enWQ2
 Op5QeYbpYg97rwjhXsA==
X-Proofpoint-ORIG-GUID: nZZ1GXbQTQ6RYiU8JBCvmaSFTtjiYL2H
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a44aed3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7OR0-vqQ_RDJhF54Gb0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA2MSBTYWx0ZWRfX0XV3UcuHQvd0
 i8+Z0Zyn/47u7/+Xc92Wyzm1NDMfLR0irHQcWpPvbcvtxvXgJTU1LloR7X08Q3Jg05vuZgZiP20
 t7YvCZMI6MRpghNpKOLV/VQrTJGCW98=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_230820_291072_9D000D73 
X-CRM114-Status: GOOD (  27.04  )
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


On 6/30/2026 3:59 PM, Songwei.Chai wrote:
>
>
> On 6/29/2026 6:44 PM, Suzuki K Poulose wrote:
>> Hello,
>>
>> On 29/06/2026 11:17, Songwei.Chai wrote:
>>>
>>> On 6/29/2026 12:22 PM, Greg KH wrote:
>>>> On Mon, Jun 29, 2026 at 11:03:33AM +0800, Songwei.Chai wrote:
>>>>> Hi Greg & Alexander,
>>>>>
>>>>> Apologies for interrupting again.
>>>>>
>>>>> As the TGU hardware plays an important role in Qualcomm tracing 
>>>>> design, I
>>>>> would greatly appreciate it if you could kindly take some time to 
>>>>> review
>>>>> this at your earliest convenience.
>>>> The merge window _just_ closed, please give us a chance to catch up.
>>>>
>>>> Also, why us?  Surely you have other reviewers for this code, right?
>>>
>>> Hi Greg,
>>>
>>> Understood, thanks for letting us know.
>>>
>>> Regarding your question: since this introduces a new 
>>> drivers/hwtracing/ qcom directory, there is no existing maintainer 
>>> for it.
>>> Given your scope (and Alexander's), we believe you are the most 
>>> relevant reviewers.
>>>
>>> The reason for creating the qcom directory is as follows:
>>>
>>> /We previously tried to upstream this driver under 
>>> drivers/hwtracing/ coresight,/
>>> /but it was not accepted as it is considered Qualcomm-specific and 
>>> not tightly/
>>> /coupled with the CoreSight subsystem. Based on this feedback, we are 
>>
>> Some clarification here: This device is not CoreSight  so we denied
>> keeping this under drivers/hwtracing/coresight/ - Not because it is 
>> Qualcomm specific. We have TPDM, TPDA, TnoC devices under the coresight
>> subsystem, which are all Qualcomm specific for e.g.
>>
>> That said, there are other drivers in drivers/hwtracing/ which I usually
>> merge and push to Greg, after some reviews/acks from the respective
>> people (e.g., PTT HiSilicon PCIe Tune and Trace).
>>
>> But, your proposal was that there were other maintainers for your new 
>> subtree and you were going to push this via ,linux-arm-msm ? to which I
>> didn't have any objections.
>>
>> That said, I am fine with pushing this to Greg via the CoreSight pull
>> requests (similar to Hisilicon PTT driver), but would need someone to
>> Maintain/Review the driver (with entries in MAINTAINERS, similar to
>> PTT).
>>
>>
>> Thoughts ?
>
> Hi Suzuki,
>
> Thank you for your constructive feedback in helping us move this patch 
> forward.
> As the owner of this driver, together with Jie Gan (who has extensive 
> review experience), we will be responsible for the maintenance and 
> review going forward.
> I will also include the MAINTAINERS update in the next TGU release.
>
> Please feel free to share any further comments or suggestions.
>
> Thanks,
> Songwei
>
Hi Suzuki,

In the latest TGU Patch series (V15), I have also added you as a 
maintainer so that you will be notified of any new drivers under 
drivers/hwtracing/qcom.

The review responsibilities will be handled by Jie and myself.

Thanks,

Songwei

>>
>> Kind regards
>> Suzuki
>>
>>
>>
>>> exploring/
>>> /a dedicated drivers/hwtracing/qcom directory, similar to intel_th, 
>>> to better/
>>> /support this and future Qualcomm hwtracing drivers./
>>>
>>> More details can be found in “[PATCH v14 0/7] -- Why we are 
>>> proposing this”.
>>>
>>> Thanks,
>>> Songwei
>>>
>>>>
>>>> thanks,
>>>>
>>>> greg k-h
>>

