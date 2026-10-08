Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E426CA600A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 07:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6E7f87W/XyZ40GqugjOqDeLHSs71iH9JyYqCBHkyOGw=; b=my5ml6Ay9t4t0QfgBrZqtfUQEl
	+Dsh9fdVM4ig+n3NFHjQxWlEKpR3HIkI406c334ZqZC/c/w0Brd8sFzZzDtqLK8WiU9aOQWM/yMpd
	kaFw/4kp6qPgikTgXcIM0zWD7iIvHIrfnt6pIwxK4fRyFtLQQme2iIRFeQllKYBF44KCrayUWC0BG
	RFj3jywOhoZCm0PHlrdCCOH6ko8ZeZmiNomwcLve+Qy72EUNDZcF508xvTkrCruBFJ/SmBX0lwAGA
	abuGXdeSIt2P4WbXPnhkGh9l2xbHP2HkpkFYTXtkQhtC53BZYnL/GFnPguJByXfnJ5Fuyzm/sscPY
	i9JtUs8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEifQ-00000003lpf-48IY;
	Thu, 08 Oct 2026 07:35:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEifO-00000003loi-39BB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 07:35:51 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KY88730807
	for <linux-arm-kernel@lists.infradead.org>; Thu, 8 Oct 2026 07:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6E7f87W/XyZ40GqugjOqDeLHSs71iH9JyYqCBHkyOGw=; b=XCuej6+KqJJ7L0Kq
	2mw5AHEGCBDCt1Lv5Z2m/TzLxn8Ph6oU/8yqSzzacoiJpijkNCi+hC5uqds3f067
	N6XoeoWGMhq+NCUKkX7OkZRTPKkTHI81O79OEIM/6aEEDZUVXBla/9zj+KM5/Qkn
	Bc9bQfjVyeN55hsCoBghkqg1x9cXoGJLqVS2eSRb6KxHrkHwnmRR56OXEReTzojH
	LW6e0BiTmFxcXVkFgRUuJyAzYACvOqMxNiiXzKsLYkof3HnYLCi99UYgiglX2x8K
	uO21LGM2+JQxbK6behqGMq1ehu+3B2wGDYhRREb53omb5k8JmZEnAgdv9Ib3E8v0
	vrXo8Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe31pg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 07:35:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a47617a0b3so4905007a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 00:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791444949; x=1792049749; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6E7f87W/XyZ40GqugjOqDeLHSs71iH9JyYqCBHkyOGw=;
        b=cWgxG3FJnD5/thzU7ov+23KVN9oeU26YZmpxZ0vTkbdHxCPO5k2cxCKiRORewxLgpg
         y1VI5o85DUaDsV5Xoe1lMHZLz9gPiDIfFSsdAEsYhmaxnJd2FY7D6M46RE/7CqIi3M4e
         rDYwFHp0jVqaQqrPXDrk0NtXrlzijT8ugR+URSxsgpyJA3K6F4a8sjNh+joPa8dWpB7t
         YTgD08JUufyUfjHNMU56Bcw9l7mr0Ck6bUTYS29K+2X1W1rapbufRIZGawOs8o2h7Kit
         qVoc6FppC1HZSVTh5atCoJgMZb8s12slhNdyMfxDYaxD3M+24RsOQlvOQj3GFlBJ9fK/
         SY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791444949; x=1792049749;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6E7f87W/XyZ40GqugjOqDeLHSs71iH9JyYqCBHkyOGw=;
        b=t1dZLHxe3nS83GsxkXXfsBKc85ixaTD61qq2x6wPjgTnC4kNZZYub8s0GvA6Ir+e4e
         GBRGLKyp4O7EMsA2eTTAYKO2iDaX8CZXL7VnWzd7gCDH2x1TvcYqmPVfC0CuHCTQeiq8
         nW5cgw0+PvBLIH047r/lrs/BU3wFjldKDJ7kG4XheeOGMItc3q0j3VFv8T9uyx7esLAQ
         YkqLPGiXgEm49vJV1+nK/1qBD3s+wu14/oMRbIogikgn5ThulaZpcojIjKeVZ+WtiCjA
         8h7NmNRiMpboR6CQ1+WFaNYy1hGQmr40M1H49av7soSHLe02x/qr+IkWxfPgXeLn2uNo
         9Ngg==
X-Forwarded-Encrypted: i=1; AKwUvBwD5OYN2J7Hbm2EIzibfsKhE1wIP4XLPB/gmpID0IEL4enrDuhXd1xCCBbxLmoGa2jgJW1TP4Hf9qu98VX+OQzl@lists.infradead.org
X-Gm-Message-State: AFq9FYLCZuHpDqOfUT4FExhAj1+xHeE1+VSxcVILROhvXcs267Kr8aF4
	a/pOcWWhPl2H/1nyGQVYUsRhcqjFMur/6IzZ4tykepraTCl+deMkVDH7wkWUsWvm8ryhr/9zhMQ
	i2z1L2U8d0U/zcVksNAylyS32LxHq+SVBFasi0jYlM2SHN5ZDiOyKV7XkbsPlu/yaxCDNIx/t+n
	VUIg==
X-Gm-Gg: AYBFou31FPKPVHi2YDEK5NjplHag2dImn/769Zx6s4stWZDAJC93ngahuaHfoRYDyVR
	PRGgm7Y8p8oZMOCChL99DnEc/nW3C7J35tIbhb3OaVaPbHCTylfOs6MW3WbRUgWM5axjXUk16q1
	/0UVQx6KYJzY96dDYUex/FMji5btkdyXaRC2+Ijl6cEvI1Z8fjE1iVUuUi+iyM7RukEouPaRx0f
	eWuZB8MSbxuTwZ6c2A4jooBfw+IW61eIu3W5o9b0T3nZt6zRRqmVE6S46bL1Ed3sTIwLSSGzchi
	iXwb31OtcoP5+p5TKimqxy02/93safRycphBl0XS4mElwrFXOAZk19TrOJyfX3JRpDTkeKMNtGA
	rNMObaHJY5vtPVpEmJItXG04xV0LMugB9
X-Received: by 2002:a17:90b:288c:b0:3a7:eb0:119f with SMTP id 98e67ed59e1d1-3a8a0f259a5mr3398856a91.43.1791444948605;
        Thu, 08 Oct 2026 00:35:48 -0700 (PDT)
X-Received: by 2002:a17:90b:288c:b0:3a7:eb0:119f with SMTP id 98e67ed59e1d1-3a8a0f259a5mr3398827a91.43.1791444948107;
        Thu, 08 Oct 2026 00:35:48 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1bfbafasm3506674a91.11.2026.10.08.00.35.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 00:35:47 -0700 (PDT)
Message-ID: <cf4b63ca-adef-46f2-a616-01841a70b173@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 13:05:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] serial: qcom-geni: Use geni_se_set_rate() for
 source clock configuration
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
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-5-091697dbeb02@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-5-091697dbeb02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzMCBTYWx0ZWRfX8r7K3ywUofwX
 tVDqXyO0tez/7lj+1XGfU7EIpdbnnyaIgky1sYQ9tk0GfrwHPJVBQ06TQozf28VOLyCFMuq/vQO
 A5PJph4AY+QL+zIy4wv/RNWcsnlGNHJ9H8ZesF+wcegOG/wIaVRg7HQ2+1r5j9PEofQ0oopfj7a
 mIpFn0KCxPvA6Mw6bMWS1cUarH9Vs4tU9A/ENoyeFN1jE4i1OvugN2NZ1o1UVg43LZAwhjRhUWB
 PG7h/FVHSRpHVDS++/zn4ZNEypc8J9VVHGKC1Du+ezLLYrt2uqJnFi0RoKQXOX23H1MwtQesgRP
 knVJ3CG6DOvM2eAg7chWJUlJEngqz8k3oVo1We/NTEdmtYzaxTl71qgFQIUXI4hL9+fo7tn6ZCo
 8Zz/d1fhrmQDEqyIh5iTrPNM0/7x805tCBS9NKyuP5UEeWn72vnYxPQzaxYLlnvtJfHy2XvIwpr
 6MEWwh+EmwCFUEOas1g==
X-Proofpoint-ORIG-GUID: V-1-sfyOMHPJaVuwESVbz71jngULk-10
X-Proofpoint-GUID: V-1-sfyOMHPJaVuwESVbz71jngULk-10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzMCBTYWx0ZWRfX7jLKdnFbyY/p
 5LdJGhgPUDNFu0/+tAHdDD3M+2dAslozBIqdG7UvGLNFVnCD0TVzbXTjLUFrVPrPFgEssIancbj
 QHdHXabNxval2sRjRKoq55umsDIvVtc=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac747d5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=l2yqw8MAX8n28sf77-kA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_003550_802857_819212E8 
X-CRM114-Status: GOOD (  15.43  )
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

[...]> @@ -2039,15 +2041,19 @@ static void 
qcom_geni_serial_remove(struct platform_device *pdev)
>   static int __maybe_unused qcom_geni_serial_runtime_suspend(struct device *dev)
>   {
>   	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
> +	int ret;
>   
> -	return port->dev_data->power_off ?
> -	       port->dev_data->power_off(&port->se) : 0;
> +	ret = port->dev_data->power_off ?
> +	      port->dev_data->power_off(&port->se) : 0;
> +	if (ret)
> +		return ret;
> +
> +	return geni_se_set_rate(&port->se, 0);
Is there any register access happening as part of this 
geni_se_set_rate() ? i was searching but could not see after seeing 
set_rate() callback removed.>   }
>   
>   static int __maybe_unused qcom_geni_serial_runtime_resume(struct device *dev)
>   {
>   	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
> -	struct uart_port *uport = &port->uport;
>   	int ret;
>   
>   	if (port->dev_data->power_on) {
> @@ -2056,8 +2062,8 @@ static int __maybe_unused qcom_geni_serial_runtime_resume(struct device *dev)
>   			return ret;
>   	}
>   
> -	if (port->se.has_opp && port->clk_rate)
> -		return dev_pm_opp_set_rate(uport->dev, port->clk_rate);
> +	if (port->clk_rate)
> +		return geni_se_set_rate(&port->se, port->clk_rate);
>   
>   	return 0;
>   }
[...]

