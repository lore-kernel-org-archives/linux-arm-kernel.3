Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97778EA4FBE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 13:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHxPv6I4Z6dO3Hj6uV42QIGX3GK7K4BGPsWpNavZvBk=; b=CJA1c2s352Xy/ef2hNNHAeLi7d
	PJ2H/zXb1KUNW9bNksczlDdpv9UUFwKRkYM2CzXFJi/hXZ2FTs7SCWeohXTQrC4GV0WFIE5o6olZF
	BbzGv7F4SgPLUGZIx3Z7dFFRLmAbokfzcKELTd/dYYArKuLTolAG0s546bDDDAR3Rk3mMlyduCoSo
	DEvunSzQpUMZ6U3owOBOSZMfWijxqv0UxOOg1SrzHovWGn+rhQt/YIAg+2IIDvZg1JdyPKwce5RLn
	tl0TObbqHrH6vaFDHERTf2UWG4ZABCeKkfNOd2cFdOpY8hF4BiTIgzS8uKy6s8cuCOhjre4rony2x
	5igDlCIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuW8a-00000000NpL-1qwv;
	Mon, 23 Feb 2026 13:38:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuW8S-00000000NgC-3Dz5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 13:38:06 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAWehJ3698102
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 13:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nHxPv6I4Z6dO3Hj6uV42QIGX3GK7K4BGPsWpNavZvBk=; b=PlxMz/CRZi+cXbvz
	hmTnU9cezQpHsZ1BcWGZMSnsX9VVcbOyrAG2y3dXhwwbBUa4A3KqDiJWrSkNkuGl
	QKS/K/sHo7ZDjrP0Li77lnLvmPDrTPRP7rrYWxExqDwNrP35wWqRc8HK6AHXtnFx
	tModpZVK3yjPTfFfurVauIwIA1IPDzK90YsqjlHQd+c/IuVttP55nql3MIYaj+40
	5vmzmgQ8yCa8+ZQOLL0Bat+ytPGOayi5kJB1bp+5vyEf7ECaU5tzNMBnOpmbDnhh
	zM77SAHIBjufLAIZ8iI99y4vki0r1Nz7lONXStJsAruaQZh6ixYlXe+SFASGpw5I
	0sXFpg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn818fjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 13:38:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71500f274so488005585a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 05:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853883; x=1772458683; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nHxPv6I4Z6dO3Hj6uV42QIGX3GK7K4BGPsWpNavZvBk=;
        b=iFErHY1OfofAaYG0FuSB/3G6S5dXEKV2MVBpcercSEJAnWm7276xwQk/mJV3gv1i/i
         AqE+xIbHmpWIPL2QgXlxeg+08OMscW9zcEj3DxMTZg9ZI/nGt6ZFyVj826MtfAfAobDT
         FlzEn3XYiLOONIrOwp7QuPQEYvPYAwFiYZb1Tqwe+ZdjOvHlPlV22FLE53VnQFOcqqCa
         spuNTgKWr818Zt5gg3S2vnbj5GugMCWXKxHUyGngvlwU0yycezm44d/KVKUQcktukq1F
         PHCEcmTl8sI/UUEbwbsrj4hOhZNpB1wb6uFQtE/o9EN0ItHbRDRsVu+Xo2+Oxv6sjr86
         9BRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853883; x=1772458683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nHxPv6I4Z6dO3Hj6uV42QIGX3GK7K4BGPsWpNavZvBk=;
        b=BreF54X7ucHAlv3qhiNGfSpgvXOJKKJ1VNBbo3x5HZeXPTlISWPZphNZwFzs/TkxCt
         RZ1FnNprOEJWunAn5crxYBjWH7AFGiOQt0kCg4QryCOPrEOQnVWFK7ZTVcg9/rOZx+y8
         NYg3U/Av76W2RYamswxutOgigp94zUKc+XO2sCBw7PL3MLmI6nIf7GOvCjfXKbKKbxvv
         7IaxHyenWIWgawZ09HRY/F968O/AN7Wdm7+f8vwjY2lABwTCXMDYexPnm3qPr1nQ1m/A
         6OnVMuSbDTJKZa2VjUn/NqBla6TDBSmBq9HOx65EqpoSLtpB48MCiBUx/+nKCGNlHB3A
         NhQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLsLPGOjcxPuYtPwdM082FsqETRg63oXClf7ivvb39HgTT9ACA+6Jk95RPTi/QLTfQydJzB3YedH/Ma/V3GNBS@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf/3lBVB39VSsFqG3QEDJ+iRwyOj3JnyeB7doa0cGsV074d2sg
	GKA/QvLRAPSQuxVO19OkozgpehlJNm9ucrf1kRCqp38gkV0Hz2P1ZeQtwsZR4ywb0Pn/EOD6F8U
	01SXBNFY1hwEwG1Vfgx2UHoFDIdM9JwCYNXFqpVEkdftRYX4SB5cIp3Pwg+XwCYY2ipVvIb4m7E
	Dr8w==
X-Gm-Gg: AZuq6aKd5kWCRIOa1ceMjvSRpQdKF1ztbEui7GuUYRHJ13OPmK5/7jsoV05SkF/HeXc
	45ZsmZqXfHskgoxVD+/XLftmSEPT/svH12bi/Gimo0z2MX5735GiRGWuUBSCSUJ35NZ8kY7MSC2
	Zpkf/xOqTDZp9MWcL5o8Jbc6/kZnlvB7iNoIJEfKbzoKByp/R4GMLxawrOviO3Pv7f6YeqExUsj
	I4c1YrvsKP9tCCL8jNkrgSTFhpATvSPlhg02+oG/pO3eXeuSFmNBTGrcWLY9wb5tAVxzQ8y/Py+
	fHajjA2HoPHldpoMp+2e3ifDaauaxUgB6ms+RxF8YRumt3gWq8hk9MCKodyWV3VnKihe2rRdP6Y
	1lTXGQG9x3dmy8VN2N2trGdmsB7W0rapO+TqQ5QMt5ATe18YQoEA=
X-Received: by 2002:a05:620a:7082:b0:8c7:f55:2062 with SMTP id af79cd13be357-8cb8ca82021mr971548885a.61.1771853883010;
        Mon, 23 Feb 2026 05:38:03 -0800 (PST)
X-Received: by 2002:a05:620a:7082:b0:8c7:f55:2062 with SMTP id af79cd13be357-8cb8ca82021mr971544385a.61.1771853882505;
        Mon, 23 Feb 2026 05:38:02 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:38:01 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:24 +0100
Subject: [PATCH v2 9/9] soc: sunxi: mbus: don't access of_root directly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-soc-of-root-v2-9-b45da45903c8@oss.qualcomm.com>
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
In-Reply-To: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
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
        Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1061;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1c1gquLfvSJ+JW0V9LV0gRBtqRjxxuGL6ryTeiQhipc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFgircAU+0jsrAZZ/Aj6LcHzqbHGAS/DFEYZi
 t34Eup2YjSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYIgAKCRAFnS7L/zaE
 wxcPD/47w3hJqf6FKWPzlvr9S86ReIdYy2gUPFLRaYv1Orw7Hx4Mu5VCL3/KMAaPpiCzFahyo9Y
 S0OUQIgsb1kqb7HIj2+UxTES2J22WsLFYkRYulcQij6J/QljIy0cbcn0uAydjmdb6VuQOawjh10
 FnYXW4+Ib3q6Ce98AoC/U1sqR36/lA78aqRwfswkLIVIhwgq9ERvUXZ0F/h2y/8wkYrbfKG+WCN
 4VlGIAm20rPkLeDtPLAqp1Dcy68aNnI1OLqZ/KsYm9FnrOLtaNxduEseaaxwc8bhbyTtfmjYATL
 EoHz8ee2gD6S7XCtTw3SnuW4Ky64+giBafa0XfNBpPxKAawFQCKd8XByhDvXVlwRdQikXetq0ZA
 k1u8bp6vufJQXZLgmKBXQ6Y3zfD/vgMD5ptFcZr2yn1frat/EBwcg/JBtnoLQPB32Qbk3PmdGhA
 lNFBV7VYN/yATKm2UOsdZH6vEHm2PpcEsINOBkjcwQRrElzKw78vx2mCVTVyBZW8bTWsjBI7ezk
 7WQr8RJ7fsrPuYLcICCUuDTD3QnT4F+TLDnvFX5AAnnPuPJKX/o7ctAdnVJrTMS+wXIkI6pmqdx
 oNi1zzx0nOQy0/iZYV7/+R8P9uqzqXpWIofRAhYkeXQi3fatpIXd82aahNqjbXS4yNa4bMXD7br
 keRpg4pplWqyjpg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: j7wclz9LSFyfmsjjXTDCzPU7pAwV0H_-
X-Proofpoint-ORIG-GUID: j7wclz9LSFyfmsjjXTDCzPU7pAwV0H_-
X-Authority-Analysis: v=2.4 cv=CbsFJbrl c=1 sm=1 tr=0 ts=699c583b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=hcp4X6t0sg7LPBOUZMsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX2Z58+H72tdvh
 XBKlu66AR+AXWING6YMQdohbeBpkg1UGp19yqJrAhGV60TR6wR5Cshp65Mn2JxI0fFViun1Q66M
 kvm9rX8XWgGZZ+j22RF0uh5bxFEDmerUmHz9Ssdw4Jw5ncq6EYmw4gwj3ECm0eRn3TBNDva6H6P
 XBSvkYltUtYNgqsgqHNjlsKxjS1Fp3dpmBw51ovJ2uvEL9LB8NyPBUzB1r6SN0qd8sq14vptAmq
 Et2ljNgVaxL6lOde5K6wT84K4j8yj0fem09uvjIEmgZu9SMlfwigXSV2bxoW+9Heh+hPRkUOp0F
 UdCFIBiDcgJgIBipmnDEgHBIzO3JnIb2LQTCMbHaBVGIQqiGpTqTX+BUS9I4KGoIvoua53SepPI
 DKVhWn5jA6LyplIrsXucaxAJD8cpQs0beIfVQcFBfOWpCS1b3ar7y4sTIrhyktC6H5cSuvixs/y
 lgKUHAulHsbjA0+8gkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_053804_988066_53A62F7D 
X-CRM114-Status: GOOD (  16.13  )
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
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
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


