Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944E3C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 15:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ACC2N5csm/N7GWXhyzoNg/HYZa0MB3L4DHfq+Va9l/I=; b=KuEmWtmwJPNbObAqaL4PR1gliX
	VFqsX7YSWF3iFhgLZtoXHTNFIN7iLyj9RcwwqzfzWrTEvH9/iLJPtciGNeqs5R+tOLmX0KSXogg90
	Ygs/cFZgHtdowJ7R5du3SY44W9O9JIBCQQGUWCLPF9JUFF06V65s9XRPrNjADa163iAETipE3z2gY
	0COb4ixr8lYznXv1gGWFXM6Vq59GRc7CNIT+5ycEo0CWKPz/5RlaGz+USRNAMBst8qPuh33kbbOEo
	qlN7SV0sNhMnQhreeOfmnA6PwvwA8TIC5i98wWsA5AaldVord076Jw3rc2QxiRA1LgvJJfLaiCr1h
	PJoz5O8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzFNw-00000002eZb-0Fzy;
	Wed, 26 Aug 2026 15:17:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzFNt-00000002eYj-1RG7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 15:17:50 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QDuYcO2148519
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 15:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ACC2N5csm/N7GWXhyzoNg/HYZa0MB3L4DHfq+Va9l/I=; b=p5knkjHuqaYpQxzB
	H7zvlxnKLQOs1cDx7G1/WbGXm7to0pWBWSR8OKDmeDK/7HsJo6q49HF3qCXkl2pE
	mjswcW8ddsNNA9po4CQBYyO8rO+rRWohR56Q+LFAFVZjRdwiWhUXmDLxtk/NH2SU
	I9Hs+ihAtA+F8wsEqoiEBuDfckytb0cP7TETqi/Aorr8CvVi2R1sLbwcf9TwJIQO
	Pu+iBTFoc/fR0G9oqKuS5sJSoJv1KrGIcf60TvK2XFasrc6EKxYsg1rtJ7TCkR+2
	Rzcaf8CJitCIJN6vpV0F/PM/IGcIu3rdEd+c4+XY8/bOhCJQVWufzo4zWgZ+zEXz
	tY/3uw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uq1sw0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 15:17:48 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so2059470a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 08:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787757468; x=1788362268; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACC2N5csm/N7GWXhyzoNg/HYZa0MB3L4DHfq+Va9l/I=;
        b=Bc++39iqMl+qz59THhwqJIxL4TbAz12zeG3Qxta4n0MHq4xVbsndoFJNT/YNGAv283
         gYWQ+YzbVNDORFnQ9nP2RiFkbtU2iOe/N192Yc7P8Wn2hv+1nBgpkctw0i9M9GBfpjdo
         vx7kuedKGstoxIRbrPDFA8Me2/GikzzycvL6vJzYg9qnqGiwl/9nwk27ml7zoU1C+KII
         CSRREWpdARsvX+cSDjqmHcnTXogDn4hiRQVig9SvVgnRqzB2b4gsztphUPtTvUo8mQWZ
         31g19GNeQ4cjgPXnOiMRidaTy+KSLClrko4USEf1DfylptRewqrpY9vXSgjZzgx6JtOT
         GeIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787757468; x=1788362268;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ACC2N5csm/N7GWXhyzoNg/HYZa0MB3L4DHfq+Va9l/I=;
        b=Sbm8F/ksb7TdH8lP1Gusk5NmzM3dFdSn1GAAMAv2F7dW1LApx8SJIvrcTcwa7l4xKl
         mZxO3ITSMF0jtJ9WQWA8YYvTBKJ7JGf0x4hDpcNoG1664keQ6weZ7LkyjT6PGre9RVPd
         1CltFviRia/YR3QAl59YwVOZQX/V03TXbax5BUYRe5/fPLsNdMYiQMeAR02dgf0tNbxs
         0kbcFLtP0N40Q6u1HCEV4/s/BLTp7x2wmxabRmyKmZ4zTvpSSnwDcd+bp0DWEiLBDOot
         JqY4RZ4i/N/sraDzzgfHF/zqDSQlpecTTxLo3EjohpISyI8VEn57TSHclfhcce3OlV5N
         hJkA==
X-Forwarded-Encrypted: i=1; AHgh+RrF1KujtvklPCQnCxTjBZw/u+K3FMdNCMAN1bpZCGEOlc1WXrFkONdzH5cyeUm93IOGdM4s8dGe6LtWelJLeHTY@lists.infradead.org
X-Gm-Message-State: AFuF++nR7Iw479fxATwJNzC+p1Q1xD7ZmaM7/OqOCS9OuDiMhZoA27j+
	nTcm+N6m+2je/jqKt0inO54EiU8Ms+7BhXRC0rOOZMKd+xQOUznsyEBA7FVZk1AAEiELUTo+AR1
	h/IVF2qtcVTYBDXFklOoe8m0Epu+bEzMzfThexzzGGHGo1vOjS/LTkmODjPFFOQfXu93O8WVJ09
	JxvA==
X-Gm-Gg: AR+sD13XBURKplTxAr2k0lDF0FoSxws++GW73f1d0qQUNQbhKhy4LivE9hE0ntxSdjR
	1693WYCck0u4NBTIFsxNpQzgZQy89D2fDMcsioLlflOwL1m+Ck3Z2pNNExwPDHZ+15pt1JRSqiG
	MDVzw5/pegXOm9S5SDpK9/VMyktoYg8uKWsGjRfX0md0baZGjgAvn6T5a6VRt6mmoB9LBD2fLh2
	Id6UJwSrWK9KTqSMtj/h6yMKUYqC02OKQKkU0GegGieesrDiEu5qLcTnj17hyKXMXwUoWQW/DEF
	dVglGtYI+jvBPk3YsSeWBYPrsk4ri5jfuKd+KURifkNsZ8T8FUAbGeD8RsPzSgOKuRjgdsZyetX
	wY4mYj63zETlqJoTZb58VT3fVW1S7uyfB
X-Received: by 2002:a17:90b:4c09:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-3966d3dcdb1mr15426091a91.9.1787757467953;
        Wed, 26 Aug 2026 08:17:47 -0700 (PDT)
X-Received: by 2002:a17:90b:4c09:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-3966d3dcdb1mr15425980a91.9.1787757467399;
        Wed, 26 Aug 2026 08:17:47 -0700 (PDT)
Received: from [192.168.0.6] ([49.204.111.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39646138f87sm8381159a91.3.2026.08.26.08.17.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 08:17:47 -0700 (PDT)
Message-ID: <75e6979b-84ed-49ee-83f8-bdceef2cb464@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 20:47:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] soc: qcom: geni-se: Populate clk_perf_tbl with SE
 source clock frequencies from perf OPP table
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-2-61171ab1cdce@oss.qualcomm.com>
 <d81d61fd-79d1-4bea-b93c-0afe44f9aab4@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <d81d61fd-79d1-4bea-b93c-0afe44f9aab4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uwZFXRkv9wtnVM0ZRL6_6hQqTH922wxL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEyNyBTYWx0ZWRfX5bFkL4+9kqeS
 l6bYmcWMOBhTqUffYkcKXh8JoA8iDd2G6oKGrs2YPcv17kcMs3VoayOTtg+ZKammI1KWVxhLNsI
 3X1Rq8R/zoaa83Dh9/CGNsAyONHLsNXjBsKyl2DkJwkwaekd7wSGGKVPgFnYeNGxRhyLwWPJVb5
 e7ax8tDroDMkqPcyQVhywkIOdNdKzaNYaTwsWM5LGQ+LsY7lc++WrH2fsfN6FGuN4Ri0AKOj70I
 5GRMeQMG8L2M+LuBTmOHLBsiBvYVA4cO+WFsaj/2dleBfgiM6h6tHWbiDVU01eY1LIX5AQo5iB8
 9XZEWN6C1kB4Lwzgcv5syO4elMn28MLuM1axzOde3klwPZzK2jXuA3VV1+c+XNQlC1JSobqh3+W
 K6SypVKFdI53Lajt6xNmdDu0ez+KWAIYiHegzyeo9nEk7hfuqMwANsc1at8YUK1TcB4Tz7yS7wp
 APU+5Fvt+exAbsxPcJA==
X-Authority-Analysis: v=2.4 cv=Y77IdBeN c=1 sm=1 tr=0 ts=6a8f039c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=MMW3c9rFXQuugNOjlkEUow==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=rko7XVifj6BEHbDbj-IA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: uwZFXRkv9wtnVM0ZRL6_6hQqTH922wxL
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEyNyBTYWx0ZWRfX2990gAzgn3hR
 UKUmCxNJpSjihP7cWwhCC6Yd6aX9U+v3E2efpIHbHBas74DZrPjF88WR7jO1jUWp4VF2PtC06La
 qerWeOghO+Q3jZrSJy6U068RqUjuizw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_081749_420332_FF78CF26 
X-CRM114-Status: GOOD (  16.50  )
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

HI Konrad,

On 24-08-2026 20:26, Konrad Dybcio wrote:
> On 8/4/26 9:57 PM, Praveen Talari wrote:
>> Currently, on the SA8255P platform, protocol drivers attached via
>> geni_se_domain_attach() treat each OPP on the perf domain as directly
>> corresponding to a protocol value such as a baudrate or requested
>> frequency, and simply request that OPP via
> [...]
>
>> @@ -1175,6 +1181,29 @@ int geni_se_domain_attach(struct geni_se *se)
>>   	else if (ret < 0)
>>   		return ret;
>>   
>> +	perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
>> +
>> +	num_opps = dev_pm_opp_get_opp_count(perf_dev);
>> +	if (num_opps <= 0)
>> +		return num_opps < 0 ? num_opps : -ENODEV;
> if (num_opps < 0)
> 	return num_opps;
> if (num_opps == 0)
> 	return -ENODEV;
>
>> +
>> +	se->clk_perf_tbl = devm_kcalloc(se->dev, num_opps,
>> +					sizeof(*se->clk_perf_tbl),
>> +					GFP_KERNEL);
>> +	if (!se->clk_perf_tbl)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0, level = 0; i < num_opps; i++, level++) {
> One iterator is sufficient here

level is not acting as a loop iterator here. It represents the OPP 
performance level

returned by dev_pm_opp_find_level_ceil(), which may advance to a value 
greater

than level + 1 depending on the available OPP table entries. The array 
index, however,

must advance sequentially for each populated entry. Therefore, separate 
variables are needed.


Thanks,

Praveen Talari

>
> Konrad

