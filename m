Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4BDCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 05:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2i3SzamJL4AYPJyTX0D+tVvBeIVOXOGLPmwZ6XLXzAw=; b=L10VEdPLrjWvwLr/eZnCjgj5eU
	wmUHlSDqOviznsjJmkxb5+MfxXCKpUyklkSiEOcOscvya/yVdCU6HRRdjOJtJztdec6lVI8oTEWjb
	OhXPA71M9nOkQAwx6dNrEJMVG/TQJURRd5xeO/Fhlpye3ZgB50zhB/pla0KCXuUr7ZpwF6Bwl9iCY
	apZnE616oFB2HUdbf0pdsq+EiTURTcUxCmbJPIN4rCcvJD35Z7WipDTqmMylS+Kz8tjmoX+gjWLlB
	xCXn6Qz0GIr4b8XuvunpjUSs82KhwV+yg/lNHHXqvf4wnHSY7mgWtkBAXqx+/fRrmueTUBjOMgE3Z
	p3krS/Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9cpf-00000006bI7-32jy;
	Fri, 17 Oct 2025 05:16:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9cpd-00000006bHm-2rOc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 05:16:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLUV1028686
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 05:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2i3SzamJL4AYPJyTX0D+tVvBeIVOXOGLPmwZ6XLXzAw=; b=dkHBEjPMHL9wAjE0
	5upjym3ARatCxOz2kNM/uOm+afi35HA2Ma5DEdQuPpRhvUC6OKX8VNdPlIDk45YU
	RJ0ZfAyYmAVgRSbAAaJjpK3lNY/TrvW2V3J+efAGycFTDDuhBy9Lx1sqg6a1imIs
	dLGlbV4577mcwWSs55mU6/cXVbM8WtILML3laAVORCLApOvoOtRTwnBM1dbwtE8a
	2L8gjzTGxHwRAz6mEY4L5xzEKJf9R0qhlQPVTZrh3okG0uHomhBFq44pMc6rkrdA
	Eb4SUNk+PmjPLFVDAPs80bBQqlUE5IWIdBdA4fqtIiJ6gWI+9DLD8vHPUsvcCaF9
	6Y7RpA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49u1h0tjuw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 05:16:49 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-780f914b5a4so1669591b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 22:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760678208; x=1761283008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2i3SzamJL4AYPJyTX0D+tVvBeIVOXOGLPmwZ6XLXzAw=;
        b=YT4IuHQtN/LtlVU+Tt6U/N8oGhOixty7qb7j9UTb0Y7N6jKI8vUed7oulS3uioy9oz
         MRkedIbILBR+82EhWjOSBunMYedYRRkdnng8mL1TLY3NyU1V7uhpR3QsEscbkcAS0mzz
         xDzXKO2iQ04+Yr6MCyzXRpoWkO26o7/2XvR/sxfWR7diigXuE4IlTNOFuxUUvHgDuxrQ
         Pu/5uLz3B9yVGN3TJPCRqv612Q3wHgLuYh64QF+7h/WE+ba/EmgY92o0l+ejsp9IhlaI
         U7d1BbSWDpKWCt0/wC3E84kx72Zf18DfW4xOJLuy7iq9DHIkRZN8TFfjbsLv4qVUefrL
         yn6A==
X-Gm-Message-State: AOJu0Yx+g9+DTHC9cPeWqH8NzgynJ1QdFWeW5s26ZtF8SnGAw6IyPhLb
	ixwhZZoZkx2VoT36nWgwRGpd5kYMnZ9ZMq/HIF96tOSasaURWpji7wybOrp2xtpYmHObaZigAtd
	iyiPQmSNWKxj4U7ngBW2InMj2cHQs9PIqsTBAxl8t1nv9xBgY9gcOYsBQcUhWbV95Ftaw5wbUOA
	0G93eXK3UlmQ==
X-Gm-Gg: ASbGncvVwyE68gA+WXBhxf6c/l/3D8FaAsRdAebe3eEcJR5vtuGdt8bQXGqcH4AmQ9f
	aRlv6PJgrLgENfUO8Jnqht0eq5S5DqO02XeRGhgfxi4luYTY9cmnrW9dh25mx0ik/Y5sre7WVk3
	Cei3MZ18xD9XCsc+RLOjYUCwiCD4/Jtmamr4BJxn7s/hs23gAYqERkIRz92DdHM5PceHCLQByqw
	MvV3b9FsO00V05e6ZyrcmbDkvEB/ESCImNZj1cMjJhMNDNws0KTHwn2qilWBu0CAz1a5NiTW6Ny
	G5YtqJD8ybF5RZUrP6oDv0x+cc7RiNbjT38nbbbldBbNKCIvCAsGTN2gZbwdRxPu9HS55hJ7ZSJ
	Yxp50YU/B46RZM46caoBh1a1GNZ0=
X-Received: by 2002:a05:6a20:1611:b0:334:84f7:564b with SMTP id adf61e73a8af0-334a8536f64mr3070539637.23.1760678208044;
        Thu, 16 Oct 2025 22:16:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/y/lA99xt+x1uOg5ljZ5MzeXPQPV2BT5QU7TifJtGK4mBkRRMuRFx49x342nAHdOiJhOUaQ==
X-Received: by 2002:a05:6a20:1611:b0:334:84f7:564b with SMTP id adf61e73a8af0-334a8536f64mr3070510637.23.1760678207531;
        Thu, 16 Oct 2025 22:16:47 -0700 (PDT)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d096740sm24387908b3a.38.2025.10.16.22.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 22:16:47 -0700 (PDT)
Message-ID: <37f54b76-a274-4ce2-aaa9-88ba0eb84199@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 10:46:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Change CONFIG_SM_TCSRCC_8750 from m to
 y
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org
References: <20251017-update_defconfig_tcsrcc_sm8750-v1-1-34b1b47a0bda@oss.qualcomm.com>
 <30390038-0f90-48a4-befe-475cf88ba1fb@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <30390038-0f90-48a4-befe-475cf88ba1fb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=esXSD4pX c=1 sm=1 tr=0 ts=68f1d141 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=eFfWDuD68qI0Rqvue3IA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: Rw9-jD4nu1xKZCxnHPQzWOQWUpAq756Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDA5OSBTYWx0ZWRfX5uct5SozciLn
 +TnG0mckKuD6zR/qgP/aN3gJq2bKvZnkQ1k7d5eEKs4NOgy+OJAV0SZtEpk1KZjgaG+1BFB3/nJ
 BY0luy9OVFE2Xjq2XQDfHGBcjR3RvQvf5jgyntijDG99zFhxxxZcQZ4fRrhefl531ydaDDyiAiR
 l1ysRp5Ev4Q5zy7PUUdEWWx3ZbodydC0ps2S+O2lw0Pv2AqQwLqBd/laKl9p0WsTsMBrWKZv+3D
 BNu/fZZe/LNdOLCLB3wU3lrUAHWX3H4HOHdTcFQKGyYDnTiflFBfpQCjQKlse2hKsbepboDI5bh
 hVNktqTdTbEcUDpImRe3YlIlGHQDRIcECmRDlsyJn8NI5t4YgiL8K2+sJUtr8k9wVVsFfpjYMcI
 EvdUBpxsRMSWV4ILTSUdQQjKdoVQrg==
X-Proofpoint-ORIG-GUID: Rw9-jD4nu1xKZCxnHPQzWOQWUpAq756Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510160099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_221649_727576_97FE7839 
X-CRM114-Status: GOOD (  16.19  )
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



On 10/17/2025 10:00 AM, Krzysztof Kozlowski wrote:
> On 16/10/2025 20:53, Taniya Das wrote:
>> The TCSR clock controller is required  during boot to provide the ref
>> clocks to the UFS controller. Setting CONFIG_SM_TCSRCC_8750 to y ensures
>> the UFS driver successfully probe and initialize the device.
>>
>> Without this change, the UFS subsystem fails to mount as a usable file
>> system during boot.
> 
> 
> That's not what I observed. UFS works fine, especially that it is a
> module, so no, this is not a desired change and explanation is not only
> insufficient but actually incorrect.
> 

Krzysztof, on Pakala MTP we are observing the below issue and it
requires the module of tscrcc to be loaded explicitly. This patch also
aligns to how it is on all other targets.

/soc@0/phy@1d80000: Failed to get clk index: 2 ret: -517
[   10.496570] ufshcd-qcom 1d84000.ufs: freq-table-hz property not specified
[   10.503660] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
find vdd-hba-supply regulator, assuming enabled
[   10.514548] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
find vccq2-supply regulator, assuming enabled
[   10.565955] platform 1d80000.phy: deferred probe pending: (reason
unknown)
[   10.573078] platform 1d84000.ufs: deferred probe pending:
ufshcd-qcom: ufshcd_pltfrm_init() failed

-- 
Thanks,
Taniya Das


