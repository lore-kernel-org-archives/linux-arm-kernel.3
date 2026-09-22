Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4659C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 15:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RnmPg50OEmv8rP96wxGaZ+xgbjo5u5huRl5f5KiIQ8I=; b=w7Af5nGg+N4F3BWWtCAuop6ujK
	EXmh+hzXk2wO0SCkn178X5lbz1Qxuj2JfExu0gkojGL28Rc/KMCKvi/6mTkb7g+dQH3P4EPzV528b
	DVqTexUF9XoWAhxDdJIzqQBCsIHgBvmWmaGmax0PpCoYWOzsZVA3NjAoMW7hZbJf+IUKaTutaD4g1
	klVoDeZAY+jdgVFSySMyVpXyJTVm5pXZIAF/05DKfizL9lEMZZ6dc8NSZFdEo7O4Caui+xYtP+WQ3
	XP/D9c985qrLNppRuom/SYHXc6YQ4HLHpZEQUjCbb8Bg26cf98SQ8+aQAFuNO4yVcTG5PZO28pJg5
	YQSoVRng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92mL-00000005wTd-3fNv;
	Tue, 22 Sep 2026 15:51:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92mI-00000005wSf-3N0R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 15:51:32 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjm8o3952767
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 15:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RnmPg50OEmv8rP96wxGaZ+xgbjo5u5huRl5f5KiIQ8I=; b=VSgbiMZDKXRJDmXc
	D4ULXJkDgfpS3i3YddwY4p1jbbc6884X4j2GHj7YPBxODjIiBJrn0cu+L4EiyN/f
	GIlqcZ1IOHG3KehVShBsBcnpTdfpvutqtWmajzgDYxMn/OwH97ROdZOaK1h2ZaFd
	UiX0PAPLu+ukh0Z8hwWvBZ0D/ms1BZkqXkxWmZiwMCso0HPEeumig+E/u+WHAIXb
	le0dz3LH44A65XNnt1HTosj/HvyG5JuHZ32SYtCem5V8H5RD43FX4ivkDFL3mG4z
	XnjvJ4GxGPoYjj9R7mhctNT54NsTfJ7+QAiO5jDyqAxiTrDJPIhZ57CdWQbn0tkA
	wSWeFQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufsqbd1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 15:51:29 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-77969cb40dcso106595137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 08:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790092289; x=1790697089; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RnmPg50OEmv8rP96wxGaZ+xgbjo5u5huRl5f5KiIQ8I=;
        b=Es5KDgmJ2rmJ63Cp39XZJrACfsAOr0ZHsL8cNFVbMQloyLjMD7VSAhJEJyWrYeJau6
         m5ayUDvTfJ5VdQ4DVBbnT8ixDUkDXBpu7pWZrE1Hw3sKx9KdGiA162WBWAUtTX7YTNsM
         uzPI8NjzvUcJo3F1W3YYtN7W1MJeTFYLYGf94I0DLyiP57njtqVgLd+ohBh7kaT74iz2
         p0gapyudNWEaafMzuQJC+NFO58z66861iJjiv7VjjASMo3lGJYm/A2G0OE4Zf8DPpVPA
         BfRsaaI+GwP/H+P3Xy709MHYiqwnzjiA603txXyRIs/WU6fCPegMeW8hba71qgRyFxRU
         5mMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092289; x=1790697089;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RnmPg50OEmv8rP96wxGaZ+xgbjo5u5huRl5f5KiIQ8I=;
        b=bK3WI1dRIEMGJzmuzBQwxYqrlmOKHYNh1/r6+Jx8qRsJ87Fav9t2pularJ60haIEJa
         +LHgIp7RG4cNaLdl1aV4eW96Lm/IGZvQU2WOmy9mQPFPl9sx0+uPcGBf9A38UpByxL4P
         Ui60y9XTMXVVt2pwNlwvUou2IGQAeJ2ypHQp2xcm1yC9jtLYCEzYH3tU+h3+YU2dO7el
         pOdBjbldNCNM1d7wXIB+TAmmLXygoJwMmbM2PIT3dU6+M8jhcTL59dLQxfXYSXOBRk/1
         S2OYHdrRzUYpeYFUQxN3ds9q8MsiUiVFQz74vfaEnjh9tW15J61zlCnQrflMYORKReSi
         FaSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGY9rsp5yJKFfDfA7u9Wvzf5tF4drF5BkyF92dTdYNNmLYbfT0/mAmPE4VECdDw/bpIjW+75XfqiKe68kLFKCV@lists.infradead.org
X-Gm-Message-State: AFuF++nEkRyLsVtA6GzdNWZoia9AYPO/evUpnWsd68q0YTNUsI6JYuNR
	qOTAC0/Q+HpyR3QgXYqPNee1HgEhywLOCu8vyOV8aYhZkTFkkRGKlxsc3AZ5UyZ3l4h+RjoJj/A
	LC1a+EQEDHw3XF+k0ZgyD0EJ1AOjAmBBt/vxauv+oKg6X8unX78FpbWSQ4aI4F0GlGalGDIJbw8
	VGcA==
X-Gm-Gg: AYBFou0V811PhtkjWMpeYYrmBVz/GmG/gS3Y/cjV+TCiRMuVakgWIjYO+2WBFX/0hh1
	rasd9vf8m0AhK2N1BZ4pRXPB+Alzj05mo9m4P+ntmR/XNeXsAYq6IkZxQPS/suSA6PsSaHK20wK
	7jwcJ4zJwYX1vDDpoEYk4uxDgmtr/gOhCnQj17hrEHkMJJrVlWX6ymn+mWVxW8SUkN1KAzenP9p
	BS8sX/QUICiaKKl9Ac89DDmP40yFt8AWUogydIwFofC5nXlnohCb0V39FOxcuNnp7bdW99SafOO
	0qOHxMDtU1AQ2ptBv9ix0P1SR6Sb7EvMn50hGAPbfZLl7RUY5kdfovrw92Hopdp5lEGNP4bSgSK
	UzA8ycCGnt8no+PINbbfq2Q==
X-Received: by 2002:a05:6102:b0f:b0:791:33c:9d1 with SMTP id ada2fe7eead31-7a59d45b711mr8581232137.1.1790092289153;
        Tue, 22 Sep 2026 08:51:29 -0700 (PDT)
X-Received: by 2002:a05:6102:b0f:b0:791:33c:9d1 with SMTP id ada2fe7eead31-7a59d45b711mr8581185137.1.1790092288703;
        Tue, 22 Sep 2026 08:51:28 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c2a6336sm113065666b.0.2026.09.22.08.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:51:27 -0700 (PDT)
Message-ID: <27810459-c127-4b85-abcd-43d8f1e25c15@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:51:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/5] arm64: dts: qcom: shikra: Add CAMSS node for
 Shikra
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-1-9b9596221cfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-shikra-camss-review-v8-1-9b9596221cfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cpCSoowba1Qh3WoPc8bHPM_GkhR8438A
X-Proofpoint-GUID: cpCSoowba1Qh3WoPc8bHPM_GkhR8438A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX+dhN+NFXH/AJ
 iLXVsU8f9saDBgZVcT7a2+pBmeuOgduv/JnNA55mEpEMe3PtYc1PD+RCCeDZckEX7GqBcjUC2ff
 InwHpK6glo6ILykdO593tPoayUPigaI=
X-Authority-Analysis: v=2.4 cv=NKBAaE6g c=1 sm=1 tr=0 ts=6ab2a401 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=XE-wypd_VeY0GsksmEIA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX6CdfnYV/VPTM
 a33BHIrRI1mvCDt73Cuyx4zCgB3AsBoysfy1mLGKKzIUY20/yymO9QT1feV8LyxaoZswJUlpofO
 6Thcfn4wy84mVruMtIlHZeTS2U91H2szAd+0U87WsKKs/X9XB/zzUCfyTxBja0gvhCNR9A/RTRI
 w+CKo5sEzqOvYgmWtY3Q596jjZHe68xaCLTanxzpfPYz85RCxuvKs5YVmjY4TcQ9Vq3BZx6CaJg
 atzKWCwFU7CFF5MAqCjtyMAoky0EiT6kdeTHxb8nSyKfNrl6QExpamqe7qRkBdodUWWGlsPam/4
 jQEgSNAbuvJQ7l7moPzFPXBZxCYIcOrf3Ky+l9Kd0kY+Umb5D/Rs8sFRCU7FD0aLQHopWR0IFSW
 yHfwl/9LKxyuyT52imWO92ax2o5v53BOe+K/wuy6DIrpOVAXngU1F3ZnJYP7Opj2BAVFqrnBXpG
 l616Nt0jzM64/Eo2rMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220231
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_085130_965631_5D2F42AD 
X-CRM114-Status: GOOD (  11.40  )
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

On 9/17/26 1:41 PM, Nihal Kumar Gupta wrote:
> Add the Camera Subsystem node. Shikra shares the same IP as QCM2290
> with two CSIPHYs, two CSIDs and two VFEs, but does not include CDM
> and OPE blocks, so only a single IOMMU context bank is needed.
> 
> Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

