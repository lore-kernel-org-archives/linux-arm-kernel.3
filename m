Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0B3C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 19:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNzC3IaAnkPqtcJDYyITkxHHLY0+YZOnhmPnAjsn054=; b=3dTuit/xadFVtFlPVXAofWcVnj
	uQBOJ7JoUgPA9yVPK1oV6b3YlsbpWdHjykBKkJdvk1vHU1I2I2hWMKN0aczwDyeO2TvtE1cPByUV0
	H8OG7P8XSKr0N+yqfLu7HqcfIexdnctJv92irpjjx6Vyb+bmnrXO3IyfaeXTeJkGLaNM5KKaNj+BL
	exNtK+eNHy4HaVadb1H1fXrIqSNo/6dFQvq8yfpZ2S7ob2oAgN5uchSWm6S7BwMgim4cdyh+nwSF+
	pxV86JsIosh6xokS4nxMIVDDKaLuevRpnLEkDQoLfkBuM5SmHndD9PsOY9wm2ncKIlaDzlJysfrE/
	XwVWkKnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrLHB-00000002jNe-3c9w;
	Tue, 04 Aug 2026 19:58:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrLH8-00000002jMh-2oPH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 19:58:12 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674JlNH5434231
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Aug 2026 19:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rNzC3IaAnkPqtcJDYyITkxHHLY0+YZOnhmPnAjsn054=; b=bDzRUF6AGiYwU31V
	sKUzppBV/TmVNZW4HBN0zogVQ/S+kQkMRGFn6d+DNoPUNpDQ1lALXnEDEZTK2Ktt
	RIR4HRcQWw0tUzjAbpzuS+PnsUKUnh4JAfENHT7wtVaxOkVc5/8YBCSvSV81OE1a
	xl1/qg9C30MJfMQDhAweUQwkAvddAU+/BOlwCgEkRfdd45eFHvTATC13DiMQ7Boo
	2e7uj7j0xSU3gjsIGe6C65Vpq2JVz9vPZSiH2iy0RBqAZrxe2z87vQBmqrMFPCx8
	slRNMuxOKvUlCznecZWZFzof8fSerwRVqJfnmqQSqbik25jTrTyA53pp/8E5BLc1
	6usgpg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum568ufq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 19:58:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cee1ec30f2so2695265ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 12:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785873489; x=1786478289; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNzC3IaAnkPqtcJDYyITkxHHLY0+YZOnhmPnAjsn054=;
        b=hfqjxhKq313T8n9J+QpnYlXIir5bLLfBaapIGDsPLVGVy2bKe0fMfH8y/ybsEmiEl7
         Wbk73JkWPrrdwWlVtydT/EhXoK0SDQw5zGPJs5TjZKwCzSFT2B5CvfywY3qAeX0v8YRO
         Ru9CnVJ6lNcbPIEKJCf3JYU34B2d++OAIEr7dTvbEVxi0TwSboQKLPZWFPzgVflUAYSv
         ozcS2m9pypY16oHkhScAuqrZXF1QZ+9L38K+Lkr+miDlEq7ZLmt8gidjXZjjUEvwzhQG
         Dpdv60kC94vZ/71mxWCBqvtY4JMIryXG55zlBZe7B8dH5vrT1AJtWyr9X+MQ/VAtDMmL
         M1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785873489; x=1786478289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNzC3IaAnkPqtcJDYyITkxHHLY0+YZOnhmPnAjsn054=;
        b=OMhhhjMm32XEeJs7NUZb6HpyBWkTqM/GUE0dJLitt3YhyGu0YkbWD+Tyt8tB2nKggu
         VXhfp4ytKzurT/9sX9flh81uEWJ0HT7E1dNC5g40YeJsAtMAG5GxNaPfY8MQhUklmLbN
         mmSKu0GmqIrOnEnOSIB4FLslMOyX77cTpz4KrGcCqwZ0Zu8M5iZmwojXB8jEHgNpu/vD
         C1/bpkTI+mJbxOcFSdkJz8iJvj1P1NMC33M4bKcORHwUfAVaxreK/tcH10OX9cy5H8yn
         MJ2Jklxq9b29xgHzdQd9lqT068xCFtPsazQ0fAFd4nL3R5C9PvqHKJ7TcpiNRhN/CNNR
         zc5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqfhk8ROW8fEq4bafKlLUVrA3G+nwvqUhR1g71qGTeSeAlb3F1E58E5V5bm0x21ov5ETMYwFVj91qO7b5Kso6XF@lists.infradead.org
X-Gm-Message-State: AOJu0YyPuPQNTjPOoQQd0df6i3skteyL0vihYC5u02/gHRhFd/SQr8cG
	8MneEpS0+DSLkAARp4hG6hRjej2B5MLOyPnmyq7r3CHf8aEh975VgH85VIZ/fofGfiYeB20e87w
	XQ5P43RPwS57gnSwEdxb9GmBqtN1ydecDGuU8234xijSLrG9wc+gY2uw9Lyabz/QYZplKPYjGaU
	LnXg==
X-Gm-Gg: AR+sD106Sp3yxSmTwmSEvPc0z52xkIEUpdqTQeMRJXvrSmSwltaJsglWLJ+lScE/Q+3
	C8FpuMwkercZQeN0QyF+eZuC6w2uHuSD9AQkUxopLVH8w4z25OeIE9fpIgMioHHlRwr/1HCeNht
	7bCc9q/AbmyPP44FTMGaGlQAtxwTrSd6MCbvd24UtiYqyEzupcnLuP9zK8R0+YPaRYhtnMfWbUA
	n0LY2dRE+jzqbR7oALN0P83KIX5yk8KYejne6pZJ+OO6WH/AoHeSYIITQu8IO+0JbPlz1okLA23
	er0kMdPfNT63/kVodbaaPTPzG6awsjZT6QStrfdnC05K1L/FfHCFWnq08zb0sgMtHeUrNAU38xd
	xNXcXDH2pJaUShqS/8YLH6UpVVYtOcUIBBw==
X-Received: by 2002:a17:903:1a6f:b0:2ce:d957:59c4 with SMTP id d9443c01a7336-2d0ca7afcb6mr11223935ad.6.1785873488797;
        Tue, 04 Aug 2026 12:58:08 -0700 (PDT)
X-Received: by 2002:a17:903:1a6f:b0:2ce:d957:59c4 with SMTP id d9443c01a7336-2d0ca7afcb6mr11223555ad.6.1785873488203;
        Tue, 04 Aug 2026 12:58:08 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867a68fdsm12316636eec.25.2026.08.04.12.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:58:07 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 01:27:39 +0530
Subject: [PATCH 1/7] pmdomain: arm: Fix -EINVAL from
 scmi_pd_set_perf_state() on state 0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-1-61171ab1cdce@oss.qualcomm.com>
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785873474; l=1262;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=QHusmMhaGbIFkLVmVmgpKIxh1LPrPBJEiHcg0koGGmY=;
 b=7NY2Qy1Uo7WrW93Aafa/QMqSQ+Cxokh+1WKAM1JvMN9b7jCvxdSzi5lT/yaqVn42n6Vozm6sR
 p4joM409JU5C8U5yINalro4nLUuP5VF3/aH1robdOvX6a4UlWUTsGBG
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE2MSBTYWx0ZWRfX3BjxCJQrcQQQ
 T1DRnJ7heY92kuZKrcVcl4MGJAHB7XhgKOofb19pJVv5Vk3il/p8vBKyc/8EYIEEXiuEZVYvp2t
 ha5Pf9O5KxYpFlegyGGSD2IPwIjoGmEHYVwngqyQ79u7jEyAsxrlE1S11SHVfmlb5G2LOA3F7hh
 oDuTlppkjWwdVICxYuRSk3IY81VO0iD8ZcR9TDuUzeSxZ2MDgTrO/sSFcX2K2x7vvEpcWoPXUES
 bnNT/Do9x7R6lhCIMiUf4plqIUmHyltdh3foXBU5VZK7Oods5CFS8e6sC8Gwj4sI3j8u4KEle9C
 LFs/vXP/HHr/54btpgbYieA0hS39Qd7k0yNeRaODYQyD03g9k634A2FFyjawaLHoYWXmgRi6O9r
 kLsjX/8V0Yn3gP0dgI2k4SBxfYn+Znj5URElWffXlvy9W2uKiCP0mMwsmf/lriGV+Aesevl3DKB
 c4oBJnF+6Cxr2worEYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE2MSBTYWx0ZWRfX2Vvbgsq3EcsH
 jcgKi4OYs8VSD3snfzU9wvMY6Hy7d8meVUF0jbiHmN5qEyi5j32eaWfH5XQTF9eRiZLFBixluLD
 JjvtoeilnjWB0iBuozciregCIIpRvFQ=
X-Proofpoint-GUID: OOK_iU8kd7EovoRnVAIVsheKKkJ2QAp8
X-Proofpoint-ORIG-GUID: OOK_iU8kd7EovoRnVAIVsheKKkJ2QAp8
X-Authority-Analysis: v=2.4 cv=GL441ONK c=1 sm=1 tr=0 ts=6a724451 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=sIx0R2CjXXeYvnaWutoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_125810_867754_5F8FD35F 
X-CRM114-Status: GOOD (  16.79  )
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

Currently, scmi_pd_set_perf_state() treats a performance state of 0 as
invalid and returns -EINVAL. As a result, devices attached to SCMI
performance domains can report failures when relinquishing their
performance vote.

The OPP framework use performance state 0 to indicate that no performance
vote is required. For example, dev_pm_opp_set_rate(dev, 0) is commonly
used (by firmware or linux)  when a device is runtime suspended.

A zero performance state does not require any SCMI performance request
to be sent. Treat it as a no-op and return success instead of reporting
an error.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/pmdomain/arm/scmi_perf_domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/arm/scmi_perf_domain.c b/drivers/pmdomain/arm/scmi_perf_domain.c
index 3693423459c9..e390f902a444 100644
--- a/drivers/pmdomain/arm/scmi_perf_domain.c
+++ b/drivers/pmdomain/arm/scmi_perf_domain.c
@@ -33,7 +33,7 @@ scmi_pd_set_perf_state(struct generic_pm_domain *genpd, unsigned int state)
 		return 0;
 
 	if (!state)
-		return -EINVAL;
+		return 0;
 
 	ret = pd->perf_ops->level_set(pd->ph, pd->domain_id, state, false);
 	if (ret)

-- 
2.34.1


