Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F2AC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 03:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GcRiJdqepO/ljPzq51yX3pTfKYPsMIe1eMnpPQHw5lM=; b=V9SmyGhERlDQJCjdiatyQpunJD
	6X2lhGU1lUhOxWXo2hrloqqbURb/8Lvdo7diakMEOkK+6cpkb+ZTmOtwRzitzOg1iyOmy2a7FO49q
	IXILXgAeHgvW3AmLStA/eZv9mT+DdNrAgnfxi7SD9Zs5pfCqhO8BBe36RU50DOEA8MW8oMiNeYsvP
	Y/TSmlxXB5tse0EV2K/Qldt0ixftAUrWbnqwaafpTV779J+cfG59Fp4lvC/sXpOvRhSuXbEBAg8Xu
	MtrFVOzhWGZYXOkHUUEfE/+jXVcp3S5XHrbJdl3r/+gpgaCGj8ahWHndRme+aPSJ7DmcQ0dgsU/nd
	LfHubQkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueQD2-00000003umT-154w;
	Wed, 23 Jul 2025 03:32:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueQAX-00000003uXI-0Pbs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 03:29:26 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MMPbm8025878
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 03:29:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GcRiJdqepO/ljPzq51yX3pTfKYPsMIe1eMnpPQHw5lM=; b=LgDDuuYtvjfjdbfk
	ukxxOgRGVQNnf52cnAPhdd4iAIevLrHx1Yei/W/9VA/sv+fb3OznEBFpv6OAUJQ5
	NLmJGZUkinfImkPENSzlLxLfDH4o/0cHkIYWr5uQ+XnQsI0fQqw6QuEB8a/vvKKO
	V9NUegxZMmMuCj1BuidjviST0AdS1BIDmUzIteTbwsrVIyDS+/0ktQxdIsrGWvxB
	jH2KGjInZi+nfOKBaTlUiVWDfwL6SNdxy+uoTLeyURwMRoC3woHNalcpJyuKHciP
	Yw6et6miFkG6Ad/Gg7ZCyGDxNl+fa/F0Efat7CJuOEHaGk0OTZXKvxCJlpeOw+Zk
	YUQHUg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dkfrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 03:29:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-234906c5e29so71111635ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 20:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753241362; x=1753846162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GcRiJdqepO/ljPzq51yX3pTfKYPsMIe1eMnpPQHw5lM=;
        b=Jz0unpfg7VfwijEbsr2+1a+ab2zS5wmX7kM+qTwo0UchadQTEfmwS/tJ/Plah93lXn
         h7Yj0XoGl1SOMYFdsYF4J/i1YYLg0c0vtXm4MsfIxl9sEfGbD7nnVyMEH1F1KvaiWImi
         EvlaHIbPGaMTCaU9yeRVyKs5kyjKC5qLh56hld4kO1q3v9KDq5rwZmNj8H2GPeS/jVvH
         Ygxsi220GAwKIkA33nq0G9j/te0Zxuxlz9It4PoPJFy6go0pSzM0rQCBckptvIBcJq8B
         ZdHXAJjeatC+Ces3kMxRoHDHeXdN3istH9dOyjkau9cayKY7EHvh8rYhVB/y+5Sec9DN
         +VyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjjPXnRIqWlVUmqtP/8HF1JC/ELpYdmqTpQS2U2D4ow5+ZP86E1CQM0AhLRkjjUlly0S7AtyZF21xe1IJT2vvR@lists.infradead.org
X-Gm-Message-State: AOJu0YxoHPaqaIMrqMexbgFIEYVwVg+ugx1qoWE1FBt29Oz2FTsKQX1j
	D4aPX0NdDh+Q5j365oRXlcKydWphL2itHa+2l3J5NBvPbf7bbY5fs+mvdJEw7JvlqoNZ+ExKSvx
	XDgzxmI3PeuqqKiXjUXjQLWwdrTXtSHGXIUhQLFpV0Q9tRIfUNBhZicACyPt4Sb+poXXU6BH47m
	DOzw==
X-Gm-Gg: ASbGncuHg18qY3tApAAGNvDlN4ts9UQmGFDk89xz8dJC/15VyH+XbVgGWogpQt/lZQu
	aIr9jm7z0gjyFrC/q02R+IVKQ3ORupIyFfoMS0GDi3zVg+LQUZP6TXs+jSLL/EYD6bOPtOk17UI
	jBpu7+N5cnx+9RRGagCGeHzfyHm286/8SWC4eBuAUafdEyAM5pWIkRCS+eAtRzo0HgXc5qPtvx+
	To1V490Zo4IEaFtE6/nckJw/vx60WO7TxMjLyo1eVRrqn4PCr3sx+wmsmLpXIJmpSSCZae4oS5L
	f4QAp4cStqHHG3ckcpbh/awfshJuTkBqrwFzPHEdDqW/awlB9gRicl/zvZ7zdKGC6u74kHvoZXV
	P3++/6C1z8/8NR/pl4ftvlFU=
X-Received: by 2002:a17:902:f684:b0:234:ed31:fca7 with SMTP id d9443c01a7336-23f981db976mr18720765ad.48.1753241362424;
        Tue, 22 Jul 2025 20:29:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFy1PnWRL2YDKxRY1ylTuYEKI0uH+mVP5x4g+cnb66HuHnPlsooq1YxXsS2pw2RklDksMxGAg==
X-Received: by 2002:a17:902:f684:b0:234:ed31:fca7 with SMTP id d9443c01a7336-23f981db976mr18720395ad.48.1753241361974;
        Tue, 22 Jul 2025 20:29:21 -0700 (PDT)
Received: from [10.133.33.27] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6f2306sm86067305ad.213.2025.07.22.20.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 20:29:21 -0700 (PDT)
Message-ID: <85cada69-a0ad-48c6-9a6d-42b26a51c971@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 11:29:16 +0800
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
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=68805713 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=3p4PawPDRryEjlqJgAUA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 4ICJzz5tytwlE1_pqUfVQ7UkQh3jCZ76
X-Proofpoint-ORIG-GUID: 4ICJzz5tytwlE1_pqUfVQ7UkQh3jCZ76
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDAyNyBTYWx0ZWRfX0A3xCt0fP2Kp
 sHxsgIIgIBctbXD3Ji3K/BZmX3Y5u8TFU7LqFr45tbD8lHbHBxRN/E8haQpNSlCdMnm5gtGGfC/
 awENmERYeSUdYNi45zMXZLB6qbaPwX62hgpy6/6CaqRZBZ23KdLe/giS2GHxjaxi54ohVM7Cz+z
 98cYs47ebYc4Sjyvem4bFEBKXmvyorkrSEE9KRB0tji80Zf1A2RxJog45na/d0pxM1Qf+pCBCjM
 aGUCF1tmxxKpCHUspVQW82c+AbYmSx4MMWajXeksDl3+jEPkQar4+fDCAG0x7YI6x5QJUE9X1Ki
 2T1UTn6ZxARz0kjxPSkD08/3SAoiwtyBmoVwlUkKvA6VbMFgGR2AkDdGfEuoDlxXBWIzFsJx8db
 ZB/HcMNvisLIPwtKrFc1Owp84B3JFRiajtA9OZEjKjBi6s2lmLt1gj4g6sDHmTFG2vAXd1BS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_202925_262081_99D2A202 
X-CRM114-Status: GOOD (  34.46  )
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

Should be ok with called if the the is DISABLED.
I will check the condition.

> 
>> +               __tmc_etr_disable_hw(drvdata);
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

It should be sysfs_buf->hwaddr here.
I made a mistake.

will fix it.

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

Yes, there is a problem here. It's incorrectly put a strict condition here.

I will check the logic here and fix in next version.

Thanks,
Jie

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


