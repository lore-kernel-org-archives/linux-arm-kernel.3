Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AF8C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 06:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pTvHz9qoo7lj/uPQcyd9PKfnFrlOY5B4lOYc+cWrhM4=; b=1QUNKc/5zQ8+hl
	XyVgRqVUXkq2DKLpu7bwD+rtOleBA08TaJuI+LdEc/oZhfRp0tIIwmLw8gQAv+M2TVs5BMMi0mLxx
	y8hDYDrJH25MlCAqKW8qd8ghWa4lR2N3kOW+R0KJEGGdqzod1HWT1tg1wDMnjvEIHfcNhTLk8Dsr+
	K1bGz9fdQPCygby844DKxZFkWmwsNGn4q3LCQGnQGxLfrrGGTiVxGBv2UttghYynX+sOg4DTgaE92
	xKYbBpWzD3d8iqrBgDL+9gg+Il6e8A6C6+5G+y36Zx7T+A8quvjU7EekXwDnBOJDTxMnKcmFyXO1z
	kOGVApaTAUrIOXmzTfMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Svk-000000061nj-0U56;
	Mon, 07 Sep 2026 06:34:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Svg-000000061mV-0TLj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 06:34:10 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873l29C3235506
	for <linux-arm-kernel@lists.infradead.org>; Mon, 7 Sep 2026 06:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pTvHz9qoo7lj/uPQcyd9PK
	fnFrlOY5B4lOYc+cWrhM4=; b=DGjdxOGurNmE+bZopB47TB2PJonBJ+xOIJRcdu
	ELSsxV8DHkRNv82HBz99H67Ek+sKdyf18XjhO0D9hKBYJRA8LU1EDVVyK2xdHHyh
	uIeFaG/HVDCTtThOptqNqVBmc1NiOFsQjo7zSTVdo7vuH8JSiSa4oxTBC9xi9mHy
	Q5RwgtHwcUFEF0fJXwmMZvr4c0j8F/OzgYeSlOue8vqmQtNKuRjAC7cZ37NL8vTi
	JsgQ9zGRjEFU2qxtR3tArMOFltbHZ0jO0bgl1ZwTFnTvPYNd1NWiDCCDWcre1mCd
	bQgHmiFEsUtFQTN0lpD2w85/uJHcPDbY9Y4c/GsPAzfHm54Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gga375gty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 06:34:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d001671a54so58329405ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 23:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788762846; x=1789367646; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pTvHz9qoo7lj/uPQcyd9PKfnFrlOY5B4lOYc+cWrhM4=;
        b=KmgN9ME0CrWbH9Sd377AnXWWKtMKeRnfp6SpZhHFwQLSiGRMqnhh0FIHThWkwrUZRI
         Ux3yEuWr71M3Xt9F+DIDgb+yey4+FSA3siCEgyu2NZtSpY0YCxbEl5kYcj6N2mZbNH/A
         JlAMQMssd6pIIvnAKFsWay1Xg2jCKFR++1WKAl61FAZC5wjwi8lSWsIW50GWO8V+08Bt
         SnlIKsa33KPRCebc8BUFbDphtiWs9PHzgaozWjaRHBwv2/BMZxu4OFOyVJnp3hqERDKo
         PtLgTLE41oJfRVuhxWZP5DMyma4xLw5A4qWVjUVAn9S/q3se5BeKziJC1YqoZJUkkEh0
         /lRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762846; x=1789367646;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pTvHz9qoo7lj/uPQcyd9PKfnFrlOY5B4lOYc+cWrhM4=;
        b=f14hGCqiLkLrcaHhUmwvzMjvQTsnCci6iLQa4osh/tCpe8BCHo5lBejDByQ41nmp5V
         8MezbtEpJXgB/x740/UTWYlmSNjSA0JiSTvSRG3ZSADNqwH0NyO9yNOeSBl4q6y0HVE7
         uOxPhzyxzaSoNGt/DKuRIfZwTqYOhkEFhUUd+t1xSsmbRoORjAQje+fHJzc99UK0+LUE
         kFd3IFmylUaJQQVBMHL1uirHsTKrHx3gwGweVWRCDmhrmiAgXUgyW0crmS5q43o/DCMD
         xk4txiEu/AzG6blj5PMPEy4sUEtL6erhQylpKYixEczd3gdD+/IREb6iGB5uyzoqTJMO
         XYeg==
X-Forwarded-Encrypted: i=1; AKwUvBxDdorF3r9gNB4bbkbD6kGeFAI08Tgl41S2U9xkRqmg2iaQDp+5ZfBXYj6fvJ0ctbJkun8609WliRVKQBWzy+4j@lists.infradead.org
X-Gm-Message-State: AFuF++nKmENn2Lm8yqn8xZPhs7YNcFeGA3R2g5CgtTPm5H9DKnD33+MY
	3UdMMkgIn6opTWndM8x1IQteSDG6NH92aLcROCFRr67CdiCr+PXY6WARgm0RhTbLe5kdMOmv3KE
	E0ABeM+tKMID90BUq573mBIqIqWbEbaSKsJuXCTg7/28F/mGGRMMMBFovJDqhOnj2tdTsWEDOVf
	Axeg==
X-Gm-Gg: AYBFou1UO+INmP7cA6t2pGarFVGIhV/UGaIVgqbKTM3nuZ4Zm9RJ2KDRRrW0HSQ/LLl
	IHTQH3YVHq924nQapUSmCWJxQNAg19+rN7bQ+JghyPc6075K0gzNS6JFdA+M3cFRLX6Dng/0aWw
	+B0QBT5kzmkrf9ddVm7nOxkFqxN9b/a4EMBDUGcsWYbs2/Wo+OSYkbjsBpdi7AWYv9eH8PydCkk
	Smy3Z9iWCnIyePFNG+2rEWp/3nJol4TmDNslykMo0VCKNa8qaFMyoUTJj87vMOuqe+LLj6Mm84V
	FXSKPF7hpL2w/o8cVisJw7AzBoYqs8Gz1SD7j7HOzyRM48MNfz6px68/VZC9lWhbF97LIwe8qUc
	psIUKu3POAudhMSgDdB3rpv3tjghiWSgyVG4j
X-Received: by 2002:a17:903:3d06:b0:2db:2427:97d5 with SMTP id d9443c01a7336-2db242798b4mr205997385ad.4.1788762846131;
        Sun, 06 Sep 2026 23:34:06 -0700 (PDT)
X-Received: by 2002:a17:903:3d06:b0:2db:2427:97d5 with SMTP id d9443c01a7336-2db242798b4mr205996705ad.4.1788762845710;
        Sun, 06 Sep 2026 23:34:05 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33808be8fb2sm2440549eec.14.2026.09.06.23.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:34:05 -0700 (PDT)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: Add RPi 7-inch DSI panel overlays
 for Monaco/Lemans EVK
Date: Mon, 07 Sep 2026 12:03:52 +0530
Message-Id: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANFanmoC/1WNQQrCMBBFr1KyNhKnbZIWEe8hImM60Yi1mmmLI
 t7dVN24GXjD/+8/BVMMxKLOniLSGDh0lwQwy4Q74uVAMjSJBSjQqlJGxmvYNT3vupHiGR+ytMp
 a7x2pwojUukby4f4xbrZf5mF/ItdPml8i0m1IU/03Jlpixs9UnS3/liId5AhSSeXKClGrJl/4d
 cc8vw14dl3bztNZTdo9MsnpE/o6owZ0YcocEKA0eUVWO+Mh1wiOLBhdkANjQGxfrzdHoQvmBAE
 AAA==
X-Change-ID: 20260907-rpi_dts_overlay-58088ffce047
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788762840; l=1868;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=FOQT6r7Vhnd/HfW9QjxbBHGrf3p0Xb6nsG/ugl0Wl2c=;
 b=9avyaWPPCw4SBnNo2p/iK0EDEjdBweCAtXOU/opfYBJHasAIAmRVD9+i6mgC8y1PDw/tAUviQ
 OYo+WLXjcfVD991FSX6jBhoPb5SSd98xVqa7D2Wl4OM4LpthdrmEn3X
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Proofpoint-GUID: aatm-MKbfAuMHZLVmB9baBcjhzkMr9Y2
X-Proofpoint-ORIG-GUID: aatm-MKbfAuMHZLVmB9baBcjhzkMr9Y2
X-Authority-Analysis: v=2.4 cv=CbQ4Irrl c=1 sm=1 tr=0 ts=6a9e5adf cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=Q-fNiiVtAAAA:8 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=aaDu5AvUN9vEm-sYl2MA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA2OCBTYWx0ZWRfX4sIpE/8KCOeG
 bgFtiHZDXxTzlDbWsD4ASMgZDra6nSygyOWZPXFqVmcLy5k5At45rCS6FAwAAvFZP9L2m2vxcgn
 hWKQqEF0HP/hBrnx2rSRRLVFWFPFqqg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA2OCBTYWx0ZWRfX9cWdiZWuttLv
 0BD6/CsdFiad1hSZr405v/B9hrrtMVpvNaXe8Z4ypmFKfFGpUUyyBCDdmz1EN1NkswWmTRkGjkP
 ipNxFTA5z12B6Znm7RYHwhUtz5uLC33kiM77jz8gzmbeohb4q2p+KJRWA2VG/6BypWkfECu2NIJ
 2WQ6k0/Gy6/3ANT5YRqsCApWxyJv7aXpFXQWyB6m8AJlpfXx/SZaT1mhCtEhQIH9iG0pWCkZgLG
 g6mqQmm/sgjr2yZHXIc/yPxcgsExhCUrtIP2rCwqJ8iS83RbYkDlkOpblqM80SOMPvoDbl1XJur
 N38ZuPdYtRpdz5py4Ru6jfnutpsAgce5Cm0usCSrylLXS7ia8dRa+kDLA6HvNgcR4swyA1d+9cK
 9o+am085Kl7Ry4mlOoLfdCZrY5Ri1i1nf831OQL6rUuqwNrIWh8FpT+HP8Bd6pBp3pFZELF1keL
 2CWCNu3VSwjwITz3JvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_233408_271955_9DF4C53A 
X-CRM114-Status: GOOD (  13.97  )
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

Add device tree overlays to enable support for the Raspberry Pi 7-inch
DSI touchscreen panel on Qualcomm Monaco and Lemans EVK platforms.

The overlays configure the panel on the primary DSI interface using
a 2-lane DSI connection and instantiate the panel MCU on the
corresponding touchscreen I2C bus for each platform. The changes
allow the Raspberry Pi 7-inch display to be used as an external
display option on both EVKs without affecting the default platform
configuration.

---
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org

---
Shashank Maurya (2):
      arm64: dts: qcom: monaco-evk: Add Raspberry Pi 7-inch DSI panel overlay
      arm64: dts: qcom: lemans-evk: Add Raspberry Pi 7-inch DSI panel overlay

 arch/arm64/boot/dts/qcom/Makefile                  |  4 ++
 .../dts/qcom/lemans-evk-raspberrypi-dsi-7inch.dtso | 83 ++++++++++++++++++++++
 .../dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso | 82 +++++++++++++++++++++
 3 files changed, 169 insertions(+)
---
base-commit: ed2647532a225739e86c7f236a2ce82764ec2772
change-id: 20260907-rpi_dts_overlay-58088ffce047
prerequisite-message-id: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
prerequisite-patch-id: 5212bf185b35c36ed8857a67f29e60386d59ac60
prerequisite-patch-id: 056a90b913170106a6f8c1feb2366ee83c4375b9

Best regards,
--  
Shashank Maurya <shashank.maurya@oss.qualcomm.com>


