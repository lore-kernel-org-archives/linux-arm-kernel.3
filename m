Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41D4EB7EB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 09:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t80u5LhNs8dedbnLQe3vnPgp0bI1VMt5bD83HvKUNdE=; b=lNjspOBvSISc5xYMeGqI03X7Hg
	vadLgjCMQc5tqn2/kT99v9K93EIFJTnYVR6mfgZ1jsoQvfoPPZkc9jZTs/R2uJqkANnn/sMylD50n
	p3K/+Is5cTyD3SYNlCYHf/U3vusvqUgvs+cI/xTqUlqX4ENRDwFSUCA9LcC63hlQNr1vIrgHx8TFd
	WVPcRX5h45TInCB0KlAEHddIbh8LBBxEyhlNY0Ybt9C87l5EewOvlW3/J8F/iOugGLE5bmg9P/Szh
	db4LTsQlAdNTMKUvWrsCrQsr6rMZ5EwykME7VM/I1m8hicr0rTXd8rwXZzUAvq3YQobP6ZLSd/g+8
	LUfz6r5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxidO-0000000GszC-427K;
	Wed, 04 Mar 2026 09:35:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxidN-0000000GsyY-00qn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 09:35:14 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SiVU152731
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Mar 2026 09:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t80u5LhNs8dedbnLQe3vnPgp0bI1VMt5bD83HvKUNdE=; b=g1/MgbWp9GnnXzTd
	dYgjmB5pE0P9xO0EdT20U1vIXpi5wS3RFe61V/EBK+qRPr9eONuDqjb9UYV2umU/
	XCP7CoOKVrwU57sHnaAy4LUA4efHqaLUfjweLNBhhI7Q2qzZR8QazjyrvWniEyPb
	QQYK28Z1sRZka2ZE29KDYJXFNg/0EdRPi/TmeNbb4jH6w3G5fmFZKHC+H/PiUrdc
	PTgx64nHg5jzDRyyzQ51s1Le/VaT5IGp7W8hsfQ7Yb6zp3JOAUrD3gO0jK5zYDmi
	9lS2S2AOKeuSXQde+RvkHYShPDF/QlA7jTobiMPM3THAv1Ntk1wMS10nDiGYvKV5
	Hm/DGg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp3tvk2xf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 09:35:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3595485abbbso5211675a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 01:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772616912; x=1773221712; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t80u5LhNs8dedbnLQe3vnPgp0bI1VMt5bD83HvKUNdE=;
        b=KvW1L/45qYs9wEDjI80l9DYRqb03HLFB1+1tFM0qk/f+kYBvZ9RwZpRV0XUwonZZMl
         8imXxwmObZ98/lhjZnZrGXmXTZu6tmcmOxTzRz9VGknGyRJOrAeQ7KP43gce9PzH61UL
         OU6wOpMCMH7/V3W1UXKQwR1JsZ6v5VoTIKomJFVMJay1K0KBmDGpxVHf3c5JpXtw9+Qa
         u4H0BtJL9wcZC7YGstpEc16fiYADAagJCacgg0YnWkNCINXJv+TTLkQeRMi4SwhsKQHW
         A1xH0RYtmXft9khOCpEer1IIlTTzJFsop+sYGW20JpNAdJYaJgB7HWJL2cM/Uj9flzoQ
         G+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772616912; x=1773221712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t80u5LhNs8dedbnLQe3vnPgp0bI1VMt5bD83HvKUNdE=;
        b=Cjmt28Gn/ZYjTqEcszgI/mh1FCrkewdThCH32IPFES83HVrCfqrkixNXg7B025YwXs
         vVIbKInStmOmNDCgeoJz59wEbTK16Zn1HNelSm9IOMugVMsLZhE2mWImvEWRsW3aUxM9
         NlxcNjo93v8Hlwz9dQ4iw77F7DAfC3CxJWNeqY4TT2jHqQ7ATPcmR0Hq0lkFmYETP8Hl
         pByyfIVQVeqbPXfBcgqhg4uvU1Un6yQM0IugnjzJInY9HZI1OiNfp04mh/nHCttzAdyz
         TIOPp02l5+5bZfd0cw0SdHs6WQVkkhJwDck7PoQwOWPcTakn9eeoQ5kk0VoW0FhhulYV
         yAUg==
X-Forwarded-Encrypted: i=1; AJvYcCVv7lcW5Z67GibRg3LcnqnTbPRgVkpgvCw6oYg9KzDELl3RghaQyUZVkJrNw0K1Hj2BMMfsTndY838isSpe/RGU@lists.infradead.org
X-Gm-Message-State: AOJu0YxZWrzptIZQ8CW9OYvtWA+DBPSPkOhEiPWVLk7vlLXaBBJgXHJC
	pQfV63OmQ+8ihSnloI0S2hxut1F3CNCyigPdzp2Orh+vix7vR1qr12s5+Q2auRRZGBdUxa3rGEM
	P2rvpFyo40P4ehEv6pYrpCmWr0gu/JSzvvnrcMeWb476hUzRhCOB9Hh40ZNVQD86y/00NDtN2j3
	G01g==
X-Gm-Gg: ATEYQzy1TsYqlMt4+4BWpFDlLJG0dSHo3Fzjr0/NdSKWbmCHKDDv9WRWPHWO3Ui7U4A
	9XI0/06l/f1PFIb8laIaNOswgA1R/LqPW2a14joir3Ylt4W25k6Xi/KuI44x7kVn5/h/gmpRJB2
	ItzejAG7ReFBRMq+rHsKoWQu9AVhzQe4ubPz4mUkoQ4eA3pQAnASpl2pFzy7l08PM+4YiMZ2Pua
	1c9Xw9Q22gPE3+5ugtn9M/P/DPQd/azHZfTm/RYgPGkZGzVjUaYaKLpMTEYmufqAS14OvKu5giu
	QA+nyPWxV8CmEY6g549vuqoG6AERjZ1Y2QV6z3G9ansCM0mzVPmveQI0q+1aAC/F52mIz5Nbyma
	9dVBHux/ZSDCguDI9d4MTxYvwi4RD6gB2TXlsGdkWCUQDhHot47VMUarw
X-Received: by 2002:a05:6a21:608a:b0:35b:9ba2:8cd5 with SMTP id adf61e73a8af0-3982e2036d4mr1560335637.56.1772616911556;
        Wed, 04 Mar 2026 01:35:11 -0800 (PST)
X-Received: by 2002:a05:6a21:608a:b0:35b:9ba2:8cd5 with SMTP id adf61e73a8af0-3982e2036d4mr1560306637.56.1772616910991;
        Wed, 04 Mar 2026 01:35:10 -0800 (PST)
Received: from [10.219.57.109] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73790f881esm1186795a12.10.2026.03.04.01.35.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 01:35:10 -0800 (PST)
Message-ID: <9aa4c1d3-713e-4137-8042-a73bea8e8f34@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 15:04:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/3] of: Respect #{iommu,msi}-cells in maps
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal
 <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
 <20260301-parse_iommu_cells-v9-3-4d1bceecc5e1@oss.qualcomm.com>
 <laif6gacqyacvchnfuyhu4w3f4746xlrlxrr23klrgtkbn7dn3@rracfqemavwd>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <laif6gacqyacvchnfuyhu4w3f4746xlrlxrr23klrgtkbn7dn3@rracfqemavwd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA3MiBTYWx0ZWRfX2TV0kkZnqNWA
 4L3EosJ1Js7uAw86qFL7oWexW5DEQl2flLEJRaQXXGqdfEjPpubkXyhXCT8ZYaiqzxW2x9bcqkO
 /bMQR4bvwQZ75g0HsMsemHutEuJqHg1v+ou/N5tBXixhu5oILeQLio//yJyzIRPWyR4Vv+0Vrtr
 jg08tB1b/LPb3L7btnT4jZZS7RqTyzjTmkCsb5X+e1PETpKaRVvAsg1+Hj1Dmo1Q+6zCMeloI1I
 kgfQMYQn9RCMgEamF41HUqeluYXkQ1weINIJaliBJNe/bn+Gb+swz7Md07giYuwztQw27xKueRH
 hFcraUoAIXaoi+zhH7sDP7boObDGGYTi1s9nxDE/ob4Hz/Tds9gXjeU1hNs9yc+u3UukXe7U47v
 AdeRhRZWMTt5EZQqDJp4fWeNGRk+Dp1FcvpuTB1uwKMSKNewzGq5pWmAUQKXhsS86cZwLK7ypUa
 1L6RBHEhPOUIJsG299g==
X-Authority-Analysis: v=2.4 cv=VYv6/Vp9 c=1 sm=1 tr=0 ts=69a7fcd0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=FlLgGEtdp7AnL9SkOqcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: IuVkVdSl1GRxvoPTeRq-kmoHw2SmloNK
X-Proofpoint-ORIG-GUID: IuVkVdSl1GRxvoPTeRq-kmoHw2SmloNK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_013513_062166_AF6E0272 
X-CRM114-Status: GOOD (  37.26  )
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



On 3/1/2026 3:44 PM, Dmitry Baryshkov wrote:
> On Sun, Mar 01, 2026 at 02:04:21PM +0530, Vijayanand Jitta wrote:
>> From: Robin Murphy <robin.murphy@arm.com>
>>
>> So far our parsing of {iommu,msi}-map properites has always blindly
>> assumed that the output specifiers will always have exactly 1 cell.
>> This typically does happen to be the case, but is not actually enforced
>> (and the PCI msi-map binding even explicitly states support for 0 or 1
>> cells) - as a result we've now ended up with dodgy DTs out in the field
>> which depend on this behaviour to map a 1-cell specifier for a 2-cell
>> provider, despite that being bogus per the bindings themselves.
>>
>> Since there is some potential use in being able to map at least single
>> input IDs to multi-cell output specifiers (and properly support 0-cell
>> outputs as well), add support for properly parsing and using the target
>> nodes' #cells values, albeit with the unfortunate complication of still
>> having to work around expectations of the old behaviour too.
>>
>> Since there are multi-cell output specifiers, the callers of of_map_id()
>> may need to get the exact cell output value for further processing.
>> Added support for that part --charan
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
>> ---
>>  drivers/iommu/of_iommu.c |   2 +-
>>  drivers/of/base.c        | 117 +++++++++++++++++++++++++++++++++++++----------
>>  include/linux/of.h       |  16 +++----
>>  3 files changed, 102 insertions(+), 33 deletions(-)
>>
> 
>>  /**
>>   * of_map_id - Translate an ID through a downstream mapping.
>>   * @np: root complex device node.
>>   * @id: device ID to map.
>>   * @map_name: property name of the map to use.
>> + * @cells_name: property name of target specifier cells.
>>   * @map_mask_name: optional property name of the mask to use.
>>   * @arg: of_phandle_args structure,
>>   *	which includes:
>> @@ -2118,18 +2145,19 @@ int of_find_last_cache_level(unsigned int cpu)
>>   *
>>   * Return: 0 on success or a standard error code on failure.
>>   */
>> -int of_map_id(const struct device_node *np, u32 id,
>> -	       const char *map_name, const char *map_mask_name,
>> -	       struct of_phandle_args *arg)
>> +int of_map_id(const struct device_node *np, u32 id, const char *map_name,
>> +	      const char *cells_name, const char *map_mask_name,
>> +	      struct of_phandle_args *arg)
> 
> Some extra whitespace-related noise in here. Last line wasn't changed,
> so there is no need to touch it.
> 

Thanks for pointing this, Will fix it in next series.

>>  {
>>  	u32 map_mask, masked_id;
>> -	int map_len;
>> +	int map_bytes, map_len, offset = 0;
>> +	bool bad_map = false;
>>  	const __be32 *map = NULL;
>>  
>>  	if (!np || !map_name || !arg)
>>  		return -EINVAL;
>>  
>> -	map = of_get_property(np, map_name, &map_len);
>> +	map = of_get_property(np, map_name, &map_bytes);
>>  	if (!map) {
>>  		if (arg->np)
>>  			return -ENODEV;
>> @@ -2138,11 +2166,9 @@ int of_map_id(const struct device_node *np, u32 id,
>>  		return 0;
>>  	}
>>  
>> -	if (!map_len || map_len % (4 * sizeof(*map))) {
>> -		pr_err("%pOF: Error: Bad %s length: %d\n", np,
>> -			map_name, map_len);
>> -		return -EINVAL;
>> -	}
>> +	if (map_bytes % sizeof(*map))
>> +		goto err_map_len;
>> +	map_len = map_bytes / sizeof(*map);
>>  
>>  	/* The default is to select all bits. */
>>  	map_mask = 0xffffffff;
>> @@ -2155,27 +2181,63 @@ int of_map_id(const struct device_node *np, u32 id,
>>  		of_property_read_u32(np, map_mask_name, &map_mask);
>>  
>>  	masked_id = map_mask & id;
>> -	for ( ; map_len > 0; map_len -= 4 * sizeof(*map), map += 4) {
>> +
>> +	while (offset < map_len) {
>>  		struct device_node *phandle_node;
>> -		u32 id_base = be32_to_cpup(map + 0);
>> -		u32 phandle = be32_to_cpup(map + 1);
>> -		u32 out_base = be32_to_cpup(map + 2);
>> -		u32 id_len = be32_to_cpup(map + 3);
>> +		u32 id_base, phandle, id_len, id_off, cells = 0;
>> +		const __be32 *out_base;
>> +
>> +		if (map_len - offset < 2)
>> +			goto err_map_len;
>> +
>> +		id_base = be32_to_cpup(map + offset);
>>  
>>  		if (id_base & ~map_mask) {
>> -			pr_err("%pOF: Invalid %s translation - %s-mask (0x%x) ignores id-base (0x%x)\n",
>> -				np, map_name, map_name,
>> -				map_mask, id_base);
>> +			pr_err("%pOF: Invalid %s translation - %s (0x%x) ignores id-base (0x%x)\n",
>> +			       np, map_name, map_mask_name, map_mask, id_base);
>>  			return -EFAULT;
>>  		}
>>  
>> -		if (masked_id < id_base || masked_id >= id_base + id_len)
>> -			continue;
>> -
>> +		phandle = be32_to_cpup(map + offset + 1);
>>  		phandle_node = of_find_node_by_phandle(phandle);
>>  		if (!phandle_node)
>>  			return -ENODEV;
>>  
>> +		if (!bad_map && of_property_read_u32(phandle_node, cells_name, &cells)) {
>> +			pr_err("%pOF: missing %s property\n", phandle_node, cells_name);
>> +			return -EINVAL;
>> +		}
> 
> This will trigger the cells_name property check even if later we
> discover that we have a "bad" map. Is it intended / required?
> 

It’s intended. We need the cells value here because determining whether
a map is “bad” depends on it, as mentioned in description of of_check_bad_map
this is specifically for the case where the DT has an iommu-map pointing to
a 2‑cell IOMMU node but only provides 1 cell in the map entry.

>> +
>> +		if (map_len - offset < 3 + cells)
> 
> of_node_put(phandle_node);
> 
>> +			goto err_map_len;
>> +
>> +		if (offset == 0 && cells == 2) {
> 
> ... if it's not required, then the bad_map check can be moved before the
> loop.
> 

Given that, the bad_map check can’t be moved before the loop, because we only
call of_check_bad_map() when cells == 2.

>> +			bad_map = of_check_bad_map(map, map_len);
>> +			if (bad_map) {
>> +				pr_warn_once("%pOF: %s mismatches target %s, assuming extra cell of 0\n",
>> +					     np, map_name, cells_name);
>> +				cells = 1;
>> +			}
>> +		}
>> +
>> +		out_base = map + offset + 2;
>> +		offset += 3 + cells;
>> +
>> +		id_len = be32_to_cpup(map + offset - 1);
>> +		if (id_len > 1 && cells > 1) {
>> +			/*
>> +			 * With 1 output cell we reasonably assume its value
>> +			 * has a linear relationship to the input; with more,
>> +			 * we'd need help from the provider to know what to do.
>> +			 */
>> +			pr_err("%pOF: Unsupported %s - cannot handle %d-ID range with %d-cell output specifier\n",
>> +			       np, map_name, id_len, cells);
>> +			return -EINVAL;
>> +		}
>> +		id_off = masked_id - id_base;
>> +		if (masked_id < id_base || id_off >= id_len)
>> +			continue;
>> +
>>  		if (arg->np)
>>  			of_node_put(phandle_node);
>>  		else
>> @@ -2184,11 +2246,14 @@ int of_map_id(const struct device_node *np, u32 id,
>>  		if (arg->np != phandle_node)
>>  			continue;
>>  
>> -		arg->args[0] = masked_id - id_base + out_base;
>> +		for (int i = 0; i < cells; i++)
>> +			arg->args[i] = (id_off + be32_to_cpu(out_base[i]));
>> +
>> +		arg->args_count = cells;
>>  
>>  		pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
>> -			np, map_name, map_mask, id_base, out_base,
>> -			id_len, id, masked_id - id_base + out_base);
>> +			 np, map_name, map_mask, id_base, be32_to_cpup(out_base),
>> +			 id_len, id, id_off + be32_to_cpup(out_base));
> 
> Again, having whitespace changes doesn't simplify reviewing.
> 

Will fix this in next series.

Thanks,
Vijay
>>  		return 0;
>>  	}
>>  
>> @@ -2198,5 +2263,9 @@ int of_map_id(const struct device_node *np, u32 id,
>>  	/* Bypasses translation */
>>  	arg->args[0] = id;
>>  	return 0;
>> +
>> +err_map_len:
>> +	pr_err("%pOF: Error: Bad %s length: %d\n", np, map_name, map_bytes);
>> +	return -EINVAL;
>>  }
>>  EXPORT_SYMBOL_GPL(of_map_id);
> 


