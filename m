Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673ABC5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 11:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ig6FvSRli1ZqS5uDLkbhiTZeNooor70ALrndiWqEtrI=; b=0eaCMCU73DRh9cn1P2fL7pKjDv
	Ug8LA0ST0Y6Clzg/O0lAP2FTtb96iXBrVmTre1nwrbw3yaMuY91H1orfYVuZPbHSAuLvJQduMlG/G
	STzpi4dw9JUsKJ+L1aBbVEkyJ8MnBlFcO1C+Xj6iBV/z9f7bD9e3WIx363la1utnvE13rFoe9btHf
	0Tsgb5NkWIHlo26E2bywe+ojaR4q8VigeBrTr73kvpJsHsTMxIr95ltX3Giz7YvfXEFgyRKEZG6au
	c89/XW7bMGmBZXzps/j+bnSXxnla9H4SyqZ+3ztuE6ye5AzBYfwJGo0RaiyrTVMq+IRS8wqSOFglo
	EMwp/FJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wweEt-00000009dtO-45r2;
	Wed, 19 Aug 2026 11:13:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wweEq-00000009dra-1PQc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 11:13:45 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA8FPo3754776
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 11:13:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ig6FvSRli1ZqS5uDLkbhiTZeNooor70ALrndiWqEtrI=; b=R6KbtOGk0MOGWZ1p
	gb4jfVydfHxpojFg0GJhs/q21UKl0i/VEiMcB/DcdwHtPGBYoMh9TelId8APGW1H
	mpPKtwLl/mIxWgYIR8VeZHgVifvtEMkhIxaUenX8yCpWRX6UUErn/p0Z/tbgCq5E
	z7azllfMmg6bu707r3cmjGJjj5A22/uc3byH36q4v6RtVqDR1ovUIJfbXPM65JbJ
	HBzd2gq1Jwt7/1TUCgQaILpad8RK8lhnHnmp/F5Kq0Q5IhCm/cW2VwUWd353s6em
	hslwnuteh06ocWdwq+C8G72MQYUVL5B6khbQ/E2RLw6EtvSj50lRTRT4hhS/+8UB
	pR0x9Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yffjt4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 11:13:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d57d17d6cso1932181cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 04:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787138023; x=1787742823; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ig6FvSRli1ZqS5uDLkbhiTZeNooor70ALrndiWqEtrI=;
        b=EW6H3HXdrBYEZ3TsgmUF/tbTz5euP3moYN/3DEbWTQC0ek3DjZUi3k7o5zFWDVINqk
         c68GIYxwWb40ATZAoAGmAWQtnjaw5YcZ7Y44m5YlnS2zBXZgl0gHrVgjVgPNG5yaflmx
         VBMLVxsswpYNgR/drf0evi3FAuXUnarlaSZ9WYp8pWOBkhMsWluM8X1twkuT821rWtxP
         Hejzwun57VjFyRHdK8Jc62+RwVyPTAtyKV8DjPETTDRU2O/63BrZuIfoz5LhJdi+uvGn
         eG9DfEaEnm5VZiDHxtKOknfSxrxVvmdyQRmDBWjq0o/TLvqKuGrR1JYnESOQ6dVmSCcG
         vEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787138023; x=1787742823;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ig6FvSRli1ZqS5uDLkbhiTZeNooor70ALrndiWqEtrI=;
        b=Wz+pZTss6Iq2hxpgcx4wrAeWY2XbrLapfZzpwaapgewElIxFUHidWPQ1LCh6/3+X6a
         tqbOCJnRXxRdkGc+ejoh/vgR3FOqRx205/ov/jbmG4DGq9fr3SQ7PwMgiYYV+A/cbs6i
         P1ZpI7belPhh9H13btHKJSdS8MRVlFwVDGS+A7aHCfLL/PpKA+4AKcG9F3hY0Vr8HG0K
         gie4rVhyROgCus1f4ZyY04YLVZJI2uzBGPX7G6BkFUi92vv3MvHxUrGLl2xqQeT+iI+o
         UcRie3903HHtFkO/yUjRzFe1kq17vBdrUxC6GT9/Qf4GIpKCqOXpcEVIEDGY8OqfD58l
         RjjA==
X-Forwarded-Encrypted: i=1; AHgh+Rpu5ce0uEGIAK56N9lxxUclPmgBWtZfIMgoPugTlJXIys1eR9BQ+xqaWZnvGvA6JZIyBWgGnWbwNluX2G/Faqhg@lists.infradead.org
X-Gm-Message-State: AOJu0YydcpYwQy4kxlt5YOmft3iad/vOHh5MxJMNUvf5EZ617L0ACvxg
	6WccBn/UfUEPCSwoXzy4NJOdRMxhV6wC97q895Q1TM0mB8KbGy2ngM3SOHzA8DTCnBM6yPSGCAK
	U/G/IrLJq3rTjcvHQKcxvScGP518bta2vNH7oH/7uT2bxD9WJs/BXUeyl3Z/cJg2lkeIL0vT4sB
	LuwHmg28WmBQ==
X-Gm-Gg: AR+sD12GUm19RbsrVXqsuCOxAEKx4xKqY7ajJFzzA0AumNfjLwtJTtJb3U9uzj08Wid
	jIAmlCFHWdWOwoGad52KA615OXrWGHM+m21uIRzGfr0w81GZLXnbtqD32CUKc0yt3F9DVBFsXQB
	p5nq3EQW/wOt5GJqMlD1LQYzY+nZCmWBOuftYdl/27rg1qBBxNpXy/jooSsCq9cMTq0xC13ZAa5
	fvhwa8ByGabxaz/Gk7Cl5FfhHE45CXVOdiIXcUtKLiSDZyHeXfH9A4DDjw6v7z4q4Iu6GboOX7A
	M+rYKF7HP+S1Y9aLPhfCJBk4dMsKOMTx01MFbne3trNKuRrho3HjRzW9GAP5bK6WIi+zFXsimtK
	bAzzr2INr/dU4jHdaq/p+/IPV
X-Received: by 2002:ac8:7f0f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52dd5c958aamr25088811cf.3.1787138022829;
        Wed, 19 Aug 2026 04:13:42 -0700 (PDT)
X-Received: by 2002:ac8:7f0f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52dd5c958aamr25088541cf.3.1787138022385;
        Wed, 19 Aug 2026 04:13:42 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c7a6bd9sm57416566b.23.2026.08.19.04.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 04:13:41 -0700 (PDT)
Message-ID: <061e5547-4109-4965-8e97-fb126dea3a28@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 13:13:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] serial: qcom-geni: Propagate errors from optional IRQ
 lookup
To: phucduc.bui@gmail.com, Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frank Li
 <Frank.Li@nxp.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Yenchia Chen <yenchia.chen@mediatek.com>,
        Daniel Golle <daniel@makrotopia.org>,
        Zhiyong Tao
 <zhiyong.tao@mediatek.com>,
        Sherry Sun <sherry.sun@nxp.com>, Robin Gong <yibin.gong@nxp.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Zong Jiang <quic_zongjian@quicinc.com>,
        Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-mediatek@lists.infradead.org,
        imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260807090945.41690-1-phucduc.bui@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260807090945.41690-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA4NiBTYWx0ZWRfXwLMkiB7WN/2+
 c4tj8whPpE9GZpTv+4TIy/oAiqav0HJGXSWKH6zVKbuUZP0MNtantRZuU8ZgYEaeRrobwS26JMX
 cyRo8EYK6+vGJGgMhjnKpW8Ih8a1TZY=
X-Authority-Analysis: v=2.4 cv=H5PrBeYi c=1 sm=1 tr=0 ts=6a858fe7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=HsG88Ws7tFqbOaRkTuUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: DLoRx2VW05ClRv03_Z5U9MGlWZCgE7gA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA4NiBTYWx0ZWRfX/7zyM8Uclkis
 y+rhMCdVpfUirizW5y67u+/34H30bO4G3UHydc7tRXrhfcxXPOUKlg0rqb6H2Ud2LvuquVgdSqs
 c7f9Wma15L+T25WTUElOL7ZUymGdKfp3tBQrUKhhjUP43tA4aw8r+CDyFKS+Sm4b/8ogTMg+aub
 0qa0z+ojTZ/PYNGxS7ghNo7636eurptrihM92W8jTrDx9EAelOTRaq0a+BG7yfqoUgiqZTB0Zx/
 VwMrIFVwTZZMGNW0w++ecron9vZ9JFHCMhdRydYlEDbtY2y4D/V5L/RItV1x7e1azxwEYfEhN85
 REbCewUyI0gizu2poJLXnYKmalsBstt1KFSHUBh24IczQPtXscAeMRub2rdc5fOXIZVm2jaCxkn
 jlXpPMKiDhtfA51lmU7JEBS8sB2TfckfTVYUhlifRTBlzToZK+qkbiN2GB2awzlEbfKbpiIntNe
 5YS+fGqYyQhW91cS30w==
X-Proofpoint-GUID: DLoRx2VW05ClRv03_Z5U9MGlWZCgE7gA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_041344_497125_1B4FBAD8 
X-CRM114-Status: GOOD (  13.05  )
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

On 8/7/26 11:09 AM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no IRQ is available, while other errors should be propagated.
> 
> Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
> probe without the IRQ.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

