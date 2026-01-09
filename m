Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823A1D26D6F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 16:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pS94iKUZ1ZfNhKbyBy+xUgSm1zdImwT1//knkyqK6zM=; b=zZtW7oOqJgHOFQ11NK6GZpci2Z
	YRnSFVSLiSfsurwTVOtM6TzZPTEH6gFSOnMuQHmM5v42m+g3nKOyW7AxBIKXOVscgj/HLvjSs8Dab
	pqxqxaFbo5U3WQEIArFvo1KsFjoe5yQ7sAC3cqk9JszDHUiMcX8LTxGK2jQfoIu/u9xpYdciM/IqR
	mGW+JeaZ+YJ33d1EXM2Zo4OretuZHKnhwJ5atYhL+czO+DnvW4tVCSoUoUKfIEfFI+f23bqmAOPo0
	5diYFhg89sLC+HB95PpdStOwYKlFAd0i8QVZzo80jLKtPw6RJDCoh2RJgVFGQnrNvIwLXPtNcjriw
	SusN3bGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFok-00000002feF-2KrL;
	Fri, 09 Jan 2026 16:58:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFoh-00000002faB-17wY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 16:58:29 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6099XaD01047578
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Jan 2026 16:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pS94iKUZ1ZfNhKbyBy+xUgSm1zdImwT1//knkyqK6zM=; b=HLLk73qHKf0AEcm3
	ZjzclVmLeQ0/Ah6IGmE38mGb8WeT7jkmCfgh3Qhq7o7iAMC9TMWTvb/v3TfrkoWm
	rTJHj7cFsKnO7AOfejr9gYB4KoyZh8Q8/AP83uWDcREQRbmXggFdKDH7zHksGjIY
	+346youzmL0/w61L1v0BhkvOYwxSoMWwS6zZvE7WA5o8HqVR0ADPaoutLXKO6Qdg
	cnWCF72VIPRVdRwKLf6roz8zagjxDXW0ilwhrt0cEhupDMoPd9gEEZnmVLYOqHmH
	sNtKvWEEP3xrXM37MwdtQRa0KoAjjtzu+dk6iIKy2JqYcShpU4Bqo4/T0xw8AQHE
	RMWEJw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjy5b97a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 16:58:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c1cffa1f2dso878370585a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 08:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977906; x=1768582706; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pS94iKUZ1ZfNhKbyBy+xUgSm1zdImwT1//knkyqK6zM=;
        b=JhWb8yUixbPMorDn6w9NexLhg73cWKHsiMj3sbM8hal4UXemfDtz1HoPwVXyoLwq9L
         GYNfnT8nGrhcyVZHYSo/+x6t8zstzxxJYRJwQMGZqO6qRBNVhevzJCfX25Lc9SvEtWL7
         8hFJlCVV0zP8vFAwoT0otykzPIvr0KI3irM9TCY7JIxIoXeRNWeKyOWiVhUOeYfssXfb
         k7g6sMBzr03Zz0eeFc2DRXeWY81xKcgOs6tnFj8rG87qAk165N4peGk1FjbalZtdXecV
         LmMceX7AkmLWTSLbbF8UgPj51kbA2yKBEYQA8SEKoJh/NDSzl2NcUFHvvi4TjefErf6z
         VUhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977906; x=1768582706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pS94iKUZ1ZfNhKbyBy+xUgSm1zdImwT1//knkyqK6zM=;
        b=YXTR8Dcx/f9dInOMymYKbv1FcaD0S/ollt9y/2VtxsMw1eHbxICbObFAnXg7LWUvs3
         cDLpg2kUisNIbJzMKGgJTKMfl3Ozx6cXfK4zWSTj6/CFYkbJa1OxCQ7HllM8nSLAgS63
         dPx+ScQCgl3qo542Aoao/xwJKWsy+zMLMxwl98jx8VNO0AP+0kCSr93SHEQK6ATcx5ZQ
         Jy0nMS+Jf1Tth6vErJBMzDIjM0iK60MjDLFaAssrlsUPKsVTDIncLJFpO1Ojk+CnrHRR
         Jvoxetmmm12eUSVo1C5ShpmDyiB0QEcSb89sCn0WPLuH8t6jhEcAqXaQaHC2Jszl0VCQ
         Qr7A==
X-Forwarded-Encrypted: i=1; AJvYcCXtnRGVDHLU/D99+5GcWxJL+Dwds4L8nvYoC3TaZwanJwwbo/AnxTzgxJ3gXjDgyf9I4Cv/QMPqE50wkMvc8ZQ7@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3EvIPXyzyOUjMdGTwIy5HPA6NO0lxzIsTaIErHiJXlHfarHE+
	IC1wsvRocwfdQQGc74uw8kDJGd3PLF35aIZOc3HHw2a2AAb5NjeNku4Vlmw6wPTGCYsN7Lse7H1
	sYu85PwaT1s5wGEraAyGodABN109Frl8YjmErej/2H3PTIFMp/2POPz1zsQdUX8jilv8i1fjfCm
	gq0g==
X-Gm-Gg: AY/fxX4VQAIlV3s9/HnkP3W+BZ6kzmjUCr1ExmAfhA5vVKrZPEEHQh3cbmrtVjuXW9E
	awl+4/5i0LmoeRLB+2RE14TDlblU6/FGSn+waLDDKbIx4g2gO61BphqQNm8QYDwNhUhgX12CimO
	h/Zs14nzSzNeDRosCyRAvtO9LC71DOXWrYnh1GBrfHnd1UfCxohmWYDRU3RgB6B/2fkAD/vSY0Y
	X9dEUX+b+ljecVVQM2tG59XePIQfb12p1BMrmlNMT8cZVzFkJvGLf69IID0768ed4REx1Gwlnz4
	Pbi8qF+a55FfYmbsfyiAxVTvLwRVRQUin8/j8bImLl9xDlEqe52e7myY78ULgDvFqSopaOyHZSo
	QUTjHp1dwQyifT+qFbC5jTs5GwyCShmI+Ig==
X-Received: by 2002:a05:620a:4508:b0:8b2:e3c1:24b7 with SMTP id af79cd13be357-8c37f535f19mr1820074085a.29.1767977905769;
        Fri, 09 Jan 2026 08:58:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsfjFGqbAxLc23gcdJYsriEigu5ohevlkCtmB7A0Yd5kZaYg4F8i/gp5IEYHwuSzY4tC8AiA==
X-Received: by 2002:a05:620a:4508:b0:8b2:e3c1:24b7 with SMTP id af79cd13be357-8c37f535f19mr1820067085a.29.1767977905236;
        Fri, 09 Jan 2026 08:58:25 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:57:51 +0100
Subject: [PATCH v3 07/12] cdx: Use mutex guard to simplify error handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-of-for-each-compatible-scoped-v3-7-c22fa2c0749a@oss.qualcomm.com>
References: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
In-Reply-To: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
To: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1439;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=X+rJqgWZb7AzM0cu+pmQcyBAFnuuYCBdFr+ESsAnRIM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpYTOWTG2xT0pRpBkG2Oxza7snBRuC4VjYU3M/U
 qAWA101mfyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWEzlgAKCRDBN2bmhouD
 1z25D/43t1RnWOYzf6VK4emya2IvUXE4PE2KamRZbdrtRYUt33wpN5FW/mIaskpIim+yLl4Mz57
 Q99PnqT67OgRKNWb5vmCgdvzae2SWBlxdKcnNPQnlosJLQrzfUCiZ0JDB1SUJRi7Gkkt2EYH1FR
 ABmiT4JE4sfEYLpZYwp0xtuNfjNRa3KTkJMP5pE3gHAfHHfmLaw0FImBWZKPPa3vPfJ9G7c0WtP
 i68ZQ7BIm5bYdiwMB3H6oYmovINgnOafL8vV1vuCxpCEg2a4L931KEMc+hmHQE4vPjpr5MoZOV1
 6NrLnPJTqdu1x0qXBS0iyPV5wNigBxrB23X+AAecmDUiNNDKSRa432oGjKMxmqRcVlyehngW8qv
 kryEBlWuLwaUiwOBxco/J6hgP6KeFL10P9udg8CAfutYUMxVAoU3ZDhNEZjIzZ7B+TR5yUjG3Am
 kKEusMDjK0bNXrAVkFkmYgSddWZK9KeNtqGe1jaKsr/WnyFFbNIyY3FjjqitFE6wg3fZSGLnnPM
 HluYuCBYQrTbNLEw021XbRsgnYSjh2j3tHlJWE8ajcwk8qzdhuugpcOFQ6ADF70mVzyRdFMSIbL
 YMdfyfOEGuzc1cFMbv7kIwtnmyv5mpgwGMlBRVfqlb8udSpwuJ09qezcbQ169bmtQve+3z3ZGHc
 gkOPygD7XBxOF/A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: MQ_6E6zWUB9Di87l9zUqi3H3OG2iHPO5
X-Authority-Analysis: v=2.4 cv=JP42csKb c=1 sm=1 tr=0 ts=696133b2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8
 a=HFiHojuE27rTourpOroA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfX+DN4dy21TFB9
 j7fAZ3r+GxM1Y2rMd/bvJKKcdaEEvkwtjHaY+Ipia9QuubS9c/fQ/DP0rdxYzLahE/TaFYFnfKj
 bHviHuITt7O7make55OENTt+M9et2pBRZue/0dwQvw+ZJ2ora3Ys2esbbClmD1WaVbZx216VSIU
 inaXzyMCkUiOA0Q9/2LbdgkZJytnMTaR4ZvGYH231PRgbuvD1OkCHMZlkoxjsAY1gY30caYzsrL
 aY4FqDTfZ8zjHsazwxA1VE4SnX80JFR7JncLzdBSRnyyCHT6oUUWOKV5Q1PwnsA9E6eAFvM65RP
 5O9iM/qPounlMho32Kim+32CnSCFGU2z2Gl09HJvb0zUHrgV4bo6wf07B0j49WkWFa1h7bpArhh
 SZCHcl2ByaV3YUGrJdlP7W4KqIfTFZWe37nJFaeTOotasqbjNCNektZ29fNlcgQ6otfHG3cdJ5b
 6XRWRZee2curlu6wjgw==
X-Proofpoint-GUID: MQ_6E6zWUB9Di87l9zUqi3H3OG2iHPO5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_085827_436344_0C86CEBB 
X-CRM114-Status: GOOD (  16.68  )
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

Mutex guard allows to drop one goto/break in error handling and the
less expected code of assigning -EINVAL to unsigned size_t count
variable.

Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/cdx/cdx.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/cdx/cdx.c b/drivers/cdx/cdx.c
index bbde529aaa93..588dd12e8105 100644
--- a/drivers/cdx/cdx.c
+++ b/drivers/cdx/cdx.c
@@ -616,7 +616,7 @@ static ssize_t rescan_store(const struct bus_type *bus,
 	if (!val)
 		return -EINVAL;
 
-	mutex_lock(&cdx_controller_lock);
+	guard(mutex)(&cdx_controller_lock);
 
 	/* Unregister all the devices on the bus */
 	cdx_unregister_devices(&cdx_bus_type);
@@ -624,10 +624,8 @@ static ssize_t rescan_store(const struct bus_type *bus,
 	/* Rescan all the devices */
 	for_each_compatible_node_scoped(np, NULL, compat_node_name) {
 		pd = of_find_device_by_node(np);
-		if (!pd) {
-			count = -EINVAL;
-			goto unlock;
-		}
+		if (!pd)
+			return -EINVAL;
 
 		cdx = platform_get_drvdata(pd);
 		if (cdx && cdx->controller_registered && cdx->ops->scan)
@@ -636,9 +634,6 @@ static ssize_t rescan_store(const struct bus_type *bus,
 		put_device(&pd->dev);
 	}
 
-unlock:
-	mutex_unlock(&cdx_controller_lock);
-
 	return count;
 }
 static BUS_ATTR_WO(rescan);

-- 
2.51.0


