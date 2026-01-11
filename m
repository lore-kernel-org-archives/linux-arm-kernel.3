Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9B3D2502E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 15:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GT4B0YFtEOT/3K50u2J8ovIjdID7YchtsEV1tVnlPqU=; b=HNpVXA8LCxq7fCBJ6TEr073rAa
	ZVpqG8LFjQmajW6pFp2soRu3wPl4JG9mWIhE1/tj2smn7p2ztzY4u+BwQrJh84xBK7lNH4w6OpiE/
	CO4MPaFdG6vGllrhu/CbNWuj8D/DBcIS8IzRgZiFPhu2qNGuY6bGvbYmQ8nELIBwLjwjPY/Zu82PC
	o0L6qsUTiDk1m4c0eP1K/nVGnCdUHSAvhRfv9KWCGImNxt55uJDRQpD7FcwoSOufhWnEsJOyv9KeJ
	yWWSWbE+4pYI4ysRefjGCaKv7Kr+56Cyxf1W4lpC4o5dCvBm0KevVq14THT4dbFWfAJusr80J0vKm
	QNItWIRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vexdX-00000004L0F-1E6N;
	Sun, 11 Jan 2026 15:45:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vexdR-00000004Kxh-3EX7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 15:45:47 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BD3mtJ1983500
	for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 15:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GT4B0YFtEOT/3K50u2J8ovIjdID7YchtsEV1tVnlPqU=; b=EnN+8QeEnkeRVJ01
	Nqeft8QRtV4Vw8k1szM1XMuRIMxNqF8znOGkkaQmZIyBJ4xU8RxxIlBH3o1jEk+0
	S7u1qMTCayaEFR5RwVYZ+mGLVhib+g6cVqgk+pFv9fcwK7UHpKBgqVpgW33fCauB
	z6zeyuP4GgQV/SdhueGD8ceSw2bNs7T8GPUpOqKb4fUagoivScqintzcCb1nC3xQ
	1v/5BdmU2ptWbdx81p3mr/VZw1OPywz6ed06QeOPFnzUkxkhySZD48u52Mli83KS
	YRXvfI/A09EtpI3gIbuAjjbyMfSXQnYzUG5oM8wqehIznbpel5GxIzsydihAHCmz
	mMmUqw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkf57acqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 15:45:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2f0be2cf0so1526518985a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 07:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768146344; x=1768751144; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GT4B0YFtEOT/3K50u2J8ovIjdID7YchtsEV1tVnlPqU=;
        b=OcP69vUwGr31jbsV7NrLTdHbObhCPDC2loId/xzSWo3qqMR7SzarRHcWUAt/aCnIAg
         p+mO7LIq8YncVmBGqZW0rn9+Mxo4iQ33+nJeKN0DUKJ5I9cSFM/IezniwKDMLZTH4nQ/
         Ri/MiArK3/BeTx/61qC+C8ibyANMThNclvu115igJw1f7pF1RXqGKyUmfp7x9GhrqsZb
         PclGArxX6ySL1liyDLi/khU5hKhFj9bKEFzRUScs4osyh5InmPNAST/kQOrlSzqqLSHl
         AgvcAt/VD05jNo10dbvBnn3Qty8fjtf0BzsNF29ftssn7NZ2Fe282lQDty+cIoKE1jmz
         k3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768146344; x=1768751144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GT4B0YFtEOT/3K50u2J8ovIjdID7YchtsEV1tVnlPqU=;
        b=mkOio85GtsZbwcdgvj9oTm1V64exlVsQB04+bg0/g+Lvgd8U2L+7cKGUU2ALH83Ny5
         8lDDBiJi0dY6sbB40MWQOk/Brg1Tc9k5mItwo6MkhQ4o4DRLz7sWa5ztyFpcBll2zW6c
         xXpMz1u6XYzk6lKajbGY37MgRXIC4O+Mau/06wA0WWK4k9CqJ3EIXUj7On7eJ5Rz0EMi
         3OMLB1xIfrPtsn4Ke742y2AYzIPIJHWaR/0PP3YdSydtLdIvaOJUj4mdX0EJVrIe6BTe
         lp9KDJd83uytMklFnUCFiuzzOFRhu6y3I7LzEIqmibmWlUTJjtxgu/kLMiM4AWCrvmBo
         9lIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxsxhsBGUD5aKgxcm//SCYDsLJUgy9jdZ6tVJ4lBCDyQUmz9c1SumhOZExMxUdi1M8sU/S7GMNn7hQ1yIsoBVq@lists.infradead.org
X-Gm-Message-State: AOJu0YxhS3DNh5JeQ4WtK+qq9Id7jEaefkkFLjp0OZjY9eboymaPQjoH
	ck0KbvJHUuS4b5lpLXn4ROBK3N0Iv14d4R1mdK5EiQ7IL50/QFy4zNX+DpU1egS4Pv46BLC9POA
	abEzZHsxzkjXzlv2MLssGVjdx0Ae8jW9xwTIC57soN5J+3JnZNVhTcBwiPhcl+8P8YfdXhJ37ri
	ubSQ==
X-Gm-Gg: AY/fxX7EOGJnvw4YgsmvM3ViHbq+7KhNGOmI40SySuGQwKmcFp/W1LO1Ss6pDB48DJ4
	nhFuXQSAJ15d8AqpZHM68jVIyyU8/u2G/x8lYM+wXVowS1Sa6wwv4fnTJYiU29zopED/Ruukn++
	QNbEiOaKoGW0f+ZZRTCIPL90CR/I//OsXvehwP59YVwnwDJQaWbvfg7ALPB7PQmuc2zNbKjWb74
	CvRvqDNT4n9Vl0gD6lk9PlA0xb75lQ8sRxpG+zGzjyvTH89ikvMo9PndjAaR0FMYlYV35VTsyVp
	j6ejauyn33FxUt03gSubOBV7J4opcxZtLr8FhjjTFrRyE6JDbUbdu5GSAdxhwpi4qSDcr3YHISc
	veUYiJzyHuZd13NCc4JvXdslBm/NdveZ2WA==
X-Received: by 2002:a05:620a:4151:b0:8c1:30f8:c884 with SMTP id af79cd13be357-8c38939e7eemr2071482385a.37.1768146344280;
        Sun, 11 Jan 2026 07:45:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEz9O7YN1enXB0wx3Ws7XQpMqq3t0e2A1DTAisft9TmruPQQQTLdjNv5Jgj+wrAeCnztv2Xbw==
X-Received: by 2002:a05:620a:4151:b0:8c1:30f8:c884 with SMTP id af79cd13be357-8c38939e7eemr2071480285a.37.1768146343884;
        Sun, 11 Jan 2026 07:45:43 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5180bdsm1636605566b.57.2026.01.11.07.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 07:45:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 11 Jan 2026 16:45:32 +0100
Subject: [PATCH RESEND v2 3/4] dt-bindings: watchdog: samsung-wdt: Drop
 S3C2410
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-watchdog-s3c-cleanup-v2-3-fab2d21a2048@oss.qualcomm.com>
References: <20260111-watchdog-s3c-cleanup-v2-0-fab2d21a2048@oss.qualcomm.com>
In-Reply-To: <20260111-watchdog-s3c-cleanup-v2-0-fab2d21a2048@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1443;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=81K6U7VafNJyQR2ZQhA/gQisDZ/YzqJjFN8sE3S9KJA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpY8WgQQOI8xuc4+r7KOXCHUB3EUibNZw62EmtD
 MMnDKY3Xx6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWPFoAAKCRDBN2bmhouD
 1/GdEACXHSiXCBO3zmG9wQ1XItLYf7CTnukRjdr27+vLVZemIeeZXDpraN8MVn6nxSUEZuQ8DYV
 ESDTewwPGB6cX0nH/YlLmMI41ckcffgjLFSwZsZvbV2Ij7KvJ/+Zr+GP3CyyRgxhpMR6hmU5xQM
 RJuoCyZEgsljnceiEOdzatnAXL3dUqyMU+Nc3A78+aFHlrn2O20+Ob/q4QQs52ZK2RRLOovNFdQ
 EumH6G9YBQP6cnoiBasSFZdUT9IqWA8GLujgP5WX6pqSXdy3KgLHM0/OJbai0lZ+ozIrX5mbQQs
 OFLGRXwH6qyGQbwXqbwF8fLpVeNsMDn015u6iOvpLSe628Rty4BanzY9Ofv2Qn2o4sCHUDG689T
 f4Qy0cu7HY0b9EZIu85rFoNFzKhQh7nOC+/0PO0wBiZeWZUxEBVjGxsetyBhaCBHvifIak7RhsO
 NRJcVeGXSnLP4k1B+QG/2YKju4CdgV1muUtonXMfnKV1QTsttXyaIP6uI+c5sCNtsuO7VkL17k1
 Nc7JBUqAlQPXoIlfUHcn7gCtj3zcHaXNz+GODGO3c/KUCTTDU6h0zdGGJmW6hWteDPBsR77dPqh
 kc9e5znP+rHaOEjdjSCcIkV+qgUWnUcS2imEt8FIrBME8xXaWrfhSdj3WrTASXL+0VQX04PmgVA
 sycXjkiLqRbofIQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=K/sv3iWI c=1 sm=1 tr=0 ts=6963c5a8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=_jlGtV7tAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=87NIDPt55Z06IyZ_8NIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDE0NiBTYWx0ZWRfX7Q1oAPyfOnnh
 2dSS8Mp67dqlf62HalwrV5JQNZuyACNBVVX2D3kEfGmrMoMF16tN9uypepfaxpGeYkEOL+UvhTG
 SxHFRzR2kwa/hWPV8lki6VD8rROFbX8IiMSUiEzeGh+IpjG//K1nUoXiFNY4uVj5lYhuI+EFv6Z
 vEIRPm23bmxcmAPikN7Nbtakg9lBv292kSZWH+PZg9QrkLDA7vfqWpTiDWRgXjkTGDa5uBKMjW0
 yFulznkEkkzhMX1XM9PiB/Fv68t9W1+KvWB55ljxVzUUG9EFS9qRNHOt9o+I+fEfvDByQaaYBBa
 kkiHYAxiO723uODNY6LwSKhKHed29ev64Zb7s6ncnGipFD3sf/A4q7T0g4W5PfT+CLrntQstcbR
 CFRtdRd9TsVmCJ+0gd79Tvkp5X1FiFYU8wUZvMVm/DdTAwgqDH/Uk6SnLiZNJ29DTUTH+0iVePl
 SSi4nZEaduuZa3+GTfw==
X-Proofpoint-GUID: TKe1oWdEkiSE7Nj9oZ6td8N05GZmL_PS
X-Proofpoint-ORIG-GUID: TKe1oWdEkiSE7Nj9oZ6td8N05GZmL_PS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_074545_936061_859951C7 
X-CRM114-Status: GOOD (  14.49  )
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

Samsung S3C2410 SoC was removed from Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of samsung,s3c2410-wdt compatible
anymore and platform is so old, that there should be no out-of-tree
users.  If such existed, they would have enough of time to object
dropping Samsung S3C2410 SoC removal from the kernel (which did not
happen).

Acked-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 445c5271879f..51e597ba7db2 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -19,7 +19,6 @@ properties:
     oneOf:
       - enum:
           - google,gs101-wdt                      # for Google gs101
-          - samsung,s3c2410-wdt                   # for S3C2410
           - samsung,s3c6410-wdt                   # for S3C6410, S5PV210 and Exynos4
           - samsung,exynos5250-wdt                # for Exynos5250
           - samsung,exynos5420-wdt                # for Exynos5420

-- 
2.51.0


