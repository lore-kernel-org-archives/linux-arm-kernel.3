Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531DBC44524
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 09:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LRiqxWscnzoXzK5RzWgNrb1z34B4tTlhuTiV6c1388Y=; b=S6t1PETEGHelE5qg/QAXfNP/pk
	GGO3iI1cUTcGTXWvEtQOVgE5Hh4MWeVOatuVGZBIlP8zZjCeyMC/CWIcreVWpoubcnGYF9b2Otrjv
	JHHIXUcTk0qpBoRb9fJONfTiI2/JQYWFdw2h7oPCf7sGJfahLQchxHAGwmMBH9j6CoD8VB/R9OOnc
	e2hDI0Ir6+uSK/4F8adNKQCCiER2FQ5l/wbDZ1w6vRoP9SE9XbjZ6uYr2yym3N1YpIo8ybBzWsU+Y
	8JIVXxueC1oyatto0ApLQIoXqPc9k9+zz42gLz2l3jMJUiSzLbF9pG337Kq7KTuUYwoirG9CVzLoj
	JgNcHSBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkG9-00000006IvE-3ZQN;
	Mon, 20 Jul 2026 09:26:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkG2-00000006IqD-3Ect
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 09:25:55 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K7rk182980062
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 09:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LRiqxWscnzoXzK5RzWgNrb1z34B4tTlhuTiV6c1388Y=; b=hQU8ohY7JoqMaw2o
	gJQ8ERonvZCbG53rd6f9Hj6Cy0YgpXa0kbaTI5/QqqOon0C02V4LNJ2+EsdouW+d
	TTdw5/a4an0Mxixvb4u7sUgDtxyyaoLg4OGI+V4czR5cPkZVb0VZK2oZ8NKRrKYN
	HaV/bbPfTsJmJJOWjOy0oW6uywW1yCdiBV3uKsuJMdUsS5/OwiAbrrLMkLjl8pCw
	6PkjRX/plQV5ge+glDz88N4CyiChe2nKkBfMigG7FqSutZKY+CKqclYBBWtNiH3n
	aIzeYqIjbaH+v1wG+u5THy8VWCAsa18Pi8ZjeTQ4HFBwVptu8nrxT1cEE4jW/2xB
	ba8Jjw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfpg0erm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 09:25:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51ebdfceddcso108142261cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 02:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784539553; x=1785144353; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LRiqxWscnzoXzK5RzWgNrb1z34B4tTlhuTiV6c1388Y=;
        b=fKb9PG8DE3ViZCY1uEAeS6V8kCStrs+29DRTH1X8K71H3Se5k/5D9MmQfhc5GozBNf
         4Z9SB4u3CD5pQnN5IXuvPQEO28f8/aSzofDXCNd0Xqlct7WC0nEC1l2iowckifd/Ljqd
         WF3HqrR+cerTdWh02tU/XI3qG30yE0PQNsJ2FKgbfHQv9H3fad3JyJkdEhCovm2nEcDz
         KLw694u2XvZfJssH3rgWWYfpwPsjN9F1jUyLy9rFkmKQC4VBieb3DjtcMFUCcxvPLxFh
         qnlWBjipwmLtuM98bZSBo4IMbHOl9vKmf18+/NGtDwy3t16qmVgSUN3OY9Ez7810cKJo
         +2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784539553; x=1785144353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRiqxWscnzoXzK5RzWgNrb1z34B4tTlhuTiV6c1388Y=;
        b=brEk5/9KiSJ4Jr9MzQxRhpA2qIP7yCxQfnMGmo5fFRQQoFcCV03skdfcdaYbApJ2ob
         2/EQznwm555ST303W1un5Tj6wh7a8uIsBR79Rf+LnqoNT8fk/UhOHlMdxvYEVfxNDa7u
         05JbBVGMxKK+S9TKPFxgz7ld3vxNWa6RVqOpNHqaf1JFMwWScdOfqtUWDfoHSU72aR6p
         +E+h/n1SKCmuqQFQkNOgxQor9N5huecTf4WEmyA2NHAzDeT+R3y1zrl5tKJT2Wfms5Wv
         8bCVvM9l9gVifStb0eIgm47DX/NbQC6+A5jdQMD0G+knw5lXHQm1GeNPkWH/8IarmqbW
         iM4g==
X-Forwarded-Encrypted: i=1; AHgh+RqYKx59bJvZBQqghtamJhbB7uMPny4eoJ8BnP+2cEO3t71MYIcXWzCDMOTdAI+dqfROZD10wEuYh4WWvpI+tF2N@lists.infradead.org
X-Gm-Message-State: AOJu0YwvSe0qhex49qwi77BjZ0N1ygzokYA+m8BxR5QRGBHhbH99/Ltj
	UsU9yghawsxKS6+DZOd8Q3d4a4h8/1w4W3ffyaf+wbRZBIJ6pbOILXSV4qb5++TffXFPbJgOrck
	LKp2t+xa6qEud/NHQIj0BZ8jUT489Q5UASjshi9acdBoba+94gnCKnUAOv1UfzeM+Vdq7U0ziqv
	vkTg==
X-Gm-Gg: AfdE7cmI/QFC0fhnR4jFhS1bFHNDiIustAtPz8EJWwrZGf9BCs1G3osl73rs+gSDfp6
	JqlSVHGdKOv8VKHSA2E6FI87uE74kHT8ZUtSKziEQCVGx8vzCAhzDjm6DXySzBOPes+eSqNM9+p
	jBSUh0Xd8tSp9zmwI+WWrMDdHPutrVGBgsyEei3rKtrtaoeXxBB62bKT2LcgDrlZULj4BuWX7/i
	8PzXdnGgFxeJYDYMvVpnDahhlt/kNOt5fPzzNjzH7TEbAg1aYuXYgXxah4Af1m9tqf1Xv9jjvpe
	KXXyUJ7WxFhkDbR8yqWISsVWsLStZOoaddRxAyvSYBvO7DFFK0iOQ+r34JdaPcU71t8kUGqA/ln
	TVmuQ2+EtnsF5lJ7c3Uj9MqUQ/smfaQ==
X-Received: by 2002:ac8:7f83:0:b0:516:e062:1a83 with SMTP id d75a77b69052e-5213daa20eemr117920751cf.51.1784539553326;
        Mon, 20 Jul 2026 02:25:53 -0700 (PDT)
X-Received: by 2002:ac8:7f83:0:b0:516:e062:1a83 with SMTP id d75a77b69052e-5213daa20eemr117920471cf.51.1784539552960;
        Mon, 20 Jul 2026 02:25:52 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:65fa:60cb:c205:d511])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4955de88951sm62228205e9.3.2026.07.20.02.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 02:25:52 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 11:24:55 +0200
Subject: [PATCH 8/8] slimbus: qcom-ngd-ctrl: use
 platform_device_set_fwnode()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-pdev-set-fwnode-instead-of-of-node-v1-8-2dee93f42c54@oss.qualcomm.com>
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
In-Reply-To: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Ulf Hansson <ulfh@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Lee Jones <lee@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: brgl@kernel.org, driver-core@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, iommu@lists.linux.dev,
        netdev@vger.kernel.org, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=900;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5dZucFiY5F1RZ51PQHBmBTY1Q9tlwcM2jWxPuS3OYck=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqXemASNLxq4W2lq91kA9NcZIXQVZtNYnprewvw
 3yHlCsy3VqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal3pgAAKCRAFnS7L/zaE
 w2uCD/wOU3cBVw4EUJf0UYoXTg1HPMi8P/ZsqqsWmYAwjo7fxHcTqJbrn0eiqRL4DGI4WMyvG60
 V+0SsJlynCdNE7f5EUlwizOq84HOSgkOFhWcy1qO9QHvA5ZUn3pD4p5P/apWnvlfSjMrCgfW6Cv
 j3f/kuCfwhE3zvoQiwbJKsw3Z5I4ZvzyAAKpuw1L2UnIz0c4PF3F3aM8KSrOJAkVj5uvCqWv1ec
 B/AYzpNDdlNiIKEr5nlz5onmZgVYEc488RYdR8D6I/WNggYPzyNFLoESaH43Vxxig+CyAwrsjzZ
 o8d6pZtIyZAaJbH+7hGLtVAdr8JNHyKtv2MeIkWDsOK5t4odmeepq+uGt4Z+wLL5txrMInQNa9i
 CpwMS1b5MsZ2Zzub7p1c+hjtTrFLAtSCsLnDpuZeM0kspndYPXH+9aJ1ikuDaIY8rYYY45PmfVl
 5IPBo0aXvFJ1cF+N5N/gFPL8eHrOSWBGQ4E+1GkdbYVljaIC1z2a0evNxWVYWUlYGAIygMAktf6
 EdLDOWEg9v5RX8qWkht3mSA1zTTRpZyQ2jiUBxOl5UDbZBOGIvc4w71t3cYV6WAk3qn92NyUB+W
 zTJ+U4R83omht6v8g6JVuiBdRHrh1ZIIR1GZDI77FyHqG14uso7dcBQnQYs2bVz/YkOSo5imubp
 GZ+Ni2cPpMJ3VIw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEwNCBTYWx0ZWRfX8FYcfriRSVNJ
 GYDH/us/ynOHE3PuV73cVuYNeTZ7q1CMqyWNnsyUXDTv07ZubuFQ05m5KWvCWSM1n2Nk1keYVhd
 Wh8InnZBb2g24V0FyDj1QZ1RZ4TzS+M=
X-Proofpoint-GUID: V2LPHnrDg2rxH-lBCKAnh4jHO-Q_Bmcs
X-Proofpoint-ORIG-GUID: V2LPHnrDg2rxH-lBCKAnh4jHO-Q_Bmcs
X-Authority-Analysis: v=2.4 cv=c+6bhx9l c=1 sm=1 tr=0 ts=6a5de9a2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Dy7njVIJoQnLZkscNskA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEwNCBTYWx0ZWRfX3hBo/XJgDMgh
 x/wOVMWiSahqglzz0KGpdWGtbEP10sGRetJHpq2t3JWsJ7DRJW1VwHqiSs6D350XR+R+T++bula
 oDJguPnU/a4fAe8Jmq05qduokYRQcMrrnm2Zp5lKn823IVgDynoaTMn656Q2jSIJwSO/VOCaLdn
 xRm8qHPMseh4otgbFHDnQDadgxeEhmQ6v7J/9ReEJu7Kn2Abzj00P6a5jyI+dAR+6CsR/HHsvgT
 sT0qVctO43hHzbRF3eZlhxGqVN84+kkL0AORYGYQNHXQFR8T5u2NPP3yrhkOHf2mwj1XtsmrAq7
 Dq1tkUDS55x/I5jfOKiQ9scQ98Ht65iwOsJZdXKpghzJk81aew15cIZX+9JLvDrwqXEQ/1rXxo8
 gw5JH/lC3TxPE+3Y7XlXrj4SBD0/xE1Lv2vB7aqn9AB5z3o41SV7o6DAcRbETcwcGUDtpEKqwt/
 Zs6Z9quobl2qPdaaRGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_022554_833818_FE2C3641 
X-CRM114-Status: GOOD (  14.88  )
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

Prefer the higher-level platform_device_set_fwnode() over the
OF-specific platform_device_set_of_node() for dynamically allocated
platform devices.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 934c44c5bc1a92fae98f52bccd12ed849379dca8..bf077f47c9ddd484c11f98b47d2d8d4daf78dcb7 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1538,7 +1538,7 @@ static int of_qcom_slim_ngd_register(struct device *parent,
 			kfree(ngd);
 			return ret;
 		}
-		platform_device_set_of_node(ngd->pdev, node);
+		platform_device_set_fwnode(ngd->pdev, of_fwnode_handle(node));
 		ctrl->ngd = ngd;
 
 		ret = platform_device_add(ngd->pdev);

-- 
2.47.3


