Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A763F01825
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 10:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v9kq8Rwj6Nj70RxlwjNL/YWOuGNBkH4XA9hyPzQZwSg=; b=FfDtHdbRh3et0mJykrJzwBXdBS
	W8pCgBEkScHEGdnyXCamA9X15dPhd0Ks5vXMRqrBqxEFTKifv+Lz2vcwEDVUXyfNzTDSGk5wj5/eS
	n8L9uUoBS66Dx+XDoeRlvAikN4X9QZH2dEjSWEWqO7hxgfArVW+PUAz0YnFjw68UKl+l+Ied90Z+0
	StCf+w/hnlwRgsb0Uk5moL5uQARk1N7Vs/W118kmLQW0sW5aQF3AUguO+E7tDJpJcQh/0JMF0Y/Vx
	awalUqqBdA8b0MsFNxBmd3slmVZetHorQLIts8HWBgcNSQiPcjGQSzpM5q2oN4dFtaz3iubTfJQhr
	Adn168nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySTQ-00000003TYf-38Zr;
	Fri, 06 Mar 2026 10:32:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySTN-00000003TUl-3Yb8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 10:31:59 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264afLe265849
	for <linux-arm-kernel@lists.infradead.org>; Fri, 6 Mar 2026 10:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v9kq8Rwj6Nj70RxlwjNL/YWOuGNBkH4XA9hyPzQZwSg=; b=ID5KbRuvUC1SoizJ
	umuQ0puANJIk5HMtDv7fekJ4BBl2DaXH40Orl6y+Zc0Zt6unBEzS3YDVNPCk0em1
	ZCyb2z11eHx3gM57wK2rbdoQc1hV4VEJI/uibL0Z+ZoeNM1y/Rq2Zu8OdhJfowEO
	qBLW4VB4SM2SXULUEOzaff6DAzMYjDqw8nTjaeibkWWnI65mVKplnQByNEtk3Tio
	X1NSyZEyLHPI8WvoD08QMNerJp1Zh6xwlbIRGY2CdVW99xDgjYu8oa+SFrpkS02X
	slfB5qWOYr86Zf3pS2eo7iOFXo6ZeF3lvtRXRb5UEuAiIEem2guRfQpcXtiCkrmE
	NMcyZA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqdvku7c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 10:31:56 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c738bebd53fso5817286a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 02:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772793116; x=1773397916; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v9kq8Rwj6Nj70RxlwjNL/YWOuGNBkH4XA9hyPzQZwSg=;
        b=P78/27+Upsq1Hkv8JEWMNv7bNB0pkaJYo3nT4hiV8QMWDWiFG3ygisWXnjuKMkmyhK
         ifpux4DhJbRJx9reshAevgKoFy4PEjI7jjZ2g4pxDRZPFjwnzqsY1f6GJ4t1rRIO52KJ
         YurgTlV4bNn7LOjAd/qrsWWQm1ET9+LLEBvhfk5yUnFOyZzwP0ESgtzct7w8kxfK2h2t
         WOG448NVDm/ORs6kGLF+Kd5WuL8XK1B/vUKOzgmd+5UeTf9WT87NrCPDkDyqQGam5jF8
         u9PThfYsxJUi161KgIzulxNmXhn5rydle01KkSrGU3vHx58yxmf7AikEpc63f45WHgZO
         TwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772793116; x=1773397916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v9kq8Rwj6Nj70RxlwjNL/YWOuGNBkH4XA9hyPzQZwSg=;
        b=clSgdUSN0j8yAl1XWJtfEpsj+DNiPFE9oN/LdefnFNLLoStkhZzRrVacQfFdgXvGH5
         vz0XXvfhm2Iv8KMiXtwE0RkUz0MKLThHsQsu5XSSanFZk5CsdqYEvplbsOWVf3elQkPc
         fyvVwVAV/4FPY/qQ2MFa6V7wduTs2NSAvzxzERNy9khBoAXYOEbXUCQ4jtvWAUHVDRob
         +GbGjj91fBCpTjxh1xLzJOtyWiYDE0xtGMcEzO/YU+T8dkGdj8uSWqivfH7YN7OvDg3L
         RXjgDSYKPbfpNS57OEohB9ZZJTEAxePFFtaLHrx8W1PvXwO11z9GK0hds4O7RxF6X3ZR
         DP4w==
X-Forwarded-Encrypted: i=1; AJvYcCU7bI5JQxb54rrdBB4vWjPfH3BXQuXcjCyEKvh75WMy86eLEY5P+NHPOwcFv1OK3leuKk5q0ZFOBkZ5Lo+RUKQY@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8+ExqbwnO/lcLw8cL3w3inp37hLjp7MO+wIX99f83dlypa2td
	xTvBhEYCfxd1CvAqzD2lOwtADR8WDE8qob3BUFLbKEA2K5wM9FVBAg0UX7ADMxxmHuszYeMwsFk
	AQ/gcym/SRREiLdeVBDXHsJBiTY0GZO2NuGtB7lDc9X35SjFDrX/190MI1sT2Oi/yrreE5yzO/L
	qn9w==
X-Gm-Gg: ATEYQzzgZ5G97JUAjHXSvxYdmimdTYsKhBRVjJOWsArfvjRrw5grxr1KnLrnhMV+WLp
	HzCBPY/dRsNsgGJIhwTNmloplFYo68D5ZBhE3QQDvmxI/kdPtPvNhLMEQrHQcJifKIqwKASM02O
	Ypu/qfMv903Dbz3JuDaNmTiaJ0aFiKW+Ppypi6y6fODb26IT13FB2SrOH3hyPCjhcYI6p8izQSe
	B/54FG3A/mtwYhdd+NII9Vb94crejV8c75FrnZPMLCvCROREAQCm0w++Yh3JWjW78jk5QiYmhbx
	yupvRD9BgCDTKppaFO6/5vCuD3U6oVH4X1JIiGPCdrlNoaXCVKR6eGOL//TY71IqfjuNZxld8gk
	EcA/Yc3+FdmR27nJFyYcJ6QoSPvQ449mZDqV+Jj9FnrvwRgptpV+X3A==
X-Received: by 2002:a05:6a21:2d44:b0:398:4b6a:90cc with SMTP id adf61e73a8af0-398590df8bcmr1886661637.70.1772793115759;
        Fri, 06 Mar 2026 02:31:55 -0800 (PST)
X-Received: by 2002:a05:6a21:2d44:b0:398:4b6a:90cc with SMTP id adf61e73a8af0-398590df8bcmr1886632637.70.1772793115260;
        Fri, 06 Mar 2026 02:31:55 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48dfc17sm1726877b3a.64.2026.03.06.02.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 02:31:54 -0800 (PST)
Message-ID: <aa97748a-cf72-464c-98f6-11d792551aba@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 16:01:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] PCI: qcom: Power down PHY via PARF_PHY_CTRL before
 disabling rails/clocks
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com,
        bjorn.andersson@oss.qualcomm.com
References: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
 <20260217-d3cold-v2-4-89b322864043@oss.qualcomm.com>
 <to6p7yf2oo5qh37hsye4zpputrc7p4bwgqvjc2plieuyapjdhp@7xshxghi4tzd>
 <313d2262-56e4-49b0-8455-2b46d0966976@oss.qualcomm.com>
 <ksd4ogzz2o5uuwnkvq6yzcwm3zsxiaeuotdj6aiqrew7jqrwl4@g3wcnqhviqwq>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <ksd4ogzz2o5uuwnkvq6yzcwm3zsxiaeuotdj6aiqrew7jqrwl4@g3wcnqhviqwq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M7xA6iws c=1 sm=1 tr=0 ts=69aaad1c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=uIgEQj9WjdynuVTCvEgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDEwMCBTYWx0ZWRfX/JrVs3cPAp2R
 z0vCdq0PuaSPV5po991RGiiwOSBq0tM6DEhuz3QSAlhSoXW8V1Pzn4FN8iMyYFAxMGSYMhDAcCK
 6kNK0kHdUlPxcJWVEfrYSI548+iMDj++eb9G0ZnFJ9OvcRf+7cEFfWBohIMO+pZ48dM/UcrVWp+
 8sG2mx6qMpC13+4OhnJOc6ywwJi87fl57LbFoQZzDEVzs8DzyVHVS7rs1Ae+/My+NztvNR3ghD8
 h/O179G+FnuU45THfh8SXXk80z8QvgjLDY76hFiYrIJdY04B+HB4LIPeZHv9g9S7rNIaY0mj1S9
 8DbLmVcWFo8Vg2NfvBF0SpZXaSZ6E6z4/TJXuL975xnFPR72Y4MFiJegKxN9P02e3TmIHtIodwK
 VHAgWNGqBaBWromyUgA5FzZkdx4E6w1EHJt8ldb322O978bIOeGC3D9v8cRy5Op5qaL9hOE8qe5
 RBO/zSWD7K4BYHBWp2A==
X-Proofpoint-GUID: fDsI35mMyXfRVySiZ7LZpY8ZHfqR2mrN
X-Proofpoint-ORIG-GUID: fDsI35mMyXfRVySiZ7LZpY8ZHfqR2mrN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_023157_976298_A649BE20 
X-CRM114-Status: GOOD (  21.22  )
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



On 3/5/2026 2:48 PM, Manivannan Sadhasivam wrote:
> On Thu, Mar 05, 2026 at 02:26:22PM +0530, Krishna Chaitanya Chundru wrote:
>>
>> On 3/5/2026 1:19 PM, Manivannan Sadhasivam wrote:
>>> On Tue, Feb 17, 2026 at 04:49:09PM +0530, Krishna Chaitanya Chundru wrote:
>>>> Some Qcom PCIe controller variants bring the PHY out of test power-down
>>>> (PHY_TEST_PWR_DOWN) during init. When the link is later transitioned
>>>> towards D3cold and the driver disables PCIe clocks and/or regulators
>>>> without explicitly re-asserting PHY_TEST_PWR_DOWN, the PHY can remain
>>>> partially powered, leading to avoidable power leakage.
>>>>
>>>> Update the init-path comments to reflect that PARF_PHY_CTRL is used to
>>>> power the PHY on. Also, for controller revisions that enable PHY power
>>>> in init (2.3.2, 2.3.3, 2.7.0 and 2.9.0), explicitly power the PHY down
>>>> via PARF_PHY_CTRL in the deinit path before disabling clocks/regulators.
>>>>
>>>> This ensures the PHY is put into a defined low-power state prior to
>>>> removing its supplies, preventing leakage when entering D3cold.
>>>>
>>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>>> ---
>>>>    drivers/pci/controller/dwc/pcie-qcom.c | 30 +++++++++++++++++++++++++++---
>>>>    1 file changed, 27 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>>>> index 2c4dc7134e006d3530a809f1bcc1a6488d4632ad..b02c19bbdf2ea5db252c2a0281a569bb3a0cc497 100644
>>>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>>>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>>>> @@ -513,7 +513,7 @@ static int qcom_pcie_post_init_2_1_0(struct qcom_pcie *pcie)
>>>>    	u32 val;
>>>>    	int ret;
>>>> -	/* enable PCIe clocks and resets */
>>>> +	/* PHY power ON */
>>> This comment is confusing since we already have phy_power_on() API. What does
>>> really happen in the 'test power down' case?
>> QCOM PCIe controller wrapper has way to force the entire PHY into lowest
>> power
>> state by turning everything off, without this bit being cleared the phy will
>> not be
>> powered on even after phy_power_on(), we can think this as a kind of switch
>> from the controller side to power on phy.
>>
> We never cared to set/clear this bit so far. So I'm assuming that if we simply
> set it during init, it will not do any harm and allow the PHY to fully power
> down itself when phy_power_off() is called?
we are already doing set/clear of this bit, its not newly introduced 
one, I am
updating the  comment  to correctly reflect hw behaviour. PHY power on 
looks little
confusing I will update the commet to "Force PHY out of lowest mode".

- Krishna Chaitanya.
> - Mani
>


