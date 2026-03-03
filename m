Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE22AEC1421
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 12:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+UFaVOOEMjvopJDZvAVmSn/0K5xprbHB0u9j+BhT9u8=; b=YRpqlRBpRMLmoUfLDlKzwqhb8b
	xJ+006v5+DSzBhjutQSdsYDH2pnvzhiOv1HTdwR9RQ7YJH2i894sIJvH5VRHCdRJfPq74RHk/QmYo
	vmpn2gpHGTzx5ulZj5WSl3ECjvSvUqMrX7KYlHGe9BU4SfCvgEK3w8FZdKrhFvi+IDMgoEGxzDgp9
	EbWcpW5GSGHNLA2XSgfDj0oRqZheEpK4XfmTu23nVvgrfVxAJJugq0Z4VUdMJLVylDSRjZIbsOHpn
	PJAGn+Mpda5gzQ8oNk1jbBlCjaiqWujNdAQzQwp+OdPrxUS14PQDd0QTB3ZIrgjHWJgj6Zu+jcF1j
	BuTdHYaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxOse-0000000F9Lz-0FOf;
	Tue, 03 Mar 2026 12:29:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxOsc-0000000F9Lf-14Er
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 12:29:39 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239n75A2630006
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Mar 2026 12:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+UFaVOOEMjvopJDZvAVmSn/0K5xprbHB0u9j+BhT9u8=; b=lK2W9hqlq9NQpHKO
	j6+PqyxsfrTcNUVrmSY/G7pZ0R0VxkHi16XgNJ8z7HVEOS0UEnUyMj79ruuw1Nyr
	jKzO4sUgKF1vdtUE3K1g++/V4rIYesG+LrMjj5UrVXD4oT25YAgoIpbkp/i+P1nK
	O4+hmxmVCikWkzFLRucws+OGH9ZfjLblKT0Mu3gQERlqtylqCeIj6nqUriHdb/AW
	TxiEgAZre8s6ebCYXm4/WMYipDkqy0OFnNnyG6X2iTapPvqaDyEFtoGsfd0YMltd
	C9GEwhY+6ZkGqtGvtxOuDo5F+4Xi3e1R0LsaJA7+s2J/zaVLF7D0tqf35DXf78hR
	cvi3Hg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhx5ashf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 12:29:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb52a9c0eeso4329164985a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 04:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772540976; x=1773145776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UFaVOOEMjvopJDZvAVmSn/0K5xprbHB0u9j+BhT9u8=;
        b=HqW41rm+zFldR1g2DAh4sfb46iCcvOvDT4BPxSB8n1U+DGOXRFcLEAI60cdy7Nx6Zl
         UY0Ff1+emSyBcs+h6xJHKsXdxLXV48YPiT7JDigVbjalSY0Tk+tRaIGMS7OCilsZ6bd5
         pTtzKnHU7Vmdlh0tVSlrpsBGlfFfRm6b53vxIgTk6ALjXGa8MRla1TNR6pb+fi7Kj8ne
         D5gzBktSnvti+Uwab1jBA1zYRboaDq1wXBaJq2V5gvZOzRmBrY7aEDgRFfd7ro+whb2Z
         qr7qmTGAhXekCk3eB2fd7a8oLM/yAvS/v0HlMPmxr8DU4TawSctfjHuXssW7gqEeIRC8
         p/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772540976; x=1773145776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+UFaVOOEMjvopJDZvAVmSn/0K5xprbHB0u9j+BhT9u8=;
        b=xDwuahcyjrkARGQi2CzllMETH0T+bD6xAnilCZHt8GSmiOI+Z5x8d0/mMkvD8BGCxO
         cPCbYkyl3hog33ueJ5EuoH+QSM6X28x/EZYnuj3inLNDR7LuWckjfh01ox9M09VX9xbh
         xduAx+V2HteJZDwi8VGfcRwnlAbjU94EFLKRD4Z9wBFFEqU8V+eHS0yJeqHher1bwwXN
         kIHcdrofly/70eROthFPY93btabD2CjTvUvH4Zt1G4bAAO8DvarT/1VP1plFnFktna60
         +E3qqurZbRWnswLsCgB82C66vI20Qm3h1nzO3D3ZnV2Ed3AeC9WHzBMYtIMkWRqHDlnd
         UVCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVaPzLXv22GVY9C9ldyNR0eKciFbpi7khgMj4WBDHplQnv3o+Uyq1QImKkSSc1jqv5WszL1QN0CBox1wiauUFJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyFrf7l+wwjIkL/ocyHELqZgUhjwMT7g+bMBwAHQ4LxLYcZdU5o
	h2u+rjqGepof4PUyeT6/U2tIU68IkUklPCq2BAgXfe/6o4nV2PRwm6KofiltYz4xxykqys9gWhM
	NmYzOCeAfhWiW8r/9aixzxYgIeEngS0WCp2o60GewHIWFSRJALqsYI/Cr8I+gHCzd2pnwRVPql6
	sdAA==
X-Gm-Gg: ATEYQzx+nb4+R+1srJQTlQ5p+TdVrbFeTt64g9JOlbDrp2QgEMyuNlGtuKT5W5uJXJk
	QcZ2FdJM9UZrD3eGEQF+kRZ5gCFB/w6Qz9P1PPQCSCUMizkaIQEZgUI6D9uegiN2iXdOjh3Xde+
	vSWh3cc5C0An7lnNgYLzdNQp/wtlFRXewy8w6oKi058EkNyg0f5rOMuwNnsdfPXXHL4OUwQ9DQh
	zTmfQ8R6vKlL7IxODqm60tQXVscuP4bHGGCi1X/9U9ajqoQRVeDEMZNXs7zSZKgvoT+OEdPPU8j
	dM8ja1eoFnlP0KA2+JE+B5/MyFY0DIvGMhbg9VyLurrRjC9pmQFN8irXj1xxKJGv5NsvHjCNJIO
	Is2Fprz9TRpqs7yhC2XD+eHfPnhMMdQ==
X-Received: by 2002:a05:620a:444b:b0:8cb:4d9b:6b4d with SMTP id af79cd13be357-8cbc8d6f180mr1874331385a.10.1772540976314;
        Tue, 03 Mar 2026 04:29:36 -0800 (PST)
X-Received: by 2002:a05:620a:444b:b0:8cb:4d9b:6b4d with SMTP id af79cd13be357-8cbc8d6f180mr1874327885a.10.1772540975729;
        Tue, 03 Mar 2026 04:29:35 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd750701sm498035965e9.11.2026.03.03.04.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 04:29:35 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
Subject: Re: (subset) [PATCH v3 0/3] ARM: dts: imx6: cleanup imx6/7 CCM related CHECK_DTBS warnings
Date: Tue,  3 Mar 2026 14:29:25 +0200
Message-ID: <177254093027.989057.8587839568838242001.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260121-ccm_dts-v3-0-820ce9b5fa38@nxp.com>
References: <20260121-ccm_dts-v3-0-820ce9b5fa38@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA5NyBTYWx0ZWRfX5kgdd5abH1gF
 svXc5mSJeKadfkrN0Qurg6sUQYuZuSkhT6ANzI853ks8zGPpRZ+jG0cV+V92Bn2Q89qWc2bhD+F
 BCO0+N7etVcgB4CIoBKllcdjtinvLTkPaGIrL1AZB55a706HMuCiDjypH0rgf2L8RZUzPOzfbSh
 x+OLzT4EmWKltoTyj3HiiypMNcIizdI9cQ6lE+s2P/yDAvQQhnOQitLuqvL26EHhQGGCaqIVyYE
 llTNVgC8tzPW1k45rXQudHmEHfLQGcr5FUAvsxS3jI6wyGNx1B+HbafcCN3hU/kDUAcQE9tShwh
 RltSEKpsKo0JGk5z3KR5EHykTwWAtHRJQ1+d95+H5nZOqAd3J2oKLfXWQYp2771XxI1olusj0Jy
 QQeaVfn9NH9d3TGyaccFD7uberFiLSd+I1/j+1QsUy9nhVZEAYck0YMPUfjNv8NRVtbMHeS3l/j
 SNij6OTFsiMjMHjMDVQ==
X-Authority-Analysis: v=2.4 cv=T9CBjvKQ c=1 sm=1 tr=0 ts=69a6d431 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=HS7iJHYFZOvZgwlv4tsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: cmK7x24skfp7RUgSgQUpf7wJhOfH0Ugg
X-Proofpoint-ORIG-GUID: cmK7x24skfp7RUgSgQUpf7wJhOfH0Ugg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_042938_415472_CEA02DA0 
X-CRM114-Status: GOOD (  10.42  )
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


On Wed, 21 Jan 2026 13:04:14 -0500, Frank Li wrote:
> cleanup imx6/7 CCM related CHECK_DTBS warnings
> 
> 

Applied, thanks!

[1/3] dt-bindings: clock: imx6q[ul]-clock: add optional clock enet[1]_ref_pad
      commit: 51ac0f4b6d5f4965153d8c39644ecfb228480396

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>

