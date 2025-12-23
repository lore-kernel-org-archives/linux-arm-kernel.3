Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553EFE6F080
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1fxey1ooaRreFGPPHmgPQ8my1J77wljfZRigIZxPYAU=; b=EsKaaB+34k42/7mIZyJ3xQ1/fc
	/pbQYbyPZVHawll7PpC9IxpISIfKQgVERI1Zr7/tjDomkr0cSrhmxPBcIKJaNYAkyspMP2PmpysrT
	p4TgQzbEw+vwe+cu9rRy/3Wpyl39BomOmg7iwdytE+my76e3e3jzHw3xtPTkwF7xooYcR3p1VvTe4
	fR9ftXNuglO7IPWLzMZtDuR03cC+7fNUezHy+qj5HPxX5JAs2Rr1dTL/NO+KLtWI6IPi3FAQ87j4h
	f7Jmq6o3C4o8oS61ktlVgfiqb55g7wDSDRxk6rrN/nZ0ayY779RJGBZlSl4gj10lH1O7TTZU9UZno
	8kD6NItg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzGn-0000000EqIS-14gn;
	Tue, 23 Dec 2025 10:05:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzGW-0000000Eq5N-396s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:05:18 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN72n8r2115503
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1fxey1ooaRreFGPPHmgPQ8my1J77wljfZRigIZxPYAU=; b=iGIB3qS7dSECCUqt
	rRX1LfzE2d0la0bNk0rToXOs3e3Gv0qhPk29Rkc2QGMA6PAO6mWcVZhD8Bus6rSI
	PkPaqcHxi9jtgy30yPqRAq64jGIdcN2fYOQE1DAthEo06mB8tS2e9cdVZ96bhL54
	gRtViJeHKYVW7EWHwte9wwSf0MJQnl1ggBp22KA6FMNSi/I8NrFSURE5bkCmqs7J
	nFLKM3MGssGoxny7Bvh37xqc3XxXmxPvVhPlbbvbGc2bcLqTqWT5/f0ssQD0b+kd
	IwXk8iXSCm4zRCZKBvaeGBlq3RdvS4fQbJDa2p11rZZ8D+CsaYKP39CAQrGKWZRa
	jNso4A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cudj8av-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:05:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1d7ac8339so158477061cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484315; x=1767089115; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1fxey1ooaRreFGPPHmgPQ8my1J77wljfZRigIZxPYAU=;
        b=BmrdKKTRBpt89tYlsCV/Arp0SnqP1iCAU0g6itIfZL3AVdQEOuHjokpcHtD7tfXCCa
         nZuft72VK3C+gdNgKiWwiiXAcIXOtBRXz6Tiet+l+6xcGMx5qiv3rweW/Kl3Cq1cBBH9
         qmuqjng6IhHnbre2O0YLLN/26cSyEHI30ewltMsyIEUL1N3BswCzjmrbE+1RZyC7pgtn
         yRD12TfyrhvgOBK3+9uyAeL5Xeco0KwLHOwq6qW5vbXKi8gcTDa0RCbJHn7wjjL2IDXE
         3a4nw/c3KEkrG8svElmUexyx1KbvNgvRLbtAu8QeqNZJeROfoEXqO8anXNFSW9bb21jn
         JKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484315; x=1767089115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1fxey1ooaRreFGPPHmgPQ8my1J77wljfZRigIZxPYAU=;
        b=ls5Y9ZLEfkY87BzgIqjZ3epenLwyMJW3z2Kofu+CevNisbEhlLs0a+NtHGNW3m4JS5
         mXaf9YIvQ84V0QqPUx2x6OIWpV+Qe8F/DGwJGJsORtDSqKGg/rK/9E7qWsO5lLb69Zfy
         wY9dT6LFl2Ep0bOMqd07Aeq+kHCPhXwT3x71SYTVZCjoeHUTyQPpsrBeiUf9D2/46klE
         iq5ilDw/YtSQFP1j88kXbdjHP8k4XXsU3FS8R+TgfPrA1yInP89QSPyMjBRPmvHt+sYR
         Wr42DeDHzR/wyQNr2HlR0zMSi3yDf1km/D3JLRZDOfkEtYUWxukuPqoYg28S0XB6x1hm
         5mSw==
X-Forwarded-Encrypted: i=1; AJvYcCWMNkNI0Q9NcdzHQhpJzHc1TfhRjlP/zOH740l8oICk/Vj1OmN96SgWJKmzMGWdkc/2BOWcX4bpF/Je8dP0UmUO@lists.infradead.org
X-Gm-Message-State: AOJu0YyE+ypJxaRie+6o93ih/FMkpqxLZhBcgE5HIX9XSDWKZKQG/Xcr
	AwNsnKf/b4CQSZm9OudR/AdY3XjhQVi5xdQvm1euxYQDzkh9D4rWpqJ0woZVEsDEhKTggFMeYRm
	uhdS4CYaSf7ivG0nvcAiaQun+eNg31ATNop9ldeBKeJacfK3e/d6b0dZDY46lfR40TvoBsvvPCM
	EO5g==
X-Gm-Gg: AY/fxX4MGImMFNEvgefMDH+raP+Ul3jRmq6pXMkCEwQeikTUtEDQlw8b9RFRngM44tv
	APIrxl7qIIos9fk0F6DlSTI5N5Fu+LRoubBeQ8JR9SU6JHwckd+ISoLxqaQMoyAsSBWKDpa12Yd
	Z8NOCroAk4ih8UIX202pwFBCf85kGMdfDlEdTSz90gXCOekXBy/AVKPl6VETy+uhITNz827AaVK
	R5Pc0/gPWWwoxY/jQ2fCtNe9EOSBKd6IVa4HkJUYpwPw24i2LibsPikI5FlBf5gXAsSr3QfxXsC
	qW+rmQNbnZSY85/LJg6zKiOayzEq59qmNlNoTpaRA/NEW7VgjPLuvXrL0hkYPRdTW7pdJaXxtV6
	ePhBYEZylyptLqUxYqrzUhppUcNVxaSqbt9F3M6M=
X-Received: by 2002:a05:622a:189f:b0:4ee:1727:10bb with SMTP id d75a77b69052e-4f4abdabfecmr190558161cf.73.1766484315362;
        Tue, 23 Dec 2025 02:05:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8GFjIDyZbV8dD+DOpfR7IwmmqBYzqzpg5/tGrJ+xeBvGOlCT2lgXxHluQ0kpESiPf9OHVqg==
X-Received: by 2002:a05:622a:189f:b0:4ee:1727:10bb with SMTP id d75a77b69052e-4f4abdabfecmr190557921cf.73.1766484314941;
        Tue, 23 Dec 2025 02:05:14 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:14 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:47 +0100
Subject: [PATCH 09/12] i2c: highlander: set device parent and of_node
 through the adapter struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-9-4829b1cf0834@oss.qualcomm.com>
References: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
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
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=912;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Hn56O8bTHxBZpZANJMtUhif0GfjpIzDlLGeElyxRGYo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmlDcbNHO2WZVBDO1Am5CGHZOGZZ04kK7h44x
 fnmwHjn4CWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppQwAKCRAFnS7L/zaE
 w3QlEACj1xDOHhY3eNrCu3TniQ9GS0TsDrnZfFcJrr8u4bxRJpu6VcxD08eM8OBO4Ug+7i84qo9
 BvDqKBjwKXpBj8blAuHGXRmXAcqzmrCNxg/ii/1HIyigtO9N1Y7fM1Ou3a8zbT8tfsQcCsV6pnm
 JtUCun3fF95ul0gI4i2EJrtTaqLxB4sAuTuXwlPciqZlXGIRQiWLv8WY4HKYt/AUAFzEY56AAue
 wP8U8FRRWmOBuNvTcO/mSq20JuN5gHsti3JIEoLyu/Uo7Nk/wohdiFz38jjG0dyNUu7ifh2Cnch
 wajM2vL90AgjmkCV5fHff0FNWP3hoe2SjF4ut5hu1viWIuM5eJsfVKvMTawVWr+CCOTw7O3s03k
 Zp4YFrGo3Dp3jrRV3Yf0zKnaFZhvl39mLC+mCrfwL6rL8//wGxdaIphusT5BxLi4pNlYZ8/R0+1
 WDqd5qLanx6mnRfWY2jI5/uGYt9exaTUuHVB7HeQwy6180t2p5CRx4bcQ8vpHBfLB4YAMMpBMYI
 xR+ljQvylhCu+jITmxdWdtK7nsV1gEGJeVqqv7lqky7RKeH0e5fl5De6j41DpKxWybAsZhVhvz6
 y//a2jtc+o0fFk6CRWgPL5sDKYlu6kfSzozfHjLcnqPYuAlLeaI9MqAuKKd9wfwfL1fI1ZWrwme
 djbFc6cRrEAvhIw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ebkwvrEH c=1 sm=1 tr=0 ts=694a695c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hPzHJ5MbA3fyhucrTyIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: KsrpoPophGpIGUDL7XWpFw7bztal0ZYf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX+Mup2Ds0cyRW
 t3gvJa2nYZd0fvagVepZ1mQ9QUT2W2xT3zeu12yX6cxO9BB3hBrvuBpH8HkE96/KW8jq9T/JzG/
 pi4DE+gsV/FNUtwen7VQD//ccVICxT0eIxJeRU/H1dvGOJUbIp+5624I6/I5xkllH/3kTkIDSTZ
 aC7lgtbqlbGqjeFGd1LWPB5T/NeBg7vD/vptcJvljF7g4jgBg7yG+HD/XfBsl3T6Ibzw0PnPxg6
 B9PAsLBxzwg4csoatl9wP37537gBw3M0xeTospJ9+knmpDOEaZcZDP7jPQDWuWJrxzaluNzKp+5
 NnPLsploqnKOZsAIEtbRWPajYrlBs0IycPcw2iMqxBWIw5tlA3/26xd3m/GRGr04CxJM2T1La3l
 QQIO2zPbzo3rIe8D2ahkwKTxYR7FextQxoQCqgzITiFDyxfZUoK29cewubQXQPdFtrQsXe+qIZk
 XYkL8WegC/Qba90Vc8A==
X-Proofpoint-ORIG-GUID: KsrpoPophGpIGUDL7XWpFw7bztal0ZYf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_020516_819112_54B722D3 
X-CRM114-Status: GOOD (  16.56  )
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
index 78c5845e0877ae3e2ad1dcef052cdef021372e12..8aa2baf96c266edeb67d1da123e314e57831e0f8 100644
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


