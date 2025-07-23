Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B73C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 16:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asewMPoDa8OP/xKR9tMVu5Ys0bUlKWoneZLys80QK6U=; b=bgyJKV76AFL50+0FvZ+ScLvMQE
	SrG8XlNG6VyWFiIc/zNwNy2ugRZAPgOd9NOUHtspKdINri8V8DZ5YVOAdR/pgYdRzliQC/CGqJk0U
	91MJ0p0ne4CG8JI1aCXaOhJg1vywzBRmZHtpVKrbz3bSitQ39bGT7Lfc7bFy66UL14pqBqcBXpsfg
	lSvSRrn5ujolWvb1mDU1MqcyX6yr4eBHMHDDgcdpeK7kO/YbLdAdLdK7Kb8uW2sZSUNx88HPUN9+z
	EqMy48zdeL9Wmb6r8avATt8+8VVPR5ylmObjMGRN4f8+2oaAQ7l18ghtyOWDUOSUW3nKdpCNyiq83
	LEkWsQ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uecZs-00000005Wc1-0oOU;
	Wed, 23 Jul 2025 16:44:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uecW3-00000005WD5-1ofZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 16:40:28 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NDxHJp002723
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 16:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	asewMPoDa8OP/xKR9tMVu5Ys0bUlKWoneZLys80QK6U=; b=I3aSSJmgcVOlGK8k
	2SqRWBx3GM+FrKlJK64ARHxsYleiMUFUQiDjg9BhFlRLX8i5Dlu82EO8de26iPE1
	oaO5tRrasCmCXrsFy7KmTGiUkr3VILzBZ86mNhTVN7pEaxsxsBqmPyWxFB4XL9dK
	ESpcajABvicNkuSLww2QUEmA6S76NK4V6HF4vNpWS3jlUNjM0D1k3tvIhgoyMp27
	tPfGh+IXQG9hjAQztKaG31nI7yL5rp/yHU7g4beURnWrT/SwxPlUA0EK/N7xZiLM
	XZCGDHRC9+M19yhUlnNwFdYSVqz5CQdFMGfqK8F+1d6IwqXU/UXTkW3e2ga2gcZs
	PGYGcQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48313kghj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 16:40:26 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-704817522b9so900616d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 09:40:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753288825; x=1753893625;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=asewMPoDa8OP/xKR9tMVu5Ys0bUlKWoneZLys80QK6U=;
        b=C5l/K/DxpiO+1yZNfSDVPLnVAwDvrbM87aswYCveY0khn0oFuqyWQ6meLNIBQkb8q1
         PUI1Fnm8D8EOx1GPsUMjZZ785tnt11/c83hgzrVlGSnnXG73hw8ym15suH+eVRHdMyDk
         bgiAThoHRIr18MoqyzHE0lAFauLFXrs1argnOHIp4BXq1Fj0rVJmzPD97kw6IOIMZXuS
         0+78zFS6FxPYjOnLdJOzbc6/sF/kIxiwlQxI3Yjwp7QWhEM/EF0GrVRFTCp/SNulzLSF
         RmSzES46jn5ja2TzJDkOFT+uD6M48DADT5lJMEY5tlQ+wi7cfSZ9FcnXOTGItBeE45KM
         i36A==
X-Forwarded-Encrypted: i=1; AJvYcCXPjqI+FGZW+33Xzzh//y7UDWsDtKw3yzcVRIOD3kBNYiTimKOlZfsiQw48x2xSHuUCs90eC12nhbN+U5XTzLGc@lists.infradead.org
X-Gm-Message-State: AOJu0YxHMM9w9NqoRYrIU3XzpnAS2aiJz5LUmJqdUpRsDpaEVBZ7x41y
	aP+cFtyihn4zF5X8nADkaf6rMgHE8I9f8s8yKE3FSk9WRWk0DN2HlcqkubXl7CgVtL4wZvtuPVM
	mRvIHs0ZSK38WEr0cXsLfU4y3svoFhkOC1AC2spElMCZcjYZT3d1ESCwcGzrWPEu5AT5k3vxZ9g
	Jxyg==
X-Gm-Gg: ASbGncv/zy8X/UNqso/e9xInVPVSuKV0vI/uuwzfWgok8Z5okpHLiyvtJ2LYZNTK9wB
	FkSrB8kVbXFFgkV6kMYuryny/0k/C4BWZSG1/60B42EMsbq4H0ZtOSqtLowuUYnfgIGPvGK2biB
	m5hRudabKgSGdRdPyaqUNAISanu2G7q2EETcweMEluiXQqcDITDESElCJiCqDYwsCTUFcbKABPJ
	gQ2/Fx9sb6VK/aYHr2kywHUE9k096RTmxwT8P0Q3QgdZbbnljjtivMzo4o/laB2kDUuRxmYkfPG
	qWKML3KUzx9w1GFll/ISeOqsGG8Ze4WzTx4=
X-Received: by 2002:a05:6214:2aa2:b0:704:881d:3102 with SMTP id 6a1803df08f44-707007112e2mr46418446d6.12.1753288825556;
        Wed, 23 Jul 2025 09:40:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8wpQf4uwxEj9EM5lfb3sTkgXtWQrBB6/j4Y74ae9n5U8jJuU6pBy3PedPAaibkrHp47c2iQ==
X-Received: by 2002:a05:6214:2aa2:b0:704:881d:3102 with SMTP id 6a1803df08f44-707007112e2mr46417976d6.12.1753288825056;
        Wed, 23 Jul 2025 09:40:25 -0700 (PDT)
Received: from [192.168.1.17] ([61.2.112.87])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70707ed62e8sm6103776d6.109.2025.07.23.09.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 09:40:24 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Salah Triki <salah.triki@gmail.com>
In-Reply-To: <aHsgYALHfQbrgq0t@pc>
References: <aHsgYALHfQbrgq0t@pc>
Subject: Re: [PATCH] PCI: mvebu: Use devm_add_action_or_reset()
Message-Id: <175328882109.33917.12360207254850484850.b4-ty@kernel.org>
Date: Wed, 23 Jul 2025 22:10:21 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE0NCBTYWx0ZWRfX+uudSlhmJdSF
 g3VmKHElDgRrEnZKaxY53sjjQp2+9xZVAlxtqLyDjmExuLBeUKnxZQWEfBAKirMFhah9GlxB978
 rCyJWilnzSIMhdl4hJ//DhHO5ucNxDqWVRjz9XP5P1PmgON92VM6UOXpzQFP9GELZqvBJPd6VyM
 iA1KiuG8aaW+E4Ctn1+X+ZMNero72A/sUhc+v6VyENwJ3XWFfhOsW1s49c71HdxV1lMwadydo5Q
 t0CxOdqpu50cBBd+tXb/bHqy0+MJZVoFsRedKJfVig2hvEQkdOdnU2OJWQtVCZI9aICJRsDQNKG
 X2QVrS8SXKhfDNV0Mt0RsLa6HFm6aYVnE0rnOm8OIgQXDV99O5EPcYY3s1AUGk+nxg9RnPSa8vD
 6wjTGYWeN5bHOdpES7bZGouY34ER/C3arQgqQFL2T+zds+RksMzEaXm8nF2APZg0kpI+ZpE5
X-Proofpoint-ORIG-GUID: 8sBajySQTd_wAlmJz4zmZ7GGPKXW-bA_
X-Proofpoint-GUID: 8sBajySQTd_wAlmJz4zmZ7GGPKXW-bA_
X-Authority-Analysis: v=2.4 cv=C/TpyRP+ c=1 sm=1 tr=0 ts=6881107a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=L2vWZV9GmkZVUxua0bORKQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=MlpMO9RAmn1aYvgnbukA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=676 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_094027_594684_C477409D 
X-CRM114-Status: UNSURE (   8.82  )
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


On Sat, 19 Jul 2025 05:34:40 +0100, Salah Triki wrote:
> Replace devm_add_action() with devm_add_action_or_reset() to make code
> cleaner.
> 
> 

Applied, thanks!

[1/1] PCI: mvebu: Use devm_add_action_or_reset()
      commit: c79a7ca8fb72a17db03e916438c44d9afc98998f

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


