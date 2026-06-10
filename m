Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF37CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PhIIMTxswpu0kQXH6fHxF1NhZGZXbF+4A7iTY79l5MQ=; b=er/JUOgtgjbeDeIepGhfEQukwb
	SBK4fPj2wYSXPbK1A3WDac/B6aemcafJ5Wmsun2L+zdZrNLblzuN1mv4CqCd/W/XDc12XzkHf66UX
	omrbUJjaahsUyvZgutpbVAO83oLz7casmcmj9obOLHhNx6ap4Zt8Pj4xSbZSPpLC9f2nBB3Klg010
	Zq7FuXiipkvHJ4va4uEUEz5b7usJwIicyI/MFqJU8bvbpsm7bbPKihVHKrP9Fdv8xzXub3/JgOQ2z
	QLeSnSnu8+VYH5T2gMExFkqK/Qla1CPC/qVRNrK3GebLQoe0ijhjVgC1Y/RTzx28wqFMXYZIRwTdt
	iG116QkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXE4D-0000000727n-1Sfw;
	Wed, 10 Jun 2026 08:13:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXE4A-0000000727F-0Tr9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:13:39 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7htIm3151748
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 08:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PhIIMTxswpu0kQXH6fHxF1NhZGZXbF+4A7iTY79l5MQ=; b=iH01zTOwsYo5+f9s
	5SsillREx29Fpv66NWi/PUKxYZEJF8a68D5JiHCA+ghOdQdKUkhicjdfDbPOWUOj
	YxdPVNgJfo/43k4/r91fUk1VHpoAKsJQjfRVvrThpk/zd3QWQEfXp7FoGXfvTyc5
	vGiXNJnN+QQ36ENy8j9zv87GK+hVgsNWM7Gl2zamWn8+HnKB5iTAJMNFNcsFhjVW
	7ZsLUb2Kr/YI0m5WPTVHdMzRacrCU+RmP3zTapNWmlJB/Tw1phNxt1/2oJsXcI6H
	cA5uv3rPsDaEIrC7aUWjBHADL+KbXv60ql1MWJZWKbaSLNPjYAzDmIPaLdlrNuOK
	ZlBf9w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwneseqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 08:13:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517d766e05aso32181181cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 01:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781079217; x=1781684017; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhIIMTxswpu0kQXH6fHxF1NhZGZXbF+4A7iTY79l5MQ=;
        b=bc/VDRxMCrNvO31Y+C3agA8TQDeg9OvhIDjudBN84E1QEEq94BINheRbazxI1E8zuT
         wzCXyDPgcY5rgZBdImh0WJ2UdjqvA0BYlDEsTD4Jbw9LJgtXnkS3bdzPrlAcAGnVxnFx
         Tw3oqpVkPvsHrvtBBAkqbha1e6Znl8VwEfRPUaLI2uiNwIcKxpknbVuK6caOWJs0WpAE
         T5I7JgidatgX8TL3CZRmXS+VsiRc8/G3A1lfXRMIitMAAp0LIXybJlmJ/gL4GxgB8ZDN
         YUpbDGUZWvcbR1QVp16P2T5bvjwCn2KHi7Mh1JPeFt9Hl716NmMfLTlu1pKs80zgwBCp
         TM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781079217; x=1781684017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PhIIMTxswpu0kQXH6fHxF1NhZGZXbF+4A7iTY79l5MQ=;
        b=awoJOvVu8dKDdTbn+vqJFv4nmtqFtia0Div1VFOYnJ+mKKvnlPwqKjbSovvdeagh/D
         UdwXfJwH1YDpf23M5UoxLDGkU1e2Rg2P2Qz1rOpTUjM+mAHyRGJfmoPemdAWMQMj5nBM
         3lGEW/BYfXDd6NT+opOHEKQ0bq2GZBQpT7zKkHxHMHGXRubglTBbJhjWIRUuEDkvrKD3
         Z27DDoqz/DWIN33YxRAyfQ3PoLUr5klStAto9grZSRST9dMcG7bT3h0tVwJ11SHCCq7Y
         ntB/gcexVE6sd2fWTCGYZojM+XpVC8v60mZY1GKk9KdZ0129Eg0ugqGcaGUnthMo8q45
         3RUA==
X-Forwarded-Encrypted: i=1; AFNElJ/YF61qg0SX85vmGz9qNivmG8RPlJ8/44dsH+qdBNlQEf3tfB7KAqNO74uGq3nYjDL/eG54qik34K+1K956nkan@lists.infradead.org
X-Gm-Message-State: AOJu0YwuAPaSbMSpQephy1gXb1Hlp5VInIhpmoxni0xVzdqW40alG4Fs
	vF1Ir1ukPeUV41wNWKjM6aDorR9Ej/vP7RBWNvXBziC7dg5dN+/drwyR43tVJwY1Hk0UzV+sFve
	G/4q1JTD07ZM+CgS+baXwVpUFVjv2iOntFPk2O4uMOtC8Th3dciy6nyjx/4YjfqOWqJT/VQ26JR
	2KPw==
X-Gm-Gg: Acq92OHDvNShO354cUFmvYQMOhF5/FH3a6ny/ugD9i93jz3scdYQdQNubWN/ltRJzHd
	SPxxyyQMYMVpfdiA0B3R10cqZqhFQmDut/oJNqRssJrcJL5AyMNIwipGkrxKr1recSvHxBQNZ//
	jZq9Rw7Kxb4NsVOsa549YDeZhzsN/J2OJAZQ9Cn5WVx/3eSXfdpcm5U5RgWO/Haa4Pc5629Qu7O
	14ClUTEItm1s5t5VgSvP8BNwjkc/DypR7hNVKGLjPxild5KiiAq0Um2bqBxrL2PmeukbgynGUR9
	+lCT/7xVefmTir0yTF7rdXCUE96N6ggkraj7k62CdJK6goJ/XZrdDP07BC55r9ujuZcTwg4FANc
	fV+DUkmzXmcJ7vUDqmcZRajGef3BU1n6n5L/03oqXII13EsC9Re7YDbKuu8K9
X-Received: by 2002:a05:622a:4807:b0:516:cd8d:c7fa with SMTP id d75a77b69052e-51798882e6emr254695711cf.39.1781079216716;
        Wed, 10 Jun 2026 01:13:36 -0700 (PDT)
X-Received: by 2002:a05:622a:4807:b0:516:cd8d:c7fa with SMTP id d75a77b69052e-51798882e6emr254695561cf.39.1781079216204;
        Wed, 10 Jun 2026 01:13:36 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:528e:d8e3:7d1b:c55f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344558sm66503001f8f.18.2026.06.10.01.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:13:35 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org, Daniel Drake <dan@reactivated.net>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] gpiolib: handle gpio-hogs only once
Date: Wed, 10 Jun 2026 10:13:33 +0200
Message-ID: <178107921083.14393.15982991231905667426.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260608210108.36248-1-dan@reactivated.net>
References: <20260608210108.36248-1-dan@reactivated.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: J3gen3sLf_omNUO5T3QTK8uP6cgIrh2z
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a291cb1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=FKizRO9OI0puG8hLs8EA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: J3gen3sLf_omNUO5T3QTK8uP6cgIrh2z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3NyBTYWx0ZWRfX9ovE3e//mUfu
 qZNeLFHVcEBQrDwvrfSNYeRsWeFsbPaWSr/ltSKQR4F8Nw83sMvoCOi4RC4lkjyoFadCBzBNgGW
 BWy8ZZRBe5Vj5l47Gp2gj8IxEFW2Ocue6DG3nBbKjjWQn+9xV5EYqkzowCWeZ51XcynhD03Ipow
 3SgA2iGCGCxvtKT02s9LyG04dsx4xdaFeZ05lpoXjWKkVy/bkzMlJogPXVV8UV14LzlIvTGVUUH
 y6MvXPUkpxxHuwbryk33t2bdNEpxqaE/rzeSN7y4PIjeElKkWw6BVpvX0hK9IGFmPj01CIY6ZIc
 QTtff8nB6KUaAeI9at5DTKr7cFPgsEM1uo5olwN74d1ARhX0AFPDLyQjoTcR26WtzWVa1dG3AJT
 d5oD9+OCORKA59OmJKtOMDupy3LlFV5TQ8c2VV4ryBfhY4DXhfOn2XW7ro/I8KpUAoqFYE4CrGa
 lZUT+MoHfpO8U1eqB1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_011338_156800_E475DAA7 
X-CRM114-Status: GOOD (  12.42  )
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


On Mon, 08 Jun 2026 22:01:08 +0100, Daniel Drake wrote:
> Commit d1d564ec49929 ("gpio: move hogs into GPIO core") introduced a
> behaviour change that breaks boot on Raspberry Pi 5 when using the
> firmware-supplied device tree:
> 
>   gpiochip_add_data_with_key: GPIOs 544..575
>     (/soc@107c000000/gpio@7d517c00) failed to register, -22
>   brcmstb-gpio 107d517c00.gpio: Could not add gpiochip for bank 1
>   brcmstb-gpio 107d517c00.gpio: probe with driver brcmstb-gpio failed
>     with error -22
> 
> [...]

Applied, thanks!

[1/1] gpiolib: handle gpio-hogs only once
      https://git.kernel.org/brgl/c/a23226b7c1f69eafd9ced4e037fb51c9758c0501

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

