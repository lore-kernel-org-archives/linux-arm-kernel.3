Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62850C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 15:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8G2ECsoTYtsyvfoNVIawmowBPsx5W3LlCQSF/qBNKBE=; b=3A+baJkfk2VwGKPN/dmM7qQCzV
	OE6U8R4mIhX0iXTRPc5oXjIgUZ1Ey6YC6Tr+5DbHCmMj1ydQwXYvBlaRpvsyNlz1QIsMpfZpaCw/Q
	Yd4MdzZx/vBrRjjLFGU/0kETyGf+pUuxSk7O486aeAk6Kb64ClfqZ1DoSK7/k5e816tVWDd4QJTNI
	fDFaiPFb+FpNeANDfq5+VhRNLgMe9XLkf9g3VYlJugBDUpl1UfuP2jU78H5kNwQztLEbqOjPhxvG3
	RqS7MHbiAO8jK86SNwx4LbfegduKWKPCmuHstH01XAHnbVO9oKNAdYT0ossw1ZxYLtOpBmf+mJ1rY
	xKXQMpow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWGN-0000000Grhd-2XXT;
	Mon, 24 Aug 2026 15:07:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWGJ-0000000Grh4-38Dk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 15:07:02 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCuq6L2479685
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 15:06:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8G2ECsoTYtsyvfoNVIawmowBPsx5W3LlCQSF/qBNKBE=; b=ateVbhtm+14kvfjM
	DGoIJjbkOeNppgOxnkxhmXJ0kbvA+4O9h0ks0U2b0R3CsgH1wLql/YWPjzR4tWSA
	7TjtpvVg0AG4rj9E3PrwO/kqu6nsrBY98YB8aV0l3dHa5X8ylVaWqHvCPQksfTt+
	9lWerPMdhULTye/QlBOC9fGCDkNZlFlBZSYEWFE1EDVVhLm9NyjEeoeVKWJGQ6LJ
	wcgpbcIryQXmQ8iX8yQAmD+qPL2reEpsIzj3XOk83mZHUMlR0JscrwzHMXKzKTzs
	xsCp0SxIz1jyAPd9XQy+LGaae5TmSz8mgT78yrcbPagsJ57560vifAqFVrSVNGbN
	kWzALQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kdshdcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 15:06:59 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97752c2acb7so52098241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 08:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787584018; x=1788188818; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8G2ECsoTYtsyvfoNVIawmowBPsx5W3LlCQSF/qBNKBE=;
        b=FyCnvb3dLAsJAxB+Nn4iVKQ7x6I6Qu9fessnNLD8mPtzW/yaJObNNX8ZtTLmQzYBf1
         YWOju4sgnDxgMO9KpYPGK4YrcaOJ0z7bgZ4X99ajGIeFzgx+p/eXLAUqeSA/ZAcwygoB
         +xTsyuh5CdiiaZt2bFs7EK8N8vUS+++xWySnjCaCbHp2XIJdT+nveq4qiSQNmuMWZmz5
         mOY5prlojfI1htd0tmu4FnNNCMO4I/MkWJLLs6fvBmEXwKsctY+Je9iHB4X2V2zy0nqy
         CcJCkTGmTobjEPukZCcHBsgvrQZwO8Fyx/g7B5DCYlEow73fwveHPi/uY9EgFUYfHVE7
         vIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584018; x=1788188818;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8G2ECsoTYtsyvfoNVIawmowBPsx5W3LlCQSF/qBNKBE=;
        b=isBUWTBTewkDobCpe5OiY4e0hFUAuxgQ2jtGUUDmOaGia5HSp6TadY7m942oPi5y92
         D5H0pTokeSKL5u6IB+ed3ad6FMXiDKPuEJBxFqoCqksHu8GrJOxIL1YcWoVplAfzMuCZ
         WcLsTia9Fa59GarWHiddS5Si6IdvCzozqexpDVIZVpd2wJwdcusV/oxIms/DHGZN8NbG
         hB+Pptk0BfIxiUxGcwilxISmI0v//7uu4O9wjJQgUg+r9tgOGLhUvJPllvPRVAteT8hQ
         b6Ah7XTKr4B95EOfaFwdYa/aPfr0reWMCsL6oRUR5DNLDEBeS+SwbWpJDQGhLq4MSK2L
         Em1A==
X-Forwarded-Encrypted: i=1; AHgh+Rp4wxA92emnVbFquLPJLdJTI8kwqhJn7opxyvUaT2kjIqH4Ja1QvSsmuacd/bTJtsBVA2JSwRbywpq6TzUkWWvK@lists.infradead.org
X-Gm-Message-State: AFuF++kf43GIS9sfOn6lL2A0entPoh+GLagXXHBfyzUaMPkCb37oEpgY
	qMP6TYxvAFqdqyAe3DWjwW+/1liS0NBOAcj5JwxCOXPz3XC2pYoQet1d38BfcUeR2CUxG/LZaoP
	EY96SbHhjt7damqAdGGGRE9xnBNFlxsLsezhIJIGkv0TbQCHdvOPNWKkvOjfEKPl0rZWVDaLpdU
	Zrmg==
X-Gm-Gg: AR+sD13fqcABB4CP750baxIh+vOTjkAB1YYqdquD/fE/SWgjG6Xfo9p9C1eLH9EEh8B
	iLN2rDL1KusL7sf56V/OQWwj7mxi3AeX3PrzsDFA5hWKUXo6RtfToxyHR95l/xnD/zr8jdj65Np
	LvQgfgCgT3wrCEF0cqs/sWkC0GlDY11gbmiCNdFYhcWVEXRZ+IfkuNajruiYaqjZHMQCSOHBV4c
	lplevmJS2H5aFDUepw0MmbCoKnMo3OxQh821eFTye8D4ARGCwka+iqGZ7mKDX6Hdf8iZ7G4lzef
	djq3rc2KsafVxwPRjIPzev5Q0a5voKX0SBcxsxTp0F4h9wFbml5LC5wh8R+jfkNgfC9O7BvqJDd
	QGZh78unQ4zQKyz5iDYzX/RUn
X-Received: by 2002:a05:6102:6893:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-77a6433632emr3704095137.1.1787584018217;
        Mon, 24 Aug 2026 08:06:58 -0700 (PDT)
X-Received: by 2002:a05:6102:6893:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-77a6433632emr3704068137.1.1787584017657;
        Mon, 24 Aug 2026 08:06:57 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e199ad5sm9278440a12.18.2026.08.24.08.06.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 08:06:56 -0700 (PDT)
Message-ID: <aca6afe7-4659-4359-b5c8-e19390a07f8a@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 17:06:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] i2c: qcom-geni: Use geni_se_set_rate() for setting
 source clock frequency
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-7-61171ab1cdce@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-7-61171ab1cdce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEyNyBTYWx0ZWRfX995nOXY7n2dL
 PtYPv0uQCFMCJYdfY6mDAjyB5mFUjnYUVZ+ZscTj/t+aLKitxRg5t/BAc/mlibHWQRj3uDCdRzo
 P0ANs9XhroPhafoyZoL9RuaoAe8cRKg=
X-Proofpoint-ORIG-GUID: L6ugusWoTjSMLwULem2suiURlwA1bYS2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEyNyBTYWx0ZWRfX00rNhRIjbIPr
 Q4twlHP6sWRiKwKQE+2ZaexntIIPGi7NGaxmbFQGJXzS3cdjDLrqXv/bUCAikePObEqLk7Oc90A
 yTYKBqa9Fi5M5jgt4ooPgGhpBgATGQFSvXWW3cmIpEdrMord4YH1vFove+FUCpj8tJyRP/08NOk
 xVM8M8WPCg1sx0uxyvnMmAm9H+lP0oq/3bEIDFjtyZtzaZaZoi8kqnAe5unoQ7Uc0qr19GDHf55
 uShQRdPSVwnCLdXMnIFTM5z9Z2x/WxQTmFRk01GtHrxAohxfiJhQj8xJ3+LdkxJvl4dS+wUDCuA
 b+F3FLuDbXiHl3tyuhIexW/zcHJTqAt6od06pJB04uaR9U+h8tfKGd9AkyCSsFuNWaxJSRf0DoR
 M2Wck9pEWKVChj3p2qesDUEgiMx3JwYS7nTIpgSan7tLJuDqsANq1+Lwh7bLwnZ1Czeillopmwq
 3BykWVgz7kOZdeRHG4A==
X-Proofpoint-GUID: L6ugusWoTjSMLwULem2suiURlwA1bYS2
X-Authority-Analysis: v=2.4 cv=d8DFDxjE c=1 sm=1 tr=0 ts=6a8c5e13 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7mB3cpwZ_riAn9QYn-4A:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_080659_794800_F7FECF23 
X-CRM114-Status: GOOD (  13.21  )
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

On 8/4/26 9:57 PM, Praveen Talari wrote:
> On the SA8255P platform there is no Linux clock handler for the SE source
> clock; resources are instead managed by firmware via a genpd performance
> domain. The I2C driver therefore relies on geni_se_set_rate() to apply the
> fixed 19.2 MHz source clock frequency expected by the SCL divider and
> counter values programmed by qcom_geni_i2c_conf().

[...]

> @@ -233,6 +233,10 @@ static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
>  				 itr->clk_div, itr->t_high_cnt,
>  				 itr->t_low_cnt, itr->t_cycle_cnt);
>  
> +	ret = geni_se_set_rate(&gi2c->se, 19200000);
> +	if (ret)
> +		return ret;

This wasn't here before and the commit message only says something to the
amount of "it's necessary" - what's the difference?

Konrad

