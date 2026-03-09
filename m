Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91602F3C245
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 12:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQgxK+sZo0pv6EN5kq/1WnDmQHdicuSmR6PjheX+D7U=; b=0+Ivqcn8mExJ5BnJnTfocp3jWy
	Sz+FjZi+NiOvG4r46Ke5ZN9+/7TAgLKbE9N5Mn7BmkrIjQQ6nPWzhhBlRJ/cSRIMHyZ3nnxz65iVW
	luIBxJUkAyY5YJ4XdK+kmm6QLyTgq919VKGpI5p1+G6/EP1x4mpqNks7acXBH+SHlZwVfWxLOq4FG
	LG4emoMo++J3gon8M407+emIGwX/hxTpYEcRaQVdXC3jO0nUmHh7XedAz6KGhChTxH/j31eYlH7F2
	w+FezUvuAox7R10DYpVyoH2Dnzxq7c6KN9U8OhbjQbBZQNDJZfgT9ZGoETx8ASMdy1oDbpOBJwYN5
	Raee6bRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZx1-00000007KTI-1bTt;
	Mon, 09 Mar 2026 12:43:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZww-00000007KQF-0kMb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 12:43:07 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629C5aL0526714
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Mar 2026 12:43:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uQgxK+sZo0pv6EN5kq/1WnDmQHdicuSmR6PjheX+D7U=; b=IHv+fPDpkk8TLgUN
	eyuc/FpBmb4kAwPz6oCOD+WpIH1kno9hetM4L7AYmWcEgWH0DpvOXIFCl0H2pKui
	OUok74JIMDw2JzD7d+CASfFLN0seZl5fc1cDSjPpikdaQfWfwsYTgfrjwpNkbare
	UT4ecsRGUy6PJ4xRObqh54ASOeUPS0aydIvdzLqfgPXJyNlgoLS0vwBDPHpnv6jo
	oRdahdg3ppwuqCJgMnaUQm5rQUTiHP+ZkSNJSjEmMMoQPMT45LJ/ymc6cS4IjAbD
	4bbsc03wpy8pOEV8uOWAfHJGbsvu0SBOPPEE4QtUSI/Pwcha9AUvnBnxQ4FnFEi4
	iKL5xg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cswwkg411-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 12:43:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7a25c5a9so936418285a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 05:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773060184; x=1773664984; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uQgxK+sZo0pv6EN5kq/1WnDmQHdicuSmR6PjheX+D7U=;
        b=g48/g5OsdX64RVtHixEAwAymcBe5wllK9RcSvTb0npdBZMe8dqI3bBy9R0KQaKkQ85
         tk0xff/NlwYBDAJExiODwntvatAPF1W81PXPBOd/Of9IvFEid+K0Z9hNbAOwvckaCsD/
         6QQMSSlSWUsrzBbiQQ8giVHMOuRhO+UB5TOQofx/RtNxzTnpT4+7g2hdkLk5x49f1Idh
         Y4PsvDER8wxeR/DOzjR5a4Vtpf9vnWfb00LqbRkFOPYz3nXaqw0GbsyK/r4K6nxiovQ+
         n16kiob1xXFIaosRN9qwzb/JGbObPhPVpmagU5TMlSxxqjHHlHQAL2V7geg1GzSbhTvR
         8ZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773060184; x=1773664984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uQgxK+sZo0pv6EN5kq/1WnDmQHdicuSmR6PjheX+D7U=;
        b=AJRWGqFd34W9WMQgb8H1RnFMgIAU7EhwfA3HuQT2UwrQtd9DaymabZV5TAVGo/8ByR
         XnhZb4Q8duBGQsdGiDnK/z08Gmn6jLa1xPb7cHfe/5U4AJr8m8RG2ZC+Vs7c2/1Rb1IW
         UyNay/8Zl2Uo0/dJHny0YyBs22mOmvowT7Ri4/bgA1G8h1p622D3P2JhVAyOu4M+c0Q9
         VpH6FFsYoD7FndQh6XifZgxtqX5V+G+kFfRnILRKIlijj1E9S16B+4PUgBVOMDgaWVDM
         MTtUwA8Bvbtc24nE9znpUKjpSk6KpixfpXXP2ZZhdv6lIZogR5gpwJPzfrmsKyPiLdd0
         O4bw==
X-Forwarded-Encrypted: i=1; AJvYcCVQ2A2Ydn6FDvnWOYqSoqqTOZkIgURHHJs3tMKxHFvti6MhytEsuCpboY2a43/uhtqmSk+uH1PrdxuU51iOzW9r@lists.infradead.org
X-Gm-Message-State: AOJu0YznXUQQp/r/0IX8N48JvtHVu65GG/tCUFbEegzwjgGJK38TZthK
	fQBpj0zCaViSHt4c+ftfEeDchQXl1CfYm4UhoZqSVfc45vOzS+MMwRUDCVgSeVLnEX2M9rn+Uhv
	RwTTyQMZrdv8fNfksg4/26OfiKmfkwslxhIwQb6leHpY3v9bUYFv6VtFts36NzY7wJAU5Wr99Pa
	V7qA==
X-Gm-Gg: ATEYQzzrVYkOkXaelQLSZOpFGmTi+8XhDICH4Fy4KqRBJFBKQ1dBz8SSLqwkMYudReF
	omfC9NIIWyav9pbzXvIehSE59OaMIAUu7OCnvAYtnILzLpJzDq08J9L+l7cgXTAw5h9OU7xKY3m
	p4+MoxErxx57La+syj26qXyr6DiVXfWdtUmF7UULqRvsWFwaw1F0rUEHhqzYJlJ788BhahoMvSI
	cIyHDr2vawj3ODZi647DV51r/6900ZFUAiIxdXw+mCO03NOViE6WU1nmwfb1/ZG84GSIInhXZu1
	GyZxnHA4huRg8Otcm4L80Wbrs0OV2tNpbyaD3dQOgRwvV8FWWE68zD6qg1JKdQBlLqo0vdHEbhB
	da/pXzIjVKychXAGBGHyrMN+3aiMLuDFr2tHlX6DmgL40XMdI5lcY
X-Received: by 2002:a05:620a:489a:b0:8b2:dcde:b670 with SMTP id af79cd13be357-8cd6d515a4emr1308510585a.70.1773060184219;
        Mon, 09 Mar 2026 05:43:04 -0700 (PDT)
X-Received: by 2002:a05:620a:489a:b0:8b2:dcde:b670 with SMTP id af79cd13be357-8cd6d515a4emr1308505885a.70.1773060183666;
        Mon, 09 Mar 2026 05:43:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:494a:62d9:d95b:cb98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48539e574b5sm107803345e9.8.2026.03.09.05.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:43:03 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 13:42:39 +0100
Subject: [PATCH v2 3/6] gpio: sim: use fwnode-based GPIO hogs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-gpio-hog-fwnode-v2-3-4e61f3dbf06a@oss.qualcomm.com>
References: <20260309-gpio-hog-fwnode-v2-0-4e61f3dbf06a@oss.qualcomm.com>
In-Reply-To: <20260309-gpio-hog-fwnode-v2-0-4e61f3dbf06a@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Frank Rowand <frowand.list@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-doc@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6257;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fRjGaFumkIPM5sHwzMJVqJbOfM3P51uoAqXe0hcwzCE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBprsBJXQFZO+NRl/S5LzA+qQAwFD56PV0C8Dpzo
 Bt9U43MMBGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaa7ASQAKCRAFnS7L/zaE
 w58ED/9w7/bKWzQRUd1R/MISkd+LsKPQNzedK+n4MFp9gHbgr/C18awbRdMU+vwaD5A4XbI8bIR
 /HoOGV+8CxRMHeEr9ML5c2vfnrquThtJnTy5lOruJ0z+q5XzyWRdWDBfoT47GF/SVAmrzOWLSvy
 i0E6mUh/zy23RrXwEWIKq8VHGA9niYBKO1TNFB9Yf2Tmel4vVvxtQMv9ytuAr9hESZ20FtFvEsP
 0IrDctLoWPVb0vwYm3qKAbWnFvwcOorkD3fxl2vNdXFOurMvtoO4EU0Fo7Zsn3Oqqsy7dvy43EZ
 fHrsYt7JALp0KdIf7pHjEemadWvk7Z97rF2oL3ftLjVceM/3hQuKY3KG1E+BPm2Wptf65ROSRP5
 4cwZHZY8lt+Tuq8ZXcREOCN+7VyHE//3zIvEHRuKfqjKm4ObsQQurkdMSpwUv12WQaXPGGzEKBQ
 rg42+gAdjPdoLL9pNS78gLjtLwG09YYCEaqmZqWmmJFR1gq/pgoTm2gunDa5OF6TuFcvuhvN9k4
 oMF26Li6lxowY2aJPsojvOm83X7DzTqZyiMEP5slXT9xRYkHB+UMoRr+2bXdhT2jKSgX3n8tOzf
 5Hwa5UasAbzhTlm+8+w7tQdY+egeF6HQ97o/RPH0qn0y91CLxti2FrboMeUl5B5DOYPhyp9O0VK
 L8bQNwyfQ4k86Xw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=cZ/fb3DM c=1 sm=1 tr=0 ts=69aec059 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=WMYs8r0CEYFgD91zWOgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Jq5O76FpCtHoIuEMSOdAg6f2IP8LbPvm
X-Proofpoint-GUID: Jq5O76FpCtHoIuEMSOdAg6f2IP8LbPvm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExNiBTYWx0ZWRfX280SIrEbDRbE
 P44goxd1v+6lqpDxeCUx7+7hLX027xl2CXWoGgFTENUUO+6h024gcKxgGAr7VeaHQlsZCEX401E
 GZ8eOwCJRi0lIwlQM1aXfE4O2Na3xVjb0H30Hs1C7KUoHuKxGuVqXPyjkATprpQbow25WMszy8Y
 QXzkMMvqkiFtP7lqW9Gp2A9lTIPXXHy2VtcvGVPc9fjpMAWxncPlkqAoeSWTnbtMANxfwKDncpG
 ApJCZKBnFa1qtOyETBCCiOOsHFISsOMfk8tnFx/Q11GPadOnAhe2pPgrmj4h54eCNfURBCW643H
 EkBDH4G9pXkHfZPHoOzh4ew+Iz96mwOypVFeNgbdX8ZDlKWnn5hssNeTiZN7x/5C9iN6oIizIDm
 40gVKhJ1EFA/WBGklQ6MfPIINPQcg1I4bMHhKnl8nf8foIi+c6AtGMOH6JYuivBJsIXkF5GAlHG
 XCNkRwXJ3yhfy7oHJ5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_054306_356081_55D6993C 
X-CRM114-Status: GOOD (  24.91  )
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

Convert gpio-sim to using software nodes for setting up simulated hogs
instead of legacy machine hogs.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-sim.c | 162 +++++++++++++++++-------------------------------
 1 file changed, 56 insertions(+), 106 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 13b87c8e6d0caf62ce311dad409a9b4d3f091caa..51bcbdd91b4b027b7a340971a11cce5280ca1295 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -40,6 +40,7 @@
 
 #define GPIO_SIM_NGPIO_MAX	1024
 #define GPIO_SIM_PROP_MAX	5 /* Max 4 properties + sentinel. */
+#define GPIO_SIM_HOG_PROP_MAX	5
 #define GPIO_SIM_NUM_ATTRS	3 /* value, pull and sentinel */
 
 static DEFINE_IDA(gpio_sim_ida);
@@ -561,8 +562,6 @@ struct gpio_sim_device {
 	 */
 	struct mutex lock;
 
-	struct gpiod_hog *hogs;
-
 	struct list_head bank_list;
 };
 
@@ -774,102 +773,6 @@ static void gpio_sim_set_reserved_ranges(struct gpio_sim_bank *bank,
 	}
 }
 
-static void gpio_sim_remove_hogs(struct gpio_sim_device *dev)
-{
-	struct gpiod_hog *hog;
-
-	if (!dev->hogs)
-		return;
-
-	gpiod_remove_hogs(dev->hogs);
-
-	for (hog = dev->hogs; hog->chip_label; hog++) {
-		kfree(hog->chip_label);
-		kfree(hog->line_name);
-	}
-
-	kfree(dev->hogs);
-	dev->hogs = NULL;
-}
-
-static int gpio_sim_add_hogs(struct gpio_sim_device *dev)
-{
-	unsigned int num_hogs = 0, idx = 0;
-	struct gpio_sim_bank *bank;
-	struct gpio_sim_line *line;
-	struct gpiod_hog *hog;
-
-	list_for_each_entry(bank, &dev->bank_list, siblings) {
-		list_for_each_entry(line, &bank->line_list, siblings) {
-			if (line->offset >= bank->num_lines)
-				continue;
-
-			if (line->hog)
-				num_hogs++;
-		}
-	}
-
-	if (!num_hogs)
-		return 0;
-
-	/* Allocate one more for the sentinel. */
-	dev->hogs = kzalloc_objs(*dev->hogs, num_hogs + 1);
-	if (!dev->hogs)
-		return -ENOMEM;
-
-	list_for_each_entry(bank, &dev->bank_list, siblings) {
-		list_for_each_entry(line, &bank->line_list, siblings) {
-			if (line->offset >= bank->num_lines)
-				continue;
-
-			if (!line->hog)
-				continue;
-
-			hog = &dev->hogs[idx++];
-
-			/*
-			 * We need to make this string manually because at this
-			 * point the device doesn't exist yet and so dev_name()
-			 * is not available.
-			 */
-			if (gpio_sim_bank_has_label(bank))
-				hog->chip_label = kstrdup(bank->label,
-							  GFP_KERNEL);
-			else
-				hog->chip_label = kasprintf(GFP_KERNEL,
-							"gpio-sim.%u:%pfwP",
-							dev->id,
-							bank->swnode);
-			if (!hog->chip_label) {
-				gpio_sim_remove_hogs(dev);
-				return -ENOMEM;
-			}
-
-			/*
-			 * We need to duplicate this because the hog config
-			 * item can be removed at any time (and we can't block
-			 * it) and gpiolib doesn't make a deep copy of the hog
-			 * data.
-			 */
-			if (line->hog->name) {
-				hog->line_name = kstrdup(line->hog->name,
-							 GFP_KERNEL);
-				if (!hog->line_name) {
-					gpio_sim_remove_hogs(dev);
-					return -ENOMEM;
-				}
-			}
-
-			hog->chip_hwnum = line->offset;
-			hog->dflags = line->hog->dir;
-		}
-	}
-
-	gpiod_add_hogs(dev->hogs);
-
-	return 0;
-}
-
 static struct fwnode_handle *
 gpio_sim_make_bank_swnode(struct gpio_sim_bank *bank,
 			  struct fwnode_handle *parent)
@@ -917,12 +820,61 @@ gpio_sim_make_bank_swnode(struct gpio_sim_bank *bank,
 	return fwnode_create_software_node(properties, parent);
 }
 
+static int gpio_sim_bank_add_hogs(struct gpio_sim_bank *bank)
+{
+	struct property_entry properties[GPIO_SIM_HOG_PROP_MAX];
+	struct fwnode_handle *swnode;
+	struct gpio_sim_line *line;
+	struct gpio_sim_hog *hog;
+	unsigned int idx;
+	u32 gpios[2];
+
+	list_for_each_entry(line, &bank->line_list, siblings) {
+		if (!line->hog)
+			continue;
+
+		hog = line->hog;
+
+		gpios[0] = line->offset;
+		gpios[1] = 0;
+
+		memset(properties, 0, sizeof(properties));
+
+		idx = 0;
+		properties[idx++] = PROPERTY_ENTRY_BOOL("gpio-hog");
+		properties[idx++] = PROPERTY_ENTRY_U32_ARRAY("gpios", gpios);
+		properties[idx++] = PROPERTY_ENTRY_STRING("line-name", hog->name);
+
+		switch (hog->dir) {
+		case GPIOD_IN:
+			properties[idx++] = PROPERTY_ENTRY_BOOL("input");
+			break;
+		case GPIOD_OUT_HIGH:
+			properties[idx++] = PROPERTY_ENTRY_BOOL("output-high");
+			break;
+		case GPIOD_OUT_LOW:
+			properties[idx++] = PROPERTY_ENTRY_BOOL("output-low");
+			break;
+		default:
+			/* Would have been validated at configfs store. */
+			WARN(1, "Unexpected hog direction value: %d", hog->dir);
+			return -EINVAL;
+		}
+
+		swnode = fwnode_create_software_node(properties, bank->swnode);
+		if (IS_ERR(swnode))
+			return PTR_ERR(swnode);
+	}
+
+	return 0;
+}
+
 static void gpio_sim_remove_swnode_recursive(struct fwnode_handle *swnode)
 {
 	struct fwnode_handle *child;
 
 	fwnode_for_each_child_node(swnode, child)
-		fwnode_remove_software_node(child);
+		gpio_sim_remove_swnode_recursive(child);
 
 	fwnode_remove_software_node(swnode);
 }
@@ -977,12 +929,12 @@ static int gpio_sim_device_activate(struct gpio_sim_device *dev)
 			gpio_sim_remove_swnode_recursive(swnode);
 			return ret;
 		}
-	}
 
-	ret = gpio_sim_add_hogs(dev);
-	if (ret) {
-		gpio_sim_remove_swnode_recursive(swnode);
-		return ret;
+		ret = gpio_sim_bank_add_hogs(bank);
+		if (ret) {
+			gpio_sim_remove_swnode_recursive(swnode);
+			return ret;
+		}
 	}
 
 	pdevinfo.name = "gpio-sim";
@@ -991,7 +943,6 @@ static int gpio_sim_device_activate(struct gpio_sim_device *dev)
 
 	ret = dev_sync_probe_register(&dev->probe_data, &pdevinfo);
 	if (ret) {
-		gpio_sim_remove_hogs(dev);
 		gpio_sim_remove_swnode_recursive(swnode);
 		return ret;
 	}
@@ -1007,7 +958,6 @@ static void gpio_sim_device_deactivate(struct gpio_sim_device *dev)
 
 	swnode = dev_fwnode(&dev->probe_data.pdev->dev);
 	dev_sync_probe_unregister(&dev->probe_data);
-	gpio_sim_remove_hogs(dev);
 	gpio_sim_remove_swnode_recursive(swnode);
 }
 

-- 
2.47.3


