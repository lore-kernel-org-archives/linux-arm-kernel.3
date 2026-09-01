Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A21AC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 16:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b62TM3b+R7LBBBMdiFoxJotUo5iPVNG6UJ+rLi3xZbw=; b=JucGn1bJuJAPPhXNHGJ6CR3OCO
	zQ5XjQoVB2PUQf42tDsK2yYdYZ6h+KLZaomeYfNQQXTuuCdRGz9xLN5kNpmfZXAywDG942f68qkar
	CUblte0fU8H0UNquwbEY/XhLBD0ggCVuDG0edFkcRprfG2vi8GJWymSM/qh78YLCVmBMuXgMPPwG2
	a4WN06vjVW9KsIIwEIIrKEuXKcTwt8+LyDuPortY1vN3veN8VuJvAOLfFfYgGLrexoNU95QZIGDaT
	siXjQAuuUCGyiycyZFtVczE1MS1Rj8uRDeuM3HzoFhamUQ9VRgODTpUaj5Dt3tGl1KIw0ahEg434S
	2XvBgHOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RfV-0000000Chom-2E7i;
	Tue, 01 Sep 2026 16:49:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RfO-0000000ChnW-0Mpb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 16:48:59 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E974m2912234
	for <linux-arm-kernel@lists.infradead.org>; Tue, 1 Sep 2026 16:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b62TM3b+R7LBBBMdiFoxJotUo5iPVNG6UJ+rLi3xZbw=; b=gLNqsgggpn1u3v7B
	ihUObr1bhMSg+9eNo6gGT6JwdQ7VCl51Iw1tDlfT4vRHHDM0zHCPu7D0NAMXY0zW
	AAwHroDHKm4owfTqo/eS9u+jDHHeLbm3JKcUK52z+XGnbU9RvFqJ+1KwRR2L6qJk
	JVLFPl1EYWSvB0Ua4ajiC5qSdyS0Qg1A3IHBC2SWo8BSj87hAUb7ZPFrDWH/qiP3
	OCjG5jrZyzgig4exr5ZLAcflW30O/0utbZfTJY3ql5AOlbKCGyvJQ+X+aeyedqW2
	IulmWho7SXtAee0CvZgQClTNGFS6P8W7Q6rG9pVLPhmpYQp1fQj5rLHqH7AmI4kd
	rX2J3Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7r3jju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 16:48:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-385d2703b64so1445997a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 09:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788281333; x=1788886133; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b62TM3b+R7LBBBMdiFoxJotUo5iPVNG6UJ+rLi3xZbw=;
        b=JdJKcb/vYBasnaV+J6K2fzAtUwfRlbsS0Yz91ySm8N6NIWhvmr41GTlUQ9Rq3K+3FE
         QWhrDSfEv1VVnZZraDbVB8mODiPXFDGYIOdkktiGxmFKQ46FXGnwaQcZTjuEdweriDwM
         WIW6mHrWzZmxvHGE1wpzmebNcTKG3Y1zDqeer5B+NT4FGszdNOpBk1QML5qmFofKg/3a
         2l1J5xGjsKsQPs9Q9K/2F8EcEIKsSIfy/TcMls8z7j4DATOvr+QM+DvMQu9MGWApeKbO
         xd/AG6OtxxjbR4ableuyCpRTT8IzwWHDxxJNysK5NjeTLcoCw35ASLoCCUClkmneLzTa
         7htA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788281333; x=1788886133;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b62TM3b+R7LBBBMdiFoxJotUo5iPVNG6UJ+rLi3xZbw=;
        b=GfFja15izrzwtNplCNc1AVFSWjFiUEQXPX+40/4gYYB81PDVpeRtnRO54ssz9iVw15
         J+M1Pjt3sCyibxA0eWAL4Kv370ABG2OFZcm34M66QDoKYDfUNdPe/uT25yRdltx8+FCM
         uHiC5FK7kjnRDsZ9tHQw9BoLC75szhLunwf//76XsxS7J3ts081YGJCDaBGAz2CzRuku
         A/tSSMfjTVyCUUkoQ/kCYPSj/Gsf4HXgsr2xkP2Oa9i7lIj96B6JENtsp/3ulFMkivTu
         DNvFi/gM0fVSpcrbEYCWxhCUCDpzE5aD0BatdV78ql2HEKttuotjL/uu0Sz3K6vBAhNb
         dvZA==
X-Forwarded-Encrypted: i=1; AKwUvBxJzn1wncK6gGpMV0ZaQ062Eze/RfWfBZRpDQOPwE8afaSaf8zmeWDQWUY8XZGbI+klphOgdf68f7ad0KOHJMin@lists.infradead.org
X-Gm-Message-State: AFuF++kHzChZO8Ajv8gNbAbgbYztD1YMUgDk17RbYWwScyQM/EebwDe5
	iQaw0IOhqdEyt/PkIJUxZvvUfCxN2dHCkKoxWhM2rtVPL4TDwJHLcNzgoH0s8U6CHa4+osimzVB
	5BwnZ+vV69glNRfAU50PWcG0s7UcI7SA9g7szsTht+IlvdeBGTuZhpqVcRutw53nvKdGrEKPapK
	2d0A==
X-Gm-Gg: AYBFou3izOsXYSnMnHUJq/2ikJ+5Up3D5M2/gR2FnmGLr55DIe6FQmkbk/kMWjBbpNh
	lXlr8cQlKrDcccb6cQF0TzP3+7AMlqs4ny/wHkGyV9bug5F1+QeL9a9x6iPLQtb748CvL84D9W+
	jkTCGet058gJuHTwcUnINK/bQ7C4OjyARubEtjIBgbWEoGBu0+bHQt5FReE2liB3kxzArqs6bVV
	VvpaOACoL6w2JCUZZf4D0TCIS7mm2Uy7bTUNzTRf0Jh2lF89OpYXL0BpvorLbuDciwUwmlfKWE6
	TlT9Dkdptje5gU8sVzqc/C7562A30SymHyj+9Ky1t3LoAwL8scLe27pYFNII8hZ50Le8D94GnTJ
	ecRPavK0arspaGFvmn5Lt5MoMVIuY/pAc
X-Received: by 2002:a17:90b:2247:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-3990f890861mr6902051a91.16.1788281333017;
        Tue, 01 Sep 2026 09:48:53 -0700 (PDT)
X-Received: by 2002:a17:90b:2247:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-3990f890861mr6901973a91.16.1788281332349;
        Tue, 01 Sep 2026 09:48:52 -0700 (PDT)
Received: from [192.168.0.5] ([49.204.111.114])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b944bsm41662284eec.27.2026.09.01.09.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 09:48:51 -0700 (PDT)
Message-ID: <177884a8-902f-49be-8fcb-b2bec3ec7d6c@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 22:18:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] soc: qcom: geni: Derive SE clock configuration
 from OPP table on SA8255P
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, mukesh.savaliya@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <CAPx+jO9fcvBsxe9yx9oK=0EXmpNwub5ba0a-TGk1WRFaRGsqpA@mail.gmail.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <CAPx+jO9fcvBsxe9yx9oK=0EXmpNwub5ba0a-TGk1WRFaRGsqpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=beZbluPB c=1 sm=1 tr=0 ts=6a9701f6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Z/g59IqO3Gki/5UUpFMnLg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=1OWG-U-0pMjJ1F8qq_YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0OCBTYWx0ZWRfX9sxdwxDU8gmB
 09fdFhU6hO6umDJtIkxqEdR5gK6q94RVaqQW5Oiu/7p3zbgGAfeSNclXVgk/vZNLm9YJAshr6Zp
 d3+RCDiGOF7I2pNTqFKaoK3wjQQnnJubdr4kTk+eiuruPKQXaeUUi6NqAMEIKAoRBwE2EBGO1lp
 YtsdNlGLZgajQIMTzwBfiXTEmylStk9FPIRzPceaDOIHTSLR4iEGawIZaCEiYjtcNogNFgkWilL
 1El7xfCg6GgTn6V6OEOq/pb0LzEz4KWPNXojShgHUyoHOZkADlUy0e/w933S76jVrASxiavTRxc
 DEYSRhXb3Ep1GHhzAlNjO9n//qG4Ld8ijPRREYE3+vX3VyLqDavbE8Y1YLalZOBFxQcenpxHkuB
 NOnORyt6p721pb65ol1giqJC2tOTu6/F55mZ3xMKScjAWRJK0SOZRmsFUNDhcarz3I00HVFhlR+
 RwYImu5pfpIEbuWtFqw==
X-Proofpoint-GUID: GG5FVdCSwisanGbenHBTVdMUpeuP8XBr
X-Proofpoint-ORIG-GUID: GG5FVdCSwisanGbenHBTVdMUpeuP8XBr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0OCBTYWx0ZWRfXzLLCbVJxm3rM
 HUm63wbMF1Fl4heeZhoANaDyIgdVNQUWUyD+hgPNw3pi1fA1Zd3HAP5+DmNTQ6gn7TfhdeQuYlH
 wFH8fCNxoKW95z4/ZLkvHyqDww4aaEM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_094858_258746_F8C65971 
X-CRM114-Status: GOOD (  34.37  )
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

Hi Ulf,

On 01-09-2026 20:22, Ulf Hansson wrote:
> On Thu, Aug 27, 2026 at 7:59 PM Praveen Talari
> <praveen.talari@oss.qualcomm.com> wrote:
>> On firmware-managed platforms such as SA8255P, there is no Linux clock
>> handler available to determine the appropriate SE source clock, source
>> clock index, and divider values for a requested protocol frequency.
>> However, these parameters are required when programming GSI TREs, where
>> the hardware expects an explicit clock source selection and divider
>> configuration for the serial engine.
>>
>> In contrast, platforms using Linux-managed clocks derive these
>> parameters through geni_se_clk_freq_match() using the source clock
>> information stored in clk_perf_tbl. Since the firmware-managed path
>> lacks equivalent clock information, protocol drivers cannot reuse the
>> existing frequency matching logic and instead rely on a direct mapping
>> between protocol-requested frequencies and performance levels. This
>> creates a separate clock configuration flow and prevents
>> firmware-managed platforms from deriving the actual SE clock parameters
>> required for GSI TRE programming.
> Hmm, this sounds like moving backwards when it comes to keeping
> drivers as portable as possible.
>
> I understand geni_se_clk_freq_match() has been around for a while, but
> fortunately its use seems limited to only a few qcom specific drivers.
>
> Rather than continue down this path, would it not be possible to find
> a more generic solution for "geni_se_clk_freq_match()"? Can we replace
> it with a common clock/OPP API? In this way, we would not need to
> sprinkle drivers with calls to platform specific  code.
I agree that protocol drivers should not need to know whether GENI resources
are managed through the clock framework or a firmware-provided 
performance domain.

The intent of this series is actually to move in that direction rather than
introduce a separate flow. Today firmware-managed platforms cannot use
geni_se_clk_freq_match() because clk_perf_tbl is only populated when a 
Linux clock
is present. This series derives the same clock-performance 
information(clk_perf_tbl) from the OPP
table and populates clk_perf_tbl during geni_se_domain_attach(), 
allowing both
resource-management models to reuse the existing 
geni_se_clk_freq_match() infrastructure.

Likewise, geni_se_set_rate() hides whether the underlying implementation 
uses
dev_pm_opp_set_rate() on a perf-domain device or a regular clock-backed 
device,
so protocol drivers no longer need platform-specific callbacks. The goal 
is to
converge both paths behind common GENI helpers rather than maintain separate
clock-selection mechanisms.
>
>> To address this limitation, the performance-domain OPP table is treated
>> as the representation of SE-supported source clock frequencies. During
>> geni_se_domain_attach(), the OPP entries are used to populate
>> clk_perf_tbl and related clock performance data, allowing
>> firmware-managed platforms to leverage the same clock frequency matching
>> infrastructure used by Linux-managed platforms.
>>
>> With this change, protocol drivers can use geni_se_clk_freq_match() to
>> select the closest supported source clock frequency for a requested
>> protocol rate, derive the corresponding source clock index and divider
>> values required for GSI TRE programming, and apply the matched clock
>> through the OPP framework. This removes the dependency on direct
>> protocol-frequency-to-performance-level mappings and provides a common
>> clock selection and configuration mechanism across both firmware-managed
>> and Linux-managed GENI deployments.
> Rather than adding yet another platform specific method, would it be
> possible to extend the generic OPP library with the pieces that are
> missing to make this work in a generic way?
I agree with the goal of using generic infrastructure. However, 
geni_se_clk_freq_match()
derives GENI-specific parameters such as the source clock, clock index, 
and divider values
required for GSI TRE programming, which are not represented by the 
generic OPP interface today.

This series does not introduce a new clock selection path; it reuses the 
existing
geni_se_clk_freq_match() flow on firmware-managed platforms by populating
clk_perf_tbl from OPP data.
>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> Kind regards
> Uffe
>
>> ---
>> Changes in v2:
>> - Add new patch to remove OPP rate reset from resource deactivation
>> - Add new patch to vote source frequency via OPP for I2C
>> - Compress the SPI, I2C and serial commit messages per review feedback
>> - Drop a stray blank line before trace_geni_i2c_bus_setup() in the
>>    I2C resource-initialization helper commit.
>> - Link to v1: https://patch.msgid.link/20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com
>>
>> ---
>> Praveen Talari (9):
>>        pmdomain: arm: Fix -EINVAL from scmi_pd_set_perf_state() on state 0
>>        soc: qcom: geni-se: Populate clk_perf_tbl with SE source clock frequencies from perf OPP table
>>        soc: qcom: geni-se: Add helper to set SE clock rate via OPP
>>        soc: qcom: geni-se: Remove OPP rate reset from resource deactivation
>>        serial: qcom-geni: Use geni_se_set_rate() for source clock configuration
>>        spi: qcom-geni: Use geni_se_set_rate() for setting source clock frequency
>>        i2c: qcom-geni: Vote for SE clock rate using OPP
>>        i2c: qcom-geni: Use common GENI resource initialization helper
>>        i2c: qcom-geni: Use geni_se_set_rate() for setting source clock frequency
>>
>>   drivers/i2c/busses/i2c-qcom-geni.c      | 72 +++++++++++++++++----------------
>>   drivers/pmdomain/arm/scmi_perf_domain.c |  2 +-
>>   drivers/soc/qcom/qcom-geni-se.c         | 62 +++++++++++++++++++++++++---
>>   drivers/spi/spi-geni-qcom.c             | 24 +++++------
>>   drivers/tty/serial/qcom_geni_serial.c   | 26 ++++++------
>>   include/linux/soc/qcom/geni-se.h        |  2 +
>>   6 files changed, 122 insertions(+), 66 deletions(-)
>> ---
>> base-commit: 0f6da28aab51b16762ed82e8fdeaa5042da45b08
>> change-id: 20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-2f29ad32226a
>>
>> Best regards,
>> --
>> Praveen Talari <praveen.talari@oss.qualcomm.com>
>>

