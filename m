Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9396FF513E1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 21:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aB/qAvAOoxaYoPHOVqo1LuxW1bKORstF3vnraKsztao=; b=w3m2WfaFm5i6CE
	MDVqF+9Fpr6EKedB/bglkAZePfoIfqWlP3I3qy0lLhw7caFysbGVmCVEo2WgmhKywvTPxZf8hDdz0
	shusDqG+mtfRgzCdpwBFQQGTOA2IegV2EjtirjZJUlFBo78VDleYh0sttHLwNkD/2uVE+1iS04Cuo
	/8L8dSZuRXIzvacnXjomHP9afG1lcgBJRmh9QHLyHdpgwuyEYZuA+2/7pKn5us03F213/vyC6bkIf
	kuq8x3kcJ3vobXI4f43TfkY3KJzYNhmJ0YT57Zk6EKU0lesWUoZ+vJMxA6TixO9T17XCKRsj746CP
	81FGW6KJ1v04YpvLyEMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGWT-00000002b40-2xpw;
	Thu, 05 Mar 2026 21:46:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGWO-00000002b1c-1NKv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 21:46:20 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625KmufS1810042
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 21:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aB/qAvAOoxaYoPHOVqo1Lu
	xW1bKORstF3vnraKsztao=; b=hmyWobAZWCng67anBwjrdkpCiiJKDGm4+8AGJW
	HAs/GpY604tzpYZzSSGi8fBcsyUux9Y0TM1Jj45Y5UbASVkd7wSKZ9HgParcwsgl
	7aTjFNtjiDogZGpPpaaSO2u4Y+AYob9kAR1rbNKVuoHPBRL4wEuOZY73I/elXT1/
	68GdSedWfLo11zCR8nnmW781X/UZRaL/wGmARIkiV31omtZLyIM3wBhQAKjiCTRN
	nujZ+jcQlLeuFeATf2+Xp+84QtjJLVBBdncDMYKzfna7j8Y+LDzUoEDmjrkmKRRo
	Vo5hC9nRfjlTo60Y1kO02bvehZ/+xDnPEog1IqAjlxW/ZkSg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqgp407mf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 21:46:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4e37a796so4835579985a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 13:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772747174; x=1773351974; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aB/qAvAOoxaYoPHOVqo1LuxW1bKORstF3vnraKsztao=;
        b=hQew1ZTFt2xnj7sDsl2gywEPG7Al+qQr0WXqRAhX0OpUdQ52XjEDFMxASzekke1DAH
         AtIHniuOVNlrCiq3gdyzq5frBYRcaTilPu2nI5e5L1d3dYfzB+THqT9FY3lHY4ufSJ68
         6XdLo8uqMoKDbj3ctpbdV9Icsp25si1oSK5j6hbMAaj2ssX78IAxkczZ3J3d3VdwsTZ5
         50JJ7Q8QUJejJaH+4Xs4CyH8hP701WdgqopYk4AFwsDOGbMSWGuio6LmdTbMw+v6ez7x
         MpYeOHtq9lcTUpk2LlxpYM21HkWY78suZ9ORT6IT4/RdSyEnWMAbbrpU4+F/g/6x8TZp
         ACCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772747174; x=1773351974;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aB/qAvAOoxaYoPHOVqo1LuxW1bKORstF3vnraKsztao=;
        b=qrJBbfbxCGUdqJSvL+SqWf3e0RcVUXlACI5szTLN3Is9Z8vTISK+DPqVeVlVmpDbnT
         X4SwUFCIb6qomSNA4OaZ9gCxWnIKIypMPeiAcrAtu8oTir0tMOEmrgRkFZu6ceLzg3vf
         JWSSr8ktKh4EGG47fXUTCS0ngb9iKuwJaM26iHlGE4JwJkltOq8NEy2BnqB+1+ZsDg+K
         y6PW/7+TGpgdcMmJAqvYbiRSFcnLWKLdlpkV31r/QguT46L+zO/W6Vm+oFd6wR/st+m+
         qAStk8Qcx/b6MndH8iQAocAUSNUC7jMOgSzK1ClbAHx/QZ+lFgqfHQ2lXGiMd1Bwer3K
         foIA==
X-Forwarded-Encrypted: i=1; AJvYcCXd53HdKjWonbeDmSmhsgTC4I+f7AVuM5zQ1UK7y/PgBU2+iSRDg0J/x0eoIoYt/Qx4ahrI1jqMETXHsPmR9DmV@lists.infradead.org
X-Gm-Message-State: AOJu0YwVn3FJ2sFTVO4pU+wJZ+6ttg2qCIfOM8GThyIAGGy3UXqIkQ/n
	enhV26pDHMu980Z3TFQHvhn7+yX2RwR06D/CVd6Wj31mLL0JUjl0gZaC/82p2paYSsmJciFds7I
	DvcXi4QD842YXLBIrCG+0BIN0x2PzDeWhccIlhCTf+L1/EAnKgc1Wxwm5FJXAihUnJbQeCRboXD
	w6/Q==
X-Gm-Gg: ATEYQzwWqBoLP+Vrzk9yudf82sR4RsaYrdzqNE44PsKXs4yZaTajoOmnUdvxIIrQmks
	Bnv4gvqSRztSZSKYl7akCrTf9Hs+ppYBWH0Tl+C6pyrFHfdpC0h359P1lm5OXqx8terSXoiJbMw
	PBFRn5vNrpXdzSPgj6CM2aYG/PKLk/P/53GJZlu+orlbLtNgliCggq0cX6UI1rQLaiao8AAxZSZ
	AV5+ykcn+dPh5Tb8KBqPViqFECWMcyPFfv3r2pK3G3yoaxCSgrw1BUAkrAfdUf7c69KlycupFNn
	lm+1OsQRRp2DQDFJmE9zgBuhXn0i3zIZ1wjfCkxM0Kinh7VVAU4Rax85ouJt56aHjL1uyshwcbI
	LAwgDn621xSYMJtg+A975fkvXN6j6xLUXvD1+3i8SG/dF
X-Received: by 2002:a05:620a:f0b:b0:8ca:3c67:8920 with SMTP id af79cd13be357-8cd6d515328mr508685a.69.1772747174152;
        Thu, 05 Mar 2026 13:46:14 -0800 (PST)
X-Received: by 2002:a05:620a:f0b:b0:8ca:3c67:8920 with SMTP id af79cd13be357-8cd6d515328mr504085a.69.1772747173657;
        Thu, 05 Mar 2026 13:46:13 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm28571575f8f.27.2026.03.05.13.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:46:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 00/10] workqueue / drivers: Add device-managed allocate
 workqueue
Date: Thu, 05 Mar 2026 22:45:39 +0100
Message-Id: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIT5qWkC/13Myw6CMBCF4Vchs3bItKRcXPkehgWXURqFQitVQ
 /ruVhI3bib5JznfBo6tZgfHZAPLXjttphjykEA3NNOVUfexQZLMSUrCp7G3ZeWVsWc/Yl+pSrD
 igriFOJotX/RrB8917EG7h7Hv3ffi+/1R2T/lBRIKarMmp7JQZX4yzqXL2tw7M45pPFCHED6ua
 GndswAAAA==
X-Change-ID: 20260220-workqueue-devm-d9591e5e70eb
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Tobias Schrammm <t.schramm@manjaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, driver-core@lists.linux.dev,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3030;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=97oQa5AwjxFqQNenF0OHDjBYeqUlG3QZw9SpgqUFg/A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqfmYRxyzCwJtuMtPcmgwwLLBsg2Fv+yT512eQ
 cjU6/+PRz+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaan5mAAKCRDBN2bmhouD
 1yMdD/0Rzss9RkGRF5nKqvTWC/cgAO+EIzsrFPQrQxvOIyduZBpdUjVFhj4xpZwybjIg8hJkNWW
 xK4MLqpSkM3FPPTnPvx7URqpkHMVFAzZpYFTxJCJaEg2QNz883y7WzgF3wPnB3nTAZGTD6SkHiw
 7qtwhrzLR9KZ2RcmBf4P+zbHd6MvF/NjWgpbHf6/JHoSHF3D7e8fX1iWFI2fcYFTuoMLAXE0kD0
 DIJlbme/ltg9kAdbOfpnduvC0zZJ9DenyqGciETdu4u3+pyFeaL6kqJ+ncBGCmHcPyzVi10eaI5
 1dNEaW7ewsE+9TQWQzObBBWmOjRQMHGxEdeZJeToxploMKivPdWsBXLsBA/1EqqMTztOp4L0SaH
 urVc6BYdSEDLI/M5jCBPYAga+DVAfmKi2usRylz7oQm4fKCHHnfFty7UHSZPRkCNWPLcfdbKzUO
 5APGiClU7Lywgs35JbsNVrQ/bbXCjr+OyH2GoywqdFYNVQCmWzPbC/jdoEUPIIxI30hwJh8zG6B
 AM/3gg2VMporqUwUGLbaU2n5xY9zqlaJp+XsX9ghJgrZ0s5KuNb1zKhcVBFvwBgu9BObHEqMWh2
 xZ6pVDucGWY+fjqjq9elSwZ62SlrH5fyl+6CUcVJB2JSFwyaGA933iHQU0q2rvQlDwbd4FJ/ElD
 F32GZygtedFkMRQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: EWLZvDBopF3fDWnvje_x34KKR62ET5on
X-Authority-Analysis: v=2.4 cv=LegxKzfi c=1 sm=1 tr=0 ts=69a9f9a6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=5RJr-VCCejNB9LTRrg8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4NSBTYWx0ZWRfX1GXtYuqlHliU
 haGKrOLggi8mZvCwzwq/rki8vKnJ7FNybf6/QtHJcaZ1/+m1dzdX/8M1Kn+TYJGw1sgANp+Rf5c
 PyHYNvRIrGVMdLQY8RI5KSlL8rI0iijUuussoQQ5l2gJHNeX/Ex5JRPNmDNZ+A2h7jhNTx1hOOI
 0isnMjC571BJ1fTmX+SKsIss9Mq5bUV72u9ChRXvPGQqOLy+f/6B3BZeb9Itubsjc6ILWwiq9K3
 gK6/xb5jGLSQLs9rigvaRmLQa5gHyrEXHurphhpjBXY8JMS52sZoqYdvzdo4i8ppACNrcRHi1Es
 zKRdCMoCvqYLZ7p4Ro96AOtNMr1csOk1syOLOWxgOyJ7MGVIqf0mh9KroHz8q+ne3YS5rQ+enJR
 nyOPMVSUMfZWal1FbVYo84Guprj8KQZe/vXpuiwf1acXg4iDhnQzMvYoqqufvQVm/8LydtMDDdE
 t+G+tWIZXK+iDLLYVPw==
X-Proofpoint-GUID: EWLZvDBopF3fDWnvje_x34KKR62ET5on
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_134616_505409_50960200 
X-CRM114-Status: GOOD (  18.08  )
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

Merging / Dependency
====================
All further patches depend on the first one, thus this probably should
go via one tree, e.g. power supply.  The first patch might be needed for
other trees as well, e.g. if more drivers are discovered, so the best if
it is on dedicated branch in case it has to be shared.

Changes in v2:
==============
- See individual patches
- Link to v1: https://patch.msgid.link/20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com

Description
===========
Add a Resource-managed version of alloc_workqueue() to fix common
problem of drivers mixing devm() calls with destroy_workqueue.  Such
naive and discouraged driver approach leads to difficult to debug bugs
when the driver:

1. Allocates workqueue in standard way and destroys it in driver
remove() callback,
2. Sets work struct with devm_work_autocancel(),
3. Registers interrupt handler with devm_request_threaded_irq().

Which leads to following unbind/removal path:

1. destroy_workqueue() via driver remove(),
Any interrupt coming now would still execute the interrupt handler,
which queues work on destroyed workqueue.
2. devm_irq_release(),
3. devm_work_drop() -> cancel_work_sync() on destroyed workqueue.

devm_alloc_workqueue() has two benefits:
1. Solves above problem of mix-and-match devres and non-devres code in
driver,
2. Simplify any sane drivers which were correctly using
alloc_workqueue() + devm_add_action_or_reset().

Best regards,
Krzysztof

---
Krzysztof Kozlowski (10):
      workqueue: devres: Add device-managed allocate workqueue
      power: supply: cw2015: Free allocated workqueue
      power: supply: max77705: Drop duplicated IRQ error message
      power: supply: max77705: Free allocated workqueue and fix removal order
      power: supply: mt6370: Simplify with devm_alloc_ordered_workqueue()
      power: supply: ipaq_micro: Simplify with devm
      mfd: ezx-pcap: Drop memory allocation error message
      mfd: ezx-pcap: Return directly instead of empty gotos
      mfd: ezx-pcap: Avoid rescheduling after destroying workqueue
      platform/chrome: cros_usbpd_logger: Simplify with devm

 Documentation/driver-api/driver-model/devres.rst |  4 ++
 drivers/mfd/ezx-pcap.c                           | 27 +++++--------
 drivers/platform/chrome/cros_usbpd_logger.c      | 18 ++++-----
 drivers/power/supply/cw2015_battery.c            |  3 +-
 drivers/power/supply/ipaq_micro_battery.c        | 50 ++++++++----------------
 drivers/power/supply/max77705_charger.c          | 36 ++++++-----------
 drivers/power/supply/mt6370-charger.c            | 13 +-----
 include/linux/workqueue.h                        | 22 +++++++++++
 kernel/workqueue.c                               | 28 +++++++++++++
 9 files changed, 100 insertions(+), 101 deletions(-)
---
base-commit: 9739e59909e70058fab7a131d7bee60d447ab732
change-id: 20260220-workqueue-devm-d9591e5e70eb

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


