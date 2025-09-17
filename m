Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE48CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 01:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vbrL7SaMgW5EyV4CgmYacYgOsDFSLKeaecH2Z9zl2cQ=; b=xu09gQkJpoS5n2M0pnoNgJtdxX
	79tyVcRf1xjCnE8spEsLiO8a2imEBJLyeN67Ob2/uzsnIHpe/Kit1JKjqa48wqglhhZy15hIlFU8j
	6aUCdHXGfid+hpnnwXPKLlNiwK2kDLcpwV1A7Ui3Q6m1bTwetAoTNFr1/nF2YuEr+OQigyW5jo9SC
	Zy4/VzHM5h/lfk5jtMFA8LsY0UiMNuEiqE1MZoKxScNbqJofSXTHYXbi3VXDq4WZ57qpcq1mPB7HU
	KvrTr788zc43k3O3WAusluRm7Pj8o54rZp06O0zyP3UndqxaERvncbWcsya94SuwcILv+/acu6qJ/
	95k29Hag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyh5c-00000009rfh-19Hl;
	Wed, 17 Sep 2025 01:36:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyh5Z-00000009rfH-1NK5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 01:36:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GLaAm9026823
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 01:36:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vbrL7SaMgW5EyV4CgmYacYgOsDFSLKeaecH2Z9zl2cQ=; b=Vn0VS5S/9xi60LMI
	BPmCg7yppM+lRo3rQY+5Pk03oj51L2Hy0iwKvTOy/JxuoWzZ3aaa18tmcZ7Inrt/
	yNmTpkDgAX4IC4RsHxeH0oPJliD/BdKy5V8nzJZHQ3PITso66ew7ysd6HHMhVwga
	FkzRajMOTPSoMBGHgGorxIeip2HVQbVRVV7eox8q6Nelf2NT8Q4jv5LCoigfgDTD
	14aoFEwjFgUE12vdVFMvidNP27DKDe25VZIOJETdNX/VqJ/PkW6q2oVy1bqqphIq
	y2o2ncyYnRKc/o/0TYtG9/U5rWAfO1AmrFILIM7FqSBKDy2M64XLhU4Uu5uR/PqZ
	kZ7LFg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxgg0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 01:36:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-268149e1c28so632135ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 18:36:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758072961; x=1758677761;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vbrL7SaMgW5EyV4CgmYacYgOsDFSLKeaecH2Z9zl2cQ=;
        b=uXLt6AoT1AhaYSeWiqutqCFx13hJl+Y6ydlXEfiyW4xtuAmHyuhBf2lm97K5zAdEhF
         u9+m6OSEwH+NOhEXyjqIY+ZQofqOBTDkT/6hszquXGknMzJEP95u5ubwGt0VeJNf06Ma
         5OCWCYdFw3bZQ6WQbrFVrgEow4B1F//yszt/pqHqD4V9pFlV8x0MCgKmeOT352AEVs72
         G4U9Z77RjqOkIKim2F9yBADv3+dxtM1ndj047s10dh60T55LPt0rkheieFUblEDkjxH/
         37xe7yEVI0sz5MmkxWjPWUdOCbsqfbujuFxvzTwN8Gdt0v57t1tnOQVosA1UmNDVhE4c
         UVTw==
X-Forwarded-Encrypted: i=1; AJvYcCXbzThtsjKWd3WzztPmmb7d04+fBYthH4ecAs2lG9ad3ep16zy9iqXnH7pkmvJwRyVRa4GTadIKUiTP7GdjBCAc@lists.infradead.org
X-Gm-Message-State: AOJu0YyV8bQYgDryEzEn0MXVHhP5r8tytXge3K/+rQcmpoMP6bt9WEF/
	YMJg6g2cZWbDL2Dwy+0JMTUcT+pNsNUONlxIcbafm5X+KjVPx+8EfWEMDSozWf4ovywESzgr1zn
	pnP7WjBDc+hbXRSR5bLhRQwxB14y9t/ykPE0jJUyBcO5VBnXyR7sWePOEAlujgfgN3q5hOoUQiJ
	DMOw==
X-Gm-Gg: ASbGnct1h7AaL5Dmo6YwXACTJqUGTo674Tx/aw7x6QYzGoGggJojJnihe/4jXQYE3IX
	r0/xUF1V2gafLEhr8WwuPMVE0b76wYWkMsDcf4kmg/QFWn/nPHTWO13om9feKWNQSmBHJHiWjPj
	mjgQgK16gC0B9RV4Gquh3Bd8cKoiIoUelI0TB4o75TUba4ISC38/s0swI0doAimpnpY1XWU83UV
	kOUzlrayssJ5DoYefP0aRPnyM8RmsyxJZRCBahkIh2ulsEIAinqQH2EawEIS3OKHT8iC1B4jVQ8
	xADcuUX7myh9erZNQFTQM0YiH96rb4N91rMkwEyJtjuuVX1rcj3cfGDObRsiAB8jqikkVKo1Uhr
	oT37sQlaViggUSAK28GlN+4G8upIJ
X-Received: by 2002:a17:902:ec90:b0:263:671e:397b with SMTP id d9443c01a7336-268118b9895mr4989705ad.7.1758072960917;
        Tue, 16 Sep 2025 18:36:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHylmZ+tGvjOIZumm372gek4AXZFCL6OxaO2OU0fsz5O59DxdnMl6rUMyBX4IQ7iysNn9tp7w==
X-Received: by 2002:a17:902:ec90:b0:263:671e:397b with SMTP id d9443c01a7336-268118b9895mr4989345ad.7.1758072960404;
        Tue, 16 Sep 2025 18:36:00 -0700 (PDT)
Received: from [10.133.33.43] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-265819a61a7sm81502865ad.48.2025.09.16.18.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 18:36:00 -0700 (PDT)
Message-ID: <a331eceb-ec49-4396-a61d-78a75789b090@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 09:35:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: Fix data argument to coresight_enable_helpers
To: Carl Worth <carl@os.amperecomputing.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Sabrina Dubroca <sd@queasysnail.net>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250916224441.3008824-1-carl@os.amperecomputing.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20250916224441.3008824-1-carl@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX9BsAleje4ms8
 b1CicxhMJ7cHH9vNrlviayNWnmeD+7qOKPNtvCWLTSnCnwNav4Ze+YEuIZcg3mo5lCWjTaikKBx
 wwH33whCaJ2ghQH31A0oY9BX+GkyzsVXmfgBpPIsKmY5Sx3ZO6eHeyEfpDeipPl72H9gNdBXFyT
 Hu1rN/RPqO9hT4q7WQbEj0C9GgrxmsgGe6OhDTgFDcKx0z57fWDuUbwhg7nPxR1H2wbi/4NsjZS
 uiuA0Y8c/OIlcy1cSK30of3VlMT4wt2y357xZWpSt+dn1FGIEmozJHvs4+1x0NY18Qjd9x/Lba1
 mrfxs808YCmBVu18R18jARwXT8Q4VYuC4OfWar5JgMIevWSuPyfjB3lOqxdPx9u+cbHjn5UhxyF
 MkaCYJNt
X-Authority-Analysis: v=2.4 cv=MMFgmNZl c=1 sm=1 tr=0 ts=68ca1082 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=vzhER2c_AAAA:8 a=6_jK5pOYWtS4egWhfC4A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=0YTRHmU2iG2pZC6F1fw2:22
X-Proofpoint-ORIG-GUID: D4LMCPSH5026v-g2mpsGaXbdFUEtjoBm
X-Proofpoint-GUID: D4LMCPSH5026v-g2mpsGaXbdFUEtjoBm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_183605_496213_B237CDCE 
X-CRM114-Status: GOOD (  27.40  )
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



On 9/17/2025 6:44 AM, Carl Worth wrote:
> In the commit being fixed, coresight_enable_path() was changed to call
> coresight_enable_helpers() with a final argument of 'path' rather than
> 'sink_data'. This was invalid, resulting in derefencing a pointer to
> a 'struct coresight_path' as if it were a 'struct perf_output_handle'.
> 
> The compiler could not flag the error since there are several layers
> of function calls treating the pointer as void*.
> 
> Fix to correctly pass the sink_data pointer as the final argument to
> coresight_enable_helpers(), exactly as it was before the buggy commit.
> 
> Bug can be reproduced with:
> 
> $ perf record -e cs_etm//k -C 0-9 dd if=/dev/zero of=/dev/null
> 
> Showing an oops as follows:
> 
> [   88.696535] Unable to handle kernel paging request at virtual address 000f6e84934ed19e
> ...
> [   88.911293] Call trace:
> [   88.913728]  tmc_etr_get_buffer+0x30/0x80 [coresight_tmc] (P)
> [   88.919463]  catu_enable_hw+0xbc/0x3d0 [coresight_catu]
> [   88.924677]  catu_enable+0x70/0xe0 [coresight_catu]
> [   88.929542]  coresight_enable_path+0xb0/0x258 [coresight]
> 
> Fixes: 080ee83cc361 ("Coresight: Change functions to accept the coresight_path")
> Signed-off-by: Carl Worth <carl@os.amperecomputing.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index fa758cc21827..b1077d73c988 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -510,7 +510,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>   		type = csdev->type;
>   
>   		/* Enable all helpers adjacent to the path first */
> -		ret = coresight_enable_helpers(csdev, mode, path);
> +		ret = coresight_enable_helpers(csdev, mode, sink_data);

I dont think we can change back to sink_data since we introduced 
coresight_path to wrap 'data' which is needed by the path.

I suggest you to add the struct perf_output_handle to the 
coresight_path, then retrieving it with data->perf_handle in 
tmc_etr_get_buffer.

before:
struct perf_output_handle *handle = data;

after:
struct coresight_path *path = data;
struct perf_output_handle *handle = path->perf_handle;

We can assign the perf_output_handle to the coresight_path after we 
constructed the coresight_path in perf mode.


Thanks,
Jie

>   		if (ret)
>   			goto err_disable_path;
>   		/*


