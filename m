Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC00DE784BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 01:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJ4BWOfev0AxvWtR+KH2UmHGgImxfHsSAZSTOYN05QI=; b=wxa3kqMBgp5AoIM7cAKzWJr3Cm
	h9vG/KeCa9hix/PbVdM+SyqMufV4oWcIVtMipOndMYcnSYMeUtAgDEK7w2uMFRlPr1Kr++SBJa8r0
	MGk9Jsjbm0I+iOk7DYFi2zMylCSA4kLyHISuGUFRi8/XTqS4yPS+fyvewmdSXTVhP5hIOQDCs3A4Q
	9Q2AxUbXAr+SN3BlpxExo1jkqZAsgYxEwXCCmD3Le8l1K+3pVIzjGgOgvNtUO4DzOd5KRlg2srMh6
	DcFuutKutSFgOvRIoOJAGMKdqq1M8hIQFv5dzuOgMKJShgz4OMcYw5yhCFEJK91wUzu5cPMDdKsKs
	hkyO9F3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va1mE-00000003Auo-1NBk;
	Mon, 29 Dec 2025 01:10:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va1mB-00000003AuH-2yvq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 01:10:25 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSNkVKp3328630
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 01:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HJ4BWOfev0AxvWtR+KH2UmHGgImxfHsSAZSTOYN05QI=; b=a1g1UZ94UWEI3AW0
	8TGiINT+51HQ3qkfwq8oCbblk28z9UNwEYGXaG0J12KLkrkxLMwiFE1KfKief5gg
	ttApHW3k04k3CxVZNfWk9c1Jp/a0f8e7e6fhQoIMKmW5CMxSfd2SOAcv39+ZdDC0
	wd5NykAL9582sKb1kCSbdOlelSTxF5X22Iuod9AnPD0ym6HDYS/1LBfmVUHIRrh3
	JoL7Ol1hWfntpwVXYpkFpXKknDFOjtdvJ0NoN9tOVQEOycVEOuf+E5HvYz+RvaaW
	0F0/dZ1EDh8IaLGaom7Kg3mNNrjktkRreRYFe/tjq3yzr0mEFRK1d56LO2JYCzkH
	tnhvyQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba8r6awem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 01:10:22 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7c240728e2aso18912645b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 17:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766970622; x=1767575422; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HJ4BWOfev0AxvWtR+KH2UmHGgImxfHsSAZSTOYN05QI=;
        b=FHd8UpTCbkbt/A6PKxsyWwt+LmxE0getla8780vypIMEnGgRGKLpJ/7tp4OLe5cMt/
         AzgujmlC0p5PjgYrenvyCOJC56+SRiwAaGSpzxTKHGpgTTOb5xUwXF7/dL7xylFelEwH
         7iUyE5VUsRBkJcW2hJdxGcWkD4rOgl5fxpOwRSdMytgAXuAgkJcJoqqniUnsh4abEgRz
         Sq25voCLzN6xXPBndwzRzZlQPrAF+riVVG1QegZomHEF27mXSQc85XDb89vxLDZfXVcp
         P0VGdW6sDdv3XvVCrm9i/ljyjhKPMr4oLq/+uQA043u6nZhKblrt6SmLdZy+gRdN7tH6
         3Hag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766970622; x=1767575422;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HJ4BWOfev0AxvWtR+KH2UmHGgImxfHsSAZSTOYN05QI=;
        b=MLlNqBhrsJo/tMGHmh7b8y5Wy1jwEZ+ezgAfmzLHqae1IXk1xeqxMMh8bntz8xdxnP
         GWHPgmTwZi1391+xXSyJ9js03xYs2UuAU04mUDUxpt0cvl7RzsHlTXOj9mWxVg0er7Gt
         olkOTWtOUjHrk8TlTT3RNJWX7zJLAfRB7+i/HvyQLGXtifXjNP+qYlNgkZszKRBBFEJ2
         ws+PjHtVvnVDmn3AuZI6pPKBP4lA8mcaPyoHLqEzG3xanz4XPlRuuyyI4Cp5r4yXeVmh
         dKbTgS6UX1+EX6XLRlR2XvBRZmTpAEfWXAV3BFMCDfrdBS1m35K6LMSjyETBO7OtjKXH
         oMlg==
X-Forwarded-Encrypted: i=1; AJvYcCVrQcQXsidkrqV202nihhCEwY5GYJyYkZsinAllXLw4khNnbtn3wc4ZX969p0f7VX2JCSaWQPKOfDZqewmKD35h@lists.infradead.org
X-Gm-Message-State: AOJu0YzeiVAbA1pRS7/EPa3oT/xDl6UWh7Qv21rpnU8at8oaz/p2I9gr
	SXrk208SovKKP2TuLYYoCEXQW3oZA2zOJrCJSkAnIqTD26uX7/f++ECJXweXJrHRm4OdEFkmKIM
	/v/eGA1D1M7ygXhAJlGRD168PFDVD4jDs+iTFhWOGaAgABJTpBrqXF9QgeubWq6rtm5HjYmvyAY
	d0pA==
X-Gm-Gg: AY/fxX485EIAuLAvVlBH5Z2oFhMv4DqWVYgtuf+kgwIjf+Z537p0Metrnm5OLQZECg7
	NRrhecVGtBZ7O0PEtKShkGUCzonqNbWH8QwmqFS4bDf4Qj64n/9uiFK5rQ5sY2sCzpQ6Z7LnyxR
	dDS1LVb1IMvZlheHVu7sA4t8AcmckeohTNmf7Iu8T92QmDOO8Yp1YwRMTroriYXa3DdM5hnCMOk
	1KU8QZFku/HGXq0rZ+lrpwaki/rT6lcbk31eguVBChqetGz18FO0PmM+chMiMmkTGav9G14pK2+
	yT80cXI2g8/VYp6oRBGKDk89CRbwaENTnhDBEil4ouisxSHdEMaHsaBOD51XqTX5iWYz10vRYeW
	6YlYKQdx4jHQNoLMuHaexJDEcaJMYQhhCWyszwwvQTnuBwbkuQpvAWwNbI3+s2Q==
X-Received: by 2002:a05:6a20:9149:b0:35d:2984:e5fd with SMTP id adf61e73a8af0-376a8eb2ab9mr22015702637.32.1766970621480;
        Sun, 28 Dec 2025 17:10:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHisaB44sK758zI8M5r2trdQNCa7/jhf5rapQP/cqtsPLrHnhK38AjKdwlnpDugDpbu0acp0w==
X-Received: by 2002:a05:6a20:9149:b0:35d:2984:e5fd with SMTP id adf61e73a8af0-376a8eb2ab9mr22015684637.32.1766970620987;
        Sun, 28 Dec 2025 17:10:20 -0800 (PST)
Received: from [10.133.33.23] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7961fbb9sm23834239a12.2.2025.12.28.17.10.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 17:10:20 -0800 (PST)
Message-ID: <c60288a5-189d-4761-99eb-4681effe1252@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 09:10:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/8] coresight: tmc: add create/clean functions for
 etr_buf_list
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <202512251923.GDSbVal1-lkp@intel.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <202512251923.GDSbVal1-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Raidyltv c=1 sm=1 tr=0 ts=6951d4fe cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8 a=r4nmail-YYtXJwozotMA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=mmqRlSCDY2ywfjPLJ4af:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: N7UBDykz23ucB8QTVLzLUqIen5GpuV1c
X-Proofpoint-GUID: N7UBDykz23ucB8QTVLzLUqIen5GpuV1c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDAwOSBTYWx0ZWRfXx2dNoEt8JHp2
 6wpTKW0rS1Rj1qVjITYxACvIfWSGhnqXK4Gx27R+erY0XH/Qdk3tTOPN8OafMwL5ouXrwDKaBe0
 064MyrQTvhqsZfyTpXkbvFU8Hb+FyXpzmN7lKs+fZkbf03ZPqAqyJCvAXg9dooIuPQ53cHA/Uf6
 czJscBbQAh6BF5A8Nj0XNnhWE8ajRiLOCZ+AC8/bYtqrwT8QtgEeIo+eEAVsUYgpmT7oA7nIvwO
 gqqwuLWSvnzzVb/5gz7fQF25cDGL+za+Ip3RGNJlScxPoNtO37/u8B2BNn3xGiyGmAN7DDUbQhF
 ovBBnlKGQGmzaaXOeWsZUi+uqC/Y188MIvGjqwx3UYnPSjB40osyJIE4IntQYHohPLO4BAcvbN0
 KdfHjgQ3tSqrHieiFIGzp5Gukf2YdDsK4mf80EVW0+8uWGDrXv5YKz8s+qP/elcOgIV72MXMN0e
 nAwVQ+pQMIYN4PNNK8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_08,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_171023_772969_E9F4B7C6 
X-CRM114-Status: GOOD (  17.41  )
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



On 12/26/2025 9:17 PM, Dan Carpenter wrote:
> Hi Jie,
> 
> kernel test robot noticed the following build warnings:
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Jie-Gan/coresight-core-Refactoring-ctcu_get_active_port-and-make-it-generic/20251224-171604
> base:   47b7b5e32bb7264b51b89186043e1ada4090b558
> patch link:    https://lore.kernel.org/r/20251224-enable-byte-cntr-for-ctcu-v9-2-886c4496fed4%40oss.qualcomm.com
> patch subject: [PATCH v9 2/8] coresight: tmc: add create/clean functions for etr_buf_list
> config: arm-randconfig-r073-20251225 (https://download.01.org/0day-ci/archive/20251225/202512251923.GDSbVal1-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202512251923.GDSbVal1-lkp@intel.com/
> 
> smatch warnings:
> drivers/hwtracing/coresight/coresight-tmc-etr.c:1992 tmc_create_etr_buf_list() warn: passing freed memory 'new_node' (line 1991)
> drivers/hwtracing/coresight/coresight-tmc-etr.c:1992 tmc_create_etr_buf_list() warn: passing zero to 'PTR_ERR'
> 
> vim +/new_node +1992 drivers/hwtracing/coresight/coresight-tmc-etr.c
> 
> 34af91eeb7e78e Jie Gan 2025-12-24  1959  int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
> 34af91eeb7e78e Jie Gan 2025-12-24  1960  {
> 34af91eeb7e78e Jie Gan 2025-12-24  1961  	struct etr_buf_node *new_node;
> 34af91eeb7e78e Jie Gan 2025-12-24  1962  	struct etr_buf *sysfs_buf;
> 34af91eeb7e78e Jie Gan 2025-12-24  1963  	int i = 0, ret = 0;
> 34af91eeb7e78e Jie Gan 2025-12-24  1964
> 34af91eeb7e78e Jie Gan 2025-12-24  1965  	/* We dont need a list if there is only one node */
> 34af91eeb7e78e Jie Gan 2025-12-24  1966  	if (num_nodes < 2)
> 34af91eeb7e78e Jie Gan 2025-12-24  1967  		return -EINVAL;
> 34af91eeb7e78e Jie Gan 2025-12-24  1968
> 34af91eeb7e78e Jie Gan 2025-12-24  1969  	/* We expect that sysfs_buf in drvdata has already been allocated. */
> 34af91eeb7e78e Jie Gan 2025-12-24  1970  	if (drvdata->sysfs_buf) {
> 34af91eeb7e78e Jie Gan 2025-12-24  1971  		/* Directly insert the allocated sysfs_buf into the list first */
> 34af91eeb7e78e Jie Gan 2025-12-24  1972  		new_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
> 34af91eeb7e78e Jie Gan 2025-12-24  1973  		if (IS_ERR(new_node))
> 34af91eeb7e78e Jie Gan 2025-12-24  1974  			return PTR_ERR(new_node);
> 34af91eeb7e78e Jie Gan 2025-12-24  1975
> 34af91eeb7e78e Jie Gan 2025-12-24  1976  		new_node->sysfs_buf = drvdata->sysfs_buf;
> 34af91eeb7e78e Jie Gan 2025-12-24  1977  		new_node->is_free = false;
> 34af91eeb7e78e Jie Gan 2025-12-24  1978  		list_add(&new_node->node, &drvdata->etr_buf_list);
> 34af91eeb7e78e Jie Gan 2025-12-24  1979  		i++;
> 34af91eeb7e78e Jie Gan 2025-12-24  1980  	}
> 34af91eeb7e78e Jie Gan 2025-12-24  1981
> 34af91eeb7e78e Jie Gan 2025-12-24  1982  	while (i < num_nodes) {
> 34af91eeb7e78e Jie Gan 2025-12-24  1983  		new_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
> 34af91eeb7e78e Jie Gan 2025-12-24  1984  		if (IS_ERR(new_node)) {
> 34af91eeb7e78e Jie Gan 2025-12-24  1985  			ret = PTR_ERR(new_node);
> 34af91eeb7e78e Jie Gan 2025-12-24  1986  			break;
> 34af91eeb7e78e Jie Gan 2025-12-24  1987  		}
> 34af91eeb7e78e Jie Gan 2025-12-24  1988
> 34af91eeb7e78e Jie Gan 2025-12-24  1989  		sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
> 34af91eeb7e78e Jie Gan 2025-12-24  1990  		if (IS_ERR(sysfs_buf)) {
> 34af91eeb7e78e Jie Gan 2025-12-24 @1991  			kfree(new_node);
> 34af91eeb7e78e Jie Gan 2025-12-24 @1992  			ret = PTR_ERR(new_node);
> 
> s/new_node/sysfs_buf/

Thanks for reporting. Will fix it.

-Jie

> 
> 34af91eeb7e78e Jie Gan 2025-12-24  1993  			break;
> 34af91eeb7e78e Jie Gan 2025-12-24  1994  		}
> 34af91eeb7e78e Jie Gan 2025-12-24  1995
> 34af91eeb7e78e Jie Gan 2025-12-24  1996  		/* We dont have a available sysfs_buf in drvdata, setup one */
> 34af91eeb7e78e Jie Gan 2025-12-24  1997  		if (!drvdata->sysfs_buf) {
> 34af91eeb7e78e Jie Gan 2025-12-24  1998  			drvdata->sysfs_buf = sysfs_buf;
> 34af91eeb7e78e Jie Gan 2025-12-24  1999  			new_node->is_free = false;
> 34af91eeb7e78e Jie Gan 2025-12-24  2000  		} else
> 34af91eeb7e78e Jie Gan 2025-12-24  2001  			new_node->is_free = true;
> 34af91eeb7e78e Jie Gan 2025-12-24  2002
> 34af91eeb7e78e Jie Gan 2025-12-24  2003  		new_node->sysfs_buf = sysfs_buf;
> 34af91eeb7e78e Jie Gan 2025-12-24  2004  		list_add(&new_node->node, &drvdata->etr_buf_list);
> 34af91eeb7e78e Jie Gan 2025-12-24  2005  		i++;
> 34af91eeb7e78e Jie Gan 2025-12-24  2006  	}
> 34af91eeb7e78e Jie Gan 2025-12-24  2007
> 34af91eeb7e78e Jie Gan 2025-12-24  2008  	/* Clean the list if there is an error */
> 34af91eeb7e78e Jie Gan 2025-12-24  2009  	if (ret)
> 34af91eeb7e78e Jie Gan 2025-12-24  2010  		tmc_clean_etr_buf_list(drvdata);
> 34af91eeb7e78e Jie Gan 2025-12-24  2011
> 34af91eeb7e78e Jie Gan 2025-12-24  2012  	return ret;
> 34af91eeb7e78e Jie Gan 2025-12-24  2013  }
> 


