Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B86E6F095
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 14:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mnNQYCjDT2IKwdufqcfSj1JgwQtQDYPlSNzciZd9v8I=; b=D5zxxXA0OnkhFqdtL4sIh6Y3Jh
	WZ/DefouTX2mHZKndQ3D+kS49MWUlFyNoon5ScvbjDsDPjIZjbp2008G7gz9f4pCopua403miWXhJ
	tTupYlUAbmI1Y+GbzbY3pJMPwLVFPMrO9gxBsKCL3cNwNzxfyRApyDG0mLum+BYjdhPvvAM1INn3C
	uuNdPM6gpC/Z+kw6bn1SrGFSkZ4JfuH12gfBZXJZKZp8ZnbVmde8/zOxYqOWb340ZJqx18QQ6p98K
	g3a6DXz2WrSYDkdfvB2wbjbcGWgufrWWseA62qArk2IJB7YiWHfIEEQXZ5R7gFfw/rkQJjDq3D0Ac
	9rFb1HJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY3MS-0000000FbyK-1Gzh;
	Tue, 23 Dec 2025 14:27:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY3MM-0000000FbwA-3ojt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 14:27:36 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNALdkj1357329
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 14:27:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mnNQYCjDT2I
	KwdufqcfSj1JgwQtQDYPlSNzciZd9v8I=; b=Ts1aGRhfiaAVeQUqMAEzULUH40M
	qty/l6zFIx15nNMAVvQ0BAlJ5rhNpmjTixKsc4Y0Dk8Awjl8sJbtSyK2BwqQ5ZdT
	YxpZTH1sX01ztcOm0Nw4hwrUzs0qzLHftMImAIH5C1PgF+d/aXQVpVajPLo1cRbT
	k57lfTpRN2ekwFs841bfi0ybBb7B+5TiySjajpqr70PPXc4fwFo4Xoen4wqCQmOP
	fkSntDIfJQLTGKmLS02z1suoIEGILpZpjdk08OQCzjnlefSjyAQPBHS93MO3XBy2
	MxXanXI1yXsJux0+/hBEbcE0MZVv4YmU6KzVF9noc4MMUBXStoLJBXE7sbA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b78xc3gha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 14:27:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b8738fb141so1496825985a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 06:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766500053; x=1767104853; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnNQYCjDT2IKwdufqcfSj1JgwQtQDYPlSNzciZd9v8I=;
        b=EGawCtRV2fIQdK0V/IcPpE/eLur7OyZ60OiMbPfZRnsWXq0I8xSnnrl7OQuVA2WMuR
         0BWay5eTf+nyCIdZ2aBzlRDR4yl7BAKHG1tmqNZx/EckdEIi7Hae2k/r9yEThJjfe6lq
         EsT9XDn94QAPc0XJMF50XVSVlD2nxxk35PzEIB5JktOFljajseNcNOmK0CTTGY0gQGuG
         kVefuyra5PmVbwNcB6HuQN2/5ELiOSq8KCD6PGegEHhl6VwxYlAvSUBA+XHHYRDfVaUj
         GN+JY6e9wQji+b+CdFfK6Hdip5v80z2Xs8pNyh6EUlcKmZFz2IFERLghYM7SEZFXC5ya
         lgtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766500053; x=1767104853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mnNQYCjDT2IKwdufqcfSj1JgwQtQDYPlSNzciZd9v8I=;
        b=J3pMiaqFeXlKlAVjvHIpBOsCWDfNNZh7Ujrhv0Kq0MQyjujkJUzi8TwnurJSPpH7Lm
         8Wa3Oee39xJotfq/eXX8Wuh7+RhPYGNQG8UbMyaZnbsTJuGUsEGosRvmAhC9XYOWeUk6
         GoddsosaVQikAcFqiRmtKiiDNFYh8DcHEoOP5Nxpy4GiElrvYhK5v+8mPG6BOETJd5rP
         rSgsKbpQCjASwyfrIqbJmOh7kp9eT97bm/98ju2x/umSeufJgL74dBQGFmOo83fsQdyG
         S+QPERjgSn5DeyopVBNhFv29n0TMXCrBh87EGi5Z9Vw5zNj3aJNQImtH6EfKY3sXgYuh
         pdSg==
X-Forwarded-Encrypted: i=1; AJvYcCXH1kuNsTA7LiM06KsVRLBEDMTdzk4DG/Bxt/mr3SOflciCBmidK9NGYX/m7a99YMqkvZjvIDfRWV3zujTIhN94@lists.infradead.org
X-Gm-Message-State: AOJu0YxirSFIEGKsLH6BKZrbcgftsfvjrOEElfXDlnZT3QQBgYOQhbRa
	dwdHUVbj2kA9eBtFECgB9tXc2HoBTcCieax/i9le5ZNO31AXia+IxMbVYIAJVC64yiidBE8O0Ki
	/RAjymlWKGyO/Nxl5wmY/PefweSudzG0AjnCHHuHt0F9z09zkaTYX53Kyjc6gNL30hBoDVWd/ZU
	OFBA==
X-Gm-Gg: AY/fxX5/qlpa0bkGPJbsh0I3R/Epk01+I9bxt/MZ1SxjwEA1Mwcfm/oLNPRXGqB9sdT
	rZNAjJVbeNLdDj/1yi/9UHbKOCjJEAUGnF6NVpbVot84MZGoo/5rDJoXLb7riT03CEMj2AU1dMc
	+OgxVDQ1MbnFZK5DU41nqCr315ztjEgFKcuMEAGEJ0cbH6jW0w3Y5GAInBHo72BVjaaGbIEkk7d
	fmjAXRSkPD4ayTKS5pA1YuSVewbJx3mtiHWORGAPpHD3WsHassA0h8cBmdYurg/5K15Hdfxz4sS
	DdZgRdBcjy5m7aVYEyfenoq/3p6O8OH0E3qZt1/9u/28etMRnBSvXfHzQrKLjjXSWVZEjLYU+fY
	uXWXfHB9cK1S2Q0Ib+WGTg9ilHZq+P3+m2kRMgUfA6KwYaEaclGOEvqYivdxGNPQMCzY=
X-Received: by 2002:ac8:7fd6:0:b0:4f3:4b53:a914 with SMTP id d75a77b69052e-4f35f3a051dmr284385851cf.9.1766500053152;
        Tue, 23 Dec 2025 06:27:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEsw8TOhjv6r9nZIguPFmBTZYdBATYu2f7Bi6Z7slZabfblusoMn6hz2QsbZpBdFgJjMJP/g==
X-Received: by 2002:ac8:7fd6:0:b0:4f3:4b53:a914 with SMTP id d75a77b69052e-4f35f3a051dmr284385491cf.9.1766500052737;
        Tue, 23 Dec 2025 06:27:32 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab4f0dsm1436477166b.15.2025.12.23.06.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 06:27:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Drew Fustini <fustini@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] Documentation/process: maintainer-soc: Mark 'make' as commands
Date: Tue, 23 Dec 2025 15:27:28 +0100
Message-ID: <20251223142726.73417-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=8d1DDUBn0OgxirOWILF6DGTSvv73dIacjmoQNFthptY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSqbPfVIHImHavp9Q4pi4X2H2aagN44h5mmn/o
 WUYqpR+7byJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUqmzwAKCRDBN2bmhouD
 15CjD/9zFz8j3C6DgK4c5gqpuqozJOXSLhiVpHrkZwu13cXfBtu687NNnO62sgKoDnmJSgY3jGS
 7TKC1tYhbkXa2y7LlYqwIR9AGqSZYIilY3tQgEm/mNhNNpLjvqlDI2jlM3Dz3RjVcnHhYPB7UmE
 HoH6F9QPAkYYSgKAlVbuO1O5WDuQ71vDzgfAocj/Nblq/wchctMoQYwHqLxQnf2HuhgjhelkVGa
 4QbZr32bHUPLha0Mrvc8blWj0TzC9IQH0lIAFaiHQloC3uBd2WZi6CiiP60R03a/6z4pr1O1Mum
 KW09CGeJWmUBeRJPi5CxXLve+GW74XcABup7kTaA/CehiLucCZ2wDSI+Q1TQBlDNfPH14lex+Gh
 xbyCb5GL2vorCXws3leX07vjVTPmhg5AZUwY7tPDrfSWCmUXqVgDwFkw9+nf1/bsrMlYq8+qQbf
 CJ0erAoMWH3x4mdTe3BkOUM0NArOgSANYZmM8hU/US1BMG/ad0GTixl+miF7Yv3hFcxd7IbSqJN
 Lks7K6Av4LeEyVDddo20QMnTL3ZNUY+zVJcW/xCzVkQhhCmX0tp99b+sC8efuAaCnIUp5irDC1T
 +6e7hPw/o/urn0IscJxfbGpASE0H1uikeIBwotNoyGeghDqqKnr7eCWjEqOk5Iex2ETO+v8Axrg 65fzbZuenE+xZwg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WUxUlfO7HqYZwMIF6vvVVrz3GCNMBcOR
X-Proofpoint-ORIG-GUID: WUxUlfO7HqYZwMIF6vvVVrz3GCNMBcOR
X-Authority-Analysis: v=2.4 cv=cuKWUl4i c=1 sm=1 tr=0 ts=694aa6d5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hP_y0LdtDFoG4kz1LQIA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDExOSBTYWx0ZWRfX95qYhl/VoUIc
 NUdSMS6Wz7E6B1EI5Tzzznkv17cHOZ32zwa4Wx25StOVR/HnT3MBCWrlD0567XG+GMqG0aec3yI
 pw/xI8Sxpxrs2i3dMNozrvBVtUh4QEHM4sVkyz+gr3BX7j4OdrHRm/LWGMuAeBLD3JUEDb7vRj4
 pk9fjjBDdmj+GdCaN/Mt3p6NZTQXjwpSyN2bPj2TnWu1oACRCXbS/k9R9LKfOb0M4AcRG+Mr1Su
 PJjovHwz4sk6DBhVzomMUl9NjedcR8xzH92Lid5jIvb0wRmdqbHmPbaQ1JB625U82rG8Zs9Rn70
 saGG4qneGp5U7QDhWKkpJVpBrDRNJwJZqExusD8LIeDwJvbCq1RX6rcL92KLz2l+5NdQNH44BwP
 xvvz0V/wxekaoOpDDmGwYAZDW8QHU/AUO0F1NoiGSXXlFAEw7/2d7N3Js+Yw3UuWZHkC+1ezgpq
 mIPbtvOm2O8mj2ex7Yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_062735_061386_C2BB4E82 
X-CRM114-Status: GOOD (  17.65  )
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

Improve readability of the docs by marking 'make dtbs/dtbs_check' as
shell commands.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/process/maintainer-soc.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
index 014c639022b2..7d6bad989ad8 100644
--- a/Documentation/process/maintainer-soc.rst
+++ b/Documentation/process/maintainer-soc.rst
@@ -116,9 +116,9 @@ coordinating how the changes get merged through different maintainer trees.
 Usually the branch that includes a driver change will also include the
 corresponding change to the devicetree binding description, to ensure they are
 in fact compatible.  This means that the devicetree branch can end up causing
-warnings in the "make dtbs_check" step.  If a devicetree change depends on
+warnings in the ``make dtbs_check`` step.  If a devicetree change depends on
 missing additions to a header file in include/dt-bindings/, it will fail the
-"make dtbs" step and not get merged.
+``make dtbs`` step and not get merged.
 
 There are multiple ways to deal with this:
 
-- 
2.51.0


