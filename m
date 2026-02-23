Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58824E98E08
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d746oHHLRYVQIeqZlUVXE0SwM2/yPUbSyBrXtuCBM8A=; b=n0rUqwBQBLVcEU
	IKYlOF1GKHYQeADSvKEjlG1BcYVjCcCUfCfOT7Sp4Eh0UvmNYhD9AQLY6OIYOVMwq8uxcrMz40kIk
	BaeIScW35whnk+httdnI8aHOLwoZ+2yyA5rakwvn/9d0Dd0rV+7K+5AVeLp3IS8I5hKW4BvfEGw+W
	x+/3/oUheghLLo6inkK9NS6+NBSMa0vSb/o81Y09NamuqvTg6XzLbUJfFGr12iTtqHIFdZhz+65lo
	KrcCz4NvyGxmqxcAA6hhTScwwi2RpnTNbgCZ/PBRIDh2V+Y8i28VzbaH/awK6rZ7y2ComWoBlpLV0
	1BPsSPOC1KYXBMt4VKFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRtK-0000000HU21-1nai;
	Mon, 23 Feb 2026 09:06:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRtH-0000000HU0I-287p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:06:09 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMUCWd1687472
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:06:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=d746oHHLRYVQIeqZlUVXE0
	SwM2/yPUbSyBrXtuCBM8A=; b=Hkdj2Sw3YW5wYjJXb0Yo5KSdJDYZ6mNkjKglmt
	HmIpjNRzyZcyIv30iqmZrVIu7F/Tx2xmWjo4hMquxsTBDozOXCx5yj9flUsE0lCf
	W1j/CZkwXF0jRQFWdXD9rYTvOPYSjslacPJZK4HS0//hMA+uu4EjDrg+a/KArh/2
	tONKtnjZs1D3baLsoo0wvSB38Xe/pXezA//8unJlDsTMUyDidspV0hDibBJhpEpP
	rGQe1G1YtSaVMjupePw3YFoYy0jMPCwS4lFQBunN2odLW+NGvhr4WPquzMR7bgkH
	1W+GKe9cisPIXIjZk1HysFVOD7JM/Q+yFi+wdAomaF3tDBBg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u9v3bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:06:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70e610242so4132220785a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 01:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837565; x=1772442365; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d746oHHLRYVQIeqZlUVXE0SwM2/yPUbSyBrXtuCBM8A=;
        b=dzUIpB6bMPn3l/j9Wuicq6yfuV9b01zUvxuD+gvRNaBH9UTnOjqhE8liylKIlKU5jO
         fFOpJJeNlNFSWmsR2a7gMoFlTyD0uGka8iBHQNaDnse1GVWRceO0C0YsHKNJXhX2l1Zn
         syzgabAMs04YExJ7fCLQ0vzROUKhfa7g3zae/MOj+H+w+g+lANN0BiNjX35gjtdhETYW
         ZY/sxsPP9g+h6KMPUC773F3ManRR+7MQVl9+kNw1PM1WKOy1ql5aKmtlPYmEfE38BXAh
         //vVDCj5e0A0Lu+bHBqKmHgVtwxXhourtLnbXSXMet+WkSiVe8TmMKc44VOitNq6EVrQ
         GPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837565; x=1772442365;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d746oHHLRYVQIeqZlUVXE0SwM2/yPUbSyBrXtuCBM8A=;
        b=wxmxXA817nTtMBk1/2elETRAtIE8eT9i75lK8n87tvnHp68/LNJYk2x0qprme3Ik48
         UsqwNvOk7qinTsB6Bg3SnShXcqp723dLCrVkxedDHerS0AxE0na31NAZxdcSm2f54ZZl
         PLqQErQKJb3OXyYbD9yFDUBxvCzekvDW1y/xjWzHQJodDTavfIceSbZw5qQ4e/zgMq9h
         eaG6tizyDA5foX0aOftgNOCrFJBrVBuSpoK2zLvq4Srpglow9ctG5w8t9NvXSApK105j
         ShFnelPj0+Ie0LqHIlWifl1XG890kHCk33a9oC7KJFs/pAMwXRTDesD6KhroMxniq1Tg
         nASw==
X-Forwarded-Encrypted: i=1; AJvYcCVCAOOf7x16IPNwg2cqzYTlgv4P0JrVu+8UdVg+D1xo2mQWVD2CVAOOv8cILUnZpDqwrmhCpyopLhywSbMt27Yr@lists.infradead.org
X-Gm-Message-State: AOJu0YxvM0eL4GEZk9p/c/8u2fKhBpEYTdz5M2oE0XO8RIvaEBk6pZcF
	FUcT7g/6oQ4OvVwU0nHQ0cRnAiKjOd/wTlWljrNNQ6WgUM5ZvKznOzwtbF/o7Z+8XueR8TrxFkB
	CRAeLKlMI/8dnTbIamfo0sqdOFejJlFfqVYKMpK7vM25BvrjCne1TtYri+cAnofuqsHzfAPULFI
	lzew==
X-Gm-Gg: AZuq6aKLQa8v9a0gKn5G+YkKVKzVNAfIk14nM/17xgVvFKOyOtkoAFI/K3A0ZyWg1Cq
	33R01DpR6X/ACL3J4yUXE7YwmBHRZk9B0qIHmMlso37umKwDb/uPh6Qk9zS61bdBQrZ8+fmsr9O
	Aun64pnyDJZDnvhEIH+6piYaI7Um6guvBcBNCGKwAocNMY2UqQGcDxfvfHeQxFccmNGXAZxXxX8
	l8eGH0zdLxtWtmHTg+a+s4E7AakUn7aVWf/BgWNcnPi4Jm5xTcSBkTf2PmMhuSxl++DR8eXUI/n
	CoPRCIEPJRVKV2MNO9uQTO6etVWQ5yAPPPoDglWSUUlNujRbgeLDYknYXyt+2FmVnYCRuhfOZaq
	YvuhdYxBLeJdu4TPUtsitC8FDpfSYzkMQkpAmSNIuGVzO9zou2TdS
X-Received: by 2002:a05:620a:440a:b0:8a2:ee8:e7cc with SMTP id af79cd13be357-8cb8c9cbf76mr933267385a.5.1771837565483;
        Mon, 23 Feb 2026 01:06:05 -0800 (PST)
X-Received: by 2002:a05:620a:440a:b0:8a2:ee8:e7cc with SMTP id af79cd13be357-8cb8c9cbf76mr933265285a.5.1771837565026;
        Mon, 23 Feb 2026 01:06:05 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:04 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 00/12] i2c: configure parent device and OF node through
 the adapter struct
Date: Mon, 23 Feb 2026 10:05:46 +0100
Message-Id: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGsYnGkC/32NQQ6CMBBFr0Jm7ZB2KBFceQ/DopQWJhGKrTYaw
 t2tHMDNT95P/vsbRBvYRrgUGwSbOLJfMtCpADPpZbTIQ2YgQbUkqpDJoB70ioNNaPzieMRWiUr
 3jZTntoa8XIN1/D6sty7zxPHpw+c4SfLX/vcliQJVQ20vjRNNpa4+xvLx0nfj57nMAd2+719Xe
 PRnvQAAAA==
X-Change-ID: 20251223-i2c-adap-dev-config-9403ab811795
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3636;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JpXrrkvz1SqkKT+f47q/u1Jea7thg425ucswYTBTXns=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBhvxfpNuGH+Q1zSVb894hMaRDnJVHASheoKh
 tGcI0PnAP+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYbwAKCRAFnS7L/zaE
 w2YkD/42gmVI2glVDEDj52itfZw7ufLt0c/DcLJ+FZ7kHYFIsxyL1dHKGe4ip0B7AgIg3kjvham
 4i3sHarrlQxHhiXD6lHA7AnTlJUIwbMYiR16u0EENBjpiwcPFOtcEFsQ9SCYk1dWNQt3z2vO/Wm
 RFF+dLTjTwIEiU5NJqAXHpTYFoXSdbIC/LKveT4OMA1CE+6F9Rooja6KT1Viqx5w9KYiqERenUs
 KKEakJIRPwEdXmYJTw2amUBwkeQpse9u7vd9Vl3RzRobgSLiVNBMVK5qVwSSNrxpkR3W/LcISns
 J6eQWlwN5lNv6ZNnvQ2/iMz/nG/VUHizCcwYan5P6cqRAaCdgLC0vnEvpU+BUUs+BlAD9aNcloG
 YQzNfV2pb30/guwSgRWzyLvYk4NXFUGPMIZb/qNxSx8humADFCW2flXVUruER7lFEg9WN0d3TWT
 qR2Im/+JgfarMzxldfnFXoDo6VLvHdDTkohcolEMMiWL5FelxokYgAi4ZTyecVtCK/BRXKyk6dB
 ZKOBjFyRLll8ol5KO+xRrbOkNdJUCaOZzAf40SQRdALQyfA6qRh61awI926JLvDSJsbM+ZQImI3
 fdEhPxSb1oKvTqdML31ygKLLfaLfNiiHdaQ2DrH2Zzvx3sbfEZUT6GzxcuQ7EdMo7Eo30MXyz4y
 xexRaCGsVEHWxXA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfXyYufW9BcZCBb
 JUZgVkpFfItt+K6ZARtZCtDOBon0WBhZd/vmVSjXYe3bcAAgOxKuqelPxDbjwv/nM8Ues6XCLEh
 RqL+JpqK25CnRTyDqNzuuDQqFRvxJ2tcRv8ng9V9zjuxdlDNLZDeL14gQHHc+RsAAHJMxJVPscm
 +T5Mnr801Q2KjRKku+1ce/wFh6ChKwUvQwGNR9bv0vEkO05zDW8ApjqCW939QtX1iFi4LnhCcg4
 AGaduoJ6SqbVTvFNwLuZ/ZsaDFPnYM5yOwP3vU0Evhm4Qs1V7DKHIR+woqr4pWbDehUKxVfGyYm
 Fm7sPwADv/xp3QhOwvm6lR098cE9Wu2pAZO+yEq2k5SOlMdbHyYX7oTyO8liqNvttR4dONwtz0K
 PfQu0NSuABm+dN7Ba2hcAap2ax20x68gHnywbm3PG1UimZ035p0IBdmjvogA7nZpPtbW8CD+Fx1
 ouWaThn6h/TAxlu3YbQ==
X-Proofpoint-GUID: QJMpq4MGH3AL5EYhxGVElZ3PF3UNyvwa
X-Proofpoint-ORIG-GUID: QJMpq4MGH3AL5EYhxGVElZ3PF3UNyvwa
X-Authority-Analysis: v=2.4 cv=RpDI7SmK c=1 sm=1 tr=0 ts=699c187e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_sFN2lLQU9JdPEgOWvQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_010607_859532_E9C412F6 
X-CRM114-Status: GOOD (  21.42  )
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

It's been another year of discussing the object life-time problems at
conferences. I2C is one of the offenders and its problems are more
complex than those of some other subsystems. It seems the revocable[1]
API may make its way into the kernel this year but even with it in
place, I2C won't be able to use it as there's currently nothing to
*revoke*. The struct device is embedded within the i2c_adapter struct
whose lifetime is tied to the provider device being bound to its driver.

Fixing this won't be fast and easy but nothing's going to happen if we
don't start chipping away at it. The ultimate goal in order to be able
to use an SRCU-based solution (revocable or otherwise) is to convert the
embedded struct device in struct i2c_adapter into an __rcu pointer that
can be *revoked*. To that end we need to hide all dereferences of
adap->dev in drivers.

This series addresses the usage of adap->dev in probe() callbacks where
drivers assign the parent device address and the associated OF-node
directly to the struct device embedded in i2c_adapter. We extend the
latter struct to accept the parent struct device and of_node directly
and make it assign it to its internal struct device inside
i2c_register_adapter(). For now just 12 patches but I'll keep on doing it
if these get accepted. Once these get upstream for v6.20/7.0, we'll be
able to also start converting i2c drivers outside of drivers/i2c/.

Link: https://lore.kernel.org/all/20251106152330.11733-1-tzungbi@kernel.org/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- fix a NULL-pointer dereference in gpio-rcar (Geert)
- rebase on top of v7.0-rc1
- collect tags
- Link to v1: https://lore.kernel.org/r/20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com

---
Bartosz Golaszewski (12):
      i2c: allow setting the parent device and OF node through the adapter struct
      i2c: qcom-geni: set device parent and of_node through the adapter struct
      i2c: bcm-kona: set device parent and of_node through the adapter struct
      i2c: keba: set device parent and of_node through the adapter struct
      i2c: omap: set device parent and of_node through the adapter struct
      i2c: rcar: set device parent and of_node through the adapter struct
      i2c: st: set device parent and of_node through the adapter struct
      i2c: mxs: set device parent and of_node through the adapter struct
      i2c: highlander: set device parent and of_node through the adapter struct
      i2c: gpio: set device parent and of_node through the adapter struct
      i2c: nomadik: set device parent and of_node through the adapter struct
      i2c: bcm2835: set device parent and of_node through the adapter struct

 drivers/i2c/busses/i2c-bcm-kona.c   | 4 ++--
 drivers/i2c/busses/i2c-bcm2835.c    | 4 ++--
 drivers/i2c/busses/i2c-gpio.c       | 2 +-
 drivers/i2c/busses/i2c-highlander.c | 2 +-
 drivers/i2c/busses/i2c-keba.c       | 2 +-
 drivers/i2c/busses/i2c-mxs.c        | 4 ++--
 drivers/i2c/busses/i2c-nomadik.c    | 4 ++--
 drivers/i2c/busses/i2c-omap.c       | 4 ++--
 drivers/i2c/busses/i2c-qcom-geni.c  | 4 ++--
 drivers/i2c/busses/i2c-rcar.c       | 6 +++---
 drivers/i2c/busses/i2c-st.c         | 4 ++--
 drivers/i2c/i2c-core-base.c         | 5 +++++
 include/linux/i2c.h                 | 4 ++++
 13 files changed, 29 insertions(+), 20 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20251223-i2c-adap-dev-config-9403ab811795

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


