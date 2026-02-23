Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E39AE98E08
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sxTiq2AYe64lLLAUHZl3DZa+lCaa8taLWHMJck+srMo=; b=SND8B+UX/2cT5eVGD4bcWXg9N9
	SkYs8X7QgLN/wHSw21Ky1OnDENq41MtifxaBpxGmF++3WKLo2Wc0cZkSNphSc296iBoC4o8rPltVZ
	4t6ERAUivh0xzZrHowTNazpzBpDw9boYQrlGBdUd1bpWnWnXv8iXyFjI1+64xaReZTRj7847jBA80
	vsbBNrl29NeqQuf3vrNYzYp2sFzVkpOEqdcnL2LmCFV7xlGfxI2kCbep1XngzHK5KuBZW51SEwKCF
	aM1l69iOqX6S7Fcyv3MyH4J7K/1tcbnTbrBV5HXvQyVXP0Z99/B9aPrWqEgrhjC2/a7tfPMc7eYQd
	T5KNkDdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRtt-0000000HUYe-3W4R;
	Mon, 23 Feb 2026 09:06:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRtf-0000000HUH6-0rzN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:06:32 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MLrBvJ2121108
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sxTiq2AYe64lLLAUHZl3DZa+lCaa8taLWHMJck+srMo=; b=E+hQ3JvFEHwHYKbc
	pv5mrS5M6p9RS7DuB8+Ae3lhQBzAQA2xl8sj+Jg3Z8qaprzl5tXAAxm4piJP/4vN
	WGTJU1PJcxEvqetqd6bAnr0VbEcxLVYgSK4mpXEe9xfzOe909+YGm813DObXoHFR
	4A8b7MAzT6NtW/cfU/2vNGkw4S8HExav65vsSs8BVRgQOUd5PY383UBEqB8KWIjM
	K/3jv9c1NCCk0H2NFXA1DTZv9yZ19b6eecTXghp+zACUfp8zmSLAzgF/zNJA1C6W
	+9TnGj7FdUY9foDDk6ZdWebb/xrnuwop89pVpxNx2VPyHcQ8s9/9oj/GKrjZqn2o
	mFYEWw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vum0hw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:06:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8ca3ef536ddso5088300785a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 01:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837589; x=1772442389; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxTiq2AYe64lLLAUHZl3DZa+lCaa8taLWHMJck+srMo=;
        b=AxOSYsMkdUsWT1yVrRbKA1MudX4E8OfGNflX65MZZUh6D1lmAX9TuJmA2EjfSm8KgT
         RTNihi880rLLsBLB/ZLMqNx6e7n8zSvic9hkF0T0E6yHFPgOY6V7RpuUUfdtgh4ptr1a
         7rpCZf8kPUd2ySyiOmqydPZPkEdtXtE3Xfc2M0qHI6Ccu8GHh+9mvQZJKPpxD/Lfo2Wi
         T/iO+Z7mscDGEbjU2bID4boTg9BwkwGf1WcrXwK3GQcMh08F6hYo2PfNb+JwS8AAug10
         GUgxGx7aGYFVDvnBZIDWwjjpp9QZ8dPAtVuWf3B7+2MQWLbh4ClAjYoZdoLASkAyJIWE
         HDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837589; x=1772442389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sxTiq2AYe64lLLAUHZl3DZa+lCaa8taLWHMJck+srMo=;
        b=o52iYCoTB+WxxRJsM4VO6gZc5xTRjJ/tHbx54Y+h+DMLZAmOmNChRJvf4A3w0LcH4h
         +KfjZgZw0zrPAXATI3OswRBkNLlq73kjF6+nlbXwDnSUJVeT92SKxOBdrlwJLxkiEXpe
         ldw4mYi7g2yrtA5sWwz2ZJ8oCii00NrO5ODiXDpJ8n1DVaZGRWGHydzdQ1KXDVdVlRS3
         Esgk2LxLtV2uI9ojnjZSlwBev5zAAswHfTKD0385Z4XwNVdeAuTFMyhNPHBt+0C1L7rk
         Hh8SEyhve0xpJ8NUkteZr+qP7taDr7OYNecYjuq4L8g6X4KQ8Ttn3EEgiuCwKFodzShd
         C+ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlRqKGffjWb5UgvFD+tlYrtlw3kKhvB2QTfCBllhJQKICwrWfEFY/rvJIobgZnUv11p5CJodhOg8/7X3PvgzvN@lists.infradead.org
X-Gm-Message-State: AOJu0YwKRN2VTsk/HO8KZRrU8XAmcLVCZrjVQIcd+0Yk95QqeB99i1xQ
	Q9Eud7n4fkCBdIRFn6FYzvZ9OhL8ooxir1Cy11JOoRm6QNvhrwnwnOah/SKMBAQB009wtf7CQlb
	+K4MhiyJZB2NvxPKvg2BxittRe3sr0F7Kduy22okfeumwcCoa3AAUqZ98hMJgqBcWpRuugZV77b
	6cfA==
X-Gm-Gg: AZuq6aJmQuVz0gLO+tzkwZqovIVU29mu+DSL9oRVgr/pSL0nGXhZg+yBBdpwjntbKxO
	2J8WMrj9QOi9ho0SjRVkePO6Q+OP94jNoH/UV4oniGHYAbhaHuEegYsR9j8/lhmyQKQwV0+dWfK
	ADeuV7vyy+2oYEGMO8ZzggGvyCWJZX0yknGG4QWGBlghC/v2vuy16oiO44qnKen7bRjxSpdvL4D
	WIqqZgaEtnGy6qG8959IqshntUMbRpjFgDrMljVNFXnhSCkUrfEBJeUCG2mGDFuQs5L5y9LFupe
	4TwfoAQcTmsS3xTfvcG4Ddekn6iCgJtUxjCu9TzaIr9+CWi1Eh12kZ7FDaRrP6mPzpKMg8AjEpv
	HBUoGjv3Wm8ScA4hZtIq+tM27q/vwZqKE8llhe6ZAr16sVcNlWcmt
X-Received: by 2002:a05:620a:4482:b0:8ca:2ba8:b988 with SMTP id af79cd13be357-8cb8ca65b4dmr912585285a.41.1771837589433;
        Mon, 23 Feb 2026 01:06:29 -0800 (PST)
X-Received: by 2002:a05:620a:4482:b0:8ca:2ba8:b988 with SMTP id af79cd13be357-8cb8ca65b4dmr912581385a.41.1771837588893;
        Mon, 23 Feb 2026 01:06:28 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:28 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:55 +0100
Subject: [PATCH v2 09/12] i2c: highlander: set device parent and of_node
 through the adapter struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-9-d78db0a6fcf7@oss.qualcomm.com>
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
        Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=912;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hWDFhQnaic3O9OJ+7xBky9bkVsKM8N71b8pq8QsprJ8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBh48z3BkboibmH1Wm5hR9cELzIQeY9gBcPhA
 XDQCpZC/W+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYeAAKCRAFnS7L/zaE
 w5AqEACIw7psY67E89Lspf3feMBKtg+xFiREP0W0czKsXM3vtcIITAdfDI0jRpTu+aSyUewPp8e
 KJjez4TUVKV4nNiXmDwJi6M0UCUA2V0QahL6WJcw8/BPQ4QAtZ5ir3HMD+4CJcjluUY4097hDSW
 9Fjpdee8Oicueou0j8qlVeYbmqHNCb+/aku3i5mGfJFeSHX3Sh60fbMYmi5uaAcbhn0OEMjtCGK
 iYfm5S3PwpM7an8haNt8+gCbEPClUjHACQI0RK7bNA0opZKywpaqgqa5OvgQrItTa3Gd85FeVOC
 U+O7MFzkqK6DkA15t2vFJe0hZTFHqa74NaCp0MPtS/URE21WVkveFwKET2v7dqSBnqEqIEpTW0v
 WgpJAKSmWavJKBTxjzWJ2hXl6I2IgRFPIMMlmRdaMeE9Cp0KbCRiRyu1UEG9kVDAw5OcXXT1s2U
 DL3/nMpneTmDfrA2HNG2/oHfwCJF7ENgimO7iaKhQswzkOhHIbTn76bOAAdIFqzi7XbUH5Ktbaf
 tB4cMeyLTOEejdtwROxxpdHvybDHpn8kh2/7AWTTmE7AclO1UdFmJEyUuNbfXNkOLhiYZaorNLq
 9mCbs7DTVeOoyTV5D1ciWuVlGFqIb/K3gk9dpvSy/IJQeq2uiO+zUBj5PvrTfNYk6LU0agk5YME
 Pcp5SAOWlKAS3FQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=AL4GpdX7 c=1 sm=1 tr=0 ts=699c1896 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=hPzHJ5MbA3fyhucrTyIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 4I1I-P9lT_HyRHw-RvnMYGCWmO5iTNcp
X-Proofpoint-ORIG-GUID: 4I1I-P9lT_HyRHw-RvnMYGCWmO5iTNcp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX0BrfkPRXgfT7
 ycq9WeW+xKquqdp0vM2Z+zCyIjehgtpefYdTqW2tMmzCzW9DDSS2uRnw8gGgacbJC/oNLzQYAkd
 gDHdfU2T+Bm31mfsMo+lub25cpX5Y9dTSY7jz4DCssB977lnbj5/hCgLlQoIQotdK1mkKoyCOR2
 hHbIRer4R0DKWnuCq29+dLBzwEJP3RDEK16atCgwnbBAlMfkOTGiFuCK7SS950mV2mhmmMJ6ty7
 QctwDAMA95MvrSy5mfc38EPSkx0AtLH1yjF8X4fvXs+t3Tmr2N6DUW8Y4IpUE4gEpENui3FWQ2G
 8/0qgoQchFSp5fcFoeYAdihVOWKH+4C56XEpC2Gwc1DmkdnQ5i5H0M6sAsjIKQFXibHmyFAsPAf
 9uScFKEDG5qx3Lq4VTtXxOiQ0oFFLVnwQXayU/aHXSIaA25VAGSsHrWXkxMrL9TEBxlnTpNX6l0
 9LFstUNU4zHQ9VaFWdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_010631_406570_8888F7FD 
X-CRM114-Status: GOOD (  16.54  )
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

Configure the parent device using the dedicated field in struct
i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-highlander.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-highlander.c b/drivers/i2c/busses/i2c-highlander.c
index a53b4bb7c3c0487ea028453cca6d09f6e4a993a3..ff30286efaf8df2895cd772fc554aabb85c5a998 100644
--- a/drivers/i2c/busses/i2c-highlander.c
+++ b/drivers/i2c/busses/i2c-highlander.c
@@ -404,7 +404,7 @@ static int highlander_i2c_probe(struct platform_device *pdev)
 	adap->class = I2C_CLASS_HWMON;
 	strscpy(adap->name, "HL FPGA I2C adapter", sizeof(adap->name));
 	adap->algo = &highlander_i2c_algo;
-	adap->dev.parent = &pdev->dev;
+	adap->parent = &pdev->dev;
 	adap->nr = pdev->id;
 
 	/*

-- 
2.47.3


