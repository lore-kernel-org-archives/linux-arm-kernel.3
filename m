Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E17CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 09:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NHzdCrzB5CwJNMDm2rJXhCb7qWjOLhdrunIo0lH9wqU=; b=UF+T6Zh09ZnRmmkQ+FChEFNsr9
	uOh7pt0ru7u5u68yyhgW6vFTDlNdKo+0sAXxEaj4A3R/eL+xPM3s02d1fPR3FYDBT2mD7iUA63i2+
	2RwrWE9z9ZbZ91S60Mek5VgPgT9O8VWvJORPV43U+2/J4iTQDiHFXEIPUSjuuOScnu6UwSRtiT4+w
	zoYf6Lw6O2w3sAiS9mH5ehWP1Jjb6hn09XIg/iSPs8Vg+O0LsLamha9Psfu11odt1K7EMhl3Myjnf
	Io+1r/hLwYLsO+SuEOAP++eKzoq7f9iP6FKcDD7crzkGvFHtvtWJrXjutmyQX3XhfjGo0HUeJ8lIn
	cLsBN/Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEkWT-000000040jW-1EK4;
	Thu, 08 Oct 2026 09:34:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEkWQ-000000040in-3fz9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 09:34:44 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K9v32560095
	for <linux-arm-kernel@lists.infradead.org>; Thu, 8 Oct 2026 09:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NHzdCrzB5CwJNMDm2rJXhCb7qWjOLhdrunIo0lH9wqU=; b=ewtkd9Vv03MTGYw1
	yJqi99u4KX64v67wjKlDurhKecn+nlTJlKHFcpY5y9zKLUqGTl4KIP4IuYJhZvbQ
	Z+SSJ8secrzcFE5ePquEgmOE6RI1mYGzT8Ajq4yfHkXl9nK6/BWEdzgVQGzQllYY
	QY6pUoLYeiM2d2kIsho1zEJuFiRBDNNYfHSXgy3XfjVJFZnfv96iBGEZ+upHW9XH
	jS2TzYBehdQzEg38TBKCKBieMi8kOLnuNCpYll2XysIdx7+0L2PD5d2U6oEkUiWC
	YPftL/TO3NGVF9qkSSZpuzxQRrBwtiUR3d5uZr0lyTfwXDkf1JCEJeCvinFWQPvL
	giRHng==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe825gk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 09:34:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39e3c10ac70so6772233a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 02:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791452081; x=1792056881; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NHzdCrzB5CwJNMDm2rJXhCb7qWjOLhdrunIo0lH9wqU=;
        b=GZPwNQEZrgLSz7aLqIy9HTYmxu+jiIIc1148X2rkvVKZHEKC347uByOMwqoMGSfWT8
         qP2vvGg700688wx2ZDvwkPRtzggDGPjy6AcTown44J9mPDidL338PvjPUopxrBDSlxSv
         Rn4zfXcrNbLa1tPvu6qVVQ2vXBKRB9Pg9LL9RGpWdwLQlVFsreianJ+mUKzWni9gguyK
         vZKEeegdMtVSIH65YH8bDm856bJ64HoM8G2r3Y7jkStH4TPR89gq0TpWM44ts7DvFA2D
         svPrigTxMR6/m4vpfnej3zfME4+Isn3CvnkLD/CM7ic60D0ArUbvmVmDpKoV7+S05HOk
         +rgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791452081; x=1792056881;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHzdCrzB5CwJNMDm2rJXhCb7qWjOLhdrunIo0lH9wqU=;
        b=OD6+TosCzffJ50CCBHDg4hpJUKwKZUmEeUXQ5xWL9p+TeusFkugNuNV6BvVQKFxjCi
         PQHmpBe9s5WZmXzz0uo+n59ErOPL+MKs5W93rhly3r6HeMPfkvYxKqC6N637hO0eSD+m
         nu0Ed6Iv2RSRr7LuHR1hHyFHse/63yYdrqA3XUuw6FdoXDlC3YTZY8Yzmk6xpm6c16BF
         a8CkYswI2f0EKWnMmtPXZDHXsHtBkK8S8uS7jJajo/OCSBfyrC+3nrfH7b2TOF/89iv6
         PGBshtuR5Hh1613b2fs5GH6cYCp+oaDir6DSv4YNUKx8Ly5ZXGLmspghXKXuZlMH0xz6
         /cAw==
X-Forwarded-Encrypted: i=1; AKwUvBzytcq80q4EqZBLF9HE1lZihUSCbiuP3qU3jWbsEmyoIOQ8P1VApjjXu6WCGXKTTdXBtdR99BgpNLMvyQkSeS9B@lists.infradead.org
X-Gm-Message-State: AFq9FYJ3GTXIBULSIMeYx2x0b5UvPwDUrHYfJZyPuv8AEz7eBJFThxTp
	3xXMrk6kLLROyt7TkFyvAwC/IjDwTFPLIpXT5Nc//RyS74p1Kp9DcA8b0JNuUTKGwTD4cqobkVT
	2oUnL1MrDjMnvcKMDb6ijcRkXsBDXVuX02zGobh/wLXQAKeYZlJXGa3RPSYfPuQ/4G8oBB9SHEE
	bI3w==
X-Gm-Gg: AYBFou3XJ97psHbSE8X0k053wuVks38FfhN1reeMBf9UDJ/FIeDGF9pDPugpSUqChW1
	DbIHWdfhdW/Z+2g5l8eLl5Ewd47dmNGMrPT73Poa80bCo4xF+JUSbdEp9TOWADzSIzyXX8uy2hl
	b33799M4petfEPWJrEU7XIcNmFGrbJO+coi9ktxRfeaIgJxvDT4Sj8/Snrep2Fogj/VxYCZhB3M
	d0oaalrKlmkSnuaQYrNXX17IJDO4jdw1CAEIgqjEjpEy+lmy8NmhcA1JRaZTlXUN4QQ7x4BX7KY
	gBNYMK3m7p7hPYAqZtVWC+t5qAJESfYh36u8N55BkR/QfcFyBRIjN1FYZ8PxoWvCFYTmINMBR5h
	jlEs435JxkSm6KGmRM1+4ZNkUbZ0=
X-Received: by 2002:a17:903:3504:b0:2e1:35f0:6822 with SMTP id d9443c01a7336-2e5ffa150bemr49850915ad.2.1791452080642;
        Thu, 08 Oct 2026 02:34:40 -0700 (PDT)
X-Received: by 2002:a17:903:3504:b0:2e1:35f0:6822 with SMTP id d9443c01a7336-2e5ffa150bemr49850655ad.2.1791452080181;
        Thu, 08 Oct 2026 02:34:40 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604a46604sm22029495ad.72.2026.10.08.02.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 02:34:39 -0700 (PDT)
Message-ID: <041edb78-acc2-4832-8500-28db58db1529@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 15:04:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/21] arm64: dts: apple: t8103-j313: Add
 speaker/headset jack nodes
To: James Calligeros <jcalligeros99@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-11-7b47ed6335a8@gmail.com>
 <31d91f44-3f16-4a4c-916c-f4d8107d371e@oss.qualcomm.com>
 <CAHgNfTy-h8m-XBBzW6jSNBz0dVe=vXL6nJ3VOqgMjCbsK_t6gA@mail.gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <CAHgNfTy-h8m-XBBzW6jSNBz0dVe=vXL6nJ3VOqgMjCbsK_t6gA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNyBTYWx0ZWRfX1p0wCZcLk/XQ
 OJd2dM888kijJrynxbOLX0cW86CXOKtLuw7j8DDBdTOLJNkk99YirsumRVH4wiahFUD2ZeLtNE1
 nH4nEAcTwWPOHZuOxE4Pt5/8OhZ7RqPLAJUUe6Lh9hvGfcR28AxQmwhmzBMqPIBkn0hswv3lYCJ
 rmgE1kthRJ8XtkyOXqkFcG5Gc2GA/V47pqHrDfaoCh0NO1T1HdJYAdg0FNdf6e4hE80za01YI3E
 NS6wxwLU7HpW/xyAR4vp9TsmZAz9dKTLfus84+XJoEzJzTAOBoSGMyAcCKRt3TX1SGQJ+MreHYO
 kqFnMQ2WShpQXZFSxjdzdOVXoazgSDlfYag1KFE0i2fk0shwU9XsfGDr/4Ho8wVhEX96EX0CE3L
 JHMKhaxo1ZNV5WJxMvZwcajYwgWmdyI3SAMRMrokIMUGr1uxNJxCmsaPxcXETB0ah7iDYTuzwDe
 khy7Z08NTjvEkHpj1aQ==
X-Proofpoint-GUID: 7DT_mwlUXd0CDw42bHIZ74e_lDxAhl3t
X-Proofpoint-ORIG-GUID: 7DT_mwlUXd0CDw42bHIZ74e_lDxAhl3t
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNyBTYWx0ZWRfX6t/Sw+VF0Ehe
 yTmLhB56VJJTjQOMZp+kr5BFTa64Odcm1pwpNAuKIsljrPOxacUkQJBt6gYl6r9mYRkBU3mNRQD
 enpJ69OwtK6TOloJxOh+EmZzPgkej0U=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac763b1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=k_whtCd4PG3F-9RvoSsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_023443_023303_8EFDD109 
X-CRM114-Status: GOOD (  18.87  )
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



On 10/8/2026 2:16 PM, James Calligeros wrote:
> On Thu, Oct 8, 2026 at 4:33 AM Ajay Kumar Nandam
> <ajay.nandam@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 10/4/2026 11:33 AM, James Calligeros wrote:
>>> +&i2c3 {
>>> +     status = "okay";
>>> +
>>> +     speaker_right: codec@34 {
>>> +             compatible = "ti,tas5770l";
>>> +             reg = <0x34>;
>>> +             interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
>>> +             shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
>>> +             #sound-dai-cells = <0>;
>>
>> Both speaker codec nodes reference the same shutdown GPIO. Is that
>> intentional for this board?
>>
>> The TAS2770 driver requests 'shutdown-gpios' per codec instance, and
>> GPIO requests are exclusive by default. So I would expect only one codec
>> instance to own this line, while the other appears to fall back to the
>> register-only path after the GPIO request fails.
>>
>> If GPIO181 is a shared physical shutdown line for both amps, how is the
>> power/reset ordering expected to work across probe, suspend, and resume
>> when only one of the two codec driver instances controls that line?
> 
> We use the new(ish) shared GPIO proxy stuff[1] and it all Just Works.
> 
> [1] https://lore.kernel.org/asahi/20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com/

Thanks for pointing that out. I missed the shared GPIO proxy dependency
when looking at the DTS nodes.

That addresses my concern about the shared shutdown line.

Thanks
Ajay Kumar Nandam


