Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488BACD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 17:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSNW5jdxcUIAPP3Bs33L7OprcOwqqAXBDPxUoI0e9M0=; b=KVlt6Qtb82UgV5Gqqqs+cC1Zyh
	4QBGUV6OzWsEzy1mpohbZbin6K2QjOjW94QmDsS0+xjHajyduEq13VXUK9BiwjfpwV/sZHuvlDZFi
	+2FpZr5gM3P2+xtV30iUZPtihQL4VoD8xMIp7snsP27HPUQ6LJS2dYUySivVizHiPSQCEXFXn7t5v
	Xn4EegXj2zToze3IVbwZO6cq2b1acDJ+x6iM1PFXw/ZG1reyKQ7BcNfPggEtzKImzuRgk+mdNPfOI
	qhYs4SglkyqdzCIWqtXpv+tTkdmshQtXQo+p9GSg1G4TBqAauKZ2OlOOA8UwgA0/xir9lLzf3piW3
	mZcruRhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDCq-00000003K45-3b6t;
	Wed, 13 May 2026 17:17:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDCl-00000003Jyz-3s6g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 17:17:09 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEvrkK3474707
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 17:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aSNW5jdxcUIAPP3Bs33L7OprcOwqqAXBDPxUoI0e9M0=; b=kryTxQA6RM485eQX
	dx42ibBOB75xs/MJw/7b3DKZEiDJoe6dqOpjyvUAVS/XrFHKfS7lTZhkbJMgzocU
	m8TngOGjPaWwym33crrprlVCa/LhJP7R2/qHPUFnxVCLowrI1BDsElkK7//ZEtWt
	1Oyuw+KaiRd3xVbzKPDHVxIxS9tJga80y+guWSPjrExWnzHAgkPbLmRbKKIODbjf
	harIdC9nNhxRhduZLHu2336MAwCDgWEQkn1tN7iFieVDpCdTzbDg61a91GhkyNjw
	pNQq9AZFNeEJEwZHfZN/qLVPM2HdlXKI711JqpJ6sWkMQki6Uq7Fw0ye6KznP0Ue
	OCw5LA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p41a0qg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 17:17:06 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdd327d970so3970549eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 10:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778692626; x=1779297426; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aSNW5jdxcUIAPP3Bs33L7OprcOwqqAXBDPxUoI0e9M0=;
        b=H4S1J9L6qlnVdp+utSVmLB9zn21IGvz8Uh0CfklsB2psd7DNTrPtlSu+Ofvhblagc1
         ki9+8JftNsaQaeq4yiuGummd3uwo1j1JxBcQVOAet4Jasi3ccvjYfSPvn/L9jF2y8D7e
         VbjICyTy+zzSH7R3GMSCnV/AZ27rlDFnxd6/hDA7dE0AqyEAUKwzciL/0gwsMw1wZWrH
         A0Xjj2P59NKrk97WJW98LC6Cc8Dy6L3IiYtrZPNyN4LqeDONqsRVDpF/3TpPVp11wcS3
         BwLP43eA9agehmFiukTwekge4C1qkZVI3OTVIUYwfRxdqiHClZvj0oezGyTyhdEfuiRn
         BeEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778692626; x=1779297426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aSNW5jdxcUIAPP3Bs33L7OprcOwqqAXBDPxUoI0e9M0=;
        b=dDI9UQN7HczHf37ipDiEikIfqoz6mpsAkKiZ7hhk6WMyati3bDo+s7WkJrkvnzq8Mo
         ddI7cS/E4kKzvdEWm6W4U8RaddkQRocPegYRCStmyZgPAaGuKsYCADAk9xpaMsQx31+e
         KUNFeloXJWLTro/zKGSYeIdKP89AzDF3Ou7vvrDJrNI7la3e/o0kdiAgJ7grTveiL8QN
         MkXdSdwae1KR3P6gxs7f6cRYBogAgOh8pAPU3eI7tvUQBKnwUb34IyraQZ8+r47/4ez8
         B8KcR8IR0isVf3ZaKbjzm5djiiS36MnbS+Rvst8CNMMlj81R7FNvjC9UtDQ1j3yWlYv0
         zeRA==
X-Forwarded-Encrypted: i=1; AFNElJ9gHRw4FUZDtBAPOGzm/5w79TkBFiy+yf6c0YcQWFear9qD/3gOLtHlMStSgYiCKV3r3nll9s9FrIkH0DGLXQQk@lists.infradead.org
X-Gm-Message-State: AOJu0YxwBJMoiVruYyxziWop80fKT22CQLdSPCGs1sFL4e+nz+M6FmCP
	7pb+yn8vVAs5eUn/aZUM0ykrDctfni3DQi6ZY6gEsK29yBvAnWWHZzG9rIRuBlcuRrHq7RZj7jA
	gQFL7jPCOU5TIe5bgpq0xN8v7YaOo/4DexE3c7YIdDFEZ5//WN8XiqocVg+UTBcCHyJBoaN3DQA
	aYWOZDJeedHQ==
X-Gm-Gg: Acq92OHrRdfAr3pjEegwT8eCEbCpvCx//Z35ikWpMA9GrdmBG/39ShQ5oy3ilW2milh
	vc9qcypL5l7rRC5PONDf1B/4xdQSe/5XJdEgYJjvNj1fs5vBV00X9tdQH4lWpTs/hd5bV7K002k
	UXTk2D/8Ez+Xic5DRQtbx6ge79NebypB+x44ii2JpnLeS9NJEcbRtMpztyqB2KysrMl5PyuqPxK
	QAkqMC60K5MMcemDjEeprtI3jCVGyCBEHWG2xcwH67GqV1XG+YdM9IbmOntxJPq3h4/x4WZdiY1
	PTi03VrVA3UKoitWhl71ERIb2TRcJTy+fxvzUh+/dbO7tOqHSqcOSlyltygW624fwwiL36/zJei
	Mipfb5EHGMzHQ0fsA5LuwcKqS6N8R0jraKRq02ltEWOUrLRcQ7u+6tQqtHW6/dqNqg0T0x4Y=
X-Received: by 2002:a05:7300:d505:b0:2f1:1fe8:cf5c with SMTP id 5a478bee46e88-3025fd4ce24mr270841eec.11.1778692625727;
        Wed, 13 May 2026 10:17:05 -0700 (PDT)
X-Received: by 2002:a05:7300:d505:b0:2f1:1fe8:cf5c with SMTP id 5a478bee46e88-3025fd4ce24mr270809eec.11.1778692625112;
        Wed, 13 May 2026 10:17:05 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888d3af4esm23075939eec.25.2026.05.13.10.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:17:04 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 13 May 2026 10:16:58 -0700
Subject: [PATCH v2 5/5] pinctrl: pinctrl-scmi: Log number of pins, groups,
 functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-scmi-client-probe-log-v2-5-36607e9dd540@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778692619; l=1456;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=Kj3iXhctlrnoi195JSqc+ZVTxrEJIVDVilbcH2wOlpY=;
 b=8IZtV5wzteupSXqIq+Bsxez1uHO07ft4wROITW/YKp+/ETuq3ZDtrIO4dorhEbPjGInJMDVlv
 mm2SVl1RvGNAtCxpfXCiux0cQSUOEKk7z9zzmj5dpwtHLyyAvkQN8yW
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a04b212 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HhDMDxCfm6Xc3nGqG0sA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3NCBTYWx0ZWRfX4XOLCByYdHYO
 Td7THEBFoRrrXg/DjuVdNd0I1NxjQsst3nnoVepK8e7egIy5PpyRq7YYxKWOyzkmOY1FPYNCokd
 gQjHzS+HZ/dOWtjgPWxAdwkqZQ/+7s0od+RjEBHMP3nsloolylxXZq8HoNLKybCaLdbtZHV0IB3
 CKtM36Fd+adBB+6HJ9Qrs58P7TUFnz1/3ue+njAe/awnTnvp5/ZBNRyR9u/VZJy1MrY+z4xaYTV
 fWGAPv09oGDlibVzXuJfek8enVy7qHcXNiyUoB9TO7ULszsZPh45Botlt5GOd+H6NgMfZE3mxkf
 PcIrDkWKqvJMqy7DiDVd52WLamPw62mdW6Ra1eMTPOHWWOk+Ds6wUWYhECYokG/3SFaWtU1wgj+
 u+fDu9Lvlf7NK07tCoE0PQxHPe5k2egRcOSfzXQZHviJ7Xxep7erwtpyULBg8GXLlUfInAeGmwJ
 Tfrn34ZzvLYTx2WsluQ==
X-Proofpoint-GUID: jjXmzIGVfyTOwTYXdnYSA-x8u3iwVvJ3
X-Proofpoint-ORIG-GUID: jjXmzIGVfyTOwTYXdnYSA-x8u3iwVvJ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_101708_105978_CD5FB86B 
X-CRM114-Status: GOOD (  16.34  )
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

The SCMI pinctrl driver does not currently log the number of pins,
groups, and functions discovered from firmware. This information is
useful for confirming the firmware exposed pinctrl resources during
debugging.

Log these counts after a successful probe to align with the existing
SCMI client driver logging pattern.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index f22be6b7b82a..999c2061ddc3 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -40,6 +40,7 @@ struct scmi_pinctrl {
 	struct pinctrl_desc pctl_desc;
 	struct pinfunction *functions;
 	unsigned int nr_functions;
+	unsigned int nr_groups;
 };
 
 static int pinctrl_scmi_get_groups_count(struct pinctrl_dev *pctldev)
@@ -578,7 +579,15 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
 	if (!pmx->functions)
 		return -ENOMEM;
 
-	return pinctrl_enable(pmx->pctldev);
+	pmx->nr_groups = pinctrl_scmi_get_groups_count(pmx->pctldev);
+
+	ret = pinctrl_enable(pmx->pctldev);
+	if (ret)
+		return ret;
+
+	dev_dbg(dev, "Initialized %d pins, %d groups, %d functions\n",
+		 pmx->pctl_desc.npins, pmx->nr_groups, pmx->nr_functions);
+	return 0;
 }
 
 static const struct scmi_device_id scmi_id_table[] = {

-- 
2.43.0


