Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C594E98DEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 07:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8/2gvQaG0Yq+hSJC2X5/y/AH/3zpoF7o7r8roBAJXE=; b=eF0ZYwcdf9ghWOXDI3I/+y0DM8
	6DCu10upHWLNyAvcSDj/gYcu1SvMTNyS/wFmNu+gzvP8Pfnk8WHjQwqbjfaSzK9+p6Ia6lr7tyE3k
	d60mEwGRJs1Ul/fVCER/fxOtMc6+AeW258ObdrqakCZeki62Oh+/sVQvhMhJXoCYwhZw5pHTqD2Ka
	k6XdHw2tyewaxGUSaGk3Mg5DdMS23lONoxfdFOU0AERNASAQgapaZoAnPC4LB/KNQe0siQj/IMj2i
	vtCXtKD3ghF3VyOy0sozW0SEGuumTBq+SsaMo7VWhq0S8WVj8tLyV3MZv7fFcYgmWXoveb2+NKqiR
	F9NdjWYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQMM-0000000HMoM-1uEY;
	Mon, 23 Feb 2026 07:28:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQME-0000000HMew-2JGJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 07:27:55 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MFjpZu2460514
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 07:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J8/2gvQaG0Yq+hSJC2X5/y/AH/3zpoF7o7r8roBAJXE=; b=SpVHZjbmZaC1Z+RT
	50XGF06GAFXw7h4mNNwaUvn09re6nys6p0++c6ufA08lkdSvfVmuzzcSI2D+p7PW
	0kbwQeoXfuQleIRzkZ1jdUEp43XPREr9XwmpZAcri4ihmzWnAWV187icZi+kFlik
	F7Avbuj12qOGhO9n9mNLtGsHKM/Zdoh0sXVWiIXvokaEX+ci3g1Wt/M8lSMV2C1I
	P1nPmHYLdQ5g12mUQjqkr1eB9K9z3c9wGKmFjWVmaDuidGQzMoz/S5R4fCoO8ri8
	5byBZT8kEdPx4TwygRme45jgmViQIh7amKpIi3MqHzxeaTxHeuF1jdpXfxOTLlKU
	5EvOTQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wk3qu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 07:27:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb390a0c4eso949343985a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 23:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771831673; x=1772436473; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8/2gvQaG0Yq+hSJC2X5/y/AH/3zpoF7o7r8roBAJXE=;
        b=Q2SzJl1I/jzG1tZ0HshmcS3vPVZx/OYnUDz9VxGUnHDuErJnQC0ex83KoT1pqHZTK5
         axhcC+zt+P1lfCn+epncnqq9ssy7Pwu75wyWGo5wrUz1t7C8xbFXxJwt20PaXHzNuHNK
         gBJWXAxa23hZSTBq+ZnCW2iN82KY3WJ8t4tJkso32m4oZoFgRegEEdnN6LS/RIZ7ZQP1
         yGIdKY0MD08kdCCTAphWRHicBs0LrNkH6gT2qdjREZVcplekDlVxG+REV2hM4r3FIPP5
         qnUE/ffFg/CZCXVIi35KiddMjo59Z/dGq2z9lvqv6gjpWfqIcP7bjrKasA6ZzSziP1TD
         nr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831673; x=1772436473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J8/2gvQaG0Yq+hSJC2X5/y/AH/3zpoF7o7r8roBAJXE=;
        b=spgUYzJw3zlTrYapu1NyofMshpzY8ksqOORaNAoGAo0+xi1+kGY24tTLdgfniFG/t9
         oc8tpWQsRCT1Sr1efLvO5YZXfoH2yx2Uj1mrNpE44zejcepkuarUdw3nabgRW0IHFUTv
         /1/YVDHlDSUmqX4qqRmH69tIHoz5KtBEaClZKZyC4/+r/9jVtJ/mYGm7dyz1V+U6OFgK
         Q09DMACGOyQmDtZvesAZaltInXdaxdvtbE1GjyxaYYKPh4PmCUPr+aT7ULMr4VQ1my6Q
         kGAiTZGBalL1icBFe1fLHdPp+JX7XCn9MWJdsJabi4jadJKjj5sOXDIxv9+7//nsuLum
         TRCw==
X-Forwarded-Encrypted: i=1; AJvYcCWriHps3t2FadoTuxVabWFRgrt+/cH2NNPp+eAUuXvfdIKkrLjK7pkM3uBMi8HA4Ki6I9O4+O5cjaSp7VUoXtF7@lists.infradead.org
X-Gm-Message-State: AOJu0YxxLvfH4aWN3JnCAQQ27bPM8sFePDj1TXguZUZz/Yes46vBt0Ul
	g0eK44iwxdaamXuXCoJoDft3CV855DlJwpCbV0UVkVU/Q8gkmXIpq1LFFqtQEzV7TnlqrAkIKb7
	gCggkCbi14z0ts6NVqQz1Qs8vJWyUsxklpqbxoG0y2y5kBcWJC3n1Dmq2MLWlrHnZmLVPuQh13K
	aBWg==
X-Gm-Gg: AZuq6aJSkBjg6kDGMRjeJ/u0cGjr1n0vhgBJVfU0Z+sL5R6gb9BVPYUbrGboSEyNKDo
	gkPC7bPbTQLEYIlOjeSfLLI8YjwtALn5IVMyVbYEVDoeNVuVI991h9gw4Zks2QSa+5QzRO1kes0
	5AmnBKjrweQS7mE/0isx+hvVLubdWskwTtFos4IPjqubfIZuv1ZK4f2aSr/Kav1rteOn0rRG5tX
	joAq+Dgd+ryduPy6ZbmiomAGe+2Q9QOrro+tnn31/6edqZExoqnlkH5NkmPOnqvAmOBmdalM8fV
	ZIrk4n/7h9TBtH/ZkpyTH7z2lQE4Y+q/uouJGF0nab1yS1aVHjwglV2dpafNL9AZmzATR1RAIUu
	biuQfsKCEqvCaHbj1VYs/zf2wRCs2qsn4lADAcjiijeUQPg==
X-Received: by 2002:a05:620a:2a16:b0:8cb:44d7:39aa with SMTP id af79cd13be357-8cb8ca887c6mr919031285a.74.1771831673119;
        Sun, 22 Feb 2026 23:27:53 -0800 (PST)
X-Received: by 2002:a05:620a:2a16:b0:8cb:44d7:39aa with SMTP id af79cd13be357-8cb8ca887c6mr919028285a.74.1771831672680;
        Sun, 22 Feb 2026 23:27:52 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm18550286f8f.4.2026.02.22.23.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:27:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 08:27:32 +0100
Subject: [PATCH 4/9] power: supply: mt6370: Simplify with
 devm_create_singlethread_workqueue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-workqueue-devm-v1-4-10b3a6087586@oss.qualcomm.com>
References: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
In-Reply-To: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
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
Cc: driver-core@lists.linux.dev, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1484;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JXjiqG9T78eAGojjEK9/Zi9nDA6gm8rfDk6Pl5Nb7BE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnAFp9FpdXlORK3TYpQCMwkXfvfWNBaac//1X0
 vhPZnV5DAKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZwBaQAKCRDBN2bmhouD
 1zzREACQTNEy+SyS8bNuKjvXbhz5E4jN7BzYOJgWNyNmgpmJ/J0B04PSNn7WhRDzfnj20zlc3no
 4Z7M3WMZLj5DqvNNbRKuKmcYK8fumg/o8XU9WV33VRrFKXZHZ9fTesJOPKo2Ldub65X3GHGkqK7
 DpQ4aC8bK8O++YJp/QxQn1SGyQaJisOtMDOrk6nsOrOmZi3FftfnDF1yDgBmbHSZgSYrXGYFxJx
 LOA8z0QczvhcVAZdmENDdCbXK5OArtY07J0o/Gv3rHQ+2PvZmwswyFz4dsaQ4ckWnsX3VQ2rDTw
 i/gsWSxXY4M6NXKOo6267SGHkuwUwJhyALG8NwGGNncwrbNGuChatk5zV+ia7yiWwoRm4kinVV5
 H5hMs6RMj1luoPCIO7NhYLwgePLg7PEQIyL13bkMLl0ZAtO7InkRRbRBj1Sg4LrruS3gg4QOYFH
 chibkuHJZsfg4m5bL7vjeqDilJ228Ymmh1vH1CBdvvfmHKziimERsZvPLv+dF0BXo5LwFpPrNrn
 gqno1C894RfGiUYOj9LEKWcVleHEfiUd7WIj1WnDhgVnrmuuN6W2NqNSR1fYWKBUnzm57jZK4Ie
 eTOZPwdVIE8s4gcOtEZ2LNfkUjadTTtP4gjawJ6JsI6T9QM50P9nuFwrhox4a3nhNO3DJnk3qc1
 ZnclO3WsVt0zb8g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=699c017a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ztnre8jBXG8j2NFRlM0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA2NCBTYWx0ZWRfX0flwFhofw/bA
 HkD7uwT2YID7kxPD57qTpGZ7FlfbiqD7sFJjjbiqhxU6i05HjnXNvOBzLu6yc9aDwW8fKX+vYXC
 3hWcvkp8AM9BKCLGsQ22TYEgQiKl+5cOqdW3dx8Sv2BWuN3AeH7Dzv0B8RNtSoORshxjiKIGTPQ
 o1ZlCN6+ErEQbZbvi+T7bAt53pS1CO89BPsBYMJZM+WC4+HfjE6jU8XTj8nx9PNdmeYCJqiZYdS
 G6eYPHtq4ZdsDCSLruvhuG6/ase6EK+1BiyCK8rF0OGQvsMRRi/DvF3k/w1gidRuH+WhnjO460q
 QmQ7VP5n+uNCPMDBwbLR0Q33xpG0zLqNBaGdyMPORlfGmP7ivtyZXd1/5YQvnIG1Lf6bh1FtrF2
 l/tCThSZHCFt6fGBJsxdgofUF+k9QhmNDONo1Oppd4XPJ/+UJVQjLXO1q4tjFpXmwR/AUmpiZpW
 RAvQVqkDLcVgI6UrYlg==
X-Proofpoint-ORIG-GUID: 7rEvIrMFaw3oiy_J9NYeUJjXuvnCxjTp
X-Proofpoint-GUID: 7rEvIrMFaw3oiy_J9NYeUJjXuvnCxjTp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_232754_643503_6261FF11 
X-CRM114-Status: GOOD (  15.98  )
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
devm_create_singlethread_workqueue() which handles the cleanup already.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/power/supply/mt6370-charger.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/power/supply/mt6370-charger.c b/drivers/power/supply/mt6370-charger.c
index e6db961d5818..f671fe62876a 100644
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
+	priv->wq = devm_create_singlethread_workqueue(dev, dev_name(priv->dev));
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


