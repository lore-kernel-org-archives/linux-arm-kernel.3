Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CB6C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aXabJbQ5GKuSQz+kVwnj3VIjTGckGkJ3Lh8aDQ/65UI=; b=153BF84wG1a37DOuVSTWHZQdEy
	7RLD738UHeJ5PsYL0PCHIq84Q1LnSGkY2kAfv0kfEzd923rwHfsQr0HGBSIr74dbowvVzoGmW/sz0
	yMqTlKgkZaUm9Gyt91X+NvsowVdm84lKUOvZvLkR5xesnOkH4m9acIgTQHHQtT5RDe96DObTZ/k1V
	yAyLK9u7j78S1knMwa4FLjHXOLBmE4r5AcICGk30M7t3YDaNYT8o7vrtCxdlaO2hbFFL4O4w44N08
	DVkIHpyVJE6+JPeIU4RsXlFrAxgGD7KebUvbKNDDVoaMcTi3ixz33qKh63U3T/f7yRihUT46wJZe9
	LBrSOjmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Cl-00000005QTx-45bV;
	Tue, 22 Sep 2026 13:06:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Cj-00000005QTO-1UIL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:06:38 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPeDv269221
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 13:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aXabJbQ5GKuSQz+kVwnj3VIjTGckGkJ3Lh8aDQ/65UI=; b=lheEa0pQ4wbU+4SM
	nttQDF/eeNcZ8LqaonuqKrhcBLJDVxqFuW5hZP8J9/Hei3pi8H91jYapkWUWWBCS
	3Ci0ibT3K4miDdppzj1capW3kxGUlZRnvjtZADecv60Yctezno5+fEHo4I80xb5T
	IInDQTrO/Z4uyTZ4dSjp3OSDYgUUeUBQqu7ROMbhQvhjYe8BlG3KEIY+pycjTaXB
	gjvsABHXOfU1MD8VQEpXarzIgHwTKK3ozxFBTVfUt6Fa+Zx8xcbYqEYWf08dvAvG
	leNem7sKdqMFG3i807NGdHw/kPclTtdVo0wR2hEovb0SjnS29QijH5tbUEgsfGNO
	95NwGA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufbatukt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 13:06:36 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6c71ca02d5fso525422eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790082396; x=1790687196; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aXabJbQ5GKuSQz+kVwnj3VIjTGckGkJ3Lh8aDQ/65UI=;
        b=aSZ2nlKwzSqs/44T5yLFKXrBJ+x/R3eGeD0CYBSKkqGt7xpIyJj4FeMxEhne/TRH7s
         V9q4Qp3ofVH+wJCpe7itCK6A4bff0Qgp+LP3MKmg7Lc+pr3PCADc3nrhGxP1HY2o4fDV
         /Omj4M+5NEonLaHrj7rmBgFbPxAHmSYLa5Fcv2BjZqgGmcfOW3B30z/shBzZiSaMYMkR
         upu9drlHNaLN1Rrrs0IRF3063clekw0J17RNYStB+Ck2rT4l/wGDe+hCkwEQaAiTLU9A
         yTZ3Fyw6nSlFZQIB9RfjOmN+P6sNED1iQpdqXXmisCW5lZGXiaMzxCC2fR7pS5k3LAG/
         DUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082396; x=1790687196;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aXabJbQ5GKuSQz+kVwnj3VIjTGckGkJ3Lh8aDQ/65UI=;
        b=YdCac6sn75xzFjemROdSRrWDCW6ARFK7PmLEHBv3SbmPbo5oD0VLGScHnkwzw/bt7U
         WjPu0t/MtuPAm1xl7CgXrYFVfyuAhjrICFsWFrRTuuxXvD5h9XoH52W1aeaNnHO+PRU/
         PKOVtoZSUV3NaHYOIRX+Llpx7DYbH+lrKFBCTAK5ZX4dQNJvlTEnV9Yu9INscMLrHjSV
         QA/GdswMiqmlScJF1NShKuqIitulw2+4aEoEPDzCBeOfS2mhIwNxdx/etTFc+WujoEkO
         YYqEsU99z9Yjn2FZ3jiyIInEEpAmSDcsFh4jBAisS4Y69c4pJiVgWCQiwKH/R2zMeT8p
         BpcQ==
X-Forwarded-Encrypted: i=1; AKwUvByZFgYhOoy7VLjKt8ag0b5jo/RM5omX5DnxrhvfWXqeyfOhH1DSYAXPBjJRGyzzMcsIRPw2Ly52QYs8ZZK3NEgh@lists.infradead.org
X-Gm-Message-State: AFuF++nY3rJswvWK7D0x7NNU9n57Lnq4TwXCpCP11zP6+2MGplDzdfXD
	C5zsMkjxufPKerw26izToA4YRJGrvlDaXw8JFsx2x5PSVXymJLKk57gC+i3JRZD0yvF5P33iH4s
	YjQRufCcApXEhWf58FjPRQ7HhyxS1XC2NspoluP/8CXsvS3tJEijBq8NiRHxeXoOwYwbO28P0IK
	u1PQ==
X-Gm-Gg: AYBFou08cDvfTxAmECcOwvJL8mDsaAlL9VM719ne0S8Stokdik+BuRc+z2O1ZioQ4m7
	KEM3Xe9D3TkCNmE+uFFYUC5ATRKnanv6yn0uB/bneBXPYME5WtSkxHASHhc3NxxFiK1oaNFBztC
	Jbl31EzJEPw14yfEFsy14UHgtWTA9ZEIHjclt57cHWybN1IXL+7/j4KzRuf1RQ9zl6SrJrTZdx5
	HnuNzn1UtjGbS7qI7gAA9s64LhcEHdFEI8XNlQCPQWJk1Y+JWvAcPN8GuDg/quy/ef5md6jWTWA
	YA8nxEyj+M5QWV+CopmtwEuBhvaVoNLotCTgzkZoDw4MVrJc3jKQpOmsf9ybfn43lsGYmaWnEIE
	1u9zdPMNM0gHrLibXoOcZDg==
X-Received: by 2002:a05:6820:4d52:20b0:6bf:f0f9:a3b3 with SMTP id 006d021491bc7-6cb2ce213b2mr9754541eaf.2.1790082395649;
        Tue, 22 Sep 2026 06:06:35 -0700 (PDT)
X-Received: by 2002:a05:6820:4d52:20b0:6bf:f0f9:a3b3 with SMTP id 006d021491bc7-6cb2ce213b2mr9754497eaf.2.1790082395212;
        Tue, 22 Sep 2026 06:06:35 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa44d1aa9sm1034255a12.10.2026.09.22.06.06.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:06:34 -0700 (PDT)
Message-ID: <ae4581c0-1339-4398-8d35-1d7611a0f47e@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 15:06:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] soc: qcom: geni: Derive SE clock configuration
 from OPP table on SA8255P
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
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
 <177884a8-902f-49be-8fcb-b2bec3ec7d6c@oss.qualcomm.com>
 <CAPx+jO8bXn2F3cWz87Ozjrh00E+a_UWBrHeUViTEkTL87JHW9Q@mail.gmail.com>
 <0f5494c7-c3c1-4668-a09f-d8c43d1c58b9@oss.qualcomm.com>
 <6c28e672-349c-49cb-892d-ec521b3004bf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6c28e672-349c-49cb-892d-ec521b3004bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE5MCBTYWx0ZWRfX1WCudeojvmaj
 BLwQ27qMOdXuAmvbkiCh0OYlkaQ5fUzLgkJuoYxC/FrUKMOaq+mEFNpWNfdBYQFDiHdjGser/x4
 sgwvoJkZLRkFSm1kVi/G/qUGj1Xj/Nv1Un4aDc8sKjwTse21RKQE+rDsE9edcDZTy0dUraTNdpN
 Q2KuIrz1W1EohUSM+syXYVlVbIlNymSnCHJq7U+XHYQjSjvHttKgwefjpZyLq5dAhu4A3pyVP+D
 KbBWneO3dPPKtEv8o2hsfok8P/r42ID9LaMMzeoqK2QpyoVW/DsZlM1/crQCEVTuU20TTt9ySED
 SfZsIkBPOdMU7hOiKUYwncPFO3tz8pME3ZoA9YiN21sJlqDDDicYSDeCqzHsWTNuHtfM9ymchDo
 fvnAZ1x2/tpfcFutty3h1Kkdxdz9dEYCUnBij7jf+QNZDG1jkQWZG+TUzethQoRq0xm+ZuW0/vJ
 wqXqkVnMnbpsyIHQSPQ==
X-Authority-Analysis: v=2.4 cv=IYYSymqa c=1 sm=1 tr=0 ts=6ab27d5c cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=V-jRUn7sFLrw_WHHsgMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE5MCBTYWx0ZWRfXxuKYgCkhjbJo
 H/Womq5N70+sVdChc8Hjhm9LMuuG1Ycw6lfoWKv8v3X8sgbNeniu552hCx6VNHzbLJBkyQSyDan
 zvCSbnmYICbBhVZdKUQ6VqR96bPVG2A=
X-Proofpoint-ORIG-GUID: pmTJIfDY7S2l_KqRWI2qJPheRIz6X-Xa
X-Proofpoint-GUID: pmTJIfDY7S2l_KqRWI2qJPheRIz6X-Xa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_060637_508931_196B055C 
X-CRM114-Status: GOOD (  21.28  )
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

On 9/11/26 7:33 PM, Praveen Talari wrote:
> Hi Konrad,
> 
> On 04-09-2026 14:30, Konrad Dybcio wrote:
>> On 9/4/26 9:56 AM, Ulf Hansson wrote:
>>> On Tue, Sep 1, 2026 at 6:48 PM Praveen Talari
>>> <praveen.talari@oss.qualcomm.com> wrote:
>> [...]
>>
>>> So geni_se_clk_freq_match() is used by two consumer drivers today,
>>> drivers/spi/spi-geni-qcom.c and drivers/tty/serial/qcom_geni_serial.c.
>>>
>>> Beyond the $subject series, there will be even more consumer drivers
>>> that call these platform specific functions. As I said above, I don't
>>> think this is moving things in the right direction.
>>>
>>> If this can't be solved with generic frameworks (clocks and OPP),
>>> please clarify why so we can figure out a better way forward.
>> The way I read it, isn't geni_se_clk_freq_match() more or less
>> dev_pm_opp_find_freq_exact() called in a loop with an increasing
>> divider?
> Currently, geni_se_clk_freq_match() relies on clk_perf_tbl to
> determine the source clock index and divider corresponding to
> a requested frequency.

So I think the part that blocks going in the direction I
suggested is that the index and divider values you mentioned
are then required to be fed into some GENI-internal registers:

-- drivers/spi/spi-geni-qcom.c
clk_sel = idx & CLK_SEL_MSK;
m_clk_cfg = (div << CLK_DIV_SHFT) | SER_CLK_EN;
writel(clk_sel, se->base + SE_GENI_CLK_SEL);
writel(m_clk_cfg, se->base + GENI_SER_M_CLK_CFG);

and it seems like every protocol driver does some NIH things
to take care of that.. perhaps this bit could be moved up to
the common geni-se layer (Mukesh, are there some historical
reasons for this being handled in proto drivers?)

I think this may just be an effect of how the hardware is wired
up - the ""DFS"" clocks that feed into the serial engines are
partly set up in the clock controller driver, but then there's
this bit:

-- drivers/clk/qcom/clk-rcg2.c
clk_rcg2_enable_dfs()
	/*
         * Rate changes with consumer writing a register in
         * their own I/O region
         */
        init->flags |= CLK_GET_RATE_NOCACHE;
        init->ops = &clk_rcg2_dfs_ops;

which is the writes i mentioned above.

At a glance, plumbing this into OPP would require making GENI
SEs self-consumed clock providers, which sounds no less messy

Konrad

