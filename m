Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAEFC44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 09:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dcpk07oZraCPhKGl/8f8pKfXbK+a2naoxCJPU/iKJq8=; b=Y9rCtxwaGcHtHF5GEvYs1jks5G
	2pWilrxRxqfJ2xNutGZ60EmoRUiVp9Z2xW4g6gD0C1qvF73TS3TUO6MQNHhFdD3jA8src5SMQ21/d
	5wW49jMcJas05OamTf8XQW9w0QS4GZEw1Xqi45P2dL1+UHhJAxdK3ZJvNRuFm57jOuqaPJv/tzdDC
	nCGsj/20/B8JhJmEbsCl8KIA4FF+nKIGQUqc7p2RFJpRDlnxBIHdPMboj9BhsHmPpFpaO/JEqZg7/
	3tz1NsW9H+L4mYtptLjp+oIC3zx1UwMN8Us3irdePefkuZm87Bznzil44RuFIjaYWXzjTd6oWNrQE
	Dg1hTFHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkf3D-00000001r9U-1p2s;
	Fri, 17 Jul 2026 09:40:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkf3B-00000001r8O-1rtT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 09:40:11 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cbNS1019128
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 09:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dcpk07oZraCPhKGl/8f8pKfXbK+a2naoxCJPU/iKJq8=; b=WY113k/ION4MNi8W
	C0TvnMk2KuNiT67xrQD70k/4Fba1gqvN0HwqZOEvViG7Y5jKbLc2y8YwpMty6aJF
	xO1REocUs0tw/ppl4wtmEbckb1TIya6JOe7yrHmilCEP/N/ZSwQP+DRqzKYAMBoc
	WlUKywpMA47WrFYqiSVEqtS1l0scGI+vQ+OY4QQzGL+gHL7Rv3yswj2+bbxw8As9
	aSCjY3NIDpAcDFcAelEEizj/4+5vyXc22L7TVUufkQfTr6qxsMEDpFhE2bu///L9
	YKjvuQJaxhorOhLJwZQt9q3K8tAuI9llkx58pz1G4ezlZwJmC18PTb+hExtEG7Iv
	8IXPUw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff810q6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 09:40:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cacf17c7e0so62961275ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 02:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784281207; x=1784886007; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dcpk07oZraCPhKGl/8f8pKfXbK+a2naoxCJPU/iKJq8=;
        b=ErNofJwRnFQrWNfDJQOhyZU7gcTaxeRMLn7s+ivzztjlqIoCs9WmsmyKp1VnRM8uXX
         EL/W1UcWd7JZ9l2U1LG6fXUwzNNZKJmIjGF2HeGV2kbHaOvCT5VzZt75hvUijf2AvfVJ
         JiqnT7UfdvkVM8Zg58LTp+BTORGo9bmT11j81mrnJUwLQjeY692EZtgzmtsDN71ygvrY
         lOq0rh6fbOX2/WDMStfIkCH97QEymx+mSDr9uXiczF2mwW2XbrjVKuciw/KiHrciMsov
         +GWAWsoQw8Uv0xKQpG9PCGYxInkiwc+kBXpvYx9bx4zg1k/Zk7jQADxVaZRC05vpxVjp
         vGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784281207; x=1784886007;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dcpk07oZraCPhKGl/8f8pKfXbK+a2naoxCJPU/iKJq8=;
        b=o3tJYiDzCNPpqwlnDgxwGdrKzbvPyCz4wAI0o1fNvjaKdFL7zgFFb0S7wxA7fzkSTH
         Qrq9jEFLbyDpbQPXa1fJzg3FPahMnmc/7p63k4cdiRSKMz40xkY58jdZPKQYXbN0L289
         YilV9S71kvX2gWlOB4J4Ko97Xj3IXePr5ZlUHi5QDj+DKlqiZqsnf7GEU5ufvukuS8RO
         43+rirxgfKy/jExWI8Vuv4g7Z0eeLrtMW4nlbOj4fni5DLpo0vCLCCcktaLezUfQSkda
         +nsXVaTqZyePpszZg7QA+ZEMB8xzrEEOdMUDRdAXfEyO3+kQFYNBgzItYxxe2Vd1ZBCX
         1enw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/6Z9Vwto1Hwez/RIQq7Rn1FxNk7WpdPWfQ3qccPeALkbrE8kDPaXlICL4NqVDIq5kyb8M+YsEQNH1Fs4fU9Mf@lists.infradead.org
X-Gm-Message-State: AOJu0YwawFZdTI91ctizbvLeghZ2Gd6lbXkh4KsnrlQQfwCHfzc+h3nJ
	E7ZLd9WkYgUQTrctPvaDZ9S6Fmx/AnVh+6YGT5VEA5CJ4k79cbPfH4zPi+IuuGKqA2KIdUEq66/
	9et7yrU6Qrqb7x4XdnFoHMNH+yX7XQWIjYatDtSm+uNgNgijnUCL7VgyfK4u55S++HatPr3gbjN
	gd2A==
X-Gm-Gg: AfdE7cnTDdnr93P71TPL/SYS81f1ke/bdV9ssVgU4r7aUAXV3uhmgNth9RPNkt7fqiS
	MAUcoXyCVkn9GNC7MVTPvHsYt3D0r1YE8lGYaPxgkj24lIlovI/ppi/4Sj3FxfHNnJbQvz/9AqU
	/5poK2BQmSCjmb/Loqh4+3xRTnLyrKidlMcDSZKK6/I4AQ4zjEho9q0VvZ1efcdXuQAyY/4pSKS
	emuwUgNkO5uI5G2IeryNWBwtTzkJqz637l+tFUfpKwPm+sTR2ajKiAkRT9A066EzuNkAF6SjMmg
	ayoQF81KN+y5AFjkx2D/YTGnevH5y8AoFDz2mOpxC97dkHVzM0GZwCfU7NDlaUPtaAWvhgHlVxf
	R9rQV/8usGXJ2x/t32VJU6BI46bHaviqUIhs=
X-Received: by 2002:a17:902:f70f:b0:2c0:b6c7:227e with SMTP id d9443c01a7336-2cf3485048cmr21452815ad.5.1784281207240;
        Fri, 17 Jul 2026 02:40:07 -0700 (PDT)
X-Received: by 2002:a17:902:f70f:b0:2c0:b6c7:227e with SMTP id d9443c01a7336-2cf3485048cmr21452515ad.5.1784281206807;
        Fri, 17 Jul 2026 02:40:06 -0700 (PDT)
Received: from [10.217.219.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344f4481sm7545845ad.32.2026.07.17.02.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 02:40:06 -0700 (PDT)
Message-ID: <eba6d3b3-b5ee-4543-a437-4e7c16c5653e@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 15:10:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: iproc: reset bus after timeout if START_BUSY is
 stuck
To: Jonas Gorski <jonas.gorski@bisdn.de>, Andi Shyti <andi.shyti@kernel.org>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Kevin Cernekee <cernekee@chromium.org>, Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260717085507.34209-1-jonas.gorski@bisdn.de>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260717085507.34209-1-jonas.gorski@bisdn.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RbqgzVtv c=1 sm=1 tr=0 ts=6a59f878 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=vjGmwFoGhKkvse4UqjwA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 3kvoDxuN0mz-fP5o499stDmXhpriME-4
X-Proofpoint-ORIG-GUID: 3kvoDxuN0mz-fP5o499stDmXhpriME-4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5NiBTYWx0ZWRfXxJ9P8ryLDk8C
 JyrRzOszhmwWSOHeaH1ZfWXlufVhjPpJqlOd0zAhJ4ug0J7LQH7zXlgDVwCf4zIJXg50DAm8Zsp
 thyI6ewPubk+U97sXG59FcXCeSEsv/I4qp4Eze7iL0Uh2P+q2Bdc3EULaPelv9STjjt0fiVvIFd
 8XqeKPxyb4Ux21QGmbUGtJN6UeHpULg9eaZRfOiHFRTwTEBGDh3bzhTp9oyi4S34y5si8kBGjND
 58AkJlMdbQJ3eWzH1LEHjhgyDh1wh554mK1YOUhltQ0SciOCNMvGSyJUnRvQstHXkAH7NLYZbrB
 J9d4kMCXeIwh7aa2DWtQPiSl0TdmXAzh5pD4yNe7WC5s1Lh59w6KIbcr+ag14rsK2TKBm5djCsQ
 WsNjuCqVs6HN0jSLPQwV0DfN8WF6V15ob9WbAVXmRj98jPrv56lm142e1F1iKfTX4Q54D5MjG3r
 8kPPNvZ+Vtw0q0yjAyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5NiBTYWx0ZWRfX0Qiyln6iXcFz
 gFSipi8SODVA3RGfiEFf3d0+UNhIR3fqO99SkjiWB8JylXstSW8CfYd826Q15dZSwuPO4fqidXa
 43gD2Gn6F+MfBZr4ySLdbCYrGgVXsec=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_024009_605843_5F7DD630 
X-CRM114-Status: GOOD (  21.36  )
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



On 7/17/2026 2:25 PM, Jonas Gorski wrote:
> If a transaction times out, the START_BUSY signal can stay up, and
What's exactly START_BUSY signal
> subsequent transactaction attempts will fail as the bus is still
transactaction => transaction
> considered busy.
> 
> I can easily trigger this by attempting to read from an address with no
> device, e.g. when running i2cdetect. After the first read times out, all
> subsequent read attempts return busy.
> 
> To get to a working state again, the controller needs to be reset to
> clear the START_BUSY signal. So check for START_BUSY still asserted on a
> timeout, and do reset in case it is,
> 
what's here after it is, ? wanted to end the statement ?
> This is also done by the original non-upstream iproc-smbus driver
> implementation [1].
> 
> Works around situations like:
> 
>      bcm-iproc-2c 1803b000.i2c: transaction timed out
>      bcm-iproc-2c 1803b000.i2c: bus is busy
>      bcm-iproc-2c 1803b000.i2c: bus is busy
>      bcm-iproc-2c 1803b000.i2c: bus is busy
>      bcm-iproc-2c 1803b000.i2c: bus is busy
>      bcm-iproc-2c 1803b000.i2c: bus is busy
>      ...
> 
> where the bus never recovers after a timeout.
isn't there a max retry count ?
> 
[...]
>   	if (!time_left && !iproc_i2c->xfer_is_done) {
> +		/*
> +		 * The controller may fail to clear START_BUSY after a timeout,
> +		 * reset the controller to recover in that case.
> +		 */
Make it simple ?
Recover controller if START_BUSY signal is high after timeout
> +		if (!!(iproc_i2c_rd_reg(iproc_i2c, M_CMD_OFFSET) &
> +		       BIT(M_CMD_START_BUSY_SHIFT))) {
> +			bcm_iproc_i2c_enable_disable(iproc_i2c, false);
> +			bcm_iproc_i2c_init(iproc_i2c);
> +			bcm_iproc_i2c_enable_disable(iproc_i2c, true);
> +		}
> +
>   		/* flush both TX/RX FIFOs */
>   		val = BIT(M_FIFO_RX_FLUSH_SHIFT) | BIT(M_FIFO_TX_FLUSH_SHIFT);
>   		iproc_i2c_wr_reg(iproc_i2c, M_FIFO_CTRL_OFFSET, val);


