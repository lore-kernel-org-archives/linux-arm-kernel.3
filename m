Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C468EC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 14:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=seUOJdBEpaaK2UmSYK4aVK9u6IT6FpqMeeYKLF/OBic=; b=psoTqlQG2eMLwseZwjavXPPLqr
	WnJrUgfLQDuMi5+zIcTWUFKmP08hkL3c33AUlrFXuFtgvGEsPr7zIQ/hY7g5mUxTppZgAP69b8KyU
	DJjsvz06/dstQZVLHxqFVEyQaK03QddQdp3PKy0+VSwms+j9ozYLOy4IkTZKl6/dHTvnWZHHG2Pq1
	9eI56fe35w1m4PQwQMvch10lKlTeTqP2hR2EeB9kla+sa3jMCExDC/jmsJCC3KqoalpqBkfa9HvIo
	I+9KvGJlfs48H+YkrXI+b2yt47bvBcVVfmkdeFAIVTiPoZ/KskXHb1N3JsvZ7DKEbt5xRCnzbJ+Cb
	Im7XNhvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xH5-00000009MKl-3srR;
	Tue, 08 Sep 2026 14:58:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xGz-00000009MEw-1yXV
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 14:58:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=seUOJdBEpaaK2UmSYK4aVK9u6IT6FpqMeeYKLF/OBic=; b=JQa77Yxvp/fXkh9QGVasDA9v0E
	8ARsoPNgKGIm/WoJqh0sXgtd2gdJeSpbl3iaw6U9p7C4BvrYa402PdK4yboDllG4WtyV7tt/lgUwo
	59pkYdqiRELyYoznOl6CkS/a0kBwBYlPEHcRVB3DqVdgsL914B2eLp+iU5EDH/O9FZlc7d11RvLYc
	pQPPLHnRrtzVAt/41EoZ2DCAWhT6Y9MFRx/u9LDtOlXh1a0jxK4gt7SQbGmtDuxWn2NhcNX40dwCm
	OuICa23QkhyQGTDqHisMqk6a5sDnoTItUkjtyp+fgxkv9XX09+wqH8Iq3xscAEADDgab9PLcKn60z
	iag8/awQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3xGw-0000000HZaX-2lhN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 14:58:08 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688EjBPI3835526
	for <linux-arm-kernel@lists.infradead.org>; Tue, 8 Sep 2026 14:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	seUOJdBEpaaK2UmSYK4aVK9u6IT6FpqMeeYKLF/OBic=; b=OX8DgjxHIzM1T1JJ
	LsJn3a+0v6E1Nn3El6WzTEIPiTBZIkN1jiSzHXMW9puHwPTibwRHhohuK+IYB+L3
	6hv9Ffcv09Tj68PcK6t03UXQSUjZykW9D90A4CblNMe1iE9HbHzEle4CyEgKTqgF
	y1hHd0F1yJOCmbXBmIXBPjZw/vfKlNf4ivwmHP8BJ78BfABPUqVD8Kq9DhoT00dg
	tcvYusAFp4atnM829GtYqGVqz1/IEZnJVjvOudXDjsfiFaE0lbiZno87R3VS9o0o
	00ln7PbWBFjOrRtcL6125WMatVYXpoYO4Od3Yd0z5DEEqYJMocdHGmPUwFv2E0y+
	4UGCKg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjfp49caq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 14:58:05 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78bb7517525so467580137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 07:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788879484; x=1789484284; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=seUOJdBEpaaK2UmSYK4aVK9u6IT6FpqMeeYKLF/OBic=;
        b=MtwaPJP31pqjHPt9s1Q/mdtp4U/7l/tPEF5wk2yT1KdOKHDLk0joIo/Xz6AS533sv4
         DuuwrNML5psgAuqz3IpRRay8pu9Z+xVDUnwZL9G/de19jnAisqgCrWYDN0DbRDuIfN1W
         VLd1S+UP1KrCzqKBfjA4Ev9nn+fEC6QGXBNgZYo4TcQI9b4sHqYP3gL+luphuIEIHaD9
         1ec9qlawsIz27eK1atZZMenKFuMd/Xcl82o4juQxqnDb8lVntg0d1KkhSJLol0wrkLU7
         q074Fp1gVxFVAnVKAxJRB+ixG3S3K3slES7T5aVHzqOASTtvOXbpZHFoU7Nil6wGRFUz
         dudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788879484; x=1789484284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=seUOJdBEpaaK2UmSYK4aVK9u6IT6FpqMeeYKLF/OBic=;
        b=E3pvhna38H8a61AqCbtcGKd1os6KaoOFI8X7nTqVeE+wZibt+BV9r+Tw4rd9xQehLZ
         uaQ5GFG6cIFDS5A/g8zWxMdqC+EclxqytrVxpSJDyv3UEYTLXW9NikBApZwZcc1jalqF
         bixShGmAS3ZyYHjt3BP7K+MbKAsZz2nk51HnpwQ61zorZpuT8w1XzQxe4D0ZHC24l4Ql
         d0x+uKdqjVG3zkOHawlp7eOmyrerGdaBnBF3l9gGhBQzfHZ+wiHmrkz0pIEhiPdAKdmm
         p71esPKGyxYBx9r1UCZg41CEK+diwh/9pBBiwj5i2+q/cBRQ/n4tCFGsk1xVex/gUIhg
         jhhg==
X-Forwarded-Encrypted: i=1; AKwUvBxVb8EAVmfKGYBbSR1EAecouqXbK2/zlizKgY5ZSAwzunQgHAjec6HSVKOpskfSl6D38DY8hlcYVInbumI50Atf@lists.infradead.org
X-Gm-Message-State: AFuF++kpr120ZGuyB4oP+9Q3jSLhT+wZ6Og0N7U1lsI3RjWX7epn8A5D
	3n8quaVuNdBqXom42w8hPSaMhHuhozn3cSl4krXwtFBvWVDX+ricYLcIAewxsM3+INkse2g1hlc
	dfqaXA589c/E6AXLzlLHAdFuD7DAjbztAS2U8pNgbMkhg8qE+rVmu1OCB6nLb2zdY8S8aK0zKE3
	ZPcg==
X-Gm-Gg: AYBFou2QoTOiVwuzSIab9/jigHEpazWmZTIvAfUh0MtRp2RT31xCR2sARwkFxHhhnB1
	2CS3z9NqGd5RMImox0KK6b46M1v5Tq0zApxh8T+Rc0xoCCjZMXL7SwSburXP+qQVREyTcYINjbg
	0ThZ6GJbenOUG4oUZgUirxDRO5NwKZPXx8AwFFyQdjcileUGdGsLziNra+UgABUh3ogUymqFZJ3
	Wv0u2EKrHuRvAYtI9Awt5s4HdPNGcIPo7djyZ5gSnIJZwugbfo0WJbeDviZO7x0mlEcCUHpcEf5
	2c5Xm1YCWzw84DuVwClywuIteQfeiChjTA3cdO+hTs38NNMEI61uyxpglPozZmWgyIL6dxaZTDT
	+quZoUEp2SGpDXCmD+nMETHPH8HIH
X-Received: by 2002:a05:6102:f83:b0:784:94dd:5389 with SMTP id ada2fe7eead31-78a4a9ae110mr10773701137.13.1788879484393;
        Tue, 08 Sep 2026 07:58:04 -0700 (PDT)
X-Received: by 2002:a05:6102:f83:b0:784:94dd:5389 with SMTP id ada2fe7eead31-78a4a9ae110mr10773647137.13.1788879483779;
        Tue, 08 Sep 2026 07:58:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a2:f118:df09:fe51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485958f1493sm25191276f8f.37.2026.09.08.07.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:58:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 16:57:22 +0200
Subject: [PATCH net-next v14 03/10] phy: qcom: add the SGMII SerDes PHY
 driver for SCMI systems
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-qcom-sa8255p-emac-v14-3-ec212b747a7d@oss.qualcomm.com>
References: <20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com>
In-Reply-To: <20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5706;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=qHUlRmmCEFH0pekvHNTdxOkuBUAknchAtPGzvZSdAVA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoCJpUSAwXwYqyImVUA8IHz/qZBphfJZmEFMBI
 m2ZW2y5mMiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqAiaQAKCRAFnS7L/zaE
 w2PhD/0as5tliI1sEyOitt3o+EQ4kh5yKkHvigZwetzwKxwOQu6f+gUa12Gh+Ov7edkBjpD8a3W
 iMbZlHnG5eKnGJphgRMMitIfM6T1OqsPv3r/O8N1svmU7Rnjt9BKaKy2gFDaSMZlQaDjydAgS6j
 JYGoCCNyQ+zCdEngS0hE6Zvmnr4rSRrbfCDwvRzmtSBQdHIb+EObCBfDhDX7BBvh62DlJ72wZ4L
 yvB9fnZW6tAxBufOOQHqH/V5a/dNykdyNGGZAUrx282uTWyK3n1U0h6I6D+/arZmPVEcA+0xZsc
 7IZ/11r8niZPcNCiTmwZYaDEPtMje17Lje0Mr60FjT/v2RDxI2BBrbqbN6/TRLvZUiOTtPevFNZ
 Z/W6AynG1j/kuo+oHLCYJ8lAKTu/qO1pMySExNkmWs9WffnDG6MjTRvOkZbuYPf+aJS8SFURcwO
 8k5H7KcrHhWLZUEC5iJR7ISWqq4mzZKosEGkxYHgjeN92zl1TGoaUT3PcrxO7mEmwRB1CGLPGQI
 nmnOTQGLAg/g6kGs8U2xA4zsmXCtvgWv8GpJu0oyKlpfr4r7Q3fR9j93fekRA0I/CXonYf69tsW
 3YOfCWEAIgWWJ0OkY1gq6xWcUoMPC/21vMVDfEHSUNAZrZUct1D9thR41qNiPt5fNoLohNF1w0y
 HAXMirb7OBtMCBQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Qu9uG1yd c=1 sm=1 tr=0 ts=6aa0227d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=_Lfrdvl5uC9KR1EAoRcA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: qErNmIPy0GhyBDR2hdZ897PGQgHrAKPf
X-Proofpoint-GUID: qErNmIPy0GhyBDR2hdZ897PGQgHrAKPf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfX/1t61G9/fPIh
 Nf7e2zG2YaOyAnZrtKIbv6R9Pw8w+xl2FHa/UWLwk0f5zdqDdZzmCB9KmU5NBY+FTHrdpkLb3MR
 r03vnMcLOT8AhfkZ7+SgmHo+N5rMX0ivoLL0wK75P7ZCrs7O6tr+fIOq90aAL1g2fU8Tzt8vRtC
 rk3XzIaZseZFHnICaYsog+BrUOU4s1NRjDp2H8p5/2JCkHSpC+FTUpcG4TI6IZOLpcHTOmQLmiD
 ialtbplwamEq8DA95uX3YGJqceZse81uLjTTYNi4WrGWJvCxOGg+1glwo/ajnKesTSdQDFgGEpC
 YuRM7OtD2OaIgonLCIDcvnyAPkB9p39NKBUxaSFshPCzwFKGKPWbOY9rbUCWEym05dHTAwwIPrf
 bbU4x7kzZmNlsLAL5WCeNUtiRyCESz71rZc/3/Z0Lxm4PjwUTmAyfLxlutPXv4x6d+l1XkTfkxt
 xVbWIeSR+rSXkpIHKTg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfX0cTIk3guNa8Y
 S3zM97QV7ZcD8XqKl6eLHLwgLa96FelchjsU1ipQu3jUiVNHJXY31+oROkc5M7qq/tBC9nFCBtP
 dVNXWYZfhl3lbPA9fqb+URE0OLGu4IE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_155806_985664_19DA3A72 
X-CRM114-Status: GOOD (  25.45  )
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

Implement support for the firmware-managed SGMII/SerDes PHY present on
Qualcomm platforms. Do this as a separate driver from the HLOS-managed
variant as they don't share almost any code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/phy/qualcomm/Kconfig                   |  11 +++
 drivers/phy/qualcomm/Makefile                  |   1 +
 drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c | 115 +++++++++++++++++++++++++
 3 files changed, 127 insertions(+)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index d910a5d1a1ac3ad77599e72c3f4a3b2aebd02dbf..677662f642e42f6ed969fa281d161ff185be9ae4 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -242,3 +242,14 @@ config PHY_QCOM_SGMII_ETH
 	help
 	  Enable this to support the internal SerDes/SGMII PHY on various
 	  Qualcomm chipsets.
+
+config PHY_QCOM_SGMII_ETH_SCMI
+	tristate "Qualcomm DWMAC SGMII SerDes/PHY driver (firmware managed)"
+	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	select GENERIC_PHY
+	select PM
+	select PM_GENERIC_DOMAINS
+	help
+	  Enable this to support the internal SerDes/SGMII PHY on Qualcomm
+	  chipsets where the SerDes hardware (clocks and registers) is owned
+	  by the firmware.
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index 8bf887d58ee4a65687216dd91a6592da7941ace2..4972009b217e39ad3d19300e5b7dede4e88feca4 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -26,3 +26,4 @@ obj-$(CONFIG_PHY_QCOM_USB_SS)		+= phy-qcom-usb-ss.o
 obj-$(CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2)+= phy-qcom-snps-femto-v2.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_USB)	+= phy-qcom-ipq806x-usb.o
 obj-$(CONFIG_PHY_QCOM_SGMII_ETH)	+= phy-qcom-sgmii-eth.o
+obj-$(CONFIG_PHY_QCOM_SGMII_ETH_SCMI)	+= phy-qcom-sgmii-eth-scmi.o
diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c
new file mode 100644
index 0000000000000000000000000000000000000000..ae961975dcd87555d458ca491092622366e58127
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Firmware-managed variant of the Qualcomm DWMAC SGMII SerDes/PHY driver.
+ */
+
+#include <linux/device-id/of.h>
+#include <linux/ethtool.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+
+static int qcom_dwmac_sgmii_phy_scmi_validate(struct phy *phy, enum phy_mode mode,
+					      int submode,
+					      union phy_configure_opts *opts)
+{
+	if (mode != PHY_MODE_ETHERNET)
+		return -EINVAL;
+
+	switch (submode) {
+	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_1000BASEX:
+	case PHY_INTERFACE_MODE_2500BASEX:
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_set_mode(struct phy *phy, enum phy_mode mode,
+					      int submode)
+{
+	struct device *dev = phy->dev.parent;
+	unsigned int perf_state;
+	int ret;
+
+	ret = qcom_dwmac_sgmii_phy_scmi_validate(phy, mode, submode, NULL);
+	if (ret)
+		return ret;
+
+	perf_state = (submode == PHY_INTERFACE_MODE_2500BASEX) ?
+		     SPEED_2500 : SPEED_1000;
+
+	return dev_pm_genpd_set_performance_state(dev, perf_state);
+}
+
+static const struct phy_ops qcom_dwmac_sgmii_phy_scmi_ops = {
+	.set_mode	= qcom_dwmac_sgmii_phy_scmi_set_mode,
+	.validate	= qcom_dwmac_sgmii_phy_scmi_validate,
+	.owner		= THIS_MODULE,
+};
+
+static void qcom_dwmac_sgmii_phy_scmi_runtime_disable(void *data)
+{
+	struct device *dev = data;
+
+	pm_runtime_disable(dev);
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct phy_provider *provider;
+	struct phy *phy;
+	int ret;
+
+	/*
+	 * Enable runtime PM on the provider before creating the PHY so that the
+	 * PHY core enables runtime PM on the PHY device too. The single SCMI
+	 * power domain has already been attached to this device by the driver
+	 * core, so runtime PM votes propagate to firmware through the genpd
+	 * device link. No register or clock access is done here - firmware owns
+	 * the SerDes.
+	 */
+	pm_runtime_enable(dev);
+
+	ret = devm_add_action_or_reset(dev, qcom_dwmac_sgmii_phy_scmi_runtime_disable, dev);
+	if (ret)
+		return ret;
+
+	phy = devm_phy_create(dev, NULL, &qcom_dwmac_sgmii_phy_scmi_ops);
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy), "failed to create the phy\n");
+
+	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(provider))
+		return dev_err_probe(dev, PTR_ERR(provider),
+				     "failed to register the PHY provider\n");
+
+	return 0;
+}
+
+static const struct of_device_id qcom_dwmac_sgmii_phy_scmi_of_match[] = {
+	{ .compatible = "qcom,sa8255p-dwmac-sgmii-phy" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qcom_dwmac_sgmii_phy_scmi_of_match);
+
+static struct platform_driver qcom_dwmac_sgmii_phy_scmi_driver = {
+	.probe	= qcom_dwmac_sgmii_phy_scmi_probe,
+	.driver = {
+		.name = "qcom-dwmac-sgmii-phy-scmi",
+		.of_match_table = qcom_dwmac_sgmii_phy_scmi_of_match,
+	},
+};
+module_platform_driver(qcom_dwmac_sgmii_phy_scmi_driver);
+
+MODULE_DESCRIPTION("Qualcomm DWMAC SGMII PHY driver (firmware managed)");
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>");
+MODULE_LICENSE("GPL");

-- 
2.47.3


