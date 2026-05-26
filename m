Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1983DCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 11:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CHAu3B+RqoYdQwFHmyU/h5KRrBLinAR+rlG1dzIMfnc=; b=Nueu13nE2ZbnJ6fD5vy1QrvjgU
	6RZRZQtO8hqJ5MCFhuCHhCv+3A5ZVOyDeVITD+/PngKAbM0RnUnIZsNahh03qQZtLtJg4sf30wgRt
	0ZtHkGcaelSMii/lG6cq/CYZxLViUtAo0uGg1pApVsUQbJQE82eKe49mtLQPBqsj3UNHlAGCzYLhy
	I5egZELqAvAKr6OWH89REieJ52PbjAkfD6fZ9IXEF/pYf/M6DMnOTEwPsCa158MhCYRKapjMTH9Fk
	NmcbnysRkKK8lqXW+jQ6nNmz/GbODVB1tpsyqOqHGEL9rQU6IVqXjJJIO605qyxvM/zSAu0ntxcxX
	v5g0YgyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRq7Q-00000001ovU-22Id;
	Tue, 26 May 2026 11:38:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRq7O-00000001ouP-160i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 11:38:43 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q6vAOj482918
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 11:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CHAu3B+RqoYdQwFHmyU/h5KRrBLinAR+rlG1dzIMfnc=; b=nOIOhAehciDL0r8X
	yax84JZEqX9g+t2judWawswD2Uerl1ZRRmEoIDY3F49rDrIMpX+nQIJV036GH+UK
	n9GPI+W0ZH9zTRySlJ8ihStHDQKr7wNUGGYtEG5QAo5zEe5BNxFrVstAjhMFQqhR
	GGm9pMteCbYenttuAHge1wF1wJjOdE8MHm28ur5+tWpZ2oJqnv3w3VgCaFp1MvWk
	m2knHSnGOsgJ3pN2y9eYgspWZftFMBlhzq2a+b0cZwuz1szHo+v6DGCCi7QujOX0
	7ophqcMsUtW9GbcDsH29o0b8uBE+VcR+SavBsOc4M1ZdcZGUtsMxfpOIdCSyYvyM
	zjqHUA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqynbmry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 11:38:40 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-835423c69ffso5443534b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 04:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779795519; x=1780400319; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CHAu3B+RqoYdQwFHmyU/h5KRrBLinAR+rlG1dzIMfnc=;
        b=N1CnJ0DUAD/a2Fr75huETW81MT7kkFtiIp3jD+Y3iPKqNbuQuNMq+N0bhPjeHVNJTs
         fZl5wX02LzmU+o12ZIGp3Do7t0lGEuc3QFIUPJJ/FGb7mEXQgQmilJFiZ7GTOERWvbK1
         GYKf9eeKm8X1tWHhIQa/avpce2n/TSaxvn73PrdFqNe7Vf+eaOoKnWV4zMG1/b9fRbcE
         djHpo/D1CNGAgL/Rx4C4s+Km0X0dkv9husYvlX8QNk8QUpQGtEzR7LKMU6ZATHVkr4/t
         9Ei2zBpyzWCrkSNdRtBbHZRV/0M0iFwsLHjXwOKolFgqJj8rhJ/4wh0S1/eJUScIWQFR
         iJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779795519; x=1780400319;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CHAu3B+RqoYdQwFHmyU/h5KRrBLinAR+rlG1dzIMfnc=;
        b=BMy5qvuEI5oDxeTV8UgCryN237tqLF2cNPig5GV+UPkcZ89RkMss7SObgteJO4Bjqs
         McEpiORVUy1m0hfe/fsaqLsdEoXXOQJ8F4yuiw4UV2iR0MXEZ5r/XZjWZPm6fxXrNbTe
         +S1Q9n58vzVHubL872C4nf9re51EcpaTbLwIc9BTG7IVXjTYztRdIBc5Ueg768xL/R9L
         zHpzyOUst2o9zZ66sFGIY75ExH7+6ggXIHGFXEPDo2dzq46IZ5XkO4N2o0M8XJY1VCkI
         Cloehdi8C2DnMsRGDK8FzXwSmIIUA95cCvXjJUKhYvCbuyTAJmeqURpmiMAhmGhYW2QO
         OTmw==
X-Forwarded-Encrypted: i=1; AFNElJ8wKiFnnzEpm/Nut1e0YCYeqCxMqoNZlFXVDmE1F7jbk+ICxZR/BcbyT0KuvtYlg2+N03PCtWZeMVUZwVvXgZs/@lists.infradead.org
X-Gm-Message-State: AOJu0YxkdYetjxhR6Oees+V1dhngmKMNT9tuGahJZ71MGNArB4Z7uz0d
	xrT3hFEPOuZFACLyXyTp+0mB3hUh03yDbKnqa19YuHBcSIKXfCHtBnv+CS27RqnGfXymVO+r+y0
	wpvWeH98j6sYfaSWHHTxHnOriipHB69qUW9hZwnawcfE/n+w2+D5zZYuqL16KN+bD5M86HclY9o
	Mylw==
X-Gm-Gg: Acq92OEivfpMLqfJmOYZqAEzZNVFg/yY/m+i1wp04OL48G4DHn9A+stwNWZrypu1HgB
	tKRfTxG01J1A9gllKBmlZgnS/RAJiHxOFVlkcMl2e94k/5ctP+meE+A8P/X87TO5JxM6177D0aM
	QRUsI2mhq6KkKuD+GxD0YuiZVFf1MEK9seyf+2FmX2qZwIyZB2iRJjjuKG2LboIB6LIL4vTqi1t
	81tJ3xM+I68+CtjHQ5dofExx6O3trFXbHMdjegGwhcyIeDwSuGACdWLvom321I7OQmXbhD+gDsA
	GO9lbTArjVU+46u+HMWjo2/6KmCcZgoqGa0FqdJDktYuCChWqofaGpZ+ycOubWeoW15Yie/DL/p
	6UBkVisqE9pS7xt2DWXYqd4YftFe0w9NjIeQ00H/qSMYnyi9b
X-Received: by 2002:a05:6a00:6b91:10b0:841:71fd:60c4 with SMTP id d2e1a72fcca58-84171fd649fmr10382857b3a.4.1779795519479;
        Tue, 26 May 2026 04:38:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:6b91:10b0:841:71fd:60c4 with SMTP id d2e1a72fcca58-84171fd649fmr10382828b3a.4.1779795519008;
        Tue, 26 May 2026 04:38:39 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164af10b5sm11685360b3a.15.2026.05.26.04.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 04:38:38 -0700 (PDT)
Message-ID: <2140a893-8959-49d5-83e2-464ec79e0801@oss.qualcomm.com>
Date: Tue, 26 May 2026 17:08:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] clk: qcom: camcc: Add support for camera clock
 controller for Eliza
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-6-a1d125619a5a@oss.qualcomm.com>
 <lbixqj4cgausikhelm3iq5kamgmxf6ibhv67p6aya3fyqpdck5@ygy2yzntbo35>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <lbixqj4cgausikhelm3iq5kamgmxf6ibhv67p6aya3fyqpdck5@ygy2yzntbo35>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wpwb99fv c=1 sm=1 tr=0 ts=6a158640 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=StVILoaL_uWnGg5ebB4A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: CbRqYgjTTahzC14blikCYaxDQVREizB1
X-Proofpoint-ORIG-GUID: CbRqYgjTTahzC14blikCYaxDQVREizB1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEwMSBTYWx0ZWRfX72i5zwENl5v+
 yfMYF+Upzo4Pi1INw/crbW/5amAVvGvnqBbWyDKXEV3tmegycqp6BY1AnB4vpoWvdscEl1mpmdP
 v3cwTRSBijHQNRMlvA4X/KupAOpvuDF5T/9oeQLXicR9sqX7Y4d8IFeTsWrfTFqf/WbJVnB05TM
 NdZ7ZbB3sv1AbOYkV+wfJ1mlfvlanbt1CbMoRbxNVwVdmCIL+Xo2IPrpgcH0c0Jl6KssCjiMeYI
 wqhhVyJwaWBlp6Yni+NLk06LcrgitEKuXz6/IjpoU7lERyDG8dWfZZhhLfaRRdsQvshZU1EfXF7
 5X3EbSoC6L1zqvrdu8GFJT1uSNTSPFjYzHdmPQw6jbr/ee/yyPZFNIcT6kscI7jFzK4/+Dbb7Cs
 ej3dWyLTmX++1hvuKDgJtNEZmU8Wjli4vjonY07bb0Gf6so2PSc10lxmRK3emTRXFMTRJNJJzCD
 GAl6ZyEoPcenAAE9hvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_043842_419748_13D58AD9 
X-CRM114-Status: GOOD (  13.43  )
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



On 5/25/2026 4:42 PM, Dmitry Baryshkov wrote:
> The camcc and cambistmclkccc drivers looks pretty close to SM8750,
> except for using a different PLLs. Would it make sense to have common
> drivers instead?

Dmitry, on Eliza, CAMCC and CAMBISTMCLKCC are powered by the CX and MX
rails, whereas on SM8750 they use the MMCX and MXC rails. The PLL
types/configurations differ across the two platforms and the frequencies
across rcgs are also updated.

Due to these differences in power domains, PLLs and frequency plans
update reusing the SM8750 drivers for Eliza was not considered.

-- 
Thanks,
Taniya Das


