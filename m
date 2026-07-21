Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17636C44532
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 14:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+SBCyGgJbN6sunp0BYwaF3O9zR1Mj7Y23sL1OJAiSLM=; b=YrzK65Eps4eitlnmfHVgV01DEg
	s0zTC8QzRk2YL3p+g1JNRWAbQnS26En3VwhRLk41RBmeNwNQRnLO8uDaWqF2tAdQjQ6w4ZxwXcNXo
	32J5QlV8rM0bcVbXXhGCaUA0bV198Zj813sI+xOsEy6F3FB0DWEYnxnkkRn5PKKyi6BTgw36/wU+C
	HkUYXDbXRVNye1RVbo/YGr2aVSZX0Ia75RbKK1qBSTlAU7F/ntVQtT31gtj89Zb570aGBw4hdv/X1
	f1B/HJdR/SWXnWpihpOVjff8wp4699ZS0oZjFR5ue+3in7FpV95fqgFaGpzC1nKI6Zbr0iVBBXZM/
	le69skuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBix-00000009gsI-2Oys;
	Tue, 21 Jul 2026 14:45:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBii-00000009glj-431j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 14:45:22 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg6Ld1912736
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 14:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+SBCyGgJbN6sunp0BYwaF3O9zR1Mj7Y23sL1OJAiSLM=; b=fUcN344+RQW5y33K
	LIoxDMbgnxXqORPDQ4aSsSLu4S7rnHyurEQnSwr7HcaFEu7YD6u1IBM7Du1Gc9b+
	1tPcJzigyuZDUjbnITzTkaljq/AOYQtuhn5lJe6R611VJmQKgR/KmEj5uILWifWr
	FWddZeevM0srWED0IBVJ+LO116+ld2Enh7oPpglHWbeQICxhuGq1dwo0LOuAiIMl
	uaYHHljB4FBNJKP6bjPOnN0AYyJagej5euqRSUVuiMGz+rD4lmDTtHSP2s3t8mjt
	ggf/8irY6g9wnBFspeFmDhaekkWZ1SaMlys9xDd0DtMIFF7zwIfz8FaINOpjVqQw
	PZ8Jlw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1dujxds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 14:45:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1a9764f0so231745251cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 07:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784645119; x=1785249919; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+SBCyGgJbN6sunp0BYwaF3O9zR1Mj7Y23sL1OJAiSLM=;
        b=RJHDazZKXkvOIVno5OW5YOLuY2OsTTFZ7q6NnqZqzrApHGY0imKKilmhb+2hGXl9XY
         fjf3/vDIt9Fd3tb4ednU1yuNlpJBumYAcRFs5dzduUusq2h5m0OTgoo62TuTbBROrSk3
         PKayeNTf79+j3DlU0qyS1CrFXBkFWAyLF35ETaq4OVjeAhOKZwOTgCVqZHNfQocw/fka
         /5qmn+poo1krr+MRE/93Bh0lqagCMsjK407aLmfa6Fq9KspHaOLhVq83RYSunJI2Movs
         mUunmlCWOJAX7jstUihBZeFNn1bcpJwbYxCJ/trYI2hLz46xe4/Hw2vTaLGXs7RsBF5G
         eW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784645119; x=1785249919;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+SBCyGgJbN6sunp0BYwaF3O9zR1Mj7Y23sL1OJAiSLM=;
        b=P/J5LpyvRkyC1OB84yV5KhwhgVhIUzTAdm/i/fdhA6qIVyujjig/h+KCZrTfG0d7st
         vq5f+D/M+8O/KrRgWX519NeNO5DvkAEhXK1EL20UgobqUTJvJtTKumOe6zcPKzvKxvA/
         AAQzTB48dknUL8v9OQKhZd5x1fqTRV8f5uMFEVfP8r0hSjdMkSOKLk2ur1Io4PVcx7y+
         nX6/HWda56vz+azcetL8BE0Y/S5or2LTVI1oa+O/ZgKSLkJIHCn4ybJ5NKEu6UoWPE5E
         5z2HRMUX1SV/S28CrDii9mTErjG6h/oNV9LJd5/kWGaU8WW6DcnSYS490slwACO9DKpU
         G/Xw==
X-Forwarded-Encrypted: i=1; AHgh+RpP3PBVRQP7a9/54nZv+mOnxbpSbbRAny6y8QN8BNOxiUbu7Pc0uXKD6BZ8NqPaj4iH4gbE8l+NYSvmXXGuqbWE@lists.infradead.org
X-Gm-Message-State: AOJu0YwO925fBaH7QUWf5Ao347o2U6h6S0e3aiVi88vEUz+P4Qd9Xndl
	LfFuKmhzQRPbuLpHId9Swxjmtbnk/YuxFJkKE6SgVfVRlA1Nt9f2CJGT8AyzPE6FB+LHPzXMA+F
	/1vHeHbnoNlaQNrvsF3Pn2NnKMMCj1AsurkaXMOAvX4ZEQpAsVh0OQ+TSzINjpt6YD7e8g/J1Uy
	VI7g==
X-Gm-Gg: AfdE7cmGGFqg46HwByYvV8/SxKcPFHsSgl7edBzDdPrGn7iHZhlz2Gp0BTxhVbQg0Go
	3HP6nr9j1sJR9Ey4UmxCAlBujlIE2RLp4XnH7yR7w8eLnENmEg5HJm6wMC1ZizgE9/170Wtrrcv
	qM5+fOJK1LXHkx0oQO0g6a89y63gXrOpVuqR7PeonmN2SPJne6vhwzg/18bMikZ/Yw7+dwgnx8S
	zCLCwcDlLp6rcE8PZq27hW0gWYkNFFzjawRwcA9moDyeqaTOKLLX+osEInW3jAr8eCzxBGNTqJk
	KZaq2gdeEcNQfSm+CaInxpXRWXRgI/u51BK1Tn3DyFDixBAEFFs1obu1mHqEnnBBuZ8rzm0ZJMx
	8Tmk05pKQO8r3TnGdgdHRIWsJi2XzIRkvvo9K0pHEvhlNms1yS1w=
X-Received: by 2002:ac8:5f4f:0:b0:517:c65c:488b with SMTP id d75a77b69052e-52137df1584mr169984511cf.0.1784645118827;
        Tue, 21 Jul 2026 07:45:18 -0700 (PDT)
X-Received: by 2002:ac8:5f4f:0:b0:517:c65c:488b with SMTP id d75a77b69052e-52137df1584mr169983961cf.0.1784645118298;
        Tue, 21 Jul 2026 07:45:18 -0700 (PDT)
Received: from [10.131.142.220] (220.171.88.92.rev.sfr.net. [92.88.171.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653698bcsm67022225e9.2.2026.07.21.07.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 07:45:17 -0700 (PDT)
Message-ID: <d5cab365-b781-46d2-ae36-815b228c0465@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 16:45:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: Remove redundant dev_err()/dev_err_probe()
Content-Language: en-US
To: Pan Chuang <panchuang@vivo.com>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
        open list
 <linux-kernel@vger.kernel.org>,
        "open list:INGENIC JZ47xx SoCs" <linux-mips@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>
References: <20260717065224.600593-1-panchuang@vivo.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260717065224.600593-1-panchuang@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ViqZnKzoh4eKAdAgcUxzuW-gZrgkw0hs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1NSBTYWx0ZWRfX278SPJ/xz/WD
 ktvAw58YJBF9dpF6QvUr7wziaq48nqS/+lATI7flwwSgFLbp0zh9kFu28/Z/g33+iq2RUu5II4O
 31BU16lgJuUmbAyuK2tD+nk1bfB4w7aAnLsmJClBwRwExjiQ0elIkwNj8xqAef5ZcI+OHCJK0Yt
 ZkF1Dr1dKtcUdC1QhjaCCljxfxQbc7REBVrbl+l/3gZVIgRu3F4Yumrgsm066hCNGtiAOl/A9NN
 j3Tv9J4fSvNN4ZwgVlpaxzTSPltmgC9SvfeAx1HCZZRZrCNVfBR5fSobUrZjJs5Ca3W/yZIlfU/
 ftMpzxLJlozEdLnwdOnkgkWQfmdwioSOzSuj6w2KaMxHDs2odIhq6llNutWgNxh/1DFIecGICfF
 plqAvnjlQWbfAol0U6qfAceTUEPkxtRjnCMPzGly27p9ISnGph6fXt/cJH/90OCFbW8x1UMYTaJ
 k6JvuQamxC7k46nmWew==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5f85ff cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=HvFMDRKYglX6yPpWI6gtsw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=1WtWmnkvAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: ViqZnKzoh4eKAdAgcUxzuW-gZrgkw0hs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1NSBTYWx0ZWRfX8GdYuu4o8yHe
 JFwSrzJBzLhhiuMPZY9625bf0i5GDkm9f55X9FzfzfXDbWP7T0g0uvKg0BNyny/QvY0QkSOe+yh
 tIJP8SbQlxOfd/SZrrTQDMCCNdrowHI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_074521_147259_805A3CCA 
X-CRM114-Status: GOOD (  12.06  )
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

On 17/7/26 08:52, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() and devm_request_threaded_irq()
> automatically log detailed error messages on failure. Remove the
> now-redundant driver-specific dev_err() and dev_err_probe() calls.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---
>   drivers/remoteproc/da8xx_remoteproc.c    |  2 +-
>   drivers/remoteproc/ingenic_rproc.c       |  4 +---
>   drivers/remoteproc/keystone_remoteproc.c |  4 ++--
>   drivers/remoteproc/mtk_scp.c             |  4 +---
>   drivers/remoteproc/qcom_q6v5.c           | 20 +++++---------------
>   drivers/remoteproc/qcom_sysmon.c         |  2 --
>   drivers/remoteproc/qcom_wcnss.c          |  4 +---
>   drivers/remoteproc/stm32_rproc.c         |  3 +--
>   8 files changed, 12 insertions(+), 31 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

