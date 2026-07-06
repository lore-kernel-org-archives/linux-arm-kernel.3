Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25BBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 11:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SmFemL0KIIfwmXMSiboiFKmy50w+ZsTOV5sITG6jZnU=; b=F9x0nMYCA2q1TRKWFupICRM9Zh
	mLB2F4r960g5ucaCLGMmIvFxX7+wgIHpvAKB5JWAHlykoRLTOKWTIZDPIrpeLJR8mhbB2uLaYbChc
	P2y8awZNKv8InypVuhlmmFqHmI7KfSAKsq+KFoP5Vw0ZdjPEUU/Hzsf/phyngo+lrY3iEqlTvmLK/
	/WByJlTolvdkir6OOyp9qKE5zD9BUfUV2SKzXrKB5VLz/t8tgI62A1BQaAf0bWvFnGGz8hwpt7JRN
	G3wnfmqm8G9nw+/lnNhO3OpZ4hwCaYTZtJCQ/2OpTA0N7JNypwI8MHCIZzHBdjZcPwP5cX+APFCMb
	3WyBMU0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wghHs-0000000CKm0-2E1k;
	Mon, 06 Jul 2026 11:14:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wghHn-0000000CKkT-1daP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 11:14:55 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxM1d387498
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 11:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SmFemL0KIIfwmXMSiboiFKmy50w+ZsTOV5sITG6jZnU=; b=CPs5WGtmsOa/TuTP
	9g943atZbLy6V7FNU0IDjAiOLDtbzgjsBbtkvuB7pYTkF/Tcnp3bYaQAhYP78v6A
	b7ZKY3UeGepRMAaL+SYQ2BiPKgiqoB7C3TuT3BymdlWZfkqd0EAW9c3kEpr4d74p
	jaZ1qyCrKBYfZLXgeTXzehoexy6f8WFe2CLNryfMXVKj4eokBWGsDPvCi+wAcaEB
	Jil61pqnStfHsEB0H+3tBZb5fde9AhSlJpIhzBsvPBq0xv3ETEL4Qdy7Nka5cEVH
	g/ocE+rj3tev0R63C7O9n4wUSEiAi1LqoJktdpT3zw5TGdMJ6AZ9j+M0WPepQ3qm
	SHrNrA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r09va-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 11:14:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e68cb7a3eso539890585a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 04:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783336490; x=1783941290; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SmFemL0KIIfwmXMSiboiFKmy50w+ZsTOV5sITG6jZnU=;
        b=XVA47FO5cwQuOd/SSCEzFIM/dM/REYhPRQm6tuJPzoUDSy9BN3CO7tGHUJzKeF6fXl
         7FgfybTG1JFiKMW7SWzVtRJkT48wRr5HZOO0VDHekktoNE7KyHyDuyOOgYzX0d1//0Sw
         GvUmxEJN15zfYeDDsrzM/GsLM7yCi4IBaAfXQPzbnNeik8SGCXE4epx3yqRI1T3Zbw3g
         ZkzVQzrOv/vs6iKuvzfA4K75QZRsyyFXw8hQOzGORZkByP73/Aalmv1xVExhd29xGUMe
         /ZKv6qURp9ZEPtp1nFk488MFGqjYqNtCoCHZqjLfxQ2EONchymrFKru0sYAdzgAgt4iJ
         DKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783336490; x=1783941290;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SmFemL0KIIfwmXMSiboiFKmy50w+ZsTOV5sITG6jZnU=;
        b=L4hH6QdrPieyO/GuFk+A1/T5qPxuALtFxzEbpjapHGcI4BjUPIhwEnFw9bxuY259kz
         XNjsmyDgo4EwX3qjcDKAaG1sl+5+gbLzlG0gn1myLH274WTZyX90INKF6XjcHs3viQHG
         tA5i4Hl9G4uvl5ihjsV2Pc5BSjJJmnPnfeNCSfUfAaXcfE1Dw6Pcwue4cIYRPKq7drDo
         X3KJH/6xlo1G7qL6lH7oo/VwTYkQ4CYFXBQSPCjWQ5+tKHKpDRe1lxFentCT2aGKwojP
         2Or0hvK91Tz+kfwyQjxPCIPzZo5Pv0EJClwhnee35jSoLkigAZ48RzU5H3fqRnStXoD7
         9amg==
X-Forwarded-Encrypted: i=1; AHgh+RooQ2vD7LUzr2shWNj83o2jpkdak1qTV8rkU8aIfv+eSsRkqoZwv3MEF30GhEdSu+xKIcGcGUSb/5yL46yN9+V/@lists.infradead.org
X-Gm-Message-State: AOJu0YzENtzgX4hvQkQzGEB8DTxcq+Fr7j5TssAfMrWlHOtOSQx+sJwY
	MA4mNTvlb7wv+EmpR5BbORIiWqioCbEGXunPfEQ2qQbdUsPGWyExS/GNXKIX/AU2SuYB4VOokp/
	/l4rfe+2biPow04ePb3KBfORHXAGQFStH4ubEHULhyl0kwm2Bbo4LmYppTNs4GmsQxbefwbdwbP
	ZhDg==
X-Gm-Gg: AfdE7cnQHlfbiGU8GCE20xN5+L4/H99VHxLAbuP+D68UJHR2rkCRvpv21dbPs0ST65W
	XWgkJeJcxh11lLIxlncDj1OqlJcaIO5VubtIh+zpdXGmV5YlCXoJGAilNAuBCQsEtXoV2kssV8A
	hbnqZmkdBUT7Tdm7QJPkydiyFsKNVhB0a+RNHUTurRa2Zv8jbcvp6BmB4+URtA0ACeoOdIJo/kW
	HPx7JuLQXaMVZ3vtuh3g3PEyVdhdMJhjZQePFamFhlsQB+cX3dM/RzwrGNznWHnf+cj0sF9gIIs
	zQHatMf5LTdnIllYRmB8tL0bDPGdWf7PuESCyCKvB3yVSa/9qXfgncuhRpkxK4vbOVHkvqVLm3U
	1zPUraF7y/2Mm3vJ0RQEoyBeCwlyn5/qGuf7uyGYa
X-Received: by 2002:a05:620a:2714:b0:92e:78cd:13f with SMTP id af79cd13be357-92ebb50944emr10933585a.33.1783336489767;
        Mon, 06 Jul 2026 04:14:49 -0700 (PDT)
X-Received: by 2002:a05:620a:2714:b0:92e:78cd:13f with SMTP id af79cd13be357-92ebb50944emr10930585a.33.1783336489368;
        Mon, 06 Jul 2026 04:14:49 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm21725161f8f.31.2026.07.06.04.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 04:14:48 -0700 (PDT)
Message-ID: <b795c8f6-f0a2-485f-a331-22078b002826@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 13:14:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] spi: atmel-quadspi: Simplify probe() with local 'dev'
 variable
To: Mark Brown <broonie@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-spi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260705172737.120095-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260706-plunder-fencing-b9ca15ef05ae@thorsis.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260706-plunder-fencing-b9ca15ef05ae@thorsis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExMyBTYWx0ZWRfX7EAcGjYYx/cO
 xaeLavBLS8FaF8DodJGqkBAGvBKIJMK4W4bmFNmll8V+wdGCgiaDM5E7ocdYiZ3S4ATM3E96feG
 uHWOZJNtk6e+gBoxXJfQDQDO9wQFltoY/qyJb8H5kr+IwDN7jp4bNQE0ELULha4Zvpc9Tq2TmYv
 dCXmkqjFewltBysEJ2m+R8v+hbc/AN0/m7ajkI/br66TntT6iw43ms99S/cmWrmnAN6Aohp0jI/
 fv5juxjZ3Cnu7TjLI530eyjkx6tpdyG5K0qEieKRgoHZynTXPn64XZnSjYXnN/3ECiUDb3o4bYQ
 lr6gURaqPyq56rNuHpJMzwk580QuZgezaTxBf2MSQ8iwRlAf1lLjMgd0B3QES5BqapDnE4pSe/s
 60TGJuGSwg9N8jTBiTDAzGw3vbo5C8UbfekeiFGhuB2zYNAxXvVPzllv2ezaxtQjoqhw6q2pLeh
 Z68GXRELES/iERGdg9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExMyBTYWx0ZWRfX8iN1wJpk5uC9
 AXkX6WUE9xlp+KETXu1j2TKaEbhIhi0+gkaxTMImZ++vELa7uYBTZ4Cg1qL8DVZz52kGlo50gBI
 dkLOifPUODfRo/rbgzigbLui60ThkZE=
X-Proofpoint-GUID: a-RsXhAM_DqgJ-dN0zCvsuVOA3uCSfZe
X-Proofpoint-ORIG-GUID: a-RsXhAM_DqgJ-dN0zCvsuVOA3uCSfZe
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4b8e2a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=G27ZhN6lH2JbNpaoIAoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_041451_553039_CCB39920 
X-CRM114-Status: GOOD (  11.83  )
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

On 06/07/2026 12:58, Alexander Dahl wrote:
> Hello Krzysztof,
> 
> I think you missed some.  At least the two outlined below, but maybe
> more which are not part of the lines covered by the patch?

Next one does it, no need to change the same line twice.

Best regards,
Krzysztof

