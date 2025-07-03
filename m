Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941C3C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 23:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G66uk6oLrJa+bE3tPC6EUtvc6W8R4jWMeiXs6Py51D8=; b=mH2MeExHM6/Kb+nSdO0t5CNjuU
	eAYmsRWgxO+RxCwTV9MycmLxyxOaKlTc9HQbFJvfwRDL+w6KuTVfcUt54ssn6O2hhYng9Stfsdvqd
	Ej1vFkjigE2j+FXDOezr+EIgMCmAg1dJKA4WLm+2epGk5WEKI8+Logprn9IxAfnCqHIDDCcpd+ACB
	eid4TUrreOxetN1rJ/qQvSjIIy4R5Azpm38m9JH+MMDJq/0n5fP1CaDudP2wrtmFvRQHxz8PWdbGv
	lret7o642CxRdKSWdgogyg0GjHKycqWp1iwORtEKL8AzQ41RU2co3h+yQmYMxbPKn7a1KXCOpxHjg
	wN/L822Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTXq-0000000Cqm1-145t;
	Thu, 03 Jul 2025 23:40:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSZX-0000000CkBO-01zi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 22:38:29 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563JJ6r6029505
	for <linux-arm-kernel@lists.infradead.org>; Thu, 3 Jul 2025 22:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G66uk6oLrJa+bE3tPC6EUtvc6W8R4jWMeiXs6Py51D8=; b=CWyUayD+8Bux6HrS
	CXSgMVfZdWOYL4PH1XzrD0XHMeNGifHqaXcXt3dSsVnScByMnmAkiQRTpL7Rwruf
	tkl+NV8VC8/mMl2p2UjTD6e/32uJajCEkw9ysfYert8V9Qs/l9Ij2Ztb0TW1zjn5
	Hi5Oic5NDb728rQvotIGsYRtInx+ZUoxbHQzTnOu6VLUFqldf0wY3+3zwsg3/53O
	Lo5F93pr4Ihri0ZI6Ija+X6iZ3R4XVvTn4UsbN3CVm08y+Uu9OMdOivvlHPYHQXM
	tOvQgY66FqQkZzZ4bdZCQZoEqnGrWWIdG2uJQViBPXBP5PK93LOpeYC5y4lbZmMJ
	w9OG2Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47nh9s36r8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 22:38:25 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b34ca003f1cso179772a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 15:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751582304; x=1752187104;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G66uk6oLrJa+bE3tPC6EUtvc6W8R4jWMeiXs6Py51D8=;
        b=L7tN1sVTo7cZr94DxRLYASO0hYL+9hmNclPWtXjy0HmK5UT3vQmSFFIa0hmvCjewj7
         IZ2K4ZIRQBeJgTfAXuWzMoGuNN5E09SP16zi2XqxVqdzo1oJJEM9EFjRmSxfChxBE6er
         bnWPU/HWIV5SYvJ/NxR4w0cwMmRiZHkOZnJrmesS+c9eWRM2jQ212acgtlYzVqRD6Gkj
         7V8AL3aSvaZCGKEoYqIgiPs3cDooNKELjAv8XNsIFACzLpLiB2svNeUTv7c3XkT800nH
         DOgDLQiDDyAbaImKSI0jKkpuxJFJPYOsS5FmfchPpPXDKuXwi7+qmoYqeQj076ddpU9Z
         Riag==
X-Forwarded-Encrypted: i=1; AJvYcCVC2p/3uLSeXRxyVc+D0i+scu5zOiMQCc8lcTQYsNpQXxi0O2TeLigjcMyExhJYUQPuxJS5SdxtoQ18MQUe8DwL@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3UwU7CZYxBVnOkmQXOXN13Pg59ynyCmwbtPbn09iXT781wANl
	aRYiaYu94Zyr3oHjIiet2E+Evae9eZL/Hizln7rZQ2YXakiCzTnncgtnjk8hE/G1FKKTkUcIf5A
	W/JvqfDV907N1olUWeDJeLPQEJ+UUzA+4IxH/WrGJ1rlY9C1rvY604wZ300QMVG9FqJDnoAEWJr
	CQoA==
X-Gm-Gg: ASbGncsTf1gJdGzTpkXvYFm3J+s3vf8QP9s6S8Nm6FargyuG/qUixmubsPzD9UaAn8J
	rJx8LVdxrZdirwoOrwkUawI121XifHk04nKFpKb2KOPAm3+CaJDHAvulbPzh71uzYHQycIkOST/
	0QpBItd1LRxE4byqyn0Xeo8uUksZpYbTEbwRrCzUDUxbQf1L9/GKXkhs/4vlsA5FPM8cwp5I0ZB
	qaMDPY5HyqqjJg0tio0i2y96SeEeomIObmsmBvMkGATtvWZm8Cy9tFdiMEVJYJdbTsgqOTQeKId
	E9o0sBbD1ecJRs6jNC+VWMVn9yxTRdHo1O0CGzHtITkbCQwqD9cHFC6VB8WVU/j+hPv8UB9wn/c
	q3dhSOAlF/7K3gG8=
X-Received: by 2002:a05:6a21:9989:b0:215:f6ab:cf77 with SMTP id adf61e73a8af0-225b9a84143mr678874637.23.1751582304187;
        Thu, 03 Jul 2025 15:38:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpT4Lpx7Qr7u2DGYV2UWbI8VMttTXhwYx8YoVd9mUgEjIMP8UGVB0SwmR2RW7RvDWCQB5IHA==
X-Received: by 2002:a05:6a21:9989:b0:215:f6ab:cf77 with SMTP id adf61e73a8af0-225b9a84143mr678833637.23.1751582303769;
        Thu, 03 Jul 2025 15:38:23 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee4a40c2sm559085a12.33.2025.07.03.15.38.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 15:38:23 -0700 (PDT)
Message-ID: <339f0d83-a28a-41f2-99ce-3fde0b5ef95e@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 15:38:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wireless: Use of_reserved_mem_region_to_resource() for
 "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>, Jeff Johnson
 <jjohnson@kernel.org>,
        Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Shayne Chen <shayne.chen@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20250703183502.2074538-1-robh@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250703183502.2074538-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=frrcZE4f c=1 sm=1 tr=0 ts=68670661 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=iqVkCsNWeGCx9g_Yh1UA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE4NiBTYWx0ZWRfX5KqgIvID4Ity
 w8Rt3jUiD2fG0UjBAc+MTWP0QKgoZS3M62p7YCm6elqAjGayMHoCI8/ygpNgXOTEZN46pBMMa3n
 XFrYSkDo3qRtFq4xthrMhYEPbz8FZUXP7ilm7/xl9uDSQcJOUGCUKXV5aE5XBY23gv+5j6ennys
 4ZnOXHsou/49zVfuLYJqYv5Yt+RLtAjtBXXLTyyCUO8l3nJBj5devw7/DH0r9/Xh3w54btLuIxO
 g2KMvXB01h1zDYO8zDvAiOaTmXulbeTJSi81zDOKm2zFuBSozpGuEljcP73pDNct1Y+Y/GJS5Ab
 l6GFKmreSnyOl148iamzRg/EVdN88C28NoFqcYIT6ga0G8BepgSbby/Yo1+mS4j2cIqpFUVCYBs
 dJ6Q0OM23BeECI6LBUf4MdxbDVcgZdrhFHIpYLvg+6aZT7iGkgeXKVyNedzUlOvTZW/WUlP5
X-Proofpoint-GUID: wOpQaPJFD8PDTIqa8TGqVyvFiASepeRK
X-Proofpoint-ORIG-GUID: wOpQaPJFD8PDTIqa8TGqVyvFiASepeRK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_06,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=722 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1011 lowpriorityscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507030186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_153827_083468_C82F9A13 
X-CRM114-Status: GOOD (  16.88  )
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

On 7/3/2025 11:35 AM, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> The error handling is a bit different for ath10k. "memory-region" is
> optional, so failed lookup is not an error. But then an error in
> of_address_to_resource() is treated as an error. However, that
> distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/net/wireless/ath/ath10k/snoc.c        | 14 +++----------
>  drivers/net/wireless/ath/ath11k/ahb.c         | 17 +++------------
>  drivers/net/wireless/ath/ath11k/qmi.c         | 17 ++++-----------
>  .../net/wireless/mediatek/mt76/mt7915/soc.c   | 21 +++++++------------
>  4 files changed, 18 insertions(+), 51 deletions(-)

Can you split the patch into 'ath' and 'mediatek' since those drivers go
through different trees.

/jeff

