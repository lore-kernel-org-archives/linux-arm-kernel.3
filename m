Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FB9C83F3E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 17:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MvWIjxTgsWqTg+EpU1jF6w7w0dCuZOGk2IF4h2JIZKw=; b=UbivPADxaaUlYbowTtOzUkmz9s
	irG5OH7fOEw6OqOxoFt3FFLrUyhbtgTKtWD2wlHBr8bf5Y1SqlMg5GLGviOxJ10Q77oceXnAqFTw5
	45EPxCU9BfDp2mICQ61amk+i0jyBNOJzAn/JcnVJHFujTBCKobhilbv3XULop3uexcfA52855ljXa
	mOcJqO1qSWU11GtGMZxlufU8902zlrDYxVL7f6et0Y5c27TrbhVPyPhgOu99Q3FiWgmdOGOoeeEeX
	fMmESTUvcS+L5D61XlE0iqfnhvnW2OBD8zUVTB89+k89izR4mHUFzzTUaDtAIP+70Uwzwd0rgLZPd
	fHUutR5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucoim-0000000DCaW-1m2j;
	Fri, 18 Jul 2025 17:18:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucoaa-0000000DBMI-3cWv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 17:09:42 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IF5DhW030497
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 17:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MvWIjxTgsWqTg+EpU1jF6w7w0dCuZOGk2IF4h2JIZKw=; b=BhVQL7bg08dH1Lyy
	sCNahyhXgLOooPUk6k8lhKr8X6uJk+1Pa2UywOtv1yU1ysnUtDgNZt4yqdpLZuE+
	K0tv2dxCzW6dvx8A4AAJj193IuREjeMHuDLlmtdnunNxuIVo2SkVCir+j0RyVX/M
	DYLgDAHww3n9z70tbq466VWkBPIVGCMhK+FGx8MfhiEBU9WEbLjFPgNtruQac7W4
	H0ncRaq33YzE0XB6rSNXGqFRZcmgcu5MhyjlXY0V7iyZJUiP7XPWZL0Oj9dh/qRa
	WzKiISQhUKpSQuddWBkeXHQ2hpidzoxFHYU6x5T5fvEiwFh+6mY2YvQkzlkNqfQh
	hbR8bA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47x8x7s7de-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 17:09:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23824a9bc29so32969725ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 10:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752858578; x=1753463378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MvWIjxTgsWqTg+EpU1jF6w7w0dCuZOGk2IF4h2JIZKw=;
        b=BTk0hELVMr1UZBjqj9XYN3ycfHYr3FaRFHS15HWhMVPpvfuVljf/5lb2fhtzj7YOmt
         GqzgKxlhCIt5WQQ10HeThacszXwRG2UOhJ+8IoaO7G/vTZvR7vQ/AcCvX6z6qZsIBwF0
         BNtTinuwOKpl9LaBuWHAcTkWu0lLSy2G/ejhnZn0xypJtAtc1QDfjWVj81Z17zqohQAl
         wVIDL8K34Xjw8VPKBuNhjZFtyuO7epVV3/N2gcRMhtr5vOuQ2hJvngL1JwApnDJBDvd8
         knb/f/HHp2jYjRnRRZ4QgOroOGttrK4+YP/96RipJk+oe7vque4Oz5089OrET9j145+8
         kCCw==
X-Forwarded-Encrypted: i=1; AJvYcCXbpt8Jh0Ctmlv9cjbwKShVFzKrH/26KnWGJNZeCtuu97q6xQYfc9Q4eZTSZmoDVx9bR5gkjyYkf62Yj/QGdzVV@lists.infradead.org
X-Gm-Message-State: AOJu0YyYz3QRYrZn9RRVFFLv21cchu1BiNZy2rSver3+1EzLaJd5w/4w
	GWMvPGGrIqx+k54lw2HTckzzWNiA8bcUIjiv3Mp6O9xjf72l9nHj6R/0DwLrrn56Zdicw7m5LJs
	A6L4+MAfyER1sEvaynwH2vYgGGtCWaHxmAoKVXctgm6FscBsfuxAl37StZtkIxix/TMdXEcxjx6
	nzyQ==
X-Gm-Gg: ASbGnctfqfpCP5HfDRjIh+7Zi5NJsutP2orDxFUyETTPiuMxtcjyx2yyxxlkfZTNGgw
	zFJsRp8e81eUkLzPtjJe1I6x9gYhtT8R6gbxZdrMF+6gi+GtqHqo6EgrE8jOzsfe29ifd5IasOJ
	8FWd+WcBLzLX4BKRwfUkarueYHGek2n5unEJU0Roa5NdAGo98wpSHnTurXkJUQLvcoqVEjwzSRv
	JqKRjDYrTeqWHD4XUeWy3lVbzfkVYGoVlMQYaLkEK0ZqDzU1E3U0G0QkjEPywvuHWMdR5/RuVGc
	8WQpfp6HRTf/mfm+SXnYpOsQj+rg5FLlyHWBKgQ/UM6AsIoTPoudTOFTJnp04r5aR88vDk4UwsV
	iwxJ4bXjOdrMwTw==
X-Received: by 2002:a17:902:c40a:b0:235:1706:1fe7 with SMTP id d9443c01a7336-23e25693727mr159582855ad.4.1752858577963;
        Fri, 18 Jul 2025 10:09:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETvEp5rZykda6Fkwq9ZXpRv9woHFJ3xh4GKGF4HzLDjXZN+/v8QGQrNtiX8DgvikLdgkWCIA==
X-Received: by 2002:a17:902:c40a:b0:235:1706:1fe7 with SMTP id d9443c01a7336-23e25693727mr159582215ad.4.1752858577500;
        Fri, 18 Jul 2025 10:09:37 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b60ec88sm16079385ad.65.2025.07.18.10.09.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 10:09:37 -0700 (PDT)
Message-ID: <b7653a05-f747-4764-9c33-793346cae223@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 11:09:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/10] accel/rocket: Add registers header
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Robert Foss <rfoss@kernel.org>
References: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
 <20250713-6-10-rocket-v8-1-64fa3115e910@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250713-6-10-rocket-v8-1-64fa3115e910@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzNSBTYWx0ZWRfX67++qF3ybqgx
 ClQ6gThjLMnmqMJlLzzun1LSsk2qpQ3LxvuJa6AgL7npj7Y9ohaUbqag6YR9jsnHOsaYl4qDfgN
 PngS3uIIVgWaH6lyg3dL4QvZyUWaFgHtK7Us4N9TVA82VJITFDABb2frhs4PlU/2Rwka3sPDy2p
 w0dDTHliquFaVQa/VdZsVBX74iS6+zx1roAiZWP8EAkJFsE42YkGmh+CFEEHMwzp25cbP5OuJ5u
 RpfFwPbJ6heYZv0YuHF6PaoT0195vFmaEbF8TrtOnzUj6EDSz5PZPx9x/WljTJuOqE6o01ZEyfw
 QOlQvnDTSpjUpxWUWeq3M53E2TnbBBQo0I95tPOWCuih54iA6J55F5vhwQ3GA6aF/cTrgX1GVep
 IMvpXQClZEPRs+3DOah1CH4jm2oL8a5sllSGZszp5rm5MvdIG4a40xKwAPgTh6WBiOxUY+WF
X-Proofpoint-GUID: nAsU7ubO5Os2WmpqqZrTBrPyCnOKU5sN
X-Proofpoint-ORIG-GUID: nAsU7ubO5Os2WmpqqZrTBrPyCnOKU5sN
X-Authority-Analysis: v=2.4 cv=N9YpF39B c=1 sm=1 tr=0 ts=687a7fd3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=DISFzqtZAAAA:8
 a=EUspDBNiAAAA:8 a=4Ppn7do-3_l0xiadvqUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=862 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_100941_025525_1863D338 
X-CRM114-Status: GOOD (  17.42  )
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

On 7/13/2025 2:38 AM, Tomeu Vizoso wrote:
> A XML file was generated with the data from the TRM, and then this
> header was generated from it.
> 
> The canonical location for the XML file is the Mesa3D repository.
> 
> v3:
> - Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)
> 
> v8:
> - Remove full MIT license blob, to match other files with the same
>    licensing arrangement in the kernel
> 
> Reviewed-by: Robert Foss <rfoss@kernel.org>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Structure of the file and markings look sane. I'm not familiar with the 
hardware specifics, so the autogenerated content is a bit over my head, 
but I guess for something so large using automated generation should 
minimize errors.

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

