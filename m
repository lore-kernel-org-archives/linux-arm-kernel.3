Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019E4C44500
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 19:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03p+FFlmwi45suRC+aZpApiuhNt9KA4gObs4WxBM+z8=; b=tLqSJjUWI+5PK1vqvtkJj7x+uC
	c+7W4Hul3RB/aM6UWisfa3tJFjq2jlVxBNjTci2jdo67/WwBK3yP3Vc9EiyUoFuSL05DZ7D/Eyouy
	LA8pDA4aett48v9dfcPBlHB1TpuRWyWnqDToI5X6zbG338buZJXCvtAle407uENdfQtWVtWIgXwEX
	chARFrTBn+pr7Gsbs/LeMOkEyElek93MDJ93eJCM2MYIP0mdK/4F4Sz/JUjf4YVDGydrecI3yT1dO
	qFl6wxhBA2uCmLlVmPCarCltrUBpE32CO8/fYZbTAFCECs7CK2PUkxx4jVu/fziNtNGhoPybZWzAn
	nWjjCynQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgShg-00000009dTI-42rn;
	Sun, 05 Jul 2026 19:40:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgShc-00000009dSI-3JJk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 19:40:35 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HiYVa2169693
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 19:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=03p+FFlmwi4
	5suRC+aZpApiuhNt9KA4gObs4WxBM+z8=; b=EDqYFdv4Pmeqy9IR99dcNiLiDAT
	/yuTE7Ljg9Hev+D7GIua619X8FUaXVlexko06UWo2I1UG1HwTHa/3pcOiO1FNKdk
	YiY1UO4+AP6rm2LO5F78feakLwRgePs5DdWtrzsXwhYCgTfecFqPFRL/MQqcfyO9
	pb9r2UQAkfcA5gru+dfTHa2mdfv7340zDAANejxt7cH1lKuJqEenlOMOzxtkjth3
	hBP3jcZzSc9vRDjWjL0r4gMT/svWmjZh1dvVGSJdpYFTDJ+ZtuRTINMxgHG6Wmig
	3zizUVw2wRtMv7D6VUvWZqVy2hRD9jXlwyfLqvXinpJSMddoU1sfRGdzOYQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6tj8k8rm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 19:40:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so1236033a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 12:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280430; x=1783885230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03p+FFlmwi45suRC+aZpApiuhNt9KA4gObs4WxBM+z8=;
        b=i74Kh40Odq2Lgt7wQqlD/nlLK/0QuZtpHaMm8PmZy+AdyXtDHL0r77JrlEfPLzA9Pa
         SSfnJab0Uepc3/ZXLl1HQzeCg1PfW6eoOnKYqyFYOGQA1nsuKKH+BQOScyv0xLZPkcqc
         +lBXeEp/FS3/J4qemiWOflektwnP3eyVX2rQUnoAyco0NzFt4Pwu+coM80XoEPQWrvBr
         1KzovXod/KDHWnVmCRJyiQeNlhOfL5S+x+CApkWjY1luby6HjC/ZO6NGTpKkN9SpH48n
         r3pPmueg+7mrrI5Pl9t5vQceH0LazR4jDWUONVkJZpX5TaINT3MBPjmDWoT8CghcJFAC
         1Pbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280430; x=1783885230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=03p+FFlmwi45suRC+aZpApiuhNt9KA4gObs4WxBM+z8=;
        b=TBYYFW0TGfCBYkVoUm6jfHC9CwG07WtLpdd31B1LPCDsdPGy8EzChYsCPmmRhjbaAI
         i0sS67jYlga6jkmmNOjBqlk03cQfvxfAprdF0O6GX4enoX86HGh07oSmLUtDeI92KPXO
         8pgjTPVVOTA21Ew+gdPKSNHNZvkNP6vs5p6EA5h5LA05key9lrx384YZm54rY94g7kAE
         M+EHm0L6QBOT0EIfaqa0gh6Pym4yU7WhStmf8vhPCf8tEwFynSuw6XYc9/U+ZshIChqA
         bhL/tt5YtlHgMC4O8LBfCvsypZNQD+Ur6fr1sqBzYvNneIquKy0ZUi1IiBicFkFNfT7V
         CyTA==
X-Forwarded-Encrypted: i=1; AHgh+RqcOkfmk6hN4ZIWoZ6b4rHa/2RJdD/dWy4k87+Z+ImBDI9eQtHI5fYeoFlzsU+4n87GFHh3X/BR2GRAXh0D3kP7@lists.infradead.org
X-Gm-Message-State: AOJu0YxvFnugNrJgJ5s2oEz/WbnULjUQPvXDt5+9gykjuggC+Cgt1XHp
	axviM5c/8uGob6UIS7b4IL0s9puYo0OyWE5FSiiYDDNmnFIJZ6U+21ocu0hVtIp3Sg3glZZ7PIO
	mZZCYSC6tH1YokzvbJcng/eJry1+SBL+lVNkAhhXHbscEFq1x4itl0TdtrvQOi6R1jv6XUsPPAP
	B1WA==
X-Gm-Gg: AfdE7cns/Q6UizYzyMDO+b1EqL6DYpZkVHDEUUIeFu9bY/yO49nUYQCd3wHq4BYjURe
	VmbSdGMiisL4IAxzWFE8pZJXQRHCLhdS0riiBv89jAIHMuCIZM7eSFWYMg/jF8tj27Hg4FDX1cq
	Ee7FGJEMnpi5zwqWfeMT8tMuj7LgYnvPBqtWhIMrOxN19GdRvmXc8Es59hAAe0SWat4IMJTX6rB
	OwtrSzno2pmsVZM5FJ46Pccw3ldNscM3RWvTLnZU3Pm+rD2DuOltcMsfE4m+NE6KUxkyoGq1VQ4
	o/i6Ya1cUWPoRBP3T2N+q0O3k7QA+S1+muhU40+9yqbMa06+bvKBTEIhSC5zi1l9807UlRADfer
	5Wald0A9QfWcIvree4C3sQ5gQTvKLEfb997vDLg==
X-Received: by 2002:a05:6a20:a122:b0:3bf:9944:a8d8 with SMTP id adf61e73a8af0-3c03e3ed638mr7693668637.34.1783280430276;
        Sun, 05 Jul 2026 12:40:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:a122:b0:3bf:9944:a8d8 with SMTP id adf61e73a8af0-3c03e3ed638mr7693658637.34.1783280429779;
        Sun, 05 Jul 2026 12:40:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:29 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 33/42] drm: arcpgu: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:09 +0530
Message-ID: <20260705194019.2565498-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX8c1CdG4PrN94
 hSP/w+S6BiuNpejmH9iiI8FfWri1zdROMj0jwJUntWF6k9div0bPJvQCyfvZ5fFRh3XDul0aaLU
 z6FLgnAg2IsZw5yHnv+I6wGfKFh196d5m8xTzhUTb3RBgJ97qF2O9nu7szLGeRWhSG9yVAk1GuT
 UPwEibiUucnWH6mhMHRD5x0lwAsWowBCmqtyQqjtKMIJm4EBPS6JF7umAvBQQiop1SWFsU5VBbZ
 v6+BaKK5uuJJoi8RfJvRI/LAmJg0x5xcfdKBzXCcuyTczBRH0qIrY50i4x90i/kE+8Qr9+oJnHR
 4Jdoct3y6AKQZtz3ajC86Lr+eQSXjMm1RuaehcdexdU/xfS1W/gmWJpYUpGB3KBt3/YShRef9HX
 2C6LIDt2HyE6jDXrZMZIv+BtvIl0Gk4o7z9iGZMA7qxwlygZ5fd5Y5e/t/xhSG/dt2QK2qKw9t9
 IxXxBDzf2Z9yQWCm4Xg==
X-Proofpoint-ORIG-GUID: 6XsC3Lvb_sKGbYiSmY5g2kQB7CchksZ3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX49FMacKkna3v
 jr+1l4SO5VvbB2nk+HZL4kOwxHiJwa+SXixz29bl2sqMtXWrV4Iim/Doq9gGd+xqgFpfDw84rhv
 455ptpjkbcoS5Q0h4DBlfrvaGo4PFIQ=
X-Proofpoint-GUID: 6XsC3Lvb_sKGbYiSmY5g2kQB7CchksZ3
X-Authority-Analysis: v=2.4 cv=H6TrBeYi c=1 sm=1 tr=0 ts=6a4ab32f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=lEtn7xO9CsvGDZioIccA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607050212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_124032_949119_DA86FC24 
X-CRM114-Status: GOOD (  13.98  )
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

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the optional reserved memory region is released on device removal,
fixing a missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/tiny/arcpgu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index c93d61ac0bb7..fa01407570a8 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -278,7 +278,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 		 arc_pgu_read(arcpgu, ARCPGU_REG_ID));
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(drm->dev);
+	ret = devm_of_reserved_mem_device_init(drm->dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
-- 
2.53.0


