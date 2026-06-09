Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A43CD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 10:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhkZeVLQqF+ONSXF+cRa8H02HY1dCnDBy0f3fSDbGfM=; b=zZ8jDut8qdU8nsRWzm/dTnd+xa
	uidA3vS5qETRKgwlcHGTeEoxS1HgEAKJf8MbS34Us0K6RsimW7YoEQU7aDMRWVY7G00DofuQhemm9
	uAgQ4cru0jOtOceKosM8Z8Qwd3NalYhGTPrPt+0t5ZuLdXp/hK2ljZFvh+uH78+wJ2bBUmSVmdbCu
	AxSFpeYZe0chC2NCjae9YhkPjtuID5vcLPeTOAlcGig7qAafJPZCv3jGL2ZgMNWh8m1BbhDnGUf4x
	oFEzgefJp/55T+HuJVGfkjRVhbdTMQ7BRFl7cT1bsyphYf3Nj46/sjR2fI+VizCcNvbYBwZFWaoUW
	RiKdUH8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtcE-00000005LWY-0gwR;
	Tue, 09 Jun 2026 10:23:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtc3-00000005LQJ-3pTX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 10:23:20 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599vK5r1869336
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Jun 2026 10:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dhkZeVLQqF+
	ONSXF+cRa8H02HY1dCnDBy0f3fSDbGfM=; b=OeRapUd9EzSWMLpzlpNY5I36rc4
	aZbI65x6bZGyAyQqODhG4McT2gUUUP5CnNbEY7ylj3Mrftm1kJ8eP8OP/7Dw8eCc
	Qx032MGBwDMFS+bueFpLaz6utnJtuwzaJ/ZvFeGiJaVt2fd29dxBZ5pMIBkdA98i
	fNVUWJQIUc3n/tgWOeb+CBkXkJbezUyy09O2tM2wFAMr2tLibjj94vIh5U4p9rto
	eUEXLn/cPbps1s10YY+/tjKfEtjoKzBoui/iI+nadZQGY26ssBQ5PuWirVwmRO5o
	+X3pDIm88yz/Ob5+mbs8vDHwHIoH4+HT39GkYhdf4adjhkoD/vh4QheKUnw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqggn1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 10:23:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c1e112dfso75208325ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 03:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000595; x=1781605395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhkZeVLQqF+ONSXF+cRa8H02HY1dCnDBy0f3fSDbGfM=;
        b=SEdLlO2d6adlE9xIqQX5xx46KyHMz6CKnrw3eJ+zr6qpZPt+HXPPK0mmzFV3o1M22P
         MaJDUw8Ffn4pPQNScH+Mxlzj3DNbWZjVvblLM1BOO6ULH5oc0X/OO1X+xdLaGvmi+Pp6
         OIGVAl+NEHsUG4Df6lmIPtnIZYJavHZI0jmCwpmu7GW5spJKMZnoCZS6UkmoiKko10mY
         h/TYndVsXEFEFEVfK/V2cQLPr4iTOZXR7X4Cad/xJ6nDlJXAazcTmRn5A10nj1s9Aaf8
         mr5FiRrDMCck1FzKMYkwZKq9/Aomjli+0OdBe3i8LGA+76/BKK+oUuZ9oh5KmWVyVG/T
         3CWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000595; x=1781605395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dhkZeVLQqF+ONSXF+cRa8H02HY1dCnDBy0f3fSDbGfM=;
        b=HQhuyvT2G2y/AxevKkq4yulUdViU5Kjgvd5+UgrsEghcLdywZUuCB7JEwT6QzD5jSp
         HLpi/YES90j3wDor2vkcH2g6cV6lMATwiAiRjFi05xg0BLL8joRAPdJnGyu6RZMPRB87
         0cb536A8rcCxuBxngI5eWaEHt+X3UTuqLrYlsH3LP+47q0A98+ONO/hxFJzMXzX5uOoB
         YMqaFpnRCiwlIBg4kGpP4HfD2IhyMdsnFXlqhxbFIXMzR5NvCRF+/SkIt8F98CvJN+LJ
         WZ3cvA0oHCYUlR5zzMaRyKrxAiw8BKYL03jN9PzbKbvtPXkMli3a4QlculFxOHuHOTIk
         AYcg==
X-Forwarded-Encrypted: i=1; AFNElJ86iKbkC1+BLW/hrt7nY+yiMzSSHLkXxcrL1GsJD4d8vSXycYbVVu5hyI0XHmphCYV7lVcPXfEEqSG8p6hI/wh0@lists.infradead.org
X-Gm-Message-State: AOJu0YyYAJAb87Np/EFFHln5CK8bJ13hjy/qHZrxsLqDYOWtYb8LVe4f
	fzGKYR28qQgseixKYaKTphj0pSSj5Cdt8QJoUGn51JetbzLcTvoVpLzkJcXE4Uh5hHBOK/MQf+V
	Zx/Ce/B7hVcW0T3dm3A+7DP7F1AKSGe2y3ATNYCxXdTAZqarmulHQ7ShD/BEDG9lYFWwpEm3dqX
	VwJA==
X-Gm-Gg: Acq92OGJdFsSwMKNlhpDEIUGwtGUN+lIEvV2Cc9hGQpMnA1Q9a5CEXr1+3t1YVWXRvV
	5dERJR61Y714gErGriHp8nVaeSUjoSG+KKkZkasBktALOrExOcDssif5Br7vfHNyJ+qKym+oDFG
	kurUzdlUozDATPi62HdTRtxKUVOoaufV4wJ24dT2J7jGmz4EGeeDFHSMrRrrlZN8nYOBfVN1MOa
	jLSkVh2JnOSeSmPJAXrYjlhRCMvTsbmZt47+KJFmrStIZrNjMh1RXcUXHxUTUTNhtaYOYYTW48O
	Z07HC1XTGvrscAoegZtfN1xJ5r5j10QMGj4O1OQS45aJIAHR8nRcxJTtyIvnvOFjOPcXwEl4vX8
	HxUQvDGFnDA82ctQwaNKrvrmGftIXt9Gk8DQAkOQiU30O2wC7N++xzSL9e+U=
X-Received: by 2002:a17:903:1a70:b0:2c2:245a:3366 with SMTP id d9443c01a7336-2c2245a35b5mr173911615ad.27.1781000594840;
        Tue, 09 Jun 2026 03:23:14 -0700 (PDT)
X-Received: by 2002:a17:903:1a70:b0:2c2:245a:3366 with SMTP id d9443c01a7336-2c2245a35b5mr173911375ad.27.1781000594271;
        Tue, 09 Jun 2026 03:23:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e86dsm213121685ad.8.2026.06.09.03.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:23:13 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 3/3] remoteproc: qcom_sysmon: abort stop on unacknowledged shutdown
Date: Tue,  9 Jun 2026 15:52:53 +0530
Message-ID: <20260609102254.2671238-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
References: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NyBTYWx0ZWRfX/ALysdk1ApCC
 5/A9X7hTtWs6K75DhFZNCdtLOLGaM/z9aQrWAlBcMVIUaf6r2BztVyZ7G7fW/AFs663sPXirQVR
 Cg9vy375YATl1zwQvce3+hvO2JA9b6rtaUSM4drxmiommbmcYtNiue2nsW0cJlu0QxO2HpeCo0t
 aIfCwjISSl4vsd5F2shiXe1CB4HOvER82iV/6dtT1tkd/918gxpJo5v2J9nEXARXKPNmP/72qxc
 nKSBho82uBKv82MbjBdDKEtoWkSTnMYZeLjwl1tt84A+lpJjpGBz7TjDjNy+yp6FFkYPX71OJgu
 1FYNiKljIBpBxrsd0fL3CzmxW5SEDZjwah3RJwVe5GdFh9vgxhEckG6pGLgkOfgTwoXH52AlSWc
 GQfKWcZFuDYLPY8KmmsPas/NpnB+g5alR8uuvFFGs9Fx9Tb8Es3Hs/hkoFKnMZepd9Rl+fsoJMX
 zbvkrpwTFungYliLqFA==
X-Proofpoint-ORIG-GUID: UjVP_afJ1EzPAPHfY3aRT_JQ6LPWcYYL
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a27e993 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=i5RmczF_S8wiUxY00XQA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: UjVP_afJ1EzPAPHfY3aRT_JQ6LPWcYYL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_032316_011135_1A27A366 
X-CRM114-Status: GOOD (  15.47  )
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

When a DSP hangs, if a graceful shutdown is attempted during sysmon stop,
it times out but sysmon_stop() still returns 0. The stop subdevice loop
then continues and tears down the glink and ssr subdevices, which
unregisters and unmaps the memory regions attached to rpmsg device. If the
remote still has DMA in flight against those regions, the result is an
SMMU fault.

Fix sysmon_stop() to return -ETIMEDOUT when a shutdown mechanism was
tried but the remote did not acknowledge it.  With the abort-on-first-
failure behaviour already in rproc_stop_subdevices(), this prevents
glink and ssr from running their stop callbacks against an unresponsive
remote.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_sysmon.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index 44b905a7e129..a29084cf7145 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -559,6 +559,11 @@ static int sysmon_stop(struct rproc_subdev *subdev, bool crashed)
 		sysmon->shutdown_acked = ssctl_request_shutdown(sysmon);
 	else if (sysmon->ept)
 		sysmon->shutdown_acked = sysmon_request_shutdown(sysmon);
+	else
+		return 0;
+
+	if (!sysmon->shutdown_acked)
+		return -ETIMEDOUT;
 
 	return 0;
 }
-- 
2.53.0


