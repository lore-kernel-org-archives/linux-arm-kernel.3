Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBCBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 08:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MevWA27iUr+PqW2XLoVtzDgSJt/tlvlfQxk/aVUgRkY=; b=Z4ACkuCt8XhTxjfYQo/A7exuzs
	XiqvjYB+6WXvkz4wRydwSoEKaKkSWddVdTxS5tw9c9TcXQdKk36oTiMNCGw1WdeRxpU1IBYRm/dik
	OvNJ7HGdTuWSqXjQ2u+mcPg5SpUIGy9dEZjAftorBJ8okuIJ//Ga/GAFFsZa4BffS0ema5umprQQu
	wGK2tbITPI4xeECAVoumowEX1hxEKJzqdTjfYfu6GK36Y+KRABnUX9/w9C7nhmz3gxJmWsgI3/rfx
	p1AMtxM29mu8MkejxSEiQACdun764dVF0bG4p6q5xfulrEoU+De59g2h+nQz6gSCPQTeVJYv+Oapa
	5AkjUiSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZ91-00000006Lt4-0OYj;
	Fri, 03 Jul 2026 08:21:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZ8w-00000006Lrn-0nLF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 08:21:05 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663685g63053416
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Jul 2026 08:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MevWA27iUr+PqW2XLoVtzDgSJt/tlvlfQxk/aVUgRkY=; b=BECsprnV4e8eciNC
	vZ0Gvyo2mJYE9MB5ZPCb3lHH/ALHqw7R2tb2eAK9PgXz7LAiz+ZkkFbA8RjWxdUY
	5Iv5erJhlQGuRrc7jNuEcpmPyTQOcQzNp3wOhzYs5BV7nyVPqz3r9Z9zSXeQeN8j
	GQNpsxGkvd2qbD23Pqih4FpZMnnKSWzFmRNh9p5dlQ9bX58TDrhTBPCtSwfTCWXO
	i6Yl8QUjBUQZgobZYqXfLF+hIJy4sYnMRuMRFzN7Tl9TvQ3Yfg34qy8soU8hwvtg
	+SiItcxqnSJbuxyAzOeiiIANAsUAFr3nOoZsypnbT/ZPKww7Ep2bJ7RL8Ijofyf4
	O743tw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j00g27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 08:20:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e59b0e0f4so24344485a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 01:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783066857; x=1783671657; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MevWA27iUr+PqW2XLoVtzDgSJt/tlvlfQxk/aVUgRkY=;
        b=J+qOBiq0A35/JrEYetxz51jkigQT3980bPqInXDt26CSRIBwMaiU2O67BHGA8azEEg
         CWomQDvZLCpsSdGKdDNQGiQZSTMgbPoRSLRylRT1LsYNdsoeYWRL/ft9UNKZzu/ioOKW
         sFqSW961+CkQvhQTJXPzqnyYG+NFuuihzG7dUqgni4kPgMMgwlMb42q9X+RNfVWKYAm9
         6yKWrvlSE0RXbu976jduWPJW5UlqapGQYA0Se6SCU7MDptHujOH4D4v7EOfPdH0qNu1H
         vi6X7rLXYbw5kwdXNkTyJY8uDq+7NDb/BxkJg1Oo3FhnTaqVQNw2hsoKtEwGDxieVhp9
         b0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783066857; x=1783671657;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MevWA27iUr+PqW2XLoVtzDgSJt/tlvlfQxk/aVUgRkY=;
        b=aOD9yRk1V3iHdJurAIY8yOfCQsDbkMcTNEhQdXZe+rGfgDeTDQU2Qz4mf0QAhX3QYL
         BFdMshjBT+aK5b0mi8/+3/eGFx9iLJFUSBoIoYra6h6rkpyRpcrM+CucXwc1KVtNs8NH
         drPKcrO0/Xzw64edC4VCO2N5CtoBWLS2cbxUkPntD9PBNqBuR1hyflGkJP0oDet3sVQj
         BWOrTb/qHs3RqY39oXRqXFlIgGn8saVJG6kRh0cbStdjJt45Nmy/WzqrNr4fHFBpfl0D
         4bSH+jeDXTytU9fUV6btQ9xH0I9Mu59pAaK2pt4n9ugzSZXKe16kWT24Fv4xejHfDdf1
         QXhA==
X-Forwarded-Encrypted: i=1; AFNElJ/f8OqEbPYD1bDi/iUqe6B5azUl/SlZIY54VByXVNAvUFgHXmUURsSKmclRBMKuSvpI8yaSP+bTHEycFTDQ2Yfr@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/InH4dOTRbJNbBckMEntlEsH002LjStzuL4KYFcLRfXQtVoiM
	pYG53vSuZi/prXqwOLKuOXW7M/9ZlnkLbOdR/EtuPi9a/mQQhZTVSzQcToCwj12Gvm4FSV5h9ve
	GTchGSN7xB90g+uHmyQY5TOo7Sn2noKmwJL5IqZmuY0JeSjTqR0M6Ty3z+jqxDpybWUlCF1OzUI
	CGBw==
X-Gm-Gg: AfdE7cmuVK6YkkIqBGZsLVqQglPZEIbc8DrZxLuZgNiMduRmVChtWzqro3c0ikW57IG
	Wuq/O1wit1boBaBCa9wfHWg0uTCA+VB7XjjnrkEq9OfqoyX70fLSskGxWxwDtac+5uXa6J3udLl
	njIt6GpDwSnzjxcK0MlBxF2OkbjqTAR5UdnL4vTbgVnK/L1paTYiun0L2xkAATeM4RxgZ/lah6O
	Uz7WGw1Aqlj+S4VwE8FSUbXykmKaWK1Hj1q3x8l5qY/ndoEO0IQOp7TbD6PS1Nhabo3Pve4MUP9
	LLosFhbZ26Fs+FWFVXvxnQGruVRD/ZoXk4DDj7vfi62+6nK+sVpXvGfD68EQEEklq+56bOaqMND
	PashhO5q3OvHCWyIEpY6Hp+tAoZ34KEJhPKuJ/DE=
X-Received: by 2002:a05:620a:44ca:b0:92e:7319:7365 with SMTP id af79cd13be357-92e7b042c9amr1098934985a.26.1783066857251;
        Fri, 03 Jul 2026 01:20:57 -0700 (PDT)
X-Received: by 2002:a05:620a:44ca:b0:92e:7319:7365 with SMTP id af79cd13be357-92e7b042c9amr1098932185a.26.1783066856791;
        Fri, 03 Jul 2026 01:20:56 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b934:1281:e054:26d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce1a844sm30038455e9.15.2026.07.03.01.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:20:55 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        =?UTF-8?q?Beno=C3=AEt=20Monin?= <benoit.monin@bootlin.com>,
        Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] gpio: nomadik: silence boot log
Date: Fri,  3 Jul 2026 10:20:54 +0200
Message-ID: <178306685093.6924.3082461604910448071.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com>
References: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lbZJ_IVuaF7ZVbCARYWktUA-kWxu2nAG
X-Proofpoint-ORIG-GUID: lbZJ_IVuaF7ZVbCARYWktUA-kWxu2nAG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA3OCBTYWx0ZWRfX2QOOK9vI+QN5
 Dm618UdfJwXk0NeQH79nQwg4S6hceETYXnAlLHs4XyuzWFRxi5CpRVMQWuVTpJFyDy0rJV2vdon
 0bGQLeQk1uHDLFZiH70j095824ZTN1k=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a4770ea cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=QoyTEntUziiQsqKmZ_8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA3OCBTYWx0ZWRfXzLSIk2s+e49x
 ymWajX89ofajhqt+UH6liBMBR6VWY/8nu7L/LlT8a49dDG79XsojU627Btz4szYphyTQtAi4aNz
 6c26bbFXVBueJ45D64+gKqE18E4F8PFhY6wZkOcFkMHfH4GY00DOg6wlCXS2BWffiIDOmMFG+9F
 f0hMtl9qOb1RCY/eUfKGtK7epWP+/x+MizCIaxrhEgzX9UfNX1956AtQ+Rx2COLzmF9ZXWOE5xj
 wpDv1ZeS4Ev9xHHBPPCDIhSMeFe8CJrnEz3UkzfkOnx6V3xua5Wzo7QhWZciNxzHHrD+TjuHdzu
 ZZNAS8STrr1D2IriUaX3w3Qee72Ek32pcH+kWsHJCG/G+zAefs3SGag64HMsyNP6ahjjABd9zpM
 quAEGfvp5hMo8SvNtvbYF+227OhOMwVp/gXZPkKeIcnuUDv6KTiPTBgSJo3/MCzG0g64K/11QQH
 sW2g5odTqc6bMBN11Jw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_012104_042031_1B687BD0 
X-CRM114-Status: GOOD (  10.55  )
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


On Wed, 01 Jul 2026 18:56:57 +0200, Théo Lebrun wrote:
> Currently, on EyeQ5, we might get those error logs:
> 
> [    0.544230] nomadik-gpio 1400000.gpio: failed getting reset control: -EPROBE_DEFER
> [    0.544274] nomadik-gpio 1400000.gpio: could not populate nmk chip struct
> 
> Then on successful probe we get:
> 
> [...]

Applied, thanks!

[1/5] gpio: nomadik: convert nmk_gpio_populate_chip() to goto cleanup
      https://git.kernel.org/brgl/c/6dd9672a16bfbe59427aa0694fdb94553e7949f4
[2/5] gpio: nomadik: add missing dev_err() call on chip populate failure
      https://git.kernel.org/brgl/c/2123813511d495b99b605abe4db167793698e0c5
[3/5] gpio: nomadik: drop duplicate probe error line
      https://git.kernel.org/brgl/c/b0901d4dc17e37edbc928c01dced21ea86da87f2
[4/5] gpio: nomadik: use dev_err_probe()
      https://git.kernel.org/brgl/c/56716e37447a5bd4f9fbd6e314acacce191e313f
[5/5] gpio: nomadik: drop "chip registered" log on probe success
      https://git.kernel.org/brgl/c/edbcefc9b0d5925f8be4227fc180a92cd49d126e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

