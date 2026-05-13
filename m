Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CACCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 17:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=190VP7a6BX04bhOypgQFXVE0wD1qu0burap4lRbcsRA=; b=xdgD4r5EzJcmL0ERwfwVDxRqoG
	Lu7leD6XS1jLnY4r4iGgmct9f9pOIdlPRVWcPKhqG2rCTts7E3a6PWtzlLV/fCbBwdo9Pcqx+vtdf
	zN240X9qZpYBEKWv6V/8Q2AtgZsvV1V8mVtAawjIJL3yjl0H+hboeCemTQBu3F5qM3P4Uf3IofWFk
	0gV1oXa2F/O4c6QJ+gaRb4ktAArQY0XyWKHIDmj5blx4P+JpB6MtMaz/liyTqj7xd1AxASCcfH7Lq
	tmVU/+zW/tPbGexpGwt3WfxbOArsuSndhxsT6zo1OTRQxXfY9/MN06X8wSa1DKwUNJCH+JvniWtlV
	7vkkAq1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDCl-00000003Jz4-1aSy;
	Wed, 13 May 2026 17:17:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDCh-00000003JwT-3jzz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 17:17:05 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DF492n2887975
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 17:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	190VP7a6BX04bhOypgQFXVE0wD1qu0burap4lRbcsRA=; b=VMOkt2T9AWzpX/2Y
	F/0z2gwP2iT2SjyvYZZnopLNFEkatb0HUTS0i2TJ3SS/XVVm8ylYwyikwvNWmdtR
	pBtKt1XUQX78PU8nqKLx2hlQRLjlGMqisFwMluN+w1PwEQ2J9VIajCTEuo8fGb8R
	6t688mBRG2gx5CEmb3Flxe/HpLxerOA7kXdFzaT2hSaq0CYPPkgKKBY5FZ8lT/Y/
	xN2BS22YiuFHSZxmRvTIzWiQHB6wgCizbMc2ERJWAYtg/tlMc/Dk4NqickDgHngF
	sWDoPAuEXN/ATNjDb0RC+6To/zH+0DhTSIyyCgEXTyEnOIT/e4wEgBMxjfh+0+2D
	ghaocA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4gj1ne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 17:17:03 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2f5943ca81aso11952780eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 10:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778692623; x=1779297423; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=190VP7a6BX04bhOypgQFXVE0wD1qu0burap4lRbcsRA=;
        b=ZC2NJ/xUlHySkzZN17XnDGRdPC6cMKsGqrzQRAKYptxYjmlEoJPXz0HmWskX3v2Kuz
         3qmO+UXVtFxE1JHEEyVTNQbOzXpKUg59uJbAQ7HIQy2Z46WgSnO46i6zxp5XGzP6AFd3
         uYKe2Mc7sZLAx7lJejJQBtX4AZOLnQygLhxzF1NXzTmXIxT28DGX44NclhEaDQFiep2n
         r1Bgsob/ZBO2wNkZPQV9YoKE0QxSPyKUI4OMiGNyqXlg8cKA2eYakp/2f4PNsUioEouN
         YXwoC2YTa8gCsSli2FEESrdXku3aTp5KIh5LzfjGg/bzSIP38r9C/dyPW12Q3fiJnzTQ
         cMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778692623; x=1779297423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=190VP7a6BX04bhOypgQFXVE0wD1qu0burap4lRbcsRA=;
        b=LoGhMVRmAGG7pPZwXlHiZuPLGGN1cnycNUvoa9PWzSBPUXdmZqip9MLwny/lwEp+pV
         fRL6OygD+BkVOe4hpl7RQbI3qCGWGNDeCH/BQeRjrD45mtSpn35SCgsJJHeTf2lH2W/0
         6iPx5IU2fnevcJ8tdeuDU9xb4tnNUfl2OKzlubydbkATAS2mhYhFlhSmNmgf8cT+SD2F
         8UDvdfxbSK98t908tRFt4jdrI+X8/HEbdBk7KXsmr86NrQSLjVRVuc6QOcL9XbEeGOWI
         PE2evA+ipSrMntPXrH/rL2UKNcr4wASrUar9P6+Rmn/5RnRzXD18QAO84CSUR7ookFtD
         +QNQ==
X-Forwarded-Encrypted: i=1; AFNElJ9qRK9TBqRK1Nz8fUI3VYy+VRYUZIrTqWNrXCukcwSavAXeOgZ38NfD8I7ckL2MCFsk+bY6dvfAiCNmouBbFPKb@lists.infradead.org
X-Gm-Message-State: AOJu0YxaL+0IbFC29j3Z+iuZCQxrRVI/yvQ17G2dZ8iFB8nUgen5Itxf
	owbyLd6TNR1+b7MWUx3/grjJAkDYw2CWPPmA8Yz6bG7JO2i+jZkxgaGmAG4otS1qcM7WcJDevJG
	37qnpEoZ53xdy0Wni2uPqShVPCObK2qFumX2AFpupzg272JzC2Gejw0KjcYzgY5adgfA+ShK5v8
	wanQ==
X-Gm-Gg: Acq92OERZ9hvRdf45V39PMqKVCQ+kGeL5GWj6sT1YuNQjXhTNuib2RAG40G/iUGX8rE
	F3sMMd5DOdhLggjc3bBC10Rnz+R+Mli1e7tcEQQi0dbiFRfWVH6NkNDIPDhqYNLFJWPXaDcb1m8
	pb9S61brC6FHlStMvkA1VXCeVYSVejc+3izAl0em4vOMvJREsBJ4XKS7Kcyc5HzwHoA8yMWnKtj
	7kQlU579bDF5+9lqch1OrTqJbKcDDJbSsJooUGz57RU8DTZIuswoIkyrExfxrpOdNZOks7Ef7jw
	2Rdz8azirnG9V9KVMERayiPB9T6OT+ta4LFkvapIZ/71Xnl4ChSr9fEMHORwLkS8YEnEpsP0Uk+
	7D839kdUvPWydN+QWaOCDhDF4cBh895utNkHNaghI2pFK2AssIscsx16rAWMk5R3zlzKpv64=
X-Received: by 2002:a05:7300:5412:b0:2e2:3381:2fba with SMTP id 5a478bee46e88-30117faa7d3mr2658726eec.3.1778692622839;
        Wed, 13 May 2026 10:17:02 -0700 (PDT)
X-Received: by 2002:a05:7300:5412:b0:2e2:3381:2fba with SMTP id 5a478bee46e88-30117faa7d3mr2658689eec.3.1778692622307;
        Wed, 13 May 2026 10:17:02 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888d3af4esm23075939eec.25.2026.05.13.10.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:17:01 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 13 May 2026 10:16:55 -0700
Subject: [PATCH v2 2/5] cpufreq: scmi-cpufreq: Log number of perf domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-scmi-client-probe-log-v2-2-36607e9dd540@oss.qualcomm.com>
References: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
In-Reply-To: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778692619; l=1077;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=0S9j7FnuPmvobUdGBBFR9mVHs/17xvy4ykl0MOW3i40=;
 b=6Vkg+4M4BEnG6+g6RMd6yk54y+a4e0RE4C47kciBZY24QjJKcU53CSueAMfPjK/6gchvjoe7K
 ef6MGhi5WiFCrvQ6v3lz3OSYvxZkL0evl1cDqxLdE15iihLXDW/VqpK
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-GUID: HODOezDO47QtMkXxjqv2W1mxfnho0pCc
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a04b20f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=xQYt0fwn8ryh7dGzGRYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: HODOezDO47QtMkXxjqv2W1mxfnho0pCc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3NCBTYWx0ZWRfXyQ01N0toLTEP
 GDqYfiTX0nDK1/VbATRWssEV8LPgQGEb673STKGn5kWDKefnBizasq/MuKqGXMtDsRc26n3LuB6
 lTMkgVHPzTFOjqp4l2y4FMNjWsLrYGmTvtTsdFpBObZNQyPo5PG3dSppGslzoSIPZCs2l8cHyfk
 wFPByNiljb1klhzsm/yBf2p4yeoV5k8VrI7HeqzGjYtD/RiU8o7il0tabFzY/HZhCvKLzSyHhj4
 Iv6oUU4t0DSNCGByGzkn2APY9/ck0dBtOAXsRtXQuP1yp9CuSQafb/qL5pVhoy+8+IW+5CUnkET
 vx3OUasegVGJyvQUUu80bX7O+UoPiJCpEShgknJHC/wvEYuNkHqtWAoQQg/YZa0Zd1z4apGynbM
 ahT/SMkEHjoL5/lSSa0P7pg+Yl4ox1cJnaH+JeAiAR8cot0yfnp+mc7+pRG51tNGqyQqobUrmWb
 EfzzIXmVC6OutOAO3Bw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_101703_944329_67EB9354 
X-CRM114-Status: GOOD (  15.33  )
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

The SCMI cpufreq driver does not currently log the number of performance
domains discovered from firmware. This information is useful for
confirming the firmware exposed performance domains during debugging.

Log the domain count after a successful probe to align with the existing
SCMI client driver logging pattern.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/cpufreq/scmi-cpufreq.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index 4edb4f7a8aa9..f4cf59d862c6 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -468,9 +468,12 @@ static int scmi_cpufreq_probe(struct scmi_device *sdev)
 	if (ret) {
 		dev_err(dev, "%s: registering cpufreq failed, err: %d\n",
 			__func__, ret);
+		return ret;
 	}
 
-	return ret;
+	dev_dbg(dev, "Initialized %d performance domains\n",
+		 perf_ops->num_domains_get(ph));
+	return 0;
 }
 
 static void scmi_cpufreq_remove(struct scmi_device *sdev)

-- 
2.43.0


