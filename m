Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605DBC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 18:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCHZNtni/CSZJ0FFRkrYJ71iWbDqICIFGe1C4Jypxx0=; b=QMexZ2GuKBJhqfqXRws/RrU6Nn
	RLHfcY3BXnJJiSEUa8Qqb7a8NzE/thi0ili+z3p0IFtjK7oLtG6w5UMHPZa4b7VfnehtRvDxFWQQJ
	ai9GhaifPkRdaifLoD57KRUg0F6JyZCJ+ID/584BtADlBwovdlvYoclxRAOv+se64GZnFosil9g9D
	4adQjopTF9crzpjaAd94K2NtKv9CixW24+okERy8Z7GUBz+/pZnQdenQbaDzs8ZDwIdE+nBNBYuzg
	QO7G3KdHcmQ0wFVrleYe1AdWiSYUcp0QfUE7epdt3rF7EFskBr2VebDlYI3O4BU8r8tFk7j9zzKkN
	ls0Ed9Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thYMV-00000000t81-3nAY;
	Mon, 10 Feb 2025 18:18:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYK1-00000000sWw-108M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 18:15:54 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9R4LO005019
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 18:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zCHZNtni/CSZJ0FFRkrYJ71iWbDqICIFGe1C4Jypxx0=; b=k98TtJxG9YSJjlkz
	AZn4RsntfJ37bbMCwWkkY6LGBUw+WXm0i23q95qFfFBG9wSOxFzQ7aQaN1vLHXTc
	t16eCKLZcEd9Ng3RlWoINgr4B+0iu3EmsBXovO5HGRPRM76udX/swr8InhRYzYM3
	qYnKXvuvldCKB8tuL6lCSgs8yqklbLHdBFPdtyKW5TZ/JrfZ6Cvx6b/hZLoZWaqj
	ICqGUL4Edn/+pVeq0nvdeyfFlAsFa/bqwea3trGlIlbuFTFh7zu29JDM3BpyONdB
	XWT0mlS5euFx8RvxLJY01O72MUSsjzb8cnXLoduwp9bOvuTzJ/SmaPj1SOjKnXuj
	EXff7Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dyn7a3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 18:15:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e249d117b7so5191076d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 10:15:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739211351; x=1739816151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zCHZNtni/CSZJ0FFRkrYJ71iWbDqICIFGe1C4Jypxx0=;
        b=YsRw7ZhUihlxeEYDwxT75srgfAHRWhZ8Be5FNMksj+o4n9nwD/nsA7w7Ua84Wvafp6
         ZiGR/6l5LO41CyvraQQUNgtDMg/d2ufGYUa2ZV43z8oXnS86s0ZQj5k6vS3WYw8GWOZC
         7f5lSEdePFcWx9UT+4b/Ro4YDe28FwswjBlTgIjUFz+qb25CBDu2oLBQ8O7m9fBi4pYm
         0cq2FG5qR7p+/O7IxwMQ482dlKFhj3q8QKUsWyxUOac8bz0RTQCpL54b5dJVTttNfYbd
         ABR4Ex8C8CMuQr7KbgugYcCOMmAUZHehq7fL8IqG8DkN7CbM7nENVoq6fs4zkLh88ode
         ohiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ+RGIYd8VqhIpk+A/lNrsfZPCeygYLEN6pSNt7hF6mFbTtMXKnv4AueB4WT+OmvGXqDz9zP2Ev7QzztzsyYZh@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+r6/rCX5uXS9TQD6DpvxTP4Fc0woh5X0/yBjQ+fxitB1YrHUj
	v2R7Ck2Gu6M48HLyP/1tlyCm0rBpupSaB05Dt+SLTkQJ8wsdn8XEuk0hEB0rIiPuqQLW/9pOn42
	g6fo7fm9trmnbRKiaqHMbjh3vkLiY2CC9JPYnFxi1/P36xAPCjScNBo+ThCKLZlaJID43noXCQQ
	==
X-Gm-Gg: ASbGncs8JIjnhznEbmjTsGz3g4lanVz6t3Dp8MinMkBMJB4CIopKMPgKLWtkOuSAkeV
	ULOc2e4o2uZmwilMgjLU38aqGEF3b7+c1Pyy5lMGuI2D9aJbJhIe7S0W81zroG6Lu4ga/OATwlg
	qhFSb75EIu/Cq5kUXP/HegQgrw4TRiTqugCzo3cO1tbuM4DRMqzwR+zlr3pJhYwNre5/CcDSmzm
	l6af46C488AQ1l8AeCAovRP8O/NmvUyD/qbo9rYrql7j/aoxYXyDowWRxzYo0WBWZNmkVuZwVwy
	fKldG9AG6oXdpVEZfzzZJSN4mdD90QhEpu7A+MElFbVO8eYOLkStwKBR0SA=
X-Received: by 2002:ac8:5fcc:0:b0:467:672a:abac with SMTP id d75a77b69052e-471679dc26amr71995281cf.4.1739211351348;
        Mon, 10 Feb 2025 10:15:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+wRXNnWRPbq293evDdIvEhGqEHzq1kYbvdr3w/KyUUAyfZrYq8rC1dDpVfln5xyQdRsb5ew==
X-Received: by 2002:ac8:5fcc:0:b0:467:672a:abac with SMTP id d75a77b69052e-471679dc26amr71994941cf.4.1739211350986;
        Mon, 10 Feb 2025 10:15:50 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf9f6c77esm8235727a12.69.2025.02.10.10.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 10:15:50 -0800 (PST)
Message-ID: <0a1735a3-b57e-4a98-a3c8-46e92b5cdf0f@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 19:15:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/6] clk: qcom: Add NSS clock Controller driver for
 IPQ9574
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        richardcochran@gmail.com, geert+renesas@glider.be,
        dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
        biju.das.jz@bp.renesas.com, quic_tdas@quicinc.com, ebiggers@google.com,
        ardb@kernel.org, ross.burton@arm.com, quic_anusha@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20250207073926.2735129-1-quic_mmanikan@quicinc.com>
 <20250207073926.2735129-5-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250207073926.2735129-5-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ku6SJMmR4WvllCQqBBxbN4D5hS2qejmy
X-Proofpoint-GUID: Ku6SJMmR4WvllCQqBBxbN4D5hS2qejmy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_10,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxlogscore=758
 mlxscore=0 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_101553_286216_482F3420 
X-CRM114-Status: GOOD (  11.89  )
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

On 7.02.2025 8:39 AM, Manikanta Mylavarapu wrote:
> From: Devi Priya <quic_devipriy@quicinc.com>
> 
> Add Networking Sub System Clock Controller (NSSCC) driver for ipq9574 based
> devices.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---

Thanks for getting this buttoned up all the way

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

