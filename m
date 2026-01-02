Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398E9FA3744
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 12:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+3Kw9OcKjmyi1BRmckH+Fe/+mzaD4IcuRMjS7jkrxA=; b=JRjnHtw4M9SaRUWngu9Whwp5+a
	i9vvX+tL5gKv2I8LHZDaxpNpVtxT1rj4Im3nwdUR7Rj5akK23YiByaUJzwuq0eUISVUyrQARWM0Oa
	7qAJ+TvfLQQd6EnGHhG6Y2CibxR7c8X6m2D6vlb+0WWoxNYu4MJCidP2924wJbSLSpnfzuozocmZ+
	eXV0eNsZcqJXNUfzLg48mKH9kGbPPqwKkANhttDR9GsVpdKONpMVcWty+3Q29G44tvrVh8LOPaW7Z
	Am+KxfaPhFF5mU+kkLCAmuCQmPxVcg5ITGji5i//WGH/QDZwwoHcm33dTynRxqTaQhbxZP1nYr23n
	7+Q3vIqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbecK-00000008FLE-2upX;
	Fri, 02 Jan 2026 12:50:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbecJ-00000008FJG-1TXW
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 02 Jan 2026 12:50:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=v+3Kw9OcKjmyi1BRmckH+Fe/+mzaD4IcuRMjS7jkrxA=; b=btRQatPmmkPQ6G3IxiE7zwN+VI
	QwWTAMmonOEQIzJtN/wVOXSklrUTtncavx9AgtDzKd+HHBEVOZ4JgfJ6OSLn/Rgwr5oJXDEDvcQPJ
	5KQYj44xh0M0yFacGXXiwr/L1Xner+1m/vA4mVnhVG4Qib9nYjAqFUwaitjLGLEd3mfJcfP8eDkyv
	A4SQafzvYUK+PbhfTJKRtv8ib0wub/BqqfZdMDC54GhLxbpYDMlLeiQm6T11DZ6mZf4rLmNFhxACi
	mvdelnCF0qNKFNK/zCusbWLHSHs957HKByGQbf+jdXU/XiIb96Sy3Q4iKBx4YVR7EFQLaOaw5PLHi
	jAajs/7Q==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbecG-00000005qxn-1SbG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 12:50:54 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WEPJ824541
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Jan 2026 12:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=v+3Kw9OcKjm
	yi1BRmckH+Fe/+mzaD4IcuRMjS7jkrxA=; b=Z3rRy6o99Ek6SnSUPQ3d9ha1NQp
	MSh9lekW6Uu+XYNJ1baj8asA55OgLbj8AE64xcVryPn+z8DbRhtbJBwbA3Yj7EfX
	miPm0rxDm5pJzR89xVNN/ojUTYhG0cFOzj4rxWzl+ntyqWbegnoQG2SWoj4zlaEq
	kmmt8E4DzUJLm8cjNm65doFfGIcNpIOium2oV2/KQCL0s+iNh1IgIHyvBkjy85s/
	YUsgLkWVQrnB4PR78sqc1rZaOx5kuWu3jC83dzrjjtuIzj4zTDBKqR82tVD5k3he
	WoJCwADKO/XeRQwkdXIJjReXI/acrUCZXByXW5lJAPFQKt7DT25l8xyb4Ew==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd8533c25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 12:50:50 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a360b8096so323951076d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 04:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358250; x=1767963050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+3Kw9OcKjmyi1BRmckH+Fe/+mzaD4IcuRMjS7jkrxA=;
        b=FzzoFMUGBD9rSvlrxzDqEaVX7D6pQ+xFRrnYQIk3WSjNpOzdcq1uHPuwJxlrHBczsL
         7V+h29FU58Kkw/oM9AnHmYmMtqBkHGTTyLuVykmq6S4IiX0z6G2FpnwdMDRPNcedk3pB
         WcQYUhh7X2RUmOY3VKvrdSIjWKST3A2ZFRFPUkpqhZj4MwViKXXHAehTK8BP451nz0Ij
         RO6NuEVCWuODdSm2M18tMqM35FWRSd3Fo61wCOH4qPm/OjXYyqHjuxhovNQdTe3MOSDL
         yJGj+tTLtO5kTfmOMD+QJbMLEWVPXUYZjOf5Zy3DlvlyhaXGs5tSKhJZvC3Fdn2hr4k6
         jPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358250; x=1767963050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v+3Kw9OcKjmyi1BRmckH+Fe/+mzaD4IcuRMjS7jkrxA=;
        b=NE19gnUhko7clUvBDSWlpsuFu85vSGu1BvEcWRIRXqW/lS67SgwUZejWoN2A+TprXG
         3ZfVwNdVoHmHYvPVnOp1x8s1qy1PRW+w0KpiOxnF1EAwuAg8W9H/SLRQ7ZNnyUCD6/Nx
         rgYPq2TFTs8l2oXwzeOJYkMbogjREsKAlZdL/YNhSWS00BJ4iurJJAJ3ZNh3OIE3XADM
         7r53UHr8QMHq3pTKGKKk6skdSqPrHikyh3dm7rXz5GGclX9w8ANVfroapQ1DoYQ1TK/E
         fa2Xn9OKcyk01AOApBQ7krYpVfgIABM9ZImksdMGxbxHq9R3OnSkmxNDu1Ta9LgM746A
         QH0A==
X-Forwarded-Encrypted: i=1; AJvYcCXohqzGbjFSmvHrFzh8VQ3C4ROYS+wpPYkehI6NeiD2LouMDQyMBzsoeA3GHXY4um+gf6FQg3n2k1rUaaG+1ihR@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg8KEpKhcBZYmirZO2Z/1lLBx8aP0wb/oo9dxTZU89B2bj2/Fw
	HJlKnqf20A08ezxq20iqHgm9i+jbTTlYcqz/j3WE69fbrhlkBM958VapuWqzpYK6FYjkMUhvno3
	gI1jeExjxXzFC7fAWlEyyutY1izMeT7tkMV5TV16/+UgWPHN/LvCzAKYKdqGMjhtbpw1sxMmjih
	UPJw==
X-Gm-Gg: AY/fxX7I+fk09zfUlbEixpPTvZHNuO+UB11Z8buaciVpsQ2OW8/Q87REEcfbj+9yKjM
	CfodkL2sKHaLpfS0YQolU3s0DZ0GxEExA+sa8MmCGRRYGNcWCYEm11V6oO8oC4caHtZFbk/wr3y
	wMBfHUPmtU+6NTKUbvb/uVLVOUsA9UOk8Q1v/gj7tuoSMI+2DrIvczCngq1n2w/6UCL6vxoG5HL
	ap1TynnsDtBHvkcRKYoyYFt/tIj8D4kcH/gkZMmEE6gnaUaoH079fZ+Zhvv0rRqlsB+xMiP/isz
	uW0M99AJDUBXBd0sCcnqwNT4YIAXW+w30frKOG6wOmQceaeqWshh11BKfhw4bT9S62tTJwfbS0Q
	c5uTSv8F7KlqGdS1nkXUV9mQBSA==
X-Received: by 2002:a05:622a:2618:b0:4f1:caed:da6b with SMTP id d75a77b69052e-4f4abd2a295mr600889951cf.35.1767358249727;
        Fri, 02 Jan 2026 04:50:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7zF9JMBhGYnhDGu2/Y0ko9eaoSDqiHsiizO1xN0OYUtERy0LAazChQnttfMnUTtvdemOVkA==
X-Received: by 2002:a05:622a:2618:b0:4f1:caed:da6b with SMTP id d75a77b69052e-4f4abd2a295mr600889611cf.35.1767358249332;
        Fri, 02 Jan 2026 04:50:49 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1aef7sm84491369f8f.7.2026.01.02.04.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:50:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-ide@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/3] ata: ahci-xgene: Fix Wvoid-pointer-to-enum-cast warning
Date: Fri,  2 Jan 2026 13:50:43 +0100
Message-ID: <20260102125040.65256-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102125040.65256-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102125040.65256-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=863; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=aGmWnDdCsPxP/9AQk/c0mEIwm2GvlT+MuDcO0Ejg9Tc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV78itUdE9YSsc0MqT+n0aMAWzMrTX9ODAm1SQ
 t71zmsGjr2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe/IgAKCRDBN2bmhouD
 12NOD/9REcyL8OieJxiuRb/ZhNCPYYaSi2Nj36SpP3T0OuvEZp62VrrrKXsCNS1LIZ+oQS/VVOK
 PZsHlHBwr8EDxXGJBdu/rvbqDrjD+8sKcueg3vi9YPEOiaTGJEyZ187CPJ8zsBLGRIc+XtC4v6A
 D4ehi1+0q/avW54bXJbpn3DRpjVe/8CVBD1yPl+tiaY0nCcecPr2+9PnZePH2fbYJN9srUPSX0t
 o8PRzsXGtN9NEQ/S3nLw49p5tD0I5k869pZUPzNqoOQ2bCNT5Na6oIDuDip8gUYbTYd7C49gpFG
 Ejd8hPx151oAGReHnZKpMWjuyAGjusJznztI9bH4tEW9OX+lbjIgL2OIrRSo938ldgDDLtPTB4H
 KzicAZBG27TXC1Uh7C0nw8Xv4w2qH3Ptd+tZ1gZcuSmTS01pDZL5t8tJs32/UvUBfGuLVQ/Ph84
 8jnuWu6mlZ+Kf0uHrRMKfI1CjoLOuHDWvNk0XWE5qJZOs8RmaHFA5RmdctcO0jI9jDsCASc1Sf/
 gm28x4MP58D51Z2WWQbc5wG3wRMz9QUoHQswpx4i18ZFDsn1BiwJCYKq+bzAkr24zcl3OYvKsGE
 CBCE1EYzzb/w7nFsJTP+OMwhIwKhP08fCkf8yCWATzR3O/ZnrNrE5FuPMUb+mapOfLRxmn/KGJO 8egNX5LQ2weKIQQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DIztZeeJaoK5eUBPik5pDqBfwEQJNZOU
X-Authority-Analysis: v=2.4 cv=fL80HJae c=1 sm=1 tr=0 ts=6957bf2a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=O-IaotXkb1TqCMFDYkEA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: DIztZeeJaoK5eUBPik5pDqBfwEQJNZOU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExNCBTYWx0ZWRfX3PDS+6asGZ+Y
 L+2PZO9P4tZP6KdnPe1gWX5cukRPNVU+h28gxK7LxJHbm47IQ+CuOm1jBLyKJ1HODPYWGe6qLeA
 9fwMtqcKOV5aG/VwT2+ajQUWZgE6QBsulfCN3wx91n+DWncYWlCHhre5of+Oz9zm6W0TUyn4uq+
 vmxmXhPJmWHdmPOdGb6qcaAgs5LeZR+WjpV24SQmx227NEnj+kTkwwqhq/rUWin0QdFZ3zmJ5AK
 3QlGBy5RCuOro3snmXSGzt0XO32HhAfZ4CmkeYkem4LGkkN25MCNSrMHjsodcRVRp8L2YcG7br6
 hliW6CquXpzorTSgxXNg2e47k7RX99eHTsJ0PBzLYgq4fIjwENErIie2VrzihvDT1EkiqCh7kin
 nq0+RWROS7yvE+vnmKNkZNwYZ4lOLEivZO1b9R+8+/kfAPntqOc+Xa72jKq3peJI23FPqDPYo0Z
 jTKLEHFjPi5lP5gLjAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_125052_751453_4B2907F9 
X-CRM114-Status: GOOD (  16.23  )
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

"version" is an enum, thus cast of pointer on 64-bit compile test with
clang W=1 causes:

  ahci_xgene.c:776:13: error: cast to smaller integer type 'enum xgene_ahci_version' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/ata/ahci_xgene.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/ahci_xgene.c b/drivers/ata/ahci_xgene.c
index 6b8844646fcd..98c99b5a8242 100644
--- a/drivers/ata/ahci_xgene.c
+++ b/drivers/ata/ahci_xgene.c
@@ -773,7 +773,7 @@ static int xgene_ahci_probe(struct platform_device *pdev)
 	}
 
 	if (dev->of_node) {
-		version = (enum xgene_ahci_version)of_device_get_match_data(dev);
+		version = (unsigned long)of_device_get_match_data(dev);
 	}
 #ifdef CONFIG_ACPI
 	else {
-- 
2.51.0


