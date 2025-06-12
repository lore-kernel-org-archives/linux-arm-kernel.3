Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D76FC7114C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 21:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Zmr5+JECjNDrTnuNUMITpmDMpNItBuB/kFf5nbp53s=; b=nwFYCcqxRD/Gv09/XscE9KOTWr
	WB63HjHcEaGyRsAoyzvYAfiIZIvGNcW78CVWf638eeijHgbfHDqvkv43cYxzImFqvXo2rHhvnFaL/
	BhyYtSBipe2EVJtkuk1+3ASFU2iNGOt42UrscOxCjdYsCA8WR3tzkw0yJavTwAmP70B4shTsRZ4Ff
	9/VqldnrMOdUKfryrj9zGaG0zZz7LJMZ9VkN8dA+ot7whZQgyabgh+bamp3ENIgvpGgNyH3UYI6W1
	TVXpB4LGrCYIi9cR0S6PGiyqGWdtkdJmGj3f/v2ygmsFUjb3ukALO9VfGAdFfuHoJvGWPvmJIaCJ5
	hul9gC0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPphW-0000000EfVx-27fF;
	Thu, 12 Jun 2025 21:43:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPpL7-0000000EdsJ-2K1U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 21:20:02 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CEfQTK002545
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 21:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Zmr5+JECjNDrTnuNUMITpmDMpNItBuB/kFf5nbp53s=; b=EaxjjFpJ7wS6WdqT
	Al1W1Dj40l1WVibjXSMhFBkQf7/kUWFEy7BYQ5Xh1aoIZxivt/1erMUK4pXf9IzK
	D6GvU6tPk97CzCjDbyjp4RBj9ZR2Q1Hvg6pEjCSoSHTOS3GpK1i0MNQqh6ss9Eg2
	SsavzA5JlzCtAdLE/i56RtkKXQdF9mkMe7qiHQCpIWSERGU97gZWoXfBPDeAs+Jw
	GtAZTZSGbvNuZJ46oglDZhV60SoySDp0yIswVG/qv1FuDvK6FXSbAiIjtNYMBxKL
	RYCYlTJN6LekxjS9R3Ha9R4GwWOjrVcR9JwvsLgw9wJq8Ykq2S9uhRG9dXyOKWIo
	0C2X8Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 477y3gsbpr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 21:19:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-30a59538b17so1432921a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 14:19:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749763199; x=1750367999;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Zmr5+JECjNDrTnuNUMITpmDMpNItBuB/kFf5nbp53s=;
        b=J8qfOSwhJLmjMgiiwwueCxRhYg4mIOYIzF4nIAP08fWEd9wB9Zg3LwBO+7p/7Uv1Kp
         sjcJ25G8epSeVda/Tk90NsgD2WINGx16g/6fFYTbip/kdiFVhcCB0d8YRgh43Li64Fjh
         SWDAR/eM4llIP+ei19BkhIGVbAP6Muuagz6+swu1x7jvvZkDy2Ro9uz7leLcCCO6iR0K
         WB3/JbgW0kw39aN7ZfEU7q3QXy3RVZTBBBUX9VsuciKBICCB18ZBmaKjZ9leH+3lBJIl
         jmL2Xk/hQxPDn7HutsJMHA/loHqNtUa2TtPbY0fAYNIbZ3nKznayNbM3Vav+JdwZx8sg
         7nrA==
X-Gm-Message-State: AOJu0YzLzVttQWeBegdkyxp3ZkLUlP9fQRhdxntacQ+HJxe2nym6RjAk
	bnWE5RNBwtJ2iBdKIlYCPaNucIaRzxEPaTDCvWzPlAMPDC6SlBv/c0S392ru+eR2judrgwisJSl
	BLAGteITQGtb1gpDzLVSRfOespIaA2zL8GX2Z5G0ZmryXleZ96u74shFqqINDziAvx5uUIBbGsi
	7RkA==
X-Gm-Gg: ASbGncvOuXh7HnSZ0GZ3Lu0ISI2Z33JsrgRz4ys85L+dVcUBkZ7qn8DY9JAibTC49wh
	p8eV2Uf139nbpX2gzfNJCvjJCzYCwhJLkHWp8ggNFfEV31zieUmbnnzHuObn7xkGW4i5yG9SjtJ
	7k48CvIRZLUO2uvCySYNY9HeJ536uTp/pMQUwVzow2pGdo4cQQDVBbaLvFTqVFpmBN5NK/O3Wfm
	IQOM9KOWG4Jv05D8KX+mDwkl8qV5my7++nlgKZYTF2JZ4OmJbyshU5OWOlxH54L9mQSct669znc
	4n0auqv4bvdaFfFl33vMxCRJGfVGE+NZBVY0UwrHbQ==
X-Received: by 2002:a17:90b:1843:b0:30e:712e:5739 with SMTP id 98e67ed59e1d1-313d9d71383mr1065556a91.14.1749763198859;
        Thu, 12 Jun 2025 14:19:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcEB2oQFFgVMym1bB2VUhhziP7lQFCJfNjFpbKCnIdWSG44vwJc/VtPEHqnpJDg2SoasT6AQ==
X-Received: by 2002:a17:90b:1843:b0:30e:712e:5739 with SMTP id 98e67ed59e1d1-313d9d71383mr1065512a91.14.1749763198422;
        Thu, 12 Jun 2025 14:19:58 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.228.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b5a882sm1990932a91.40.2025.06.12.14.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 14:19:57 -0700 (PDT)
Message-ID: <036e739c-54e4-4252-b6f0-c8eed5557d15@oss.qualcomm.com>
Date: Fri, 13 Jun 2025 02:49:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Support for Adreno X1-45 GPU
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
 <0e6fd97d-9a56-426b-8b98-dc8aa50d02d2@oldschoolsolutions.biz>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0e6fd97d-9a56-426b-8b98-dc8aa50d02d2@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hjplqtLyXKlfTcVv42G-VCH6yZ4n4vsE
X-Proofpoint-ORIG-GUID: hjplqtLyXKlfTcVv42G-VCH6yZ4n4vsE
X-Authority-Analysis: v=2.4 cv=DPqP4zNb c=1 sm=1 tr=0 ts=684b447f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=8TKXt+tWyFtBY9WE4KDEmA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=uKUkM4gl_lyc4tR08vMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDE2NCBTYWx0ZWRfX8eXNpBExfQkx
 yTmOMUh77o9vEep8EIuZGMG0iqxrU1nRCFpRtNqxBYEp55AGOUDPsWMM/eUYGzLuxQ0HTgJC5Dv
 fuM9fc52PHCfTPi6igzaY5Gf3ELei04Ul+28zKyrcCksmuqaWml4ijbgdbBjKOhKgcMCMWEAUCm
 pVJ/N9qzDplMYf3mDKsA1/YC9FZrLPFAT+7+mNe2segYRzYRCjqjKdisf5qfI8LYXBBK+eYNqyX
 uiwfExudA3ko6DRhxi9O6QyqnWAd9lIuVuUaQu6Kc0ONK36OHZ3Vs9+1Z5TMHKI/J9DoJIv4wXj
 lTPfbRDWDafzA6zKPxbMQ4FJBuDKZJrKnG09gcamkWOtxGyqzRZbdOgG7/xK0gClnqWqOAf95jj
 PcX/Du+SDJUfr2iho7aTGaj292zSnKOWYtEgcPjb51A3W8dExhXjOvfiJ6p93iwD6ObqD7Y1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_142001_596912_659D9518 
X-CRM114-Status: GOOD (  19.47  )
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

On 6/12/2025 5:32 PM, Jens Glathe wrote:
> On 6/11/25 13:15, Akhil P Oommen wrote:
> 
>> Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
>> version). X1-45 is a smaller version of X1-85 with lower core count and
>> smaller memories. From UMD perspective, this is similar to "FD735"
>> present in Mesa.
>>
> Hi Akhil,
> 
> when loading the driver (still without firmware files) I'm getting a
> speedbin warning:
> 
> [    3.318341] adreno 3d00000.gpu: [drm:a6xx_gpu_init [msm]] *ERROR*
> missing support for speed-bin: 233. Some OPPs may not be supported by
> hardware
> 
> I've seen that there is a table for speed bins, this one is not there.
> Tested on a Lenovo ThinkBook 16 G7 QOY.

Hi Jens,

Could you please try the below patch?

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 2db748ce7df5..7748f92919b8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1510,7 +1510,8 @@ static const struct adreno_info a7xx_gpus[] = {
                        { 0,   0 },
                        { 294, 1 },
                        { 263, 2 },
-                       { 141, 3 },
+                       { 233, 3 },
+                       { 141, 4 },
                ),
        }
 };

With this, you should see 1107Mhz as the GPU Fmax.

-Akhil.

> 
> with best regards
> 
> Jens
> 


