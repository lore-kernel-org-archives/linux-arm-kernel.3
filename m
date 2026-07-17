Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF23C44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6MbJnmX7m7Q+rNiwCmFsJ4wLFKfE9U7mLaz8j8CV9U=; b=ntiC7PTCon79T4dI3Zwf0pOKFo
	lQ+xIk8iNl5uu6sTX0u76dXQbgW6U5DlxFbUAgEM07sakZgq0eg8NPZkaCfDXNxNXYiLuRDl6CyAX
	DebtNTeFeipTGVCg5iDNQUHpZaw+Bl5wbKiOUNzUo6jBRosgQi5k0dLvmLrMxt07TRZTfIVa9McLl
	Yuxp7FYOOjv3mziVTq+5cpSA2AUSl0CLt0baTLIMooB2mqngTbC0N1aqAiJwH8g0m6x1T891fBtzp
	H+W6R87H8QHqVQh/O2+o0bsiw3GiY7/ddnQCv53APQE1nZHtQkqx5tV758Ho5RggxXFbZxbTboNZW
	SugyPnbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkePO-00000001l60-1AqY;
	Fri, 17 Jul 2026 08:59:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkePL-00000001l4u-2Q98
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:59:01 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cfBd1078363
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V6MbJnmX7m7Q+rNiwCmFsJ4wLFKfE9U7mLaz8j8CV9U=; b=l400jifcL5aKd65B
	5LUw2Bc0DKEUaD+NP5xqtPA0B+pUH7FOZJXvTs+5QjLB6A5Gg8elI6ZNoyfPveE3
	c6jq6vIIbzxH9mI9jgJ3j0N+TLBSoEiiPaWzLOHUlLViZNgsZmc/WjtUN0Bh+1wD
	FBsECLyhP50+rHKfuAww3lq6pCtK3FMsoNMX/+5UPmIhIgCf+34zN7ItdPiQRVn1
	YuBZTVahOP5+znFPqWN37skx8eW25UhncLxEY5No6gd7D2EJk6mlPGaNSy+HmlSv
	7ZU/elCzCRgFqR2DaXZBaHSiUoaiCj/LdbpP9HjwCRdDBT6RXnsOPSUQ69WmcMTU
	YlF3BA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feym1ca7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:58:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0199faafso94279891cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 01:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784278738; x=1784883538; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V6MbJnmX7m7Q+rNiwCmFsJ4wLFKfE9U7mLaz8j8CV9U=;
        b=MUas4t8lniGGa66F5/xxmnDq/bFipYnHI4CHVfu7f5OnnmzY7u7uuDZNXstEUUiryW
         ZhC3uENA636goY7+p19WJV/RDcmZorRdCIaAMC+2xtiuKFzYfV3lLox5Dr2Tkzh8n9SC
         kqgkEEwIkaiBgJ5RG4NntxYGFjKNxuJGSYpV1cdPT0kSdAWBMlQssbUwGFhPi8cR9mwp
         qIcl/96HxLXSr1lfLXIAj3fNWVrm9WIWpKXQq0pAIJ/I9Ci43q2ajDe9k8FA6x0e4ofV
         nTbSNavdp5QNuRMxLFL5Jz0B4TXafIIkFUsE6yaJhUeBjXtnn3XHta9ZszhEdcUyyyi1
         1XcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784278738; x=1784883538;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6MbJnmX7m7Q+rNiwCmFsJ4wLFKfE9U7mLaz8j8CV9U=;
        b=CE3jx/j6J2XZqQaWRyQKHYBUiG3cLYJVWkXDohXcwrVnWUtF2WSzMrqXtVDSY4YC+R
         AH/XKn4YeTmm4Ju99VZITKY+N4kX7HNSGSKB3aDqBkdAb0VJMazWO8NSdz1Qi64gbpka
         QEStx70poGwECDWq7dqLuQ3T0yiEZagth72la5CiayKDXmsukYw7iMSLCSkp8W4dfHnW
         8gy3ep4VGTrFXEVmENhen82fDs6g2AdDzVpKMRbTBL9qZEZ9X9Sn9pIjfZUb4qtAL+iN
         nN4A13JkJvPuN6pWE1+w0ZXY4vNgfviaQDzyINNmHt0c1Pv5SVv7jVCgqVbuGK6UcST2
         YGpg==
X-Forwarded-Encrypted: i=1; AHgh+RoH1heGU+GJM5Vv1apKBECuaeB+1trlDUkcboJaUyptl26azsUeqeH4G32NPxA1pFk1quSMllsRcT6KJvK6DTSr@lists.infradead.org
X-Gm-Message-State: AOJu0YxCk2lD0soZ6VDG3KzG0JE8IiBd2z/lXKDCfmOhrbYWXZp7rbvb
	dtQ3DTOD2WE/xAC5irqySqksDDbm55+7atM8BsWrwVV/9mn3Wm7IgkdVA13QpBPHDIgtqg3QH60
	tPSj+8JRK9UVwcx7LU0LIkJC0e8SgocxtKxYqTEbHBT5LTaOScy/mYQj9hG5BNV1tjel0haOeCG
	lddg==
X-Gm-Gg: AfdE7cmC+VRgeq++VPIW5rbZ7mVtapT4Ao3ootANVZwiWY13lS/ytTFDoGwels4+otJ
	/32H1Xyt0e7dE3awkZbhehwef5nuuXNQtthI+PK0J9SXpPByQMAQegrrRkNs92Z3mJHypMk6xj/
	fH4aLmdv/fx3aZpJ1jy05Mq9VK9AbDAY/w93oIrhzJBiEWWW50ZKfxkDttcvbz6xB0apOc9ud5R
	j41iD2b78wFJh5KSoFUbpRRVu11qyC0fLB5qgIRdRpyYX3RfPRGMSld44cuAckVG1ufgZWMJRSw
	hPWA4saeDBuHSItHJy/Ua1QB97WcSY27cdk/GIRmOs3fmE3d64CeBm8C2t+7fBFASzR5s7joAGT
	nIRDEW4PTBnVJ22t15Oz5EVVziZWo
X-Received: by 2002:a05:622a:1346:b0:51c:1eb5:333d with SMTP id d75a77b69052e-5213eb757d0mr12604691cf.66.1784278737599;
        Fri, 17 Jul 2026 01:58:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1346:b0:51c:1eb5:333d with SMTP id d75a77b69052e-5213eb757d0mr12604541cf.66.1784278737262;
        Fri, 17 Jul 2026 01:58:57 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e65644sm1911449f8f.16.2026.07.17.01.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:58:55 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Jan Kotas <jank@cadence.com>,
        Michal Simek <michal.simek@amd.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        =?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>, Swark Yang <syang@axiado.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: (subset) [PATCH v3 0/8] arm64: Add Axiado AX3005 SoC and EVK support
Date: Fri, 17 Jul 2026 10:58:47 +0200
Message-ID: <178427872043.9452.9219608850005529427.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com>
References: <20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KPRqylFo c=1 sm=1 tr=0 ts=6a59eed2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zGYnv34WkyyXCUjmJXsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4OSBTYWx0ZWRfX81gnKyJq545w
 tnNVG95ydK17rgYzpYvfSqedP9d/yf2SLnLU4fuLab9A1xwWfNVM4mpCvNmRgnBxpC9Ttjo8OfN
 4A++CLXbSXT3lZROS/e5hm7jvkPMru7hYf7F0Wx2K7T8hO4OBTc0uBwoxJyoItXWzMaQmREGkSj
 RBjPC1Kx0KMGfC28DFo2rXtYQC95o9CCVeHmTNtKDwqZkEEK3a2N3lvslnza4k7TtFa68H9Zbo7
 ufsUxPkgjVk74KUh4ghKNILvyjgmgPXSGKtFg5psatjUs3sbdo8W3mhOmzmyTi/69JKr8QABAcX
 zQ8G/YRMbFYnkiusJasR9vNPeswJNUVOGjpoPp0I1OeFHLEPn0qLhTAJLlzgsAzkaR8xesMdmub
 +QGlz7Rpo2GywqMF/l5fOQw8Vw2itcGAKuZjpmY9jpLe5yTI7OIwS48Kg2ZCiXKTh7Ln1OPga4e
 Mi5Y15XFU+MxyrQn/ug==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4OSBTYWx0ZWRfX3kCVIgcs3YHD
 PrMznOQIU6odAt2gmBnnsSuaOv09HMC9o6TlK70+Nf8SE4bzavpvei2U3ERNe6ac6IJiGJ6lPoy
 G4DFhqn4ZbtGCaTfDrQ4UJiH7y0oFas=
X-Proofpoint-GUID: COgd7aWFcjfNtFC1huEk9blO0_BXbxSh
X-Proofpoint-ORIG-GUID: COgd7aWFcjfNtFC1huEk9blO0_BXbxSh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_015859_730046_5400FD28 
X-CRM114-Status: GOOD (  13.62  )
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


On Thu, 16 Jul 2026 20:51:07 -0700, Swark Yang wrote:
> This series adds initial device tree support for the Axiado AX3005 SoC
> and its evaluation board (EVK).
> 
> The AX3005 uses Cadence-derived UART/I2C/I3C/GPIO and Synopsys
> DesignWare SPI IP blocks. These are already described by
> existing bindings, so the device tree reuses the "axiado,ax3000-*",
> "cdns,*" and "snps,*" compatible strings; only a new SoC/board
> level compatible is added.
> 
> [...]

Applied, thanks!

[2/8] dt-bindings: gpio: cdns: add Axiado AX3005 GPIO variant
      https://git.kernel.org/brgl/c/e8a40b3566887c1c83d4cb87058d4e98ec8b4a14

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

