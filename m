Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6418CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 11:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wc8pBobLAB4TatrDh20UoHLU9V5aquvkKxmU9lFHUQc=; b=er+YYKb/Z3Pi4vd3GBrTPpVkeH
	6MN62R4bhcV83lEH0y1Bo0wONUPPGFewKxofaHwwaefEL4gVIbxAyrlKj1QsQls4ri7sFHHEKGccl
	I6An5NJJTVAq+Cac9iixAMtJV/wAsPjDW9Op1oM9SobpBeGOaRZcB9qSZQ4uhG1zuA4piNi7qLY77
	6NmNX9dgHPUTTCS6O7Ll3sEoh43GhP9GC/gOe0LkoVTi5zUAXqdEMfXmbZb+HDegeyVLWBZJbudfb
	bCsjmF8t/7TYqURuyAbax+IJ37y++agZ2GdrubHYVeLHq7BbEjuSnx5wakjBYpeWWPfmNwjYF/o66
	IPWg/cpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWOQ-00000003SCr-2hyl;
	Tue, 29 Sep 2026 11:53:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWON-00000003SCU-3CTH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 11:53:04 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TAjKEC3870496
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 11:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wc8pBobLAB4TatrDh20UoHLU9V5aquvkKxmU9lFHUQc=; b=Fr/eb0uDuIOoxz1s
	57noKmRlC7krHWZUNMOqhCDKFgmqSrdsqW7Rt0HX6ilWZSQP+g1IJJSBPVZY4gt0
	RPfS0bjdmCIk78dBXOcDsfX+GVJ4xw1goNCNAs89N3EZqjUX6OztyzwdeN9EiGuU
	ZCBfpJCZUO5nFqy0BvqpQRNDfdOdwkZbLcRH/JYgS5mKMKoAMW42H6+m0fJxl5wP
	4XctCd3mTpEI6p3Wra8mwmi5dwvLlzyXy8L0sOGitjhqWZzMZeBPPtNko1YOxBGR
	1RTN1HGo3yU677qVXaitJ6dCpqSpximPO5VSxMeK5qNw4JXimmsYnmA9RT/Hhbkp
	LIc0+w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvwnbu6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 11:53:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2df8484f12cso40661775ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 04:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790682782; x=1791287582; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wc8pBobLAB4TatrDh20UoHLU9V5aquvkKxmU9lFHUQc=;
        b=LldssaWhrwOJCv5++L3f3tiTTWWqLT1T2nvaW2xj3OrG1Oz4hxxjqj9dQ1fvBFT2DV
         iUrSXfyDDvxNtPZXsCVpWj1W8/CkpETx7eupMxDkMf/kfwIgwomfOX/B2wNr89nCj5p1
         BMZZ8WDtSLJoisLeZohWXV4+nx0OgTy4o4UUzkT7BcvoegrTNeH3lfK7FfLjcFhv4Xt3
         ObhRbKztlhGOgUN66a32dT1I4cB+5IIM3HdJ0Mqlg83xqB335wqtw8G5yapAhMR9SBWR
         m1FQ5xj4navYZC2Be4s6gakd/zy7a+S4sb+7R8aTKpRDX12yulbh4dXaOS9cFfqV1/M3
         eOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790682782; x=1791287582;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wc8pBobLAB4TatrDh20UoHLU9V5aquvkKxmU9lFHUQc=;
        b=tBoehe/kjfPa1Do5E973dexgeZESPQu0pugC0TqhIkyfBxVxyPesRFJ7yIfSw5ekyE
         Xmz7q7hFQ8tnhZzS0M0W4f9h75jiS41usaLF7DFuHa/CBpJ07XXWYb0+ijRJ+pg+YLmL
         Rc+hotb3YcCUFPj7idfG52z/w5IMm13ZFLjKLKDG5bCDrEEo+3sdjosXT1Nk0FZiMaLA
         u2hLbEtXXThOscV2JUSbH4DRnj4PnKr6HnCy5S487ci4T324cJ1lbRg368RmUVlGBOXx
         sNwdA316HuWgEVkYEHk7Gdh7Oya0uzco4WbbDti3tDDkfgw3Akzl6io01nEoOaWkJ3Ba
         twAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsyAjCYbrfUF8OJLaaR/xvIHLrX9K2maNaINgawTrU8fpAmAPAeMOhuKzdMDbEJ8ay5vA9IAAKfJm5HywZxkit@lists.infradead.org
X-Gm-Message-State: AFq9FYIQYdzOz6I49mX7mV2Zp+3jbEMQ64TWxpJeiUl0UaKBjfxTyJXn
	E5291giBGXAQ3PryH+Q9W+aVQqaTIC0PUFwNcK2Pd2oyL1pe1XKtGseDuFL8W6mymyKnJHYwx9u
	182AuG4B41NLxtXT1if+obFRrwR9ruorWWF6StEqNfekNrTyzY0TtGQLRzdOM7YA7DCcSaWEEAj
	wQ5Q==
X-Gm-Gg: AYBFou2zeaMxJpCfQrcMZCq90TwOP5puFYZhFTAspmKKitPsC5iDNaV5qBVFL9GcXPg
	0K2HrTDA0fuaSRKKGXDRj39xv8quSEJBHmTIFApWc3M1+LY2Z1i+ML2YdlvWPwb1iLAEF8AaPg3
	PgdgaU7m/4M28Ako5ghIRJNJ3yNxzcstfEW9NG53bdnDyQs3dSorx5l7gLi1bpk0OCu2hw5/WCF
	CEYwuEt3V4+VCQ47HEGiXMgp26wlPBBRREN8JWGuKB6LfUASUfMGV6fX6jF9K3pabDNL0Mr+bZ7
	aXE5L+59jNG3GDmIsCyCaqUDlaApSWzv7eR3AZZmG/LMVthUb64KoOu1oL5S+VaaIx8yeZ/aE2I
	iRUWckchpcaXl4ZI8ncIEH3OQN8ef2mFlrSNx9X336VDSucP4tjU0SWWojxJnTTjXpOhwARqNUl
	H2dlglkdw+yvm6oWsUGA==
X-Received: by 2002:a17:903:26c5:b0:2dd:c0ff:e727 with SMTP id d9443c01a7336-2df7dfd63f0mr137881775ad.57.1790682782198;
        Tue, 29 Sep 2026 04:53:02 -0700 (PDT)
X-Received: by 2002:a17:903:26c5:b0:2dd:c0ff:e727 with SMTP id d9443c01a7336-2df7dfd63f0mr137881535ad.57.1790682781734;
        Tue, 29 Sep 2026 04:53:01 -0700 (PDT)
Received: from [10.79.116.160] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9146ed7csm53972585ad.80.2026.09.29.04.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 04:53:01 -0700 (PDT)
Message-ID: <4ee090bb-b404-4b0d-a239-5eecd93263c5@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 17:22:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/14] crypto: qce - Fix crypto self-test failures
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King
 <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
References: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uO6fJ8jlrO91ClRpkAtMTBJEhHN8vO4z
X-Authority-Analysis: v=2.4 cv=W42txhWk c=1 sm=1 tr=0 ts=6abba69e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=4UECf4yVBZO8k2hVk_IA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0NyBTYWx0ZWRfX8QCWvsS1mENq
 MPOB10AbLrLlapXQ6ZN3arY7bvFbPDJfmZOIFP6/BPmYBsf/n0NfAi98SLrwtiFG5GX1eP6nIFU
 hIvQmLCyhlNWf0KzpLKXoHC4qR+ET5C/IIVbDZrs3G9K9iHfuI2Krwq/dCTlzCz0ZNGNLFhifzD
 2T3I0oACdhNjXRDANe2JwL4u5xnwYWaIV8VdWcL3arPe4me4teE7zufxdked5HsxNlGXgF0yys/
 7FiMhJsZn4R6u1eiJd8iNRRz6RcfIVGLc11hQVYdfre+9jzevF8D8IlclcLNlwH+CU2/rY6GtvO
 pnsge9TSBX4uM9q267l53q9TF9RCu+a0F3abXPmQ+4S+dRPLSIZ1YRyA+j49LhtjAsKDzLps2zG
 rG+98sKMxwAf7bd8Sl+4afHPDChG8yE4DxT0lLP8usk9oxXp+Cs0eOGOKRsLOKaj/9fkAyEnBP+
 /i6jPbzJd2VYR3QpAvA==
X-Proofpoint-GUID: uO6fJ8jlrO91ClRpkAtMTBJEhHN8vO4z
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0NyBTYWx0ZWRfXy7kD6nWLnuaN
 o/HEyvnRgv74b7p944n6x0TiWf3kF7GMXJnSLqNC/8uutgudl0/tjGi5tk22wp0XrykZ8C4s9QY
 ypRYsTSdxmTSrXtoPdZrR3OHhSJUUUE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_045303_812749_DA65778A 
X-CRM114-Status: GOOD (  16.36  )
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

On 9/22/2026 6:27 PM, Bartosz Golaszewski wrote:
> This iteration - in addition to the previous fixes - proposes to split
> the QCE driver into a core part necessary to bind to the QCE DT node and
> enable runtime power management in order to allow to drop the
> interconnect votes, and the crypto part registering the crypto
> algorithms. The core module is then enabled in arm64 defconfig while the
> crypto part stays disabled by default. In addition: the actual
> registration of crypto algos is gated with a module parameter that
> default to false.
> 
> Note that remaining reported bugs will still be fixed in follow-up
> series. This series addresses self-tests and disables the algos by
> default.
> 
> The QCE hardware crypto engine has several limitations that cause it to
> produce incorrect results or stall on certain inputs. This series fixes
> several bugs and adds workaround allowing the deiver to pass crypto
> self-tests.
> 

Tested on Glymur-CRD, the s2r suspend blocking vote from crypto gets
removed during suspend.
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

[...]


