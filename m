Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E4BCA600D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 19:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jb2QYRx23fNHLxJQ4komYZKPnagAt7gtPXM7krNr7DE=; b=UmON8TTtVxFnll2OMynQF+op+y
	+mfMokBklDG24vKhwQ9xgrcdK5mkWs69rWd7NvOnXGgWDYceXwBcdHSTcJWnlBc3xzYqbMF3Bob4Z
	qg0Gi1dkE2XBXVuQoOVvdaM+5fTVBs6j5N2TCyLCxGy3UcBaom2ohfRtPKAj8BgKWFjfGAQsp32VX
	NgrqdjmLCN8u6VYr8I8WFdHdQ8P2CgxAucvVE53avjurWmedNO3QM4PM9VY4hX6NJ2Hnyocmef/qB
	YMDbXhC5X0gLfCnZI0KqeZIr6JdT9uPRC9ysymXGD1+3VpG61lD67/gLagPdzBN7sYCr2rT7gq9Rq
	CfQy8SNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEu3k-00000004y2U-06uE;
	Thu, 08 Oct 2026 19:45:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEu3h-00000004y1y-0zZ0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 19:45:42 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698HrH8p3563353
	for <linux-arm-kernel@lists.infradead.org>; Thu, 8 Oct 2026 19:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jb2QYRx23fNHLxJQ4komYZKPnagAt7gtPXM7krNr7DE=; b=jfD1vmY56ONHOBmP
	X6r+b5uQuumr4j3GXxzT9masxHagH4dB/UtE8UKFF4Hb2CWaW/ZPEhdj3fB8YDEJ
	hXuEhvOqYSux4hKQaCGyFrjimPTax5zA5XG0whEo91qQw3xC4vm6wM2HYLstMZmy
	R+lELEbP8pufCors9y3dVEdJwXoOGgkuo7soUvdSa3pQ+34r92oR3rZpyFyOTaA5
	Wj98cnRktpmBxBwaI1pmAhYD06mnoEg+ZxgMeqNDG8K80gHSiPRvazv1NszL9Xm7
	TbA6+WSZ4Hj0HlGxNAxiEgONywIMp/d00DYwMDx9zHSzbAXHluwYzUYv+W9wgFhh
	nvhdRA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxk8ch0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 19:45:40 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3515d2fc5ebso8825018eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 12:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791488739; x=1792093539; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jb2QYRx23fNHLxJQ4komYZKPnagAt7gtPXM7krNr7DE=;
        b=eXHycrYytVnR/OZY+2WG3gQdckf9xM+pydUCxo8z3kNfqjkG244/67cH4AfIEIgH71
         lPGwGOZvspi1KvLfSPSiCwJjAU6zo3PZqe7hM72HVYSHOhl/SSgj+2UGKxMjSZp2mA0y
         aKaLdHzUPemC3B7MBpGePAc8vnoZwMzPF0p88pY8pLxUmuGXMFf4Ft4xwNtEm+BjoRw1
         pyEvWjCE5oax+7qOZTBs0BhHxhaoML3NbBBCnwTPxznw9dCd8DaFqIyfvbXcb2ZBAWQJ
         tMY34nCGWk34/ynU/hGM05IT9I6om2unheCPr0YzA+wCD2ar67tQbEQHuscD/ciPmLnT
         YhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488739; x=1792093539;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jb2QYRx23fNHLxJQ4komYZKPnagAt7gtPXM7krNr7DE=;
        b=SOzYjLZA3S28jPFJpoNL2LLfobUGto/Ys8m0rzSJqOG+ZYmsUzNj5UJLj9wUqW92N1
         JPs/PpK3+znv7/s+IxEhdAmKS1jM7y9fm+jY+6w5HRMUNY5ybNTRGUz1ilPoI4fllQTI
         NwPEkfoTJ27qZNNdBzqaJhJzGKt9YLHw9Pp5qHZznxkle6mgJ1iMK1k8o++ovrdumYsJ
         96p8pAThq1OJj3tpxtQSt+zDZl10phHFhF5HnZid9/A8+FRXNto76CBF/ki06n2S32eW
         6LEuExeBTbNnS29bdeujcmcLZIWkF6PTByNor+gRJUFiX2FkCI7LVjtz5XrZ49AeqQJs
         vNzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMMgk74SVKsRxrs/qCfW4YfpAFGvb73jyT4qYqGH+ZdQ+qnvIeYEzsEyKWWiOHDo/hF4V38BJE8yChiuT7oXxr@lists.infradead.org
X-Gm-Message-State: AFq9FYIUlJYWRIpVN1BwvUsKm5KCb5PUzqufw3VVGLRMfDPrxcfXLvlE
	9k7WcY88sZPqiWEHr8FsIHMHjVBIulB5FD4gzoJ+sQxxcGl9Y1mCSdqTg3gM271li6UVc66xJ36
	uYj3ETiX12czRKRyptyk5ZhnMr0iQfPNgDD6LRlEpf8GRkLN6mAIRY+yFkCTU9+TiUqXaGNKzV4
	fZGg==
X-Gm-Gg: AYBFou0uiCWdSKM3wL8Bo9EBExmzFnL1jSMvwAjHe/uU5HZjIJSrdpO2EpklG5z59It
	/FPLg5JWhIzLFXPBYOyER2jxBDP/j3YqLXnjh6Wtl6K0vTloDYmlYS+1c6xYHkUEJYZvmmBqqUy
	BF2jlmTnNCzH9XKJPcV8/hMVyNOy+GhHL7HIOTWrGwCHTRsvdouJygQzti/cLBs4SueOdWk7NSr
	uqICsmKvfa+2PPSD0kFdrmLO+LO7x0DobAgPQwEMJj6YYIjuVJnM+/VkNANAB+p97w1kfgJT254
	uZCxwxQHQAlHkAxxNb/+BNsUwoCmVIXezC1IK8XIHfb2RMVqlxTA6igcxpYU18vVmDE3rdx4pHp
	lvFDCzjiFG1UvRSnRd5xJMs/7ySi6n1KKcA==
X-Received: by 2002:a05:7301:5414:b0:352:2e10:10c3 with SMTP id 5a478bee46e88-3535f43829cmr468320eec.36.1791488738909;
        Thu, 08 Oct 2026 12:45:38 -0700 (PDT)
X-Received: by 2002:a05:7301:5414:b0:352:2e10:10c3 with SMTP id 5a478bee46e88-3535f43829cmr468256eec.36.1791488738093;
        Thu, 08 Oct 2026 12:45:38 -0700 (PDT)
Received: from [192.168.1.2] ([106.222.229.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm277985eec.9.2026.10.08.12.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 12:45:37 -0700 (PDT)
Message-ID: <dbc848a0-c963-4715-a3c1-7c669142d28d@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 01:15:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] spi: qcom-geni: Use geni_se_set_rate() for setting
 source clock frequency
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
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-6-091697dbeb02@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-6-091697dbeb02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uK1btYR8JIaJYvHAbzlk0NOVRSOUrCRx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA3OCBTYWx0ZWRfXwpvZDsC3/6P/
 ggOGfGeqCw8/ZGY3BRVg0hcmyuXcEdyHyESufZ3YMF4wOhS1uJHCso3+gWz+g8KVmFng0DODzTu
 RlZbJSqbEzuzczyNEt8osSc86fL4D4U=
X-Authority-Analysis: v=2.4 cv=Cs0q4X4D c=1 sm=1 tr=0 ts=6ac7f2e4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=soJen2uxB0ky/kNk6TDY8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ld924GHQG9e8gPgwT3gA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA3OCBTYWx0ZWRfXzMcQntTxwrwp
 rYEEn3AzFVLfS+vYtx6PM9qOE2P8mFE2np/CKgEiI9EJgne3JtmzLpnChzSQinZnM7NQMptkNda
 G0owtCVxgx2r5rjU7AiBiKxYworquHM25YnpZmVZWxUy+J4ZTplNBJpdtrsCyffiIbYoLbzztKV
 5Ho0BG0Wd8mha+zUo0SWH90f2RYvCio72SxOPTGDXdzL7urDKGUJqFmPzkvIIrS3GSjU7JnCxu7
 Fq9MyhYXSfjiXRK+CcD8242Aqx9S5BcS6XGtx+IVWJkaaisiCw+7WV0l+zqAgabQApluJ6vTqwZ
 tBh25yd/1Xpe2x4nTHMMuhjCSgYphQfxQMxWnlzh2AV9yuRVLCWlq/Z8g1hYzN9MSCEqNuE/h57
 +s0TikaOAaTJJMvLYKlW4BwX/mP8stlADqtdSHJWnXDFSk99831J6PAkiRx4ebmAPGZNo+NjTGl
 2SjQ8xaGxpK7fz381Yw==
X-Proofpoint-ORIG-GUID: uK1btYR8JIaJYvHAbzlk0NOVRSOUrCRx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_06,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_124541_406053_8C93E901 
X-CRM114-Status: GOOD (  13.96  )
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
> On the SA8255P platform there is no Linux clock handler for the SE
> source clock, so the driver has no way to look up the source clock
> index and divider needed to fill the GSI CONFIG0 TRE for a requested
> transfer frequency. To work around this, firmware instead exposes the
> SE HW supported source clock frequencies as OPPs on the perf domain
> device.
> 
> geni_se_domain_attach() now populates clk_perf_tbl from
> the performance-domain OPP table, allowing firmware-managed
> platforms to use geni_se_clk_freq_match().
> 
> Use geni_se_set_rate() instead of dev_pm_opp_set_rate()
> so clock programming is handled centrally by the GENI core,
> independent of the underlying clock-control mechanism.
> 
> Acked-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>


