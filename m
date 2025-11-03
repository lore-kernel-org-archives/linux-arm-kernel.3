Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF5FCCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 08:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nzXaWMKM6uuZrMgRFGjIfcNECUOqpvMFvxCNHdhoY6s=; b=n8LiLIYQ2MDwf5URct4aHXZG0S
	991E6iDLEBXdnm3+/uEL9snPmkb9eOQ0nr76c2jk9RW4BsZ+tnMfZ9fN6DUe0HDlpA4dBS1xf7o+O
	9VWqiGNpA/1Ko4/ySHOYEqCYBi/aSfHOIVNssXBhvpDzxwyFJ34ibbhs89kp0yx4LyBnw/PnuZOuV
	pcNXhT0iO047yPLy1a/vcDmY7DjNpyW5Ici68Ago5uFY0nxpM3sqMzYRmskjCWAfF2xHK3QmwH7DM
	cViiCAjy7+1B5zdUBy8wgemf/+E2286cSOrf11ZJMKOHMwNQqus/1plbyK1hTvYm5gmO8ktUPwzQZ
	GHddLoJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFqCn-00000009Skw-2ihG;
	Mon, 03 Nov 2025 08:46:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFqCl-00000009SkP-18Em
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 08:46:24 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A38bnlZ1347150
	for <linux-arm-kernel@lists.infradead.org>; Mon, 3 Nov 2025 08:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nzXaWMKM6uuZrMgRFGjIfcNECUOqpvMFvxCNHdhoY6s=; b=Hiz08kzmEM1kow10
	RHDAms7fgCz/INJ4ZfY754RBanZcKnHOC/qJdICKLQuUsCqvB6H6DskcsyD7lamf
	WrUgK85JfTF/yiFvAOcNR9gnkIubbNceV8d1CpXoCPrpz3v7JKLX2rv6tSNGE6xD
	9RvXkUfvcKAwQF3SfJGqpHdxt+QjjSlKYB6vaQ6NM03d18WqOuburYfAz9CsworB
	nkS086Azg9DPd0TliOgmuQzonUpgZEAC15BnTMaVPpk2kRbI2SVbAcQyCf/2+ucm
	VoMQGe43F5pSvIQuMlwZyeY1/a+bYOwjM3Vs6eWpRhnzTgQFRvgo1cRs7tzLkb4s
	vfoXtg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5a9vkye3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 08:46:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-286a252bfbfso103060985ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 00:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762159581; x=1762764381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzXaWMKM6uuZrMgRFGjIfcNECUOqpvMFvxCNHdhoY6s=;
        b=imuMQwB5bT4jNv+lH5R/JfQZ0oyHsv3jHx7F4swVkmByJ0PQOVMrc9vs+RM0mSfr1t
         TIVBxx++NwCqpnTmEC8+2M3+I3R7HFGPfZ6K7EFQuDJdEj3xpK8IVXe/x10HqV2UvIdl
         WR+Pw/3USsg7rWfB7dh/GRzVqS5kYAovt7F0vNeUrKrHZmbdSGJtxFaN3qL1EewooZTC
         63PzrflbmXaXAtYQOjv5MJPZrAa2EXYhVC0U3tWmhTEJ2HKAv90PM68ALo8YoPydRocr
         S1n1iQIP9uQCtC4GKXqA0oL9twiMB4CAuBHdGoXu5kmd54RdIFlUNf/EwhzO6WBM3fjc
         Rw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762159581; x=1762764381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nzXaWMKM6uuZrMgRFGjIfcNECUOqpvMFvxCNHdhoY6s=;
        b=Qv+U5RW0xY8DaYGdVULRRmK9t9fEW7TzD1vjeLUvR7mWXmv+E4LoNPqPy1UH5zsuLP
         jmIIYrz2ymdGne1gdSWJlf/XWvwiRx21vaI5Wugmw4NLy9DgValpX6fwfseOGqgzDwDl
         QVzGz5FqgzuC5OoY9Q2BZjvGLA02ThfruDu6j21sDTlspjGKxnfZPxBo7WHUFCCMwkcC
         4TNP2jCFKhyDtTRnOhDulTyyTkwXlo89PI06zNwpqTjdChJ1aHGIXYuNQ9ES2bb9ewRD
         FLRxrsUVFvORTafQMHpuCOoNmLRUSmds3P9on9VE6EUN+OG2O1hiL4KhyLvhMv/cylNI
         p1dQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3lNNpagFba8DDJILV++6rxiaTiw6sgRvboS4Hr9+tW+RdXd4ZrcDpaXaXob7v+1OnGljAJOM1XlPUvGwhHVEV@lists.infradead.org
X-Gm-Message-State: AOJu0YxQolzgnPlFDhbpKcewH1afwp+JLpZ52rGl4I+y2HG8Sjb7yeSE
	nqX/ZBdJ/c9nl6HAdmFIPFnSG2C0P0jXZEsmTDx61zdggGo8IV/m75BOxwu4AwlCkdrMOds6air
	65GoIpt1RusMMmon1bmkc+J2Anoruu32YFQ+Lc1YGvzcypBSwZJBw/aqs1t4bkMnawSsp2j8jJ7
	vD8A==
X-Gm-Gg: ASbGncuTF7/z0Uzz3sN/hoWf3ZR6V8TRcbLJe0ZOdHyrjaCL577YVzS76PasuLShEW9
	YFM/hfNlpL4gpPM2WuTBrucP7b/uLAr7n7B0j+mihB4a3vj2OBHR/ioi0pmsUXjqHIJAi6L/Dp5
	8ILTfmoAqTW6LXMgl2p6+mttiDAqHyPyhuhpSM1FI4PekExlo3RZF8jrUK39+FBxLX6u8nc04s/
	Zh16wFJWxLgLSValVG/nhOQgR3Z+gRgMEKEZDxuZVHIoTCEwbmnHms4fyLPX3FmeUjVShLMOFDs
	7sqRFbFeREGV+sP+hwYh1B428Vu8Ar5Me1+uko8rtHRPV6YBVzQAsEBUtSAHVMnCeMmhq9fpaP6
	9FBH94OhBp8zxbmoo06gvv2sSLyL6nZXDwS2Xvy2xd67UEZJP1wnWrPWLS1JYZN4dkKk=
X-Received: by 2002:a17:902:e845:b0:295:3d5d:fe37 with SMTP id d9443c01a7336-2953d5e059emr124468285ad.41.1762159580928;
        Mon, 03 Nov 2025 00:46:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmiuoA9oItdNbWpsoxdg8TQql7oPA9lHawbw/4Efm2CYdb1fZmLHawrt8VA2IXB/QVz+ha2A==
X-Received: by 2002:a17:902:e845:b0:295:3d5d:fe37 with SMTP id d9443c01a7336-2953d5e059emr124468055ad.41.1762159580401;
        Mon, 03 Nov 2025 00:46:20 -0800 (PST)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34159a15b6fsm203948a91.18.2025.11.03.00.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 00:46:20 -0800 (PST)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
To: mike.leach@linaro.org
Cc: alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
        james.clark@linaro.org, jinlong.mao@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_yingdeng@quicinc.com,
        suzuki.poulose@arm.com, tingwei.zhang@oss.qualcomm.com,
        yingchao.deng@oss.qualcomm.com
Subject: Re: [PATCH v5 0/2] Add Qualcomm extended CTI support
Date: Mon,  3 Nov 2025 16:46:08 +0800
Message-ID: <20251103084615.3666468-1-yingchao.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAJ9a7VjTqBczkdMYXqb1WmDRUYhC--dY6Ky5R=NfUZaYkiWmVw@mail.gmail.com>
References: <CAJ9a7VjTqBczkdMYXqb1WmDRUYhC--dY6Ky5R=NfUZaYkiWmVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA3OSBTYWx0ZWRfXwEHpC7hDDNKr
 dw9OOgFphv3zM1ZrKj2PjrudmbfbCI0IsNX48vlV38sPmX2yFfPQ9l1QOnpH3b5AleaY+ve7+UV
 v/RAvbA9rpe6BRqzEJe9vmz85RfzXWNKzd3sXGRaZvBBhwUOoNWQfTN09yAYJZ23xUMb+Y+9BMn
 zD5f300RHs/MBXiBwKcFmeZxpubd1cotPBDcUU4sWu3d+76Er1o8qfW6R2hXNwA8kSK9L6gFUZR
 2OOTg4UjeuDc/wBojIN9xH89jhxKEYG8y9JRA+bP7tH5KIDhzjdkKoY4D9KC2rSUm6Ck2AsDm8S
 OH/rXFhARfxndbpOyBDXSeoUDV1fIUIUGn9XdnRDkZ57i+emD/fUN/oKyEMnbM64AY2ZIQj9ZeC
 ovNRUrxXXHO71Z3EcwLzMz2Xpodmpw==
X-Authority-Analysis: v=2.4 cv=c6CmgB9l c=1 sm=1 tr=0 ts=69086bdd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=G5yOyA2rPUBNX_wBb9gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: CLaWAhzO7o1Ae3UgfmT94SfgRjOvDBgL
X-Proofpoint-GUID: CLaWAhzO7o1Ae3UgfmT94SfgRjOvDBgL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_004623_436087_D0D5C9E9 
X-CRM114-Status: GOOD (  28.49  )
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

>Hi,
>
>This set is looking good now and appears to be getting close to being ready.
>
>There are a few minor issues in the second patch and a few items that
>need to be confirmed.
>1) I note that you removed the code to prevent calling claim/disclaim.
>Does this mean that you confirm that you have tested the patch update
>for claim tags I posted works on your system?

I just tested this patch, the default value of qcom_cti's CLAIMSET register is 0xf,
and unlike the standard CTI (write 0 is no effect), it can be written with 0. 
So, is it acceptable to write 0 to the claimset register of qcom_cti after reading the
devarch register during the probe phase?

	devarch = readl_relaxed(drvdata->base + CORESIGHT_DEVARCH);
	if (CTI_DEVARCH_ARCHITECT(devarch) == ARCHITECT_QCOM) {
		drvdata->subtype = QCOM_CTI;
		drvdata->offsets = cti_extended_offset;
		writel_relaxed(0, drvdata->base + CORESIGHT_CLAIMSET);
	} else {
		drvdata->subtype = ARM_STD_CTI;
		drvdata->offsets = cti_normal_offset;
	}

>2) In patch 2 I made some comments in regard to ARCH values - please
>confirm that these are accurate and have been tested as working on
>your system

Yes, the bits 31:20 in qcom_cti's DEVARCH register are 0x8EF.

>3) As mentioned in the comments to patch 2 - you need to update the
>docs for the new sysfs selection file you have added

Will update in v6.

Thanks
Yingchao

>
>Thanks and Regards
>
>Mike
>
>On Mon, 20 Oct 2025 at 08:12, Yingchao Deng
><yingchao.deng@oss.qualcomm.com> wrote:
>>
>> The QCOM extended CTI is a heavily parameterized version of ARM’s CSCTI.
>> It allows a debugger to send to trigger events to a processor or to send
>> a trigger event to one or more processors when a trigger event occurs on
>> another processor on the same SoC, or even between SoCs.
>>
>> QCOM extended CTI supports up to 128 triggers. And some of the register
>> offsets are changed.
>>
>> The commands to configure CTI triggers are the same as ARM's CTI.
>>
>> Changes in v5:
>> 1. Move common part in qcom-cti.h to coresight-cti.h.
>> 2. Convert trigger usage fields to dynamic bitmaps and arrays.
>> 3. Fix holes in struct cti_config to save some space.
>> 4. Revert the previous changes related to the claim tag in
>>    cti_enable/disable_hw.
>> Link to v4 - https://lore.kernel.org/linux-arm-msm/20250902-extended_cti-v4-1-7677de04b416@oss.qualcomm.com/
>>
>> Changes in v4:
>> 1. Read the DEVARCH registers to identify Qualcomm CTI.
>> 2. Add a reg_idx node, and refactor the coresight_cti_reg_show() and
>> coresight_cti_reg_store() functions accordingly.
>> 3. The register offsets specific to Qualcomm CTI are moved to qcom_cti.h.
>> Link to v3 - https://lore.kernel.org/linux-arm-msm/20250722081405.2947294-1-quic_jinlmao@quicinc.com/
>>
>> Changes in v3:
>> 1. Rename is_extended_cti() to of_is_extended_cti().
>> 2. Add the missing 'i' when write the CTI trigger registers.
>> 3. Convert the multi-line output in sysfs to single line.
>> 4. Initialize offset arrays using designated initializer.
>> Link to V2 - https://lore.kernel.org/all/20250429071841.1158315-3-quic_jinlmao@quicinc.com/
>>
>> Changes in V2:
>> 1. Add enum for compatible items.
>> 2. Move offset arrays to coresight-cti-core
>>
>> Signed-off-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
>> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
>> ---
>> Yingchao Deng (2):
>>       coresight: cti: Convert trigger usage fields to dynamic bitmaps and arrays
>>       coresight: cti: Add Qualcomm extended CTI support
>>
>>  drivers/hwtracing/coresight/coresight-cti-core.c   | 144 +++++++++++++---
>>  .../hwtracing/coresight/coresight-cti-platform.c   |  16 +-
>>  drivers/hwtracing/coresight/coresight-cti-sysfs.c  | 184 +++++++++++++++------
>>  drivers/hwtracing/coresight/coresight-cti.h        |  60 ++++++-
>>  drivers/hwtracing/coresight/qcom-cti.h             |  29 ++++
>>  5 files changed, 346 insertions(+), 87 deletions(-)
>> ---
>> base-commit: 1fdbb3ff1233e204e26f9f6821ae9c125a055229
>> change-id: 20251016-extended_cti-2a426c8894b1
>>
>> Best regards,
>> --
>> Yingchao Deng <yingchao.deng@oss.qualcomm.com>
>>

