Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118DFCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 15:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VcLPpasNEX3QJRIY2M0aIPdRTeqR6PucNCShGuq0DT4=; b=tA2/+Ls5fchjYA
	A6UYHSo3J3kmbmLDT4rSGhDxBdSt9QLh3GoIO4mx730Tb5UKyHxOgP1SXXBTAWHp0sbe6qHRzdUmp
	f7VHLP+8YPUrhArYZJYxu9LEK+ridMxvPIAxUvPp9O5dcx8npxFXURWoR6aseEJL/rtYVZqPwvY7D
	N6SdDxrLHjtRaC28MEBiun3YGDKUhUS+Uypo/co2UAzfifev0AyKr9WNOgnAqEsRj6AFgKh1Sqv2t
	5gluDpk/QjCyQXMuIPh4v4Aw9iZNSrhmnnBmYpIYPux1KgbTvXCbjtNrFL7D5O7w2P5mzC3ISx39F
	5jB5casegpdZvKs90ISQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waF6j-00000001XXx-48fS;
	Thu, 18 Jun 2026 15:56:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waF6h-00000001XX5-0ern
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 15:56:45 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IFHPhh2194258
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 15:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VcLPpasNEX3QJRIY2M0aIP
	dRTeqR6PucNCShGuq0DT4=; b=j+4Ad/TBxE32rfAqTZbpyHo5FViecn7R35vhpr
	74BEHSF2/qdDmvm+fklFofRMit2uIn8MmjvJl8YgZ6xNgVsThjmZ3BotCkH1eI9/
	louLIg+7SUtah9lg6M0uCp8iZqtFJmlAfKBc7eKX9IpNO1aniohq8rz/FLdjaToH
	q7kBJcoz7BpzIU/SlKHazaORgfwxy/S8vwaDPEh9tr8ApsE73xuAhFNOP+A79pYs
	aeeaKmUMq662gL1I5bm5ogAQ5V2KGJy43PV6w8gdvypO6/lBeIuaHAp4E7ywCsxo
	YnoF/lH5og/tG4XxnDctQi2cLkFhXY389TcmW3IlWx1nC4uw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0g7mdm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 15:56:41 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139553dd8acso4460502c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 08:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781798201; x=1782403001; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VcLPpasNEX3QJRIY2M0aIPdRTeqR6PucNCShGuq0DT4=;
        b=MkQRy4xv064N/K8K82E6zMPegVwSbl3iXMsrEGMjfN/iChS+ergXANtzz2rIXC4wyZ
         AAurwTw6UsmtDKvEPTHJIona2+Ua/niRxPIupzinxnge3U0s5FAsfzRaRe7cTt9X5yMH
         FHubiM5akOxibMYWNoHk6Q3S4bMsn+H9aqwipP1qKxbpb5YO/SgWdK8lg8/Vwwvr76v4
         mo4ypg7jDVZUmZawcaWDg+ANGIDwxhuoFp84pIPsQpEmKXKz3Y75yGxjByPhxB4lv37m
         zrQm++rn4QTgrV3CW6Q9KkDBmgTJcy9kgzWxCt4kXI4gyyY/QutzQNss+o5BaS61mHtM
         zmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781798201; x=1782403001;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcLPpasNEX3QJRIY2M0aIPdRTeqR6PucNCShGuq0DT4=;
        b=j0KUAXpm4WThLBboqxUVX+fkpKfWT5CUs51d4oRnXEa3BUTcY1bKdYXEP18zKUN/i3
         K8KIg2kSnrrYM4bccOUInvUraiMm0rRDvlMNlaeE8WvfonlkBXOjv8g48Tgsdb4JGTu7
         xe+iK3wDoAgiuSwvXplkIA3a3Fn3EaJuIMTDkGK93PU23Kc1NkhRlzv4/T7f+DKM0K9g
         xI9LZWmOQvmyMAoayGRXbKUhdwvGgbFNFuxKxUxEEnHyopLl2w5E/23OXf6Pr145HAY+
         z2vbQ6zqnotzrsdJcpj/CHkNaeOyfgjY6hm0zM+l62sA/UV/xYYtBkydr5oAVbYh3oRB
         8XBw==
X-Forwarded-Encrypted: i=1; AFNElJ9NtHrDdeSR8V8XRfJc3zMdebr2A/2Rie8/Qb6Ju89KjVz5sa06woCmJNznuKSNjL4fw3PvyGviaCIkcT/YGmiW@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu0+jtkI86Kjvx6bkML0GfJka2fo9N04NTibE+aSEK5dTirXtX
	7rGvE2KdMglJEUrqO4X+LlFP9IjPHoksCLWoRDGTWcMpki3cw/5FURwz9CYIR0hx8Z6JEqdK7BL
	S9qohqgCMoZbgMdAgVI2S8aFWkGiOXH8WvHsaSXhEv9xTFEM7DJ5zCApcihEPQt2mzHrAe45k3G
	X3YA==
X-Gm-Gg: AfdE7cmncofZSZ8REA6a5aQJXOcIubr3XwE15Fxrq1DCAv2OCwP8lYXIFvBtuGkljgv
	14nQkWfDnAMqEncoxK+RM//LRSpllYEzI26M/FOVXRwPKLl0I3rnAa44hB9QnnEpLaWb3rom62l
	AhhDhweF2XjLfi91Kug4PNeCqLWtwc+yG+WisLWdjET/mAB224U6xc1H3X4Lq3WdNRUT21hCKPO
	v/NM0Cv6VEbW6Wbfycml1tBcP6VmwqT2SJ8YDVri6SxN36ImjEJY7zY16U0ezctxFRS8JTxcyso
	eSGcfSIFpR6Z0fALfehKuIu6g9Aj+mSehpwb/2A79/lLGOWHudXOamxkfh4ciFAbOFSWBYby1U4
	Ubu7QphhFKau6gPFO7MfkE8AhGZDtiZnFKGSF0hE08KSOZg0v1opV
X-Received: by 2002:a05:7022:624:b0:137:eb21:eafb with SMTP id a92af1059eb24-139a210d950mr184935c88.13.1781798200912;
        Thu, 18 Jun 2026 08:56:40 -0700 (PDT)
X-Received: by 2002:a05:7022:624:b0:137:eb21:eafb with SMTP id a92af1059eb24-139a210d950mr184876c88.13.1781798200388;
        Thu, 18 Jun 2026 08:56:40 -0700 (PDT)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b9110d3sm19671267c88.5.2026.06.18.08.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 08:56:39 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH v2 0/2] firmware: arm_scmi: Ensure automatic module loading
Date: Thu, 18 Jun 2026 15:56:33 +0000
Message-Id: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADEVNGoC/3WNyw6CMBREf4V0bUl7hca48j8Mi76QayjFXiAaw
 r9bcO1mkpPMnFkZ+YSe2LVYWfILEsYhA5wKZjs9PDxHl5mBACWUVJxsQB6i0z1q4qI9QwXSuKo
 Gljdj8i2+D9+9+THN5unttEv2Roc0xfQ5Dhe59/65F8kFVwrMxbkatIFbJCpfs+5tDKHMwZpt2
 741G+bgwwAAAA==
X-Change-ID: 20260616-scmi-modalias-0f32421bd452
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
        Jyoti Bhayana <jbhayana@google.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ulf Hansson <ulfh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
        linux-rtc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781798198; l=3732;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=mjHNFjrSpakQHraKQgU4+H6bL9gQu4hB14FwBpqmgUw=;
 b=hBg6Nk9j8qta0n05zkLply061xcL+eKoogc7g6U/ddVe3HybQC8J6n/rGWlCHlG6Rs3u3pXA1
 tTC1mEfs4N3BHALIzXBsVdWzGKEoLUmiZW+sPGVEdal1Zj/Blud0IQn
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE0NyBTYWx0ZWRfXz5AyRVsCOtnv
 EF/SUQrIHldWomyuaMrORQUti3epAka6w6fPLjmTLUdFM3ClCZc6zCYFy+w/rSSF6/ekXNkvEP1
 xII2m71J6SIoxs3qRkVFOVynIVi5Uv4kyi1nAqDyYkUbAuTIEW0cODPEYVJRlxatrFTOIOJBsue
 P64GG+aV8dTRj32S9NhOlYrL+JC9D+VgxpEXSo5SoigAuY7eMeJrIl2PD8A2QLWi2GcB4bh9gYz
 Tx1QBW5q1QuxG1eyx//rHx49+XiiQwGkJ4ABgM3hrKOXW8SamKBl065UoXhoPi8XfHtJHnjROmC
 SGg8s1P8rXpS0m2wsmoJ8/sd0dKJWlubt8wpggSxuyMD/IEXe+FXc6RpREO04nHdo2fM/j7oT88
 tqRLwFxiIS0klZVz9KNxxpP7bmtMUQmBcE/FeiRfjPzN/uTaSzSrzoMwl5qh4145mGAF344j/dy
 FduK1Sbn2L/5zFP91rw==
X-Proofpoint-GUID: Bl5Fy0qd9V33GcOIH0kRt7VzvUYSjL2s
X-Proofpoint-ORIG-GUID: Bl5Fy0qd9V33GcOIH0kRt7VzvUYSjL2s
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE0NyBTYWx0ZWRfX/YWmYRLdqozN
 HAWjD8NmEc+REAxMDwBSb4I8Go3kjIt7OSl1vu/PjFtAXj3Bff4aocilHIsWKY1ZhCssMxQ6wJh
 yEvCA1uTD9ZEfXmPm0gTYFj1+8ltWbU=
X-Authority-Analysis: v=2.4 cv=YrI/gYYX c=1 sm=1 tr=0 ts=6a341539 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8
 a=IpJZQVW2AAAA:8 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8 a=8AirrxEcAAAA:8
 a=pGLkceISAAAA:8 a=_jlGtV7tAAAA:8 a=1XWaLZrsAAAA:8 a=gAnH3GRIAAAA:8
 a=P-IC7800AAAA:8 a=JfrnYn6hAAAA:8 a=Bhy_3RDnOwLV862tVBkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=IawgGOuG5U0WyFbmm1f5:22 a=cvBusfyB2V15izCimMoJ:22
 a=ST-jHhOKWsTCqRlWije3:22 a=nlm17XC03S6CtCLSeiRr:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_085643_310160_ED447E25 
X-CRM114-Status: GOOD (  16.36  )
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

SCMI drivers such as the Arm SCMI CPUfreq driver are allowed to built as
modules, but they are then not automatically loaded. Rework the SCMI
device table alias support to make modpost consume the information from
MODULE_DEVICE_TABLE(scmi, ...) and allow drivers to be loaded based on
this information, if known. Also add a protocol-based alias to also
trigger driver loading when only the SCMI protocol id is known.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Changes in v2:
- Use request_module_nowait()
- Drop #include <linux/mod_devicetable.h> from scmi_protocol.h
- Link to v1: https://patch.msgid.link/20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com

To: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
To: Michael Turquette <mturquette@baylibre.com>
To: Nicolas Schier <nsc@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Jyoti Bhayana <jbhayana@google.com>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>
Cc: Nuno Sá <nuno.sa@analog.com>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: arm-scmi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Cc: linux-iio@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: linux-rtc@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org

---
Bjorn Andersson (2):
      module: add SCMI device table alias support
      firmware: arm_scmi: request modules for discovered protocols

 drivers/clk/clk-scmi.c                         |  1 +
 drivers/cpufreq/scmi-cpufreq.c                 |  1 +
 drivers/firmware/arm_scmi/bus.c                | 20 ++++++++++----------
 drivers/firmware/arm_scmi/driver.c             |  3 +++
 drivers/firmware/arm_scmi/scmi_power_control.c |  1 +
 drivers/firmware/imx/sm-cpu.c                  |  1 +
 drivers/firmware/imx/sm-lmm.c                  |  1 +
 drivers/firmware/imx/sm-misc.c                 |  1 +
 drivers/hwmon/scmi-hwmon.c                     |  1 +
 drivers/iio/common/scmi_sensors/scmi_iio.c     |  1 +
 drivers/input/keyboard/imx-sm-bbm-key.c        |  1 +
 drivers/pmdomain/arm/scmi_perf_domain.c        |  1 +
 drivers/pmdomain/arm/scmi_pm_domain.c          |  1 +
 drivers/powercap/arm_scmi_powercap.c           |  1 +
 drivers/regulator/scmi-regulator.c             |  1 +
 drivers/reset/reset-scmi.c                     |  1 +
 drivers/rtc/rtc-imx-sm-bbm.c                   |  1 +
 include/linux/mod_devicetable.h                | 12 ++++++++++++
 include/linux/scmi_protocol.h                  |  5 +----
 scripts/mod/devicetable-offsets.c              |  4 ++++
 scripts/mod/file2alias.c                       | 13 +++++++++++++
 21 files changed, 58 insertions(+), 14 deletions(-)
---
base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
change-id: 20260616-scmi-modalias-0f32421bd452

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


