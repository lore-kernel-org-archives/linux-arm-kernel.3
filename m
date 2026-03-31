Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBF8FF60EE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 09:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5rofAEuGQOrjqZkvSyqr9+MlK3x1jL7wHrb7Kr4V9Zw=; b=09Pp5PL7wIXBPI
	n6jD28gay+1oypCrtNzo9hHOWD4OezoGARFe0kgZtq5yK3ITyMkcaabQujnUr0EAf8cRXt1FHTRx+
	d2pHNv3JGRAl9Z1KSUIoutFFSGNpaXsYLcT63qH8ycRtzlNk0PEsS2rHCGhOCfC1Nl+buzCObqGDe
	lygz8tOXQsxC7+UI2rnIZWw72jvlETYx9+HMK/cBBgLoAK/iu3V7DKzW4PDCoYB+2jk8MkzWP31Px
	F0/k77cRUwaJXnEBLhUUxTS4h5nZVMKfXq5E2dvwNEfizaC9KwiywJHsYcaDYEFcjETblZmNiGM9G
	OLt48+zTLS6DTQAwjXUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7V7n-0000000CevB-3Qzu;
	Tue, 31 Mar 2026 09:11:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7V7k-0000000CeuQ-1lsg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 09:11:01 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V5l1rC1842388
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 09:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5rofAEuGQOrjqZkvSyqr9+
	MlK3x1jL7wHrb7Kr4V9Zw=; b=pbDdF1gry4hOg4JaP1lbQ7EwZkpKidSW2FUWBA
	3Dio2DPOZcPssorEdOU4UGSfWYRZ2uZJd/MOazD1oFk3iMUemvYtGMX7qJixDKi/
	TadnLhm7ypLjbNJCVF79O2ob7WzPPzzzoMhglXfajnKO2vdl+P0qu+gw09A4MdXR
	9IrR6gODms8ZfHY1r6nKEwGMLG2q+sTF580N++LueZHnrMzc4kfxa1jA+mbZ/sTR
	qn/Qr94v88N+3Bq7CrH2RJjX7w2KBQ/3StKMLG/UaW7vGMvZVDhKgP6vnmjSnz0A
	Vh4eIL1vY8FBw3f/cIQMMQWzUmXrgc5qk+cDNgPjthiFTVKw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80rsj9ra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 09:10:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b802961ecso71262351cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 02:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948259; x=1775553059; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5rofAEuGQOrjqZkvSyqr9+MlK3x1jL7wHrb7Kr4V9Zw=;
        b=Ycf3nz0Hh3c2H1G4EYDyt4rHkSEDDDw73ahnwKS1UribgZ/RItbss2qSM3XWs2nOlV
         ObFJwrzHZuXNOiRrigjkirE6cp+E9ZgigFwDe8XhWid58hqO8X+iPFTdMW6y4d0cZpiS
         3k0H30wO61z5lGjsXl1c9q/44SdEf1H5o05pVbpkoQlUet6w3H4VDoyqzeyhbXozzJeP
         hSjMUpl/SYgEQ9PKJxtU54GO9T6yxw1dwzhYFPjIij4YaQCUgA8xI+U0PPI2jTohDCIL
         vsDnJsOud/kV7ymfm0JvX659nZuEWg4McOXVy20u9JBJmdnkYipQRYKd8g46UGswnRJA
         4QAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948259; x=1775553059;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5rofAEuGQOrjqZkvSyqr9+MlK3x1jL7wHrb7Kr4V9Zw=;
        b=hnqQPbVAsbrj6XHAIdOe0YAAAO1wdkHsq+ijiKE4qPXkGPW7NSSE0rqjCK3ZtfUrXt
         JNpSJ7FHSLd8ArQChLENFR47RxgZAz+E8CxTiKY+d3unDxwK6jqlse5zxVz2NZJOdxJ7
         wdnbSlIzUJBEFxDOFowCRK9LcYDWoCTvNJLpjZ0ryvPyfxUkCOpxmVGM7QNNkNPC9Yt/
         s1qSSaLyqwx6FGQDkp2fvC5BYLjOMLFHUsj6wbmuXQNTDZxOmB/1Dcdk+5hLLSwT6m7W
         ZIan3I8q9JUXYSPo1G4OfwOnVEr0aQYSBDaCjLVfydU/C5qrnS7Buph4ikCpgeRvGzVY
         QJaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDf4j4WTFrVtB1Gq0bqCSCYNjF0NmQvq90vjahZLwLtLxDce1HEe0GYD3J4sjiEQrxQLMv8263gf0vLmeaf74M@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcp9y0STW8gk1RkkVCLODedzSh3ib2t6JMaJe9n+ZWQ13QlhjC
	FPDwwMtXIP6fttO+2Mwb6fBdXUI+fTUc5HVt/HOr6riPBuXJ594tAAlgPw67tM47trjZsb/Wb84
	L6Z6Gxdb1U0kdnYhVvHfVmWUx6qDIRMct2l/Xo7aDXe4bu2BkB8oEvrag5ybGN4Jcq3bqL4BQRi
	QOFg==
X-Gm-Gg: ATEYQzw1f8lH+JsOkNCzuAMD3F1sWeZKLV6edCZtY7/CAR4xgGbe7C09bOZAFxJf5ea
	Ro3VBoMLz5C6QYn/FdH19IHRS5/DS+6cBmKmGHxELZ6Ddo74gpGH9BbJjsyxatgeKMbZgIMANub
	4zQPqvW7vAK9WDzS12vXYuS3p9o+7aqbu3UAxh0scST47kiDwFQttyaSW5mLgqbzGSbaSWgh1FD
	4gRu4Uu9du6K591bm3ANC5J4qoMr5uAi13q0BpC3SoRV23T3tsEQjP9Gws3t+JrlswrHPMOXWHD
	7aPljeCbJTjL3G1YvOwMIyMs4FnI5+DrR0Ca9pyQki09FJeqUbDhJfdlui3CXogiruRigwv8AsM
	pUJJcutEUU3/zQgJA83aFPasUSZCKyw6M7k6Gb+3Kr9bQszf4ack=
X-Received: by 2002:ac8:5809:0:b0:509:1470:d3b2 with SMTP id d75a77b69052e-50ba3971756mr195340621cf.60.1774948258686;
        Tue, 31 Mar 2026 02:10:58 -0700 (PDT)
X-Received: by 2002:ac8:5809:0:b0:509:1470:d3b2 with SMTP id d75a77b69052e-50ba3971756mr195340321cf.60.1774948258170;
        Tue, 31 Mar 2026 02:10:58 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:29fb:516:a90f:8dda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21f1749sm25974860f8f.14.2026.03.31.02.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:10:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/3] ARM: pxa: attach software nodes to the GPIO
 controllers
Date: Tue, 31 Mar 2026 11:10:46 +0200
Message-Id: <20260331-pxa-gpio-swnodes-v1-0-f66d86d10d8d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJaPy2kC/x3MQQqAIBBA0avErBtQByK6SrSQHGs2Kg5UEN49a
 fkW/7+gXIUVluGFypeo5NRhxwH206eDUUI3OOMmQ2SwPB6PIhn1TjmwoiXnZ+ujNUzQs1I5yvM
 v1621D09ltYpiAAAA
X-Change-ID: 20260330-pxa-gpio-swnodes-132a81af10e3
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gNfw92MKGJloH5lQFl0qvVBeXgsIWu0g+hx/PhbV3os=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpy4+YY18VqKMyaaNEP2xBh6GoVyLgEbBUmLOVX
 z5izue0pkKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacuPmAAKCRAFnS7L/zaE
 w0XPD/sE80ZZNZDPihOYLulSEr5yH0iOGvbA4cdq0sAeudLaXjDpjqxHE+IV6EwcnPnGI7EITH3
 w/MqJzDgk+pULKJKOFEwDzZMoFsswx1AeVc4fz2ZNGECmb3T0WqxvRXZME96VV9ZTHSK0ePSLo1
 KS53PLpq0yFeLKgvGrixs6AwvoEPYJ18PVAuoTB3JEQfoSaC7BLnV2g/PXf93HKniEKrxgfh1fS
 6hOCj2PgjsFUEZEYFi/u1NhaUZTd4e+8BnU0HHZJyG8LaKQ9lt0ycFHhC46H9VuQt2ijK4Jwkca
 qfBzUmP7PCO2SUsMJGY5djSWWNGkrcguI6jZC5h6i6DoRDjhQyU6Zv9ZRIEshnCIRD0HdRB1JB8
 DN/Z8iem9oZPayCjAhBHrGHLJb6dEvLUEJAd2ifUgjyoSnSCtHwYUSHs1tjoyJePEpkIP342hCn
 YSJDmR9CaGnmD8gVo81t02SFZbKFJrnJWgLznzpARWOKeJK1l5jtFQZkLzLaXGq75yJ8WOFgXo/
 DeftNMOm6dghNVglOYk8aTb6hn1Z5Pqh7Xc0E1pmwokhPhI9Ia6kbpAPqKJslxNeODegDHFaPmi
 PAbkfF+7hs2L3Y0L9OYy+R9ueAMU8JMlFDbBTfn3T3mQ4G9zgbdZizHZ/Kil4zKi9Lw6/Vq2C4c
 5fcNrAyypiBO7Fg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: CGkNJeaATT9ACt5uapaLCPFLvAu5X1ui
X-Authority-Analysis: v=2.4 cv=VInQXtPX c=1 sm=1 tr=0 ts=69cb8fa3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=zaRJeZBJaPDVN_C3E_YA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: CGkNJeaATT9ACt5uapaLCPFLvAu5X1ui
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4NiBTYWx0ZWRfX5W+luHnbtQqL
 9cxFe7hETiG1zK8pir0gzBtqG+PUOvaQpbvov9M1ahzSa6qWw8PgZOG39SZj9MPah49DaM2ATsy
 RwQ85Hslidf3JIL9b3Vl0kheyz4NDeergFCU/lzX32Kz7HlTg9yCwvl161XL4Q6G1TmH0Dgp3Co
 HmC5slWFyzne34MPEGkF1EJ6HfFom2YJ/1d7UEbc9AUpr6YBZAcQzx7gFz/S28fIcFF9wtYF1Qk
 XpJA1TciBsiM8K5S5v2iPXFF+ClgE8JUlmSWWC3G2ZTUbninJeY3Jr7JUzMEIqh4sciK+h75do8
 8Tcg3mnBnKEPulAdoceXlulOX30taunCvaqsWYm5NAWTPotMSqtI5PHRMUl9AI764EvG601BZxz
 NqPzT/rkTpVt/5ne2UIDf6mF4Xf/e88hKAUKxHyc0aFSufzQBVZkKM3VnsvMldMzzYLy5OpGmwQ
 b2TuSZbJZn9H9IyBHfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_021100_583029_D8A68B66 
X-CRM114-Status: GOOD (  15.19  )
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

I was looking for a use-case where automatic secondary fwnode assignment
would make sense for a DT platform. With the paz00 issue having been
addressed by Dmitry, PXA looked like the last one that could match the
idea but it turned out that we can just easily attach the software nodes
to their controllers enabling fwnode lookup of GPIOs.

After that the only GPIO consumers that still use label lookup with
dangling software nodes are ACPI platform devices and a single PCI
use-case. In that case, I won't be doing anything OF-related and will
limit the x86 tablets series to an ACPI-centric solution.

With that being said: here's a series attaching software nodes to GPIO
controllers on the PXA platform. Since everything happens in a
bord-file, it's quite straightforward.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (3):
      ARM: pxa: spitz: attach software nodes to their target GPIO controllers
      ARM: pxa: pxa25x: attach software node to its target GPIO controller
      ARM: pxa: pxa27x: attach software node to its target GPIO controller

 arch/arm/mach-pxa/pxa25x.c | 5 ++++-
 arch/arm/mach-pxa/pxa27x.c | 5 ++++-
 arch/arm/mach-pxa/spitz.c  | 7 ++++++-
 3 files changed, 14 insertions(+), 3 deletions(-)
---
base-commit: fd74e29ef736c1098bd2ea77e3129b532383bbe7
change-id: 20260330-pxa-gpio-swnodes-132a81af10e3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


