Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F23CD583B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 11:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cTH/4ZeodwA/Q+RzWHaBeEgtNJJIoFwg96ta/DUybCQ=; b=3ziFxix87k36N+Uh7VTSTZzKfx
	qtLPhellt5zUbLHgJNgtm9RFRLWlzZe2z8wIb/2BpVuE5mehCQMEXBO0wEZfKOwsLKzwSO/nCSUwH
	KzMKv9gFHPSoX98GZ9v8cAZiJkHYyHylmtZwpkR+dUWOTokUX7Md1+R4NB7PX1Fp6MFDcdID8Q9lO
	W71UZtCF4UCt1svs//YTGMEMqlaZG8tK+BwPNK5acker9dbJLMOuf0h4xhY72Wkxz1WeT+LwYlaUq
	JtZbDytmBfjkTAUI/zQDqn4Q2UwYCpeRP1xfKcGPpLvzra1e9laczA5bQhtUC2e/E3NWg+hAhc8ft
	4YvjW97Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRs2-0000000Eq9B-2vpD;
	Wed, 07 Jan 2026 11:38:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRs0-0000000Eq8d-0Q7S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 11:38:33 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6078ZNIb1979616
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Jan 2026 11:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cTH/4ZeodwA/Q+RzWHaBeEgt
	NJJIoFwg96ta/DUybCQ=; b=OZOLRGdbF+iM/6nGiViEWp6GUVmJ1jbNqw8BDRKy
	GVRMBFHZbDKcdByXYp9f1Y2L25UOk6U1YXqXadHLdz/z6ORpu9vLR8zZhBkwKGv0
	4mf88z583y1k7VTLxclG4zVIwN5BUB7tSbEziwxi5nFlnVmX310ppbpU9wK2POSi
	FtahubmmKFvcRx9S1MBjShx+9W2JSed33cU1hsKMs47z3+lNhBE7GGcWrqGheKN4
	PKKtVkDbi3ovCo9yDiUukmkP1wbwDW4HA2wnDkfd5sm4jZXr7o+jUqbWSRs3zC07
	7cesJYcAew9cWh60c+O4JnZEsS7p/3MqLFuEyNNFXy3rDA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhdavhw72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 11:38:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed69f9ce96so66336951cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 03:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767785910; x=1768390710; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cTH/4ZeodwA/Q+RzWHaBeEgtNJJIoFwg96ta/DUybCQ=;
        b=d7UN2Zz1iJp9sUA7m3erUzAk5ry+i7X12mOi+58c/ZFZOi1aTHBLAvHF93aHsMFTz8
         khR1kyRTiYa7I/y7QR1xt9SJlrCchGQdP27Gh+pUJAj8DcnW5GJ39tAVJEK0ii3h4BfL
         yMEAUlZUJNXfTuCTWUtX2OMXh0ur+cUXpYRjN8wTMEn3DktP5lMWupLj1h2DX3qzVoXr
         VhjOSmzZtUiiFgnTfKXTghYDvDwFpedbJI3cXxTaooAldUfJpBJ/WAUoGKETJCCjyH7x
         gvXaky+Q0jUxfPoqdzL0JApDeF95zReVdwFoXgHL72iZtFbYzjlBGVDuyHkLZuITn4Hp
         nRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767785910; x=1768390710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTH/4ZeodwA/Q+RzWHaBeEgtNJJIoFwg96ta/DUybCQ=;
        b=AN3Q6ZRwWneET/PkrA9yKAXugMgSo1vH0AM3nvoMZyAgJqwJ9utIKtHTngpj9Lu7H8
         +RL+IigI1DA55s5nn9hxYxokm4PLpCxcRVOKP8rf5Z69T8cy2lFuzimJLa1fWIMQ+yk/
         HV5iMFTqIXCFvqdl8EXptmoM3duiyyhhaijMjMyut4X6aaIZ3TIYQBjWyJCtO/dcxVXK
         xs4xofV8X+4+5NGCw+JCYPX8QYU5BTSDh+JL/Op0DTe02MVOFoQfeyzMNZkeUqOP4tSQ
         C06rsPmO1acsJ7nfGpmS+Ols2ICWMf7FPWzseggE/SLV7T2L65IcKAjd0NL3JMLlC6j6
         GU4A==
X-Forwarded-Encrypted: i=1; AJvYcCXIaN/uAyYbPPeX/SNlu++bRKhq/kymtEoWs52jMHiG6pp+h7nUxyYx5CYWjZZJwX4Rb8IS6gIMLK4TsKb022GH@lists.infradead.org
X-Gm-Message-State: AOJu0YwmFAjED4MDcZOT8aA6hRozU0osVY7uQb1p2o9bTJG5vJ2UEael
	PXoWlew5zTCEx3KoYJxWPULMASaUDCr7xrKFefUaaQfcWxq+FImfmFyf53kCHFHWr+Gb0KCyK4k
	tPmWJmwRf8T3O+VQoHuZm3D9pgmXJUZ+LzeHDjznmxHhSBYi+fiyuITPe/7Bd9XftZo0ckpXxgx
	/WAA==
X-Gm-Gg: AY/fxX4y6qjMwQI0KKRMbSAjzxM+Dx+2NYtDJg6xfG/MGwLBpOy6nLR3e9gKM6C3l5K
	Fg4eGNDY2rJQTTywluYN6ubsuRmSBP6cjAFu6CkpNmrsT4lweUKPSdtNEHcSFP5OB8DyAk6h9ym
	m0CHwbUIEV5EwZ3Jk5QbM0T17aZYB9NwmOkG+uwbdNHqOqx9Moro2byUNCOq5nz1GIsPmoLjXhU
	1+RpCrhAGHiDvq8Iw8yP/N9tvHP1sEn1DOxmwDeMO+YDFmYV5Z/b9AgsewVpolYwKyDUI7i3c/H
	uf6TlK8jMkUST+bprT+R65fxAP3oOdeU7GKA/t3uf/NBE8WlPmXGKVsV3SpL5ws4KoYWb/UxCAS
	5JV8XPNjunn9d1NaB7okij6/vYF/YROpEC3Fj4fqJut1C9E4d3XLq/NQJvwyRqEZLK7mvJ4M7LM
	7eVXfZTkUsIuE26oeobPAUnSI=
X-Received: by 2002:a05:622a:20e:b0:4f4:e15e:528f with SMTP id d75a77b69052e-4ffb49c7d3emr28885741cf.62.1767785910420;
        Wed, 07 Jan 2026 03:38:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfaBxfXO0EARRWs+zjZ9c7H9zOXqTKVd04HB62R5Cos9qRCEQe2HmgxwEezgO5LrfADT4Gyg==
X-Received: by 2002:a05:622a:20e:b0:4f4:e15e:528f with SMTP id d75a77b69052e-4ffb49c7d3emr28885451cf.62.1767785910039;
        Wed, 07 Jan 2026 03:38:30 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65b89842sm1242653e87.0.2026.01.07.03.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 03:38:29 -0800 (PST)
Date: Wed, 7 Jan 2026 13:38:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 02/11] clk: qcom: clk-alpha-pll: Add support for
 controlling Pongo EKO_T PLL
Message-ID: <7lbw6rrrsxitcldgahf2wwqklzy3nvcmem7aylsw5yvbsbom2b@lgel7iicehrf>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
 <20260107-kaanapali-mmcc-v3-v3-2-8e10adc236a8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-2-8e10adc236a8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5MiBTYWx0ZWRfX6xSWmq779vNN
 zx/fd5+HdTxMMwmRQYaz01W/Wh68Iz9FvI87NF2OGHSqxFtxySq+16ZYpNLj60dcpHF/2sefO+r
 /y0n0pxdEokPjEsbOXApHOUEWRmYWSJk6LEKb+jw1ydr+v8XFVWh783G1bqcjz0HXkOXAymwPHO
 0R2C8czSjRS/pBKiuaqk44fQnk36FCnGOmn2yKN60zWEYxUStp9uZ/EsqkuQJ+YpGnTxPjhcTZX
 RdI3KxyUJO2KrL1/BgETbP5Nq8R8+prCzBT6zSVPdIw6VykrID0VlY629JvTgYFtFL+XlE3He42
 PY6bSuIJFmf4Er1Z6bHcsgoAzq+CEmPNsVTqTGMgfU4hgGJmRZvBRHWwLCHRo4OykJLKIP/CWN1
 RQMT0iThMwVk18MSIfxXcSudHZgGoER10X4PQxOsAgvKZWAdtzR86p8kgHSNbjiUIq2aG6ApWWS
 usFP4uFdxKeDK48cHYQ==
X-Proofpoint-ORIG-GUID: 94ofzYzuImj3IJzrepUs_Wrz-Aq6U4QC
X-Authority-Analysis: v=2.4 cv=comWUl4i c=1 sm=1 tr=0 ts=695e45b7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Rar_LHnIVK7gKg-YXgkA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 94ofzYzuImj3IJzrepUs_Wrz-Aq6U4QC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_033832_260240_8599C49A 
X-CRM114-Status: GOOD (  14.83  )
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

On Wed, Jan 07, 2026 at 03:13:05PM +0530, Taniya Das wrote:
> Add clock ops for Pongo EKO_T PLL, add the pll ops for supporting

Nit: PLL

> the PLL.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.h | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

