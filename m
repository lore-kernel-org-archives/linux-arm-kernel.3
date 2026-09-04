Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922A9C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cZ/scEjeUFKQEeVzgH7yc5/BjZu/YvnYriZvaWHljSs=; b=kRkAZzlZLhZ0hKdimT8b58Pvws
	qM1c7I9oWQXhtk6xyOMfESlDCmu+o6NtSbjqAa9MA5UDIHdPWjjSUEgOuXsovSlaTbbR3DLrpa4NO
	LmGix8nYr9bMlKFEJ5yNl+FCxX1fVPR/n/zq/GkVvKAr5U6M/F0nJmYoAxCh2gbFnClM63KG5m7cj
	AxxfKphK/gpukG3t0I37YCNeWqQwLX0NBjFyDu1nEW9uzwUoJaDq9YhFsPdAE2tkt/sA1VOMEBr/B
	p1L5UOdw7s74RNszUBhZkhv/ErylBsUCO932LoGJZRUjhGhtEc1BK8KRBKe4MNPPN4c4vuP0q1jqk
	WJthdUcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Pey-00000001Slu-3QTc;
	Fri, 04 Sep 2026 08:52:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Pew-00000001SlV-0Xi7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:52:31 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mgX72945695
	for <linux-arm-kernel@lists.infradead.org>; Fri, 4 Sep 2026 08:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cZ/scEjeUFKQEeVzgH7yc5/BjZu/YvnYriZvaWHljSs=; b=gp9RnXbtsidWyTJ8
	cZNY/UT2P0V+NFDYRFzz2J68xJ1rm9JcKlNlnaYAfnnHja5VKKxwyJ/NzOKJbWDW
	g6Ih3xK90ZflwVVd/BOCpP6lJI5WE2QTNagaBs1ysG4Z8GPEOyFBL6WekZmg8czJ
	4syRIeuKE1VJORmbgGnUZKEGX8WLNl9KX+Wmz4/qZuCop3uGZ5qGdPRrN0GoxpR2
	t0KE/S2LpQopgjYYpn9jVhyo4M8kzFxZd64HOQdjBJ8YAJH1peCKEAIo6Di+KW3u
	+QbCWyGj1E/0TriRNcAafN+sGTg5T+o/wLnkxOPTkDGXz2jjQiPKwb5rrK6DM4VU
	Jz3O3A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfqqd0ph6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 08:52:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93102454272so14070085a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 01:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788511948; x=1789116748; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cZ/scEjeUFKQEeVzgH7yc5/BjZu/YvnYriZvaWHljSs=;
        b=S6PznHWYJ7oLRISJ6OrFxT7W2FWTfPAXppE1lQNHvyb+HA6dVTBuKkVDSM/S41LeFv
         ZyBHrFizGiWvyP4cYHAQzJkArLjxLH4I6ZK8xYcSH5xgqFk1Kx3aVJqWEKEup7Rsh0bo
         GjlGAGfa/Tv/58f80FGlnox0+9cBRm0Lx/w0XYukt3Q2fVkWqCTXaCTeqiNObkSU0nWe
         0mFAQA5iDoemRXj0wgNFys2JL/27m0eZLXg345Xf/j/OQdmyQ18KDVtflm4byfLZ3ZC+
         T+/JGFmzTgPsijKH7s9J1HmMTlRYwX0vnogt7tZIbKZ0s50usc8ExcUOHX1aN8nLQemS
         whOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511948; x=1789116748;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cZ/scEjeUFKQEeVzgH7yc5/BjZu/YvnYriZvaWHljSs=;
        b=TfzH97dZ3gTNhBL5e/6e3BWk5qWVQQfUu9Z3eoYbh2OevaQhKA1fiQye0I3O5LLEbN
         f9ldJDjZAHRKGf9xjL9pdTZkZgcZD45YtzpSYHX4ZsNnHuURukrYMRr42DCz42YnUe+D
         Myos4kMJABqp7VmWOuVUto+NTCTFjSU3CxfPixc45dfiv59IhY1dUXHxr+HQv0SbdxfR
         pDlduSrMufjadffH0ldRFB5ItTnjRYC2oLtdlW+dUa4txtC2+s02T+BHuWrsihONbJGh
         1ZDFJSR0ENX59hU/fufMXO+Z7khTiBKqMSSigNxmw+e0v+fD/EAD8LRn5uByJzOWP+yh
         Ktcw==
X-Forwarded-Encrypted: i=1; AKwUvBxcYuNUHDcGYfBHaKBtn/0yiLAJPN/ntDx00xrdYrRC8/tVlGJgbyDT0g+eADqUzzEoyza93mER2vfVQl2EtOYz@lists.infradead.org
X-Gm-Message-State: AFuF++myJe6ikKZ9/04GnsA2JnSf5UnGCq5uSecGNoRWgZxpYjiZtRCh
	WUxHWWHlpThEKID+O5z7fU29Y9ZwHLf/VbokOL8CHTKZObglH5/aPJ/CI5jZy4h4Tr9uU/VVBDY
	Y1SEMycAzZoWAR/calNkcbRYoWH06Fx2iRhRYNYYL50ofd87NCvElFt3jOzPh5l+b+iWJgfXTek
	WN3Q==
X-Gm-Gg: AYBFou1at8LLCXN73VReyf8aFdlVk+McxucV9eqQm4e1tb31FlWBjt8BFMoDc5W3oaC
	qsmU5Z9XUxfLaWEJsAjIAv+pdkgThTyI6oMDQJdNS6To8NhYopQR8v/aUal4/CmqTuvMNI6Rx3+
	XPI1zuWzGUp8vpl9HmMaO8FLpOI2yUdgloCBPF+0PdDu4gPtw1Y9PnkvO04jVS+b8R6BPdKXUCG
	w1kGlHEAj6NX8Hd7/RBf/DLl2oASSTT+QGnzd2ttLr7mb0s0EHSpu9l6Os92SgOh36uTyOrLJTT
	MFi7T/6aeDllbLYvD3LKAH3j06RhD+T373tE6Y1BzlehmyPYbKZBmyNXfIek0DZSdHX43VZA2rJ
	sq1r2a8cGKkldoIPI/pZ8qA==
X-Received: by 2002:a05:620a:d93:b0:939:7e96:d296 with SMTP id af79cd13be357-93980964b18mr303192485a.1.1788511948011;
        Fri, 04 Sep 2026 01:52:28 -0700 (PDT)
X-Received: by 2002:a05:620a:d93:b0:939:7e96:d296 with SMTP id af79cd13be357-93980964b18mr303188385a.1.1788511947490;
        Fri, 04 Sep 2026 01:52:27 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4a8b72sm76908166b.18.2026.09.04.01.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 01:52:26 -0700 (PDT)
Message-ID: <fdfbd73f-8739-4845-ab18-c5f59898e192@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 10:52:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] i2c: qcom-geni: Vote for SE clock rate using OPP
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
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-7-091697dbeb02@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-7-091697dbeb02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qBgzrWy5xm3h5vGWx9DN3Iv4t5YvfHHo
X-Proofpoint-ORIG-GUID: qBgzrWy5xm3h5vGWx9DN3Iv4t5YvfHHo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4MSBTYWx0ZWRfX/cuFoayNjGfu
 ca+4n6iAcF6dONf1emuvU/lsx5NQCD8HZ/nzlRGiwPmKVpSeED8i/usmcNddLWO2vCWNSlCFAAW
 NdFmtJgyjZXF0e7X5f1osgwzz62+QDo=
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=6a9a86cc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=eEzEi8mspgMuG-bTNdcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4MSBTYWx0ZWRfX2NuLu1SIsuVK
 zoXUEQEZ/gPa4UGXFc6Qd2kzjuUqM0Wyhe3ezunp7M+ul2EOmmzv30PG2G0Zcs2qLkscaQ+Cm51
 SBkAQvxdOJ6Ft5tjVnM+6/NxO80GtKhp4IOh6F003tjCuum/Sj7mKCWoKe9X3k/qfhKiC2/0+oY
 SyBjo+o0kRJ8Bd6wy95kcbiQcxTT/sic5JhKvYA8wrUn1MV+x+jpPkyS3RuT/ebHx5Ijx55sNxr
 5wyom7gVw337FWJy4wXDPomG4DBGCe3wGAuZP6homjtoFuP5HCmflgvBnoHVQF4EAyIr/ipIgWH
 GT2Lk8SzVx1qfbulEmVoCehbprpM2YP1uvdFtOSVzwgA208avm2SZv1LOgjG7xfoA9vMcH8ZkEC
 uRcbOARIZxzwfSi9vs5Nvck238YmwoZFlxE0nyzztqJb6oHYwNsz8bFHvl9GkipUFU3hpROj0EN
 QAguWNBezkEFkQ2PtNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_015230_304926_870D7A5C 
X-CRM114-Status: GOOD (  18.14  )
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

On 8/27/26 7:59 PM, Praveen Talari wrote:
> The I2C driver currently assumes a fixed source clock selection and always
> programs SE_GENI_CLK_SEL to 0, which is not sufficient when the controller
> needs to switch between different source clocks.
> 
> Add the source clock index and frequency to the I2C clock map entries and
> use them while configuring the controller. Request the required
> source clock rate through dev_pm_opp_set_rate() and program SE_GENI_CLK_SEL
> with the matching source index.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

[...]

> +	dev_pm_opp_set_rate(dev, 0);

This and the below call are unnecessary, rate and enablement/disablement
of a clock are orthogonal operations

Konrad

> +
>  	return 0;
>  }
>  
> @@ -1236,6 +1249,12 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
>  	int ret = 0;
>  	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
>  
> +	if (gi2c->clk_fld && gi2c->clk_fld->src_clk_freq) {
> +		ret = dev_pm_opp_set_rate(dev, gi2c->clk_fld->src_clk_freq);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	if (gi2c->dev_data->power_on) {
>  		ret = gi2c->dev_data->power_on(&gi2c->se);
>  		if (ret)
> 

