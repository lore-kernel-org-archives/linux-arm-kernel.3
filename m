Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE62C36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 07:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+h+8h0LMixJeNURLesg+SbAYAWOUVYEBpd9t3xgGFI=; b=w0BBuJNTiTcUwzQkf15lqtH3oq
	qIwkgZXE707Dho/wr3AM3R5YDNevPMAxAOT5dQaAoKtXAEXG8Q5yNc2aUQ0YtxZ0+dax2Kks/I5fW
	SXCdVf9yaKfhHfOHkSh+JvwFofKO6BdRVlLteA/oLOR3tAEAwa/UrbVMOvgn6t2wyiInzH9WdMmhY
	KySO8Gp2ihwRUywu++J9m80dZukSsqBeMpVHsEVzE43H8CzgX0+/5AVQdlUQi8tkBBwQ52le5WKjt
	l1obH2+iQ4MJOGcY19NIlGQ/8hEznRA7miIoNWgTx/Ubmy4Qjp2elo/3EulggH4YFeycjWO+NXMxa
	+GHGsRWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9IgS-00000005D8T-0nLF;
	Mon, 28 Apr 2025 07:13:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9IcG-00000005CS2-1gq2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 07:09:25 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S6a7Tb022474
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 07:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4+h+8h0LMixJeNURLesg+SbAYAWOUVYEBpd9t3xgGFI=; b=k9JykGZ3iiz4+sfd
	+RNYAEKGTkcf/xbDUTnjgOfoSuYIQ/jUuCUWKNjCy0qUNYJ5x2BTcJ0L9E3zhinZ
	WL2XeMgNaMg2YzmKHbUuIWRo7yxwIUb/wZf3sd4nxea7tIopUxekY+CG1y8niNPm
	2LEkrGCAsdFmp3jK7Pa3DUrGQQ700YETLZ3tQ4L8ubUN1zmiSmx+H/T0CfHYconG
	wYtxyXqxQeE1eRtGDBMnD0FaohqrBPMIbWK4stYzM14kLnFS7OPhTx+d2splqL8i
	IT7YY5IJObRZ4tWcXWqi1psYM0YsP5IAH4s1ST39xNAvOvGpDv2g3ciPJYZuCAAi
	UzDrKg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnmxqjh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 07:09:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8f9057432so92408436d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 00:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745824161; x=1746428961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4+h+8h0LMixJeNURLesg+SbAYAWOUVYEBpd9t3xgGFI=;
        b=uoaE8soxuxuCWd7jBdAdf1jj25bVihnkMxmuNAp0W1+uvXlrBmcuv774oOUkhcLWU0
         z0ceRnyq8T/xArB8LNCK3MFsY7pNcM/PbEV1EJZKYIClTy9D7cTUVice0mxbC3/cI7eK
         t9OachzsqXfvmBY6R3U7lVGeDNv2E8pptvXZzDAFzP2KPNZZp2ClUsfOpmoHDZMg/cho
         wcfxAvM3qjhYq53l1eLiS9ZoT9JM0P2Hit1Seg7riMr1+i3rYYhI/DZW3Yfs+WGum/Xk
         Z9MzuCOQTrNrTrqMxV+r70qVm9FsNn7kB0ScCCYx+3SmSsk4UWDGYrqMKyoa/SsITT8C
         e+Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWuUaXYwixMEJpnpV/f1wL0hSIVWZHS4tkH2CWrWWevPthgwhMluHJcii1FxDi+ZiU0UldNVD31wnNcW7Za4gSv@lists.infradead.org
X-Gm-Message-State: AOJu0YxZUk+FjeQPOumdK6Cysaj+3J5u+jdKjQJf2pmeYVnvuKiq62Nj
	z4hpaXpeqFIyNsqOgwZBBlFniU0OWCc86+RUQPAySio/cbUUBeaten5Cxu3H753kZ67zXpuaPtp
	17s0BxRStOaVZiDiF8AoxqZ2BWkTE+J51HFpuCiqQaLrv73B2/mkDwedcHf8M6VFbzs/1uT6DvA
	==
X-Gm-Gg: ASbGnctv2zFoCVNkUF+RT2DeET9rVikMOdNZDUJg5xlh62Z1EplKLPKiwxpG1dot8xI
	S+pqGxN4S+xPF3NXet7fO4DQ4OJLtLTYelAHGBKGMMHo/jsTGO7+6UHLRpgYqjqz18Ear9LTHXt
	OH8dqtgMFOAmJ4w+c48yrSJXWyhtYSVLrmjeG9Dmb1EkRqHs/Q7ByZUq/Y8Oq/ho1FFy3rR+/VD
	qfaYiC2bT+d8eMSEs7J2NslPzE2fyVV2sOQlOcp7H/e/Mm8isTMIn9c5zpiSJcKOsIgRAz3NUsw
	zr4fHTvjS0cRWvxdcTL0ZyIHBya20cDF7RsICqiVoqNg0om6rP4dwpw5TuzJlMoXTNd5gbcm6tL
	BC8k6edztC2siJXiRVpshTt6SDpBCDS46TFwucYCvUNXefcRN5iC4zk+RSotV70gR
X-Received: by 2002:ad4:5c85:0:b0:6e4:2dcb:33c8 with SMTP id 6a1803df08f44-6f4d1f90d68mr115293836d6.29.1745824161736;
        Mon, 28 Apr 2025 00:09:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtwfnsoBrLAILQfAhm++fx3/rvpDHPyHIMtORziW0tz+uem70yn1OXbhOpwYp+HbaGl9+r6w==
X-Received: by 2002:ad4:5c85:0:b0:6e4:2dcb:33c8 with SMTP id 6a1803df08f44-6f4d1f90d68mr115293316d6.29.1745824161249;
        Mon, 28 Apr 2025 00:09:21 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a5:9bae:495a:a192:5ac6:e42c? (2001-14bb-a5-9bae-495a-a192-5ac6-e42c.rev.dnainternet.fi. [2001:14bb:a5:9bae:495a:a192:5ac6:e42c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d16a844asm21018991fa.77.2025.04.28.00.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 00:09:20 -0700 (PDT)
Message-ID: <64a4698d-94a9-4b3c-ae18-b2872bdba6ae@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 10:09:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/11] Revert "dt-bindings: mfd: syscon: Add
 qcom,apq8064-mmss-sfpb"
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
 <20250425-fix-nexus-4-v3-1-da4e39e86d41@oss.qualcomm.com>
 <20250428-prudent-hasty-pheasant-aecec4@kuoka>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250428-prudent-hasty-pheasant-aecec4@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Fq4UFQqWAgCqd5JUdSYm6GBv24od3EL0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA1OCBTYWx0ZWRfX+ZVcUKkjRnpV 9YaCxoa2nbv0SM8zP0N/TKXp46vU9KJMAJR5VB3baFin2U7AgytxLFvqoSFiQKT50KTQ6ijvHNQ oB2gS0qsS0ezaJxsl253LRkVKCIuNKME2lLY1G0wQilcFc5YJGiiqoDoX63fqCmzvp4E6ypLffq
 lk9qZ/VO1zRJEyoaXVkip2vV/Qgj3DHmcQ4r9FTE6JAh11SKsak65SG3NiJjq0OEGTx8MvKDLre gsUI6+V4PDJ+Bfz0jmVATe3gSyXU6jo2qlVC4wpS7GxXZxZ0IgAuXpYQe7V/woJLPG8HuElj4yx wCvW8XaQWgiFrIUG8AZ1oQx6sX5jzBtLwk9AnsYqCmOpDos6Kuvd7ejhReYmJLEfKFToj9h693x
 JitSWfebefMo4HBnOGH9DeYsdPgcNMQ5h0dzM3D2sxCl8wil7tboO6pTWS6DoFk+bJABODtr
X-Proofpoint-GUID: Fq4UFQqWAgCqd5JUdSYm6GBv24od3EL0
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=680f29a3 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9Id5vWWJvOQx4gJFIPsA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_000924_494522_D2C4F8C6 
X-CRM114-Status: GOOD (  15.12  )
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

On 28/04/2025 10:07, Krzysztof Kozlowski wrote:
> On Fri, Apr 25, 2025 at 08:47:01PM GMT, Dmitry Baryshkov wrote:
>> For some reason Lee has mis-squashed two commits, picking up one chunk
>> from the first patch and one chunk from the second one. Rather than
>> trying to fix it, revert commit 2c8de7df7418 ("dt-bindings: mfd: syscon:
>> Add qcom,apq8064-mmss-sfpb").
> 
> I don't understand: that commit looks like direct, proper result for
> https://lore.kernel.org/all/20250318-fix-nexus-4-v2-5-bcedd1406790@oss.qualcomm.com/
> so where is squashing two commits? The diff markers have offset by few
> lines, but it's still just few lines and they do not matter - there is
> no diff/patch mismatch from that point of view.

The first chunk is about "qcom,apq8064-mmss-sfpb", while the second 
chunk is about "qcom,apq8064-sps-sic".


-- 
With best wishes
Dmitry

