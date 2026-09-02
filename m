Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36006C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 20:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1oZVnfNKBlFgiLoC1iu2FLkuJ+ivoENKb0cGsDY70+s=; b=fQAPWC8VZXvKvZbLOZXGa2GV3M
	b11lnau1X7Yi9zoG7nW52QLlNeUNi7Wm0L5+4lYd3orRD1Bym4yWaVEwV2ewAcGpdLaNdomZRc+1G
	iv/AkXmVUDdzwVE5vblpOObvHhSzBbm0TM1ZQJ0mJI1GRX8VK16crdS+LNVX7fTQrpIOQXd/7nn8Y
	Zc8UnuESD6bhokHxhwCNIaoI5CwuX1tRPvWNMWzQ6QYFyhWaVg2sY5gLD9kBhoPgnA4+9OwbGzNDQ
	DczezLnSlr+EhkjLEBpWgyOv/umxS84eK6kyuYEmDdl0+hLBIM/0wZ9gk58AaVpl8bKJHkbb/tmY/
	qpioze+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rPT-0000000FrA4-3ie6;
	Wed, 02 Sep 2026 20:18:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rPO-0000000Fr3h-3HeZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 20:18:12 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHCWh1962712
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 20:18:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1oZVnfNKBlF
	giLoC1iu2FLkuJ+ivoENKb0cGsDY70+s=; b=j1mAbS1WwfUQzBqYP4YaGonJ+T4
	V6thqxNqjhIzlgurylVjTlfyJZSSx1MPoTQW+WhdcuCa671cADb5o4lEppbNkINg
	TtkwmDTl/CqQnuLj5+fhseH5ZAKcISvU19C3g+b+wmJossW1jTj4R/jJUU6LlSpT
	DynUEriHFzK7gm5Zf6v535ockse4QpLNoVFuzoMNfEseuW1jQbYOg4w42n6YtYtI
	qulXr/KcFR0lGSJlAv/bSjvIviKn2nbcjixPH+BTYJIjD2IoDPycDXWUY/bZcJhk
	M4Hdd6KE3FnU45yCKveXXDWsxiO+ZgXjOcw5u2VwllK623xZ0443Sk9K3fA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4sru1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 20:18:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfa55c9430so15090395ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 13:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380288; x=1788985088; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1oZVnfNKBlFgiLoC1iu2FLkuJ+ivoENKb0cGsDY70+s=;
        b=P7rUnFtIKuFe0DyvhLLR8cgg+gwPmCIpEeU0jOLyq37gcBZbikajJPX8nfYfqei/c+
         9GWFYvArLFT4RXWuBCgU927/94mNzBLRQdSH2XQNn1C1Gk8b/kCbMCYZccw1H4KyRIwF
         b5x4UWjnQtl8+gLH+yAnRLdh7Utc6KuTlVD5EUDMWPM+RtNpCkJOciKoc9Xn4EO09cFs
         QQqldExiaq6DI5DMH6qOrtJjX4xt6yUKr7pzzZmeWimK8zK0x94IErILpXaf43YGcUYF
         lGQQq173B5QiVrl25r9clGyrdz9reMQKA5um9VWgjQ03MHhCIjBY4Xiybp187xmtr57d
         /d/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380288; x=1788985088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1oZVnfNKBlFgiLoC1iu2FLkuJ+ivoENKb0cGsDY70+s=;
        b=dpgqN2RnPitPNuPSqVCeld6wNSWMYBpl5qQbskMJ2rnR5BSwEeBt63EC/0q9Y0l6uh
         bFC6Au7vEwOndTVZ4S5ZPor7Dx7eMPl7PWVjRg9V61k45qkBI7fw2GwTyntetUXCHsH9
         IGNgAjlgSmUT2XEaVhwjnZ6/tULBqe/I5dKmT8CnT5EXoM7xjY70T8sdk6rz8iyhPlvY
         M1sC3JZ93SiMD79dCdwZyFtX0fe/bDIjxetrqOBc4VJ7bxbAqtKyjkfqJbwgOy0xAizR
         qXN4R9zg1mNrR8A5qqDTvETL4kSAbiEzY/MG2evJnsZrpW1wgUhSb/nXUxwbcs667wru
         0DoQ==
X-Forwarded-Encrypted: i=1; AKwUvBymz48r1rlaRCMvrCER/jvjHJkb/0daAP8YKqjt6GafuhLta+h/bl9bTceQzSc0EirOTAdnLzNqiDko0YBexY3U@lists.infradead.org
X-Gm-Message-State: AFuF++nDu9mb4HGHL6OH+Mi64vFd3P8iSFUzyyQgXxXmvS/Xe8cxKwUa
	eSEYFQjZbVxLWuYjcd7nnPqH9eYV138Nc9ia8CjaWkGrqulUlMmOUPO2PA4ezT8w5oWqFftGJs1
	V5PhvedDHFReeRrUSPg2k+qXLRuCDQQw3RkUyDHmFFNYcnrgDiQm15KxBqAglPCPkEFq5JBC8GJ
	Vp5w==
X-Gm-Gg: AYBFou0QkPAA457QBw3jzx4zezu5VDy3gg7aeVWDlZts1ucPLIY/Y1fJ4izkWMlUvvh
	S4b5mmadCtCH5ccfafvKywN2utJqIwugodp9mbz4LjQJsiBaeicvL419VXOo7s3/lX44AYtMRI+
	oVz5CPAY4ZXL7GehcInHhHLH0uGVnTTkTWdQg9679OF5tTUgn5zkGEIg1+FNv4si4yAlcOVQ6mL
	l1gTMyJIMd81cihPchsE1UQesV5U1i2M0ezvrUq3D9e2U90uq2QJT02HBvMkPF5su9M1GER+VUn
	qdHX58r56UDmrnggTumXdQY90GrshU6sTn+DhVtSLPD3f0o7OlfKYbFbhyMKCvs4MnnUNwRf1Vm
	ohVfe8w8BVCWKJAwU9DzkQkLogBk=
X-Received: by 2002:a17:903:9cc:b0:2da:ef81:37e7 with SMTP id d9443c01a7336-2daef813b09mr84025065ad.21.1788380288461;
        Wed, 02 Sep 2026 13:18:08 -0700 (PDT)
X-Received: by 2002:a17:903:9cc:b0:2da:ef81:37e7 with SMTP id d9443c01a7336-2daef813b09mr84024465ad.21.1788380287974;
        Wed, 02 Sep 2026 13:18:07 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:18:07 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v2 9/11] drm: xlnx: zynqmp_dpsub: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:38 +0530
Message-ID: <20260902201640.2024648-10-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX9RW2UY/nImfn
 3Z6ukhVd0TecgIJytxtPdWanXPj39FUDUkDTT1Ohzc8tQHQnt3bku0sFbtxE8FtPs80TE57BAl1
 iEIOZvA/5Ym6hitnwKo1VCOXZrTAvedetT7Nf/pCmlhEvxEKWgd9GBzZAuSLtrJLdhmz62A/EhX
 ka0BwQHoT9UTve9A+tJJqeEDkbroG4QOTdLdLJszJPCf6z2OP4YWQdC19Z14B0vX1sV5suDyAvM
 q1c78NXisy5hjuC3I8YtUqjPsA3IOvL1ICxzuJukRhlDORAgJiSlkwyy1ZbJZd0VAuogTicMr9R
 ox+OS8AGbCREstoiqYKIx1/5SCkgHSLKJd2ziA0EEjb51tkD3dCeTgk277Z54gkdVTUtWh/qoqf
 0xXlNug06IuLM1iHap8o05Ne7Jn/5dItaxycqc1btClOGy+idbmmly9FYtAMEsn4ONhDdFGhIzU
 2gdmeULg0PmBxf6oAXg==
X-Proofpoint-ORIG-GUID: wXlBNl9y90Tkq3kenuAp5LBe6Co-mVTn
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a988481 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=zd2uoN0lAAAA:8
 a=EUspDBNiAAAA:8 a=QbF1duAvIEq2M5YqX_oA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: wXlBNl9y90Tkq3kenuAp5LBe6Co-mVTn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX037t7sAMEMmR
 IEEz55u1L5KYbQ4Nwz/1IZUREq7R8ZUkqRjpSx3xpM/uoWEfSoYA3i/ufaAzNAFAsbF2FavzKRg
 vetiG2re4LlhnWM9p31UPXEp0sXKm5I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_131811_027836_AA92BDE0 
X-CRM114-Status: GOOD (  16.52  )
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

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index 53ab1a2a5aaf..e93a7a299b52 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -203,7 +203,7 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
 	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 
 	/* Try the reserved memory. Proceed if there's none. */
-	of_reserved_mem_device_init(&pdev->dev);
+	devm_of_reserved_mem_device_init(&pdev->dev);
 
 	ret = zynqmp_dpsub_init_clocks(dpsub);
 	if (ret < 0)
@@ -255,7 +255,6 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	clk_disable_unprepare(dpsub->apb_clk);
 err_mem:
-	of_reserved_mem_device_release(&pdev->dev);
 	if (!dpsub->drm)
 		zynqmp_dpsub_release(dpsub);
 	return ret;
@@ -276,7 +275,6 @@ static void zynqmp_dpsub_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	clk_disable_unprepare(dpsub->apb_clk);
-	of_reserved_mem_device_release(&pdev->dev);
 
 	if (!dpsub->drm)
 		zynqmp_dpsub_release(dpsub);
-- 
2.55.0


