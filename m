Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1271EC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 17:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+R6hz3Ifukcx5+qCcKIeT65fs+yH+pDKRs1un5ctVZ4=; b=0CKMRqPR/ACfxhCT/1vdmSjIay
	S61Hj9l4swaYP/1QFwHKxFX/xM69hUdu5ErUrWb3bS/vLHx+8MiVIonS8k/umc3UXcPGxnO0TNf3a
	eehmPJ+KeQhtu8qdcaT2+bh1EFnqyJTQoslw7stPyGChofrf+kXIJg2e5BPP2ecPJhMd54gWWnW0V
	ic0gBEo06PhlxcI2xRa1PNK4P5qLwFxbxuSDD5bVPujBs2V81mv1Pfp9EezdJUVbdPSVIoZ5c2wg8
	XMbxdr8ykMuMQyqvz0QlSDpp7GiQsTBnwM4ZaGRLkrU1tCy35Ltrz7EFno/HzumD3/JWK+6CJ/o8h
	Q1DKY4tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzHZK-00000002pHZ-1hpY;
	Wed, 26 Aug 2026 17:37:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzHZI-00000002pHC-2t9Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 17:37:45 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGufvx2548576
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 17:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+R6hz3Ifukcx5+qCcKIeT65fs+yH+pDKRs1un5ctVZ4=; b=P63suP+j/s6DPKCg
	ovVjzlbWXwxiFUPv7eykvOe4rjDnRgBsEQTTBhfcbLlPTjlgQBHHMEFmfA4SUANV
	3HEzgnpbs8R91lCczhlSQ4WQ3pZtWxW1rmvQNEvU2DFZkuxVCjSfCgV3LY1HJmt6
	E/Is/TnvCKITt/lfVwQ7AcatIYIP0VZRRj9QaspjNGseh8ODd154/y8QsYEs2uLY
	UNctkPxoqvmb0pVYWwcfnRbWy+0Ul2qR6c4SjESjOi/t8nA+ZVNHcVXcStCAQQb3
	Uwj9U8PV+Mu5ay00eld5g2SkjYOGijgesxx3cBpix+hCUZv4JPCqJagBVjOlKFaA
	uPFkDQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uq1tf1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 17:37:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfa55c9430so14472595ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 10:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787765862; x=1788370662; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+R6hz3Ifukcx5+qCcKIeT65fs+yH+pDKRs1un5ctVZ4=;
        b=Mj0HQ8+kxlxjtRtG2pS4SmH/SFV+wK3054z0mJ1ee/Sr6Irf4VVxW5QQoTVI1+30w5
         gtB0fJCtjBIaHDaE52Ujrpr78vEDoCLDoYA9zQda/REldiO0/JYUKSFayyneXVq+TCDQ
         MdGcj1pdSd9WtBUD9kjy812RhN34MKWlSFzht1NC0f7eXF6yqsIPeSHnQt0OSdf5WxXS
         1op/H0hP8m0vBgF40gmhDb1nHIZ1XaVV+M81kr8jHRHQSb+zXLaZkXkNfvXBuOzuOa4w
         eFmUgCyqnOW/xSVKMDD//+f16KV6QapYsbP4CSV8L8cIHss4h+ODy1DYjyHA09dyCSMX
         0peg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787765862; x=1788370662;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+R6hz3Ifukcx5+qCcKIeT65fs+yH+pDKRs1un5ctVZ4=;
        b=FNtxMWIFBFp6B0dI2GdodNZaMEHbnBrpRy9QhhHtZZ+aR1PJ3qnaP3ra4JK0tj/lJV
         amm81AjcmbTmgNiivaYBRXQ8rMpQS98Ne80Y1RlY0I7NT530p8EfGxSW3AAEHuRr0KTY
         X+VZHYGc2yGphIaeCB5QaMew+x0vidsjN8jhSnzx2pDBJIYCG4fSEwpKKdFxCQQIElKW
         DzKQRxDl1zlTY/gonAtLj7BxWcjWvTJrmzxpR4YPL2ys/uq7bgu6QzgdiviM2L6LLIq8
         bz03istWeA3LOhnbpd6Thg4eZttYoJjebSkOMVuqURvT3eEWdhFrIJW2bdoPKmtU84Mc
         ruNA==
X-Forwarded-Encrypted: i=1; AHgh+RrrG68D7N4Lifi+rKFciTo5b1cMnz5gJOjhqgWtumFuCDgpwIz/E7apYZdGUpwdQFlxZhtnh9xax8IavHodk+zJ@lists.infradead.org
X-Gm-Message-State: AFuF++l2sQxMwkhL912k9Wf20kUu1jN+PA3+YN2+anE0/M+76EEMhpj0
	0WolAwud1Yn8D99ZBuXWqScIRsoDyjXL6ABAyKXJBWR82AvBVSm9LEvTCL8QuoUDC+s8HeTdvh3
	FLezAAr5ud9ZttSeGkSyyT2pjctducqwBcPhLa1d/eELRczwod8hz28QXp3gKwJMVQwgyIlVLHY
	TCHW34g7qKcg==
X-Gm-Gg: AR+sD100t217ULUFAtZhl/Z7ayGLSJrArAiiEG5ORdZKJArzJVtaTOptyU/Gxao4oHA
	mtgx322ujBLmL07oFnmVBQliGTDUzw8m3QDmyd4yvroqSSN7pL8RHHeVxexCc9eJnzIePD17CGJ
	uZsLeCMfOed/Wj9YX7ShXO2vp18VItQpnhCnScHf69U8/OHgfzE12sDwrBVj5PluGR5JMOkYmo1
	MvTII4sNU8pcNJR8SD+w3lpxD1vJGDzxJmsB9PpSDc18ZMLhrzEZUTbcxtSDA7c/dCpO1uQFWuT
	mHy00i6eKpXy/x48obQSmtO05egm0dbgWWyd19iskFz7IUvVUsvg0OnFjBqFmKvJMQ8JTrtX6hk
	v34QchiGNLYIGaXL34N9bXQhDgwSR8edoJBhH3spO1FFhGyJOLKDeDn2DEhsBX+l2y228bLEUn0
	0IjbOZy9Qiy8qtfcbWIQ==
X-Received: by 2002:a05:6a20:728a:b0:3b4:6026:6c5d with SMTP id adf61e73a8af0-3cf75e8e9d5mr16110492637.5.1787765862354;
        Wed, 26 Aug 2026 10:37:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:728a:b0:3b4:6026:6c5d with SMTP id adf61e73a8af0-3cf75e8e9d5mr16110404637.5.1787765861893;
        Wed, 26 Aug 2026 10:37:41 -0700 (PDT)
Received: from [10.50.45.102] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1beb0f15dsm1281557a12.9.2026.08.26.10.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 10:37:41 -0700 (PDT)
Message-ID: <315588d8-2a82-406b-a1e5-bcd00128c545@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 23:07:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 08/12] arm_mpam: propagate MSC access errors for
 interrupt control
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
        Ritwick Sharma <ritwick.sharma@arm.com>, Gavin Shan <gshan@redhat.com>,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260807105451.3728284-1-andre.przywara@arm.com>
 <20260807105451.3728284-9-andre.przywara@arm.com>
Content-Language: en-US
From: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
In-Reply-To: <20260807105451.3728284-9-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: T2ieitISvazJEkbwD2eMGlAOhhCY-KUj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0NyBTYWx0ZWRfX7qdCsoJQbf/3
 /afY2gYuiICXJ34siJ3fStnBwo0P63JMn4J0dz7PGxWPpLi5PPYu1mDHBFw70XhP3lqOafOEASA
 Pa8sPoOkMX0RxsgUP2hA6gAid7MO702fURZzLmPMb/aSV/m0+pmNtECdIxBGEd+mRD92NMAI31z
 Gfc6gDY2fkg3yvD7H/S5xWQKGd0r8hG+9KpAiKQ/RwZ6m93xt/VEjJBFDyQN3ZetIrO3Y2NO93r
 tLe6j8DawAz1SHIrOYZiBsn4uq8cL/wa/TDukij2z6DfLRMkyzUaEY4+fwefLPnNGHkOwS2GUw1
 kQWv6G4JTuiL8sinkWtE2KRlffwXuzpNAoW6JbeZzioPwGPDC+N/S5XoXlQX8qk2179AQp+wecK
 fJG8MPlREHd6AkF/n2rPBTsMRoEXQouC4nNY1g4MSbJryxJz5+IG1Jkt+bl1a7Wy6R8u78ayN1X
 LS0sTDHoVo1GU0A/Acw==
X-Authority-Analysis: v=2.4 cv=Y77IdBeN c=1 sm=1 tr=0 ts=6a8f2467 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=JeWy39_HCiB1Np-THXYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: T2ieitISvazJEkbwD2eMGlAOhhCY-KUj
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0NyBTYWx0ZWRfXwSwxmCkuwarN
 HztzyDAbzNBm1YzNrWSyqVcxQPj29AyBuKyP3RJ6HrFGIGJyciWStjXUFuyIpeQZ4oReULrKx2I
 6GpYesRMTtJEwaAwFh3c49H4Gt5qpdE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_103744_744695_8A906231 
X-CRM114-Status: GOOD (  14.75  )
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



On 8/7/2026 4:24 PM, Andre Przywara wrote:
> Allow the functions dealing with interrupt registration and enablement
> to check for and return errors, and propagate MSC read and write errors
> from the lower level up.
> This does not cover the IRQ handler yet, as this needs some more
> attention.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 31 +++++++++++++++----------------
>   1 file changed, 15 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 49239b15a27f..1b07f7765f96 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>


