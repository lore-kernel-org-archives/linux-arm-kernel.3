Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B58CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 18:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tBLeaFmk6s08epL7fzezFMbIHY9YTm/FKC3Gi591Ofo=; b=opxaN+OCkGptUFQbBLkkDGDFm1
	vHv2KdlNZHyNykY0IqUKCSIBbj/DYF7HpDpobTwyTSvXnu74Yx4f9jSLbDKROyjjfcSK0LtuRph+o
	xOUGw4sHCpI1g0wzr/WYabc1LZ6FY6SSNLsTBcOW99QXTqhPmI7DK7hYTKlfoCaI0QsmM72Nssat/
	IIua47h31sPpG50FBly2Nn76s0INWBKLzkaG4AHhsuiWtI8QUvTlRQV3cYXx8a1ftJ67YeZrmXGLd
	6FxegTmeyUpF7I/O/89kPlTqpqPwpBBpu6HcjtG2rK7mgHOmW/6pxSMnv4aEJNZ085wklNvWfv9u7
	suX2XOyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4OMe-0000000B4C8-3ywq;
	Thu, 02 Oct 2025 18:49:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4OMc-0000000B4BA-44Yg;
	Thu, 02 Oct 2025 18:49:16 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59292rfS010749;
	Thu, 2 Oct 2025 18:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tBLeaFmk6s08epL7fzezFMbIHY9YTm/FKC3Gi591Ofo=; b=IN5in/OlQIwxVj+f
	ofWuzvdhiHcWu1Xoa5rPeRHswk64AUGSe4uLlVpxTpAQ7v/auzBQoLO0KVkEpAjO
	tGUc+PeAbg4pkH0bQdZicqq75JPYoBH/B0PYXSHiAp/46tZzw9IxfHK9kJiQfiIi
	0c5qNBFCo6eFvVcrDOkxv4P1p3Cb7A72zGs3HjmCs463mYl/lJqCK5NuejU/Bzj3
	3MDoK+M1wRR2Gw1JY3AjPkBC/b3wEA/zFFRNNnb9tv/iueu4s+2HbFNtnmwsOzNf
	zSqEwn4M0AZXr5aavofUcKTUjNryMBimuopGfwNHAS+hZaeKsGUKwdk1GsG32b1k
	i9W56w==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hrdmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Oct 2025 18:49:01 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 592In1ZH010820
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 2 Oct 2025 18:49:01 GMT
Received: from [10.46.162.103] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 2 Oct
 2025 11:49:00 -0700
Message-ID: <69a111a2-219e-e3d4-8b89-3400facc02e3@quicinc.com>
Date: Thu, 2 Oct 2025 11:48:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 1/2] scsi: ufs: core: Remove
 UFS_DEVICE_QUIRK_DELAY_AFTER_LPM quirk
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        "quic_cang@quicinc.com"
	<quic_cang@quicinc.com>,
        "quic_nitirawa@quicinc.com"
	<quic_nitirawa@quicinc.com>,
        "manivannan.sadhasivam@linaro.org"
	<manivannan.sadhasivam@linaro.org>,
        "bvanassche@acm.org"
	<bvanassche@acm.org>,
        "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>
CC: "beanhuo@micron.com" <beanhuo@micron.com>,
        "chu.stanley@gmail.com"
	<chu.stanley@gmail.com>,
        "quic_mapa@quicinc.com" <quic_mapa@quicinc.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>,
        "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>,
        "mani@kernel.org" <mani@kernel.org>,
        "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
References: <cover.1759348507.git.quic_nguyenb@quicinc.com>
 <0f0a7d5518d29fc384aace558d2bf098d792e0db.1759348507.git.quic_nguyenb@quicinc.com>
 <450e834545af935010ffc4f9079e56e47851f197.camel@mediatek.com>
Content-Language: en-US
From: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
In-Reply-To: <450e834545af935010ffc4f9079e56e47851f197.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX5j/3ThhQFgrC
 uAVrhFIGbxu7FXfvH6i8xQTaMbLMV0nH7XlyjWlBbYpX94kIPFudWKIKrFi0bopIo+HpDDJWLLe
 j2fyARLEG6Upu9nzARs7Ru0Ntz5sPvRsri3KJDKpuSO0z1WjpxwEIWu5A93f77H74pZDV427AyC
 x+1AKyYQzrbeF640CbluCdalPgeQRkUaYQr887Pws0R/pYr/vBcrfMceJ8gM3UQ9ipiW2MCYkqZ
 5eozp5ZuitAkCytyrnXO/Pn5EPYo5jo/PPGal03eVmVeU/h2Zzl1u0PovbXW9sYZABYDi+/qxW2
 S7Gjv4wJPegRNsdPfvixbfarticXQlfuQ5/OyJO/F8KUGy66ywx8hnPOska/FgGSYotqoBa8Z7H
 ncf+T1bji8Sv7+veuTDgmGJzJwFEWQ==
X-Proofpoint-GUID: ULyUvjth2Rl6nV6TlJmOO1GIZWkob7ph
X-Proofpoint-ORIG-GUID: ULyUvjth2Rl6nV6TlJmOO1GIZWkob7ph
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68dec91d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=YKdBxgvyY27R_9wN8GQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_114915_026790_9ADADFF0 
X-CRM114-Status: GOOD (  19.40  )
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

On 10/2/2025 12:57 AM, Peter Wang (王信友) wrote:
> On Wed, 2025-10-01 at 13:57 -0700, Bao D. Nguyen wrote:
>>
>> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
>> index 2e1fa8c..45e509b 100644
>> --- a/drivers/ufs/core/ufshcd.c
>> +++ b/drivers/ufs/core/ufshcd.c
>> @@ -9738,10 +9738,9 @@ static void ufshcd_vreg_set_lpm(struct ufs_hba
>> *hba)
>>          }
>>
>>          /*
>> -        * Some UFS devices require delay after VCC power rail is
>> turned-off.
>> +        * All UFS devices require delay after VCC power rail is
>> turned-off.
>>           */
>> -       if (vcc_off && hba->vreg_info.vcc &&
>> -               hba->dev_quirks & UFS_DEVICE_QUIRK_DELAY_AFTER_LPM)
>> +       if (vcc_off && hba->vreg_info.vcc)
>>                  usleep_range(5000, 5100);
>>   }
>>
>> diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-
>> mediatek.c
>> index f902ce0..5c204d1 100644
>> --- a/drivers/ufs/host/ufs-mediatek.c
>> +++ b/drivers/ufs/host/ufs-mediatek.c
>> @@ -40,8 +40,7 @@ static int  ufs_mtk_config_mcq(struct ufs_hba *hba,
>> bool irq);
>>   static const struct ufs_dev_quirk ufs_mtk_dev_fixups[] = {
>>          { .wmanufacturerid = UFS_ANY_VENDOR,
>>            .model = UFS_ANY_MODEL,
>> -         .quirk = UFS_DEVICE_QUIRK_DELAY_AFTER_LPM |
>> -               UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM },
>> +         .quirk = UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM },
>>          { .wmanufacturerid = UFS_VENDOR_SKHYNIX,
>>            .model = "H9HQ21AFAMZDAR",
>>            .quirk = UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES },
>> @@ -1713,15 +1712,13 @@ static void ufs_mtk_fixup_dev_quirks(struct
>> ufs_hba *hba)
>>   {
>>          ufshcd_fixup_dev_quirks(hba, ufs_mtk_dev_fixups);
>>
>> -       if (ufs_mtk_is_broken_vcc(hba) && hba->vreg_info.vcc &&
>> -           (hba->dev_quirks & UFS_DEVICE_QUIRK_DELAY_AFTER_LPM)) {
>> +       if (ufs_mtk_is_broken_vcc(hba) && hba->vreg_info.vcc) {
>>
> 
> Hi Bao,
> 
> Adding a delay is not reasonable if we have decided to
> keep VCC always on.

Hi Peter,

The current Mediatek platform driver applies this quirk to all ufs 
vendors which is consistent with what we would like to do in the 
Qualcomm platform driver per the vendor's requests.

I do see that, about 5 years ago, Mediatek merged a patch to keep the 
device vcc always on, probably to workaround some HW issues. Since this 
is a very old patch and the impact of this change on a broken hardware 
is minimal, I would like weight the benefit of cleaning up the ufs core 
driver by removing the unnecessary quirk 
UFS_DEVICE_QUIRK_DELAY_AFTER_LPM vs the inconvenience of a 5ms 
(potentially reduce to 2ms) delay impact it may cause on an old broken 
HW in the suspend/shutdown path.

I believe removing the UFS_DEVICE_QUIRK_DELAY_AFTER_LPM quirk in the ufs 
core driver as well as all the platform drivers yields positive net 
benefits in this case.

Thanks, Bao

> 
> Thanks
> Peter
> 
> 
>>                  hba->vreg_info.vcc->always_on = true;
>>                  /*
>>                   * VCC will be kept always-on thus we don't
>> -                * need any delay during regulator operations
>> +                * need any delay before putting device's VCC in LPM
>> mode.
>>                   */
>> -               hba->dev_quirks &=
>> ~(UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM |
>> -                       UFS_DEVICE_QUIRK_DELAY_AFTER_LPM);
>> +               hba->dev_quirks &=
>> ~UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM;
>>
> 
> 
> 
> 
> 


