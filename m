Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258E4C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 18:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S9JEODdv7z0HyQoe8gmfrEdwLtIPX7H4ORLuaqxrBCY=; b=3YfvXrDcT8/SosDHtcMcCE9NXs
	o+7OZPU6kUW2cMfC7sUhhE43tGZb7iOasOqmRzUvcxteeVavT7/UwG3lMhR0tElSekoVxrnnzCY4P
	rDwfAnv+Pa/qrDuaxzTKOWagc6bek0/cGD2MFw5UBO5Rjv9a1X2UjgBTQVRqVUyRoz02GHB01OZyV
	wN7C1OwHY3MfG+bo5aA5qsFPZsQU5aBHTWovp/sQwWupK4B3cqiDEIlNp1fbSJx6KQW0Z3HFgDqNc
	3bJqu1sBZR7DEMtwYKIAfiQTZoEQKDQEqzn2xx92mobi1dlahfy1oTVER0Vn5VDyoSFB5DgtMkY85
	lFO+Cw0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8NSr-00000000Unn-0KEc;
	Fri, 25 Apr 2025 18:07:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8N8q-00000000RZY-2iLR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 17:47:13 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGKcYr009746
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 17:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S9JEODdv7z0HyQoe8gmfrEdwLtIPX7H4ORLuaqxrBCY=; b=Sb0Gs5DSSnebJTdu
	4BFchMWOjEE0/t3PszXoumzDdAkbREcFkxZMObDKxurApR65XoWnli/37EbH72yo
	QdgmvX2e0TjNFLk1GcQ25hGJede+M8ONzPwznWoqqfqPTW1j6hvyEwqUyyq2bmXS
	O2de+4/nSPLREmLWKlhrzaMadHwe61rY5pniZNIrB2YG9dlBcUw+ASTRc6olK2go
	A8MBMfWEsY64NHJ7MziFAkl6y+pMlQ684oyYk61Z/JgCc3QkKLgZU491nhHZj6Tb
	ToW40fkBIQ03tEvNR8zH3dnwVuPdZcyuxfm1XlLddMOmEQ6nX7PiicKseKn1tgrJ
	FWHvzw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2hxgb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 17:47:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e91ee078aaso40673256d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 10:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745603230; x=1746208030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9JEODdv7z0HyQoe8gmfrEdwLtIPX7H4ORLuaqxrBCY=;
        b=tEgNnHHHX7iFT1YWEqNWmyxU7BXnjoAMhA/sx3B+huQijSgKV93u/EVmjpIgS6NhQB
         O3EhciPQzlF9jQiIJ2K7+vnQbxYoS/GRq/QeDDex+ftZKVVEoYUlW1CwPwYWna7G8czn
         TBq73waPSTWy7QOCFlcZJY4J2S+AQkY/gEGRJwnl6b5izUXIde3k6361WCrkXzRfLxdV
         ogN+hL1lQVs50PegUXa9TLhr/a3oahlaAWPueehvmMvvan6tGVRdvWoHv3/wFmllo9g+
         HQPSbr44YDbfamHQPtgI59vOdzs8bZqIuqhGVIxyA7VuYNwIVsukOSSaRxmVq6F42nmw
         Wm5g==
X-Forwarded-Encrypted: i=1; AJvYcCUnOd+JLkcpn/XylgUW8faCWShSvLjPingmc86XpBkgOj8FMyIRme0YnhVgqUhWIWXd4u+vohQAX+GM6VxXmGte@lists.infradead.org
X-Gm-Message-State: AOJu0YzFai67swBgAD52Ad6TXk14Ls9wXknRz9HvD1mloysiUXqnFiPR
	NrofSp2SzQJoOL9pTIsO0p6+NFfbjZiscmxPeRB6DWc3XXkMeBoa3h7RCTUitF8ai8m7mbpd7uw
	W7D2ZYpQcIvDOVPKEJKTzubxeS9jSdcqk82Pmhp6MT+UZuwZ7JNNDti7rIh8D4nFMc9YswQm06A
	==
X-Gm-Gg: ASbGncuyzv+OSDqBm1Z9H2Sm1BTqqqZqbjCU6uQlMU7QWjW0DaXQuRbfyt997nmzIdJ
	v/JmcDZK+1nG7cxdRzoFLaZRBY/kdrfmrnSBOkd9Y+aXemCvVkQ5w5UN8guEPYER3RCqqfTopfJ
	qwtoPaYclOzbbMQDsfZZhW/6ZTo5KMAU/6PcTm3yUUbmTHtl3w010q8nBk8gmyu34vXd4JTjrtZ
	zvkJPl+Fjo8zwJDJXwV6HfiIYMzTblhkocmE0k0CVGLBtxPXIG1nyOAz2MGT46KghfaCOkQBKcO
	NX/ZDeVHlfWFHfwEkQvfKSRT+EC8R9lq0GBzD3OmQF8T26CWoOuPSqHNin9fQxCawuIZfSCS4Dw
	gCP8UsH9pK/TZFBbgxgpXQGVK
X-Received: by 2002:a05:6214:76c:b0:6eb:28e4:8518 with SMTP id 6a1803df08f44-6f4cba46035mr54805906d6.34.1745603230597;
        Fri, 25 Apr 2025 10:47:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIEqY7ImncnVDphCtbnSGLOWmanZeVwVNunDzbKH6dvD3Kbv7e2FBrG3D+7RsO/6h6RuRDpw==
X-Received: by 2002:a05:6214:76c:b0:6eb:28e4:8518 with SMTP id 6a1803df08f44-6f4cba46035mr54805586d6.34.1745603230262;
        Fri, 25 Apr 2025 10:47:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bd4asm673193e87.84.2025.04.25.10.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:47:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 20:47:01 +0300
Subject: [PATCH v3 01/11] Revert "dt-bindings: mfd: syscon: Add
 qcom,apq8064-mmss-sfpb"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fix-nexus-4-v3-1-da4e39e86d41@oss.qualcomm.com>
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
In-Reply-To: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1372;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=J08TN0ztRB7ngJ2Xbw4dsWy2SXPRknR9RhUG+D0mpHY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC8qZUWSwuEll7v2nmDp8IdjOzzGjkt+i3ZClV
 2s3mTPvyBmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvKmQAKCRCLPIo+Aiko
 1VIeB/9B6xPFhmfAsHDltpJxU10pORyD/GZK0TKmUo4EmLcQu/iAUyp7FAAxQ0dV2CKtKv3Yssc
 e+MOgqzwAA7xY30vFFnLWNNdVze4SQm2ozgfZfBU/8A5dRaF1qWhAZhhWuohkpuL0dziErXzkAS
 OdiHeAiZMJ9WR/co7mEq6OxK+gQDVOODLspiwszb1hushVDHWuptWhejp3Xca+Ndl7cUh5eFdrc
 FuBMaXzKBcz+r3bbd7Xq/tuMM1Jh/Y/2T4duIOaUb7FvsQfnYc/Js/+C1MiF64KDlJgARAvrgZD
 xktTjtjH5vqj1E3O5j07YJNwO0JpvH2sn2nuPHnhSb6Xv/GP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Py-1O1GVk1j-gpatlql8oq8tOpMalRKd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNiBTYWx0ZWRfXzAdXOBAkTIjU qV8YHtW7g+SPpCsGQX3+veWofTFOjGzV9krVSgoOhp+Fgr6B2ELU2mbSiGG0RO5Ds6yfMgU15qd Z/dhQFZYtTg0JidLmqd1/n1slf2zueExJ/1efBvqnsZ2qXv1Azq6VUNf7NVHWjovd3CEF4MHuhr
 JSDFBN+CEbbmCr7N+Rq5+GatcRhn0Cu+VmITcoKF88PgmHLn5+7jz+p544lDHD8F8nRxxFmGmSJ x5WoJc8GeiImm+nUZBMwRwiKpGoxSl0rmsmQHKkVk1qjUauriBy88FUUBAKaUEiiRZzIlpvab9C 9ZeIvuSkmvB7WYdGnVn2zIM63X5aO/9bWX968xD7xbOB/MzJXgCJjy37eAVqXx2ME/1/YkGMsvj
 4A8N94+XuFcuFKP66MNwQoPEb1BFv1GVfR5GCqixzrPis/6XTMT3oPeOdHTY8yzrkHHxAhVa
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680bcaa0 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=LOr32vULjwKzbL0q30IA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: Py-1O1GVk1j-gpatlql8oq8tOpMalRKd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_104712_696554_561D8B4C 
X-CRM114-Status: GOOD (  13.36  )
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

For some reason Lee has mis-squashed two commits, picking up one chunk
from the first patch and one chunk from the second one. Rather than
trying to fix it, revert commit 2c8de7df7418 ("dt-bindings: mfd: syscon:
Add qcom,apq8064-mmss-sfpb").

Fixes: 2c8de7df7418 ("dt-bindings: mfd: syscon: Add qcom,apq8064-mmss-sfpb")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 71741f06d2fddd2d4fb6b69c1cfd2d449ce73f64..c6bbb19c3e3e2245b4a823df06e7f361da311000 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -98,7 +98,6 @@ select:
           - mstar,msc313-pmsleep
           - nuvoton,ma35d1-sys
           - nuvoton,wpcm450-shm
-          - qcom,apq8064-mmss-sfpb
           - rockchip,px30-qos
           - rockchip,rk3036-qos
           - rockchip,rk3066-qos
@@ -202,7 +201,6 @@ properties:
           - mstar,msc313-pmsleep
           - nuvoton,ma35d1-sys
           - nuvoton,wpcm450-shm
-          - qcom,apq8064-sps-sic
           - rockchip,px30-qos
           - rockchip,rk3036-qos
           - rockchip,rk3066-qos

-- 
2.39.5


