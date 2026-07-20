Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A585BC4452A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 14:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wi8nWkpM4EPvZH/Ahz97hAxk1CRSJa/tutJQGZBgZsY=; b=OfWei+QnBE5QNaujJQkqkSvbZd
	4uuKLfs8AU+iJZoC19BBV8avw69k0YIUSWfNgaMMSVkJRfs2wgRVeiBSeC3VzEhW9qpsot1gRHbET
	joIIpNxSQUBQDnc9rL39oV8KvGj32qp+AeOzoYqqqyA6whZgT21y6QhIsMq2o4SPNSdvDrQGfHTTP
	7Bohnj4MWvLiSFrY7OHs81BbZ3xtYBgPT9N39V1JowlWkALTPIKoxrTzJpDGHbJCKP0jndXyu3p7i
	B40M0r7zqRpimOvmIIx7rO+scL4pF9JZTTl+ndd3JNyFvkaxK84B2Xy7RaNO48MYCviQr58iFyldy
	uG4QnqzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlp1J-00000006yYi-1Dgg;
	Mon, 20 Jul 2026 14:31:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlp1G-00000006yX5-0Fuf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 14:30:59 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDqw4x2852834
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 14:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wi8nWkpM4EPvZH/Ahz97hAxk1CRSJa/tutJQGZBgZsY=; b=YBR264JovU6bj+n5
	ZZIsKkJr0jbtad6tDlASI5VZ571TIzXlD18SdiUlw0eRlLgkNWo8wUq1ecZHt/SL
	roQqX1miRKH/kQF+RWnlswyXD4lyvsfT23CmbUMIn9a3+d5PuefpLWD3KxIGMKfj
	1hxZ6o87eclAgutH21e5/jvkTChbdOzYYXJVg12KtlQxe6sClkeaDrcys2M1XMdY
	QCM8BxXtqpnI9KpoaEwgbUtymxkn1kY+bHGPfo9senkEYdjXOHIcpujDFG5Fdx72
	CQ8mncISntyGT8YRZwKueoNmQ5TxrqeSNpYSvriJObMvfaKRgkjgtT598DiVsBks
	hXKOCA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhhgys48y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 14:30:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a87ef9713so53371421cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 07:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784557856; x=1785162656; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wi8nWkpM4EPvZH/Ahz97hAxk1CRSJa/tutJQGZBgZsY=;
        b=HsBT7G+RuA99gNHclVRZAb4FI8FZwQu2nM0Lxb2YqeeRdwkX0OUqfiH46+AFo2+clx
         K7rLRJ/uiob8vU10ZLrOajyBlzxrL90JPYd78H/pcrdZghAoy+bwbkSTPCn/JRgPbVA6
         h1mU1/Q9seunge+UduEpqCi4vbYzRDa1WzxD/J1O60DZSIP/YRmcdek2vquq7iuvu2ZH
         k89ZIYJjB14R8dfx1xdyEyat0FyBF+ISywEfxwcPSfeuLk5vx83Ed6HJgfPDM/iFNZ8S
         N5vqaY+GjqIMroDO0AbnJ3RN94fVyizfYOeBaC6FmI6YghLm0/XxjAi0W77FqOfWzkD/
         ObRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784557856; x=1785162656;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Wi8nWkpM4EPvZH/Ahz97hAxk1CRSJa/tutJQGZBgZsY=;
        b=NB3fXEv24POjviLytlPOemsSuwqLX8aUu3Un4IjE64fNL4KNwcNDwoWe9DZ2W8n5On
         g0UlpQd2gRaM7WaeuPSVCOejhuVQShx4D8d2Avya3kPZDgMAgKCI552S+BEHZrS4vnLf
         LgJ9M8WQPvIJSU/hbYV7p8iHdChASrzGvi3+xqbjUtcXwNI8v4DQH/3sYiE1KzV/t8rZ
         70i+oQ64WCVfk5a/CC4fYHI130K0OsgGC/7MVXwIfdEACSrm142Pa8P37WeGjqfo6jWg
         diIpoaBo9PeDHwoAJHjxJBowyg8vzguAgOYc006DoxqliOO+9iqpwk6brNMKv7n9R6Ed
         e0pg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7d2UcyR7bqXw1KYLKzWynvM8JY65yGvBXyuRRyDuy3zxWAMA5iSgx4fjS27Wxt9Wf3BjKB63aF0xEoFp/ahP3@lists.infradead.org
X-Gm-Message-State: AOJu0YzdkxnpMVZpQb8p5TepdUnuS3oAymzSOTujrrut/uSxvD05EBAe
	pdxt/ERrZWiQn6viWOVHc5uWFWFEwwJtkCc91zAU2qBtjKcdqXGcQlZesQQBh9GWP3W8sHvj3Un
	/yJJlx9lodKKOzTVCdVf3W4wln9PygUhjbu9hKVYB24qxJCCHMocIVoXuC+4KZVUFZ+hjHiI32y
	tSFw==
X-Gm-Gg: AfdE7cm+KOkTFYftGlmcWzM72442gOpV25mXVzAlK4eSBOvsIIdGwcEr2GByETKn7oK
	AypXJJy67ym2QZV2zeY3sHzd8t47nbfGA89/ry+E1i/TW+iSTGoV+cEGJUAYWoxvgJOowWIpMP2
	iXm/BDOVOyldvVeLRuFQwJJiiKu4Ca8bZG3Ey5eowVDeHQ8cDG3EklcbKdLV1irVESrIXDdU/HK
	ei2u8ldFfbJUb/5JRSJMa0b/SnEWlth4mskB5bnN73NsTNHiiMkK063NTn2HLT+Sly2wvjI0Uhx
	qU8uJz5XxMucblt1noTjGL/QHYqqSpJvxkM3KnOGDutkD11cYwBZSh1UBSM5aDvRjzgnE4SnR6A
	p01975L7jxRuLHWBGPrjL/zpdOZG+l31ZBGRmeclruCe55pBYZOIqwS1wkBTWe4pOPDVK6TnY0M
	Hja5M1kedApHm//Q==
X-Received: by 2002:a05:622a:1b23:b0:516:d83d:b28 with SMTP id d75a77b69052e-51fbf8ba886mr173938191cf.17.1784557856155;
        Mon, 20 Jul 2026 07:30:56 -0700 (PDT)
X-Received: by 2002:a05:622a:1b23:b0:516:d83d:b28 with SMTP id d75a77b69052e-51fbf8ba886mr173936141cf.17.1784557853828;
        Mon, 20 Jul 2026 07:30:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291d98301sm2365292e87.25.2026.07.20.07.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:30:51 -0700 (PDT)
Date: Mon, 20 Jul 2026 17:30:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>,
        Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com,
        linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Thomas =?iso-8859-1?Q?Niederpr=FCm?= <dubito@online.de>,
        Simon Wright <simon@symple.nz>
Subject: Re: [PATCH v4 7/8] phy: rockchip: samsung-hdptx: Simplify GRF access
 with FIELD_PREP_WM16()
Message-ID: <al4xGODXuxs_DQwg@umbar.lan>
References: <20260612-hdptx-clk-fixes-v4-0-ce5e1d456cda@collabora.com>
 <20260612-hdptx-clk-fixes-v4-7-ce5e1d456cda@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260612-hdptx-clk-fixes-v4-7-ce5e1d456cda@collabora.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE2MSBTYWx0ZWRfX/qqUp15Kil7L
 Vpm7UUUF88a0vWMxqbCd7aj7cgoCM4EZ6q3uJd1qae6nX6y7BU60zOHyq66IUZgZ7hntT7SIbhw
 YQ2wl5b9+ZY+9exhk3/czVxUv5A8xDY=
X-Authority-Analysis: v=2.4 cv=LK9WhpW9 c=1 sm=1 tr=0 ts=6a5e3120 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=EPngckNM3keSbOuRnKsA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=zZCYzV9kfG8A:10 a=dawVfQjAaf238kedN5IG:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: 3tdh3R0KpWQgZyRF3uMTE2bvdsHmUjg9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE2MSBTYWx0ZWRfXxTRVd/I6By9c
 NbBDvUEiupCWJOpMqj6Fnhbtr2dTcOrGX7b8Pe3miiSL3/lPC1WyrdExGot45+RqnrYdqVOvHVM
 iXSkjn/iRB5J+y+awfIYcF0EbKOh0GusM+25KWD8qeTyMJ4iv2ik1KBcG7EdS6vdrMUgDOvJqp/
 tZAPcRw8H1wfwrwkfTAZGw+0V4kteZUUIhCULLIeA0lWSVULLFM1WFhmKoYDTJf2PdhFanfg1T2
 +Pv0620DjZPL/TTnMlrR3UCmF/mUjcGdUKjLGY2I4N1b/qVVTDeV6mlbREwajQ7eKgxeVzRsesv
 V6xfhKCDYJNWJol95mPz22MyUu7pGttED8CQac+qSGyrtq9cPFDPqNIDEJSDhbz4WwBLoyjMwv5
 as/n1gvvcD9IYRK/gex6JI1SqU4uLdjViKMD84ojJaD1/tUjiu/avtqpuAXx25VImw+9XA2eVMO
 Ojc8CV4k1y5C/81H77g==
X-Proofpoint-GUID: 3tdh3R0KpWQgZyRF3uMTE2bvdsHmUjg9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_073058_208627_C60F2347 
X-CRM114-Status: GOOD (  14.49  )
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

On Fri, Jun 12, 2026 at 02:45:26AM +0300, Cristian Ciocaltea wrote:
> The 16 most significant bits of the general-purpose register (GRF) are
> used as a write-enable mask for the remaining 16 bits.
> 
> Make use of the recently introduced FIELD_PREP_WM16() macro to avoid
> open-coding the bit shift operations and improve code readability.
> 
> Tested-by: Thomas Niederprüm <dubito@online.de>
> Tested-by: Simon Wright <simon@symple.nz>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 52 +++++++++++------------
>  1 file changed, 25 insertions(+), 27 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

