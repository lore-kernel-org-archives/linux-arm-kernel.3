Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCB4CA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 07:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AVpUwU22uEKD7W4M4o2CONa/iooL55EIQZsHgPp6kK0=; b=Xv565hOdwWFgQ10Su3Fg2CB4SB
	wGuEBG10ZrvyXMFUiQJg+KzcW81euaOKG/1akjuwhUD7RHnf2umYBCH7B6ONkuE7fcNnL48TnLNGi
	m9aMWk8pTuXn2IJh8XE/FfwTvdS1Z15zVBFooUUFLS+eqtoSckcUIN8if9EVfDwqG28Iw7zkeJZmK
	EXsqfwzlQjO7zxkOSa+yBORJaq/e4lbhho4cL0RokRfi7sgz2ahMCOInF7bFXokumyCrP+sRuICNV
	b7LxCBscKfgiK2ZYhSOw8CZ5B3nM0Ks7CeCdUEm1CVGo1hgwYRWYrYLTfv4OlDKvZJNMoFr4P9YH7
	lpNe3iNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEM1G-00000001psY-3BMp;
	Wed, 07 Oct 2026 07:24:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEM1E-00000001ps6-16px
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 07:24:53 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6975Nu881567054
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Oct 2026 07:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AVpUwU22uEKD7W4M4o2CONa/iooL55EIQZsHgPp6kK0=; b=NWfS0D0eVGD8Ok+a
	ItVMICbFmN4Pa8s0NHvUUl+KV7E4pFyLF8xMcW5GyJuzewPKBPrg34y/X9dB4Vox
	6LjMoR1/CZxdK7XNeIJ/Q9wyIfLfqkDQ4BzVfJElSE441HhIhQfEq5/AT8FBFKe1
	VkUrztA0mujGiZ7CW2EipTQtypQ2sIWyt9rye4od28rD43d4pkC/BszGocZtyXGN
	z9o3QKZgX71bCK5MfynKya07QL366faaCEVHSAdm5O0xJeKj2IAw3w+LtvdKHGZO
	M+Te//uEWi7n6ScQO74BAKIP7G6gHPiMdXCLWMWD9UXvR9Vqhr8vd/Je8FUZysMs
	g7wpLg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fw8rbqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 07:24:50 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso2693392a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 00:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791357890; x=1791962690; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AVpUwU22uEKD7W4M4o2CONa/iooL55EIQZsHgPp6kK0=;
        b=Oj3drKqRzsDCcsdhncuLNbq+/iiiaM6EvP1KVFNN1J7r4j3RDhcCMLupw5xs2TcaBi
         FyCoM4MN208o5wdcHrPg/EMqUAx0EenCT0Me53KI8DovpqcIAceaQq0NgomQWWVIZ9XD
         a1NU48lDVoAks8/MvhLR9nvBAQCYjur28GPPGs6vob0495n+9j+CO0e4fVrtgKw9OpBP
         AqRubZvmK0c8rKLvncg8EX7RDcvAS0qQfpPrHas3y5D/dsC+al3Zf2uTJ86FW9W3z2ek
         eqt/xijKDhRAEd42sH51LQ6bMftqPn0NUlh4DKjaq/8oSucCFD6jIJOQQp/227EtYH8r
         vosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791357890; x=1791962690;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVpUwU22uEKD7W4M4o2CONa/iooL55EIQZsHgPp6kK0=;
        b=W53sczG+2Ayij7xjUF/qyJcXfREpXbWz/47GjLT8I3IWVOowGUJgJfe0TF76M9Y3ME
         d9jbvc8fCKmEm5J1sXwuyBBjblscENWeQQRczWCwAzqUXfZaOu17GUcCczIeYBWUUWhp
         8iT3RyzRmjdmlsB4K/g/519sgt8FLoM7sQuYo8jTF46NFDrvuyyBknOI1VM9VPDO0dRG
         ZTe8+nBuIvDMcftWd6YHVEH6r0oHGfOeCqOu6kBNdQCvdIEm415Eyhe21PRZxbLz/CuR
         Jmf6U3/xDGZlE2d0b70isahijCSdZ9nyK05EkZ9PRvh8LZSvJ3DxLGC3K5zwxXy6o56A
         gW9A==
X-Forwarded-Encrypted: i=1; AKwUvBygGyUBbJ+cSZNdeJDZ3mryEG++lHO0PVduAl+GfT0AKYeX/nfo14AkqPrpvHa3m7YDSO2nQZ69joPvR3NFxlBB@lists.infradead.org
X-Gm-Message-State: AFuF++m2DpVxx8aQ3Fv/9WHF9xWpU4CyZWUdNlk70rAKCEMkKJJx83gh
	AeXF7ZMLTanRrQD21v//F277tJBFuKEKZlyHTiTwIXOiR+gE5EsgxaSrfaL2CeZv0bewJz6E3Bh
	cN7vbfEn2X9dKuZr/9+U46iCRbhQs66ADhhXnHc5/RYjZIaaB7kJuXeu3fNCZtEXziLrKjtN9Bf
	xJdA==
X-Gm-Gg: AYBFou11MG6oqAURMRB4U9QEwMt8l7scixgi7ZWMd7itKJ+y8BazdiI+8XxOLbbhDhp
	3fUmFQ7bbERqpgjkQ1lOVargNrlB51j5tqv6Psxb1dsEIZQcu+DFMSal9A80UiojNXlWqVObknF
	+hh7ni3Gxc7PxCXxQ0QWYjriQ006lihtahUGyyKr49/7iX6hkd9MHbohRrKmX+TzhLuggZwQjAx
	j0JkCyUS8wUQkTWG54D/PVAh4WrmlwwnDXOpZfq9paTQTOkGmOLnD/mhWcwXfnZOMZNVR3j0lz8
	nNKTkAoSVdDYleY/uU6QDF74Z4MAaUlEMCTxbdmUssxgPMCP03dQ7XB8Np/HaU5N6HNPta4sdQ/
	aJCWYKoLdKuT9UDVXN/5kXW2fJbDxISq0qQ==
X-Received: by 2002:a05:6a20:918b:b0:3dd:85a8:4c56 with SMTP id adf61e73a8af0-3e134051f3amr991004637.29.1791357889586;
        Wed, 07 Oct 2026 00:24:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:918b:b0:3dd:85a8:4c56 with SMTP id adf61e73a8af0-3e134051f3amr990973637.29.1791357889108;
        Wed, 07 Oct 2026 00:24:49 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89188a0d6d7sm954172b3a.12.2026.10.07.00.24.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 00:24:48 -0700 (PDT)
Message-ID: <0f113c6e-b868-4540-9f57-75b3530181f1@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 12:54:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] soc: qcom: geni-se: Populate clk_perf_tbl with SE
 source clock frequencies from perf OPP table
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-2-091697dbeb02@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-2-091697dbeb02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyOCBTYWx0ZWRfX1DJ+cgv23WhO
 vxFg126QRW38jRap6Nz5vR7pv0FExMP3gj3oGYUCvY8vnor/sognkcF8MVUrrmAh+HV7eVz0MpP
 zcUzhdRjSinXk/zH/6gzsgt85Zr1QW8=
X-Proofpoint-ORIG-GUID: 1_64mTjTlFkEQOV83i5aWb68t6tnDoAQ
X-Proofpoint-GUID: 1_64mTjTlFkEQOV83i5aWb68t6tnDoAQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyOCBTYWx0ZWRfX/rnoBviSWWDK
 56E5z33Lxe97P/Kw5+iqWtN2ESTZOewcLoPG+EdIQXrLvMQWGIuDORzopa5VRRLaNzPmkrR3J8u
 CD4+B7ul/cnAQSLEUVxpiRz2EEp9EA+S4j0cScPLOE9efCYLXTNBCExB0SwmzpZXVksI50kkVUZ
 0FQT5T553mD8ZLMAw0AbQVJj+w/7Dd7GuOQit2jUHVkZEBtdk2AfeFQ0QPjua/KTQMervtVxY/Z
 2x856PTVPQIJN01TYRhnkURWBXNou+XjC5jFjYRa3DVZzFBOofklelYT1+JAXUK/OCqGwrzHa3k
 03a3zeF1TcafpWwCEfu/yBdf/X/NqTcg+C+lbkY6iB1eawgvJEIfcD/5StZ7h9yMN1lf9DvyiBn
 fh8xvS6jyLsZ0DsQFFt3b1xU+lq+Q5jUFphbEKFVP3jqF1xukiZODM1YZfORqB/JGAMjViNsJkN
 Agb9ZUVftMGV61qgsyw==
X-Authority-Analysis: v=2.4 cv=Af0kjHXG c=1 sm=1 tr=0 ts=6ac5f3c2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Kq5vhQSCjsUw4Kr_5AcA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_002452_399532_391AE11C 
X-CRM114-Status: GOOD (  13.76  )
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



On 8/27/2026 11:29 PM, Praveen Talari wrote:

[...]

> @@ -1175,6 +1181,31 @@ int geni_se_domain_attach(struct geni_se *se)
>   	else if (ret < 0)
>   		return ret;
>   
> +	perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
> +
> +	num_opps = dev_pm_opp_get_opp_count(perf_dev);
> +	if (num_opps < 0)
> +		return num_opps;
> +	if (num_opps == 0)
> +		return -ENODEV;
> +
Let's combine both in a line.
if (num_opps <= 0)
	return num_opps ? num_opps: -ENODEV;


> +	se->clk_perf_tbl = devm_kcalloc(se->dev, num_opps,
> +					sizeof(*se->clk_perf_tbl),
> +					GFP_KERNEL);
> +	if (!se->clk_perf_tbl)
> +		return -ENOMEM;
> +
Non functional to Simplify, keep level = 0 outside and increment level 
within loop> +	for (i = 0, level = 0; i < num_opps; i++, level++) {
> +		opp = dev_pm_opp_find_level_ceil(perf_dev, &level);
> +		if (IS_ERR(opp))
> +			return PTR_ERR(opp);
> +
> +		se->clk_perf_tbl[i] = level;
> +		dev_pm_opp_put(opp);
> +	}
> +	se->num_clk_levels = num_opps;
> +	se->has_opp = true;
> +
level++;>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(geni_se_domain_attach);
> 


