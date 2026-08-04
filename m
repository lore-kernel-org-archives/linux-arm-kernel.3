Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4D9C55843
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 05:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q8Zu/1UwTQMaSAqsyU+Lu1vFa2zKo9mX+0Gf5nDY3uU=; b=pNXolQKfrwaTmOYschvHvYYQbd
	X9PJckSdrYo8e+zl7l4sdN9FAmaaH+Jlf587sVNnDUlaxloajX7pYZnIxVfepwU8KLpZ0oc1tYYnm
	zdTO2HEnYXYE4aOmUWwvHIA4wVL7JvwW4FIFXs+uvOX1K5bpnxODe8sdU92rkB6/ROE4Ingp3Anfj
	kuikBwYniVpuP3ELNyFA/pLG9gRfgw5x1RrsTNLytBcoOKUbKxlJysjYgIdIydQxjnF1pgfxwdOs8
	/HFhKCWcWyYlSzmZyAAbvP/JQQ0T5cf6VyYnEiTHqLwXuE0xQgspPvot10tIy751f3dSt9ymOTTC2
	GnCMD6ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr89r-0000000153W-0fGN;
	Tue, 04 Aug 2026 05:57:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr89o-00000001532-32Mv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 05:57:45 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674177sH2429877
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Aug 2026 05:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q8Zu/1UwTQMaSAqsyU+Lu1vFa2zKo9mX+0Gf5nDY3uU=; b=IXPhU9ETEQEb9g9X
	cHMrF90DQPcHxBQvgVxTybBIQ4uIEht2F80DnPb7z1FN9fHDuy4ZuRUhDkXS4BVZ
	AIQcyur7SXQrmbmc3BSfYoRpiQtjl4D+bWRzRrqvBK9biw9fGuGixW/v5Cv/QHTv
	zDmumJTxJVCVmnbgt5UZ4c9AoawVHIZTXYYpgv6BqHma0bsvKwjWU1Mbxuy0BwLr
	Cwtmcfcfi5HJDfXGkGGjX9zP/pb4xgSeJvV5Da8D/E4eayE/AU0XtEI69KYon2Cy
	h/r2I+FgiKw/kt8xkcpIFEqsO8jyT/nOtgbJ5Pl9yM0cQDy2eQySV7bTrAR1jfrS
	wDPVDA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3r2nw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 05:57:43 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85798977dcso7106085a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 22:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785823063; x=1786427863; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q8Zu/1UwTQMaSAqsyU+Lu1vFa2zKo9mX+0Gf5nDY3uU=;
        b=K6h+x3qgmmYM54TdnQcRupgiJtrP+ZHONUpcxyxyiXGtyDAfjdIu+IbI9JTLZhE+vV
         Eqywa04lj3nF1Yb+Je778/M5qcYGYVT4u9COJR68mXo7Y5guJnttZkGUy4aVAb5EObHE
         iUpj50MzP0qXAPe14zcpF9+FSiRgG7Hcqo+m0P9nqDBxWPuMq2bx6368AwnK3yiDpV4c
         XrGkXrAAodknsgdjan/giy8lYRqaboVfcgtySt2YFg93BTL05MSlu4aOS/0i0e4rZACz
         GngMRjr+I4QmsHDJSu0QTc3V+FW1IDie/iPOkk6kBs0eZ2dioLJqLmOIir38Xvi3pTfL
         99Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785823063; x=1786427863;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q8Zu/1UwTQMaSAqsyU+Lu1vFa2zKo9mX+0Gf5nDY3uU=;
        b=qPwII1y8BVo+SrOL4LmnpMCZ2RM62KAAPiyPW170yMd5VrQpPR+Uu3Nujw3n6qmzBC
         eyZWIo8B0T2sVcSOWxKpJWA8U1RkHFqA4ZFuB9jQJBdfiwe6IUtxcSR1y8BqhxLPYYDM
         NqTeexChieo7SV4QMprmI9cOl8G1dEC1mIBw0xfFc+PSSj7XmYNjTUPjJnoPn7RdIwEM
         F4IuZnXSG4OBVt3qDUD4r28MsKgVZQGMrNxqzymSOHgcVqnE/VNhyfsav/s5Piq0QfnV
         Umdy+pMoLaLoHhoNlAXrUgdzKs8R445XsIw/fFWPudxxseqF9VPehgb7AZnOYlVH7w00
         JSeA==
X-Forwarded-Encrypted: i=1; AHgh+Rq5H1LpDt+g8DKCUt0j69Jbc84rywFvfsKyNf0vCILWcq/GK5zqrwCRbCBgACeY+d/9/PiiTp8CKRpxB+Wypx+0@lists.infradead.org
X-Gm-Message-State: AOJu0YwT5dMwzs+AeBBOxOs3ULbgyQ7NsxeTAxxIlz8n1DM33yN107om
	x1pVyjcufJKQ3IiGFC9ifQCds/ZYmLW+EvZ1F15QxJHELrZhOpHP7CsBZoVBu+pEvaNbdrcjkiF
	GmlKLLH4mV06HPc/c0PnxtB9GRTIeYWiM91PT7pTuPSiQMIXhESRSTsQ6Md0FldcaArcc9eZDDH
	k/iw==
X-Gm-Gg: AR+sD11tOEo7ruiluoG7dHtNCyT6V2hNBs735R5KjOzq0dqYYCOwEgBVDrR4PvZGsPO
	rmtxkMK4r9/u1vLqfwWGhnuZMjihZb9HuokIpyT8xE1mZSNm86bdOhZPmtZthaG1AC4vJt2L60J
	K2AAxfpNzHH+xJzVy3rOwQpUSW9omGR7p8oGKkU8Jx+srFEq7qOvf5+9PJLUTl1Rv2iKZHQnxU6
	NwyEm/fdQ/m4MMmPpWvXE/HaJRvN3Vo7mtWIhmrBiZ7rLMQFOMOGDy9VlduPsdimoZzfAqSBV3R
	ESY90S2OCnYHxDHNkmYu6Bt/6Xrc6LN6vEVcCiY7ZXCbAjOJcqfNnFyw2KSiFZVzrcczQ0oxYwC
	7rcDYTt/soAp+w6zRA0hzKymMuzovBMjz
X-Received: by 2002:a05:6a00:4fca:b0:84c:4bf4:10c3 with SMTP id d2e1a72fcca58-84ee490ac3bmr10830757b3a.38.1785823063164;
        Mon, 03 Aug 2026 22:57:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:4fca:b0:84c:4bf4:10c3 with SMTP id d2e1a72fcca58-84ee490ac3bmr10830735b3a.38.1785823062703;
        Mon, 03 Aug 2026 22:57:42 -0700 (PDT)
Received: from [192.168.1.106] ([106.51.192.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc29ebbcsm4598548b3a.34.2026.08.03.22.57.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 22:57:42 -0700 (PDT)
Message-ID: <836c6c2b-6ab0-4dba-9964-aa65ddcb7381@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 11:27:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/11] arm_mpam: propagate MSC access errors for
 mpam_reprogram_ris_partid()
To: Andre Przywara <andre.przywara@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
        Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
        Trilok Soni <tsoni@quicinc.com>,
        Srinivas Ramana <sramana@qti.qualcomm.com>,
        Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
        Ritwick Sharma <ritwick.sharma@arm.com>, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260731170324.2927758-1-andre.przywara@arm.com>
 <20260731170324.2927758-8-andre.przywara@arm.com>
Content-Language: en-US
From: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
In-Reply-To: <20260731170324.2927758-8-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=caPiaHDM c=1 sm=1 tr=0 ts=6a717f58 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ugN4vXIPUBCZxoiA0ovN8A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7CQSdrXTAAAA:8 a=PF9lGtfeLRIEAocP7poA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA0NSBTYWx0ZWRfX9NrVosAD8jtE
 a+iY5t2aBANYIrhMP4v0vtmSHTjgoccV/xM5cxnTbcCb4kyYcDepYPzPjYc/w0sQhy/hwAjlgYx
 P51xOVp3Gp95b/BGMAf+KX+fUmN2NcU=
X-Proofpoint-GUID: -ZiML8gafiey-5X2340WsKZa0QRJYXOJ
X-Proofpoint-ORIG-GUID: -ZiML8gafiey-5X2340WsKZa0QRJYXOJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA0NSBTYWx0ZWRfX1kBxn5LXogd5
 Jz5AQfgzEW04vZM2E8R96lrU60VdX0lCn59fHLNyormL7sjTKRjUf3+CgDBPsp9ThRvbUarBWXg
 BnGS2oG5XVL7BWp6lgZIgW/uNqnoTTQafGviftsxz1wKfN12gaWtcZlWf8NH6YSKG4vdAzY443e
 U0kkRWb6KSw2/5OQuB8bW8/pSyWhwpnKntwF1thG7QlvIrjEe+8MmHulx8Kv0kkCyQjxhpMLj3D
 arbp7x/K0UVy/Yj1QkuCZNhEygYyVgIJUXd3Ivfi4An3o/TtxXxr2hnbtG+84rTfQO5qMb7VWkY
 N0E6Hkz/rORDEPmUPrEOrjC6E1r9OCBbGil5UaQHlsNYi8iZmcQr0P+3CZzeDquvu6X12vXg+lL
 3vAJSxPARw/M3SaQTi1WwHz0dBnaQZWzcTTT6276oXFSJxeEcuMHKw3i/Pgo9I9nxrfqOlAgqBn
 zauK9H3phBXFMRFIT0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_225744_772759_49B18E59 
X-CRM114-Status: GOOD (  20.70  )
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

Hi Andre,

mpam_reprogram_ris_partid() writes hardware registers sequentially.
If a write fails midway (possible on PCC MSCs via SCMI), the earlier
writes are already committed and the hardware is left in a partially
configured state.
Currently this is safe only because mpam_fb_disable_mpam() tears
everything down on any firmware error. If that behavior is ever
relaxed (e.g. for transient BUSY handling), a partial state could
persist and produce weird behavior?

I wanted to point this as a design note.


On 7/31/2026 10:33 PM, Andre Przywara wrote:
> Allow the mpam_reprogram_ris_partid() function check for and return
> errors, and propagate MSC read and write errors from the lower level up.
> This also covers the callers of this function: mpam_reset_ris() and
> apply_config().
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 136 ++++++++++++++++++++++-----------
>   1 file changed, 93 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 38450c55e45e..32088ad1d67e 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1601,7 +1601,7 @@ void mpam_msmon_reset_mbwu(struct mpam_component *comp, struct mon_cfg *ctx)
>   	}
>   }
>   ...

> +static int mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
> +				     struct mpam_config *cfg)
>   {
>   	u32 pri_val = 0;
>   	..
> -	mutex_unlock(&msc->part_sel_lock);
> +	return 0;
>   }
>   
--

Best Regards,
Srivathsa

