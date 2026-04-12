Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFC2E937EA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 16:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sXti8VrOTViLTFMO1s48YwMgytzp5Ygon3ChdIV1l04=; b=Zk4iHKI9tqvgCv
	czAOx+CcVUOCLkw4vTZiPXjDFgM26bo+F0rQuaMx908t5ni7xYdFMYWCDy6gtrPUymcyOobx1u3+0
	WtxIHR1R1n3nKAWxviehv/w3x9k/ht5gVcucFeHnEN2pvOFNOHW18UqFJEw5natGOWRFZ/fot0qHK
	xXhv6tENRFl24eN7scN5C+npo7lPU1E2rpikaWd5DEChE4yohSUtqFhIBOf8+4jOFPKqXg3QxqobS
	/0oc48AZN6mN3r7DkCr1cqbGNbFdtKzd7eCTsfYyHB1l85t6y6WQzozNmaOMKYm5MODUzPngB+ETL
	V8+D2eq5M04YRZ8cdP5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBxYq-0000000ETcs-1EMc;
	Sun, 12 Apr 2026 16:21:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBxYn-0000000ETcS-2jq3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 16:21:23 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE5Rwa3315177
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 16:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sXti8VrOTViLTFMO1s48Yw
	Mgytzp5Ygon3ChdIV1l04=; b=D1HPuz3QHfy+G8xwit2dE0OCp8kHuPV2MVf2lY
	kE6epkPtOftWdg+EjISqHvoKa/YAHalATXMmxRR55V6/+1oq98qiTYr0dr50Fx7A
	UHfctaATdKv28/OInW9UZnJg0Z9pLtmiTiFd2BgiZhUW+seWde3fAdgXbv8du+rQ
	Jh7QzBnkIeolbYMRE8tCCcQkk4Zc5twJ2RVAT5VXpgMjt4Z2lau2Pia59bSjhlPc
	DtAip9Wwq2yimqqEno2908dsSzNzr/Xc+ox8YOrrJIj2j269r8+fIU3vjMGSrWkt
	p3N+3KJ+DcQRcCwOLhD2zOq0DeQifNwQTrj+0fNH4gz7aggQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfewktmjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 16:21:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d9a6a853bso90192691cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 09:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776010880; x=1776615680; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sXti8VrOTViLTFMO1s48YwMgytzp5Ygon3ChdIV1l04=;
        b=fMkJ1lJ1dS7LId99ggICptcCouXezOwoplch+QIL01t+HWzHwyqN/ouSHBuk3C79ia
         IMNNCv9m4Et+U2imWa48Y8arPFQuUXMuqfkueZciujuPMupGlxAnbyRokSEUGDu3Bdyg
         9sfm3yuAn0idhfAVhDThorWWbV7jVrmdDq47tNkysYaN34JP+lyVIpzjCCJO36SDpdFx
         l/BHBoVixR7ZxY4y7TjtHG8GrTVjNU1IpEobcXzE06JBTbfDztysp/hkLusUL/KeCRYe
         meZHGmajC0gkoKfyjLbt+qHBQ9CEbezEO2TRIFI7n/6UG23/Bs8hnlZqP74yq/xYUgsE
         LsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776010880; x=1776615680;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXti8VrOTViLTFMO1s48YwMgytzp5Ygon3ChdIV1l04=;
        b=aI42kau4K40m6WgyVXK7he9MNnZYpfaNqkI261s+6Ea16wYmtvA0N4jeQdlCFb7XpI
         aWTPoAlClvNih8QQzQEtoeJAk3JQ7PCmKzrjb51BtqavBv2DkXuwgIl712gacrhqmDKP
         2WWX3jQfkDBlp5V5reePkX+r6goOZ0yUrN0NndFVQ1Z+WZbIShgSd4YdnpaibeODqojD
         0Xum6kp8Oe/hseCk6AC7pbK9WG7S22cjIN+2J3WyX9hbxm/5+QqI8gHB41n0Is8zmUN2
         ASessyh9ktbiIzS9tb2clsY/W6H9lsfNj6cwi9E38W4XQkvw4CUHiLVW8zJHV3ub7Wnh
         p0Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUmx1Fu31FPimSf9l7zIYmBlVlrjgcQZJMrhi0/GIO9Oyf9rserFhGZBhpoVM0a8LEq/WIXVqByqULZkPuvy+Ol@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ852Y0sEhv7liR5slcpA1FUd0Ov9eGMhYKcEEO9APshF7w2wE
	dAZwNKyrjdyXG86a+4lNGTWlX+CSeymt5UUUcuXxueFwr4ybVF8Y/GWXwZiRYx5iSH5/EqP/kEF
	nGqrAw1N03cIvjptlvHYGHUoqU+59MkfHFjyKt3U362K8UTz+BpP9YcgVIow+RoS9H1OEarKZZo
	218w==
X-Gm-Gg: AeBDietJfu747bmrA/vcuUNM8opwIZk3e+5/phrnrQS8lQM0LmiboLfaN/uKWY2mi5n
	D55mJ3oq7faCCiI2pwoX5ujaWXa63bmXFtxo1IFeSeh0qfT9sSHvZ2F7gHvQyDhl5C3OvgizSeV
	Ym5Mp51823UmoshSsu6cNQbaVz3wPIIwUPyw/3U/sffwJCcb71c01Idn8pXTI2unDk3GggNdSNW
	9ezEuxbZWqnN3vCoLwyG1kvBxPagzaonYbFSmmYUV3WinjfzKUh6NZoIkQ8GrfaApUu/nu1h2EU
	G3T+HeCfcUjGF/6ELRx8KzvNR86TnfB76ZgPXCAVdcaPEG47OjdQt7Uc2H+k1sSlcL6ty0VAsx+
	TOYYzjPjFnG1tDI7vy0d7eze+PxOMyH+aYfOPa9nG97d1
X-Received: by 2002:a05:622a:1b12:b0:50d:7f60:621f with SMTP id d75a77b69052e-50dd5b7b590mr153597131cf.29.1776010879578;
        Sun, 12 Apr 2026 09:21:19 -0700 (PDT)
X-Received: by 2002:a05:622a:1b12:b0:50d:7f60:621f with SMTP id d75a77b69052e-50dd5b7b590mr153596851cf.29.1776010879103;
        Sun, 12 Apr 2026 09:21:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d531f229sm301286585e9.3.2026.04.12.09.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 09:21:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/6] arm64: defconfig: Cleanup and change Ethernet drivers
Date: Sun, 12 Apr 2026 18:21:02 +0200
Message-Id: <20260412-defconfig-v1-0-a46918286451@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG7G22kC/yXMTQqAIBBA4avErBPSfsSuEi1Sx5oWFloRRHfPa
 vnB410QMRBGaLMLAh4UafEJPM/ATIMfkZFNBlGIpqi4YBadWbyjkelaonRK16WqIPVrQEfn9+r
 633HXM5rtHcB9P9bHZCJtAAAA
X-Change-ID: 20260412-defconfig-b57e7f9b5394
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=812;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bQ+zUzzbMGJ1KdwdPcm7KPnoiDcPjH4CEbd8yVzeEec=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp28Zze/36s8jGtr3si9JM5P/cHBO79Ku0FW4wu
 dOtvuUxQjaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadvGcwAKCRDBN2bmhouD
 18uzD/9Nf+1gdApkTG4M9+c1DnRQw3OIRp8qebDPW5/9/+KYYpH0+51VdMK9NJUI+MS52cg/B0F
 Ef0RJ3qKFxm/PjC/VSfb9ILpjjqjLHjs40jBnQwIYT40KKLlgeP0JsJCeL0VckY44Yv3tdKxSLu
 phE1Di2rCEV2TAJr5ynmaQ6YrUIuHuHlVICZ7700Eqh6igSEyW5iyPcKjurCwVVkx6Ra0xsqFuC
 K5WZdSdyAQ3+s3lBmaO/xcNNc36uxzS7y0sTlbN3xyJ1EAKgIXgNBZUNNjyaPduz0YOOCB8Yzwj
 wayhAHAouAxJA7TLFSW79o3AKzKIvQwyuh58Tp+EgIgkFqL/dYbsYWDvk5sIoMTnVPUPaLE+57Z
 lHNdZZPIn+O80/XLIV8JVoWvN4D1Uh+f6Xj3uhA9Xdgh1fMcJoTVZ+YrPjUGwS58nL8hvF/i3T3
 y/RwMzqV+fm0CVZ5SLx5IqRLxwsuFL3FswONB+SvORKOMUnHE9I31ayCq7m3xK023qqONZNWYh9
 BJAI4ndlJx/QY1MHESuVfROCY8tf72tdoFmnZOH/xO8qR5l/62lNNS9lZbdPmKU7PGOmLyvpj+Q
 /99V1j0k4lJFkPQ2IUBuO5biIsPzCxdhQBjiBj89cGQ/iWnlOh7NnoKI0asrPunKDCBb7P3Lq2y
 Nfv3W+0g8J7nxlg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=bcFbluPB c=1 sm=1 tr=0 ts=69dbc680 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=zAhwAz0-9tGWcaRmco4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE1OSBTYWx0ZWRfX795KYpCdvwrc
 Z3jbsW16+f8pTH1pfoRVZL6JYn0xmUgSmJhLVdyC+fw+0Ogg62IJiXq/j+kiqEC3aTYFCCvHAOQ
 43fnfEsAFYg3NCzRDI5Fe0e0gq1zknRKr6+B2Sj9YvuWw1F6n9YFNSgMqfNUKcY/dLg8uOAIuv1
 SvnCAXHI9BCM0N1mpeX+hVTReoqW6UiNwVOJwg4ECwCqn0lT4x/bgrydc43qJbtJUAv8+B5NaDT
 m6rMTREdMigMFnnquKOzF3kORiEBd3l27Ted1qqp4CN3NOjzrJwz8aRZAb+5+O7OqafaHisaMIi
 CizUEeUJslepqnlKPhO6QzjCqFi5snDzdBN1SncUFoYLIXFxGy5j1y7LUw4XuIYpLfI6iQ6ooHa
 zX4v9DO5ZN6Uj3Py3RWpwL5yW/QLepor4k4fpsmipvJ9j2fAIDKT/NS7YbpQ76TIHp3d7sgz1/4
 r4jxuhzn6LyDr3fVVcQ==
X-Proofpoint-ORIG-GUID: b10flmFmiawYs6xPEudOHwPognNq_gGE
X-Proofpoint-GUID: b10flmFmiawYs6xPEudOHwPognNq_gGE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604120159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_092121_884400_C4B3A9E7 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

Several first commits have no functional impact.  The last two might
have.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (6):
      arm64: defconfig: Move entries to match savedefconfig
      arm64: defconfig: Drop unused legacy netfilter options
      arm64: defconfig: Drop default or selected drivers
      arm64: defconfig: Drop unused Ethernet vendors
      arm64: defconfig: Drop AMD XGBE Ethernet driver
      arm64: defconfig: Switch Ethernet drivers to modules

 arch/arm64/configs/defconfig | 371 +++++++++++++++++++++++--------------------
 1 file changed, 195 insertions(+), 176 deletions(-)
---
base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
change-id: 20260412-defconfig-b57e7f9b5394

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


