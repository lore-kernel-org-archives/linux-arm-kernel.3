Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429E4C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 11:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3PFyPMRWHHZzfiXJ+pBlyqnTTzHCJvh3CG4+6T4pjYU=; b=vXqZT9R7gdb84zKfHnfZwu1aHD
	UeM8oUIzcYeqabdx10dhxBTIxO7y4YJWaceq4QAo7osfBmC8bhnIb3/YpQE7nxb7/D0IwZ1D7Osg3
	QppkYWZ3WtrBNQt8QhXMPonqts2gB6yvDYly30YQWEKGZyQaGDluxHCn7tCjo71I8bVmCBlrlavnt
	Wva3/AsudSXclLt0UOBa/2ajM6/ac99OADdzl/DAV99a4JuYVr2vc/PmsjsAnqlITtnnVxRgo8QAv
	o89WqBHC2iwhdewX9bBrKEKCCr8YLxD3IZsCGg26Ypx9lR79+6+WlKrSzlfx0O05mskmfEWffdK8y
	kzwAmmsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyT2A-0000000GWt3-0wcw;
	Mon, 24 Aug 2026 11:40:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyT27-0000000GWsY-2PqR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 11:40:09 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMYC82648057
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 11:40:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3PFyPMRWHHZzfiXJ+pBlyqnTTzHCJvh3CG4+6T4pjYU=; b=iFJI3fRU23uszfgu
	5sEEIzYEiTTWjY1lLLHsvKScGW1RZlun7PE2G2leVNNyC5gj+t4lxuZpkWDMJBoZ
	7EFRFKRd1CkFXa2bxK4W4YfsWUUTBSkkAQTsXFtU86Ys5cOj6uMCbzUrtrag4eVb
	cJl/kxC9jSRcvT5OkGz06ZeFsHdmpF68J5Be8yqRhapo5MsFG38diRuSJIk+XBTu
	tushN3mu71MMuQnbh3Ln2PThkoIYOfGfVBX39ZSTJQnrpqVpYNiH5vXzCbIw7FEx
	6+UeqFTb9ea82QUhLuPY69R2WrpoCo7diq1RQKGBo5bL3oLbeLX6Mvp6+fg4q1R8
	G7cD8Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gqn98n2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 11:40:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e6d253330so3703336a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 04:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787571605; x=1788176405; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3PFyPMRWHHZzfiXJ+pBlyqnTTzHCJvh3CG4+6T4pjYU=;
        b=Kf7Fok7PIy74BtvyIPR7GUPrdp1OmUxZDU609cm4njd7CSd7yHfEtCoG+CQdtJg8nr
         gYVGnjbU/J/9c+u7VQYPisYN3HpRNrcHH+PZkGRmxaYxRpT6RIUTh6dvrDTqceJMAS3k
         IUhjgJEw74j0hUet1/Z6SdrfPlJ7iFHHk636SV+GGeyFHymk03UBLD28HsMo4yRoelm6
         P4WyD0PaDT4kMW5N32FET8cmjsquwYoQ8/AXVVnBDeZTk6A4+EpKHKnVLt3VQ+6xdV43
         VxzX3436mbl/TzAyMW8rCSgvtayaxpe0SCJtWQQ11PugEzJmoxWnr1W1nn6IAMia64sO
         z2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787571605; x=1788176405;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3PFyPMRWHHZzfiXJ+pBlyqnTTzHCJvh3CG4+6T4pjYU=;
        b=ErdnQkJy6al3N7Qno+uCcBYA22C9QXVd2nFVo6wuAhgKXZD/PfPC6Xj7Jk40B4UUdw
         YuYnzm4ulLIfx3AraEOlTT4HJo+8r7vgtmMYLYq9EVoQwuk9eeXTZpoRkLMJUyBG8r74
         2GHDUotSwLh0s6E9JWbS6OwvimKdIbr0uwdF4tdeGclsdkiwnnPziBoZY6pxmbbm/lPk
         BYUcMqrs55PPHnNDDRNwoBcbxV5I8ln6RUidCFUpetJ2IZUEa5JR6z8EhnpwHDXCPWZU
         KjjbaDfKvIuVVoc7jcKO+5BDlTNBK/kyBQ7rnYW7pEFToyS4sD66ymSXeUC54Wp7+zE7
         Mf1g==
X-Forwarded-Encrypted: i=1; AHgh+RqLGikkk+7Le7CitGmXp9HkZij+lXkzKpii+o/UCtsvQ2jycpAviW2LyGsVlIM/Nd5EJNDP0YXqKz+nrEVUGcxD@lists.infradead.org
X-Gm-Message-State: AFuF++kjWDWPf32U4cMugFu7lt/J8G/v7autmeyXlP5vDt/QfRuzcaOM
	k3jDHFiXEAszlTVP3zxvfSpfbQAuv3EeHlu8H27zQQ6aUgCc9+Pnb4QtbBAcK/mVHhnIfkGv+xe
	iELYPBVMzNUHKMHb001+/Ggu7aEbi4YKt/vRAbM8Rwp6nYMMC0wbw4+OBQ3ov9MahrwwpkCJZXp
	tdLw==
X-Gm-Gg: AR+sD11W1aY/ACD9F2lQRc4QYyhbA7OYBGGv8viZcY4X9sfFX+S/6KFUV1+p2aAlsFM
	FkhxyZOcE950QclFtKuqRNaluZu/BG6EOWq7S+jdEyCDeXL5X3k6S8K2G4yV/VvaHls+FafZMMb
	V9IvhPKuiQaOFJnjUI10+B7t4mZKgt6DD1u1QMdhtRC83rMSqnpfZqeNoH7EMHScxEQD2zKnLl3
	yiIVs7bUozy6zYr1nh+lB72OV20hoDVtUoUOL3oAIHy/si0BI+bg1vUjKYTF30WFACEGFI5+x9O
	tMPGatZyTu3+b68azHetOlje5bdgoBN97mbNgGWq5YOifHOBH4PpYeDovyZ2cyj7OuoEuFLxKKx
	xWQs4fBwbSL18O8rsC5cMjEFPmcBr7Q0V5n0=
X-Received: by 2002:a17:90b:57c3:b0:395:8124:ac53 with SMTP id 98e67ed59e1d1-395c4fa443fmr22916691a91.6.1787571605406;
        Mon, 24 Aug 2026 04:40:05 -0700 (PDT)
X-Received: by 2002:a17:90b:57c3:b0:395:8124:ac53 with SMTP id 98e67ed59e1d1-395c4fa443fmr22916593a91.6.1787571604902;
        Mon, 24 Aug 2026 04:40:04 -0700 (PDT)
Received: from [10.217.218.158] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e49e6f59sm9678818a91.12.2026.08.24.04.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 04:40:03 -0700 (PDT)
Message-ID: <9d73e9aa-240c-40b5-94cb-9b1b9c2ee380@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 17:09:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] serial: qcom-geni: Use geni_se_set_rate() for source
 clock configuration
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
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-4-61171ab1cdce@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-4-61171ab1cdce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NyBTYWx0ZWRfX0CCX9ODT+uFP
 xuMlB+Bwx0moXzRLBg6eCLlRTymM2584esDEW685l1DRAflB9FIkSUQu8ZYIxuSq0ZIl0GTPz+Q
 4jYvP+0wSe8Hrv1D9nWkr0xvb7HLR2E=
X-Proofpoint-GUID: uFBppIFSxPrIuYzeIaygFeHcHF5CnAMh
X-Authority-Analysis: v=2.4 cv=fqXsol4f c=1 sm=1 tr=0 ts=6a8c2d96 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=qpM7YB9Ikm2qReIqoCUA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NyBTYWx0ZWRfX5a0CeodTzPuh
 CP95d//QijzXeuwJ5t1Gks7M/SNM2y0lcP6FugSiNcJfCjjFQbzp6EBd9ALdKmXUsZtoZIdV/oj
 F6B/CZk4W0hlVN9qNQy9045SPC/+ieCwDzPcHVgbHvD/9SM2zuYZkCBe3PidONi3xhNDPAD883s
 +ln089VmF9flEuBQjmq3nB6IfZTwBq/PoACCceYBobMlMRURd87kuMVfU8El1clCbu5oDM+YyJr
 9yLO1QicQ1lW5vJ7LwNGO/loHl3xfa64OifOLBE7CtoQcviOTob3sOOuuvrHRlzf1kVw5CZzn3S
 8Vt0H+xbrrPJhbMmNN3kQZJYt4LVc//0luQQ91BX+mYgjYR7wZRelzcRPJPapMoMLxeEQUNDlqL
 udrAldE5uoPRMalINbzyy6x7b/GKuqqc/gwidhG68KyZ5nIX8Hf1UBBqvkmkrTmuEvz2xQfAGy1
 XR8TJdT3Yn6EC3hQG1w==
X-Proofpoint-ORIG-GUID: uFBppIFSxPrIuYzeIaygFeHcHF5CnAMh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_044008_452634_58C56B9D 
X-CRM114-Status: GOOD (  11.89  )
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




On 8/5/2026 1:27 AM, Praveen Talari wrote:


> @@ -1474,7 +1473,10 @@ static int geni_serial_set_rate(struct geni_se *se, unsigned long baud)
>   
>   	uport->uartclk = clk_rate;
>   	port->clk_rate = clk_rate;
> -	dev_pm_opp_set_rate(uport->dev, clk_rate);
> +	ret = geni_se_set_rate(&port->se, clk_rate);
> +	if (ret)
Can you add trace log with an error for geni serial driver ?> +		return ret;
> +
>   	ser_clk_cfg = SER_CLK_EN;
>   	ser_clk_cfg |= clk_div << CLK_DIV_SHFT;
>   
> @@ -1513,7 +1515,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,

[...]


