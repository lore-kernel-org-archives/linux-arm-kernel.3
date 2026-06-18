Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9C6CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 20:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMV94ArRUWNb5oU3/kS47SDy5ZbaBXLZRnnNKRvZXFA=; b=X+anOnKDzwvoWA1v+3hxZ/OHFQ
	P+ppgA3P50NJKJ+rROigQbaDHqrtL2bg7myF84b3Cbme5mY+JiJOpPPPZc8iGNasABNgwsqhipKRE
	S6N1Ji0BijF9uxTytYP/jXtfTbAC7vG4d4RO0r5AvlQvi/ToBVJGuy3FlpyodVKXeNfO07Yyqs99l
	bQN7k7ZE5DtvoJBNREr7jLnUrGtrdzQKaFZnv9JETNE3RbvxtY8AmixwQI/SQXXtdJCZ7dDdOKzOM
	yBXPTxHtrfkuNSGCTa3ifg3uhHJzURCgMQVAKazQzN11yvPfIkCYsyziutzaCZYxB58YB+jJ66Zgq
	0XQTDvTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waJOT-00000001m45-3jvh;
	Thu, 18 Jun 2026 20:31:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waJOQ-00000001m3d-3jRV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 20:31:20 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IHtxa12476775
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 20:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mMV94ArRUWNb5oU3/kS47SDy5ZbaBXLZRnnNKRvZXFA=; b=A9i66YWdpU6YBRKd
	Y/MBdL3leGrrJahi74KTM4KDUukQ+j5qURMvDHv/h26fAMH3YQ7DGji15TAnMGwL
	USEPfEP8AD8iQcYvd1iG1lfmSmz7UW+zAngX+q6y2E0CUnCSI7j/tqtfhJrqkhqe
	Bb7YKc+I5KSThSi349qRKDQodq8XXrVZwF8jlfC8noswCAbuAmfFSXFNt6pILgF2
	eX7GqmBqg+WDX9b4uCvVGCkgfKaMMi1FrJfZJo0n6j3P5s0uMfYxkHKqzunR9kjq
	QH8VKdbeCj2Uku3j8+w1XmjnU3du0rg0dmLmftvJ50lp7ioEz2fD83urICNDRRJs
	2WsO5Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evm20h6j4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 20:31:16 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6cfd2a26ab0so576229137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 13:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781814676; x=1782419476; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mMV94ArRUWNb5oU3/kS47SDy5ZbaBXLZRnnNKRvZXFA=;
        b=Z4Q3N2/Z1zt0zUgLOP6M7H10IxpyOSPgMVrPGYVSVBnijjKDoh9F82Fw1quLnehla2
         0V1IgzGLijNyBgxmEAWTuJw5d+v8COCJ6O/fjpqeqwGpt9Bpc/CZlz6lVgysqiECOTrb
         2u6/MUnydPhzX44oe5OijM+QVNp6O9kpSHscAHsabH0u7Qr+WSggWAvxjNdihMdYSEgO
         cTqaxlEwG/DFl3kpygGCuBvmk336Z1wszkPFDT/YXwNYJ5lI9A4vvzqex6bXO5ErFGxT
         zsGajstIgSQHxnQHpF6ncZofckjorlq8fpKmdSl8+L+ByNGwrVW8YRTy/vKGXOvkrQTT
         MsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781814676; x=1782419476;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMV94ArRUWNb5oU3/kS47SDy5ZbaBXLZRnnNKRvZXFA=;
        b=MWICEgTaSdigUabpla/q4H4Ln0/Wj2nDdqLdOMgPSKtWLwavXEdX3GhoHCsPsldJEK
         nUVre++/vRB5tEtTIkK1QUovZwfP6Ww+KTwjgIX9uCr3HLXB7POLiPiSeuSiUpvkdDhe
         An1zDie0DMgo9kDGc9GYAFDchbBQjGQUMv6jab34PSISSK385TbEt0mkztWD3HZLZ5fe
         w/mQULHQu7OJb2IMqDBB0SN4K7h4SdmmV4qXzm4KWPxvzhSvsF55t4XkJs+vVc6+2kUE
         VAhWbHo+USlPbKrcAyHjvEbl1n31JUnrg7plBDpFWLj7f8+71fNLbRBW3yh6ZMsnsKl3
         P9Zw==
X-Forwarded-Encrypted: i=1; AFNElJ+z2Fo4MS/v9P26HvtIt20KzDLjhaIyPUlfNgY5uwsfXCNinGad2OTpZMyeb1SepyFyhqYnO6KmVwXv8z1cNDEd@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2dMkKnINr71+RYzKaoLQO++25SxBHNyViDgwEEdVA3QD1L1Qq
	0m8HCHHfNOU/njz6Xz+jQAg63J+zFak+NkJQQLOZGAMrnh1dR2R9SU3o8qJ70IJvq96FcCVqUqt
	jmsIu7IUhsoCGBV/rKmdAjYIH1iA3NqcyLizkcsc0nXcP/FX2j/D7SdJVrWnJHxlrYfcQndad4W
	YKfg==
X-Gm-Gg: AfdE7cm63ukyj1+gCXgX27C55t2vjicqm4HoKTN5uvDmlv/zAB+q4Lo/ij2oMiI2lNM
	JO/KMX8Vzw++1N3o8kJNT7j5+p/W3EYYKCYilMRNXViG6+2OITEmzfQG8PyNEa08/zeStsS/Kka
	FBy6HEe2n50A9UGyHKQXwq2AnwwyYtboBbhqTBoEHABsuRbhfPSM+8VFcQ/C4WqFiSyNkKFNnwQ
	9OgKBE4p/ysp91iMVEPXxrOCHVM9cAL6+quIw9xF4p1R7VNWOQbZDEFudlr7XB1TF+gEqdaJwjx
	fYLwNlXy7rTdyKFaJkvPzDONVxd7+QdwpuH1rDU2UCEDGdR7cSKaNTPsKveXd3gu1j34N721l6r
	9ZjtmSIcdEgP11XE2HkvoO9j7CjOp1RwAPhqNy4bYmGfbXW6Am4LQ72imDhEC/GY+44UGedFfBn
	pi8AF3t5+1j6XncnX3egFA7Ge5UiLVnsusVjZVAGhQKGI/kutO65QeOE3Nh1Kw3ZXdru6On4Mku
	WLasA==
X-Received: by 2002:a05:6102:448b:b0:650:aa33:5dd7 with SMTP id ada2fe7eead31-72a01884599mr1095681137.2.1781814676208;
        Thu, 18 Jun 2026 13:31:16 -0700 (PDT)
X-Received: by 2002:a05:6102:448b:b0:650:aa33:5dd7 with SMTP id ada2fe7eead31-72a01884599mr1095628137.2.1781814675743;
        Thu, 18 Jun 2026 13:31:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a8490b104sm2351966b.14.2026.06.18.13.31.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 13:31:14 -0700 (PDT)
Message-ID: <8c2a4ae3-95cc-489a-a7a4-90a3ee2597e9@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 22:31:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] firmware: arm_scmi: Ensure automatic module
 loading
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
        Jyoti Bhayana <jbhayana@google.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
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
References: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE4NyBTYWx0ZWRfX2T+EoYd+C/IA
 mmI63JVD/e3qj6jfFxWJvW26yOTjuvW2+FGeR7g9g8yhKE8XWn56jc9/arZ9wQk66FSMzHBK94q
 KupEV6BC0vbXy8Iz+l8CDKP6C7Xrvx0pEvlJ3yQFdsKJggla/uotZ+SbUCb7AAVUDpQSVLpxHk0
 ml6iDoW+vSFLad6IfVw6CN981J8F8yZH4Wt26vx/Mrr9wgD1PITmPaDNxi5v2/AhaPaDG7UnlXE
 olOrDbQr3E/Fk7P8OiLt8/KzfaerPb0yLC0nOuDoRXKp5vZDLDjiGj5bNYzzB4JsD/WcdVUJFO+
 5l2dTgMgdXOkwugDT9TnBFqWTgmPudT2QGMShgncRVMNimphK8CHq/sc994jpPO6XB7lhIKP5yG
 Ni500HeL/Cgn5DevK19R8lGo14fL8V/HE1loja7Ra8e8hUTAHvaQuGHmu3bFBM0JnwpfxiuzSli
 mASX7DrOw7zEmfTSYgQ==
X-Authority-Analysis: v=2.4 cv=GKw41ONK c=1 sm=1 tr=0 ts=6a345594 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=IpJZQVW2AAAA:8
 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8 a=8AirrxEcAAAA:8 a=pGLkceISAAAA:8
 a=_jlGtV7tAAAA:8 a=1XWaLZrsAAAA:8 a=gAnH3GRIAAAA:8 a=P-IC7800AAAA:8
 a=JfrnYn6hAAAA:8 a=5KGQkzpS6Bu23flkvY0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=FO4_E8m0qiDe52t0p3_H:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=IawgGOuG5U0WyFbmm1f5:22 a=cvBusfyB2V15izCimMoJ:22 a=ST-jHhOKWsTCqRlWije3:22
 a=nlm17XC03S6CtCLSeiRr:22 a=d3PnA9EDa4IxuAV0gXij:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE4NyBTYWx0ZWRfXzTBiyWaVz7zo
 XC73oX9V2Nc18gmEZO4tvtR36FxQm9hAFrwJKcGmOjiHmaiBUVfGVlPdiQTCMKSGG/DlMXO+JS9
 U6Ryx3Om8qz5rQTHcJ3xd/NubmWNlOk=
X-Proofpoint-GUID: WIIe_OEGFyd48iuRCjJmzu4TQYNd2eZJ
X-Proofpoint-ORIG-GUID: WIIe_OEGFyd48iuRCjJmzu4TQYNd2eZJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_133119_081139_64D86943 
X-CRM114-Status: GOOD (  27.58  )
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

Hi,

On 18-Jun-26 17:56, Bjorn Andersson wrote:
> SCMI drivers such as the Arm SCMI CPUfreq driver are allowed to built as
> modules, but they are then not automatically loaded. Rework the SCMI
> device table alias support to make modpost consume the information from
> MODULE_DEVICE_TABLE(scmi, ...) and allow drivers to be loaded based on
> this information, if known. Also add a protocol-based alias to also
> trigger driver loading when only the SCMI protocol id is known.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

So I just gave this a test spin and unfortunately it does not work.

The problem with Fedora's kernel-config / setup is that the
request_module() from patch 2/2 runs from the initramfs, but
the scmi_cpufreq module is only available in the rootfs.

It does work if I explictly add the scmi_cpufreq module to
the initramfs, then it does get autoloaded.

We really need some place to put a uevent sysfs attr which then
gets replayed when udev is restarted from the rootfs and then
re-reads all the uevent files as part of its coldplug
enumeration.

I wonder if it is ok for a single uevent file to have
multiple MODALIAS= lines in there.

Regards,

Hans



> ---
> Changes in v2:
> - Use request_module_nowait()
> - Drop #include <linux/mod_devicetable.h> from scmi_protocol.h
> - Link to v1: https://patch.msgid.link/20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com
> 
> To: Sudeep Holla <sudeep.holla@kernel.org>
> To: Cristian Marussi <cristian.marussi@arm.com>
> To: Michael Turquette <mturquette@baylibre.com>
> To: Nicolas Schier <nsc@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Brian Masney <bmasney@redhat.com>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Jyoti Bhayana <jbhayana@google.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: David Lechner <dlechner@baylibre.com>
> Cc: Nuno Sá <nuno.sa@analog.com>
> Cc: Andy Shevchenko <andy@kernel.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Ulf Hansson <ulfh@kernel.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: arm-scmi@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-hwmon@vger.kernel.org
> Cc: linux-iio@vger.kernel.org
> Cc: linux-input@vger.kernel.org
> Cc: linux-rtc@vger.kernel.org
> Cc: linux-kbuild@vger.kernel.org
> 
> ---
> Bjorn Andersson (2):
>       module: add SCMI device table alias support
>       firmware: arm_scmi: request modules for discovered protocols
> 
>  drivers/clk/clk-scmi.c                         |  1 +
>  drivers/cpufreq/scmi-cpufreq.c                 |  1 +
>  drivers/firmware/arm_scmi/bus.c                | 20 ++++++++++----------
>  drivers/firmware/arm_scmi/driver.c             |  3 +++
>  drivers/firmware/arm_scmi/scmi_power_control.c |  1 +
>  drivers/firmware/imx/sm-cpu.c                  |  1 +
>  drivers/firmware/imx/sm-lmm.c                  |  1 +
>  drivers/firmware/imx/sm-misc.c                 |  1 +
>  drivers/hwmon/scmi-hwmon.c                     |  1 +
>  drivers/iio/common/scmi_sensors/scmi_iio.c     |  1 +
>  drivers/input/keyboard/imx-sm-bbm-key.c        |  1 +
>  drivers/pmdomain/arm/scmi_perf_domain.c        |  1 +
>  drivers/pmdomain/arm/scmi_pm_domain.c          |  1 +
>  drivers/powercap/arm_scmi_powercap.c           |  1 +
>  drivers/regulator/scmi-regulator.c             |  1 +
>  drivers/reset/reset-scmi.c                     |  1 +
>  drivers/rtc/rtc-imx-sm-bbm.c                   |  1 +
>  include/linux/mod_devicetable.h                | 12 ++++++++++++
>  include/linux/scmi_protocol.h                  |  5 +----
>  scripts/mod/devicetable-offsets.c              |  4 ++++
>  scripts/mod/file2alias.c                       | 13 +++++++++++++
>  21 files changed, 58 insertions(+), 14 deletions(-)
> ---
> base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
> change-id: 20260616-scmi-modalias-0f32421bd452
> 
> Best regards,
> --  
> Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 
> 


