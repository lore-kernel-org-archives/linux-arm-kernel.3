Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F40EDEC18
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 06:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mICino5nH4L36s9MqQ2N08OYmrnyuBSpHkGBIndzUbc=; b=a/o7v1YA88Bd04R4Y13a11HLyW
	4pFYb5djjpp/ZOcgVUzEkvmWS6/zH5Wg2PORFG1i9lasl/ZD+jhL2QFTzT5WYJp84xko8m891/XmJ
	TU2rZmS78HTH99jgAO6BKKgNL4XIjUQq8fd0Ix6ow9+cpAy8le55J85JsZBjiyQaw9zj5LLThbRv6
	xxc7spv0uR+BDTF8eaKAWOV2fbsFSaoP3C5YAuI82che0hiYlbsz6fcb7REHWyCCGsFzxmh1GpCyn
	6dxFgK8YquI2cAaA3jXKYo1/7ylPMM73Ui7rGTBc4ZKYjqnA8BEDNHPqSyp8kNNmiwhmXO1N+SAVB
	mbT/OSaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxg2h-0000000GXUo-0gyF;
	Wed, 04 Mar 2026 06:49:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxg2e-0000000GXTs-0ibq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 06:49:09 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SVTd631908
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Mar 2026 06:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mICino5nH4L36s9MqQ2N08OYmrnyuBSpHkGBIndzUbc=; b=XM1dsbhtVZQz3NdC
	zO87XJXxXvS0aLlPQwjRyYfm1KNnfKiCU3C6Ge++M033q2OtHEeZT31WV8e0DLQD
	IPS11eFCoWg7kUYFM63n8a1ucUmasFgXfYlSx/UYSRIMGcsNw2SHNJl5szWEgYVk
	sapuv8Xn7YP22CB9otpwgMkqBKc3tdgIKexEx6Jwb+aIEJNObe7sTr20aTqeL/l/
	SeDgC/TNmNSamrurdWk6t9dfln2bZvDf89EVToGJ0ZTJkwyyM5wJXWpn/lp1Priw
	YAe2kaQzyKmE8o4cvmPMvsASrRZ54TL61RIlZWOwAx33ENgoa9u8ae5PRg5CMs9b
	PajDGw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvtubwak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 06:49:06 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c709551ec08so24538943a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 22:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772606946; x=1773211746; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mICino5nH4L36s9MqQ2N08OYmrnyuBSpHkGBIndzUbc=;
        b=DEU7ITw7Y6vGn72sYq/VlvMdd/lQ3zhri2C7LFs8YqhPdO8SlAdjI2zx6p51o+NAK+
         q3e32DnVreJKtWe6+zUernUcO9unKxjAgbgDIfjIk/xLXdTn+ED9uie93h+tG2T3XaGm
         VGA3bJdtCqz8cofFzMfZtjW3ilakYHQpoOwTmg+mP7eBkNOJqsqtD7M/uXlEvjp74AfV
         Zp1j1uG233+/Kr6QLwKn2oeeTOTJeLXGhFwD5l5YJlHmFqBFUsTHVs2oL4IIqay6I3jn
         c+tOcK303zUFLwjO5DGJOY77FBDsx6IkhSeyLbHsndl0ShXRvduEYCXg8wV30lUjEAce
         7jcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772606946; x=1773211746;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mICino5nH4L36s9MqQ2N08OYmrnyuBSpHkGBIndzUbc=;
        b=Os01ViKJstFQjwoKPxNTmDJn8frLxteJU7C2emMp6KU7iK0t8eYcNMpaGfWyBoXDit
         1BwmDehu78M7aYkx2Zy1KbjZcGewU+noznvfSEdSmpxOzMvcM4/AuLxstIrmw/tZYVQp
         b/aQLtYO7MY3XbKhxkDWxRY0/McrnqGDjS+8/s4pDyrOlLw4cp9A25XBtRqfppKD2jbt
         K/YcKUkNVsI/Nl39p5edEfS/naqMFR/7oJOkTnZGLj/MoeADGGp57D0ZV8Gzdhxx/mc+
         dX2pmJPVDPgLVMWropqVmJM+JxipOb9jPYkd6kqO7KLTKq/dEomERjpiLUeNbH+wuLHR
         qw+w==
X-Forwarded-Encrypted: i=1; AJvYcCVSvNSHMTqFoaZDgmgMS8aqKEwd08JubjSkAgALtw8Xk/f7aC7rcTWb2KwhIN87dCnXoXh0tBqLN57k4I/M2H9P@lists.infradead.org
X-Gm-Message-State: AOJu0YxXpLz1tDeFd1CkUANNtV8BDY+eBGuX79PrwRfmUPeTGlpzpHqy
	okm4alds434JlCbTIpYG7tYkiIzg8PNcWpQHEO/57vyW7PJzLCiCJhvsFStqBycOyCdrqZtZfsi
	qXgbUkmaUF1546DehdkSy26y7pV045/kgJ2dBonS0HIUOZNC5Zr3v+65msy4cvyO8LYXxvSSXo/
	eU8Q==
X-Gm-Gg: ATEYQzxbClQog8MiYjDWP210PclMblHWN5Nl/FdIzw29I5LtqVy+MSMeHBg2nHpkHCa
	/L1oWWrpefrY0GPQFHsnOat365bE5quz6dC/7BFO6XFu2qZCWWe11FM3dX/3hCuhCT2n3zQzAj0
	D2hd3inXc0w154mh4Slvlxq0s1XkevtxxG0+0kmVKFU93kUOY4CSK+JTEQPrv2iQt4/yJzedvJ6
	JDUETLpDFSxUh8PtxG/VWLUIpn6mjNoihXebQovWLUdh1ZfTrmrepxamVGVtHTv6Eg0+vBJjF4f
	+YUXRB6Re+vTi6uwc9BFh+1DmSv/HnZnqs0jXejaLVq192ibcovy0iAKQwn3d6R7Q+MxOD6AYIx
	htoAt2MsBVKmDO8/OO13EOQ==
X-Received: by 2002:a05:6a00:138c:b0:827:32ea:5307 with SMTP id d2e1a72fcca58-8297290ec8fmr1047520b3a.3.1772606945566;
        Tue, 03 Mar 2026 22:49:05 -0800 (PST)
X-Received: by 2002:a05:6a00:138c:b0:827:32ea:5307 with SMTP id d2e1a72fcca58-8297290ec8fmr1047501b3a.3.1772606945084;
        Tue, 03 Mar 2026 22:49:05 -0800 (PST)
Received: from [192.168.1.2] ([2401:4900:88da:227d:6548:57ab:a3a:47f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739dabd43sm21015522b3a.25.2026.03.03.22.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 22:49:04 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Heiko Stuebner <heiko@sntech.de>, Niklas Cassel <cassel@kernel.org>,
        Shawn Lin <shawn.lin@rock-chips.com>, Hans Zhang <18255117159@163.com>,
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
        Wilfred Mallawa <wilfred.mallawa@wdc.com>, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Anand Moon <linux.amoon@gmail.com>
Cc: Grimmauld <grimmauld@grimmauld.de>
In-Reply-To: <20260226101032.1042-1-linux.amoon@gmail.com>
References: <20260226101032.1042-1-linux.amoon@gmail.com>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Enable async probe by default
Message-Id: <177260693908.10259.13055467642416391434.b4-ty@kernel.org>
Date: Wed, 04 Mar 2026 12:18:59 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: lKXuQlsv33wbetare4sYCQelE2ief9ka
X-Proofpoint-ORIG-GUID: lKXuQlsv33wbetare4sYCQelE2ief9ka
X-Authority-Analysis: v=2.4 cv=A75h/qWG c=1 sm=1 tr=0 ts=69a7d5e2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=SMwnmUEIIvgHDjHqlWcA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA1MyBTYWx0ZWRfX2pguXAbBwQ5y
 Vvh1qR++93LFa558s2TIz5jl1J58wtje6mZ6lztRxoawFSgDhGnVVYR6fEwlbg053OUkBL1RLGw
 N9v/Y7XDm6esBFbpCk/yhnqJQcB4TqzIfIcy8uisrHbDECzuuQAhjWB0hcY4tIeQ+bInuqCR75l
 yWoP0lWAQQKTxphPYV7q65hYTMesBCAgPvpjtjSw8hcqwBw5OvsZ1hi31DiiN1N1o/gYdFlMF7H
 xjj8dFiLM84n3VtpHC7Br1/4/YTlgXhgrNd1Rh60SvocIKaKf6Vh8v7GO/DCuvnRWCClu52m71C
 akVl3vvguZ1ou3ZozjZpwa/FaWBmGMiqM/G4pwwL5eVNIt6KvdsxnmicnV3Ts8CHEG4erNTdDRq
 KDby3OglauEw1gM9u9kaLcm8Tdg66CRz7RWWAsY2o6dhyFP1UgtPz+Cedt1YKC1/e35D7CrytNF
 K4BjCGJm7O6cMqaRl8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_224908_325011_18422136 
X-CRM114-Status: GOOD (  11.48  )
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


On Thu, 26 Feb 2026 15:40:23 +0530, Anand Moon wrote:
> Rockchip DWC PCIe driver currently performs synchronous link training for
> combo PHYs (PCIe 3.0/2.0 and SATA 3.0) during boot. This process waits for
> the link to be fully established, adding several milliseconds to the boot
> sequence. To optimize boot time, this change enables asynchronous probing,
> allowing link establishment to proceed in the background while the kernel
> continues probing other devices.
> 
> [...]

Applied, thanks!

[1/1] PCI: dw-rockchip: Enable async probe by default
      commit: ec392abc95932838bf7e3d659d358f4df9ff5a0a

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


