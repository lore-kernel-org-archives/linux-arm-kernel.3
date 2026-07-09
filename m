Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344AAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 06:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1YqnzWWYNh3cmaUOCZIRd7TUov9rA8o7dhqsYSUv9m0=; b=ahJnlG+uPC6hV3
	A1EDWdH9RSLJ/oUU1bjd5u+QIlSO4mMvGCPTm5jgQaJXhQz9/xSUg5aLqqT3/YUKcfq4dOYwiTGTN
	XoxpAM+u2rCdnvFq5gY3YmHblKkK+C8KjCg8pSun0Gjj6jyHhOQKKo9cHJdGGexjZicwMnCK3H9wG
	mQ8yWyp4PAIjUXx8UdvmY/VNVu++UUHsKdZ8nGojNP8/Lc6dH3bdahLIYAdtVCDfM3wX7DcBXSU4u
	SKayWOYtFzlk2B68a/plKzCYgTmUhVjNZqQ8pYtIBBVjjNFWeeGlO70lFUCuAjjVxh++ysO+PV59u
	q2rsVAx/Kk8EytErpdXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whiCY-0000000192W-2Zl4;
	Thu, 09 Jul 2026 06:25:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whiCW-0000000191K-2QHH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 06:25:37 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669618gC933287
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Jul 2026 06:25:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1YqnzWWYNh3cmaUOCZIRd7
	TUov9rA8o7dhqsYSUv9m0=; b=D/v0rw55N+8gvJL2TPFvB6q34PLe7kK4RaJT7w
	WP+mnEBmSOe1UvyzcNS09krx6WOLlf917tXVXnLRrcqAZxP8cRhOA47mW8XnGn1Y
	k8EsYaxNhGsMwsekKBAPgGT4gJlrVctubMoBKyx8sGsn6O5JrKmWfuMdQ9dRswdA
	8M/rOYfeXhKrS/v68WfvkoAcAfdCDSWCvm5SD7xtPdVgnmucXbdeuCqHeUUxIXjI
	bX/2LsSI2Jd0Uri3hT6vNvPCna/B1Qh/GGDh11crLaDF8M4WTbVq0ekjC/ow18Bh
	hndVNiQFktdwwNs0LdMntW5URBp/Fb1Q7fgb8PTSRTYzfNUw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6j7gg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 06:25:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ca5d2474c7so43409825ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 23:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783578333; x=1784183133; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1YqnzWWYNh3cmaUOCZIRd7TUov9rA8o7dhqsYSUv9m0=;
        b=N2VKYcw6iN2SlKFcKcmtIKxZVHZbovjf037BlJR/nVnGxerqrG/qxy+rcvRYZ4avDQ
         iQRDHdf/Nn37qxhujlZw04ykfCNZFVQCxaOxrA8KngqjAkEEWfRw8LC4a2u6PrwV3+lv
         UuoMweXI4WdwYtIso8oTpfeCGCK05l7WckbMEowqjxc5KcE1qjQuCxP5O2r94W7nswEf
         YB3703FgeWn5PszqeJ2sZBQRLVDwXQFUXqJS2/UFCQJHLv4xE1QG1wAb1fc2iX2dhvkr
         yZDN2d8WurPGkrrXsSjav8RuGmvhOOKWP+5b+pyq50t3oXtKhIm6eANuStdOZMq57hdL
         loOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783578333; x=1784183133;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1YqnzWWYNh3cmaUOCZIRd7TUov9rA8o7dhqsYSUv9m0=;
        b=XAST/yqcpqV4mxU1Kfd7/HUPo29goxIP81qeQAZ2mb3mg4GCKa6ZM+IfV30yl6TaeQ
         pJBsXFeUUU3cSlwsuI5IjHH51wpRyDFNLP/HuNISFkrntrjxy0z8HnbEOrCUjed/t+Gx
         1jbKn6Du88/sndbFLWYEUxqIHQirPu2ubMpsd6OISE1rDhTdN/CNUVuVIbZC/A6SDWBp
         2h2/hrHBTvqZe+mZ0Qg0aa1lMi8Tzmkge5FbrLXlU465odOixxk7g4WxDA4HRUJ1Jh4S
         Ee2ZNcjXwfm3fXsT4biWPasrQ1YMGKTA7dSg66x9Z66c4durwnUgvPtAw87DpJoqJuLN
         iR8Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqn7EADaDDicTNXiyU/kW/uaZ3vUVQZfkVQkbgOa2bt76p5obP7GdvGRT/+qDlQBRUBfLi+agDj7wbeGIikkqxK@lists.infradead.org
X-Gm-Message-State: AOJu0YxMeDMdR7iUUYZinplNO01ogMCFiGMAeAohZqL4yppCX1Sz8cCe
	Qq/fk7NjkFs9Vqiiy9N3UaMklDDMtOdLFeW4gIu/En2rXOMX7PVKT51UHGKcymW1TuFtLFfifyb
	wMGJmM8VNgFTC69caTKzzU5j+XLELbVgKsIADw+1js0uldcvLqX9nnHr+Rdz6scvBNJ2z0n4L65
	o6Ew==
X-Gm-Gg: AfdE7cnZqgREt9AKndL2HxUQP50+qy6xJyG7nrsid4sc9WNMdl/+iEsxvcjjwZm35lA
	kpUHoGl95OKBwM25pq3ZIvxhuoFEczNC4jxDkM4zATnWlYnwl5nI5f/MrYG9JNogqpfJkyURrSb
	0kzS0gbCuupvHBmn+u7Aa2FPb1Y+BydUQD0g0HpT2jFkmxCMDE2wJG7zAsl84Mv2qb3dWcNSNQJ
	oqFuILUY68Xeeu9BI9BMWrhesLZQ9jbi0T7VijlaJ4Kqs+2CBkXOcdeW56YHds+4P634x3nBcoj
	q9r23BO/0KzYvGJRXi5rk0aCXMidrITuAn9RabYX5b1a/29SEbkt3O/HMWlrX2hHFF5SgEsI6fY
	W7U8alwIVNiYc+qptsYHEnAN2ovugsOahz7qwLzqVGFzD
X-Received: by 2002:a17:903:37cd:b0:2c6:f3ae:2386 with SMTP id d9443c01a7336-2ccea2a571fmr63676575ad.7.1783578333359;
        Wed, 08 Jul 2026 23:25:33 -0700 (PDT)
X-Received: by 2002:a17:903:37cd:b0:2c6:f3ae:2386 with SMTP id d9443c01a7336-2ccea2a571fmr63676155ad.7.1783578332723;
        Wed, 08 Jul 2026 23:25:32 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf74cbsm37986405ad.18.2026.07.08.23.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 23:25:32 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH 0/6] tty: serial: propagate errors from uart_ops.pm
 callback
Date: Thu, 09 Jul 2026 11:55:12 +0530
Message-Id: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMg+T2oC/yWNUQrCMBAFr1L220BMaQSvIrKkm42NYlo2iQild
 2+0nwPz5q2QWSJnuHYrCH9ijnNqcD51QJNLD1bRNwajjdUXbZXzHoVLlYQ0Mb0wzILVScHDx+W
 tvKGxt0PbhB5aaREO8ft/ud0PznV8MpVfGrZtB+rg+KeHAAAA
X-Change-ID: 20260706-add_return_check_for_uart_change_pm-d2cb365202f3
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Richard Genoud <richard.genoud@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Peter Korsgaard <jacmet@sunsite.dk>,
        Michal Simek <michal.simek@amd.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org,
        linux-mips@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783578321; l=4632;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=xaM/hVUjZo3snEyz/S9bcZ/H9ysyVZEXqq3xmE7nNZU=;
 b=xstS7B9zPIQfwsEBA4/XFGTcfAsU4oB4GSGJzY7XzF/v3xKj/L2hg5jibSJ09Rtcp/Zvw7q/a
 rKqBeBXhUaoCx0C8rUDinlyefoUSLITLDPzV1Kykv7lFa1T2iyWiUtz
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA1OCBTYWx0ZWRfX7uSETbjOJ2/H
 b9pBVhZIyCoFn0XhzmR87+h5TVRVCn/hw9V3OOU98dS0axmsFuBXomL9MjRsawZhsYrrNMgs4dK
 tAGQfUPc3TDWDMNWdLYBLlNQVQwxP94=
X-Proofpoint-GUID: adO9CzVAtEsMYY8Ju3VVXx1R-JM5yJ0A
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4f3ede cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Sp74d_8yOxMrUkFL1bcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: adO9CzVAtEsMYY8Ju3VVXx1R-JM5yJ0A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA1OCBTYWx0ZWRfX0rcitBeUyYiO
 Vw9rIwQmt59iAyVjD5ojsMwia9l4Kdu7jrIYtg8/tyH9K3kofGt8JqciqUftZYn8rteNvKKWZRp
 C+FvV582Qc5oc5O7zeGmyVahOGRSmpHAbEStlsI0xOYWlDlxM0sbij/ar56D0mEyQ3EgdB7+KoL
 i/v/uswjudSDsuEr+/z6pL5MGKBtWsgD9MoXIvZNDfNoDfOZMx7+jYFPtWE5yx5HcnhDoZAKNKK
 Gsp7yNTz3ZKTc4PTv+DhuQYOIH5SnoJRx+qp9Bbwd6gPuOz/kfr/8vRGgJbZy5+jRn3bv8ki3mb
 6VDet5EzkyBMfE7hBsQgssjgNjMtiyivluGE215OLEL4kXh3TgeMbfmW3uNORpPYvw1CdoEggHZ
 SzILUH6HZE1ZrfuY9ZL20ecE/29HbB6e5+W5dIiy4BBt3hY9JGEqjcfAVRq3tGifH0Qj/YIAGew
 N46vz12F9DNc23j2DWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_232536_781277_E0443451 
X-CRM114-Status: GOOD (  20.39  )
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

The uart_ops.pm callback has been declared void since its introduction,
which means any error from a driver's power management implementation is
silently discarded by uart_change_pm(). Beyond losing the error
information, uart_change_pm() unconditionally updates state->pm_state
even when the underlying hardware transition failed. This causes the
serial core to track a power state that does not reflect reality:
subsequent calls to uart_change_pm() see the stale cached state as
matching the requested state and skip the callback entirely, leaving the
hardware permanently stuck with no further recovery attempt.

On modern platforms where the .pm callback performs real work —
enabling clock trees, interacting with runtime PM, asserting voltage
regulators — this is a correctness gap. Failures are invisible to the
PM framework, the port proceeds to call ops->startup() on potentially
unpowered hardware, and suspend/resume errors are hidden from the core
that needs to handle them.

This series fixes the problem in four steps:

  Patch 1 changes the uart_ops.pm callback signature from void to int,
  updates uart_change_pm() to propagate errors and only commit
  state->pm_state on success, and handles the return value at every
  call site in serial_core.c with appropriate policy per context
  (propagate, log, or skip-on-failure).

  Patch 2 updates the 8250 driver family: serial8250_do_pm() and
  serial8250_pm() are updated to return int (with the exported symbol
  declaration updated in serial_8250.h), and the 8250 sub-driver
  pm callbacks are updated to return 0.

  Patch 3 updates the remaining non-8250 serial drivers. All .pm
  implementations are updated to return 0. The sh-sci forward
  declaration shared with rsci is also updated.

  Patch 4 updates arch-level implementations: SA1100 (assabet, h3xxx),
  OMAP1/ams-delta (modem_pm, now propagates regulator errors), and
  MIPS/Alchemy (alchemy_8250_pm).

All existing .pm implementations return 0, so there is no functional
change for any current driver. The series purely adds the infrastructure
for drivers to report errors going forward, with the serial core ready
to handle them correctly.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Praveen Talari (6):
      tty: serial: change uart_ops.pm callback to return int
      serial: 8250: update .pm callbacks to return int
      tty: serial: update .pm callbacks to return int
      arch: update uart pm callbacks to return int
      tty: serial: propagate uart_configure_port failure to uart_add_one_port
      serial: qcom-geni: check return value of pm_runtime_resume_and_get()

 arch/arm/mach-omap1/board-ams-delta.c       |  10 +--
 arch/arm/mach-sa1100/assabet.c              |   3 +-
 arch/arm/mach-sa1100/h3xxx.c                |   3 +-
 arch/mips/alchemy/common/platform.c         |   5 +-
 drivers/tty/serial/8250/8250_dw.c           |   3 +-
 drivers/tty/serial/8250/8250_exar.c         |   4 +-
 drivers/tty/serial/8250/8250_mtk.c          |   4 +-
 drivers/tty/serial/8250/8250_omap.c         |   6 +-
 drivers/tty/serial/8250/8250_port.c         |   9 ++-
 drivers/tty/serial/8250/8250_pxa.c          |   6 +-
 drivers/tty/serial/atmel_serial.c           |   5 +-
 drivers/tty/serial/fsl_lpuart.c             |   3 +-
 drivers/tty/serial/msm_serial.c             |   5 +-
 drivers/tty/serial/omap-serial.c            |   3 +-
 drivers/tty/serial/pxa.c                    |   3 +-
 drivers/tty/serial/qcom_geni_serial.c       |  16 +++--
 drivers/tty/serial/samsung_tty.c            |   5 +-
 drivers/tty/serial/sc16is7xx.c              |   5 +-
 drivers/tty/serial/serial_core.c            | 104 ++++++++++++++++++++--------
 drivers/tty/serial/serial_txx9.c            |   3 +-
 drivers/tty/serial/sh-sci-common.h          |   4 +-
 drivers/tty/serial/sh-sci.c                 |   5 +-
 drivers/tty/serial/sprd_serial.c            |   5 +-
 drivers/tty/serial/st-asc.c                 |   5 +-
 drivers/tty/serial/stm32-usart.c            |   5 +-
 drivers/tty/serial/uartlite.c               |   5 +-
 drivers/tty/serial/xilinx_uartps.c          |   5 +-
 include/linux/platform_data/sa11x0-serial.h |   2 +-
 include/linux/serial_8250.h                 |   6 +-
 include/linux/serial_core.h                 |  10 +--
 30 files changed, 171 insertions(+), 86 deletions(-)
---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260706-add_return_check_for_uart_change_pm-d2cb365202f3

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>


