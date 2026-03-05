Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF71F513E1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 21:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMdwalXJEavN6LV6CAE/53Eqg9eopdoniYo4PZb2D4c=; b=wQNengvzcXreIKtuIKpvAdoDQr
	PyQeTW8ESYqLXd+mGoRuHfbEmgTpIjAttClylKXvqmDBCt4jd/nAWFgyL+dnf/p+SARvgnxn3y26h
	R4xUEru4Xs8YsCk74Q3HOhmlCKgyK6ZGsopTzOJoRnexJWGVK7A1dI5dETch8hN+0pKenguc5lD3D
	54l4Uq4YV3LAYJrY0kEjK/zAannSduPgCrv16ddyu2uT9T7zGXjY7FZh99gJ6HZeC4ZCOqGKLEMgp
	Fi0Zzt/Jr7E50NcYdLZGOM7FOfcU8yMz/4DURGCu8dGLniVa84CVMViN9MChAkzirzWhf+FbZ4xEj
	v+LE9HNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGWf-00000002bGY-1GX1;
	Thu, 05 Mar 2026 21:46:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGWa-00000002bAF-2JO1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 21:46:29 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625KmghA1802873
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 21:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pMdwalXJEavN6LV6CAE/53Eqg9eopdoniYo4PZb2D4c=; b=hsF3iFgZR3eFh6Ua
	8327APE3WHi8P+d6fNwAgOeZkBA7nU/f46nx0tJOzdK+dQl1mUb1mq1x+YiANJp0
	I1GuI4e/GaoeDdjwQb+St9rfI9y7MqWyBz4m5Zwmi6XUFeS/TwygmH++HSfneFeu
	xS/LQxdbaLeNZDvra23uALJ4t6q/5eQIIrxKq93g/I6j+0Cji+dm+0N7fr6xzTiK
	RNL3FSlM0VhToCUb5dUT0iKFOb6lqFDhv8glQwvmkyXyFgj2RHeC8McMjhTvQ3ar
	M+dNBv0iH6X1ejSPi+62L2hrLHgOQYxx9kKdsHP1E3gdJflQnXe09MMvi5DxJJbm
	OzwKJQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq9srhtkc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 21:46:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70e610242so1804040185a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 13:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772747187; x=1773351987; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pMdwalXJEavN6LV6CAE/53Eqg9eopdoniYo4PZb2D4c=;
        b=AqeJRsG+Omkx4wRPkMo1jMh9PjwdNlCnbmo2p6A/XP6AmcU2A4jmxfO4VJ9PAcSK4W
         2fa+lncyelLHayEcGQJAkxcNmM4QfphD135KG2U7J+f0rq0Fj3wJZ9EEeOhtOaaAW8UT
         HxJ9J/0+jMtwtVYbkfzz8G0oK1EY8lbFDSpUtyws/fGPROzjrsJ8KH7UEwZPxR0vB4Vx
         Q6pfTNSKbLT99Sa5/LldN++O0QDMq53yum0zjZkuOBGALDxxzdM9bEZu85nOgcMUKvzC
         kmG83ekW6TQzfVgvsRVKTKYVLRrTlzDEzqIkhRjBSpvb/lxXYnDSU6fMQ1m0VyayIwds
         bFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772747187; x=1773351987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pMdwalXJEavN6LV6CAE/53Eqg9eopdoniYo4PZb2D4c=;
        b=QKCb9GSR+RtYVGcjv2XOVIwmWUwXgYf8N9NWu68dI1dv3LsXisBl6p9WQ0+V1K5Nz7
         o3zfN9lx+Fsi30hCStuUvpuB7sM3tc3BuT9pUHOZRceVit2jh93ZkmYwcH+qa8seIWmT
         Gj4I1xTp48M0+QAfbUuoc2QxTenVYUcmBs9Uo7BxSUoNDOsPa4wZ0AOw6OZk5bripyZQ
         2gD2mPcWuqvdM4V1hAF8bPE3zG8KvoP7BWu8PZH4YDd9XTs89Kmkb/VuE+CTRk1PeI67
         tWL49HQqt65XkvOd7XFZwCN3XKN3LDHF/UdstkEAeJxHZsfFO2Vp77Ms63ojrMwvma5I
         yB2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUuS6fbC9l+Blu93rVY3ZdbUPeWZ3UspoSD1qr9qQeyaqAv6jIT9DRdP6HMrPoVIIHQdUAlo6hMCAIiFS3qPs1Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/+W+vtsXvWIsf4Bzf/fdh3ly6bF2JZgjA56dpzKPA8PjhZIOv
	zGd+PocYD3NrAKOZFAYCYmf7+tC0VlZTtYfnqdcwZMJYWVMoqhkosPf3fVQHFRD7oo5mAmNTe4y
	z12ZHHHtNojA6yMdVvIJNW0PRfMew28udKrS1AkQ6fxSD9fEo+l7WWqS77xylh1J5mDe7myHYnA
	c2yA==
X-Gm-Gg: ATEYQzyCyAHfS8udt/O3E4kQPZ+OLfhl2XPuZZpPAPqt+bhLGOCy+jEBEsiXtTECta2
	fTyaCtBT+3ULhAwLLUWSRxbY57u3DB+sGz+tI1qr1zDVzJgu7FWalsLXRaJpI43fmhg7d5G3rUi
	bwgfKknLx2RE7YtScc8E41OOjHkKSSNnTOVawbTo5hdND5BuFGru0QPy/1QJBqCaz2jm6/lOmk8
	vZOupypBFqjNCQ+HdAdV8P0D+LNqjOar6WDMlB3jGBtOFdfmix9ldd12W9N2ENccTabzlLwjLaT
	6wGBxx691HyYRh71uBOrjQkoi9RUpLUS1lIBAv8/9+nRbfvbnN1jCyx/HGC3KTg3Zyi07Wh69kQ
	Hcz4mNBnzdknMs5zY9ClFE+PJrsO2AvwYQB413gCZhXxg
X-Received: by 2002:a05:620a:4482:b0:8b2:37ff:de74 with SMTP id af79cd13be357-8cd6d3ab314mr5796085a.34.1772747186552;
        Thu, 05 Mar 2026 13:46:26 -0800 (PST)
X-Received: by 2002:a05:620a:4482:b0:8b2:37ff:de74 with SMTP id af79cd13be357-8cd6d3ab314mr5793685a.34.1772747186093;
        Thu, 05 Mar 2026 13:46:26 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm28571575f8f.27.2026.03.05.13.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:46:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 22:45:44 +0100
Subject: [PATCH v2 05/10] power: supply: mt6370: Simplify with
 devm_alloc_ordered_workqueue()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-workqueue-devm-v2-5-66a38741c652@oss.qualcomm.com>
References: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
In-Reply-To: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1981;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NEUpXBPJ9dEtS2fWmU+0dR2QDjspzcgcqiZEmv2uSmU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqfmcNn3k3Rnw/2EcuO2yaMfih5Vsn0i/XXJf8
 SvINHHZXpmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaan5nAAKCRDBN2bmhouD
 136hD/9ALKD9SvFh/azG10v3UDLkpNlFun8cFPxOsqHfB7d5jt0wLAMJR5OL/G0gbo4oAOx3rZz
 T8YEb9fJN8jqmiPiXHZV46OJ6MX4FJxGF3ko3W56lIhjR/GbgdkU4oZZOUDfJjhKmjm52JL4uri
 Ety79GYKI8agwE1+zQxflWbPZ0ACvbgpu/gSfA1+uImrdNmJrXxnGczTKSzc6/cwKvrfFhRITfK
 qugeeHB6FJX98OI7B0/y5V/PxLS6HhXfQb28TXxpfHaQi2Z6At+ql1/SaeFX33rIq4NSlV1Z17x
 2AQUKGzGhYSQBFE9p/BHznlYMN4+YUsSpkilQJq1FLg50apjcVXWhbRdDTU/QlgGwiy/qn849+R
 bTeGbErLTERXzbcUgA0JDy01bNziJyp3zcwACGBgVCoc7HyfY1C+ZrrXs55ou4ZUTH74eX8e/75
 Bsj6LEgkgws/j26GPyEqX0tUEoKn4KYjr5vjMPiT3B4CjRnm2EIMQA+hd3eVIDLEF1Gx73S//O7
 P3uykwrUAg4/KbdSlO4x8Y0oZekuMvA0wECeeIsW6nBX/GLqql/R+MrycZ4s3CzNoILTJJm4VGq
 aqUNQtFjSZkEGtycfu9T0VqpOY1quTm3MSUX/d9t7UBo0mj5pjjRuYFEc0K/+Auqy76BT2ros/w
 1z93nTbelAT8enQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=a/I9NESF c=1 sm=1 tr=0 ts=69a9f9b3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=3EgDlKgDbQZu3HAsDPoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 1vG1wDDhUPF9ViWEY-dSPWQtuMzccHA4
X-Proofpoint-ORIG-GUID: 1vG1wDDhUPF9ViWEY-dSPWQtuMzccHA4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4NSBTYWx0ZWRfXxBA0hlDXggWh
 eH9N1ZRJak28JSUXMmdGVgl+DtPsRnepEYDRxao4YCiMz2UgHwxjeqOdkxHmQQTS4VvwGSgIjB0
 FdlqreNOyy6IGjZ952G/gtnZS+XXlnmfZS8DBadlA+M/vr83LPNLGRkR+CWGvvcokMOtn+W+a1t
 ASdmkHWWMYN2qPBg6RB8PitAtJUR2pRkSxsZdBvpfb9C9HTsOxtRrDums7xY4dJ+E4n+dgzv7GZ
 ILqkbVzH6vyZTHqYGxaOFTN+5pmYVeX2zQqWeXVi0EK0zzMWnI6qgsPq9TAKn7hvsczRLeegm91
 FREYORsphdnezrVgsfPONEr47GCXKgJZNnnIC84CpeElG//4z/QLgpj4/Ll39+HD5f858ZTamd1
 BMuPxPD5CsZ9ZWjLFNx0OFFMwe74kXvx0w3v5DFve2YBrSx4FQ9H+DiL2m87e+UZ31tKbhkodIM
 uUNBGa4djZ6hbVSJBuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_134628_705916_85B480F8 
X-CRM114-Status: GOOD (  19.17  )
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

Simplify the driver probe function by using
devm_alloc_ordered_workqueue() which handles the cleanup already.

Change is not equivalent in the workqueue itself: use non-legacy API
which does not set (__WQ_LEGACY | WQ_MEM_RECLAIM).  The workqueue is
used to update power supply data (power_supply_changed()) status, thus
there is no point to run it for memory reclaim.  Note that dev_name() is
not directly used in second argument to prevent possible unlikely
parsing any "%" character in device name as format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Use devm_alloc_ordered_workqueue(), mention this in commit msg
---
 drivers/power/supply/mt6370-charger.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/power/supply/mt6370-charger.c b/drivers/power/supply/mt6370-charger.c
index e6db961d5818..916556baa854 100644
--- a/drivers/power/supply/mt6370-charger.c
+++ b/drivers/power/supply/mt6370-charger.c
@@ -761,13 +761,6 @@ static int mt6370_chg_init_psy(struct mt6370_priv *priv)
 	return PTR_ERR_OR_ZERO(priv->psy);
 }
 
-static void mt6370_chg_destroy_wq(void *data)
-{
-	struct workqueue_struct *wq = data;
-
-	destroy_workqueue(wq);
-}
-
 static irqreturn_t mt6370_attach_i_handler(int irq, void *data)
 {
 	struct mt6370_priv *priv = data;
@@ -893,14 +886,10 @@ static int mt6370_chg_probe(struct platform_device *pdev)
 
 	priv->attach = MT6370_ATTACH_STAT_DETACH;
 
-	priv->wq = create_singlethread_workqueue(dev_name(priv->dev));
+	priv->wq = devm_alloc_ordered_workqueue(dev, "%s", 0, dev_name(priv->dev));
 	if (!priv->wq)
 		return -ENOMEM;
 
-	ret = devm_add_action_or_reset(dev, mt6370_chg_destroy_wq, priv->wq);
-	if (ret)
-		return ret;
-
 	ret = devm_work_autocancel(dev, &priv->bc12_work, mt6370_chg_bc12_work_func);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to init bc12 work\n");

-- 
2.51.0


