Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5FFC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 08:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8f2R7uAkkm58Igw9twxKgRRf+vTxm7dlB/hN8w5EL4=; b=c+ot1ZUHHetWovYRyqBDBvKtVM
	CAFdIVdEhEnY7QD7CcA7FLmxpc8OP2o+pIwK4SJJETBnjEbVYYz1FUs2btxSj+c6dRyBhsGFvRWJn
	nnLN0XxkqhbOtmncAPVlBqQ6/xZwL7MpiQSmaKTpE2GjUripN9a+Pc3FnF7dgN3qoLjBInBRH90xD
	oeR+147GovNTbT6QHUfS+BSEeyd3RW6ArZ+rSCn/XI8bN8q2NbEG07hH+xk1mgCvv+iERkLCTM2x5
	MRjljtqshfb3xaICoYcVwCaTIJGQijaum3bXAAR0GEXdGnagnbvDbDlbdQEmmoa0dN9HQIyFZYKfZ
	KgbfFL/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsI3-00000005cCh-1ay5;
	Mon, 17 Aug 2026 08:01:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsI0-00000005cBz-31RL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 08:01:49 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H7bgeG788733
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 08:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E8f2R7uAkkm58Igw9twxKgRRf+vTxm7dlB/hN8w5EL4=; b=X6WqELsgDmfc817u
	RWHmT88QxmrDY2V5cXRZcxKWIkOewsmsSD/kA1mC4v6EQ/0Y1A+ftbHNQRXAKTSK
	V4qUO1NkYHUVYS1Bf8eZOSgym8wfIScwiJaIebVhsuhyHsWK0CxGsdK/K3+l+g/8
	xsUAuHjHE5/SJsclPejggLavZ9d1Uy5WJs7lGb0jdw+uwVfqZbRWGx5Av6sQOmNX
	Uwubv1SnfZP2qVMlQ5l81b9rKoU/7TPDDKOn+AZunCkf6fTU81xhBy+C8ggJAglu
	qkrS8GSJIJbNDMUEM8J+NzKq11Pw2LB6PFrD3aHLASPG039fHsniRu988oXGQTWt
	wwSU4g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3x30g2nq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 08:01:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52b4f6ac06aso58079451cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 01:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786953707; x=1787558507; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E8f2R7uAkkm58Igw9twxKgRRf+vTxm7dlB/hN8w5EL4=;
        b=GPgb60mXWBD6+SN1mw00/G+nO5EsVjQ0aX62jwW85NB6j1S3o9fCyKYXT03wqD3zt4
         flCt1b8ZvBZ/KvAX6mx4biDQPnqUAM44EJFm+JLUCWNOr8lBmXWtTY4mi3Dvr+m6oasY
         5wxf1XShxCrgb1mYIkHqvtQt+aM5pEAXM3MjNUm8xeO6FCx1grN5V20Cs70NTK5we0Dg
         W/BhIMZX7lpIbcgJGkZxwIZIdGdnpUxcbZfH0FqpHM8/PZs4Z9Bs5lpHjUTgC14chFGT
         hXTSqHc1csTAybjJovi6nQNtVT6H6dfKWq+AVrmSjl8/Vmucw1QciPFYfPn5gqF7GZ1z
         j3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786953707; x=1787558507;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8f2R7uAkkm58Igw9twxKgRRf+vTxm7dlB/hN8w5EL4=;
        b=kfCU5hIhV4KiWdLBQG5Ia2XZSYNlPI9XajCs07tv5j98M7Yg4w7qxCwl9XKHLNYP97
         YrQs0nELgvAIjviooLatokhgwIEfzpv2S2zrY4XWcPMdLtKn7KcBwGJ+rke6youbVYX6
         tXdWxasq2j6nXuV6qEHkU94B9k3olX1qD3FSBg2nnnvZMyImn8+rp12h3cHHGyYi7DFw
         GkbtVslN+AJIRITJyCrqoKtF8My14emKfnk1H3L62kpbQ4GViDMElsmjspEAZpi8Vr/g
         +NPQHLbtIKtJIUkOPRc9MzR5jm0DeuCZYVAmEJa1Cm8k36Kg8l61Oj5m2NT/6wcHRFzp
         cl1A==
X-Forwarded-Encrypted: i=1; AHgh+RpmBwcS7ubJmqFuvJjgJA0n/+Zbe/zO1pr80tdM+K1poUR9O/j0RkMaUB77qltGA4Y+pkPSXcP77S/H+PmvKntt@lists.infradead.org
X-Gm-Message-State: AOJu0YyK48QA4Op9jyQrYz4sxIAZ1+11CQhNoZBkEVfcuyqd0a8xks6w
	0oPwCjka0rRtQZvBMEkHMwPHH8mHGg6DPSkmZ35amywzQ/XC8A+nbZIgbnzlusvkUlkSgiaF7rX
	wi3nwa8IIObwZ7jVYmb+diXKxAOkFlqrP9KUztytE+L1nXlfi/AGi/ZSyXZ4I1OjMaEBLbkJbj2
	OBaw==
X-Gm-Gg: AR+sD13KGMbAif2mjFihyw5u8LkmJC9MdQE/I/gFJN1pklS9PmxR6qgYQY/L1oFF0aL
	qGPx0uNvtn3pZLy8r8/6LqyJn6iKzfarA8Fa1nRwf1WYb2H+gpIIJCfMoSjp4bEJAjrNTA7WSmy
	rerNRJjtooGymNhUBiK/txQ7r75IYaCDzGCBJrwjvmkyM6S48M4vmsGs9qOgXVH043pLV46n4UZ
	WKrgrGaTuc6ww9WCeXDmK3wtbo9+g6zaFrZunKKvGZOciy3uBAkQC75jDbSDgyFAh+az2wA/8jj
	gyG7YHqbRquFWAsQoxynPoafeefyzXgDciO21Z3DgexUL+3oubpD9tNYClG6lCnNKyMbtNwpvJ9
	qGgS2r/oXw16ZXinodwXFvgwh7eepu5kzSqC5pehagS4TowYtICiH83pgs/vJYVWirg==
X-Received: by 2002:a05:622a:1341:b0:51a:8b64:69e2 with SMTP id d75a77b69052e-52d8530f131mr247367901cf.7.1786953706645;
        Mon, 17 Aug 2026 01:01:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1341:b0:51a:8b64:69e2 with SMTP id d75a77b69052e-52d8530f131mr247367131cf.7.1786953706112;
        Mon, 17 Aug 2026 01:01:46 -0700 (PDT)
Received: from [10.111.162.109] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52db612c2bfsm8319271cf.11.2026.08.17.01.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 01:01:45 -0700 (PDT)
Message-ID: <96344518-c0d3-4424-804a-c315eab3e39e@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 16:01:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/msm/dp: mark the SST connector disconnected when
 MST is enabled
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-5-646a10256233@oss.qualcomm.com>
 <sijdmdhcbxyg23gh6c62hspruvbnyqbdrtv2er3bh6n6ftolsp@b6o4khv6dofc>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <sijdmdhcbxyg23gh6c62hspruvbnyqbdrtv2er3bh6n6ftolsp@b6o4khv6dofc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA1OSBTYWx0ZWRfXyNI7KSwWplIv
 smxMveJyGuugGdtB+/TdPZ92Cz4OUbo3iTTHIPX+w9kXSOqoOtsMur4BVb1MVO8UmM7wWiGgHiH
 sYEYoMxwjdZxsfXEfzjXQf7d40A471coYqDqrYVINfV3MN20ELZptdB/0dHYIqDJYfbMXl2VBuW
 8h4ejkoB5ymuswOcKy+BTcsEtnmLWhLxm4snxmwrIuViN+XL44fij9fcUTWKK8KOchDdBayAWk1
 ly25f06GOqfi78sJVkRBiED46m/al01E1Nu8GT8nEv5pL28p/bS8IeMSLtcvGSe50AHrtwAe0rZ
 N3fZtEwRh56HhU2GYBbq5+uEq2wQY626ejBBYrpEPfvmATEx6F66imMMU7uelhCnXoO9ZmQCBzI
 bgEBdY6qHQ5ynWWDvyvuVOkdWrZLYxURp3yu+27uzUFKZxynjSGeaoUYtG5VZFMWHyICN/Sp3BO
 H5192XMnYPAqhqSCb1Q==
X-Proofpoint-GUID: I7n7WqOh2G7Wipscnl16OMvVtE7t8oSX
X-Proofpoint-ORIG-GUID: I7n7WqOh2G7Wipscnl16OMvVtE7t8oSX
X-Authority-Analysis: v=2.4 cv=Y9/IdBeN c=1 sm=1 tr=0 ts=6a82bfeb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=bLWUdw4gizuqmWSpfScA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA1OSBTYWx0ZWRfXyKwwAt5ijjOL
 9rJH0d1nIju8K0WgWqtt5slODswlDVXJsLhGOQuE1yd8JtSGSn+/BomxIelw+YRqoVcppmBuraR
 JgKrP91xB1im5kHWmEmgZ0lpFj28jLs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_010148_779575_5EA34298 
X-CRM114-Status: GOOD (  19.76  )
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



On 7/12/2026 6:56 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 29, 2026 at 10:48:07PM +0800, Yongxing Mou wrote:
>> When MST becomes active, the initial HPD plug notification updates the
>> SST connector state to connected.
>>
>> However, the subsequent SST connector detect path reports disconnected
>> while MST is enabled. This connected -> disconnected transition is then
>> observed by the polling logic and may result in an unnecessary hotplug
>> event.
>>
>> Set the SST connector state to disconnected immediately after MST is
>> initialized so that the detect path does not introduce a transient
>> state change.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 4ee391cc7165..f8ca60d6d714 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -352,8 +352,10 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>>   	if (dp->max_stream > 1 && drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd))
>>   		msm_dp_display_mst_init(dp);
>>   
>> -	if (dp->msm_dp_display.mst_active)
>> +	if (dp->msm_dp_display.mst_active) {
>> +		connector->status = connector_status_disconnected;
>>   		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, true);
> 
> This should be a part of the MST series.
> 
Got it .
>> +	}
>>   
>>   	msm_dp_link_reset_phy_params_vx_px(dp->link);
>>   
>>
>> -- 
>> 2.43.0
>>
> 


