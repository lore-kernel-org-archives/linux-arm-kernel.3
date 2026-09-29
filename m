Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD83CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 09:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O7alf5yqesjOBC8gsAFdsEjxy9MwH5I9h4zXoZlLn/Y=; b=KPHYkiPCLtNMUBA3IR2V2KAKwG
	Uimcy5ubjYUIlChdx62fau9d+Y8867n05kxtQFV8q97MZ4E8Tg/TSoXqzjJ1lEHABjXI9GQKuWPDF
	L2RXyEJ66ycYRWtZ2gBLSMJbcFaYkO0BlS6NF/TWDMbZGhK7Z/l+M3BMtIsj7mv8gvPh7/GSC9B8o
	G3Lh/tLHwXAHhxKT7yH1snzOK+1Gz1lJHfHIfE28jlnFQcKeyGxSNFm0717t7Ld1ehA0KhCoaNQni
	//hO58+W8HP8q54X5Rhft8b4M082Fq3Ge6RcAmjY8CZOJYt9nbhfdnFHeF733OPdNDzO13PqyLieg
	6vT1OkpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUSD-0000000315R-1YRr;
	Tue, 29 Sep 2026 09:48:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUS7-0000000313K-0xkY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 09:48:48 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7Tsqe3684713
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 09:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O7alf5yqesjOBC8gsAFdsEjxy9MwH5I9h4zXoZlLn/Y=; b=koOhRLNO5KQmXB+p
	wYSKWU0B/gIGJomYj76p2TtkZQ8slliYa4DcFyT+f0gLnU65SnPuNs09YipwysKa
	8dORQdwrhIwjTg4xCyr1feRjbgG5ofMdVpWPmISOXgiOHB/GjyF/faC5jMv8ayeN
	7qMDEQMw+qgrYEcLSyupEPeny7gzs40Zr9VN0VLUPxO7RSAMmvr0v3avs43y1eHt
	mL1kJ2r0xdEb+7sIoZ0yKblXM4PE+o6yAYHF9u7aFl+t+UWHrG7y+uOrIFenJp6L
	WvUuPZW2HYtDN86KaytSZr8GrM0FhVM6gjQ1udnYbyKIXvwNfLpepQcPLC8rIvL8
	g0Qd6A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144t9vs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 09:48:46 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1438fef603cso8378321c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 02:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790675325; x=1791280125; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7alf5yqesjOBC8gsAFdsEjxy9MwH5I9h4zXoZlLn/Y=;
        b=UJS9GPlu8M1Ow4vVc6ApAqaqa5Eg2nM1xZjjmqzx2HA/UFfNvDNTBLMwx/I0Aq1vib
         dwlp4rT+Z0zIL73yIquifw3adJb1zRyABZvzVU49x38Xb6Vwy/MTMC/gCUQAEihqzbFL
         tnZaHktoBP1zIprRgcvw3jK4F4El67lzQKxZlJ6E2JieuvvAL/ev1CdR7+s8bZ8dkdaM
         jMlWZ/dCMZjdxnTVCVkTDFL+c6WS61vyadBSiz8Gtr3tZoff2KjixkVRHunw6dLpKOn5
         xS1qQ2ykajNiEKATIeaWqZ0cHCCMpLlCMWZDIztzXGjZHwaccCoyStbbMLtcAorEgnHC
         NcsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790675325; x=1791280125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O7alf5yqesjOBC8gsAFdsEjxy9MwH5I9h4zXoZlLn/Y=;
        b=0auLVzejfn5K9UtAxq+eFuNo/odlxQMhGxMLXDocB5lrFQm6O948Y4yNsfiGU7t/6R
         iXrnIeZNm/ZsQtIkf2FWkad7XDROpjl1i8Ri7devXQJaBZY3enyZGjXPg1bS9qow1JSa
         l6PXLJBdpOSGYTDyWGMqA5trJea5EezglkGUgWey7RdQG5H4u+h9cp764cGI+Vwu2LqR
         +0TRwmijsw85SZ8uVuxF1lkHi8sS8X7QIxxqAzLtlt7MRQ+12tji/p7axnTMwRC+BuwM
         /pRDBSjg8Ne/WHrWtzCfozpoVPcxXdV7/nciLgMTZBWQr8/ps+eCDunWWugTh2dzNINH
         sMsw==
X-Forwarded-Encrypted: i=1; AKwUvByCxYGgyWNoNv9q9GKbf7C1at0HxCNRC6S0cfJESVJ1Kv1KspkJhsYE/0THON+Ip/tnCXRCe6CmgAo6ddw4Ng/Y@lists.infradead.org
X-Gm-Message-State: AFuF++neM/9ZsYgkXw1l4p/NZLOxZd2j1st+ex9snYS/otWLS3QGms/l
	91KQljFVFR+DKCoJuGb5X83QCSkAgDsxq8iM/ilFXhOb/P6z3UU44m6mfyuvlagCkQXy3XX+ZRt
	jAaBa03TtwgDd9w9wt1/RnIHhDzSOC6LUSqyRBpPjyvRYJxLVJdtC5GFq+VXH2+VFq0a3v0DNm+
	B7yQ==
X-Gm-Gg: AYBFou0y74UXQzgrMtYvdcJQexcxlQowJKt9z1vfEcorcinIMLMaUq8pxHVQr9cBPcK
	D8eLeutxiWFKF5fCfVQAjCtVKXvOu+x/6HbZCsj0md8TRxBCIjPP73qknjK9YU8STVZj6RMDzT1
	QffVNFVSGgfdnLUKxT9LXH6SxzJD9+GNffVz4bPb8nm+z/ETWtRyhXSTFeMRTbgA/SVJcf1o7KU
	Dl5Q4ZMFbbkmj4ugRj+8fqtNK8iKAAbuhFBJPTTGjGQYJyuHK14bGGqiyvzn0aKpbX3PxhNOcWL
	XViSVZjtUkju8OWFnNU72kvbIxLTp2T3j/j7gx+lM6LgxQrC9pjMvNBj1wT9e1Pp5t1zCUh42I3
	uVEMt96heAukN66DOtpbnfcSp6AxjK86H2Ezct4v43SzcWVgUxI1lYImGeOsNPDn+Y30fE9xLKo
	hQhIVCKSET2z4Z0E656rqBNp4=
X-Received: by 2002:a05:7022:6881:b0:139:b575:d42f with SMTP id a92af1059eb24-146ce39a169mr20414871c88.17.1790675325011;
        Tue, 29 Sep 2026 02:48:45 -0700 (PDT)
X-Received: by 2002:a05:7022:6881:b0:139:b575:d42f with SMTP id a92af1059eb24-146ce39a169mr20414819c88.17.1790675324308;
        Tue, 29 Sep 2026 02:48:44 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14bfaaa296dsm1056163c88.9.2026.09.29.02.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:48:43 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:18:06 +0530
Subject: [PATCH v7 1/2] dt-bindings: soc: qcom,geni-se: Allow 1 or 2
 address and size cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-kuno-soc-support-v7-1-530f62dc4020@oss.qualcomm.com>
References: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
In-Reply-To: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790675315; l=1170;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=m6HIPF5r6TbYaTNfzS7HLPHkdxdQCddDgURTk8nWovs=;
 b=BNaL8nY6BMt6oeiq+dbAuQA8H163cAxwKxfyPg+qkJml6TLk2y4CdmQebdyvtkeJfQfH2YXP5
 PSQFEfxd4xDCPWndJQ7CRB7xxA6Qmk3wQ9Wo9bcADe0CHtZunb2PwT0
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzOCBTYWx0ZWRfX311lqCELBQbj
 MpXGT5u3D6ijGkCxt2Btiw77u92lnCmsC328ISCqxXU0XcoxwxD2uLm7DFRiS6SYcITVRaBHX6J
 bZJVNb0bzl2ld+1qAFMdeop8kfR5/sB8Q02oHUwtwfgdlqzZjesKPFVW1me7mhhYsZpWJq/9S6z
 uNZtqg2Q05ZC5YiVt+oXy01ODb1shwrL44FfvVzgUFUKyW55ZJlUGhw5+JdAzZhjoFOkaf5leuB
 ByfO4qZ2tWutZPG2uwmLPdrntbAYGuNCJVWqUtZ1mRuHeyWQ66IDQDQ291i0amU5b/13Ch7l/vv
 fgxyYJ4uKCCvh0fvKubdBFkCjwVp0KvRZydjsrZK595chPYPCuEuqwyaV8EIYd+lvLgS9pp95yM
 iInwOy/uEycp+v7vshTJsgA55EnyXjfp4amMPppuCSBdHinjtXw5EBN8wgKzU/JuxhgXVG7OjA2
 6fZBLQKawJjCGlwKx3A==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abb897e cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=p3y7badNstDnMIU1-wkA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: K-LLc2_-fZxcWdQF2U07G7gPoD7ChcAj
X-Proofpoint-GUID: K-LLc2_-fZxcWdQF2U07G7gPoD7ChcAj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzOCBTYWx0ZWRfXxbwRMaBjlHPH
 PgQ8MndSGwbNa5qT3YIAL9QhxeBUOdkYznnY6S/geBy8o2xK2BtNiEjjAV4HHrZLNDzHspA7HYN
 HQ+gliYtet/JprEQVHJd0YKjquDGEZU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_024847_403415_82E0A57D 
X-CRM114-Status: GOOD (  15.29  )
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

The QUP wrapper maps its serial engines 1:1 into the parent bus. On
64-bit Qualcomm SoCs that bus uses two address and size cells, but on
32-bit SoCs such as Kuno the soc node uses one. Requiring two cells
forces those SoCs to spell out an explicit ranges property instead of
the plain empty "ranges;" which dtc only accepts when the child and
parent cell counts match.

Allow either one or two cells so the wrapper can follow its parent bus.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
index 54cd585f19e3..c01ad421a122 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
@@ -36,10 +36,10 @@ properties:
     maxItems: 2
 
   "#address-cells":
-    const: 2
+    enum: [ 1, 2 ]
 
   "#size-cells":
-    const: 2
+    enum: [ 1, 2 ]
 
   ranges: true
 

-- 
2.43.0


