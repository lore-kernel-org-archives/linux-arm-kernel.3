Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22306CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 17:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mc/+ti7MrgQz8y3VEqUCtk+lZgtdhsk+7nKCgcRoRzc=; b=kcWwjJNqcBtHcyFfagl2lnII8e
	KcrSUFwu4BOz/pFGwTZT7Bg6BTxo7f+1ffmOUFD6WOKlgZQDDKsM3IPLDSP61UFoW2/9ZFz0Tsqjy
	lyKBF2UFcBSv21S/Y6V1/65J2NO7LIM44X+Y46KU7Ov0UsafAMScPT3EiskViPjXhiEvIqjCFqP65
	J1otVhNfACCJ7LGDrr9Z28fW4t740zjerWW3g8qohXQgH8e4mWf+URFs2UX2vy+cEpQDE6suZZ9oL
	IRIDP2/4+xlqTvTKtl55t+35Sg00wjdGk5Mv7WLbgWh6fiN99YiLBaaScv2vKDMHjADGqyRXp61dR
	Aw+38tnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPl4i-00000005MKk-2Unh;
	Wed, 20 May 2026 17:51:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPl4g-00000005MJK-0Tyy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 17:51:19 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KBZT0q3084922
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 17:51:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mc/+ti7MrgQz8y3VEqUCtk+lZgtdhsk+7nKCgcRoRzc=; b=QM+UTv5OhjXtuCSi
	KN1xd8tqFVIXPKAg5jpokGrnXAf0a1U4PUDSH3RX5ZcUSIfS/ljobzI66f/YMPd5
	OeW7owetPzdc/VIDYIMFX5XxBnVHgbg1qEhvVvggSHh2Dt/Ai4ugHZN/Td7jCcq9
	qyP882YaEvZp+IISYEfjT1pwzbZU9wdrEhAxs/IPN1KoC3Hi34gmT1kRn4vpCfso
	bFoTCdn+DayrQ9/LCEQJ/yNsLfAEbMpX8BsqZXr3sSIunXz2D9AyUARKzHRV8lI0
	3pkoMnRs95y7EPSnM6BdMWD7BEOab50OdNnC7yFkBK9+Zeqi1ejGSw4ewFaAHUWU
	uy/sAw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f1k5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 17:51:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba3245a43dso53764645ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 10:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779299475; x=1779904275; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mc/+ti7MrgQz8y3VEqUCtk+lZgtdhsk+7nKCgcRoRzc=;
        b=i/Hm/WyvvnvUvPXS90lHCs9h6Nhj7pm8FwIDsYQksVGJ2TUICSHqA67IxIuX1It9zb
         qTBq4Xn7nK9VATy+kE6dSUNdNzESHttaG76b8nQ/KIoqamVdvQHTUWnHYINWTFAhEgVI
         8oERdgn3qpiYgS4f3dRJ4U6stovLpzpWuyx7253+D0fLqjcmS0h1CNbgXSc/3MjOqa3p
         CcIoCGaqN87YW6ioApcnKrDMU29C82+QKtERWrs7HunGTPPZBkS3ifQg6MWBuSxUfXlE
         y0ywyo78gwevUF6F1zqHb7q3t3kA7Z2xW6VPzSjw4pfIwesmfWYfLGoNYy/UjWiOleIw
         9LOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779299475; x=1779904275;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mc/+ti7MrgQz8y3VEqUCtk+lZgtdhsk+7nKCgcRoRzc=;
        b=ik64MNbC5wIlgtSw/A2nftetG3GmPkawY1C9U57OxFUTPpwZ3NLIuk8R27Q+pmglSI
         Lza2bMyfv80Z61g24xyTbdLUESkTA3NOnVKrAFEvUP6A43ibnfUfxhjmjZWNmtSXTEXH
         771+JRFM27U9wMef+PYK8NDwFhlltj5EoewuZO6NpSQXEOESihXbJclrwTUAO/I2yvyt
         2IAQg/tPBgw0noz90KG+5EgZsNvB6FONiPDZ4eCoafk6ixiSIZsafECTx/eVQOmZBbWd
         3/fNc4TfRXgFyzUSVBTu+8sxqDpNfCkeLI7BQXPFScfOnfqMDFCxaq5HHtB3G3FV8q2V
         lHkA==
X-Forwarded-Encrypted: i=1; AFNElJ/gQ+k2IO8sansOd9cHQQo4GVFDjw4MeqVhTLUsqn4tAlodTUReMFdeBU0wQrvzGg8bVxaOfq2/7NyzDG76DBVA@lists.infradead.org
X-Gm-Message-State: AOJu0YwmE8N9wpubkKU60UBKfyczRUWXM5gLIxGMk86c7bmR4hyiZb44
	SiGJ1sOspyShC//QndRxytqETr5d8kEWlS95wTDebQdSFpGShGeWU3wZOSEdYdSbYMhIR2V4Cc6
	ljm264OORZcOX2iB1XVGoJJ+aZFVqJBaXKWQV5dMvRPjqqWUfHEEOQzKt5xV0lX7eVo4YCpylOo
	AFNQ==
X-Gm-Gg: Acq92OG93xmW1PjjJk8ubb5AmalveqyT0yzLMTH13wSEHAJowi65rHhGMt7lYYCbMbQ
	eruY0abT8RnttyFTPu8AcmeR8CsUlYLAjDRgbsl1lGlt6WLZwW70ofnyBmOnEwErOmV1O7fhZgb
	jT6TVnX8/tKBQUJRWB0mnIjpkb6Yw59sSI5lYa78Y+crCk2qfECbnqy98Rufp/OKqa0i/3LOdoJ
	A50MwFupK8EmZsoZ8VjKY4KjVsWdGLbLsGwdHLiEEROUqZoB5QPzvvcQBEiPEogLL/Vq8l/vCOo
	Lko4m1v2eP/QOIJTQ++SRLhL9jQ/puim0Ux0obIyiTu1EDhSMerqTasgIE6ZDhtmPxtOU7W37KG
	A+sO2BmnkXmWmeYkzHo0H/aC4Ae3JNSd08/Zah1JbhlD3EmUvNTuWLnmKU/OCvrY6dbypqXTAPS
	cBVBTmP9yPnuQg+7Z2
X-Received: by 2002:a17:903:2ecb:b0:2bd:936c:8155 with SMTP id d9443c01a7336-2bd936c85b3mr230398595ad.13.1779299475104;
        Wed, 20 May 2026 10:51:15 -0700 (PDT)
X-Received: by 2002:a17:903:2ecb:b0:2bd:936c:8155 with SMTP id d9443c01a7336-2bd936c85b3mr230398345ad.13.1779299474561;
        Wed, 20 May 2026 10:51:14 -0700 (PDT)
Received: from ?IPV6:2405:201:c408:b079:35d3:6970:1f3c:72e2? ([2405:201:c408:b079:35d3:6970:1f3c:72e2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f2dcsm225979395ad.13.2026.05.20.10.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 10:51:14 -0700 (PDT)
Message-ID: <b16ab4d5-40d0-4438-8fab-6cff3fa6845c@oss.qualcomm.com>
Date: Wed, 20 May 2026 23:21:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 08/13] mfd: core: Add firmware-node support to MFD
 cells
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Lee Jones <lee@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Florian Fainelli
 <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
 <20260514-arm-psci-system_reset2-vendor-reboots-v22-8-28a5bde07483@oss.qualcomm.com>
 <CAMRc=Mde7Y3CQ3yi=U+999JyHTNacebiK8jJhHuYBGaqn59yYg@mail.gmail.com>
 <f604833d-b333-4514-91fa-3cf95f99f9e7@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f604833d-b333-4514-91fa-3cf95f99f9e7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0df494 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=UQidBoyNrwidYc1BrrYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: d5Nm21mVlRUNiKYtIpFU09kZHr0_grbs
X-Proofpoint-ORIG-GUID: d5Nm21mVlRUNiKYtIpFU09kZHr0_grbs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE3MiBTYWx0ZWRfX1MhFKoN/2pF/
 4025TFf3ZrJSQ5HTX3sv4vHB5p/vltv6s9deCK9MBwjtrHlxFj/IpnqHNEQjbryCjjajZKSAq3m
 nuY/mkS8/VTtYQg3T7jr04UwKKiTvyuQNZ3t6uu6GOmmVNVn3TlB8b9FkbHY/r/LHrQS0yonIoI
 IYufBoJP/BPtIWLUwjh+QJKE+LuvU44atorkPfFtu3+oiJGcXWO9wKl9qRrBE/G9m3nV2Y6Vzfg
 ff9lvx5HrFSdGjTaXVhtDsGaVr9SGC8ColBrrEbGuLdDE4Q0ggWORfBj/j0gx6qJIZF74OX3gEw
 VTdLeP8p5S/KYFU//W8KluFEObqa7BZvx2B7Qt798WLl1prMHcGsG7FVc8QTaNuh/PYztqcvRQE
 aM0gFbiWNXtGbkKQ/+lyuNASaYcIHlZ3nx6bw1H2PTrSi8ffjzoexmH11JlxR1EJVcDki00pRql
 j05GdG/DoNNgfIdeU2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_105118_287751_48D844B1 
X-CRM114-Status: GOOD (  27.82  )
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



On 18-05-2026 22:11, Shivendra Pratap wrote:
> 
> 
> On 18-05-2026 14:27, Bartosz Golaszewski wrote:
>> On Thu, 14 May 2026 16:25:49 +0200, Shivendra Pratap
>> <shivendra.pratap@oss.qualcomm.com> said:
>>> MFD core has no way to register a child device using an explicit 
>>> firmware
>>> node. This prevents drivers from registering child nodes when those 
>>> nodes
>>> do not define a compatible string. One such example is the PSCI
>>> "reboot-mode" node, which omits a compatible string as it describes
>>> boot-states provided by the underlying firmware.
>>>
>>> Extend struct mfd_cell with a callback that allows drivers to provide an
>>> explicit firmware node. The node is added to the MFD child device during
>>> registration when none is assigned by device tree, ACPI, or software
>>> matching.
>>>
>>> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>>> ---
>>>   drivers/mfd/mfd-core.c   | 30 ++++++++++++++++++++++++++++++
>>>   include/linux/mfd/core.h | 14 ++++++++++++++
>>>   2 files changed, 44 insertions(+)
>>>
>>> diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
>>> index 
>>> 7aa32b90cf1eb7fa0a05bf3dc506e60a262c9850..cc2a2a924d6d3044e29a9f864b536ee325ed797b 100644
>>> --- a/drivers/mfd/mfd-core.c
>>> +++ b/drivers/mfd/mfd-core.c
>>> @@ -10,6 +10,7 @@
>>>   #include <linux/kernel.h>
>>>   #include <linux/platform_device.h>
>>>   #include <linux/acpi.h>
>>> +#include <linux/fwnode.h>
>>>   #include <linux/list.h>
>>>   #include <linux/property.h>
>>>   #include <linux/mfd/core.h>
>>> @@ -148,6 +149,11 @@ static int mfd_match_of_node_to_dev(struct 
>>> platform_device *pdev,
>>>       return 0;
>>>   }
>>>
>>> +static void mfd_child_fwnode_put(void *data)
>>> +{
>>> +    fwnode_handle_put(data);
>>> +}
>>
>> Ah, this seems to answer my previous question, but...
>>
>>> +
>>>   static int mfd_add_device(struct device *parent, int id,
>>>                 const struct mfd_cell *cell,
>>>                 struct resource *mem_base,
>>> @@ -156,6 +162,7 @@ static int mfd_add_device(struct device *parent, 
>>> int id,
>>>       struct resource *res;
>>>       struct platform_device *pdev;
>>>       struct mfd_of_node_entry *of_entry, *tmp;
>>> +    struct fwnode_handle *fwnode;
>>>       bool disabled = false;
>>>       int ret = -ENOMEM;
>>>       int platform_id;
>>> @@ -224,6 +231,29 @@ static int mfd_add_device(struct device *parent, 
>>> int id,
>>>
>>>       mfd_acpi_add_device(cell, pdev);
>>>
>>> +    if (!pdev->dev.fwnode && cell->get_child_fwnode) {
>>> +        fwnode = cell->get_child_fwnode(parent);
>>> +        if (fwnode) {
>>> +            device_set_node(&pdev->dev, fwnode);
>>> +
>>> +            /*
>>> +             * platform_device_release() drops only of_node refs.
>>
>> Which is a separate problem we're discussing elsewhere. It should 
>> probably drop
>> the fwnode reference it holds, not the one of of_node.
>>
>>> +             * Track non-OF fwnodes explicitly so they are put on
>>> +             * all teardown paths.
>>> +             */
>>> +            if (!to_of_node(fwnode)) {
>>> +                ret = devm_add_action(&pdev->dev,
>>> +                              mfd_child_fwnode_put,
>>> +                              fwnode);
>>
>> What if the device never gets bound to the driver? The release will 
>> never be
>> called, this is why it's wrong to schedule devres actions for unbound 
>> devices
>> and one of the reasons for patch 1 in this series.
>>
>> What I suggest for now is: in tear-down path: see if the cell has the
>> get_child_fwnode() callback and - if so - drop the reference. Add a 
>> big, fat
>> comment saying that this must be removed if we decide to switch to 
>> dropping the
>> device's fwnode reference in platform driver core which may happen soon.
> 
> Ack. sure. lets me work it out.

Hi Lee,

While planning to address this for the next spin, it would be helpful if 
you could review and share any additional comments that should be taken 
care in next spin.

thanks,
Shivendra

