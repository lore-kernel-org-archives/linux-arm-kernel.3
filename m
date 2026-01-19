Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E5CCCF2DF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 10:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0sZbZAxKd7p0LzWuDrHVogsgeIRXUiPb6BcSR/KxOek=; b=K9TLAk6arSuLRGoNnbn0g6186T
	plvbeFU2xGNpo3TvAPfwXFgmsPiTGPVqTDAl+xsNs7F2LdKwpqv9DflYkWoQnIaJ2nl6UgO/Q6hVY
	k+gcEfQ7Yfm9aT1zPlvQb1pBud5UIXwA7uGA1CuVkNPHBkWMrf1FdOnPxkC2vDMfp+VPLyCyFcNwN
	GT78YB4kLHYGiI+DeJFCk2/8T6ZYCNqXTs77VmPstW2XlZvPz30KRJEfAPpdDFToM/i465Bb5FFM/
	nG82dzFhsGSuOTx6MURGvtnWsurQXhRSbH3u1WY8IZpGVdYV1DbP5GiQWJmAdXdctmK8havJDA+Og
	ytkDfBrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmgi-00000001mv8-0TBw;
	Mon, 19 Jan 2026 10:40:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmgf-00000001msN-10DM
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 10:40:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0sZbZAxKd7p0LzWuDrHVogsgeIRXUiPb6BcSR/KxOek=; b=m1WZcW+IfGQWSqkBPHDdAgzF8C
	x3hNVejKe+Lvf1bv0QYrZdDZdlH5ZvQd2Px9nSka0GPMn5v10YGpyqeHC8Yg3jeunNCeA8hkZnsgg
	gmPKFHD0XLcQpOU7sr5cYIrjFy1aq3BoZ4xSmzPnvz/+4ZpoeRHK33S9D3i4VjNpMg7z8j5HLZzqk
	wSnnotBpdNm13JrDsV0029H8cvVFaiiC8yLk/U2mvE8o3hwzZKBJeA7EjA8aPh3HAX1AlgbTpVuSf
	g/CWcL1L9Dr/C2arz9xsLQSciZ6H75YHxi0JNWBeeqbiAEnN72BvILUmoP5q1h3/odDuzKGUXaW4z
	TrdsQiTQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmgc-0000000Bsbw-0EqF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 10:40:44 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J91Il0748419
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 10:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0sZbZAxKd7p0LzWuDrHVogsgeIRXUiPb6BcSR/KxOek=; b=iE7LBSpE6amQc8ar
	jiHLqt30gssaEF/bVw8IpwLRRv7qEAR91BTg9brjbk6dHDzjJfRtEF/D0AAiLtC2
	5hX2fPjPf5Q1ytEK5qTvKeVCfoMGt7SaXYBrqMdIH+ooQs1ChLVljYkQqG4VIGRO
	vH44x5S1QxdLtbHZ43SAnljrll0rrH7Y+xJMKpmh0+RHQnGqSL7SEoRsclvzBIxA
	k6jA9eBtwM95qqJoSh5hvRpBABZgqJTp9Fhvs/hRqGm/UB76LL0hBY87EDxe+K0z
	fYOD0onxyiouYRm5/hxXPAvH6zy89u4pse+n8AZo6QYWDdZ2JPm/bMC0N5ojxe03
	wCZcow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2t74qn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 10:40:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8bb9f029f31so1261070585a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 02:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819240; x=1769424040; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0sZbZAxKd7p0LzWuDrHVogsgeIRXUiPb6BcSR/KxOek=;
        b=ba26tgNb7wKBJmcKXwvAkif6jI0TveV1o3VLxUGiipF+5pKMMMT2cIkkXG8IRfbYCX
         lseAzXalNyYLhd15nBPFUT8e/asZdSG75VDU2a4/72C09fnDbB6aER4QhZd7cD0R5Hmg
         7TWhIpfaHrtHw2+P+/+ZERGn3sC7fggjzkQlclnj9O6LKxj/NQLzUq80f6e2sBfuUSzp
         zFJFHthSXjQDl54os+ubDujho9NXhvWjChUe0mdCvWLLKTXyCvXlSkXdCoUJStfYfLhz
         yRKpcBthP0NLH33yE8XWgdOVwjhu/o+5xAYGLHtyhbJhoy9dLb/3dhGLe9VrmzzhQ+Tt
         9cOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819240; x=1769424040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0sZbZAxKd7p0LzWuDrHVogsgeIRXUiPb6BcSR/KxOek=;
        b=ZjWan7NYdZI5G6y1tOG5UpoNuFR9qjLTjE4CCg0Chj3r6GddsHk8+TKAjBP0q/sZ2Q
         qJmhCib99qmjp0B6KIHPAGvQ4lEJlW8Pb1S4UGMXGTayNDgsnxiaKhiHiXr7MkUwLG1j
         Q2jupltlHJzZn5Vw0p18b+bgTFCjfAOhpRUHmu6Zn6sg9WVkF6/WZePOvTqn2C7/cMtZ
         zHX8bpwFyUJj97zSEw42MZsn9gzTXTbZ9+76ktu8Bt42xFHydxVkhPo9FeZOHOcLd3gk
         uF7QJlcW+fhjnTPyVZS13g/+mAFOZ5gw7LM9oK23himgkvSLSMhEXs5/SRE+9XoPw7YG
         BGcw==
X-Forwarded-Encrypted: i=1; AJvYcCU+7ZZhIQrlqypo3NK//xq611Y19P9eAN+o8DmFsRnAQPaMoz3vSQGCpOdJCnTt4AyixOXokjYgdZETEBW6i45n@lists.infradead.org
X-Gm-Message-State: AOJu0YwEVvr9UEci0bqmT5eE/Ex1gmo7BXFhSufiSG+AuwUXef+e58SY
	wTwVG0kD1t+DxbBTogr5pmuUm75wq+4jKRyjl2+PNndsbiIGabruKvhiQgobwyiBQHqmyn7VuGX
	QqkdxKFoCvHG4mc8ZO7SlMiCz62bm4iF3pWsl9dMi1SNyEccxQSBtBlKZLC8vkChlFFvi8UwFZW
	/R8A==
X-Gm-Gg: AY/fxX6Z2SQ+x4uR0Vm1QqgeIMVyKBdrImdl2hUMCzhpDmCvoj8+fdPLHaGJpE0zxZN
	toHnkzq26z5eeEyyYYWiInR4BveoHZzFmzXeRvmGtZ4j6opadXBO5MOxygD9JdSVLjau0WWfiZP
	7pMnoAepfMG3QH4kKiUynOhmLAhMEOiQhe3KI3rki/RZrQUJDPG4w9bEzsI8NE8qBCh8Q6tKuRb
	P/90366x7hcPg5H1D5CE6/vSUoxgWGQNHg+0S6i8NWv0raNbSFlO8/biwesLUTvckt3cM4fpmkj
	NNxbuPbUA4zqI4LQiBDgjti2i45UZCDlWywi0AvYP53tpy9RJ/dESA563Et8BDNY1cGUsdbt9hx
	Tz9Ja2wUDUzooKUUyqnw2NAj3VqAjCo2ElO5pw277
X-Received: by 2002:a05:620a:44cc:b0:8c5:3415:acef with SMTP id af79cd13be357-8c6a678e79emr1325085385a.55.1768819239733;
        Mon, 19 Jan 2026 02:40:39 -0800 (PST)
X-Received: by 2002:a05:620a:44cc:b0:8c5:3415:acef with SMTP id af79cd13be357-8c6a678e79emr1325084185a.55.1768819239288;
        Mon, 19 Jan 2026 02:40:39 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm185185245e9.12.2026.01.19.02.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:40:38 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:40:16 +0100
Subject: [PATCH 5/8] soc: imx8m: don't access of_root directly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-soc-of-root-v1-5-32a0fa9a78b4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1811;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gSSXjbon2ZASCpjtfLFN1xl2k0rbvEgubK+ypiMfNAM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpbgoZ6/tFfNkSY0GLr/XdLYcw2kMLXLPjKjRzP
 XZ+QTLLN2SJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaW4KGQAKCRAFnS7L/zaE
 w21vEACSpoI0dRf9LOVGg6WzmVElZik9pD0oSo8OINntnyjEajlS4xcMHsKFLGnOaJVjwTvCE0D
 WE7jKkM+kIJE9SAahNxJJW0sfe5PHeeJ8b8Y7t+h2+Ep6U8dWNQygw6zkqGZsZrTurg6e83TK/O
 Qdw/eB0T9g5Y9QHmAN0yY/SUG20XCb6qlZ07150Aj4ZisW/KeQEWVaxzkSoQ9OCferh0bcyLLLo
 SdUsxsAFRynk1/tuxNkSs6xc5Kr6zZCDauKYeqRdXAbZliKDlm3CQEar1q270fYfOnh/UZsz1kX
 K0atU01JTCgQgZpviyvgySSqyp2djHwmiFFlzBtVDoH0H89xw86RO7MfYTcJKdlIFxWpvo7AK8G
 lWrzbrNeZPZLR+Si5albdiXZtop4+OCuEEO/GcIP/8eihf2EUwTwk1/cS664OooHL2VXAbute6N
 nksZwcxs6FlW5e0l1Wy4KlSZMR9qB3QMnxpXrdvIiNOYSo00O9RHaZYDMAYb9I4f9tKZDGSEyBF
 QUeXR+BInkIvNqw5FagKBy4Mc+tktceDeHtC6aHPnjVgmLRzMDpqvaqBdPoUiWHyZWx+HJ+DF5A
 zb5Yx4jFe9IgxU7KA+l+14Ox5Q8OtuPJJCz3n9QBCpLQWHWqW6ZWfSpJbMN5Y6VgIhQC1mEgyzF
 /jfgYN6e4M/P2gA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Fdc6BZ+6 c=1 sm=1 tr=0 ts=696e0a28 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=q31YqNcWydnNWZc8Rm4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: mvTLVxKca_j5VZudFDgDeF2C9d4ETh4X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4NiBTYWx0ZWRfX+gwFFAkHwgjT
 RjHcbUFDkaFWBlxVyjyD7H+2DDe62a428TfAfb8/MRHLIl2WmoItVnFsFNAyS34V0KXCeoOjdPY
 MMoA1bTrE757Ck+xXZrVtGKdVbMXdpjOl/lyglixGDnWUfHI6ZfJtoUoYAbpoNBE8MgDqGrJAwM
 2MpY6f/8BgtGHPXnFs2o4C+sU6B0m+XMCbujoU4tj0YAF5vAXyAmzf5fpSTfC+B/CTs17TU24c1
 LE3+gCZNKE88gsaP7XKWRS2jjsJi7OAJ2QZtDci/muhL4po4Iypj1xUnlSvW+3CjWm7iUaYauLT
 hhItM1OK9AnLPUIhpAwiVcUhnw8lP0AsdvTArpQDygY64P0vuGrtKTYwoKZKPdfebFqG44g8AaH
 A0IMLkb2oozWQBYLxxW3HhvhIp3VbhPBvQKMwf/ASloKTTS3bfrPSL12ZkQ+y0k3Z3Y/5VYrgu4
 lxy1nN/gpXXp8WiWb9g==
X-Proofpoint-GUID: mvTLVxKca_j5VZudFDgDeF2C9d4ETh4X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_104042_458709_E605C465 
X-CRM114-Status: GOOD (  17.86  )
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
 drivers/soc/imx/soc-imx8m.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
index 04a1b60f2f2b52cc374714f9a1205496c1762f39..925a9aed756103a5a74d5d840b54a2179cd78061 100644
--- a/drivers/soc/imx/soc-imx8m.c
+++ b/drivers/soc/imx/soc-imx8m.c
@@ -222,7 +222,6 @@ static int imx8m_soc_probe(struct platform_device *pdev)
 	const struct imx8_soc_data *data;
 	struct imx8_soc_drvdata *drvdata;
 	struct device *dev = &pdev->dev;
-	const struct of_device_id *id;
 	struct soc_device *soc_dev;
 	u32 soc_rev = 0;
 	u64 soc_uid[2] = {0, 0};
@@ -240,15 +239,11 @@ static int imx8m_soc_probe(struct platform_device *pdev)
 
 	soc_dev_attr->family = "Freescale i.MX";
 
-	ret = of_property_read_string(of_root, "model", &soc_dev_attr->machine);
+	ret = soc_device_get_machine(soc_dev_attr);
 	if (ret)
 		return ret;
 
-	id = of_match_node(imx8_soc_match, of_root);
-	if (!id)
-		return -ENODEV;
-
-	data = id->data;
+	data = device_get_match_data(dev);
 	if (data) {
 		soc_dev_attr->soc_id = data->name;
 		ret = imx8m_soc_prepare(pdev, data->ocotp_compatible);
@@ -322,7 +317,7 @@ static int __init imx8_soc_init(void)
 	int ret;
 
 	/* No match means this is non-i.MX8M hardware, do nothing. */
-	if (!of_match_node(imx8_soc_match, of_root))
+	if (!of_machine_device_match(imx8_soc_match))
 		return 0;
 
 	ret = platform_driver_register(&imx8m_soc_driver);

-- 
2.47.3


