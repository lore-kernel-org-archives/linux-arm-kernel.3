Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08898FD006C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 14:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KNX4FPcc10deSSmvIUjJw33Ay9Bm/BfMEU3pVvCYS6E=; b=CXjTvJvKv/YjgHPjqHnFJL52t1
	+2fM/TRAztioV7ggx2rwjfHTUi5ahHoIAMnk/amdvlVvWW5J1vMT/v0KbSQJpTS833QiMiKQCmUs+
	xorCJtdR8meyiGPdlTIOAo5RkoKfsMGblMl73j82uGnif9rSEgf6WZxixrFFxPUq3n7d9EQ8OmO1u
	H1qT74BWLA0nINwm7TUrWtLRXtyPc9psz3iGJBaPsX7mzd0//IeNv3Cnp0EtWW4wFNDUHWaMyibS8
	Ei0J5nSByV7cwTT6gcqaTy00vZdYjaP+2rrkQeIySR36M8yBU2UsoqaKHS/wWTGUouHugk1pj8J0B
	Pu+R3WuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwhkk-0000000BZqU-1A8l;
	Sun, 01 Mar 2026 14:26:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwhkh-0000000BZpj-3wbs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 14:26:36 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SMeOLB134468
	for <linux-arm-kernel@lists.infradead.org>; Sun, 1 Mar 2026 14:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KNX4FPcc10deSSmvIUjJw33Ay9Bm/BfMEU3pVvCYS6E=; b=PRT2g4dKb8MUvpUT
	6EeF4Yc+YA+y2s29jjszN5/MbgmHBMMEJ/InzQOW+QAacc9SDBScBPJk+DGdwkBZ
	PjCfggr8Dvrxl/LmbHk57xnPko3poAgrmQ9eG01odwv3xBbAsDgWi0bcbgw0NTvG
	Xn8yWNKhdoG88Vu2VMAbkzFb25QyZBn6tXICwtqUCQn0zxd1oOcsMJpTqORXFIAH
	O7uT+kyxTc1B0yfz2eCunEXApBujjLiTnYhc5GOzmb8pTiNPaCaYSV/g8/wxUcOp
	lNvGS5lg/qFVeErnYC/eRNAf5uA+JDNu4pR9ZnQE7tc+zELpcfFzJUsPh67Tcok/
	LNd52Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshd2uny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 14:26:34 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so2300632a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 06:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772375194; x=1772979994; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KNX4FPcc10deSSmvIUjJw33Ay9Bm/BfMEU3pVvCYS6E=;
        b=bP0zOnbZ2uaU/oQvbCE04QBu7SY1bL/miqIWxQylRNBhSLYF78dpowK97rExoKatd4
         mPD5RJcwDBHZy+KEkbQ/0v0MkAWEiCGFTOa2k3GtsWvEG2u/iYcHu5+7eSZakcDzKA+A
         JzGC5SF5V5EjRULEdZxIlhOPuoZA40bNJ1mSwNWfWHfdEnm3ZGwd9L5Ya5j6JcfaGzUE
         dFG754mf+A8uKm/RAe9u/1CfYfeHRZtDY//r2/GPWvY186qkK4t1SoCcPzisi74JB2ko
         BxN9srpgFMBjPbBMp47dsb4dtmrRTuLLDMfxrxfjXCN3SMg8Umxkf3rkpXHDba7q73L9
         frHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772375194; x=1772979994;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KNX4FPcc10deSSmvIUjJw33Ay9Bm/BfMEU3pVvCYS6E=;
        b=hLUOP+81IFafedA6q93uhJmotVVJf51fAf1oGd+oy7N7VRzw1Ugd8bFS7G+J5RMkHu
         EY2S+8wRiYrqn61snHD+mY0gZm843yCkt0TA9U0tdB5w4o+3mD8W4To/owIjx7eurs6s
         cmNc54y6XSPj+XMe7VBkXkw+GKK5tNPXDJOAlgXdKl0/0wi4JsWQOXzVrm95hLtc8XZr
         RYo4t8zjdPKMBk9oMyWaZ5BZ+eUUdPt56e66YXoMdzOMHUCAyye/aPC04t8lnuMEZRxQ
         RZCH5sB1g9+sAvRJS7aXizmknsSYERVoLUlLnFAb4jPyuBibL5eVeRkwMObyLRDxYM5M
         tnyg==
X-Forwarded-Encrypted: i=1; AJvYcCV85EZ1xJrOFEcvU4SHitXiB1n31ASds6QaUCl5qMCuBc7CHECnSvO8PTwvBpsPvCTp91Dd+mabL9IOGnUMcTmf@lists.infradead.org
X-Gm-Message-State: AOJu0YyKtHFageyvn8cnXC0mq9LOVYsMt4U3vqnR5zYaNXe0aCS5s/qE
	92RtRSzlb+St8fKzVR/frx0hOYCQ4OeBcTHptWWU09Y4jZk4RMViRT3xY0iKx1EJJEYtNvkZlrz
	hC7U9ohgZcmf3mzhaLdv8eZhVat70NvbJCNczgDQYCbyRdKHMzIuAR/Slj+Rbp+rNvH9ij+feP4
	jfHw==
X-Gm-Gg: ATEYQzxAcyxs4iWuv3psccCipgdfNb6qs9rFO2Q4yeKJQhJHnu0Qfp8jrC5MegxTXDL
	wqMXe+n6zXHfeSMp9GOY2PtxCNGP3M9Sj4kqcvveV9Yd/lTe5H9x3TG9gapY6vQbdBW8FRvaSkw
	oHZR4uw5sRR/9BJDU9BUc+nXIewdcEARRTVl68Y/RoG9Vi+E0F9cPj63m7xtBosA5BaZOrWWhy2
	8Smi4lzR/sa/Zup4G7w+wYztWNT9Z0VI2SLvK4DsCnLqZjqPeBOCGXChkegASlQfibhP12AhwIT
	BGuPB5jVpfX+2cuKRuUuAmeAXGP0ID7HMSLwKYsJVZmWO30qOBoWuV8zgy/D3BOD1YB+ymkVhNr
	M7J0JMN6uKL7UkPYW/wBOrM4FzZSuxUxIDbRDG2sTT+edvPs=
X-Received: by 2002:a05:6a21:730c:b0:364:be7:6fe9 with SMTP id adf61e73a8af0-395c3a75434mr8553267637.32.1772375193652;
        Sun, 01 Mar 2026 06:26:33 -0800 (PST)
X-Received: by 2002:a05:6a21:730c:b0:364:be7:6fe9 with SMTP id adf61e73a8af0-395c3a75434mr8553232637.32.1772375193170;
        Sun, 01 Mar 2026 06:26:33 -0800 (PST)
Received: from [192.168.0.102] ([183.193.18.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5ea0dcsm8925971a12.3.2026.03.01.06.26.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 06:26:32 -0800 (PST)
Message-ID: <5a2961af-dada-44f3-8e57-119076f10750@oss.qualcomm.com>
Date: Sun, 1 Mar 2026 22:26:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] scsi: ufs: core: Introduce a new ufshcd vops
 negotiate_pwr_mode()
To: Bart Van Assche <bvanassche@acm.org>, avri.altman@wdc.com,
        beanhuo@micron.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
        Ajay Neeli <ajay.neeli@amd.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
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
        "open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-arm-msm@vger.kernel.org>
References: <20260227160809.2620598-1-can.guo@oss.qualcomm.com>
 <20260227160809.2620598-2-can.guo@oss.qualcomm.com>
 <9d975881-7570-495d-94ea-085e2012a9af@acm.org>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <9d975881-7570-495d-94ea-085e2012a9af@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDEzMSBTYWx0ZWRfX5eC0VzpbLapI
 tbHldo/o9V8n+69tdw7cn4cXEnUX0bPMSUtGhQQFiTCNHhah8ypda4uoe0AzNRySq5C0jCgdCi5
 HUYZ7ZwvWN1zGImJZnGGRFV524aP3nZOMu9+BKGXTUlLGW4/7t+UzEzANy0zKGucjvnDKtrhmWg
 lX774qu+IZ0XBFYb07L8OvnSK3257V9tkrJLWMV81Qjaltv//M5iqjIg57O4SelllnTq9OhKS0p
 VI3Cp5gNLHAL2B2DxvkBdzTXgxzwdWrYHqJjepJ2deVKW+96UBgHxdIDMlj4Sg8rtA+RdLqmJvp
 lfa484zqmtXpt1H7euHOxBhdub8KmXS4igmivs/rzLCViad4MTpCxtqzNYtGFa/XPtx7hD37ncX
 ynhROZfDtHWbb0Gq+47BAiWF8QOml+t3IFuqpcZkPT4tqT3SVtBmAS6V51jYuiW/9f+yTt7k5uP
 2pTlApRzZ+PImHNDs/w==
X-Proofpoint-ORIG-GUID: svYzH8B-54qNTYyXkiibrl92bVXHqZ0S
X-Proofpoint-GUID: svYzH8B-54qNTYyXkiibrl92bVXHqZ0S
X-Authority-Analysis: v=2.4 cv=COYnnBrD c=1 sm=1 tr=0 ts=69a44c9a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=4/OApUm1v7sVY8kc7hZvWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Z9vnt9DBQu4Rfwh2U9cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_062635_975707_738B5D79 
X-CRM114-Status: GOOD (  23.26  )
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

On 2/28/2026 3:31 AM, Bart Van Assche wrote:
> On 2/27/26 8:07 AM, Can Guo wrote:
>> Before power mode change to a target power mode, TX Equalzation Training
>
> "Equalzation" -> "Equalization"
Done.
>
>> (EQTR) needs be done for that target power mode. In addition, before TX
>> EQTR we need to change the power mode to HS-G1. These cannot happen
>> before the vops pwr_change_notify(PRE_CHANGE) because we don't know the
>> negotiated target power mode yet. It is neither approprite if all these
>> happen post the vops pwr_change_notify(PRE_CHANGE) as we are going to
>> change the power mode to HS-G1 for TX EQTR.
>
> approprite -> appropriate
Done.
>
> Additionally, if "neither" occurs in a sentence, "nor" should occur in
> the same sentence. I don't see "nor" in the above sentence?
Will improve the commit message in next version.
>
>> Introduce a new ufshcd vops negotiate_pwr_mode(), so that TX EQTR can be
>> done after vops negotiate_pwr_mode() and before vops 
>> pwr_change_notify().
>
> This patch does much more than only introducing a new vendor operation.
> Please make sure the patch description is complete.
Done.
>
>> -    return -ENOTSUPP;
>> +    return -EOPNOTSUPP;
>
> Why has ENOTSUPP been changed into EOPNOTSUPP?
I got a warning from checkpatch.pl when I add the new vops, so I changed 
the same for
ufshcd_vops_pwr_change_notify() too.

WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#59: FILE: drivers/ufs/core/ufshcd-priv.h:178:
+       return -ENOTSUPP;
>
>> -static int ufshcd_change_power_mode(struct ufs_hba *hba,
>> -                 struct ufs_pa_layer_attr *pwr_mode)
>> +static int __ufshcd_change_power_mode(struct ufs_hba *hba,
>> +                      struct ufs_pa_layer_attr *pwr_mode)
>>   {
>>       int ret;
>
> The double underscore prefix is typically used in the Linux kernel to
> indicate that the caller holds a lock. That is not the case here. Please
> choose another name for this function, e.g.
> ufshcd_dme_change_power_mode().
Done.
>
> Thanks,
>
> Bart.


