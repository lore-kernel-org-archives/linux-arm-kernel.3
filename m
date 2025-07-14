Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061A4C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 00:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VeRYeb70rL7zEXLABWVIX1u+Q+tiztEJvNfdb8INwvs=; b=TIOGhmMHDz1sxwVoqIZQyGISUz
	EtiMidoqVnKSG570VtdkpLXfjaWhzafmQmt/kZfVWzOmJ4iAKYY1kIN4OJdIp6MnvnTK6raXkT2Cq
	b0SBEvRInkTsqo6wifyHT5Tx0TTJi5uWQv/irchjG+hFBL67e8M8T4EsnagPcAzY0WKl7yyNWXBT0
	gOmn2AnnctfD2kGKWiAGKFxIL/HwWUvQ5I8sEle1KISXlLMdiKf5NkWXwi1+ViOBzsvxf8NZU9/eW
	LdE5zBLU3MHqQA6j7KG412zG16Bpm4ehQF2N2UgtyCATIdOexIvJI6K0oqnxRbWagrAKMyB+2Q0tk
	BxgCSiSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubTRD-00000003cxl-3aWL;
	Tue, 15 Jul 2025 00:22:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubSnw-00000003ZHC-2Qte
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 23:41:53 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EKavIW002934
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 23:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VeRYeb70rL7zEXLABWVIX1u+Q+tiztEJvNfdb8INwvs=; b=cOogs6hZKzC35kE+
	Ei4d7dTfIKS+kLdyr+YXzjV1e202w3IiHFk7GE3C9VkxfXBMI0lxvB/6Qpx7IVzt
	lYV/5Zajz8+aDwtACN2aqgFjv79iTXy5Nxu/bquJKGEClJhaZOWYVqb2EB0npdin
	KdHoXwtCPj1aKqKs7J7ga6LYjBVCCHop2A5pYCglBzg+HqB8mZlKex0lenxeruFd
	/BWqWEJc87yXcuDNlXNKmUxFTMywZXgss+ULgcLGVvIufxHpbBeJ5kEHex9k8ltB
	++86XwX1XNNcDyBgc0ytgON0ZWCLsyQBeUMkpYCxjpDVFh2hjgqPnby6i9SGi8BO
	QWjg2A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufut63x8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 23:41:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ab7a01c38cso2248341cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 16:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752536511; x=1753141311;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VeRYeb70rL7zEXLABWVIX1u+Q+tiztEJvNfdb8INwvs=;
        b=dtEntsCRxRIolGLc3SOcASZKQ3GC2y8mtqxTAxLTFFLrY9HgZOh0HTMdslR8JGcpk4
         mVw37qEzFZid/kBxZgVxtJzbtOQQmdXq0ephefcpl2otwR5PoLuRZ3dQ24vBBL/Ur/AR
         mWsjPyoAeTdHzc1vV9Yr4RAY0OSpDSG3a/gGhB14pIzv+Y83iIpQoYCTU9UR4i3Uwv+E
         u2T9MoutQ17QS6WEb0dEoiijMujIgz7PonsC8iVwYOSHeV/Qfw14ctT4e6IO5NqNFs3h
         8fUEVqquxlrcPQcJcYgacESDQ9fKLtAvFgnliuG4xgGIrT4JlD9VgmjOvl4sndTQjqeW
         jSkg==
X-Forwarded-Encrypted: i=1; AJvYcCWDJccahige1v5qBDO52fyMM5SUMbAA+yTC7dj+9JBuh6BDnP+49nDrEl+v3Xckdm/Zs8mWDBDPz5vcdfYbjYje@lists.infradead.org
X-Gm-Message-State: AOJu0YyMFaLHSrdUc9OSpOJa5zJcfm+xtIT23XFfREvqeJ1MAsb9VM8B
	AHmrYTdFAlzN0gQOxlJ9mGLRPNlhrCts7CyiqZJDvsN0DCksVuRgxX9rqR1qEpj+5fuoYmPsi6M
	89nJ/U8Mf+TrnhXCTI+SKyZjUQkrzk2WLqb4p81nnEzuyCF6hWg0EbWYvxPjLZ+pGXfPq4kZgIR
	DVFw==
X-Gm-Gg: ASbGncudAeqeILtHtORb50kUgLC0NMWcFiaKUWdlcS2GN3FfKvwOlbQf+RVYFSQNFPF
	dgtKI4Rb2xFxk+aLqjY0okjjSESaSVYIDs7/aqNwZKD/nqIIycHnOBs/JDQENIMULX9MwD9UlTW
	riBzJd4JqRxlyHNqr2k2bnZPSiOJZlN2zPIUaiMRHWn9l81WDcMGZpX783qFJuMpgbDmn0WTn+5
	3qbqu36ezrpd5mvUsDzsMT70yoZE7Vho8DLWp0EBkUFwVHMaGHtyqUyJ2LSzr4MLWjMTZEsH5Ag
	pe4Jaf5xHvrKAfLkcCPANJnlhPq9rGgEo9q7rZOsbRas3mOF2UXWa3HS4Oxl1YK+Rkc3NJd/ctr
	i1NbW7Hl2MZBZtbYw+szB
X-Received: by 2002:a05:620a:d86:b0:7d3:f0a1:2f3e with SMTP id af79cd13be357-7dde99530b9mr793405985a.2.1752536510677;
        Mon, 14 Jul 2025 16:41:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEG7XfqmPDJb/D49KYu7FtbuASdqoalUiWXMFW7Y9kAKQLdst5o2Dt8cMYPxnLj3lAeTolOpQ==
X-Received: by 2002:a05:620a:d86:b0:7d3:f0a1:2f3e with SMTP id af79cd13be357-7dde99530b9mr793403785a.2.1752536510136;
        Mon, 14 Jul 2025 16:41:50 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e91d10sm893953766b.5.2025.07.14.16.41.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 16:41:49 -0700 (PDT)
Message-ID: <3ae51350-61a8-422c-8e39-32ea6d8b2e9a@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 01:41:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] sound: soc: qcom: qdsp6: q6dsp-lpass-clocks: convert
 from round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Olivier Moysan <olivier.moysan@foss.st.com>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
 <20250710-sound-clk-round-rate-v1-4-4a9c3bb6ff3a@redhat.com>
 <c321ed9f-7906-4a92-9202-efb46343ee91@oss.qualcomm.com>
 <CABx5tqJzEMUXz0Cbo5siCnwKp2MVON_oGgMnGkb_cg1zv8k5nw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CABx5tqJzEMUXz0Cbo5siCnwKp2MVON_oGgMnGkb_cg1zv8k5nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e7gGSbp/ c=1 sm=1 tr=0 ts=687595bf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8
 a=ICpbbQuAY509VL3I2goA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: CfuGQxRL_93XY-oWhKHc_9MmSiSHSOBr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDE2OSBTYWx0ZWRfXz5k2hSmq2Zsj
 900d8h9e5fKAuT/ecJycK9UZOrANiUpLJ+3o0tdjTnZO+3Arhk8Z5R1gtc4beFMmyLQ3HNJuQth
 DHlA71OS18PGOZiNUa5fwE9+e4JBqpKcWOzruFGTMQ7iDnBu009pFAV1N/G4o5MHKzQkRm5e1pf
 bfAEZhDnlTyuFfDFK3Ufskm/ZQYJanhr2y5jwlj9d5EeuccOjx3HGr5WAMMQM1dbDe8Z2fVEACn
 g/LQzkOcuObdCz0R3ykP+mc4pYN8BPj8VsvvPLA4NjNmqTf+nKg+UvtIw/5ZjuEL69PrKUE+ifA
 T9g/TWPNiNS7zVNB1Amu9A2Pxv07dC0fy4juYcJCg+7wZpnxw2Zl0TvXmduulhjZTLlfQuDDRuB
 ypd79l5iSj61k19wgoGJq+akWsBKqXTX5fU/yOxC+VdhZAcVA4QeZEaJ1bt78wUC+2gWKlKv
X-Proofpoint-ORIG-GUID: CfuGQxRL_93XY-oWhKHc_9MmSiSHSOBr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=868 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_164152_733741_47104BFF 
X-CRM114-Status: GOOD (  19.37  )
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

On 7/14/25 10:39 PM, Brian Masney wrote:
> Hi Konrad,
> 
> On Thu, Jul 10, 2025 at 12:09 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 7/10/25 5:51 PM, Brian Masney wrote:
>>> The round_rate() clk ops is deprecated, so migrate this driver from
>>> round_rate() to determine_rate() using the Coccinelle semantic patch
>>> on the cover letter of this series.
>>>
>>> Signed-off-by: Brian Masney <bmasney@redhat.com>
>>> ---
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> come to think of it, there are a lot of drivers that can not
>> do any rate rounding - perhaps we could introduce a NOP implementation
>> in the clk core that we could reference, instead of copypasting
>> int foo(...) { "return 0" }?
> 
> I'll look at that for a second round of cleanup once all of the
> round_rates have been removed from the tree. From what I recall about
> the ~200 or so round_rate implementations in the kernel tree, there
> were maybe only 5 or so that cover this noop case. QC seemed to have
> the most from what I recall.
> 
> It wouldn't be hard to make a Coccinelle script to look for the noop
> determine_rate() implementations.

Thanks!

Konrad

