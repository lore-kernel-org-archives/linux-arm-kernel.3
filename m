Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0AE1E7E34C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 08:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/XgaQEQBW4nx5/BlnDB5CAJ3u2Ziz0/DMOb/BBMOzuM=; b=gAEV6Ud2vIeFlvEnI9HcjyhXPr
	2oNkqHnzwCG3UPEXwVEJw1Wp8wKThvZF3kd0MusnQhhk0eMhNPlh5F0iBqIues6wuyVhTfgtdOLL3
	l/SlsSiZA+x2q3zr2F2B2MU7VavxLC0rkvXSN+RXqBaFfCc+yCaaU7ywAGGw1uKFpO8FG47BBmae7
	UpSJ8CEz1Mhb2R1CFxRJHyglkWExz2Xz9k9G4JGQXhh+vbJWejIUFQge8QuBd94ICxTEkPvrFjhX7
	TzGzEKfu90p5RmvVPqKRoA71cwTfAs+ScIKcoG2cPxr/jKFNCwx45Yk9NJ8CAY8DWJE89M0UNM8Fz
	j2MRe58g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8aEr-00000001kSN-11pb;
	Fri, 03 Apr 2026 08:50:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8aEo-00000001kR1-2y6J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 08:50:47 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63342YFu3780374
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Apr 2026 08:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/XgaQEQBW4nx5/BlnDB5CAJ3u2Ziz0/DMOb/BBMOzuM=; b=IBUdbFSKCyAiTQj2
	k72Rp4qUkvy47gil/DVfe7BsjRSosSulbH3Q6gxkNvBfxF2HwnLZFqrM814d9m5t
	tSjxwDcEGSfIIykHzdgBwYvw8RVELBwu25oGn8F+J+IWUnrU96Ggit9Ae+bQ1WrS
	pE6ZnBMCGnT51NFpsBU7JzrzNOZQ9PTyyZOB0LNvs0jwCyi4m15NAh33iw1fm4+6
	9JOSJyh+xqjEwt27EQ6D+gRmVTb4ghWdZhoHsAYTHbwpnQtJw3LdHpnLJidLPqgV
	HEIiuTsWLBBAl3Pix4+/0Z74zL8xURjM/cwtN7aF79NX0GIrmQMPcIjMOGF64QcS
	kwqe+g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da663gt9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 08:50:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4031b86dso55067031cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 01:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775206245; x=1775811045; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/XgaQEQBW4nx5/BlnDB5CAJ3u2Ziz0/DMOb/BBMOzuM=;
        b=eiQ3gb2goloNTY7DwhMc3pk8qr6BGjQZP4/UJRlBREg539yZjkEtKHmMt+zsXXHQcf
         KWHJHF0vPZF/3++IeQyYbc+4W1Vw94zluj6YUx8uhYjoLW48WKHiRq0LFAtwD4zbFBL3
         uG4GyThSmWvMvn81dFj72vTMnybzbQ75gNww20uhHSHKwtsGd/CLRY3F/4ttdY3w3TzF
         NAiLhEQrtNJL4dF/ixRl63OWSxorqCXm++WwjLMTdOYZ72A1OofR/Psj8lQibmQ3aygP
         BXwbaSO9Kity44u2X3KTP6s5xwvQmXtzFhRPQI0FddkrECr3tDfI6s/JftTdd7aZzwCy
         +PmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775206245; x=1775811045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/XgaQEQBW4nx5/BlnDB5CAJ3u2Ziz0/DMOb/BBMOzuM=;
        b=Ac5ededqu2U7WJij/4m27+r9OBO9F2iGtHM6dh8/FUlbFaVDUnwXmhFwXbgnFWt4yx
         3+MRmMWPIT5J3Wa/GQSv2J0951W3Lg2z5Y56Y66toQWuR59RQmLnh5X90ZIikGA8qBSn
         X1+DJxNHvsY/Pb1WSqE03ih9igMjgv0kteGbj1MVmAuFvq09QDNP99AcMU8eCGyj1LJM
         hITJ97O/lP96EqxJC1JUc18jQRGdRBO9kqvlfMYpbaZRBKpyjwO+CKVj68OsX42Xzjbk
         2Bduvt12ePXHh2VcI07jf1iKtDWLdwFYt8/YimZ9RB65Etaer3YUBy2oPGOP/74ArxDY
         OUTg==
X-Forwarded-Encrypted: i=1; AJvYcCW5BpcUHXdBTLCjXx6j3ay+XQwZdFKq77cUepsKTYdjhA0VZGRfKNc3BMjeWmdQcZvFpKHwEJSPVwuFCkF0LNif@lists.infradead.org
X-Gm-Message-State: AOJu0YxqGaA/VsibwfMkIrcH5Jqe7CMbCyUAE6yfU/l84YQCvSWqWzQE
	ktEBsP5g3mQEF6sQMaJdkdeoVj3nXfLRxyTI261yKDFyC9QvTW+w/ABY72Nj2T/A/YbGUi5Clr6
	lbppgMgypMHiDfoH3xVndZni1BXfw9LO6r3t822JXKegDiTjruW2wtFX05IUnP9MTdIbA45SVRL
	lxEw==
X-Gm-Gg: ATEYQzwyUtpo4exhAVY10lLcGWlwJ9Uf1+1DISL2hA1l+LimNCx5kk+ezviGbXG317M
	VehLKedgPTDioB52sMs5c80Ul0OL9AaFsR3lMMoPMqGMoG3OlZgZb1/rpsYVrbvX5XOqublhhCU
	Ttugikawq7FDfXlKPn6aYDxGnegt5/CVidj0gig7B9ZeYGJsYtXCT2eG7QbO7tZkLyjpKjrhM3r
	JK5V0oZDK+xQUGE/UTiI2sGLc3c0LmoNvQ+JSfy7DguWA8p7l+T7QCabfrZTwMbaj1xnkZWp+02
	MRMbrWz40SEUBMGUKvo+2cUULjo0GMTloy+YJ/tV1LfuNcCMYNsZFyT7l2wzvowpyllZZzUsx2y
	b0fcjXMrRryZqKcAdB0BjtGDmCTEx1gBLHnNlgk32jHG36RYI45S6YsvNFFf3GPn/GVYGXQ1JE/
	XzVr/3B+FV
X-Received: by 2002:a05:622a:2292:b0:50d:6b06:a44e with SMTP id d75a77b69052e-50d6b06aeb9mr7296191cf.17.1775206245294;
        Fri, 03 Apr 2026 01:50:45 -0700 (PDT)
X-Received: by 2002:a05:622a:2292:b0:50d:6b06:a44e with SMTP id d75a77b69052e-50d6b06aeb9mr7291691cf.17.1775206232638;
        Fri, 03 Apr 2026 01:50:32 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e56fesm14515027f8f.27.2026.04.03.01.50.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 01:50:32 -0700 (PDT)
Message-ID: <3b4c4607-83e8-4621-ab81-cfa5e82b9460@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 10:50:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] [PATCH v1 resend 0/7] Timer driver module support
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        "tglx@kernel.org"
 <tglx@kernel.org>
Cc: "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "jstultz@google.com" <jstultz@google.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <20260327180600.8150-1-daniel.lezcano@kernel.org>
 <AS8PR04MB842096EB48B0B607711702EEEB5EA@AS8PR04MB8420.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <AS8PR04MB842096EB48B0B607711702EEEB5EA@AS8PR04MB8420.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA3OCBTYWx0ZWRfXx6Az1Vr0ybwa
 tnJp7QNZ1nL36nTXU5fXOph2b8wvGxjC69VRyd5RrhRSyL1EyQxjqWooq5dy+D1ApRA2V2Kv2Oe
 mXet4vwEUkpQY/xQDIcvBzdXy0okX/ysYsMCWJI3e1scTGqCYhx+ZL+gcEpPraTAHl0SxHLiV/f
 yducDYqENp1cL9CFj3st0kO+hpBrNOoxpLaVJPmrs62fziZ8UDBk7gS13C3hljohhzOXNNmS2kJ
 h6chLg85H5Bsfr/kAGH1jeL/TH5B3wJJabDoXLRUTqIMhLsWWfSCPWXwvR0gFsjpwWBjlYMPVxz
 Fz5VsPKDjL18mXnh1cm0qds+LNXQhYvoJ2Nx7dRneJgMboDaeRrzzhb/nShjeFtXktcOhiHGU/D
 rKqllpJQ3SlW3b2MqR1py+3AVrsgeNiX64z+ORYxBENz0ca9GCGeUrtGag786bT1Og7dpShMgrK
 wYR9npNNS3YuzaEaPLw==
X-Proofpoint-GUID: E7kdNtnfV2YF_m0_OEts-qj3CL7eE_I8
X-Proofpoint-ORIG-GUID: E7kdNtnfV2YF_m0_OEts-qj3CL7eE_I8
X-Authority-Analysis: v=2.4 cv=Acu83nXG c=1 sm=1 tr=0 ts=69cf7f66 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=7_RI1GwYu90yzXy_LAkA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_015046_751938_881FEE95 
X-CRM114-Status: GOOD (  14.46  )
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


Hi Zhipeng,

On 4/3/26 09:59, Zhipeng Wang wrote:
> 

[ ... ]

>> 2.43.0
> Hi Daniel,
> 
> Apologies for the delayed response. Thank you for working on the timer driver module support series. I've
> tested your patches on i.MX platforms and they work well with the TPM
> timer driver.
> 
> Based on your framework, I've converted the i.MX TPM timer driver to
> use TIMER_PDEV_DECLARE. The driver has been tested on:
> - i.MX7ULP (ARM, no alternative timer): built-in with CONFIG_EARLY_TIMER=y
> - i.MX8ULP (ARM64, has ARM Generic Timer): built-in, module, and
>    CONFIG_EARLY_TIMER=y configurations
> 
> All test cases passed without issues.

thanks for testing

I'll apply patch 2 and 3 and send a v2 for the next release and wait for 
more comments.

   -- Daniel


[ ... ]



