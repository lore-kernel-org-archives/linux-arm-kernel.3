Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24459EDB7F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 10:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MTD9t1hqbigzxlJevaxElhmdnO0mTNhhl2ZNJMUVdTo=; b=iNJLQ8jEsbcyzhVloA9HNLIzdl
	UjtNQIbhrGyxOKWIQzRx/D4Wx8wJZ9C8GNUT+1wV+5aO8q0J2u+wKyjUtXn0JhhGIKXsrHoD7lqRt
	ZAvvY/2meuVSz9Suh/YVZxDWfjuRRAo7d/bGftJep7M+ImRMmZRU+Lb8Bm5Fp6xAtG0UFgR9hWjiI
	WZNEX4R17zTq427rvVrXK42tikeUYrwUjECNit2sa4x9kAWp3/jHr+pyF/QOOz2rIpNSGXJNTCr0Q
	zjEz06pi+Zp7KhciGcdWDLkSkFivW4mXNsT0jp5DOySHgj2k5exFrs8GV2mWI9T7Q2S853J8tPAUt
	0WI5wENA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3uu-00000006KNC-1vjg;
	Tue, 07 Apr 2026 10:44:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3ur-00000006KMV-2ajQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 10:44:19 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376d0K53815666
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Apr 2026 10:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MTD9t1hqbigzxlJevaxElhmdnO0mTNhhl2ZNJMUVdTo=; b=XCIgdh9oFtxN7f1n
	I19F2JvWqML+rxALbWWVYKa5IiAGMYBIRxNKNITPkOKUFHYJT/tPe4xU/qUQoLHm
	VWdKipioX4MB1spbfXtkuVRQC0yGU+dg96sUn1ECEZs3oSZFiGptER4Ir6pPTIYp
	IXrUjkNHCcWczP0XP5FKbRlDqp8xx7gz9NWg8ZtHyjUeYry+COV6tIbb5F8Uv7IF
	qOvEBZcLeqtMCahQBwYkmjU/HdQSppCsrGz83VMxjH7zsje10Yhh1iAzPUXcHi89
	c1fT+xoY1SOB17kLHT68COGckrU9wmheSILI33772cCeW3wPlHoRrStM2MwSmhkR
	BquH0A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4tbrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 10:44:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b34223670so221647381cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 03:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775558656; x=1776163456; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MTD9t1hqbigzxlJevaxElhmdnO0mTNhhl2ZNJMUVdTo=;
        b=eGjHv6s9/+yhpvHVGwVo7suk3PfHAVeGPQqjQ2s+Mz9JjG0nYDYTdVM+D/a9oQUEaa
         qpy50zHbBFXY216stroB2rfZdf31/E1ZBfzEBag8HZLXGHG19wc0zZfEWX1ttwWdMJ4C
         bUavDY/KU+AI87uki56h5DcsFsTknJ8X9bEqThBgiQQWCneMXuay6c8cKb4RfoLLwjv8
         2+4eq91SPKazppazykZ+rD2pW0h05b2Coe6QCwB23xjQUQfHYPORFypEBVHn4A4glCd3
         qaj9FoFFyRHjCYR6caWdfCZ1OzUp1QI7O6FzXQAfNdY129DF+O8B0WQraGrXpc8ATEug
         qTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775558656; x=1776163456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MTD9t1hqbigzxlJevaxElhmdnO0mTNhhl2ZNJMUVdTo=;
        b=QkSd2PrdTIZbUhybNra3J7bWtjEH3bexnpmFcZmwj1SSQamTfkAsMpNq0czAVe/o+p
         7F6ANgtNILauQkGjyYq403GoMbyAm6Dk2tqEWIv3FRy/QX0QSkFQhSBjVBbWOsaTRw5c
         Zs7N9VvCK5Q7rDcLJtaLyOopMchtmvvgPUd1qiRzRkRg0LoL+G9fu03iEzftEYcnOCFV
         p16+3Th9faZ24VbhKBaX991I15Ggjm6mxkkFeHE2Khk1vtOnnDOCUtjRTMS4NBvm1gPW
         MPWAox+qRVfJkIIF+uzGnFl3U2g1iRLLjHntyEJox5h+a7zmSiH6jLtb8HaBCKjlyNcS
         0rxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgN6R7yD4WxcMWinKDplfFaX57nRikFKC3CYYLFJMd5q48g6C9MeKO9QMmlA7Bc9BKIC8V7OK68P/PAvHTEmqZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxtJ+YrXVuAVoSqcLA1h9FD1S8s6Zsd8vK6fcBktSeuVJShz3a9
	pjnt8c1WLYw8QZM3Kl22TwMUBlFgI7bH5+9kUMtJww7L+RoTuwDa7rZ7u+1ksBXxHhNPAQx+Ngx
	39W215ZEmrE9vjNqo7kowRnm+0uQ2KlS4clVRQMWxehFp2v5NnlXQ0lwGYaYjb4J/hoZwPaNPYb
	PlYQ==
X-Gm-Gg: AeBDietpGJGZFFIGmNUW+n8dMODNN5f2AvBYO42BSYrk73dXA0WHNHpGJ+23GxEUMXe
	NX9w7BKkhWt1geBUfVJYFb0FB3S0vMdkD0u2q4EkKpZa/lDevUDgQkv34mpE+1U3DrBHtjbMDBC
	yiaOEdzlbeMuF/YVc13niZgszM5OgF17Sc/sz6PE+1S+lJ5VmYcjFItl+DM4x6//YHLGIon5Zmh
	rBHOwUvByUfuofRNTEb9oq+7q2apj280SDQJ7wB6DPP29tFmI9Dlc2x8F2GIuUGAOA0Of/a/dbw
	2EBkP0OU6LB1e1zZwsDRUX0ejeuz8H7Oikp0CmJOohjOGVGhxTJXTluJ7Oyfaj7/giSd1+q6DEc
	NC2+rm3h42Bse7nt9ZbGPqFjuROX+N3Rfv+M8INUHV3HxHE0q+A==
X-Received: by 2002:a05:622a:1103:b0:509:1045:efd0 with SMTP id d75a77b69052e-50d62a82b33mr246737611cf.33.1775558655696;
        Tue, 07 Apr 2026 03:44:15 -0700 (PDT)
X-Received: by 2002:a05:622a:1103:b0:509:1045:efd0 with SMTP id d75a77b69052e-50d62a82b33mr246737201cf.33.1775558655192;
        Tue, 07 Apr 2026 03:44:15 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b36f:5370:5f91:2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488bfc31418sm64902885e9.3.2026.04.07.03.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 03:44:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org, joel@jms.id.au,
        andrew@codeconstruct.com.au, Chen Jung Ku <ku.loong@gapp.nthu.edu.tw>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: aspeed: fix unsigned long int declaration
Date: Tue,  7 Apr 2026 12:44:05 +0200
Message-ID: <177555863870.54615.7184296575672654167.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260405144803.31358-1-ku.loong@gapp.nthu.edu.tw>
References: <20260405144803.31358-1-ku.loong@gapp.nthu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d4e000 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=W_L-z-rN-aJSQ1DoVdMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Yu8r5TM4YArq6-L20V0-jHfs-SoOCDG9
X-Proofpoint-ORIG-GUID: Yu8r5TM4YArq6-L20V0-jHfs-SoOCDG9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5OSBTYWx0ZWRfX3Yp/u0QTDkLT
 Hb5PEk0GkoQXOH8Q5ZcJrORd2XLgyeScdqwFcNRPzrS1h/CY4xBBpwOTr006Ty4XNK9npWDVeOY
 jZ0peEYtF99k+UP9F/5VcmVdU3fhxpUfYWapplUzRxUZ4lfV8PBA2m+QtBRibvJXL37xRMLvIPC
 Ibp5tdfothar7PELPgaZY1iAWTLBaXpmFndlMID7US+ih4M/8SB+AbnetAu+AXFZpN4EctiDY9g
 Jdo6L7sBbtmJGn8jiqi5P2zHRIgXZdlA4kueaAmsDYfZwYGli2wDwxQWW9rLvEd6mhBNgFpdr9t
 Ohz5yYrQbM1h+6J6vVQByzKAF11ly4ohhAIbe/+wKSWZmqTwTVzsKECCwrfOBBuurrQW93rlhFT
 q/r3z3HlXTdANgq+E5CdQkg4h2p2fNi/agrPYvZw6EOenvuCXpTkHXgTqhDriJCstmB3Ea9yZ39
 Lj6uSJF73jGFOIiwnNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_034417_876900_42F07085 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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


On Sun, 05 Apr 2026 22:48:03 +0800, Chen Jung Ku wrote:
> Replace "unsigned long int" with "unsigned long"
> to follow Linux kernel coding style.
> No functional change intended.
> 
> 

Applied, thanks!

[1/1] gpio: aspeed: fix unsigned long int declaration
      https://git.kernel.org/brgl/c/50f1c48b155b74528b0b251b8c4e097fddd5ab46

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

