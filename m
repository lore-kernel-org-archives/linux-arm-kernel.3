Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C4FC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 08:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/9WLhEJTgXWRjhzQHboMAkJhxat9TGdxV61Ba2hGvY=; b=Edn4DmA2nILkw/DzWwm8CRB8Fh
	BK+jdQXwQmafQ5JGTEeIp+qoEKimwW0vriaY8PaV6AOHT2PAWLka2zHkJSvY/YzqheLYgSZ17c1lp
	1RtxIV07rynEvcVeeTsfzMxxXL6l1DqpvO9s8e8AwRde4mokGGcVxOxL+m45Zdz6W8v0a0rSFgbTE
	zlz1u6X01MJg3r0aVqMVZRoFvbAawj8TXDYSbAZIsEhAxe6ZRnt9nA6Kz1E7pZUHIVXxPF+XIibgh
	rGBShUrM3d3vGgIHM9gqwCMy7iO49yHGLD/4RG2l9hC68u4G2D3NMf9FyBnZ9s/V4yNw5yNjgczGO
	lylTKoxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4k2-0000000FgPP-0bhj;
	Wed, 12 Aug 2026 08:55:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4jz-0000000FgOt-0NZt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 08:55:16 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C8YgMQ2934375
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 08:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l/9WLhEJTgXWRjhzQHboMAkJhxat9TGdxV61Ba2hGvY=; b=cL67h0iuMunP3Yqn
	+dKF8mXZ2XFnPGfyvHp1w2Ih1MY1WrOc6GqtrXdddlSD7I0/N47HFrp6Div3gJ4N
	KSf0k7v4+2I4IDFhcaTepJbDkcoV0eepRY4mCcUExPzizr1RZuCVaqtdzohIYdkq
	C4aobWj+TeBFiCVxLqNYUQouMenBZeDMXHXsWhzR//tZPW8TUGKKDIB80rQmCA25
	ZujvmJvrbpJtjiwR12Rs24X/aFvxhZSvEsQO4USZgnlEgX0t2cA5XejgTsQc9YBT
	Ad1nc5Wr4jv9C01nbuBtwEPSe7UWmUWbuftY/gnXRceX0v2IsDfI8M7CqP12vA+M
	4zclJw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g08jrk0k3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 08:55:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-381250979d5so939244a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 01:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786524914; x=1787129714; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l/9WLhEJTgXWRjhzQHboMAkJhxat9TGdxV61Ba2hGvY=;
        b=Qce4SR+QT+yo1Z7l6gDzSiTWYhGDnJSN6xXL+8oDBSYBEgU2+Xq+gHOMfqe/wIQm8s
         RAy5hi8K8FiFwqhMDt0/mJIzi/+aq4DNyoGlXdlyGXbluq/xLy1izi+/TwZIyrAUDS4u
         EMGlgdgjFB16JYIgY9gNGQDv3QUMTUQGW5cTka7tjMPjIhj5Dxwol7PZ60ANT7NBF9Nd
         mvlB70Y3XOU2bgNYLpNxCp4X4YfjY+UYWjiF61DCct6sUleKyaIHoABf8uoh9UQ9d8c8
         dudyfEFrDca9nCnMLNstO5mwMgTRQtn2+ij3XecIcqezaT45A8NAb2v6BkfwTjmmmMJE
         6nUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786524914; x=1787129714;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l/9WLhEJTgXWRjhzQHboMAkJhxat9TGdxV61Ba2hGvY=;
        b=ZabrTdt0oAEFFlfCSKKep144NWC7SpVfVfdbfBoRrv0FAhhaFIFycJeH6s2LbdL9tO
         KgT6LqAHHKwdIAOeu/s5JT2oQfM8fUWTOSIVHmBnX1Li4B3cCWk0b1LUjQjSTarwuunI
         UOvXnznWm2v0dV2wnXtoRpkzVbCZmO6ZaPdiKnCUaM+JA6bcSaym2MHiTMdctozhpJ5n
         p6GQRMlk9z3UZqH2eQeta8mG2O4HMk0IBwW0YXkrSuItH+Vsu1zy9Za4XAXDgpdPVWaa
         IsMuUXUprw8/sQNs3okJnVzcwcD1joDo+TKZMb9icYwQBXQiSoGRg01P2OTtOR0nsOJS
         jc4A==
X-Forwarded-Encrypted: i=1; AHgh+RpW7n8kalC5VZ5Cyej0IGEgHIvtxNQL2KrbgYF9IhzzboBxMl9SZs0Q4lJOCD7ZKu36dnWaKrHAiEhCih52gD9I@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9chWsoa9I8zPE353VHbCd+8fVve6m2l7deaFE/qBxUUpVDXfR
	+UF7LnQ2U8ZL0+cFade7Dhu0GuTKSYTSSFCOFq33W7X7VHiJQpfHhGhhK9fmP10BlRrUH8Hk7Ux
	Jlv78aS6R52AuCfOIyLjLhsz7iHoelwVORpUQ2lKzs6o154ovDJTQdAq7xsG6jwU5BxfNXzcluR
	Xzxg==
X-Gm-Gg: AR+sD11AR9qwYmwNIxHuZ/qhzzNVQ1iICWjS0dX5NEb6AIgKq9vfabUdLlZbAF4vsCK
	yQuzhYoMjW9nKkjxO6+TMxMNIHNz4D+FnPbGn1gT7a62PwP9G4NWlak9jEppzRBuCnJBUMc/+Z3
	9Ug6y1fuBdH/saE1OIu+/pF+MLyqfeqqcTb94tDiyisY5bp90lBo+DykqZ2clOFFMVlFkMdpm5u
	4+1hdTq3RG0vzUjEYGTXyds3YlbV/+pxTE9NSq5k3AsjAC1Lh2htPPLMU+TApG67LLel2ZkGf/z
	of9dDN5RqYvuaxBBX+fWFr9UG8KvdiEHKLveBlWyXlPX/DtoV1ted4iuYzn4Fxm3i6UVo9k13eU
	UcGFTmrrnO5dLSSEXGEQU/Vy7VcbW6x7ZTQ==
X-Received: by 2002:a17:90b:3802:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-39301490a5emr3605665a91.11.1786524913679;
        Wed, 12 Aug 2026 01:55:13 -0700 (PDT)
X-Received: by 2002:a17:90b:3802:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-39301490a5emr3605632a91.11.1786524913227;
        Wed, 12 Aug 2026 01:55:13 -0700 (PDT)
Received: from [10.217.219.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f908a82bsm2808212a91.0.2026.08.12.01.55.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 01:55:12 -0700 (PDT)
Message-ID: <de19d0ac-3b3c-494b-a3da-028570989bc7@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 14:25:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] soc: qcom: geni-se: Add helper to set SE clock rate
 via OPP
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
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-3-61171ab1cdce@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-3-61171ab1cdce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: W62nmm-KDAs4UoZ46wqqS-7I3TEuUDdC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA3MCBTYWx0ZWRfX+L2IMXRn4h7o
 HdAeWwi+W1sqCKp8DvA0uBC6qUmwL+Po8HtulE234PM1mztGbxmAA2sGTYZTT9ga4JsiWeP1gpJ
 RPT20mUjrTi+JBcqdTubarKxdEj+4Oo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA3MCBTYWx0ZWRfXzuifUbfnw4Nd
 INVb7+FvqrxEzVSwa/Sl98jOvbYmBDcr7YEK5zIV9IejJGlPvfJxmDVgoO56NwURRXRKTYfYeOr
 Q3lvZxpERJy+EBgFb+ieqf1RAyC4QgkyBx9zRwVIqCxX06hr5j4IN/IB4f2Vuc9tl+gPyQrxG9f
 GbkAGyAwXxAPTwyBY7vX1XqPAxXpJxYfE/CnOsWFQAqUV209auZSorgYkSzMIN7TlSCl9ok/ZEW
 cVYpJgDjW9ZgttHVxnWkTvanb/k6q45Vw3aFPtJsKJx86mNP3MCxsZlEbyLzYNi0JeHhMybMMG+
 fjTnGJ30RKHUKZXKrdUmcadVAlRjIZjM+5LALN/nFfKv90duP3QV7fLgiTsZ6r+KSYEoSzkF8o9
 gJIq0zyGqbYXrDjbywnf+Dpoiedqe1pDM9Uimg1M8OyumXBG1bTn8hGhjzEnU/DHJLNk3U/53Vo
 iuh8rKZP6XFbCBRC9MA==
X-Authority-Analysis: v=2.4 cv=Z7Dc2nRA c=1 sm=1 tr=0 ts=6a7c34f2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=9aiwZt7zaXvVnErAyWsA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: W62nmm-KDAs4UoZ46wqqS-7I3TEuUDdC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_015515_310203_E20456F6 
X-CRM114-Status: GOOD (  14.48  )
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
> GENI protocol drivers need a common way to scale the SE source clock
> through the OPP framework. However, the device that owns the OPP table
> differs depending on how the SE resources are managed. For Linux clock
> managed platforms, the OPP table is associated with the SE device,
> whereas on firmware-managed platforms it is associated with the
> performance power-domain device. This requires protocol drivers to be
> aware of the underlying resource management model when requesting
> frequency changes.
> 
> Introduce geni_se_set_rate(), a common helper that abstracts this
> difference and applies the requested frequency through the appropriate
> device. The helper automatically selects the performance-domain device
> when power domains are attached and falls back to the SE device
> otherwise.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>

