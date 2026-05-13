Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C104CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 16:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/yocMUcQeW0PxY80907g0p8nmDgbrIZycpfry1XcMUU=; b=uQm+VLPtOGrdMx/2t3zOjJiIaW
	E1VkV8l73mBbDZA7134vXP6pXO5/7kKKeSljrn3J2bo8yu2ONGeKHs+uy75b1lAW8ZvPXRKSHxevv
	bqzUKOEGGlRghUoCIQvyCFvdz7eZqSWjGBw4q4qFmFniWSHoDrryiD50pHqXTKGdBFC6gNvc14XyP
	lPVikB6wG1Mv7TjaTW7VhuBm7Q0JoBVdyxN98XzqU9vhGU1VVktqQbMmKaiUKhQ1T2gabUGjTMhuG
	ZA+cPlXvKbl0rApbwSgOE6ECrTNbXo+Vt3VTwS/iDuLZuAhmWOmGgDIBGstFTlfJCgx1NxtWLD6Me
	aBIA9cZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNChU-00000003FIS-3EMd;
	Wed, 13 May 2026 16:44:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNChK-00000003FAw-04Wc
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 May 2026 16:44:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/yocMUcQeW0PxY80907g0p8nmDgbrIZycpfry1XcMUU=; b=EOaguphKQ0cABz4Zno1Z6hnf+I
	RIfKSVkI9NvI6vYDOCiU+I77BGljCbDUywNNT8/O8TZHZXQ0PxebL6nx7p/biTTghNQ0ZPrhOQZT4
	VClebuNrgmVyAd7fEp2bgTTINedjT8mArr+QydCF59HDOFuwFOzlhNLa5hTW6p/Hp+/tPiwINKG9b
	YlDqnONgKLTgvpiyZCzClwZTgXWtzug4V2Zd50Yiy0Mq8/NT/rS2xvRVWue1oqKjJyyPApC5IzrkU
	xbdol/WgjhOautSPZKg44V9ucicC0EdXLQNbEFgpbf0gf7Hw5GUMStNAmE3oNrjqqqQWwwBYzR1+T
	zPcRDoGw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNChG-00000000WSz-2GmW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 16:44:36 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGA9ad3007122
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 16:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/yocMUcQeW0PxY80907g0p8nmDgbrIZycpfry1XcMUU=; b=cf3SfnnLkQ+pkgYE
	MS33afG6mXyDivAhUfoDnbMgQdWM5SSnBmh/t+YQKOk0CzSS/H/p5gqggy/bz+Ld
	kUoeG/PH+P+Eie4YA/PuNweQtcaYkDgPM0jm7xDzeEYM7+OiwaPXJH62mTGO8gBV
	HkYv3MlyhmuzTA3I4+Y9vOzgWX/YB10Y3VMfzdwYDL78aVMwcC7J/KI372xBw8a8
	kSKyv6hUieVWgbKOybaOU4o76LKGM0LUtBCFKhnR4PqdlM6igEomq6tPPCAIFHil
	f6CH3F03k4IRfc171OnKO4bJwhW4Dz05WUK7ZrOvWveSOSxSzVof79L1LLSz6o7N
	w8YjVw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0hm0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 16:44:31 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ef62078ee7so9262075eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 09:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778690670; x=1779295470; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/yocMUcQeW0PxY80907g0p8nmDgbrIZycpfry1XcMUU=;
        b=MuVs60lYrg7z48IoDVtiOWGIaGbNHSqcm0bPOt4ycdrCWhv+CXkSPoSnU7gwZv9s46
         N8XIK/gf6lj6AoerZs7v+8YYragu81wMwC0+CYG4VTSNZ0Cnt1Wjib+eZJ0EC0jPugg4
         Krp958fsyAAWFzDz3efYeol+8q6UwRjSU9GCq8k5NpiyRy+9Dw94CKn/+nqV0xpn9M4W
         buOAKrXSoUZw23hp5zx08lJGw9ZSs2dmuamRd4Gpj/qbTvkMh/TM9+/e2UIGMto1kVLn
         J0RE3uOw8S1SsPDKQaj4p3yTzX9jFXjsri14niVi7ROO6wB4cLiN4B7rKBA/oQI4KaGi
         ewkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778690670; x=1779295470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/yocMUcQeW0PxY80907g0p8nmDgbrIZycpfry1XcMUU=;
        b=FvdQa9QyvDcTAkmNHLuCBF99ph4V09r+5jeh9B2q2KxTAYj3VoR8NwNbiH3mKFEN91
         PPMIDidqxdFDH4pcGwPIm8KN2xXfsDBmCefNaT9bk/VOeEIAlfUKd/lSkNNBXd3T3nFZ
         OA0/AU+l3V2g1Fegs1DapJyUU0YQSeIZyCxIw9Fj0PHiO9ssFwbxjhpATWbpcIHyP7rT
         E/m//sKQQPOQ2m4Nf+34C6f1giv8SdK6plkYp1nqLPi2aDr7EwG2xEkIZRmv1E2EjA3p
         SykavDuY7PbdOUKSR3K8UePlcMdsXzWRjAJcJ17e8eluJT+CkqhBmi/UcSM4dQG04zrX
         xqTA==
X-Forwarded-Encrypted: i=1; AFNElJ9nFz4KtJmI6JpM9I/DAIi3Y0NCpTzJc6kw74bkGb6eyON2xFIkdwX77RqQepeqtRJ2vys/yiYLlEGzWvCV4m8y@lists.infradead.org
X-Gm-Message-State: AOJu0YwcUqnf60Avj/Kg7C3Wdg8OcSOLdnmBjaSauO9vQh7h8lytNSXN
	kqrnjxrX1a74JEMFEyLcMefeVQkj5D3uN4/guEXo596+glKe0BF2lmAveOTNff+2Om6WGmjBC1l
	yv6nDvSUUUec57ymCs+BN27aMXscW3wgws89O9KIrfUWm/r8IvR1SmN5X+Af2/kCI568LM0mui4
	9BJg==
X-Gm-Gg: Acq92OFToizVJZfM/z7xV2t2KiR0+GUxfhfmStwoza7fB0serkPWJ2lh9haOGaKLPbU
	URoykkqg4bQUa2Bvomts99Y65EqN98uA21fEUphkwvm1cmmqFULuvDw5knGSgqmLpG8L1kXNq14
	AcGBRieduc0+PGA4cqGNLs8G5K2qucFRNjS9KdIqqaESE/Waxgbacny8FTXBK2ceSzh/txJb+Xu
	l0yWg6FLAZMDjUhLJ+H6lmiyxc02OdvBtP9il74FnnhLn3I55sRaWGXLoz4bnjzUXIv76dZxGPN
	vgxUcqrqxtpntYHhfUrHpQ7E5HaPtyDK3oNaF0phrCmOzPgoyZ90wS9cCFTzSUz9c378j3kp+7R
	JlRyz0IJZ3IKH+vlR/6LLPZ7GA7gYtNjdYTktaY8+uvEaSI/gvNIXwChKdwx1RoT3WOkFXD0=
X-Received: by 2002:a05:7301:608a:b0:2c7:3a7:c792 with SMTP id 5a478bee46e88-30119874a96mr2588006eec.20.1778690670402;
        Wed, 13 May 2026 09:44:30 -0700 (PDT)
X-Received: by 2002:a05:7301:608a:b0:2c7:3a7:c792 with SMTP id 5a478bee46e88-30119874a96mr2587973eec.20.1778690669842;
        Wed, 13 May 2026 09:44:29 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8864c37basm22570076eec.13.2026.05.13.09.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:44:29 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 13 May 2026 09:44:21 -0700
Subject: [PATCH 3/5] hwmon: scmi-hwmon: Log number of sensors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-scmi-client-probe-log-v1-3-00b47b1be009@oss.qualcomm.com>
References: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
In-Reply-To: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
To: Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hwmon@vger.kernel.org, Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778690666; l=818;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=vAmyCpUIu9IUlplJc4rGmydGdjUb6w4tYNaPIxlBDiw=;
 b=aHNXRLWpAchmivoKZfcxADgDkm5hnjgWYXKl8nVGRM6MkaZazLd056E8o8GAQELBgC4mw8qtn
 4cXbX3/bAUJB7GVGGgv4IJUzsVLQmNc0vvFg694a4U9/07cs9TUFFk2
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2OSBTYWx0ZWRfXwbvlqN7hzXwF
 I62G2I6ajfC9JdJ/zyAZQTBocyc10HNGn1p+xHATU/Rn3Fb6qU442XXxv9CDa5TgOtcMaindHow
 UBTCQYiPs3vxqSUnxHLLOvJ6Ndf1B1RQxRlO3tLyR7fyIYeNeXZHKzobeU4pNcU+WcPvcwo5f+s
 kiojs4UrjEMTRJv7lnLEms5+QoDnlzmGdrdeH+6nF6ChyHZHnQpMiS3yqHD+/OlwPEu1SxTIK0R
 Kihit0L9ZFWYdwr/btlCXekZN6qUZDDPc4r23mbjC8/fvkuaakrWLjz4v8dxuQ8G2iWof52S6zP
 H39knQ46VfDVzFoAzMZI4QIXp0eVLrGGm+GOYz6LLKxE5Lf5E7eETXk9l902fqO1/woP/lclCkP
 fp6UCtFpqlq/JhfcTksP/QUAmFmdkFqGx4vsAkDbKxsFDob9n6d+nlBojkif6V80+Cbqwtc7nuU
 a7aH2kBDFFb86m1cBUg==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a04aa6f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=U6dIrDiPZIM1rF_tHS4A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: zI3RsJ20OHc5KXGk7Ks6Ywiub94d_sd5
X-Proofpoint-GUID: zI3RsJ20OHc5KXGk7Ks6Ywiub94d_sd5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_174435_179607_42E18B3D 
X-CRM114-Status: GOOD (  13.50  )
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

The SCMI hwmon driver does not currently report how many sensors were
discovered from firmware during probe. This makes it harder to confirm
the firmware exposed sensor resources during debugging.

Log the sensor count after a successful probe, aligning the driver with
the existing SCMI client driver logging pattern.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/hwmon/scmi-hwmon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/scmi-hwmon.c b/drivers/hwmon/scmi-hwmon.c
index eec223d174c0..6f1b0559d5c2 100644
--- a/drivers/hwmon/scmi-hwmon.c
+++ b/drivers/hwmon/scmi-hwmon.c
@@ -362,6 +362,7 @@ static int scmi_hwmon_probe(struct scmi_device *sdev)
 		}
 	}
 
+	dev_info(dev, "Initialized %d sensors\n", nr_sensors);
 	return 0;
 }
 

-- 
2.43.0


