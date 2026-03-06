Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE6FF01832
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 12:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUkRbAo0c0S2TlWvB7t+iwi/GOepW+rNCNuvKtI+MXU=; b=Dl+zJOpqtlFstfHGNfXRuclDiB
	rmVu6RXq7fbh7heY6UcMQyc83IKHp2D6JQAciAm3yvHyYauGZWc/jKunZ5xN+jn+CvB0QBYGd1aXT
	xyZHgXb1oZlniXV2C0kEQWUOP6kqjcfy9/ORV5mWsKIKtAojlDbxZFF07xgv5oQb6NtqE+diUXZe7
	CtjlT6Esrfdl0iJZ4dA7rgocTPGp7rEFW2FzlNMjFWCwNLmFYwmJbEgA/kHet36HvRWy5CabQ9g1E
	D7PImalBJcwR2/xZ6SbUcW0mQ251J3jmVHnnBK9h+c/cF9x9AjVRlxJB2ZIITnEMBr3LwCpN8tT/7
	5W0DZl4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUFc-00000003dnq-3zfq;
	Fri, 06 Mar 2026 12:25:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUFZ-00000003dmh-42cv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 12:25:51 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BafH04185879
	for <linux-arm-kernel@lists.infradead.org>; Fri, 6 Mar 2026 12:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NUkRbAo0c0S2TlWvB7t+iwi/GOepW+rNCNuvKtI+MXU=; b=eLCnNkmLsPJYxYtg
	qdJjU55/C4Mu8i+8CIxARztWS2jZUyolOBZ+nrPYrQFKlh62Im5f1/+YO5gzJER8
	jQ9kXAJVS5N00YlYWuzMa9yjLabWlSw4OS6VUjSSbKaWSZ8O/HRSNI50q6waRQkj
	uBSo0noKVLjeGoe9rPUedr668o0PBV/t/FJ1it0dbYuWvPGqg6oS33rOUJZdJRg4
	FjtmB6HGIBk3WSqx+fo5KZSppwIbyp+2t7YJmUXRkNBp3sG6NkAJEwWym8EBiEsX
	VvswcYq8jUmZ/bpwPTh66Pzig/sCmPA72DVhfEeyTDE+Um/Nd+KBDdVFHK+/DFAl
	BzSMzA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqruk9and-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 12:25:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae4cdfc468so56085155ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 04:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772799945; x=1773404745; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NUkRbAo0c0S2TlWvB7t+iwi/GOepW+rNCNuvKtI+MXU=;
        b=geRh0I0UEEJuCpy8lSbCYAzYK7j9Z0e0KbmoaE5FSC43E10PZ8dtuvyRs2VEvgpj11
         yxpOsfH134NNX24w2VFwuzV3k9oQiOwndnyPgwqofjMDxRGhsV0+raxHRoAfu7jlMRgD
         JoQwb5K/v+bYXKu+DTJDVcSY0/NT+Ewp1TkcdhBZhd6gItPaoJ7NAJjPidnVKHP9A+WB
         l0D/8jjjbFSdILqN8gltMo+vg11/5zb2bYA6Hq8TwaoDwQioT3bgMywdgAOUx7luLfV6
         R5wSkS6za0MGJG9gS08MCPZc9UXouwTcgx/5LWA52d0yti7Ca0rvkt3LSORr63aphtBe
         DimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772799945; x=1773404745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUkRbAo0c0S2TlWvB7t+iwi/GOepW+rNCNuvKtI+MXU=;
        b=PwJQOWRK6SH/nWIqhAl69Ieaeh92HoCISg29k+Hw4vzq/0FE1iTLxWEV9fqHpkPGFY
         +47XBdBaDbkDXFfdKZE2TASjl2s8eRwlb+fWnYVCcx+KhSBGXFtkwP88cp+A7tsDGsmy
         7h+G2J6phY6ySL9lTsTUoOi1GnZ3kTGGj/wN3fwXrZMY1le6NCLVwCO5TcS1jxmRfEfu
         VKpo5fGBB02LLn04SzVQKUS1sBKriENugly5pBb06WdmOS3J7nbIqQW+PPH2WNutr/xX
         a3S0E0j6Dgr90i86ZKAPurvNP3Ak65chCjKi5Rfl7BCsWZ3/ghpP/PNv+uAwDRJpr8ua
         Ur8g==
X-Forwarded-Encrypted: i=1; AJvYcCVl/dj/7nFRTlpnfGscQ+vh4ifwT3q8CNhh6Phlvd7QSQxtw9+u74byc9dSe3xyVj84x1h9OXFvG2IqddBt/Auo@lists.infradead.org
X-Gm-Message-State: AOJu0YyioVYLx+zpDRLfXtyFauk/wV/X0IOE1/H+2QAEcY+JP61T83j9
	v9nrUka/iomTvkQA7xpVW/FLRXTOv1bJioXqbo23LsrA7gE35bKORKNfq29ZoRvJv+BQGXugWz/
	3sVn24hrbP+0oJR4TjxqYbLQheznhXwQ5usnrCD1ZRvIgj0JCB89s0rQ+qI9yXmGdNbDazq6YKm
	/Uag==
X-Gm-Gg: ATEYQzz/2WlR8Nmo8nkPolcDJ5RgWv72LVUprSJfrBftRMdE1ec0XKUfWajcPSqJFOW
	GIT8Yd1ZFlzd+erwefcAH6QvpUYupIpaRIMwKX3wFmdStT3mkZa4HZzlRYQCJMwV2M8oN7X/b6I
	pftU2FDclXuvjAX3Ls4pLumZ7oME0vj2N6vZTcMd+YSMTYH3P5l1DXwc+srXNI0AmSdsTknlMUB
	tOiw71GaGIzjO42S8shqt+WZUKleya9d+OsmxWKBrU0UkZ72/VHXO6hOqPOplMdREsSs0QB84it
	27xii3AH6Rt9QrKHjUAnyY2v4YSkTdtPrBGyi19Lbz8jsbTJhJJpbV2t0r5G+ijPbJGZ+22GloD
	c/AgnRAQhI9AndP5yUdaWqRl3qmhB/7R0KTyeXW/Jp/cmj8bfD3eJcMauK/nx/LzEHJD4bfkYhJ
	HfJAfqSOGPT5U=
X-Received: by 2002:a17:903:f86:b0:2ae:3f3f:67b8 with SMTP id d9443c01a7336-2ae82382430mr20485235ad.15.1772799945429;
        Fri, 06 Mar 2026 04:25:45 -0800 (PST)
X-Received: by 2002:a17:903:f86:b0:2ae:3f3f:67b8 with SMTP id d9443c01a7336-2ae82382430mr20484965ad.15.1772799944923;
        Fri, 06 Mar 2026 04:25:44 -0800 (PST)
Received: from [10.133.33.226] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f74e4fsm18940945ad.58.2026.03.06.04.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 04:25:44 -0800 (PST)
Message-ID: <2ffc06fa-002a-4058-a78f-9ff60da9ed22@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 20:25:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] scsi: ufs: core: Introduce a new ufshcd vops
 negotiate_pwr_mode()
To: Krzysztof Kozlowski <krzk@kernel.org>, avri.altman@wdc.com,
        bvanassche@acm.org, beanhuo@micron.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
        Ajay Neeli <ajay.neeli@amd.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Peter Wang <peter.wang@mediatek.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Stanley Jhu <chu.stanley@gmail.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Archana Patni <archana.patni@intel.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-samsung-soc@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
        "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>
References: <20260304135313.413688-1-can.guo@oss.qualcomm.com>
 <20260304135313.413688-2-can.guo@oss.qualcomm.com>
 <8bfda6d7-f802-4b44-858a-f52ac8c051ac@kernel.org>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <8bfda6d7-f802-4b44-858a-f52ac8c051ac@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNyBTYWx0ZWRfX3Hdhw7hXJv5G
 FNHOgPUiHe9Ew6q6Cfa1YBjSM7QIWgPaIHN+aCe+NaU0iYnpIh6QLWL2iiCi1Gwru1lmMuVj4fS
 0YBFuUBCOZplddDwlXIIS4YzfiEtr7IKlHjX2RtAACO1/kZFtRW2uxLsLJ4VLWhuYIP0/9eXPgm
 nsl9Cu/zTGQbV6D2GrJkviXUo8LJRG76M9MOYTENNtOeDm3DoKxH/0rgnOqxkq1nSQib0d0unt0
 eT/r1A+Eu15hGbmREZHe8x0THtt6YBAffrhImj8PPsb8jGMQaDjHe4PcEIxTLFrVz08Vy4kmFNC
 DpSBgSeyYuHZo1RRwF8X1dXYrUP++fTUPU/xNk2tYs/5ANrTFAg4iyaCqUF5cJnbtN0OUt/gTzN
 Kjigd1AihzsVGiXePtOp74ANIymKSQEdGC5lVIe5j6PmZrX/+JPfcA7jDC19poNYJwdTCz48E41
 xf0Ib5E8i9qE3bFQtZQ==
X-Proofpoint-ORIG-GUID: 0la1jQG0vk1a7mQaMSkU0EtW8NEhE7gi
X-Authority-Analysis: v=2.4 cv=DvZbOW/+ c=1 sm=1 tr=0 ts=69aac7ca cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bBPRlu2x3IQPgS2CUtEA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 0la1jQG0vk1a7mQaMSkU0EtW8NEhE7gi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_042550_128926_C19FE803 
X-CRM114-Status: GOOD (  12.54  )
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


On 3/5/2026 8:53 PM, Krzysztof Kozlowski wrote:
> On 04/03/2026 14:53, Can Guo wrote:
>>   {
>>   	int ret;
>>   
>> @@ -4747,6 +4745,22 @@ static int ufshcd_change_power_mode(struct ufs_hba *hba,
>>   	return ret;
>>   }
>>   
> Missing kerneldoc.
Will add in next version.

Thanks,
Can Guo.
>
>> +int ufshcd_change_power_mode(struct ufs_hba *hba,
>> +			     struct ufs_pa_layer_attr *pwr_mode)
>> +{
>> +	int ret;
>> +
>> +	ufshcd_vops_pwr_change_notify(hba, PRE_CHANGE, pwr_mode);
>> +
>> +	ret = ufshcd_dme_change_power_mode(hba, pwr_mode);
>> +
>> +	if (!ret)
>> +		ufshcd_vops_pwr_change_notify(hba, POST_CHANGE, pwr_mode);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(ufshcd_change_power_mode);
>> +
>
> Best regards,
> Krzysztof


