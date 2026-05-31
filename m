Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B385CD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 19:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9EPVuHLNy9vtwwB1VoFU440/iMySrQARYXdbMN/T0bs=; b=B72AezPvaomcagQXz5zccDbUkI
	3UulKFQpbxBRXrr3e9fuwEyJfN+idXwiDnzHMrEkbNaOKjtfS3XzTqioTzi1UZvcWzKYg7ANg7uPk
	FR/wW/mgqLSEG78kwLaN3LXMTEEcFXLm9bxzQCFqKULK57u1eCOmLcpZ299bJXFUAipDH4yxHataq
	LQZYMtZ3SGjN3+qlnby9WdFbKoP5NlPsz0gnwEKdsWNe1ShdUxA0B7bzxqXSuajAU1RmfCdFt3f+w
	4f7MMySyZtDPGUdDfgGoeDCPDSn7BinnEPv+xn0K30f5SghZho3Swz7kpjwcQYWcKzjUjH3U29Ww5
	uJwbHONw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTmIm-00000009sNL-2Edk;
	Sun, 31 May 2026 19:58:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTmIj-00000009sMg-0m1E
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 19:58:26 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UNKAnL1330123
	for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 19:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9EPVuHLNy9vtwwB1VoFU440/iMySrQARYXdbMN/T0bs=; b=RbTVPKA/5wmS3W0/
	cUjJTZHMCY9tm2xDovY5HG/R+QoYu/vLCSihmbj5S16JknFgrb4b8OVo8TrTKZC1
	qlIull9mxJRz4gP3mVRdPM5y8X5AS/VMdRWozNwUBYHvzeT6H7EWEWLxX9j+U1c3
	lOFv6BdyVKD0UozxsAewMm1Zt7AGDUdaCucWB5h/xSIX+xI/feF5zj7pRg15cHkx
	xwC/QtaQXFkGd5NFhSqbHEXgcZWwqsadkgm1ELads0Z53OgGYApx2EFhkjKFnSwF
	MiibEEpyuuH6A00BYmutOu18Z6BntkVTnoPWU1BEFkE5Pirh7RhZlQn2VKgbvM+Y
	x1rGnA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efux53xb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 19:58:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fbc70cfbdso182659151cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 12:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780257503; x=1780862303; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9EPVuHLNy9vtwwB1VoFU440/iMySrQARYXdbMN/T0bs=;
        b=BHGdhKQxOMpm/m9hpgpEZdH6NOi2+i85xZmRm34ALcLBlz1Zw0uu2t3tPsNfceEDA9
         fDIy5cMgXer0BJUZZwXwY+DkHMU2gO8NJro2WsPQkpY5Zi9B2SCAUZ2d4B1smBQNOox0
         SkG/dZvf344OgrzVBYvr6ICJDBZoXpRHmXZ0G9VUrMtru0E5S2I4seXPqBmyD+NNzGXy
         RYSMEyrnralwKuHisqTaUSeyrApK3p6CTwegyFfap7eF2gwun2amaocUXUC+36clb5PF
         e/zzUDY/AjoKKkbxxapt2XgJoJSPMAGyof3dQGFSXQjeUXLFxwqrHDugfzMMhZ8AjHKt
         GqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780257503; x=1780862303;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9EPVuHLNy9vtwwB1VoFU440/iMySrQARYXdbMN/T0bs=;
        b=pSIxmnzhk8ultKw22Z7VqOzdjBOvHYrANxJ8Cs1FmJ3k8q98sFUOMGiehDEmwc+gCl
         2Stt0mIsqkoj+wabgC4JKYDJvduIBHoSYqA/oCcRyt33olq4dkCYAC4T9wbWnTtDV9t+
         m644jp5JlUN6RVqqVmOP8OC7Asm99YGsl1XubueUreKD8LnNEWJ/O/DWGtCe3DhKTsRo
         WDnF9TBqUFPgIJZSOpEV/ErqA5Mvn0QS6IKfUIA0Ss7HyugccRyE/e9E8yVtyvpr1bJ4
         HboMNJvPlX3+f2Rnqsp99BHZQ3V0t0Ob61SLaJwr1xCioCdY76BjvBmg58kTSzCmWJ6W
         fQpw==
X-Forwarded-Encrypted: i=1; AFNElJ8SeCWooSNXscDtaTKUohSUfkmcMvgh+8Trmt+DxKhHHUS6oSvV2LYvBLpD732CUNr2K7NmUP56L2pqCppntxCz@lists.infradead.org
X-Gm-Message-State: AOJu0YwEc3/cYxsvs2bD8j/RDqJo6jykwB7apdl5bEs2n+3XxniS2QAO
	TmGPYXUbQxuLXMemgRUSbgSuCzlqGjTrz6VLzuyQT76nThmRnmm2diaXlDA4i2aT+4ioDV/uHcm
	y0bYxf5jiEmVtXDOoR3AD3X51Fxc40/pwE6nIApc3f4UIGqjrgFcb/p91ef8vkShRtCUDzdaoww
	YLjg==
X-Gm-Gg: Acq92OFOtQywwkgsbzyF5rnTMgGDlPSYxsCC9p6xCBUQJWxTxxpC1fsjGxpiBVP18oM
	nYbpkyjPN8k/Ib9wVqv+4a03uPN//rqMi9Y7lZGNZoNH6e2Nf9n9Su2+O7q98y87TyjpDCYk9Fu
	K/3O5/NKkrCaKuAD7NrQv0ajQwRe5PoLlGNvMs/rCkF2agQC4gN2PeF/bEXD2vz47583IPOK/cO
	DvuiRmCbFJBbiqu2DueCXc//3rKRFbDxiG4mImwdgDr4BecbQh06/aZ6IwPcFEHFYP4IrHJ1wZc
	1IBYCzE046GXP9htrnfOOSb9EVw1gtkDdWxAk2rDGDmM69fdxigT2wcT1WwbfWKLqYvU7eStU22
	Tp78rAP32V8XhwUIs3BIN8Yok/l9w7e3ZfwoAH00QK2VVax499mU9W5JhTwzMStzLAbDDUPQXj4
	M5
X-Received: by 2002:ac8:5143:0:b0:516:dede:2094 with SMTP id d75a77b69052e-5173a8b0d5cmr70777121cf.55.1780257503406;
        Sun, 31 May 2026 12:58:23 -0700 (PDT)
X-Received: by 2002:ac8:5143:0:b0:516:dede:2094 with SMTP id d75a77b69052e-5173a8b0d5cmr70776921cf.55.1780257502956;
        Sun, 31 May 2026 12:58:22 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d68a925sm303091335e9.2.2026.05.31.12.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 12:58:22 -0700 (PDT)
Message-ID: <0c5033f7-1535-49e8-a502-426e54333496@oss.qualcomm.com>
Date: Sun, 31 May 2026 21:58:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firmware: meson: sm: add stub functions when
 CONFIG_MESON_SM is disabled
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        kernel test robot <lkp@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>
References: <20260531-fix-missing-meson_sm-symbol-v2-1-1def8c3c169f@aliel.fr>
 <8c11a91b-cfbf-4b9c-a46f-907989bf8305@oss.qualcomm.com>
 <12d74340-0213-4f7e-a494-10ce147844ad@aliel.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <12d74340-0213-4f7e-a494-10ce147844ad@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pA7UKYuykcBKP3ZrhkLQ0Dy8tcOB8-BM
X-Proofpoint-ORIG-GUID: pA7UKYuykcBKP3ZrhkLQ0Dy8tcOB8-BM
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a1c92e0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=DmWT0VEtOxJI-Rt19aUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDIxNyBTYWx0ZWRfX/uIcSBdmpqGi
 pdaV/L/BLEUEV67NZT4Fh8lMchzlMreG40QGaAOH3L3R4x14LlKUA4BlaKMs2NTsrhL1FSsk1dZ
 1p6feWJZFYZ/kDawoJCu/3U4bMkjma6GOqsqIihG99HK2P8anLH8saOBdF9xt3Zjwy1jZMlKEHJ
 kaG9Isx427vMYs6YZ+TpkezL+WJ7vIIHYP8RycdNvKOcBYiDlaVoHX5tuGi3Go+OqDZkbrra9aM
 ZB3BkHFvdEvXxIACPNP+Y/3ddZUej+GaE9HEdL2fPDUFAF72bUqOCBted1hkAXr6FoXd1vK+jAK
 DJG5A9aTlDDAG7o+WqywjjRXu4TAEr9G/0nQTcGrnAU3HOg03c2WxOZd5Ln+Oabr09EuqwKJQjN
 g8W+SrR9CBtitKwa6nieUwemlrG+BQeP8Z1ixAIYGpfUxTPHhyr2KkD4e159tHb7gVCfTOiT5is
 zXmErItwttvBVzNs+ww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310217
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_125825_259892_F26AF636 
X-CRM114-Status: GOOD (  17.03  )
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

On 5/31/26 19:49, Ronald Claveau wrote:
> On 5/31/26 10:41 AM, Daniel Lezcano wrote:
>> On 5/31/26 09:51, Ronald Claveau via B4 Relay wrote:
>>> From: Ronald Claveau <linux-kernel-dev@aliel.fr>

[ ... ]

>>> +#if IS_ENABLED(CONFIG_MESON_SM)
>>> +
>>>    struct meson_sm_firmware *meson_sm_get(struct device_node
>>> *firmware_node);
>>>    int meson_sm_get_thermal_calib(struct meson_sm_firmware *fw, u32
>>> *trim_info,
>>>                       u32 tsensor_id);
>>
>> Do you really want to compile meson_sm as a module ?
>>
>>
>>
> 
> I don't want, but if I send a patch to change tristate to bool, it will
> raise a warning because 'm' is not valid.
> If it is accepted to ignore this warning, I can send another patch.


Sorry, I don't get your point :/

'm' is a config option, make menuconfig should set it to yes or not set.

Compiling the firmware as a module means it must be loaded before the 
amlogic thermal driver, right ? Where is the dependency declared in the 
module ?

If the sm_meson is in the platform, it should be selected as part of the 
platform's component. No need to have an option for that, no ?



