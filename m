Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F4910706CF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 10:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTYv1dXFSAG7Ui2x4cGtMMWcIHDnGh1Nk4Vqdo4b774=; b=NZnmOVwN4rRmdxPeB/CRtNi9Ug
	u0PYeak+pakkTubl/kVH37fc5snZV5vIeTnbZ5gedQbBvK039H87aPIttuPEHyXNjXpj9J3i4Cmsz
	IHk0sbx5YVArAKTiEsQXBKXQJnd/PIbQm2HH+K1y28TyME77tjE7JP0eDkNc2qN+JRHn8lb7xVuCC
	6bKShqIekrNWCRxz2jnAqbl5lJeYxIqbkjjr8+HI/7HIdVeQLThJlvR77dvKNtM60HB994kiLJCtY
	VO9lgUCHaXKbVBKoLuwQLqUq2HWNE1gwONoOWrsWkypNx6qU+PgTjFrLEYUgbXg1l+0odLW0ZF8wf
	9YkQSTLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1MXg-00000001kxK-2pDB;
	Sat, 14 Mar 2026 10:48:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1MXc-00000001kwY-3W5L
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 10:48:22 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62E4dKQ74128008
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 10:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CTYv1dXFSAG7Ui2x4cGtMMWcIHDnGh1Nk4Vqdo4b774=; b=HmDNMtal7+Xg6p6k
	uI6jIcPugYo8EvDp9/Nz+HPBGOawsx2lL9ZdzTybUylv98x8MdP5sg1DHnQH7u9l
	+aIrZd/mJ5RGDBmJofX6FwhYJk3V9RshVqzU23apu9dYUScvsEOMF2IG6zDc3G7Z
	HKu7/k4H9Gf0wCY3ov++ju4pI5RYG2XEsPy5vD4/vfMrRRyBKzgB3qt8HtWPnAX5
	jtl1VP572UEpnaY+6Crkw0xpoDWmkq/HbCVSHIq+StbMj4BR/bc6vT9ZEjuvMtue
	s3T10qCz40aSA07n8Xt0F0gQ4Hr5jY4hEQ6jgvoBtiV16fUzontVPrWJ5W//zmGg
	5eCivQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0udgha5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 10:48:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-359fe456655so2352027a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 03:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773485299; x=1774090099; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CTYv1dXFSAG7Ui2x4cGtMMWcIHDnGh1Nk4Vqdo4b774=;
        b=L5iZIPEe3YkTAmF+WZWEoJRK8u9nJmcFwk5mhk7bi0KErKtl91qea0z8EbCUcq1j3Y
         3IauktX09cm2BGi/8xKyc0lYciuRNrbTOHYBHOjOz5po/ZAGG0T8N6F6YjFoEEAdoGs0
         K+fjwFX/FKh85fv5XVk+Cnko1pTOAsK9KTkO/9lkkiZgWPc+0/D1Jw3USXCAmgz0i2bD
         io4kMEFOenxrxcxjsnBk3Dt3Jcq4EJkSV8VLwoIaQ222LSm9LiKqUvEppiW7m6fPnNSj
         o3fN971kWg1NDpUyxiFCYJ+vw6ffCdkW/sqfsh6k1aMKmz5EAdL8D8Z8AazrT8rLs6DP
         O+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773485299; x=1774090099;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTYv1dXFSAG7Ui2x4cGtMMWcIHDnGh1Nk4Vqdo4b774=;
        b=BpJKqZ+henm0FeNN91b6FyP2dsa0Cmq0wT9X5EZh4JoNcyNaHwXWJ9kLa5lf35OjHh
         1ekvmlcoBsFKvD/GGi8GJCL/JW4ih1i8DU6SJ+cuk5Hxpn+OOQnSYJp+UJ704WQwMVDP
         yrDnt3YMDlANzk+kY2uvJDf9BcTOxCefuzu0AEA5Jd7UZFryLf8UYxXBZfHoNbeow891
         URnKCOJ3ZXjs7+wftFLOMzWhP6/WUGyIS6Xzen37SGqw9UKMe8Lo8K2pF+fgcWInvncb
         0DOc2qYi4If5IsYRUaUNtgQeZs4bN4KWHquCCFZirxquMlYBBhNvPM+jaJaRlTADrMEm
         9Tlg==
X-Forwarded-Encrypted: i=1; AJvYcCUSP7tWH56B00K9uQ3QnjsNnV0jsf4gVIJVNlafLRaypzlhh4xbbhv0YEC/z+GEotPaGreV6Qc8+/idhAGp76P6@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3DcGLNvK+nMPssKesuBWmAWlMhas7W0+sVNhJGHvXUZ16Zd48
	v9b4h20B2aOwx+9Q/lVCout54YjcJx/SXkHTzNFvR65Mn4Rrd14bC5MhN8QgTPRbjaQDp60f8IW
	8E3kSI2KSujVoDqYgC8sebqNvVSPQNq3gClTjE8KR5+pD/zQzLZzuGEIAyqIdtlStn3HDHDqB/r
	+tL02KMEeE3g==
X-Gm-Gg: ATEYQzx3XSlCAWINvA1zySY21WfQDCfkHmyWhQ4VpMvok1IIcvi7JzDlikDVz6meGbA
	dPc4lNt9JrRxplnO1MzS1iTUxZjx5Q7zvA/JuITXGJFJ9PSpHwbkabHWnV9Zip8CgHO5E3g23d8
	EULv4DcLZ+KkgptI/08EH4HqQeAP2o4O1I4yUfhh85IMJ1XkNAWjqyN5XIoX79kpykEiYlGMI/1
	34t7nDcMFpIaSSRTy3blUyGuWxDzFmOioiJuzQwD+prdKLGst5XGuSXzX8H8JP/s94HAUZ1l1EO
	YAKyOJwST1o9flVLEn4QrRuAdqaeueWMXKLa9Mft182Uh/FU83mAVvqalOVixp7a7b1m3OTTjYg
	oeObIbdR5EDLoz2ezL80syIaWjRyFn+h241WD5KTXepEzFRixd/FCe5q7si0oRmIFgjjEhElJ/B
	ElouusVtdFhw==
X-Received: by 2002:a17:90b:4b05:b0:34a:b8e0:dd64 with SMTP id 98e67ed59e1d1-35a21efd272mr5787953a91.1.1773485299230;
        Sat, 14 Mar 2026 03:48:19 -0700 (PDT)
X-Received: by 2002:a17:90b:4b05:b0:34a:b8e0:dd64 with SMTP id 98e67ed59e1d1-35a21efd272mr5787938a91.1.1773485298771;
        Sat, 14 Mar 2026 03:48:18 -0700 (PDT)
Received: from [10.133.33.24] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a1ac3baf8sm7099399a91.12.2026.03.14.03.48.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 03:48:18 -0700 (PDT)
Message-ID: <71986394-0ed4-4ae5-afb1-7da4710856e7@oss.qualcomm.com>
Date: Sat, 14 Mar 2026 18:48:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] scsi: ufs: Add TX Equalization support for UFS
 5.0
To: Bart Van Assche <bvanassche@acm.org>, avri.altman@wdc.com,
        beanhuo@micron.com, martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "open list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-mediatek@lists.infradead.org>
References: <20260308151409.3779137-1-can.guo@oss.qualcomm.com>
 <d4b09db7-db5c-4d99-afb2-47deffc0cd17@acm.org>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <d4b09db7-db5c-4d99-afb2-47deffc0cd17@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BJ2+bVQG c=1 sm=1 tr=0 ts=69b53cf4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=BTOOqkP4DqQlibgNVLAA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: PyFkrCZd3oVoRhrs4vcSADL0p1LGEcCF
X-Proofpoint-ORIG-GUID: PyFkrCZd3oVoRhrs4vcSADL0p1LGEcCF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDA4MyBTYWx0ZWRfX4LkKzPe1xFkB
 erFVp1V/kWcMW3HzsvMEqJHQJObUO2VeaDTAEnNE+NJ61sEjsOxxqV9QRpYIpCDuNqiUYUhoYmL
 LJOMxfnaWi6rcVx6bnWeXxqUbtmAPbtIDs9lMHRAfEiThSSuYsBFVMBFu5jsFxUN7a44aSbDKOq
 bdLEENcNaTgWS1+3phCXlVPRqdyEv7U3JNSDHbqtxBmte0kabdZdKmAs/ZabFkenTNAWIlGmQcV
 qlYehaKd2gw7dBFDQhoh/hbpjoVHq8ZRkTK/HVaN3MzIr7V39bE0Ex6eIhSMQp3LLYrJqOxRs8J
 vwK7eprko8xP2hL3MqrUbgNXBwetyhu2IXjcEPhoQgdAszGtA2U+mn9Yxcd8gFogI9UqbH4PhYB
 MNaGHEi8bYBcj8ZpwW0Tj7p5q0LPTcAX7TzaU1/TUjBnb/h6qVZNxg9+ANdgg39FSKh09hR2eP0
 4FyvRAbDdV4/NCg+OTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-14_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_034820_942609_DAF113D0 
X-CRM114-Status: GOOD (  12.55  )
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

Hi Bart,

On 3/14/2026 5:56 AM, Bart Van Assche wrote:
> On 3/8/26 8:13 AM, Can Guo wrote:
>> The UFS v5.0 and UFSHCI v5.0 standards have published, introducing 
>> support
>
> have -> have been?
>
>> for HS-G6 (23.2 Gbps per lane)
>
> Hmm ... my version of the M-PHY version 6 standard says 46.6 Gbps for
> rate B or about the double of the rate mentioned above (table 11 /
> page 45).
Aha, good catch! I will challenge the same to Claude who helped me draft 
the cover letter.

Thanks,
Can Guo.
>
> Thanks,
>
> Bart.


