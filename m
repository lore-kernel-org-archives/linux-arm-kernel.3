Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D237E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 14:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eAyJ5LDtoXr+1R+ZVuoLrayqlcUgbaIUJIcBcCwtzkw=; b=k9PZIglAeOLg7goUqc1VZTk/1w
	IbRBd3/WPwflrLKFluknygdCUAkmccIYK7OKEel68xGMnpN+tC8gUI1kNFwZpNjXk7uwUF1pznPeF
	CMR04P8Ug5dgZbJOPMWDJ/jrsafiVxTwZsm+tn1ueavmG/W/FX7Sj1aTB7LT+5UNx/+KBv2vsV6VU
	FHCfUz1aaeMIb+O+r9A5viPal5zy9BvZaVbgya0I0o7tMZmGuWhfroSZM9DjdQzmXJ0v+Wi2KyPzs
	Aeh5eZrOU4CtDICHIz/reUEft/nLCUviSjGZJfqQXCid2o/6gegYXw030QMLJN8h/FuAs855O/DK5
	sw0RINzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVt8N-0000000C9L7-0Sae;
	Thu, 09 Jan 2025 14:03:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVt7A-0000000C9CX-0xkI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 14:02:25 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5096qTA4009780
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Jan 2025 14:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eAyJ5LDtoXr+1R+ZVuoLrayqlcUgbaIUJIcBcCwtzkw=; b=FdUmjlZvggS7Oe2u
	eWeHYu9/JhXbWVdJrxFflobcKBIO3dcM0qWBLc8q+Vv+XLw1dwLf4hsA/XpkxOpb
	vzZOCYx6HqekF8re+AN/ZqLyzgHTWJastHp9eP1ot5W2jXDA4HgkpqNZOblNYava
	X2W7K7GVNsKvZkvmmwKA9S7NK6vlCDCkIqL39JAmR56WMxpPW2u+JJq6PfwTVxbf
	Ah7R1lJU/xAD1nWZWhkgR91SyQhVm7KEv8VhpthSK9I5ENfDnZReJW4gku6NMFgg
	4/jSRyHHToLYOadscWo6bG73Y92cqTcMsBvSFGL2e/gZkDLIDAA+gISTWTq8tke0
	nFkbJw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4429jt90cw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 14:02:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-467975f1b53so2292071cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 06:02:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736431341; x=1737036141;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eAyJ5LDtoXr+1R+ZVuoLrayqlcUgbaIUJIcBcCwtzkw=;
        b=K2YPmGkx+nRBQgTTxWlQqGmOStMLGVGI8R/CXA9fIYiMlorUUKVnwpYZuM7t/6c54n
         YFwh6n8eRdHetCZFXtoKOqKzFoQ1xEGGGTD7wXDhwkmSxhq4EFBJhn11ahMc5BJd/MgX
         tBg+iklVsbkTMCoqOblz3owmVi8p7bGcJP/FthcacCRaxCZW437+rWeZ4FpcKse4Oxf0
         7ezg0/yUIzYJqUoUcRwXlVrJovwRBxvetQ5CEP5FVXW8IQOJ+p8PR43TW9kBAx9YtCh6
         sy154+QGD2UBdcfovvnIf3BTAOFIzE3S8lcrkStV/pFWTJkDJz1PoTiLNPaKSMWpR5tq
         D6vA==
X-Forwarded-Encrypted: i=1; AJvYcCUTlj5zfgfOPJns5M1tEY+ILTw3Tv0oBFS2IOmwzKdfgTxi7JHDAy+UuUBvvuitQmn9L29KdD0LKaL5pSZ+rpdu@lists.infradead.org
X-Gm-Message-State: AOJu0YzrK6t7K/0XIaVXbgYC6+02sClX8ZpYp3cizp8QNcrUr3y0avPI
	+P1DGvFo1aebt3QXoGm0TivETbGQ4u7WZFZ3HrPR447e0T2W+TECt+abey51Jf8gDsCLkr81+Xl
	tLVKQooT5a3bWficvZ4jr1jvpiti4Nm8i1MC5KXZc+tTrn7Aq8SQ7lzx/OReSdNLGFDcc1HkLzw
	==
X-Gm-Gg: ASbGncvXdhlQrrFCF/dJozRD9cdzHuPU3Tn8nRK1wLP6LStz9DlObl1Nt8mn6iCmaxh
	a8RdJYUB452EKqXoyHndIgRZLuup+R2zs+HIZCh34qewQorzfMqxLtQaYo/0Z8kRc3+jUrcA7vv
	EiWMpcIUzfC0wOYNlWlTzv5Iej7MPy9rsZBB1+EIF6AM+hjmdRQCYlD1v9j984wvrtJgh2IFe3z
	kjrZQ1MfHujGLYuuy6Ty2Xl6snoIOlFTKA5vqXzoWNeKytLX/D/AmTS30IpQHAG5ubhfjbl8LG3
	T0G8BBiD6i5FdqOf8iZvPDy6zmtJi5fsqCM=
X-Received: by 2002:a05:622a:1a9a:b0:467:5fd2:9963 with SMTP id d75a77b69052e-46c71003a8bmr36747591cf.6.1736431340990;
        Thu, 09 Jan 2025 06:02:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfuF1eKAhLL/sLtGC/6H2TCc4VU3iM2KC7HOi1+w90X9G08zymapAYf8h3dlNECvaehc90FQ==
X-Received: by 2002:a05:622a:1a9a:b0:467:5fd2:9963 with SMTP id d75a77b69052e-46c71003a8bmr36747311cf.6.1736431340455;
        Thu, 09 Jan 2025 06:02:20 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90dc0easm75037066b.74.2025.01.09.06.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 06:02:20 -0800 (PST)
Message-ID: <53b83a66-c0b3-4227-8dcd-022f70810ccf@oss.qualcomm.com>
Date: Thu, 9 Jan 2025 15:02:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] bus: Extract simple-bus into self-contained
 driver
To: Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev, devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20250108012846.3275443-1-swboyd@chromium.org>
 <20250108012846.3275443-2-swboyd@chromium.org>
 <CAL_JsqKMcHPhf8yzEZNC6280-k+aSmo3SQOBZLMjmfTR47BH=g@mail.gmail.com>
 <CAE-0n52k0Gg85Ry4KyjE7Ms_dJgj=aPA4aPB5gmC-VGWSNLZXA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAE-0n52k0Gg85Ry4KyjE7Ms_dJgj=aPA4aPB5gmC-VGWSNLZXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GQEYCYScW58rL3_XuXCNxVMaoIp9uXMz
X-Proofpoint-GUID: GQEYCYScW58rL3_XuXCNxVMaoIp9uXMz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 phishscore=0 bulkscore=0 clxscore=1015 mlxlogscore=860 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_060224_306659_0FA856F6 
X-CRM114-Status: GOOD (  19.25  )
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

On 8.01.2025 11:44 PM, Stephen Boyd wrote:
> Quoting Rob Herring (2025-01-08 06:11:28)
>> On Tue, Jan 7, 2025 at 7:28 PM Stephen Boyd <swboyd@chromium.org> wrote:
>>>
>>> Extract the simple bus into a self contained driver so that devices are
>>> still populated when a node has two (or more) compatibles with the least
>>> specific one being the generic "simple-bus". Allow the driver to be a
>>> module so that in a fully modular build a driver module for the more
>>> specific compatible will be loaded first before trying to match this
>>> driver.
>>>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: Saravana Kannan <saravanak@google.com>
>>> Cc: <devicetree@vger.kernel.org>
>>> Cc: Arnd Bergmann <arnd@arndb.de>
>>> Cc: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
>>> Cc: Bjorn Andersson <andersson@kernel.org>
>>> Cc: Konrad Dybcio <konradybcio@kernel.org>
>>> Cc: <linux-arm-msm@vger.kernel.org>
>>> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>>> ---

[...]

> Maybe the best approach is to simply avoid all of this and drop the
> "simple-bus" compatible from the soc node? It introduces an annoying
> hurdle where you have to enable the new driver that does exactly the
> same thing as "simple-bus" does so you continue to have a working
> system, but it avoids the headaches of trying to make the fallback to
> "simple-bus" work and it would match how new DTs would be written. We
> could make the driver 'default ARCH_<SOC_VENDOR>' so that it gets built
> for olddefconfig users too.

I think it even makes logical sense for the /soc node's compatible to
be.. you know.. the model of the SoC we're modeling

Konrad

