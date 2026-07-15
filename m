Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A8FC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x9HbStl/BzF3lZnAuHGCNzOkA2YjZqn3RRATWA0aM4o=; b=yZHPOd4ND/Pb09Uu0wHy2F8Nao
	BF9zZZ0UJb7ICg4GrQL0D9XliqR/jSA4JpGifqL4JrwZlbYLkQjpJJC7sYd67/QPW3M8svXkEDTMI
	RUtf9GpfKVdcevMBYTimjjCEN5diE46EkzUAqtYNGx1FXJVAh1Kt2K+vxlAz+xViJAzggr1lS0pvf
	sjq+brOfbtGuTxcD3EUc1iq0oFCLASB65vpTKvQ3iFLOjjS6v54Zhzn4elem2tXfQSihm0zwxngDJ
	4njhrhL0k/1vITiA9wrxOsZJ+8J/aiaOpjQ3TPmqTKmCi+pVzzCgwrHJnAEdlvSnJTKEjTxq2/51K
	o3ypVbWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjynC-0000000EoHh-27KS;
	Wed, 15 Jul 2026 12:32:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjynA-0000000EoH4-3uEl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:32:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBctYC3339492
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 12:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x9HbStl/BzF3lZnAuHGCNzOkA2YjZqn3RRATWA0aM4o=; b=GxosF29mlEn1Qxs3
	5o/4d5QBd1KCSGGHzVVtwh+vIQNsBNc0b9irJQ2GNEk6pYiPVwFc1UaDSZdYhOpV
	e4TFe39YMufArtUKFDY++oYcrDu9383doJTOp6RoZRlpdihq9SmOXmG98NJj+XDJ
	sd2kmO2vVublGF4RHrQdUmUJ9qCEwh1PSilkxKhcwH2lo7CPlIhcDb5boumrpJiw
	Iv2UgT++xSoxpOW38J3FjPcwJ2Yy1frdV4Pn2JnRX9HPF50uxlHr/JtnNo9jcrA6
	XCAHpgCRHLsXT2YTwdNxdn+9vN3RXU40hUmiCzwBwFVf6c0/ehP2HkgA12/Boogn
	KH5PFw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9mkpp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 12:32:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e095fd889so4221770a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 05:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784118768; x=1784723568; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x9HbStl/BzF3lZnAuHGCNzOkA2YjZqn3RRATWA0aM4o=;
        b=YpmqhpmYd95J4ziLxHgCKsZMb+eyL+Q03s0L3Mnq/zqsch2BlI86V1BPLl7big490I
         E5g2syRL107uw2t7WyBK+jD7G6NE5Z22FdRqjqMFoKfXJG5K7U68aINdbND1RadMX6Nh
         f8WHd9KhJ/a3YReN88piwGOAun5RQRVhq3c8S5EMduHh91k58mhOqxagxOxjDmTtwB2K
         Ebx3H0GZiTvBu8Tvvq1dq3tMFGdOCYRvNaABGzruLwtw4FS3SghlDg3hiBSNSSk1Nb2x
         1azPzoNnKUk3r4i58NN7DJdUoD3sm4eDu05JoCwHMTCJKzKgbCl7gFKI7/Seo0bPr8iL
         YkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118768; x=1784723568;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x9HbStl/BzF3lZnAuHGCNzOkA2YjZqn3RRATWA0aM4o=;
        b=P6autoBjEmvb6XruT/6l/r8ppOfxPuSWVazueqOfdJQbbK3z8AvARNIPF+J58C8ZBd
         +El/8W28GZ+MtrO6yJZW2VANkwn+mtKvJbAuwFr40o2oXn25BW286R74ndp9GdgMxZ3N
         89WQUIw0opvNTLDwFTUUitcOpNKiiwrVpErL133MICUvKFuKOe0UcRnqOTajNve/cTCo
         Xo8ydc3iQVPDTb5pNpONefS5VkQ9cKqVmvebouEb33WnyuH2drKDwabkfyvE1WcBLhO6
         4CwoWbVSCNYn5omOIZlsEuy20p5JVYuPJmIuiQJ2d7/8jR93e1oy7zb7JaUSXx+RMjct
         m3Fg==
X-Forwarded-Encrypted: i=1; AHgh+RotxvAkA6pcaueEg6ym0dLtpXWlS4aYzHbp3c6DjeL5X3OafjkOmBe834VRj+0R68LpU4VxHgovdNCPZuSsa97s@lists.infradead.org
X-Gm-Message-State: AOJu0YwAEY6ijRDjf9u9liJZh9Vx9hQ6SFqiyfeeoiuwHQIXqRZln7HW
	lisAMp/CQW6DUIBd5vYBSBZalvj5XWDpq1/uZ8H1fxv0RMVF8bId6w8UiwGVfig328NAkMFZc4x
	k9h6aEJz9dGsFK/kJon3CqdmVy89MHALG0qfmfqhaH2GFoOiZCJYIKYa4NAgXVDvIwQurmAfMX6
	sIfKFIDdDfuA==
X-Gm-Gg: AfdE7clGfiDABYE9pSBLaJaUrf96QSec7anwEoirH6O9SQZc4G5YG/K3JHv1yUAQ5oK
	6VCk6xP9HnVkJCPdIE/BmqygfH36TI+S9FBCG/MQ9vpgvG7LFhbppURVWE6qXY8+c8nGpF9cjna
	DuM8NDfk26wKD653LmvoPQIYcTCR+UpLWvf432VUJZW86huy1VrfQ1G+E0W/EJK5z0j6tjAYIJK
	umEzEVi/555pmkKeBobjr+QdjSBR4tfvBtjZbPW7c1tM+KdPs5cUo94TESwmD3yfL76T1pL8rmy
	GIVA1bE8jRU2uDWmc7kSpq5L0Y+KOruW0iJIOv2nn4wgjurOyO+2hPl1xtndeXWRzoF/AhVhdPC
	nCKcEOWYtydUDHDpkg+A8inS1IzcvhwiTMBW1rDSO9jyCAg==
X-Received: by 2002:a17:90b:3c81:b0:37f:9ce1:cdab with SMTP id 98e67ed59e1d1-38dc776da74mr16463989a91.33.1784118767638;
        Wed, 15 Jul 2026 05:32:47 -0700 (PDT)
X-Received: by 2002:a17:90b:3c81:b0:37f:9ce1:cdab with SMTP id 98e67ed59e1d1-38dc776da74mr16463948a91.33.1784118767258;
        Wed, 15 Jul 2026 05:32:47 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e5306afsm1515390eec.9.2026.07.15.05.32.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 05:32:46 -0700 (PDT)
Message-ID: <5aad793e-2dff-4727-985d-5615a204f309@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 18:02:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 02/13] power: reset: reboot-mode: Support up to 3
 magic values per mode
To: Bartosz Golaszewski <brgl@kernel.org>
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
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-2-e7453c548c21@oss.qualcomm.com>
 <CAMRc=McKp4WsOY-EQ21n2wbqCp5V0Lr1Cbub5geEhz-LZvVkZw@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=McKp4WsOY-EQ21n2wbqCp5V0Lr1Cbub5geEhz-LZvVkZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEyNCBTYWx0ZWRfXzvZcyfRD9ZV8
 EXZFMh/enTx8KKcc1RYOtfmP4gN9lGhvssuNMSefcYEleJ7zKEn4YQDjD6p4dWQ3Y9S/L10Oogv
 vAVsahnLoCH4P/2RZRCJ/5ijqM32xvKvJs4T6Qo4xAKMZefPKAoheBaVIqNYpSG9UJWRe2Wmz50
 1JteWS8BtWUI7XhaGEyKKugGF27JMxDSctAh3RJoaudZlUMm+HtrYj2cH4fwJziurTXS275OOIb
 jbLULWtU1a+yR0GDCi10k4BcPdc4FY6ytUf3sbcZzdnBguzED0DUQ+BXWSFxe/NsIV0l7Bvxn2A
 OhF9yIdxQlCprYGVIqubns4segw3eA+dKasih3LmxM+bbnvb45p+O6jJWDYqdcdT/SuR36BUye0
 9/vid1LtRekLBb0dg0Yb4gBl8mMdxouN4OlkVe+WO3qgDQC7tn6a6FGlLAQnkh9QH7mkwla/fjk
 0mkk6dmn3rDWD308I0w==
X-Proofpoint-ORIG-GUID: t_PTtOMSnvcX4y4zs293g3HFcNZMYfkf
X-Proofpoint-GUID: t_PTtOMSnvcX4y4zs293g3HFcNZMYfkf
X-Authority-Analysis: v=2.4 cv=E+79Y6dl c=1 sm=1 tr=0 ts=6a577df0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1ebYhdgdrGDEZLiK4_QA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEyNCBTYWx0ZWRfX26Lu79LgS1gm
 kjNgRKRt0tPK8/QRc+WNoTKivFmaA39cOPT8lmP6Ic/zaurOwpbiBfU+8sZPVpbrKmVLanvoAMG
 K+IhEvpGklq6enbVvyUsG4sS/mHqxaw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_053248_981781_98D0BF56 
X-CRM114-Status: GOOD (  16.24  )
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



On 15-07-2026 17:56, Bartosz Golaszewski wrote:
> On Tue, 14 Jul 2026 19:16:30 +0200, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> said:
>> ARM PSCI vendor-specific resets, require a 32-bit reset_type and a 64-bit
>> cookie as arguments. This cannot be implemented via the reboot-mode
>> framework, which supports a single 32-bit argument as magic value.
>>
>> Extend the reboot-mode framework to support up to three 32-bit arguments
>> as magic, per reboot-mode.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   drivers/power/reset/nvmem-reboot-mode.c  | 10 ++++----
>>   drivers/power/reset/qcom-pon.c           |  8 ++++---
>>   drivers/power/reset/reboot-mode.c        | 41 +++++++++++++++++++++-----------
>>   drivers/power/reset/syscon-reboot-mode.c |  8 ++++---
>>   include/linux/reboot-mode.h              |  4 +++-
> 
> Could we avoid having to modify multiple files here by just providing a new
> function:
> 
>      nvmem_reboot_mode_write_full()
> 
> with the prototype you proposed and making the existing
> nvmem_reboot_mode_write() a thin wrapper around it?

sure. will update it.

thanks,
Shivendra

