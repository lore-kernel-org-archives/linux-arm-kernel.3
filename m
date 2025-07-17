Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F63BC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 14:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UsxenPoC8lra25vGZoVrKrqJsQX6ay90sm0xWM3ltaI=; b=nDC2vthsIrc3IEvYTsYe696ez3
	p+MnNxveEpH8TVw4gOrwVxphcFETRAEsUnS14mKZlZkrAnBYYO7n0ZmJY+p6xCBpgvHcmbFryT32o
	Gdpg/ZmYZyl9m5DT7juqL7+seAlabIKFlNXlQ0yHhqdA1EKB9jXePIxNS+DckQppelqSNYcSBLsxW
	qMh3eVqBaLicz2Obzokd4XufuxnVLlyQ448qZHuQ1ynmQff9nkPqQY+yalurlZ4bHYKJj0Qjve1+D
	1o+00NGfN5VXFLcC/kdy/cUwjEldpiWTv76ARgDAoRgBNj1M2TxkT6JSXFAXaUsNVLUCyG0SFQxtg
	PAEWYcDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucPGO-0000000AKR4-47Y9;
	Thu, 17 Jul 2025 14:07:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucOEL-0000000ABxw-1ji9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 13:00:58 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCYmh0028124
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 13:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UsxenPoC8lra25vGZoVrKrqJsQX6ay90sm0xWM3ltaI=; b=D3paOvImo+HHDZvK
	1z6eOiH0RTwW/2Py4ROR3hnLNj3h3ebsfNzQ/3W8L0g23byXPueN4aMms8HvDxrV
	xz/hyDD3gC2qlFA6teiUO9Cepsy0V9wMoJw06X0Cg3YdEy0wQi95fw4lMw3sS1KZ
	LcWAH7330IDbzB1EOeFp5pFG/7IArmBl7u3bb3kdasQnU8IMKjj9qdA97Cb6D5wk
	TKUXqz+HRxYv9GcVpXrW5x5+RppDVtZ/gGL/DL/GFS4iSdgjsuAiyxiDYX0ai8GN
	kL3QU2lrByBzCP9RkH1qPpeT68L7mNJEgaJW4x+jO7U4eRzeqczGt0H9SttGt0Fo
	WQK2ug==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh5yxtg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 13:00:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b31bc3128fcso1250446a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 06:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752757256; x=1753362056;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UsxenPoC8lra25vGZoVrKrqJsQX6ay90sm0xWM3ltaI=;
        b=UA7mc5U6Q8wHHveMvHjOcZ90ElsB9pNbYB3KzLiCtDgUxLOEcdq6ezSjxl85V28ugd
         Rr04SVO54MV3Lv9v12T+YFd0xIo8ElTL+V0eIVPgzH3hfRMRq+MyHfJD+LjWSRBVRx0l
         +6dC0bXKzR4Q4tDV84iPCBZmpbCuRhdg3NR5crOSsU4qup9lGfAnKzIoaR7ay1XM2HUy
         oQzzf4g/0z5RDXC9aKd9/9dJVNloPiomxDmU65vsbSDDNeuGK0Y55Be362mwh+o1ORQ+
         667e26z3iCrH4GuUKanrnP11mZKjxTziQ2S6AK/um2HZLLyqsMxnWs7kSj9tvcI9mPxF
         t+GQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqYV88OYu0uW6gBjK8KNy0L3G2MljmEm2N/LKkQa6VvJH6zML8nGbiELMouNGvDH+t2QMX+auu490zt/16l3zg@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7/duHEvFFubk6tPKBTDHIN/7c19PkAvfLP7Y2awARU9vZTatE
	MLA9XeeVfbXJaBMH3/tEGzHBHLkr2RomUZXtBu/Sh0ycn9R7clIF22JajVUDYLTCRV+1Dq8mBgY
	o9n4zsLJtAH5sEfj2RGYDE+9MW9l9HayrWlNN/IRHKW/bxzZ74jmDMM5MvURVF3MEt/X34vnhf2
	1JGQ==
X-Gm-Gg: ASbGncsx13OX7WYRyLd8JMvBb7oO063UTae3YNPlg69xBhY/Dz4FSso+c83IPtNNYu0
	nRfUMO7Pxff4RBikcf5cjTxJPnDzlAu1a2yZ5wLNGFNTQe8RSWJjvyw7+lMZngUPd3AcshHZn2T
	rtYesyZS3CHKsDWbL3+TmZvAKALg5wPSBIMvF5SQDVT3ikvVfzRCC0odPcNHVBZF6apm398d9MV
	2dprxuLDxs2k7V+NDfB21M//77Xh7HKEQ8dw+l+rBDhSQhowaHfMHWaK7dOAei+gQSZZoWs6eyw
	9g+j69fzMq3rembhEBUdvNc29YL4KSYXC3Sa
X-Received: by 2002:a17:902:d2cc:b0:234:a139:11fa with SMTP id d9443c01a7336-23e2566ae85mr106699045ad.3.1752757255532;
        Thu, 17 Jul 2025 06:00:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6kLQyELqoUaThRM/8jo3nwD/JTvp0msjb/NlH5yEoYUZGlu5Twk019E2H65MO9AFL6Ponlw==
X-Received: by 2002:a17:902:d2cc:b0:234:a139:11fa with SMTP id d9443c01a7336-23e2566ae85mr106698245ad.3.1752757254911;
        Thu, 17 Jul 2025 06:00:54 -0700 (PDT)
Received: from [192.168.1.17] ([120.60.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42847casm147179855ad.14.2025.07.17.06.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 06:00:54 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Toan Le <toan@os.amperecomputing.com>, Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250710180749.2970379-1-robh@kernel.org>
References: <20250710180749.2970379-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: PCI: Convert apm,xgene-pcie to DT schema
Message-Id: <175275725132.8776.11740165619532481906.b4-ty@kernel.org>
Date: Thu, 17 Jul 2025 18:30:51 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=6878f408 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=A4mJK6/VAfRUM2WLv3bxlg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=Tk-7pMtUu1chtXBpElQA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: dWITY9sjwqfoi59AQiQ9NgQ2wVEak8jm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDExNCBTYWx0ZWRfX1ymi2mRy2dLV
 2Cd6VzNCZm9RpAZY8pFwQsy0K1IywYGXXFZbzZA+Pbpqr2d7GJJDrBwdqKDKPGxpDi/LPQ9RFrB
 oMi4HILSZaJUxTqzQlbhbdYE1dTP/w45unyQO+y09mcvC/nlW/BUOE6ntaptsz5stUTjtSA2jQJ
 WyuHXQAPcsbkN2ejcVewfHbpng6YmxlU9jXaAl5t67YwKm9nr8BTzXBYuVDAwF2S9faEFeJVWpY
 rMgpbA0zTQewFowbn6dLGD2VGhmim5Nni1kdWB1WHwzhqAcDTYTvWWVlOZx56OUjVd7yClOeH/c
 3kgkCtEaMeWzwKA5avVfSOyB8nq705vQJdTHzsHt0h/TteW2skLw+lZP48VQvAkZSIOF24LrtbN
 PVGglXfS2uutgJkdnITFPiGT+fFLOjTHwLyxGbV6/KsfMsbIvaPpGN84hbI2Dzl8PwN+/UjL
X-Proofpoint-ORIG-GUID: dWITY9sjwqfoi59AQiQ9NgQ2wVEak8jm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=846 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_060057_466159_E655FBFA 
X-CRM114-Status: UNSURE (   8.69  )
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


On Thu, 10 Jul 2025 13:07:48 -0500, Rob Herring (Arm) wrote:
> Convert the Applied Micro X-Gene PCIe binding to DT schema format. It's
> a straight forward conversion.
> 
> 

Applied, thanks!

[1/1] dt-bindings: PCI: Convert apm,xgene-pcie to DT schema
      commit: ac8ff3e15ec6c54f11d38a6f5016de323ca1d576

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


