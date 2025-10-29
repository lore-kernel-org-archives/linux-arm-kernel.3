Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF3FCCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 11:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E7sek4J5JcaJw3gQMQZq1+elUkhg/cQB5aGi2C7MD0c=; b=aGMiY0NAPsgRIxOSacZTk4fM3f
	jFfczX6O5jXN4rKR2d4YzUkjyTMWW5dG33rETXax7+Ms0NbFGxVN8hClTHWXyQf0ns62F6NNmQW7c
	cjuvn3hszKdvjz5azfTYL8g3cW9FUstpEZcKYuFMl+96lWkAG6ot4AhtN4pPndvZO6SYnUKtufEn0
	jKk+XyrRr7kvt8NIzNfmrNE5WtyB0aJN1D3x2i98DCwdug3fYkxwSSAnmSLzwYq39FEHHxVqGCs9m
	KXyCKLJFY7xp9UQKvgBeCtEW6eANa7p6U7mhK+0p7B8HmII6aZ2FQ61pBgK2vRb1s1ZC0z98fsn5P
	L5748fQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4Nx-00000000zSx-0oaJ;
	Wed, 29 Oct 2025 11:30:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4Ns-00000000zQG-2ZUQ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Oct 2025 11:30:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=E7sek4J5JcaJw3gQMQZq1+elUkhg/cQB5aGi2C7MD0c=; b=a3jhEdHXaa3dgEQmEZUP3oUTU1
	MA9yflABs4TpBkZmvauFoViiv/P33p9HE71tGKncuqSIe+Hna9HRqRCBKCIvNVGqkGg3pTzsCOw4r
	b6fZ1gpvXK4q4TFIgNZX+OPCallHZMoAtEGYCsKbzGr9BBxMjinH4VU4DGiuQRusQt/XgVNU8ihoN
	EhjUtj+zvk3OBjwWE1y/KXsAvj7wYXEj2yRmc3vlyRlkCfHwkpDGZC2i/uAtJODEwQmEYY1yyP8Hw
	IRlXFWfI0mRlWesSPlrY6YH9Pj4KWyRAiJrVauO908SvxUZw6KNmiElcm0bMdq7vS8WNOQ64GgBiI
	0q1dL1qw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3W5-00000006Zwk-3c61
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 10:35:00 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4vKlJ3643374
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 11:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E7sek4J5JcaJw3gQMQZq1+elUkhg/cQB5aGi2C7MD0c=; b=DQPSGRmG3c/8SrOx
	hqpZ7nzbpvZcXxVBCYDkX3lp0iIynf0YJ9jSm2popx9x/W2tIqNQLHpxNPNNy1kK
	nNXc5052y/Gu8yuHi10pM8X6E7LZhTPwyQ+5VFwbLI0CBrrONyfNX81getHpm7US
	VuK/wBbeS8pTk5KLwwETTR9ehtp00ad9dWIFLbZbeTmHszY+SqikC8Nvo+Nwkf2q
	JemCs8bbbRv78vexmxtUagVKMYfiE43bA+dCmEkp17+xxHQTHANjVt/LoX0BP/+y
	lx1+JviLcikFwqN7TLY1RRjjgbFsU7+0wyyVtgyNNovzwP2pLev0RwWjO0hWVXTb
	R3LRRg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1jcgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 11:30:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2904e9e0ef9so132800765ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 04:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761737425; x=1762342225; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7sek4J5JcaJw3gQMQZq1+elUkhg/cQB5aGi2C7MD0c=;
        b=Lh7tUDydkiJp2Ec3ey3rr+0llAvoVLfYP5btDyaVbaIXvln4X1zK0LDfobFw1VzaMm
         7ZxNxbzpsffp/JSQ0LmU4lClWovBtPaPVyOwRncaMbmyPc6tN0GVmpS87MdWLpDftUs+
         gkrJrH+dRDdv0CjV524E2ipemxLYwZeBoGxxXgVaKo5vvNILdmSZBvsE+Vkem4gho6fA
         MSdxwtI63FqjleJiwvMbL8uPo+yn+ObKWR5AsmIIryG7Gr2h2vyFJeQ3P7C7F0sDfw4S
         ge5NGKGisH2Ktb0ffkRFMNmUmc0KawYB9F6w++Wxa4vMK3eJ0LP1vd4cxB7jsD7QGETe
         cn9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761737425; x=1762342225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7sek4J5JcaJw3gQMQZq1+elUkhg/cQB5aGi2C7MD0c=;
        b=N2n9enun3yh8EJAJyOpAida5LfDChPcGiOZre8HV/R5Bxx7s7aaUb+NI0xaW6woKhf
         MPhPBaaLMZqjDissQ+4QmOLNkvWGcXroOFfKhbc8J5eOwv1OxJw0QWyNmsxyCuwbs0e7
         0lvoRapm2l+2xJIsAfbbyU7e4hjJnasgttitfs7Twr96BnegIU1n1C6jX0P1MTVEGKyG
         bwEk6PU7DurXzPbQx/hePm0lGy3XivdNzNH8kWM5l8aWDfIv1OAWYddkdVLkhiHRnTrw
         brW8562X67Fxuv64dQR81E7uvDROuTY8z2kittw4Y4dPZnLdK54s//R73QVufUrnB1sw
         rn5A==
X-Forwarded-Encrypted: i=1; AJvYcCVdkQmtR0gz3McVxlaMs1Fe2wEzBhNRAYN1EUXk7gWG8wup6ojlDrRL+nNc03P68U842oeuW1h9vpvyxFd1H2C/@lists.infradead.org
X-Gm-Message-State: AOJu0YxcZyGfAKstcuJGjK5cUuLna5qcZva5JW8VypIwtAyitEQAcwwO
	FxaT0VWUCOk0XtIly1wC4oSx473Vau2x05+bo8seQvthYDpJVP54V000ppP+mzxlMTV7JhnLbfQ
	7/9UZNxZ87YLNbGQBxt0Yuc/Q+miMF/I+tL66btt/H3qHyOnp7GrCmdBN07Bgi4vNeigaao8a8A
	jm5A==
X-Gm-Gg: ASbGnctWB8QpS1YiZByANsGf6D32TywoPz97X5j4cLsGAJU8owgZ7SvvYfQLtAuWzL2
	wONgScwXCnxYHtpR+CvFgOGGNx6TecQPVp+AREPF3bzuEdL+tGrPxmrGT9NAYZWZk+AaoePLlyy
	kujTFpddmNKnU7uPXSPZuUArk/wp+BkirpbsMIgeVElJZw+TPOs3c7FbNcT2wt0wMwuhNC8Edz+
	CGPM+zasdnai9YOEA1TOy2SocY5ppTh74VyNhl4N+53OO8LawCjF4GA0M5GH6Bvimt0CPtW/SbI
	L6EsEUN8FZJjvCK5WyMRbu//Q229r8l/ZO9w93UvGIGeN/EDDbnk8RfzfYCmKdhr+AOob4cR+VU
	3ZC7AMHflqupWPWm+cCoMT8pzspbzFwfhJA==
X-Received: by 2002:a17:902:cecb:b0:267:ed5e:c902 with SMTP id d9443c01a7336-294dedf64cbmr40460785ad.20.1761737425051;
        Wed, 29 Oct 2025 04:30:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIfsHVKEWsWz2BHUSJeZ10JbEH9dJ62Uke5+/3SiZnq91/wZtwSuoAq+jP/ohaK8whQGV3UA==
X-Received: by 2002:a17:902:cecb:b0:267:ed5e:c902 with SMTP id d9443c01a7336-294dedf64cbmr40460225ad.20.1761737424487;
        Wed, 29 Oct 2025 04:30:24 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d429c6sm152154935ad.85.2025.10.29.04.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:30:24 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 16:59:56 +0530
Subject: [PATCH v7 3/8] PCI: Add assert_perst() operation to control PCIe
 PERST#
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-qps615_v4_1-v7-3-68426de5844a@oss.qualcomm.com>
References: <20251029-qps615_v4_1-v7-0-68426de5844a@oss.qualcomm.com>
In-Reply-To: <20251029-qps615_v4_1-v7-0-68426de5844a@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: quic_vbadigan@quicnic.com, amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761737398; l=1537;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=kRgViZa4KGaZCel0lL7UaLwBZ4oTyRhW1O/XbfTvd4Q=;
 b=Wn2wemwGSrMgNe5eofO27eQXZ77sOUAVyX9DJBD9M17t//dwyKWk4QUnx8EayalfEjFvvcFE0
 tBAHEzTYMVqBRoueX/dG+9i/X6PIb8NzwikYAt6G/sCsf1iLvVEfEL1
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=6901fad2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Ocqi7cVID08-S0eeb-IA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: I2yanKiRLCusJGIa3yGFbSIq60T2qCHT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA4NSBTYWx0ZWRfX9ySOydD6NopF
 hS9ytmkstiMnEWG8RkjntgS2cSXcp/6e0CuSW8Cdbd50BD3+xysMmAV7femqAsYi0y1gskAW1Iy
 LBGhDWUo3pFYcDVGkELlridBq/PuxVai08Q91WdlxRE5/k73TKotpc9eZW7LRjoZG9D3AV86yYL
 KHgY+bRRqcToxghCjHPhTmPbG9fQ4cM6JoICHmQGNKGz3e6uGxPXJroEmYOd0Oe+zuBIydOrzzx
 BjjIZG2CCyrnUYxmC0QtSKjUpgmFAaHdWdijNQeK91jcFtYARC2D0ulrjdosrVPLYPgqjeRSldp
 ornVNbrODhtULX1RzktKt8304PkLYHEWRkgZRkPLwdAabS5sMJNp513xQ31aiG9L37qAvw+9WCo
 9xPCZ5oW9G56qXGsPGSK+SbmCB5BXQ==
X-Proofpoint-GUID: I2yanKiRLCusJGIa3yGFbSIq60T2qCHT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_05,2025-10-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_103458_377097_24120E38 
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

Controller driver probes firsts, enables link training and scans the
bus. When the PCI bridge is found, its child DT nodes will be scanned
and pwrctrl devices will be created if needed. By the time pwrctrl
driver probe gets called link training is already enabled by controller
driver.

Certain devices like TC956x which uses PCI pwrctl framework needs to
configure the device before PCI link is up.

As the controller driver already enables link training as part of
its probe, the moment device is powered on, controller and device
participates in the link training and link can come up immediately
and may not have time to configure the device.

So we need to stop the link training by using assert_perst() by asserting
the PERST# and de-assert the PERST# after device is configured.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 include/linux/pci.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index d1fdf81fbe1e427aecbc951fa3fdf65c20450b05..ed5dac663e96e3a6ad2edffffc9fa8b348d0a677 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -829,6 +829,7 @@ struct pci_ops {
 	void __iomem *(*map_bus)(struct pci_bus *bus, unsigned int devfn, int where);
 	int (*read)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val);
 	int (*write)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val);
+	int (*assert_perst)(struct pci_bus *bus, bool assert);
 };
 
 /*

-- 
2.34.1


