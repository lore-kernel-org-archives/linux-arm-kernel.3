Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6B6CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 12:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6pmdA4NzH1jhT7/XCJQKYN+fSOrkQss8V4mYUPNsLc8=; b=dJlrmq9gEUP11GgZVP1qoGdxdu
	0dcIhYDaIMYIQ2L5L/a1KCmgrNMxJhi/sBgQOWVmlW6VIUs2dg7XZIkcsC1SewNS637MJMFrFX6LC
	yZY2T1GSTkkT3BkWQTVKjt9MIBz+1cKK0a97E7zDST8aEIKAZanA3uZbNibK68RTh66trP6cxDhOA
	uyftj5V7kkE5iLW4u6XmtBkfswAq4i5JIWeVRijj0rqaznS73ZfgR1eD8fASH/rn3d1d/h/qd6WtL
	9R/6G+yH3HKcs+TdZfLSoD++kPkuCb7pSBdmIVwJspaTqKvbNOHEPCMo2kGpfe7o7IYDptpl+WoDb
	qW3uTU+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6Bm-0000000E9OU-3ITh;
	Mon, 15 Jun 2026 12:13:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6Bj-0000000E9Ns-3TUp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 12:13:12 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FAobtn3956158
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 12:13:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6pmdA4NzH1jhT7/XCJQKYN+fSOrkQss8V4mYUPNsLc8=; b=YlKeDzalYkJqdoSe
	fGINnHiA8B1eAOMBeKM0mFKgS8Ze8pG9f4SrSLvvrdp3K57AXT/9H9fzje7Sglbu
	U33VTKhIujWwAUM6irCLHZhmnQQC7zusCQRDI63d2nlmn2j5TgguG5Lkw5Uok/Cm
	fgbvo8GZljUdavF2/2wbYpytbjei+Noe2L52oHgRaYABN0S6sL1LsyaqmGReCEo/
	GboBI9PwPM4kI+IkVMt/zH3ExF2EhfKNc3e1HnYAq3AFg2aJqs+r4jRQZ1H4e6y0
	sV+orMcgtuQwF1gec3r1yOnPJ3UDig5Ezp5+okw0S2cmOSx09wjGvXshWJqwYoXt
	Pak2fQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter00k3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 12:13:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51968526a68so3187181cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 05:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781525590; x=1782130390; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6pmdA4NzH1jhT7/XCJQKYN+fSOrkQss8V4mYUPNsLc8=;
        b=fkodo2T2ubeNrJL5VC5ZCUpoyTgjk5rZSXUc8Uq1hnFosvQG4tiDw62ifpnlBDDy05
         P6Eq492Bmf9PtuFmPLsreqSNHKO0cZAq+B/xaU8/BSrSgKJTDWQ9MzvBxcnjNA0Pv/UX
         xVwRGiGiGl6npYdedzVZsDVhUJgUWvFKpfOQcV7IpeKsdYZlRaG01qDphlJ5qhc2G8Aa
         FbQ420UPSlAEF8GZwHE8+fxUD+4TqVqh8klprYklIixv/a2gY+axmf3n4LIaG4LW1oSI
         v+NzFfAhta478NjnUwHgHxZJRE0HbC0M0sPCEZ4pFqK6mNZ+ETtjiIda/KqcqePtc/ph
         5hlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525590; x=1782130390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6pmdA4NzH1jhT7/XCJQKYN+fSOrkQss8V4mYUPNsLc8=;
        b=X2TpE/n9E4sO9eFPIG6hns+AeDKyHZynJ2ZVPIqXhZ3NvG4luEU+hmFtNQEgFMpu1u
         9RGk+yM7Q+RPpyMT+XpuzeV/pukcaf7ckWqDkC+mhCP65Y+FKx/aCPvKsU2bpN49tHoo
         5aBaDYLD7GpWSYJ6bXVNDMqPF2yiYzb2RzDsr/n5xo6fl20pivmlGLryY7maeOifkhGE
         CvFXKd3Narn+Xio9ZH11VA9zpsqXAq+/0gsul2oaTTC+sAeGyQc2T8ImhposdG9w9D6U
         4boBlj9eHgtVlbEfBavvqjibcKhuzef3mseWC4VRYXKw4by0i9e0pnEwW0LfjlxHkPO4
         Ea5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/arIWNHt9WnI52p/E5u/X5Qllih+MrEDIHHeOKroE5N8MLlhOI/EnVut63pGbUnRM2FQ7JXHAUPVvrWg00BQ5u@lists.infradead.org
X-Gm-Message-State: AOJu0YwH4dsrCAPtfQc7yoQI9KkNKZ8uTGoSgqD0juirkaLzHr7MSYwo
	2R86eRr+6RA68wFZvn8CFwuxSkUGhdMxzWQ59x8NNVZ4FGhzRljSxJlHRm+hyNNtBDzPJ/ETVPI
	fm5tcLuNPy1YbFd16jmVnXTsvlZAQQKBFTrsrMAgFFSAqjf7VTJADsjQNMOQrmDkFiy13uMBdY5
	XK/w==
X-Gm-Gg: Acq92OHcbuaaeEUdyvbC6TE7xxWGjbGY/naYlElCDQmbNjT2QKtP387noFUYVL5I8JE
	1pMLndOJwjz9Z3t7VOix33evRIRdsYqRkiNNejPQxCaBuzZpauzWlBPIjuNdrBw5Dbducpo0+8w
	62P0NXJn1qU72V5ciVPbgE4eo9+ChhnbLsMVVaZka9AiMZFuJs8lE2HczLIwRGSS9AJG0CCzMW3
	Ph1sCfGcXf3LLIZXRspvkuKZ/H8oZpznL7eDND6q2MiVNz+JFwpoOwGQ/lkVpbxqaZbDBKyUz+X
	ZQHQ9B888Wqkj3DYp8W0rRuU38PEIemAlitULTRsEzJNPkMkvVPrJCfJDdT8xh2bBbJDF3Lca8s
	H7Oam2nffuLU3o4bGiF1iKJe2wvWkGsPodmmzZleKig9naQ==
X-Received: by 2002:ac8:598e:0:b0:517:62f4:e3d1 with SMTP id d75a77b69052e-517fde8985amr129458311cf.2.1781525590121;
        Mon, 15 Jun 2026 05:13:10 -0700 (PDT)
X-Received: by 2002:ac8:598e:0:b0:517:62f4:e3d1 with SMTP id d75a77b69052e-517fde8985amr129458051cf.2.1781525589661;
        Mon, 15 Jun 2026 05:13:09 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4423439sm459791666b.2.2026.06.15.05.13.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 05:13:08 -0700 (PDT)
Message-ID: <45d7faac-7c0f-4f89-808e-06129e8420e4@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:13:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 4/9] net: stmmac: qcom-ethqos: add per-platform NOC
 clock voting
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-4-f0f4a1d19929@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260612-shikra_ethernet-v1-4-f0f4a1d19929@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SlmeCNKMmbiDEvssOTfoLwrnfr1xJ37E
X-Proofpoint-GUID: SlmeCNKMmbiDEvssOTfoLwrnfr1xJ37E
X-Authority-Analysis: v=2.4 cv=UPzt2ify c=1 sm=1 tr=0 ts=6a2fec57 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=dCDc4JseV86iyfNbYEQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEyOSBTYWx0ZWRfX6jFrGL6UBVL9
 42+raE+7sOz+oSHmKWk0kjO6zQSUUVIbe1VfqPMeH+CABMK+pahldScZmUx3qsZ0+DYaQJ5fo21
 l1anVmswR9oldRBwxRBnjNoD36y3V9ByyWBLFU2Aqu050GVRZJlJLXLymr9JpRyrYXJW0jNYSh4
 wNtrqTnjEmpDrpJXtv5wnD74+Rf/KMAr5Gc5hgrL63WcJeVMSnVknXfkYS9KBUSX+IWStS4jXLe
 C6m0Q8bAfC1KGkweUdvOQ0tjQkR/dMlDVwEdg4cZ+nkmlv8mVdgEnKMPDOc16VhnOYR9+5+oP+e
 Zs6kJf/rRCgbBQn79dpaB5/7yN3qEd5pBJEIRb7mnoEByFEyrFrKjlQVbGir+Dy14C9V9/0iNAt
 j7oFdHmkaABg+N3eVqkmwAU+426eJCdlUJVcfJydGjS3YqQ2lDHN19qsvQJAtEML7sisaP/ucol
 9zaIE0e7ASVoBrAzqIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEyOSBTYWx0ZWRfXzacf18OiBJhX
 LZ9KNT4Wum2VTGxECaKkd1G94hoFnvFaB+rBUyeid/LBYvsc1S3KkO5/JWOovtw8ZEuFVe2VmKo
 /kLNSGG/xBHKFYNPI3ppqZVXbrWkwRM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_051311_897060_4539C3C1 
X-CRM114-Status: GOOD (  11.43  )
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

On 6/11/26 8:37 PM, Mohd Ayaan Anwar wrote:
> Some SoCs gate the EMAC's path to the System NOC behind dedicated clocks
> that must be enabled before the DMA can reach memory.  Add
> ethqos_noc_clk_cfg and the corresponding fields in the driver-data and
> runtime structs so each compatible can declare its own set with per-clock
> rates.  The clocks are acquired during probe and enabled/disabled
> alongside the existing link clock in ethqos_clks_config().

Sounds like we should use an OPP table instead, we can't just do 
set_rate() on qcom, as that will not propagate the required perf
state to the clock controller's supplier power domain (i.e. VDDCX)

Konrad

