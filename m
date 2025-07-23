Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B694C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 05:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yi0z3sLXRaxmxpY7Kis69SNdsBbMhtzvqAojxUzh/uk=; b=MPj9nuESlZry2YOv7VKCMaiDah
	qiW8qHbwmRYo422DOcnIDec/AqCpohqr4m/ZOwA/KL62pBTmOwAAZ781KAazDkxMa7A1tOWA11q9O
	O33BAmg55oHsZ6YbrfWbcDB9EOJKGvf7BNIrizAMrwjFbjFKAQtRieLYpsWeMhieeZx2j5g3R5hCF
	Eetq1ndjXUoi4K4lA7ko0CME4IQbMMDqeVSp9zQu2fzpIP6JZ9EZUuu2dzBt9dA4oTHfSaGtGbww1
	e09zOtsNX/NJz6w3t03p32f94VmaVqFpqiFKXvS3Mw4hw5YATh/TudA7sWVg42Cz5PpgNiS9IARMX
	0gF0xImw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueRnV-000000042c5-38jM;
	Wed, 23 Jul 2025 05:13:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueRk2-000000042MC-06fF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 05:10:11 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MMOZ46011036
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 05:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yi0z3sLXRaxmxpY7Kis69SNdsBbMhtzvqAojxUzh/uk=; b=KkUr10RwMF1rqWEN
	Lbz3IxId/QV35PzVEh25FsK7+ZO6s4c2z6LtvuSJhqQ0YaBc/8kXvXptzlcf0Q/L
	PEIPmwbU9A2QbVvzj+ZXGr9IJ0GeINPRoDSJx5gpMewekr9vP8GF5oejbLz9uiGf
	NSKCljJbmJlO+yI3AP72dykJWyDYce3p9Z+HgE8FhZrZmwZUZbOWq15lbHynzfrX
	f1tohXW2IvwZ157HzI76XMRX/IyeDNmEMY0FjfWU+7bterSWsVmnyoeFqBj61GJy
	mi0YrYF8huG6Al+8l4Pm9W0eFF9c3PsTiawaX8hMgrK+R68MHgC5HWpkdsbgJ9lG
	Q3pXcg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3hswfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 05:10:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74943a7cd9aso9532614b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 22:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753247407; x=1753852207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yi0z3sLXRaxmxpY7Kis69SNdsBbMhtzvqAojxUzh/uk=;
        b=d5yA44hccCShBZAwBk2OpBiJObbqPyfTBsHPrwypJZvrQD7riwMyD5ZEvc30InZo9y
         1JQJfq1WDCxC3tZXzpBHEwI8NZKZ/Qu5StHmSCTVylB7Btm6Tmfo+q9cj3hg92294e4e
         CHySA1TRJQMDQZveVsyaOaQqLiofh/fj7lQfGzEZ2GH/kjhclisVm99LA2cYaw/mE+tg
         yBbOf63KkCTjQ570LeVHNuMZB+AIl16jDsrm4mTrO9MJtbmm5LvrhjJqr4HGo5w5rRsR
         JPHCdbcg2RUmNMnBQ3OU+NNYGQh8FN6wAOgabyglx0Jmm1k724xSKUZWTjIBvNOKsPvx
         bN6A==
X-Forwarded-Encrypted: i=1; AJvYcCXT3t2Gpx5KlJhp/RGDpzrwAM9GuF6H3k9kL+LiujnMEm+I6nli/0KA+/yyYWsVoDRnEAhRxxAq9k3OvZY+4DS5@lists.infradead.org
X-Gm-Message-State: AOJu0YyEozlD50jOO2dh/UdNjRORNtkGwASeU4ASfHqUfRa2FlYKI1bl
	0MiTc7+ePbBBt7Cau2VwHzC+CgDzgiY3qs5l7BvKNtY9df/dvNhSJPDypxD6D1OahNvaBslJiBo
	CGnf+sv30qA9Cx9zF3Q5EKJezgr/LqSAnmvxDOFCk36kOraUOBflzqyMsWJxq4snsYZsPrfPWnY
	d2MQ==
X-Gm-Gg: ASbGncs7U99iBc7pu8XM+ITsX5X5ULE+QHu69pwSnC7aLQkVyI4Z6moVCvodJS/oIMk
	tzJ3ca5w+6qIJTtN56rPw1CbZb9tXPOuldW+2p/exmP59345mNSQN/r/D9U+tEC0PPNStvrvkyi
	BenCLDzGEMK8DQAeAQlJFA0f26wLY18hErHafGxNnRpdL4//DRjHEnvUax16OpM630vhSJ41Fnt
	C4aMcaOG7QvU7msxKzz2DF5xiZtWvsqtkqgazCMSrQknWkm5jivPb5GMGR0rVP44PeJMYDbRTNW
	lIIAuJGWX6OuE9qCKrRXx7JQOSpp6gi0fv3kco4VYoCsW9xBOet7Svz+RhOtQGswmpmr7aGMPPj
	qiqwLMWaDciyXrdsHALepV9w=
X-Received: by 2002:a05:6a21:1fc7:b0:232:57c8:1bf4 with SMTP id adf61e73a8af0-23d48fe0711mr2218931637.9.1753247407584;
        Tue, 22 Jul 2025 22:10:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSzdu3XTzGZRuyXiNJVAUhtDAMRYXv0zE8ykPNMcULJMV8cEoBw/XVyfdTRcS32Pcplllgrw==
X-Received: by 2002:a05:6a21:1fc7:b0:232:57c8:1bf4 with SMTP id adf61e73a8af0-23d48fe0711mr2218887637.9.1753247407159;
        Tue, 22 Jul 2025 22:10:07 -0700 (PDT)
Received: from [10.133.33.27] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2fe67f96sm8032266a12.13.2025.07.22.22.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 22:10:06 -0700 (PDT)
Message-ID: <838c6cda-6128-4fd5-a541-d71caee6c107@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 13:10:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND 08/10] coresight: tmc: add a switch buffer
 function for byte-cntr
To: Mike Leach <mike.leach@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
 <20250714063109.591-9-jie.gan@oss.qualcomm.com>
 <CAJ9a7VhLXrdP_CPQPgAYTAGWJfsVUa9SG9Bzv9dLtFzR4nFROg@mail.gmail.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <CAJ9a7VhLXrdP_CPQPgAYTAGWJfsVUa9SG9Bzv9dLtFzR4nFROg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=68806eb0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=RYLkNb92mBiLz5sOdEcA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA0MSBTYWx0ZWRfXwdNIG4ttSeis
 aDjdo87l4BsiV43IKiA+hgq0RILbcOItg32hp3lqijJIwpy8Ra8pUpYlmUytVyIDnJ8ES3z0Gmq
 kMf9ItVgrsS7p2peCQj8SWmO67mOveLyHd0GTobYn/4auwRe9LQCYccRTciySbMdUpFnUZJKIFF
 syiH/R3lJ0634+/OAQsvEkKnWk4tE2wMhd9v2S7Pz0xbeYZzNt+JK+esxtFEzzKxs5Ogf/eCAM4
 JaFOmO3yxX0OXVTkWgWCE9Klu6XBcRfcVeJIar4NhrYfUnYBVo23H7hTL66dbOpxO1U8lAKO7V/
 0i1Izftke+e2N17+HivBBx/VRVbJIXtpKhhHL6em1ua9yDSxKifFMOYfVkMMqR6JUoJnzC5XmOe
 q5BHzqvC15jIaBm3uXGIM0cenXcZy0ZG0z+jq1/B3hipq4AUfHvvKk+W9sscFgzl6ulh0egN
X-Proofpoint-GUID: UV7gFXSKT0IJHkzCH-RwuiTclG54I7BY
X-Proofpoint-ORIG-GUID: UV7gFXSKT0IJHkzCH-RwuiTclG54I7BY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_221010_194791_2AC54B10 
X-CRM114-Status: GOOD (  33.68  )
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



On 7/22/2025 10:09 PM, Mike Leach wrote:
> Hi,
> 
> This buffer swap code looks OK in principle. The ETR is stopped,
> memory synced and set to be read.
> See other comments inline.
> 
> On Mon, 14 Jul 2025 at 07:31, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>>
>> Switching the sysfs_buf when current buffer is full or the timeout is
>> triggered and resets rrp and rwp registers after switched the buffer.
>> Disable the ETR device if it cannot find an available buffer to switch.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../hwtracing/coresight/coresight-tmc-etr.c   | 52 +++++++++++++++++++
>>   1 file changed, 52 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> index 2b73bd8074bb..3e3e1b5e78ca 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> @@ -1287,6 +1287,58 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>>          return ret ? ERR_PTR(ret) : drvdata->sysfs_buf;
>>   }
>>
>> +static bool tmc_byte_cntr_switch_buffer(struct tmc_drvdata *drvdata,
>> +                                       struct ctcu_byte_cntr *byte_cntr_data)
>> +{
> 
> This entire function should be in one of the byte_cntr source files,
> not in the main etr files. Please keep byte cntr code separate as far
> as possible
> 
>> +       struct etr_buf_node *nd, *next, *curr_node, *picked_node;
>> +       struct etr_buf *curr_buf = drvdata->sysfs_buf;
>> +       bool found_free_buf = false;
>> +
>> +       if (WARN_ON(!drvdata || !byte_cntr_data))
>> +               return found_free_buf;
>> +
>> +       /* Stop the ETR before we start the switching process */
>> +       if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
> 
> Can this function be called if the mode is not CS_MODE_SYSFS?
> 
>> +               __tmc_etr_disable_hw(drvdata);

Hi Mike,

Since I need move the whole function to byte-cntr source file, is that 
acceptable to export __tmc_etr_disable_hw from tmc-etr?

Same with __tmc_etr_enable_hw.

Thanks,
Jie

>> +
>> +       list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, node) {
>> +               /* curr_buf is free for next round */
>> +               if (nd->sysfs_buf == curr_buf) {
>> +                       nd->is_free = true;
>> +                       curr_node = nd;
>> +               }
>> +
>> +               if (!found_free_buf && nd->is_free && nd->sysfs_buf != curr_buf) {
>> +                       if (nd->reading)
>> +                               continue;
>> +
>> +                       picked_node = nd;
>> +                       found_free_buf = true;
>> +               }
>> +       }
>> +
>> +       if (found_free_buf) {
>> +               curr_node->reading = true;
>> +               curr_node->pos = 0;
>> +               drvdata->reading_node = curr_node;
>> +               drvdata->sysfs_buf = picked_node->sysfs_buf;
>> +               drvdata->etr_buf = picked_node->sysfs_buf;
>> +               picked_node->is_free = false;
>> +               /* Reset irq_cnt for next etr_buf */
>> +               atomic_set(&byte_cntr_data->irq_cnt, 0);
>> +               /* Reset rrp and rwp when the system has switched the buffer*/
>> +               CS_UNLOCK(drvdata->base);
>> +               tmc_write_rrp(drvdata, 0);
>> +               tmc_write_rwp(drvdata, 0);
> 
> This cannot possibly be correct. RWP / RRP are pointers into the
> system memory where the ETR stores data.
> 
>> +               CS_LOCK(drvdata->base);
>> +               /* Restart the ETR when we find a free buffer */
>> +               if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
>> +                       __tmc_etr_enable_hw(drvdata);
> 
> What happens if the ETR is not restarted? Using __tmc_etr_disable_hw()
> is correct for this use case, but if you do not restart then the extra
> shutdown that would ordinarily happen in tmc_etr_disable_hw() does not
> occur. How is this handled in the rest of the update?
> 
>> +       }
>> +
>> +       return found_free_buf;
>> +}
>> +
>>   static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
>>   {
>>          int ret = 0;
>> --
>> 2.34.1
>>
> 
> Regards
> 
> Mike
> 
> --
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK


