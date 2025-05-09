Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C97EC3ABD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pDz77uzBNO2nIiR2GXoB/HFEY5WV+wPEqr0qWm3PIiA=; b=JIQYBFPEr8TnCfBuIoK7Qppm5o
	Z1IWIQgOk/2fjdquYWwG7g623FUAYpX6hugxSX8Y5EbHdttM/334AXoxHKC1yHJ3reEOcN2Ab41EZ
	2jvx2W+p1mcAdBOJoWTofKrnQIJQZYaSpzVEY8d9G/vGOh9tL5DkJRkflT4drrsOFfDO1KR2j3Q53
	IB6G5k9CjxJGMB6u5cPgmr+d01zq8oiAmj6svP5xsrXvUNrMlfNUkUWo0jJUooqGTp3Rt2yzBaXdL
	e1Hl6VM5vEsNGtrpfxY9pJLiOkcQ158pBPuS3UGi07BcnUP/ZQl5GDOae8fERyrbE5JqUe+im1BXV
	AjqHFUqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUHq-00000004mgb-2V0U;
	Fri, 09 May 2025 20:25:38 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQYH-00000004HGU-1zVY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 16:26:22 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549EYAvH031612;
	Fri, 9 May 2025 16:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=pDz77u
	zBNO2nIiR2GXoB/HFEY5WV+wPEqr0qWm3PIiA=; b=oLANYEubYSQ8/6vdHfuGIi
	+bffgxTLERPaLCv+6i6gshdUphuva+xjnshn0qcK/vRGddOgY/4VX2851VCqHENE
	9WzLtuGpYpQdp13kE6ucgl9o8DDz6RIEJpqJyQxx5WgiWhv+TO9vpUumOoxZGXgD
	azi9MhjomFnazCqlIpfwXFcX7ESbCytiiNzGtzNkii8a8rqmviXTNt3kz4XREObY
	hD7sJ9+oB7FRB270gpdEvAvWz/vObD34VZNQ0EFbpj9YOozyc+VChMxcXHyVeZGH
	S1gdQA+w7fSvaVpGcEhpVCS8YxpO+cI0hQ+c4NJ/btaVSLuQo9f0C5z22odT41eg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46h4rwd0mq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 16:25:54 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 549GPoqY024125;
	Fri, 9 May 2025 16:25:54 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46h4rwd0mj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 16:25:54 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 549EsvJP001304;
	Fri, 9 May 2025 16:25:53 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 46dwftvk2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 16:25:53 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 549GPqBP24642072
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 May 2025 16:25:52 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4943858062;
	Fri,  9 May 2025 16:25:52 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D19845805E;
	Fri,  9 May 2025 16:25:43 +0000 (GMT)
Received: from [9.61.252.85] (unknown [9.61.252.85])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  9 May 2025 16:25:43 +0000 (GMT)
Message-ID: <10152245-9d67-4a4a-acf8-b743bcf42254@linux.ibm.com>
Date: Fri, 9 May 2025 21:55:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/bpf: Fix bpf selftest build warning
Content-Language: en-GB
To: Saket Kumar Bhaskar <skb99@linux.ibm.com>, bpf@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org
Cc: hbathini@linux.ibm.com, maddy@linux.ibm.com, daniel@iogearbox.net,
        mykolal@fb.com, yoong.siang.song@intel.com, martin.lau@linux.dev,
        song@kernel.org, yonghong.song@linux.dev, john.fastabend@gmail.com,
        kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com,
        jolsa@kernel.org, shuah@kernel.org
References: <20250509123802.695574-1-skb99@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20250509123802.695574-1-skb99@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=QIxoRhLL c=1 sm=1 tr=0 ts=681e2c92 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=QyXUC8HyAAAA:8 a=cjiv8ubDXIRvis6Dy9MA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: onYZqRvaz-xhmNZgpDBhA0Bg_2NVAFhw
X-Proofpoint-ORIG-GUID: R0MOMKTa911bxpp-gYxhSAy3BRFk7zNT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE1OSBTYWx0ZWRfX56xS6pVkJ/Op AaqU0y3/vQntVE+eZlL6/1dkIfyGf7qZ6RZRpbH5IsxvCZ5rF0vWmRYyD3t8I+UY/kPHe1uyfIu CLJAstUPaw7QscwWXHsaBP9UclX5UsgNEW17mBs8BwrAbacx7f0TWlrTD+Mkw7tvD6TbLYaPszL
 9foTXF/T5W67d/d7XLbMgmf/uBtlWaL2UDvWUI0gt9VD4/w43iKs2Nvo2z8eUOTmyCkufXSScnf 8JxSz3kQOHNMsSWVFVsokh8mbFlptYo/8bHz2FCod1tTi52uB92Hw14HyuBMER6T8jSiLtNOxi1 d3nllFmF58bJThX1PqY/P9ez9+fjwLL96lqqGpGZ+Y4zeBP8n3nw/zEp15jm2lH81B3+t6F3BRx
 aq0uoowGdTO3+cynumusKOrTZR5AROAgx0IlABQAYi8+NnNLnGng8qiykVizDYDZojsRqj4M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011
 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=941 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_092621_635495_E1B46F9F 
X-CRM114-Status: GOOD (  19.21  )
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


On 09/05/25 6:08 pm, Saket Kumar Bhaskar wrote:
> On linux-next, build for bpf selftest displays a warning:
>
> Warning: Kernel ABI header at 'tools/include/uapi/linux/if_xdp.h'
> differs from latest version at 'include/uapi/linux/if_xdp.h'.
>
> Commit 8066e388be48 ("net: add UAPI to the header guard in various network headers")
> changed the header guard from _LINUX_IF_XDP_H to _UAPI_LINUX_IF_XDP_H
> in include/uapi/linux/if_xdp.h.
>
> To resolve the warning, update tools/include/uapi/linux/if_xdp.h
> to align with the changes in include/uapi/linux/if_xdp.h
>
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Closes: https://lore.kernel.org/all/c2bc466d-dff2-4d0d-a797-9af7f676c065@linux.ibm.com/
> Signed-off-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>
> ---
>   tools/include/uapi/linux/if_xdp.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tools/include/uapi/linux/if_xdp.h b/tools/include/uapi/linux/if_xdp.h
> index 42869770776e..44f2bb93e7e6 100644
> --- a/tools/include/uapi/linux/if_xdp.h
> +++ b/tools/include/uapi/linux/if_xdp.h
> @@ -7,8 +7,8 @@
>    *	      Magnus Karlsson <magnus.karlsson@intel.com>
>    */
>   
> -#ifndef _LINUX_IF_XDP_H
> -#define _LINUX_IF_XDP_H
> +#ifndef _UAPI_LINUX_IF_XDP_H
> +#define _UAPI_LINUX_IF_XDP_H
>   
>   #include <linux/types.h>
>   
> @@ -180,4 +180,4 @@ struct xdp_desc {
>   /* TX packet carries valid metadata. */
>   #define XDP_TX_METADATA (1 << 1)
>   
> -#endif /* _LINUX_IF_XDP_H */
> +#endif /* _UAPI_LINUX_IF_XDP_H */


This patch fixes the reported issue. Hence,


Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>



Regards,

Venkat.


