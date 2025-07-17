Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77CCC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 14:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbhmXWPJY7pmHOFjqW3eX1bvP5tBeooNN1aFAxvXwOE=; b=L+7GF6xcCd9G6+poSepdvJAb+U
	FugwKhW6depbZL++SPax80uh32QAR40LCPbFbwRrHfzZV2mHsesqX8l6V1MbaF1rcFEm9qfYfDy++
	y3oXx1+wjtvrShIMHp8WAqCq4M20/AGVg5E8vwRy4KAkUi+CILp4ZmKSy0Bft4PqHg2qL/z8ABZXk
	BTn/Ca4LPrqCVejcpnsijuLQE4dFA9TEXsLY7djBqlCur9dCOt7a6lNOKsUJB9EG7pQSxCkqzixLR
	b2CckqTBejOEb2OL9t1Z/ME/cccrYkFOk2rPFw0eXgL2j2byLemcYOcNQCMEjUOye97OFu3pbMf6O
	oKLtJ+Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucPIn-0000000AKaF-2yJV;
	Thu, 17 Jul 2025 14:09:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucOEP-0000000ABzO-0ETS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 13:01:02 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HBTNR8021536
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 13:01:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hbhmXWPJY7pmHOFjqW3eX1bvP5tBeooNN1aFAxvXwOE=; b=FRtvwMoq0YR9Df2o
	xCEBfbJSCRwfBo1nRxKFf/v3wP2xzG6fKNUJkhaTxkh7vL0Q5ZuPF8YK8CzAvO2K
	qmDihKXlkXESsnvcFu0Ng7fYMHWLPhvV8GyI375FgPXsTogi2JgNov+c/4oXVZE4
	5fjv3CBAL33uHH+t4B4BrZVLgve90o4bB3hWMUzWJtItEHHogFEAn1FF9VMonUFo
	b4KvVTmpXxxfvctqxXfHw8RPXvCjsJSq6KsZXGhngPiT4hWOVwMcs8AggIInntqP
	uaWG2BQaOHMF78iByhdOrPqPKdJkMUQZ2zff6kCI8u0ESX6O6T8WPIyIXws6NNy8
	bmek1Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpjrex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 13:01:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-312df02acf5so2118383a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 06:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752757260; x=1753362060;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hbhmXWPJY7pmHOFjqW3eX1bvP5tBeooNN1aFAxvXwOE=;
        b=R0d548/0eTmrNQC7pYq2Q4jpXEszPYX0pzGl3lg+qJXUBnSLq9sdzbKTOHtBeB4KK+
         tKwqvSABCKsSsJbt/Z3b6VjSZV5I0TaxTmPcj/mMXoF4nO/aFYokwYrjeiCer7IN/gLx
         MXonrNG5RN0swGxCp4KVVllyWI2z0CsKqR37Lljr683DplYC0K4HTx56b2TjP7PKKBAO
         7FD3rzYlDsZ1f+ro8FmOWZ8//VXLfUpZp8ucPKGTdt/QIzuHQUIBae93ch3MrDFbNyIz
         jLKXtmw4qFI57/hkyMlXgNLPjewdTCw3bdR1nzs2msnKq/mO2JwgZ6VrRO1IxGzL+web
         BGTw==
X-Forwarded-Encrypted: i=1; AJvYcCWUjakqW8vfbyd+Xmsq84V6vUqAZM/tpUdKS7ZJcjIe0V68tFovwokZx2QwAI3qTnc/MsFoUaA98r1MKEw2ACHn@lists.infradead.org
X-Gm-Message-State: AOJu0YxdtXeChdhCrk2cryBgUn4jcSBt6VqmsB/zh02GRFJcpYdbloLD
	ihs0TmVQ0+3VU0KKodV+Rs+fiyS0Hyenq/zPVej3CG/BtvjdAcAIiObhfm84ivX0ReiO2DG9dFe
	hih/U6W6zXu6XPbSXSyg61dxzzxzp/g6T4kbyEABpUPdJ6OPjoCB/+AhTSoyQ/SSTVr2fM00NJ7
	4F4g==
X-Gm-Gg: ASbGncusivuiVqsv7sxNQ6IxYQ6SFS8RLXxp+fRDQarNk6r9gT8SCcZO1XW+THvY4r6
	UfpWlM2gV8wR1cEGtaBDgaZpMHYCdimJtlidycY4hTvQ4quyZb63SGnRUQJ6+2SIct3p/inV6w5
	zMonfFY0n5zhQ9XIvWMYzPi3RvlPdVID5zDI6wYFUdlrHhaqITFz7TZSVjPrAGJRCm8SygI1BLB
	rfQvKvJ+Kj6EInXZHemYO5JcEliniujDGBKIfj1Zu/VEPfloxQyk9E5nYn49swLL6P+sGNVY2YX
	PIKq/X7wo0eQ9BBbWH4/qMB37L7OZvKAhaKx
X-Received: by 2002:a17:90b:4d8d:b0:30e:6a9d:d78b with SMTP id 98e67ed59e1d1-31caeb969efmr4073958a91.12.1752757259490;
        Thu, 17 Jul 2025 06:00:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5PLDck2EGokNw2/kOyuLUXwXYjEIGyQ0OoopjlHKyIHHS+CdhEZJonc7VdXmvkZ+TmDh1Iw==
X-Received: by 2002:a17:90b:4d8d:b0:30e:6a9d:d78b with SMTP id 98e67ed59e1d1-31caeb969efmr4073883a91.12.1752757258849;
        Thu, 17 Jul 2025 06:00:58 -0700 (PDT)
Received: from [192.168.1.17] ([120.60.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42847casm147179855ad.14.2025.07.17.06.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 06:00:58 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
        "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250710180811.2970846-1-robh@kernel.org>
References: <20250710180811.2970846-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: PCI: Convert marvell,armada-3700-pcie to
 DT schema
Message-Id: <175275725510.8776.12544993424568474887.b4-ty@kernel.org>
Date: Thu, 17 Jul 2025 18:30:55 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDExNCBTYWx0ZWRfX2urqHsLfANgc
 Iv8LTclGbQmWsCXlpQSZ0XiNpzOwpUwPJkEY9JPtgtNZhJklolvtxL3ZPziqrMYyF5TkQtVG9PR
 b5YRH8SRPFdKSzwGUwdHNfBqvBFcY3Rzro82Dz6qBoF2hE9p3I+wniKtYzUweFPbus29EXCPq8i
 UsK53oCOZ8qPOb8OCSV7k+x+n2I6qNzKg9ZLD2ZR1P+PtyTaRxNlqHXWEf0lecQx/lUc0UxWAtO
 vq2jRFirBNznJ4NYPCtdlmEHYwHMfL/hTB/zxT0HvPMvuI+QIHBwytTwe0tnl2l06L+sRZtqDmd
 wRQKtR9xv1DtpPeeFy+P2JnwUBWbo2UgYVMhy4RRgIAOn2Rc4JmOkDzQ7NuhHND1Ne2hH0aT0XO
 Mcifh6MzkmeLOQNiQcubnw1i2URUA2W+DmZgCKbplZlb1G3gVgsNEF5oys93u3TleYslNdqY
X-Proofpoint-GUID: OPMNU_kLC11nqNlzV7aYNOQFVqymMDXb
X-Proofpoint-ORIG-GUID: OPMNU_kLC11nqNlzV7aYNOQFVqymMDXb
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=6878f40c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=A4mJK6/VAfRUM2WLv3bxlg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=ZvBNaTAgAf9eIsPa14YA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=836 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_060101_131215_7F638005 
X-CRM114-Status: UNSURE (   9.79  )
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


On Thu, 10 Jul 2025 13:08:05 -0500, Rob Herring (Arm) wrote:
> Convert the Marvell Armada 3700 PCIe binding to DT schema format.
> 
> The 'clocks' property was missing and has been added.
> 
> 

Applied, thanks!

[1/1] dt-bindings: PCI: Convert marvell,armada-3700-pcie to DT schema
      commit: 7d372e2a37af6e02a643f0be80020b05d29b45cc

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


