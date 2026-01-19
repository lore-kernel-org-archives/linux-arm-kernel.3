Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F0BCCF2DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 10:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AmrKFcesIbotTnCRANAIBkDX/JXuIv4RRLQRelQDe3E=; b=0zXThS59fX6KaWncz+MXUTZvII
	M7HOV4lPOhhTRo2JGFtC7q6NbcWuaCvTjB8rGkUbuEKMFDpTumRE2y2tGpjKzBUediCkiftzpne9x
	J1UMTR9la7P/hGdVV1LXDY4ZopYDbt+gojndCXV+3cIe7LadAf5VsTzPc0ontMVcjkyEJULeb3Mmq
	WGLZKoZRT1j141KtUPuRXg5VC9h5ofCZrOWWOBl/N4am+dJ+/Go24cVTAOtsX/rY4oVdYRY2stSuJ
	NG5H3nOcYb3D9VQzuu+Qv3vbsKt9nqWBcQiF/LxWOtDwMQn8jj+4eSJccE5X2CxJCtL4yKQHAbrxR
	Br1Z75ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmhG-00000001nDr-36Jp;
	Mon, 19 Jan 2026 10:41:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmgg-00000001msu-0zf6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 10:40:47 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J91DCe1150096
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 10:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AmrKFcesIbotTnCRANAIBkDX/JXuIv4RRLQRelQDe3E=; b=VfYRj9j2PNJX0xTQ
	LS8UojMeyGf/yFkKE15ePZh5QbzcuBMbCRXmrRZREehh/jduTzkUmLrIW5NwSjGY
	le2zU/rE39ze583tqUYzOTOKOfb6xKUNz/luf/2modht+drwAbuvPlMN0RAvsJlq
	7NrfmmMYIKhxeKe3xXmy9MuvIvR9/yF+GDEeh9+o8lfP+dKlFFYPh/5hO3wG7CkL
	UdRzl82RGls1uthJ8VO/55NlQyLreT3avHOgrxQ/LAxTsb+jqH0xTmjbyaXAy38d
	nyCMkMPm+Y3hkT+e1SaU3uBB0Ms8ynduzh+TunPZVet9OzWKBOZpUq+3tCRWsVX6
	kxIV5g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br04e545t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 10:40:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c5329ed28bso1072614885a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 02:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819245; x=1769424045; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AmrKFcesIbotTnCRANAIBkDX/JXuIv4RRLQRelQDe3E=;
        b=hm1xq9qYS2aZGopbv/9fvpyyjN6FRAbNqvA2L9QIxy15+YhoIAh46BL2RYpKMtR/FI
         0dZ/1I+1xXu3CvJTqk6xz/BybQ4Zc3MheNv+U6ilzb2jlF1b729bVLSpm1CsozSuivxl
         svUeXX2bSevB5gy/C5td6DWy9nLKQr1h77q0ISB5rAfjpqraHGhZkfq/F0PNtR3ezKR8
         83nT/VQwloTaCIfVdtnywXGB7xkfrZV6500UhwHJpRVdJHrtSB2t9fMNl7KiFK5fsekJ
         pdJqH8JRXb9mT4QWpVFLCYac614sgRCOmudRrH/UGHEj4w4xvk8U8H4jX/maxHH+mjyt
         2eXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819245; x=1769424045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AmrKFcesIbotTnCRANAIBkDX/JXuIv4RRLQRelQDe3E=;
        b=MiLFQ0wwyNdRjV7NOcmE/qcyWOoFTNMJoEg241kVdW1QN/ZO8VgeLKXlwZBuwQbaDd
         w04NaOUvjv0+BNPNZ6xGoJs1B0Wjvsl+G/mdCqRk3exUms3m4ydyRRzI+CXLK+6uwUZb
         TT/frq2TzLAInjGby556qmtM7H8a+pMOR+dZ+2XuP+K16/HX3m26oVE4k42lp0EM9sxc
         OSO5snOsPeoKoC3RLX1Jo5Itt4oj2f6U9MYc7KcfSWjOor1W40xd6l7EgZ/m5dISERdr
         93ZZCJdYsfcbEeGYZquCdG/6nSuVPbOldxmG0gJgKRk6rwwE3tWgeow77ELUkjW3HZf8
         xpaw==
X-Forwarded-Encrypted: i=1; AJvYcCX2tqb+Vdk+j52ZjBbIsHr/5psGyoF43/zd0vSaNG1tRIjuowH5Ihr6W/+xxqT6xMHdKIfCz3B8GCd4VDpSsEff@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8uoZFzF7EstUH2GTtAvcOebpIlCm+NcqKNuQpMS1bNxDr/dwg
	xJTSQDQEYw27zT2ESci1IYNhzK2CNPhXoTyqwr0hKFx39UKqSCtaZl5czBPDYjm8fzCWaNiLlvE
	pMVqJ6aNYLeTr8f38wGpaVGCIb533i5DXi6ocblBjsfNNhWs7B10YQSlbtDDJc/FGdV14BpoWip
	ZJiQ==
X-Gm-Gg: AY/fxX4o8gyfNh37C5kKzzPKwsxhGKxFu8BsKjAdhR3tbzgqYMo+ZX962F60S+v3upO
	gTQUBJNkKXWemawmo8LtXV6U4d6YfOJ8JoqlOcyG65NSi2CMcsqOuryoVmQAm14NxAIeov5/MXw
	Lj/OihMbHd/uZVskq3wuuIkA+DJ2KLwklWFmMhF7ztwcxT+oNabKxrjxhbwY3x/Mjljjp8Qse7R
	qI3zPlEz8k3PC6vDAKepLY+WBxdEh0J7iPwxwBn4ahCiG+lx3w2YHvHB9orR4uvzFnUf74eImNQ
	oGk3ylW3StzakncwPl4Uo0EMxXWjFXFJHbl2taLDLhfkezdzF+YQ9Va69dLppAb9Wd7AHmP/3CT
	ZFL82w/It4yWBow3hIA/SF6i350zfrgZ/HJnLorPk
X-Received: by 2002:a05:620a:19a9:b0:8c6:770c:40d8 with SMTP id af79cd13be357-8c6a670cd8fmr1467497785a.40.1768819244746;
        Mon, 19 Jan 2026 02:40:44 -0800 (PST)
X-Received: by 2002:a05:620a:19a9:b0:8c6:770c:40d8 with SMTP id af79cd13be357-8c6a670cd8fmr1467494785a.40.1768819244181;
        Mon, 19 Jan 2026 02:40:44 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm185185245e9.12.2026.01.19.02.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:40:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:40:19 +0100
Subject: [PATCH 8/8] soc: sunxi: mbus: don't access of_root directly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-soc-of-root-v1-8-32a0fa9a78b4@oss.qualcomm.com>
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1008;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GKVObXCXNC12fSCZyvL3ryQ6x2vBtI3uuvqrxKyzc6o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpbgod2Z0XeYN0hebAo6LmFskYdjL5FbX1EGXvo
 I3KG/9vZDCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaW4KHQAKCRAFnS7L/zaE
 w6ynEACXUgdvUuKIyGdhXbkqmx6FYZmuzw4u+krC5x/9fU2AvfjEdoMGWsMBlbEfRgb8SD4b5Ey
 Wuk9beTVoujuYsJqtMB1kexe1ve0+ibT/ooleUNc574lFxHYDSAqFuhAcqN9lgVdJUqOL+I92Br
 IJndTOD1P84qPpzERNqfkix/k060FWZcyag6YVcDrgqR92RpHK0gokao/8AZbM+LiWbYf0CHM6w
 MIHSpKSjUgILEVeOGjf0JxqIUr1dbCQXtSY98u96NAqI/9XPeaeMbtTKG89yy3qeoLN7Z74SKGi
 05pwXG4l190xK/MiT/QXVyMvF9QMobxWIRQDdIAIh1VdILHSz0EAJU17fcMWldP95oK4zDsySzn
 tSyHjzvsArXa7WK8c9n7Z95ENQjXS6er7i694Ud9TjbSOe4gCyAX0cHLeWKfY42YH7f/0095ho9
 fz+379qIEV2Bu61EjCTt4S6FW+Q+pVfvnWhYI/Aml8gwbZRnnMouovko516RweLmcl0PNmQy75X
 8a8hHzKrmq9n8wWa+anMcuTdNX4YXMjgRILsEiuUaVLEz2PbxUcRjVsyO3yjLdmG8lwNImohj5p
 lU8lblx+dpgKKq6LdGtiqKBbciQ9Zp2iXfMqaiNkNyIGdlzIsH+r54p+7LWdt8MjW7ZxUNs9/U0
 SY+metMEW2Zh2Hw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=J5OnLQnS c=1 sm=1 tr=0 ts=696e0a2d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GnGDLHjXiqABGLigSj8A:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4OCBTYWx0ZWRfXyQjpJ/0DAZqK
 AZFscOW0B3OhLQshhdNn5FzCc8M7A/zmGd0pIljXiNCxiid1YLXxsx+WIof5ZML2LU/JQ7Dzy3G
 xXT0MV6k8sWDgy/2s8vfY7S/4M4NGqbyK7JgByTLBlp+3t7BSRWTU/NXarBKx0SlHsizrpDqsTj
 rYIeqfpYJdCLJuzOHyBxm1RxsJu0Su82FqWUDfoOFkXgrTSMlBYegRFnpTLRNXaT9DpL+7XWgX5
 P6MrtBCMi2BNX/YFGlpzjf8mKbx4cTIZDdPuJ3iGENRj16aeOrW3N57sF2v/yp3jvOZmOh0lGXd
 tMJKLs/SO66nxO1T60TIkN1nZ+jktlZwaVRMgUHEyuInDoO+iSUCZvVv7SAVQHIUWF7xVoPhDHr
 N8w3Plg+WMcVmRyex9XNhHxwgwcYg035gbkpzj7QZRQ9HNuK9gGbweIdaD0ArY39FwSpthYELLY
 GDY8jmu8mgSZQ1wUr0g==
X-Proofpoint-GUID: y8qVpE5bnofkKTBiNYO6hE_XyeyCVa3Q
X-Proofpoint-ORIG-GUID: y8qVpE5bnofkKTBiNYO6hE_XyeyCVa3Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_024046_287550_2BD7EA06 
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

Don't access of_root directly as it reduces the build test coverage for
this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
to retrieve the relevant information.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/sunxi/sunxi_mbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/sunxi/sunxi_mbus.c b/drivers/soc/sunxi/sunxi_mbus.c
index 1734da357ca21b249740e089698275507ea98a8a..8bc5f62ff258837d3f3b30cb84b60d1872b31c27 100644
--- a/drivers/soc/sunxi/sunxi_mbus.c
+++ b/drivers/soc/sunxi/sunxi_mbus.c
@@ -118,7 +118,7 @@ static const char * const sunxi_mbus_platforms[] __initconst = {
 
 static int __init sunxi_mbus_init(void)
 {
-	if (!of_device_compatible_match(of_root, sunxi_mbus_platforms))
+	if (!of_machine_compatible_match(sunxi_mbus_platforms))
 		return 0;
 
 	bus_register_notifier(&platform_bus_type, &sunxi_mbus_nb);

-- 
2.47.3


